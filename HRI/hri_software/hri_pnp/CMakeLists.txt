cmake_minimum_required(VERSION 2.8.3)
project(hri_pnp)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  rospy
  std_msgs
  geometry_msgs
  nav_msgs
  pnp_ros
  tf
  cv_bridge
  image_transport
  sensor_msgs
)

catkin_package(
   CATKIN_DEPENDS message_runtime
)

include_directories(
  ${pnp_ros_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
)

add_executable(hri_pnpas src/main.cpp src/HRIPNPAS.cpp src/Actions.cpp src/Conditions.cpp)
target_link_libraries(hri_pnpas ${pnp_ros_LIBRARIES} ${catkin_LIBRARIES})

add_executable(gest_recog_node src/gest_recog.cpp)
target_link_libraries(gest_recog_node ${pnp_ros_LIBRARIES} ${catkin_LIBRARIES})
