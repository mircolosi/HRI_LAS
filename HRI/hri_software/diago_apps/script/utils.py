import sys
import os

def start_robot(params):
  if (params['mode']=='REAL'):
    rgbd_str=''
    if (params['use_rgbd']):
      rgbd_str = 'kinects_enabled:=true'
    cmd = 'xterm -e roslaunch diago_setup diago.launch robot_name:=%s %s &' % (params['robotname'], rgbd_str)
  else:  
    cmd = 'cd `rospack find stage_environments`/scripts; ./start_simulation.py  %s %s %f %f %f none none ' % (params['mapname'],params['robotname'],params['init_x'],params['init_y'],params['init_th'])
  print cmd
  os.system(cmd)
  
def start_rviz():
  cmd = 'xterm -e "rosrun rviz rviz -d `rospack find diago_setup`/config/rviz/diago.rviz" &'
  os.system(cmd)
  
def readargs(argv,params):
  for i in range(3,len(argv)):
    if (sys.argv[i]=="-keyboard"):
        params['inputdev'] = "keyboard"
    elif (sys.argv[i]=="-nogbn"):
        params['use_gbn'] = False
    elif (sys.argv[i]=="-enable-rgbd"):
        params['use_rgbd'] = True
    elif (sys.argv[i]=="-rviz"):
        params['show_rviz'] = True
    elif (sys.argv[i]=="-initpose"):
	params['init_x']=float(sys.argv[i+1])
	params['init_y']=float(sys.argv[i+2])
	params['init_th']=float(sys.argv[i+3]) # deg
	#i = i+3

def args_help():
  return "[-keyboard] [-enable-rgbd] [-nogbn] [-initpose X Y Th(deg)] [-rviz]"
