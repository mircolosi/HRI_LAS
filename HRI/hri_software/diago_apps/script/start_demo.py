#!/usr/bin/env python

import thread, os
import Tkinter as tk
import tkMessageBox
import tkFileDialog
from Tkinter import *
from ttk import *
import ConfigParser

Robot_names = ['SIM','REAL'] 
Map_names = ['None','DISB1'] 
Demo_names = ['joystick','keyboard','move_base','patrol','follow_person'] 
                                          
                                          
def run_demo(robotname, robottype, base_enabled, laser_enabled, kinect_enabled, mapname, demo):
  print 'Running demo: robot:%s %s map:%s demo:%s' % (robotname, robottype, mapname, demo)
  if (base_enabled): 
    ba='true'
  else:
    ba='false'
  if (laser_enabled): 
    la='true'
  else:
    la='false'
  if (kinect_enabled): 
    ki='true'
  else:
    ki='false'
  device_str = 'segway_enabled:=%s  lasers_enabled:=%s  kinects_enabled:=%s' %(ba, la, ki)  
  print 'Device str = ',device_str
  
  if (demo=='joystick'):
    cmd = './run_joystick.py diago %s joystick %s' % (robottype,device_str)
    os.system(cmd)
  if (demo=='keyboard'):
    cmd = './run_joystick.py diago %s keyboard %s' % (robottype,device_str)
    os.system(cmd)
  if (demo=='move_base'):
    cmd = './run_movebase.py diago %s %s' % (mapname, robottype)
    os.system(cmd)
  if (demo=='patrol'):
    cmd = './run_navigation.py diago %s %s' % (mapname, robottype)
    os.system(cmd)
    os.system('xterm -e ./do_patrol.py')
  if (demo=='follow_person'):
    cmd = './run_navigation.py diago %s %s' % (mapname, robottype)
    os.system(cmd)
    os.system('xterm -e ./do_follow_person.py')  
  

