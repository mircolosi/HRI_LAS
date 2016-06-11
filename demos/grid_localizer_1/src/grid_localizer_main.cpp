#include "grid_localizer.h"
#include <iostream>

using namespace std;

int main(int argc, char** argv) {
  // load an image and make it  a map
  LocalizerMap m;
  m.load(argv[1]);
  m.init();

  
  // select a current state among the free cells in the map

  int current_state=m._index_to_cell.size()/2;
  Observation current_observation;
  int r = m._index_to_cell[current_state].first;
  int c = m._index_to_cell[current_state].second;

  // setup the display
  cv::namedWindow("belief");
  cv::namedWindow("ground_truth");

  while (1) {
    Action a=Up;
    char k = cv::waitKey(0);

    // read a key to get the control (i=up, k=down, j=left, l=right)
    switch(k) {
    case 'i': a=Up; break;
    case 'k': a=Down; break;
    case 'j': a=Left; break;
    case 'l': a=Right; break;
    case 27: return 0;
    default: ;
    }
    
    // sample from the simulator the *true next state*
    current_state=m.sampleNextState(current_state, a);
    
    // sample from the simulator a feasible observation
    current_observation=m.sampleObservation(current_state);

    std::pair<int, int> current_indices=m._index_to_cell[current_state];

    cerr << "Current location: " << current_indices.first << " " <<  current_indices.second << endl; 
    cerr << "Current observation: " 
	 << ((current_observation&1)>0) << " " 
	 << ((current_observation&2)>0) << " " 
	 << ((current_observation&4)>0) << " " 
	 << ((current_observation&8)>0) << endl;

    cv::Mat gt=m._map.clone();
    gt.at<cv::Vec3b>(current_indices.first, current_indices.second)=cv::Vec3b(0, 255, 0);

    // show the ground truth
    cv::Mat gt2;
    cv::resize(gt, gt2, cv::Size(), 10, 10, cv::INTER_NEAREST);
    cv::imshow("ground_truth", gt2);
    
    // show the filter status
    m.predict(a);
    m.update(current_observation);
    m.showBelief();
  }
  
}
