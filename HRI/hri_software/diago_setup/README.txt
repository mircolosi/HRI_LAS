=====================
Set-up of robot Diago
=====================

This package contains launch and configuratoin files to run Diago.

1. Full run (laser + 2 Kinect)

  launch$ roslaunch diago.launch

1b.  Rviz visualization

  launch$ roslaunch diago.launch publish_tf:=true
  launch$ rosrun rviz rviz -d ../config/rviz/diago.rviz

2. Partial run

Any combination of 

2a. No kinect

  launch$ roslaunch diago.launch kinects_enabled:=false

2b. No laser

  launch$ roslaunch diago.launch laser_enabled:=false

2c. No segway

  launch$ roslaunch diago.launch segway_enabled:=false


