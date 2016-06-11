#!/bin/bash

MAIN_DIR=`pwd`

# Update packages
cd $MAIN_DIR

cd PetriNetPlans; git pull; cd -
cd gradient_based_navigation; git pull; cd -
cd stage_environments; svn up; cd -
cd glocalizer; svn up; cd -
cd rococo_navigation; svn up; cd -
cd laser_analysis; svn up; cd -
cd tcp_interface; git pull; cd -
cd diago_setup; svn up; cd -
cd diago_apps; svn up; cd -
cd hri_pnp; git pull; cd -

