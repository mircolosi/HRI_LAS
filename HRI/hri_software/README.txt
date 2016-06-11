========================================
HOW TO INSTALL SOFTWARE FOR HRI PROJECTS
========================================

1. Install ROS Indigo on Ubuntu 14.04 (follow instructions in www.ros.org)
   Create a catkin workspace and make sure everything work in it.
 
2. Modify install.bash to set your ROS catkin/src directory

   ROS_CATKIN_SRC=<YOUR PATH TO catkin/src FOLDER>

3. Run the installation script from the installation directory

   $ ./install.bash

   Important notes:
   ---------------
   1. The script will install some libraries on your OS (you need sudo privileges). 
   Before confirming the installation of new libraries, ***READ THE MESSAGE***!!! 
   In some cases, update of libraries may need to delete previous libraries
   and this can ***DESTROY*** some working applications!!!
   2. Symbolic links from the current installation directory to your catkin workspace 
   will be added. All the packages will be compiled whenever you use catkin_make.
   If you have other ROS packages for another ROS project and you don't want to mess up things,
   consider the possibility of creating a separate catkin workspace for these packages.
   
4. Follow the instructions at the end of the script
   (set PNP environment variables and build external libraries)

5. Move to your catkin workspace and compile it with 'catkin_make' 

6. Test the software

   $ roscd hri_pnp/scripts
   $ ./run_demo.sh

   The plan hri_pnp/plans/go_and_greet_person.pnml is executed.
   After some time the property personAt_RoomB115 is set (from the run_demo.sh script)
   and the robot starts moving to the corresponding location.
   When it arrives, it waits for a person to appear in front of it (move the red box 
   in front of the robot to activate the condition personhere).
   Then the robot greets the person and waits for the person to leave (move the red box 
   away from the robot to negate the condition personhere).
   Finally, the robot goes back in its home position.

   To quit the demo:
   
   $ rosnode kill -a



===============
SOFTWARE UPDATE 
===============

The script update.bash can be used to update the downloaded packages.



=============================================
UNDERSTAND AND MODIFY ROS PACKAGE FOR HRI-PNP
=============================================

hri_pnp package has the following structure:

- src: contains the action server (HRIPNPAS.cpp) and implementation of actions
  (Actions.cpp) and conditions (Conditions.cpp)
- plans: contains the PNPs
- launch: contains a launch file for pnp_ros and tcp_interface nodes
- scripts: contains a script to run the simple demo

To extend this project, consider the following steps:

1. Create new PNPs in the plans folder
2. Implement new actions and condition in the src/*.cpp files
3. Extend launch file if new nodes need to be added.
4. Create new script to launch the new demo.

 
  
