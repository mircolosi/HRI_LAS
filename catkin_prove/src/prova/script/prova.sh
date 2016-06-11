#!/bin/sh

xterm -e "roscore" &

sleep 2

xterm -e "rosrun usb_cam usb_cam_node _pixel_format:=yuyv" 

sleep 2

rosrun prova prova_node

