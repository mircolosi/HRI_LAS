#include "grid_localizer.h"
#include <iostream>

using namespace std;

int main(int argc, char** argv) {

  bool verbose = false, usecontroller=false;

  if (argc<2) {
      cout << "Use: " << argv[0] << " <map file name> [options]" << endl;
      cout << "Options:   -verbose: print additional info" << endl;
      cout << "Options:   -controller: activate controller" << endl;
      return -1;
  }

  for (int i=2; i<argc; i++) {
    if (string(argv[i])=="-verbose")
      verbose = true;
    if (string(argv[i])=="-controller")
      usecontroller = true;
  }


  // create the world (load an image and make it a map)
  World w; w.load(argv[1]);

  // create the simulator (evolution not known to the agent)
  Simulator sim(w);

  // create the ocalizer (evolution estimated by the agent)
  LocalizerMap m(w);

  // used to collect data for learning
  DataCollector dc;

  cv::Mat obs(5, 5, CV_8UC3);

  // setup the display
  cv::namedWindow("belief");
  cv::namedWindow("ground_truth");
  cv::namedWindow("observations");

  bool run = true;
  bool pause = usecontroller;

  while (run) {

    sim.init();
    m.init();
    dc.init();

    Observation current_observation = 0;

    while (run) {

      // read current state
      std::pair<int, int> current_indices=sim._w._index_to_cell[sim._current_state];
      int r = current_indices.first, c = current_indices.second;

      // draw the world with agent position
      cv::Mat gt=sim._w._map.clone();
      gt.at<cv::Vec3b>(r,c)=cv::Vec3b(0, 255, 0);  // agent position green dot

      // set observation matrix for display current observations
      obs = cv::Scalar(255,255,255);
      obs.at<cv::Vec3b>(2,2)=cv::Vec3b(0, 255, 0);

      // read true observation for data collection
      if ((sim._true_observation&1)>0) dc.nobstacles[1]++;
      if ((sim._true_observation&2)>0) dc.nobstacles[2]++;
      if ((sim._true_observation&4)>0) dc.nobstacles[4]++;
      if ((sim._true_observation&8)>0) dc.nobstacles[8]++;
  
      // draw observations (blue dots) and update values for data collection
      if ((current_observation&1)>0) { // up
          gt.at<cv::Vec3b>(r-1,c)=cv::Vec3b(255, 0, 0);
          obs.at<cv::Vec3b>(1,2)=cv::Vec3b(255, 0, 0);
          if ((sim._true_observation&1)>0) dc.nobservations[1]++;
      }
      if ((current_observation&2)>0) { // down
          gt.at<cv::Vec3b>(r+1,c)=cv::Vec3b(255, 0, 0);
          obs.at<cv::Vec3b>(3,2)=cv::Vec3b(255, 0, 0);
          if ((sim._true_observation&2)>0) dc.nobservations[2]++;
      }
      if ((current_observation&4)>0) { // left
          gt.at<cv::Vec3b>(r,c-1)=cv::Vec3b(255, 0, 0);
          obs.at<cv::Vec3b>(2,1)=cv::Vec3b(255, 0, 0);
          if ((sim._true_observation&4)>0) dc.nobservations[4]++;
      }
      if ((current_observation&8)>0) { // right
          gt.at<cv::Vec3b>(r,c+1)=cv::Vec3b(255, 0, 0);
          obs.at<cv::Vec3b>(2,3)=cv::Vec3b(255, 0, 0);
          if ((sim._true_observation&8)>0) dc.nobservations[8]++;
      }

      // show observations
      cv::Mat obs2;
      cv::resize(obs, obs2, cv::Size(), 30, 30, cv::INTER_NEAREST);
      cv::imshow("observations", obs2);

      // show ground truth and belief
      cv::Mat gt2;
      cv::resize(gt, gt2, cv::Size(), 10, 10, cv::INTER_NEAREST);
      cv::imshow("ground_truth", gt2);
      m.showBelief();

      if (verbose) {
          // print information
          cout << "Current location: " << current_indices.first << " " <<  current_indices.second << endl;
          cout << "Current observation: " << current_observation << endl;
      }

      if (usecontroller) {
      // check if agent reached right-end side of the worlds and terminate the run
        if (sim.getCol()==sim._w._map.cols-2) {
          break;
        }
      }


      Controller controller;

      Action a=Right;

      int waittime = 0; // manual input
      if (usecontroller) waittime = 10;

      char k = cv::waitKey(waittime);

      // manual input
      // read a key to get the control (i=up, k=down, j=left, l=right)
      switch(k) {
        case 'i': a=Up; break;
        case 'k': a=Down; break;
        case 'j': a=Left; break;
        case 'l': a=Right; break;
        case ' ': pause = !pause; break;
        case 27: run=false;
        default: ;
      }

      // pause/unpause the run
      while (pause && run) {
        char k = cv::waitKey(100);
        if (k==' ') pause=false;
        if (k==27) run=false;
      }

      // action chosen by the controller
      if (usecontroller)
        a = controller.doAction(sim._current_state);
  
      // remember previous state
      State previous_state = sim._current_state;
      int prev_r = sim.getRow(), prev_c = sim.getCol();

      // update the simulator status
      current_observation = sim.execute_step(a);
      
      // get current state
      int curr_r = sim.getRow(), curr_c = sim.getCol();
      
      // encode the transition in an integer
      int encode = (curr_r - prev_r) + (curr_c - prev_c)*4;

      // update the statistics for data collection
      dc.action_count[a]++;
      dc.action_motion_count[make_pair(a,encode)]++;
      if (a==Right && sim.obstacle(prev_r,prev_c+1)) {
          dc.action_hit_count[a]++;          
      }

      if (verbose) {
          // print information
          cout << "Action: " << a << endl;
          cout << "Transition: " << w.strstate(previous_state) << " -> " <<
            w.strstate(sim._current_state) << endl;
          cout << "Encode: " << encode << endl;
      }

      // update the filter status
      m.predict(a);
      m.update(current_observation);

    } // while


    cout << "N. of R actions = " << dc.action_count[Right] << endl;
    cout << "N. of R actions with hit = " << dc.action_hit_count[Right] << endl;

    cout << "N. of R actions -> c+1 = " << dc.action_motion_count[make_pair(Right,4)] << endl;
    cout << "N. of R actions -> c-1 = " << dc.action_motion_count[make_pair(Right,-4)] << endl;


    cout << "N. of right obstacles = "  << dc.nobstacles[8] << endl;
    cout << "N. of right obstacles AND right observations = " << dc.nobservations[8] << endl;


    double p = (double) dc.action_motion_count[make_pair(Right,4)] / ( dc.action_count[Right] - dc.action_hit_count[Right]); 
    cout << "Transition probability P(x_t+1 = c+1| x_t = c & not obstacle_right) = " << p << endl;

    p = (double) dc.action_motion_count[make_pair(Right,-4)] / dc.action_hit_count[Right]; 

    cout << "Transition probability P(x_t+1 = c-1| x_t = c & obstacle_right) = " << p << endl;
    
    double pz = (double)dc.nobservations[8] / dc.nobstacles[8];

    cout << "Observation probability P(z:t = right | obstacle_right) = " << 
pz << endl;

    if (usecontroller) {
      cout << endl << "Press a key to restart or 'Esc' to exit." << endl;
      char k = cv::waitKey(0);
      run = (k!=27); // esc
    }
  } // while
  
}

