#include "opencv2/opencv.hpp"
#include <vector>
#include <ostream>

enum Action {Up, Down, Left, Right};


typedef char Observation;  // UDLR bit
typedef int State;  // <r,c> cell

std::ostream& operator<< (std::ostream &stream, Observation obs);
std::ostream& operator<< (std::ostream &stream, Action a);



typedef std::vector <float> Belief;


/*************** World: environment management ************************/

class World {
public:
    // loads a map from an image. white: free space, black obstacles.
    void load(const char* filename);

    /************** member variables ************************/
    cv::Mat _map; // map of the world
    cv::Mat _cell_to_index; // cell to index data structure, to look up a state at given coordinates
    std::vector< std::pair<int, int> > _index_to_cell; // looks up the coordinates given the state

    int _n_states; // total number of states
    
    std::string strstate(int x); // returns a string in the form "(row,column)" for a state
};



/************** Localizer: beiefe of the agent *****************/

class LocalizerMap {
 public:
  
  LocalizerMap(World &w) {
      _w=w;
  }

  // initializes the filter with a uniform prior
  void init();

  // display the current belief map
  void showBelief();

  // implements the AGENT'S BELIEF of the transition and observation models
  float transitionModel(int from, int to, Action action);
  float observationModel(int state, Observation o);

  // implements the prediction step of the filter (integrates the action in the belief)
  void predict(Action action);

  // implements the update step of the filter (integrates the observation in the belief)
  void update(Observation z);

  World _w;
  Belief _b;
};



/****** Simulator: controls the evolution, not known to the agent ********/

class Simulator {

public:
    Simulator(World &w) {
        _w=w;
    }

    void init();

    int getRow();
    int getCol();

    // executes one step of simulation
    Observation execute_step(Action a);

    
    bool obstacle(int r, int c);

    // implements the TRUE transition and observation models
    float transitionModel(int from, int to, Action action);
    float observationModel(int state, Observation o);

    // draws a next state from the previous one, given the action a
    int sampleNextState(int from, Action a);

    // draws an observation, given a state
    Observation sampleObservation(int x);

    // returns the true observation in the state
    Observation trueObservation(int state);

    World _w;

    // current real state (not known to the agent)
    State _current_state;

    // current observation according to the sensor model (known to the agent)
    Observation _current_observation;

    // true observation from a perfect sensor (not known to the agent)
    Observation _true_observation;

};


class Controller {
public:
  Controller() {}

  Action doAction(int state) {
    return Right;
  }
};


class DataCollector {
public:  
  std::map< Action, int >  action_count;
  std::map< std::pair<Action,int>, int >  action_motion_count;
  std::map< Action, int >  action_hit_count;
  std::map< int, int > nobstacles, nobservations;

  DataCollector() {
  }

  void init() {
    action_count.clear();
    action_motion_count.clear();
    action_hit_count.clear();
    nobstacles.clear(); nobservations.clear();
  }

};