class GUI(tk.Frame):

   def __init__(self, parent):
      tk.Frame.__init__(self, parent)
      self.parent = parent
      self.allCB = {} #DictionaryVar(self)
      self.initUI()
      

   def device_gui(self, _frame, _text, _var, _row, _col):
      newCB = tk.Checkbutton(_frame, text=_text, variable=_var)
      newCB.grid(sticky=W, row=_row, column=_col)
      self.allCB[_text] = newCB
      # Led
      self.led_base = IntVar(self)
      CLed = tk.Canvas(_frame, height=20, width=20)
      CLed.create_oval(3, 3, 17, 17, fill="gray")
      CLed.grid(sticky=W, row=_row, column=_col+1, ipadx=8)
      return CLed
   

   def led_gui(self, _frame, _text, _row, _col):
      lbl = tk.Label(_frame, text=_text)
      lbl.grid(sticky=W, row=_row, column=_col, pady=10, padx=5)
      # Led
      CLed = tk.Canvas(_frame, height=20, width=20)
      CLed.create_oval(3, 3, 17, 17, fill="gray")
      CLed.grid(sticky=W, row=_row, column=_col+1, ipadx=8)
      return CLed

      
   def initUI(self):
      self.parent.title("DIAGO control panel")
      self.style = Style()
      self.style.theme_use("alt")
      self.parent.resizable(width=FALSE, height=FALSE)
      self.pack(fill=BOTH, expand=1)
      #self.columnconfigure(1, weight=1)
      #self.columnconfigure(3, pad=7)
      #self.rowconfigure(3, weight=1)
      #self.rowconfigure(7, pad=7)

      self.loadConfigFile()
      
      _row = 1
      # Device frame
      frame1 = tk.Frame(self, bd=0)
      frame1.grid(sticky=W, row=_row, column=0, pady=10, padx=10, columnspan=4)

      self.base_enabled = IntVar(self)
      try:
         last_base_enabled=self.oldConfigs["base_enabled"]
      except:
         last_base_enabled=0
      self.base_enabled.set(last_base_enabled)

      self.laser_enabled = IntVar(self)
      try:
         last_laser_enabled=self.oldConfigs["laser_enabled"]
      except:
         last_laser_enabled=0
      self.laser_enabled.set(last_laser_enabled)

      self.kinect_enabled = IntVar(self)
      try:
         last_kinect_enabled=self.oldConfigs["kinect_enabled"]
      except:
         last_kinect_enabled=0
      self.kinect_enabled.set(last_kinect_enabled)

      
      # Base 
      self.CLed_base = self.device_gui(frame1, "Base", self.base_enabled, 1, 0)

      # Laser 
      self.CLed_laser = self.device_gui(frame1, "Laser", self.laser_enabled, 1, 2)
      
      # Kinect
      self.CLed_kinect = self.device_gui(frame1, "Kinect", self.kinect_enabled, 1, 4)
      
      
      self.CLed_emergency_stop = self.led_gui(frame1, "Emergency Stop", 2, 0)
      
      self.CLed_cmd_vel = self.led_gui(frame1, "Cmd Vel", 3, 0)
      self.CLed_cmd_vel = self.led_gui(frame1, "Odometry", 3, 2)
      self.CLed_localization = self.led_gui(frame1, "Localization", 3, 4)
      
      
      _row = 2
      # Robot selection
      lbl = tk.Label(self, text="Robot")
      lbl.grid(sticky=W, row=_row, column=0, pady=10, padx=5)
      self.robot_name_list = Robot_names
      self.robot_ddm = StringVar(self)
      try:
         lastrobot=self.oldConfigs["robot"]
      except:
         lastrobot=self.robot_name_list[0]
      self.robot_ddm.set(lastrobot)
      self.Opt_robot = tk.OptionMenu(self, self.robot_ddm, *self.robot_name_list)
      self.Opt_robot.grid(sticky=W, row=_row, column=1, pady=10, padx=5)
      
      _row = _row+1
      # Map selection
      lbl = tk.Label(self, text="Map")
      lbl.grid(sticky=W, row=_row, column=0, pady=10, padx=5)
      self.map_name_list = Map_names
      self.map_ddm = StringVar(self)
      try:
         lastmap=self.oldConfigs["map"]
      except:
         lastmap=self.map_name_list[0]
      self.map_ddm.set(lastmap)
      self.Opt_map = tk.OptionMenu(self, self.map_ddm, *self.map_name_list)
      self.Opt_map.grid(sticky=W, row=_row, column=1, pady=10, padx=5)

      _row = _row+1
      # Demo selection
      lbl = tk.Label(self, text="Demo")
      lbl.grid(sticky=W, row=_row, column=0, pady=10, padx=5)
      self.demo_name_list = Demo_names
      self.demo_ddm = StringVar(self)
      try:
         last_demo=self.oldConfigs["demo"]
      except:
         last_demo=self.demo_name_list[0]
      self.demo_ddm.set(last_demo)
      self.Opt_demo = tk.OptionMenu(self, self.demo_ddm, *self.demo_name_list)
      self.Opt_demo.grid(sticky=W, row=_row, column=1, pady=10, padx=5)


      _row = 6
      # Buttons
      self.Btn_start = Button(self, text="Start",command=self.launch_script)
      self.Btn_start.grid(sticky=W, row=_row, column=0, pady=10, padx=10)
      self.Btn_stop = Button(self, text="Quit",command=self.kill_demo)
      self.Btn_stop.grid(sticky=W, row=_row, column=1, pady=10, padx=10)
      self.Btn_stop.configure(state = tk.DISABLED)

      
   def disable_buttons(self):
      self.allCB["Base"].configure(state = tk.DISABLED)
      self.allCB["Laser"].configure(state = tk.DISABLED)
      self.allCB["Kinect"].configure(state = tk.DISABLED)
      self.Btn_start.configure(state = tk.DISABLED)
      self.Btn_stop.configure(state = tk.NORMAL)
      self.Opt_robot.configure(state = tk.DISABLED)
      self.Opt_map.configure(state = tk.DISABLED)
      self.Opt_demo.configure(state = tk.DISABLED)

   def enable_buttons(self):
      self.allCB["Base"].configure(state = tk.NORMAL)
      self.allCB["Laser"].configure(state = tk.NORMAL)
      self.allCB["Kinect"].configure(state = tk.NORMAL)
      self.CLed_base.create_oval(3, 3, 17, 17, fill="gray")
      self.CLed_laser.create_oval(3, 3, 17, 17, fill="gray")
      self.CLed_kinect.create_oval(3, 3, 17, 17, fill="gray")
      self.Btn_start.configure(state = tk.NORMAL)
      self.Btn_stop.configure(state = tk.DISABLED)
      self.Opt_robot.configure(state = tk.NORMAL)
      self.Opt_map.configure(state = tk.NORMAL)
      self.Opt_demo.configure(state = tk.NORMAL)
      
   def launch_script(self):
      self.disable_buttons()
      self.saveConfigFile();
      print 'Start demo'
      print '   Base ',self.base_enabled.get()
      print '   Laser ',self.laser_enabled.get()
      print '   Kinect ',self.kinect_enabled.get()
      print '   Robot: ',self.robot_ddm.get()
      print '   Map: ',self.map_ddm.get()
      print '   Demo: ', self.demo_ddm.get()

      if (self.base_enabled.get()==1):
         self.CLed_base.create_oval(3, 3, 17, 17, fill="green")
      if (self.laser_enabled.get()==1):
         self.CLed_laser.create_oval(3, 3, 17, 17, fill="green")
      if (self.kinect_enabled.get()==1):
         self.CLed_kinect.create_oval(3, 3, 17, 17, fill="green")
         
      thread.start_new_thread( run_demo, ('diago', self.robot_ddm.get(), 
                                          self.base_enabled.get(), self.laser_enabled.get(), self.kinect_enabled.get(),
                                          self.map_ddm.get(), self.demo_ddm.get()) )

   def kill_demo(self):
      print 'Quit demo'
      os.system("`rospack find stage_environments`/scripts/quit.sh")
      self.enable_buttons()
      
   def quit(self):
      self.saveConfigFile();
      #self.parent.destroy()

   def saveConfigFile(self):
      f = open('lastConfigUsed', 'w')
      f.write("[Config]\n")
      f.write("base_enabled: %s\n"%self.base_enabled.get())
      f.write("laser_enabled: %s\n"%self.laser_enabled.get())
      f.write("kinect_enabled: %s\n"%self.kinect_enabled.get())
      f.write("robot: %s\n"%self.robot_ddm.get())      
      f.write("map: %s\n"%self.map_ddm.get())
      f.write("demo: %s\n"%self.demo_ddm.get())
      f.close()
      print 'Saved config file'
   
   def loadConfigFile(self):
      self.oldConfigs = {}
      try:
         self.Config = ConfigParser.ConfigParser()
         self.Config.read("lastConfigUsed")
         for option in self.Config.options("Config"):
            self.oldConfigs[option] = self.Config.get("Config", option)
      except:
         print "Could not load config file"


def main():
   root = tk.Tk()
   f = GUI(root)
   root.geometry("400x320+10+10")
   root.mainloop()
   f.quit()

if __name__ == '__main__':
   main()
