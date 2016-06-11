#include "grid_localizer.h"
#include <iostream>

using namespace std;

void LocalizerMap::load(const char* filename) {
  _map=cv::imread(filename);
}


void LocalizerMap::showBelief() {
  cv::Mat belief_image(_map.rows, _map.cols, CV_32FC1);
  belief_image = 1.0f;
  for (size_t s = 0; s<_b.size(); s++) {
    std::pair<int, int> s_cell = _index_to_cell[s];
    belief_image.at<float>(s_cell.first, s_cell.second) = 1.0f-_b[s];
  }
 
  cv::Mat belief_image2;
  cv::resize(belief_image, belief_image2, cv::Size(), 10, 10, cv::INTER_NEAREST);
  cv::imshow("belief", belief_image2);
}


void LocalizerMap::init() {
  _cell_to_index = cv::Mat(_map.rows, _map.cols, CV_16UC1);
  int k = 0;
  for (int r = 0; r<_map.rows; r++)
    for (int c = 0; c<_map.cols; c++) {
      cv::Vec3b& v = _map.at<cv::Vec3b>(r,c);
      if (v[0]==255){
	_cell_to_index.at<short>(r,c) = k;
	_index_to_cell.push_back(std::make_pair(r,c));
	k++;
      } else {
	v=cv::Vec3b(0,0,0);
	_cell_to_index.at<short>(r,c) = -1;
      }
    }
  _b.resize(k);
  
  float uniform_value   = 1./_b.size();
  std::fill(_b.begin(), _b.end(), uniform_value);
}

float LocalizerMap::transitionModel(int from, int to, Action action) {
  std::pair<int, int> from_cell = _index_to_cell[from];
  
  std::pair<int, int> to_cell = _index_to_cell[to];

  int dr = to_cell.first - from_cell.first ;
  int dc = to_cell.second - from_cell.second;
  if (fabs(dr)>1 || fabs(dc)>1)
    return 0;

  // compute the leading cell, based on the current state and the action
  int r = from_cell.first;
  int c = from_cell.second;
  
  switch (action) {
  case Up: r--; break;
  case Down: r++; break;
  case Left: c--; break;
  case Right: c++; break;
  }
  
  // if the leading cell is invalid, we stay in the same state
  bool invalid_motion = false;
  if (r<0 || r>_map.rows-1 || c<0 || c>_map.rows-1)
    invalid_motion = true;

  cv::Vec3b v = _map.at<cv::Vec3b>(r,c);
   if (v[0]!=255)
     invalid_motion=true;;
 
  if (invalid_motion){
    if (dr==0 && dc==0)
      return 1;
    return 0;
  }


  // otherwise we compute the transition
  switch (action) {
  case Up: 
    if (dr==-1 && dc == 0) return 0.8;
    if (dr==-1 && dc == 1) return 0.1;
    if (dr==-1 && dc == -1) return 0.1;
    return 0;

  case Down: 
    if (dr==1 && dc == 0) return 0.8;
    if (dr==1 && dc == 1) return 0.1;
    if (dr==1 && dc == -1) return 0.1;
    return 0;


  case Left: 
    if (dr==0  && dc == -1) return 0.8;
    if (dr==1  && dc == -1) return 0.1;
    if (dr==-1 && dc == -1) return 0.1;
    return 0;


  case Right: 
    if (dr==0  && dc == 1) return 0.8;
    if (dr==1  && dc == 1) return 0.1;
    if (dr==-1 && dc == 1) return 0.1;
    return 0;

  }
}


float LocalizerMap::observationModel(int state, Observation z) {
  std::pair<int, int> state_cell = _index_to_cell[state];
  int r = state_cell.first;
  int c = state_cell.second;

  bool up_occupied= true;
  if (r>0) {
    cv::Vec3b v = _map.at<cv::Vec3b>(r-1,c);
    if (v[0]==255)
      up_occupied = false;
  }

  bool down_occupied= true;
  if (r<_map.rows-1) {
    cv::Vec3b v = _map.at<cv::Vec3b>(r+1,c);
    if (v[0]==255)
      down_occupied = false;
  }


  bool left_occupied= true;
  if (c>0) {
    cv::Vec3b v = _map.at<cv::Vec3b>(r,c-1);
    if (v[0]==255)
      left_occupied = false;
  }



  bool right_occupied= true;
  if (c<_map.cols-1) {
    cv::Vec3b v = _map.at<cv::Vec3b>(r,c+1);
    if (v[0]==255)
      right_occupied = false;
  }

  float cumulative_prob = 1;
  if (up_occupied == (bool)(z & 0x01))
    cumulative_prob *= .8;
  else
    cumulative_prob *= .2;
    

  if (down_occupied == (bool) (z & 0x02))
    cumulative_prob *= .8;
  else
    cumulative_prob *= .2;

  if (left_occupied == (bool) (z & 0x04))
    cumulative_prob *= .8;
  else
    cumulative_prob *= .2;

  if (right_occupied == (bool) (z & 0x08))
    cumulative_prob *= .8;
  else
    cumulative_prob *= .2;
  
  return cumulative_prob;
  
}


void LocalizerMap::predict(Action action) {
  Belief _b2(_b.size());
  std::fill(_b2.begin(), _b2.end(), 0);
  for (size_t from = 0; from<_b.size(); from++) {
    if (_b[from] == 0)
      continue;

    for (size_t to = 0; to<_b.size(); to++) {
      _b2[to] += _b[from] * transitionModel(from, to, action);
    }
  }
  _b = _b2;
}

void LocalizerMap::update(Observation z) {
  double normalizer = 0;
  for (size_t x = 0; x<_b.size(); x++) {
    _b[x] *= observationModel(x, z);
    normalizer += _b[x];
  }
  normalizer = 1./normalizer;
  for (size_t x = 0; x<_b.size(); x++) {
    _b[x] *= normalizer;
  }
  
}


int LocalizerMap::sampleNextState(int from, Action a) {
  float cumval = 0;
  float v = drand48();
  for (size_t i = 0; i<_b.size(); i++) {
    cumval+=transitionModel(from, i, a);
    if (cumval>v) {
      return i;
    }
  }
  return from;
}

Observation LocalizerMap::sampleObservation(int x) {
  float cumval = 0;
  float v = drand48();
  for (int z=0;z<16; z++){
    cumval+=observationModel(x,z);
    if (cumval>v)
      return z;
  }
  return 0;
}
