#!/bin/sh

# Start simulated environment and robot

`(rospack find diago_apps)`/script/run_movebase.py diago DISB1 SIM -initpose 2 2 0

sleep 2

xterm -e "roslaunch hri_pnp hri_pnpas.launch" &

#sleep 2

#xterm -e "rosrun usb_cam usb_cam_node _pixel_format:=yuyv _framerate:=15" 

sleep 5

rostopic pub /diago/planToExec std_msgs/String "data: 'my_plan'"  --once
