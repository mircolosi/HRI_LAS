#!/bin/bash

rosbag record -o diago /diago/cmd_vel /diago/odom /diago/segway_status  /diago/scan \
/diago/top_camera/driver/parameter_descriptions  /diago/top_camera/driver/parameter_updates \
/diago/top_camera/depth/camera_info /diago/top_camera/depth/image_raw \
/diago/top_camera/rgb/camera_info /diago/top_camera/rgb/image_raw \
/diago/bottom_camera/driver/parameter_descriptions /diago/bottom_camera/driver/parameter_updates \
/diago/bottom_camera/depth/camera_info /diago/bottom_camera/depth/image_raw \
/diago/bottom_camera/rgb/camera_info /diago/bottom_camera/rgb/image_raw 
