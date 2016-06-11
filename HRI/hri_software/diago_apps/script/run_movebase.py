#!/usr/bin/python

import sys
import os
import math

import utils

InitPoses = { 'DISB1': '11.8 2 270',  'DISlabs': '9.7 7.3 90', \
  'Rive1': '10 23 0', 'Rockin2014': '-3.5 6.2 270' }


def usage():
    print "  Use: ",sys.argv[0],' <robot_name> <map_name> <REAL|SIM> '+ utils.args_help()
    print "  e.g. ",sys.argv[0],' diago DISB1 SIM'
    

if __name__ == '__main__':
  
  if (len(sys.argv)<4):
    usage()
    sys.exit()

  # Default values
  params = {} 
  params['use_rgbd'] = False
  params['show_rviz'] = False
  
  params['robotname'] = sys.argv[1]
  params['mapname'] = sys.argv[2]
  params['mode'] = sys.argv[3]

  initpose = InitPoses[params['mapname']];
  pp = initpose.split()
  params['init_x'] = float(pp[0])
  params['init_y'] = float(pp[1])
  params['init_th'] = float(pp[2]) # deg
  

  # Read command-line arguments
  utils.readargs(sys.argv,params)
  
  # Start the robot (base and sensors)
  utils.start_robot(params)

  init_th_rad = params['init_th']*math.pi/180.0 # rad

  # Start the navigation nodes (localizer, navigation,...)
  cmd = 'xterm -e roslaunch diago_apps diago_movebase.launch robot_name:=%s map_name:=%s initial_pose_x:=%f  initial_pose_y:=%f initial_pose_a:=%f  use_amcl:=false use_glocalizer:=true &' % (params['robotname'], params['mapname'], params['init_x'], params['init_y'], init_th_rad)
  print(cmd)
  os.system(cmd)
  os.system('sleep 5')  

  # Start rviz
  if (params['show_rviz']):
    utils.start_rviz()


