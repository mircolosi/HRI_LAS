include "include/floorplan.inc"
include "include/box.inc"
include "include/erratic.inc" 
include "include/segway.inc" 

# set the resolution of the underlying raytrace model in meters
resolution 0.02

interval_sim 100  # simulation timestep in milliseconds

window ( 
  size   [ 400 600 1 ]         
  rotate [ 0.000 0.000 ]    
  center [ 6.0 11.0 ]   
  scale 23
  show_data 0
)

floorplan (
  size [12.5 22.5 1]
  pose [6.25 11.25  0 0]
  bitmap "peccioli@Home.png"
)

# boxes
box( pose [ 2.5 10.0 0.1 0 ] color "blue")
box( pose [ 7.0 5.0 0 45 ] color "red")
box( pose [ 9.5 9.0 0.1 0 ] color "green")

#circle( pose [ 15.0 17.5 0.1 0 ] color "blue")
#circle( pose [ 14.0 18.0 0.1 0 ] color "blue")





