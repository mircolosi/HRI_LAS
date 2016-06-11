#!/usr/bin/env python

import os

if __name__ == '__main__':
    robotname = 'diago'
    turn_str = 'rosrun rococo_navigation turn_node -client %s ' % (robotname)
    followcorridor_str = 'rosrun rococo_navigation follow_corridor_node -client %s ' % (robotname)
    
    for i in range(0,4):
      os.system(turn_str+' 180 ABS')
      os.system(followcorridor_str + '2 2')
      os.system(turn_str+' 90 ABS')
      os.system(followcorridor_str + '2 10')
      os.system(turn_str+' 270 ABS')
      os.system(followcorridor_str + '2 2')
      os.system(turn_str+' 0 ABS')
      os.system(followcorridor_str + '10 2')
