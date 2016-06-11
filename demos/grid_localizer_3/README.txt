This folder contains
- an implementation of a grid-based filter for a mobile robot with 4 bumpers

requires:
- opencv

To compile:

cd grid_localizer
mkdir build
cd build
cmake ../
make

binaries are in /bin and /lib 

To run:

Use: ../bin/grid_localizer <map file name> [options]
Options:   -verbose: print additional info
Options:   -controller: activate controller

Example 1:

  $ bin/grid_localizer map.png

  Drive the robot with i,j,k,l keys and see the belief update

Example 2:

  $ bin/grid_localizer map_linear.png -controller [controller_name]

  Available controllers: 
    - Right: always choose Right action
    - LeftRight: random choice between Left and Right
    - MDP: compute policy with Value iteration and then executes it
    - RL: compute policy with Reinforcement Learning 

  Goal of the agent is to reach the right end of the world without hitting obstacles.

  User control: SPACE key to pause, ESC to quit, any key to start/restart the run.

  Number of actions, obstacles hit and estimated transition and observation 
  probabilities are printed at the end of each run.


