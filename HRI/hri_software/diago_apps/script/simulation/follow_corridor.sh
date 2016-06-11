#!/bin/bash
MAPNAME="DISB1"
INITPOSE="11.8 2 270"

cd `rospack find stage_environments`
cd scripts
./start_simulation.py $MAPNAME diago $INITPOSE amcl gradient_based_nav joystick

sleep 5

xterm -e "roslaunch rococo_navigation nav.launch robot_name:=diago" &

