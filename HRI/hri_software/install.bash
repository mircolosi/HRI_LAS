#!/bin/bash

ROS_CATKIN_SRC=/home/parallels/catkin_ws/src

MAIN_DIR=`pwd`


# Install required Linux libs and applications

sudo apt-get update

sudo apt-get install cmake g++ subversion xterm libboost1.54-dev libxml2 libxml2-dev libxml++2.6-dev flex libfltk1.1-dev

# Install ROS addons
sudo apt-get install ros-indigo-joystick-drivers ros-indigo-navigation

# Install packages
cd $MAIN_DIR

# PetriNetPlans

if [ ! -d PetriNetPlans ]; then
    git clone https://github.com/iocchi/PetriNetPlans
else
    cd PetriNetPlans; git pull; cd -
fi


# gradient_based_navigation
if [ ! -d gradient_based_navigation ]; then
    git clone https://github.com/Imperoli/gradient_based_navigation
else
    cd gradient_based_navigation; git pull; cd -
fi


# Stage environments

if [ ! -d stage_environments ]; then
    svn co https://labrococo.dis.uniroma1.it/svn/software-open/trunk/rococo-ros/stage_environments/
else
    cd stage_environments; svn up; cd -
fi

# glocalizer

if [ ! -d glocalizer ]; then
    svn co https://labrococo.dis.uniroma1.it/svn/software-open/trunk/rococo-ros/glocalizer/
else
    cd glocalizer; svn up; cd -
fi

# Rococo Navigation

if [ ! -d rococo_navigation ]; then
    svn co https://labrococo.dis.uniroma1.it/svn/software-open/trunk/rococo-ros/rococo_navigation/
else
    cd rococo_navigation; svn up; cd -
fi

# Rococo Laser Analysis

if [ ! -d laser_analysis ]; then
    svn co https://labrococo.dis.uniroma1.it/svn/software-open/trunk/rococo-ros/laser_analysis/
else
    cd laser_analysis; svn up; cd -
fi

# TCP interface

if [ ! -d tcp_interface ]; then
    git clone https://github.com/gennari/tcp_interface
else
    cd tcp_interface; git pull; cd -
fi


# DIAGO setup and apps

if [ ! -d diago_setup ]; then
    svn co https://labrococo.dis.uniroma1.it/svn/software-open/trunk/rococo-ros/diago_setup
else
    cd diago_setup; svn up; cd -
fi

if [ ! -d diago_apps ]; then
    svn co https://labrococo.dis.uniroma1.it/svn/software-open/trunk/rococo-ros/diago_apps
else
    cd diago_apps; svn up; cd -
fi

# HRI-PNP_INCLUDE

if [ ! -d hri_pnp ]; then
    git clone https://luca_iocchi@bitbucket.org/luca_iocchi/hri_pnp.git
else
    cd hri_pnp; git pull; cd -
fi


# Creates symbolic links to catkin/src

cd $ROS_CATKIN_SRC
ln -sf $MAIN_DIR/PetriNetPlans/PNPros/ROS_bridge/* .
ln -sf $MAIN_DIR/gradient_based_navigation .
ln -sf $MAIN_DIR/stage_environments .
ln -sf $MAIN_DIR/glocalizer .
ln -sf $MAIN_DIR/rococo_navigation .
ln -sf $MAIN_DIR/laser_analysis .
ln -sf $MAIN_DIR/tcp_interface .
ln -sf $MAIN_DIR/diago_setup .
ln -sf $MAIN_DIR/diago_apps .
ln -sf $MAIN_DIR/hri_pnp .
cd -



echo ""
echo "***** ADDITIONAL INSTALLATION INSTRUCTIONS *****"
echo ""
echo "1. Add the following lines to your .bashrc file:"
echo ""
echo "export PNP_INCLUDE=$MAIN_DIR/PetriNetPlans/PNP/include"
echo "export PNP_LIB=$MAIN_DIR/PetriNetPlans/PNP/lib"
echo ""
echo "2. Start a new terminal to have PNP environment variables set (or set them manually on this terminal)"
echo ""
echo "3. Build external libraries (PNP) with 'make_external_libs.bash'"
echo ""
echo "4. Use catkin_make from your catkin workspace to build ROS packages"
echo ""

