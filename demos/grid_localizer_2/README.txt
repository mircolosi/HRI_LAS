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

  $ bin/grid_localizer map_linear.png -controller

  Run a simple controller that always choose the Right action until the
  agent reaches the right end of the world.
  User control: SPACE key to pause, ESC to quit, any key to start/restart 
  the run.
  Transition and observation probabilities are estimeted and printed at the
  end of each run.





