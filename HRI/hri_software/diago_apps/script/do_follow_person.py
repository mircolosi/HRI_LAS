#!/usr/bin/env python

import os

if __name__ == '__main__':
    robotname = 'diago'
    followperson_str = 'rosrun rococo_navigation follow_person_node -client %s ' % (robotname)
    os.system(followperson_str + '1.0')
