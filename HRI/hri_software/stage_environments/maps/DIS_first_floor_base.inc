include "include/floorplan.inc"
include "include/box.inc"
include "include/erratic.inc" 
include "include/segway.inc" 

# set the resolution of the underlying raytrace model in meters
resolution 0.02

interval_sim 100  # simulation timestep in milliseconds

window
( 
  size [ 500.000 500.000 ] 
  center [ 0 0 ]
  rotate [ 0 0 ]
  scale 20 
)

# load an environment bitmap
floorplan
( 
  name "DIS_first_floor"
  bitmap "DIS_first_floor.png"
  size [ 55.6 73.6 1 ]
  pose [ 12.8 25.8 0.0 0.0 ]
)

# boxes
box( pose [ 6.0 6.0 0 0 ] color "red")




