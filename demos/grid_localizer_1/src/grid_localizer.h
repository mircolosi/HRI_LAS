#include "opencv2/opencv.hpp"
#include <vector>

enum Action {Up, Down, Left, Right};

typedef char Observation;

typedef std::vector <float> Belief;



class LocalizerMap {
 public:
  
  void showBelief();

  // loads a map from an image. The non-white cells are feasible locations
  // of the robot
  void load(const char* filename);
  
  // initializes the filter with a uniform prior
  void init();

  // implements the transition ad the observation models
  float transitionModel(int from, int to, Action action);
  float observationModel(int state, Observation o);

  
  // implements the prediction step of the filter (integrates the action in the belief)
  void predict(Action action);

  // implements the update step of the filter (integrates the observation in the belief)
  void update(Observation z);

  /************** simulator part (not needed for filter) ************************/
  // draws a next state from the previous one, given the action a
  int sampleNextState(int from, Action a);
  // draws an observation, given a state
  Observation sampleObservation(int x);

  /************** member variables ************************/ 
  
  cv::Mat _map; // map
  cv::Mat _cell_to_index; // cell to index data structure, to look up a state at given coordinates
  std::vector< std::pair<int, int> > _index_to_cell; // looks up the coordinates given the state

  Belief _b;
};



