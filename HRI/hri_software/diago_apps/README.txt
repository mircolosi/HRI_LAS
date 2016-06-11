================
 Apps for Diago
================

Use start_demo.py script to select robot configuration and demo to run.

You can select SIM or REAL robot, which device are enabled (for REAL robot),
map and demo.

Available demos are: joystick/keyboard, move_base, patrol, and follow_person

Notes for use of joystick:
  Use Logitech joystick, make sure the setting D/X is on D.
  Left pad for speed, right pad for jog.
  Joystick buttons:
    RB: emergency stop
    RT: release emergency stop
    LB: joystick control - other controllers disabled
    LT: release joystick control - other controllers enabled
    
Notes about Kinect:
  By default, Kinect drivers are not launched!
  If you want Kinects driver use the option "-enable-rgbd" to any of the script described below.



== Demos available ==

IMPORTANT NOTES:
- Use diago as robot_name. 
- REAL starts the demo on the real robot, SIM on Stage simulator.
- The robot in simulation is always localized, while the real robot must be manually localized, either by start the app from the nominal initial position of the robot or by manually localize it with rviz.
- Additional command-line options for all the scripts below:
  [-keyboard] [-enable-rgbd] [-nogbn] [-initpose X Y Th(deg)] [-rviz]


1. Joystick/Keyboard

    Drive the robot with a joystick/keyboard using gradient-based navigation.

    Command line start:
   
        script$  ./run_joystick.py <robot_name> <REAL|SIM> 
   
    Rviz (starts automatically for REAL robot):
    
    $ xterm -e rosrun rviz rviz -d `rospack find diago_setup`/config/rviz/diago.rviz &
    (change the fixed frame if needed)

     
2. move_base

    Drive the robot using move_base. No joystick control, no gradient based navigation.
    Make sure the robot is localized or localize it manually with rviz.
    Use rviz to send target goals.

    Command line start:
   
        script$  ./run_movebase.py  <robot_name> <map_name> <REAL|SIM> 


TODO: Test on the robot!!!
    

    
3. Navigation (patrol/follow person)

    Drive the robot with follow_corridor and follow_person actions
    
    Gradient based navigation and joystick control active
    
    Command line start:

        script$  ./run_navigation.py  <robot_name> <map_name> <REAL|SIM> 
      
    Application start (choose one):
    
        script$  xterm -e ./do_patrol.py &
        The robot moves on a predefined path
        
        script$  xterm -e ./do_follow_person.py &
        The robot follows the person in front of it (one direction only).
        
        During the navigation, joystick can be used
        

TODO: Test on the robot!!!
