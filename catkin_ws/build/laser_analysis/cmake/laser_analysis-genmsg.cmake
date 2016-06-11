# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "laser_analysis: 2 messages, 0 services")

set(MSG_I_FLAGS "-Ilaser_analysis:/home/parallels/catkin_ws/src/laser_analysis/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(laser_analysis_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacleMap.msg" NAME_WE)
add_custom_target(_laser_analysis_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_analysis" "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacleMap.msg" ""
)

get_filename_component(_filename "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacle.msg" NAME_WE)
add_custom_target(_laser_analysis_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "laser_analysis" "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacle.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(laser_analysis
  "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacleMap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_analysis
)
_generate_msg_cpp(laser_analysis
  "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_analysis
)

### Generating Services

### Generating Module File
_generate_module_cpp(laser_analysis
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_analysis
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(laser_analysis_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(laser_analysis_generate_messages laser_analysis_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacleMap.msg" NAME_WE)
add_dependencies(laser_analysis_generate_messages_cpp _laser_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacle.msg" NAME_WE)
add_dependencies(laser_analysis_generate_messages_cpp _laser_analysis_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_analysis_gencpp)
add_dependencies(laser_analysis_gencpp laser_analysis_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_analysis_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(laser_analysis
  "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacleMap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_analysis
)
_generate_msg_lisp(laser_analysis
  "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_analysis
)

### Generating Services

### Generating Module File
_generate_module_lisp(laser_analysis
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_analysis
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(laser_analysis_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(laser_analysis_generate_messages laser_analysis_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacleMap.msg" NAME_WE)
add_dependencies(laser_analysis_generate_messages_lisp _laser_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacle.msg" NAME_WE)
add_dependencies(laser_analysis_generate_messages_lisp _laser_analysis_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_analysis_genlisp)
add_dependencies(laser_analysis_genlisp laser_analysis_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_analysis_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(laser_analysis
  "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacleMap.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_analysis
)
_generate_msg_py(laser_analysis
  "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_analysis
)

### Generating Services

### Generating Module File
_generate_module_py(laser_analysis
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_analysis
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(laser_analysis_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(laser_analysis_generate_messages laser_analysis_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacleMap.msg" NAME_WE)
add_dependencies(laser_analysis_generate_messages_py _laser_analysis_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/parallels/catkin_ws/src/laser_analysis/msg/LaserObstacle.msg" NAME_WE)
add_dependencies(laser_analysis_generate_messages_py _laser_analysis_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(laser_analysis_genpy)
add_dependencies(laser_analysis_genpy laser_analysis_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS laser_analysis_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_analysis)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/laser_analysis
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(laser_analysis_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_analysis)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/laser_analysis
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(laser_analysis_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_analysis)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_analysis\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/laser_analysis
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(laser_analysis_generate_messages_py std_msgs_generate_messages_py)
