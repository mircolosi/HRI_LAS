#!/bin/bash

MAIN_DIR=`pwd`
ROS_CATKIN_DIR=catkin_ws/src

# make external modules
cd $MAIN_DIR/PetriNetPlans/PNP
if [ ! -d build ]; then
  mkdir build
  cd build
  cmake ..
  cd ..
fi
cd build
make install

cd $MAIN_DIR/PetriNetPlans/PNPgen
if [ ! -d build ]; then
  mkdir build
  cd build
  cmake ..
  cd ..
fi
cd build
make

echo ""
echo "Petri Net Plans built and installed"
echo ""



