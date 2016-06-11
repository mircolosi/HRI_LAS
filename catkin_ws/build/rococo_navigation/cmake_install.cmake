# Install script for directory: /home/parallels/catkin_ws/src/rococo_navigation

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/parallels/catkin_ws/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/action" TYPE FILE FILES
    "/home/parallels/catkin_ws/src/rococo_navigation/action/Turn.action"
    "/home/parallels/catkin_ws/src/rococo_navigation/action/FollowCorridor.action"
    "/home/parallels/catkin_ws/src/rococo_navigation/action/FollowPerson.action"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/msg" TYPE FILE FILES
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/TurnAction.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/TurnActionGoal.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/TurnActionResult.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/TurnActionFeedback.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/TurnGoal.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/TurnResult.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/TurnFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/msg" TYPE FILE FILES
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowCorridorAction.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowCorridorActionGoal.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowCorridorActionResult.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowCorridorActionFeedback.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowCorridorGoal.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowCorridorResult.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowCorridorFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/msg" TYPE FILE FILES
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowPersonAction.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowPersonActionGoal.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowPersonActionResult.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowPersonActionFeedback.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowPersonGoal.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowPersonResult.msg"
    "/home/parallels/catkin_ws/devel/share/rococo_navigation/msg/FollowPersonFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/cmake" TYPE FILE FILES "/home/parallels/catkin_ws/build/rococo_navigation/catkin_generated/installspace/rococo_navigation-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/parallels/catkin_ws/devel/include/rococo_navigation")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/parallels/catkin_ws/devel/share/common-lisp/ros/rococo_navigation")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/parallels/catkin_ws/devel/lib/python2.7/dist-packages/rococo_navigation")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/parallels/catkin_ws/devel/lib/python2.7/dist-packages/rococo_navigation")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/parallels/catkin_ws/build/rococo_navigation/catkin_generated/installspace/rococo_navigation.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/cmake" TYPE FILE FILES "/home/parallels/catkin_ws/build/rococo_navigation/catkin_generated/installspace/rococo_navigation-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/cmake" TYPE FILE FILES
    "/home/parallels/catkin_ws/build/rococo_navigation/catkin_generated/installspace/rococo_navigationConfig.cmake"
    "/home/parallels/catkin_ws/build/rococo_navigation/catkin_generated/installspace/rococo_navigationConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation" TYPE FILE FILES "/home/parallels/catkin_ws/src/rococo_navigation/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

