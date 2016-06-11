#!/usr/bin/python

import sys
import os
import math

import utils


def usage():
    print "  Use: ",sys.argv[0],' <robot_name> <REAL|SIM> ', utils.args_help()
    print "  e.g. ",sys.argv[0],' diago SIM'


if __name__ == '__main__':
  
  if (len(sys.argv)<3):
    usage()
    sys.exit()

  # Default values
  params = {}
  params['mapname'] = 'DISB1'
  params['inputdev'] = 'joystick'
  params['init_x'] = 2
  params['init_y'] = 2
  params['init_th'] = 0
  
  params['use_gbn'] = True
  params['use_rgbd'] = False
  params['show_rviz'] = False
  
  params['robotname'] = sys.argv[1]
  params['mode'] = sys.argv[2]

  # Read command-line arguments
  utils.readargs(sys.argv,params)
  
  # Start the robot (base and sensors)
  utils.start_robot(params)

  # Start the joystick launch
  joystr=''
  if (params['inputdev']=='joystick'):
    joystr = 'use_joystick:=true'
  else:
    joystr = 'use_joystick:=false'
  
  gbn_str=''
  if (not params['use_gbn']):
    gbn_str = "_nogbn"

  cmd = 'xterm -e roslaunch diago_apps diago_joystick%s.launch robot_name:=%s %s &' % (gbn_str, params['robotname'], joystr)
  print cmd
  os.system(cmd)
  os.system('sleep 5')  

  # Start rviz
  if (params['show_rviz']):
    utils.start_rviz()

