# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/parallels/catkin_prove/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/parallels/catkin_prove/build

# Include any dependencies generated for this target.
include prova/CMakeFiles/prova_node.dir/depend.make

# Include the progress variables for this target.
include prova/CMakeFiles/prova_node.dir/progress.make

# Include the compile flags for this target's objects.
include prova/CMakeFiles/prova_node.dir/flags.make

prova/CMakeFiles/prova_node.dir/src/prova.cpp.o: prova/CMakeFiles/prova_node.dir/flags.make
prova/CMakeFiles/prova_node.dir/src/prova.cpp.o: /home/parallels/catkin_prove/src/prova/src/prova.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/parallels/catkin_prove/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object prova/CMakeFiles/prova_node.dir/src/prova.cpp.o"
	cd /home/parallels/catkin_prove/build/prova && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/prova_node.dir/src/prova.cpp.o -c /home/parallels/catkin_prove/src/prova/src/prova.cpp

prova/CMakeFiles/prova_node.dir/src/prova.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/prova_node.dir/src/prova.cpp.i"
	cd /home/parallels/catkin_prove/build/prova && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/parallels/catkin_prove/src/prova/src/prova.cpp > CMakeFiles/prova_node.dir/src/prova.cpp.i

prova/CMakeFiles/prova_node.dir/src/prova.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/prova_node.dir/src/prova.cpp.s"
	cd /home/parallels/catkin_prove/build/prova && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/parallels/catkin_prove/src/prova/src/prova.cpp -o CMakeFiles/prova_node.dir/src/prova.cpp.s

prova/CMakeFiles/prova_node.dir/src/prova.cpp.o.requires:
.PHONY : prova/CMakeFiles/prova_node.dir/src/prova.cpp.o.requires

prova/CMakeFiles/prova_node.dir/src/prova.cpp.o.provides: prova/CMakeFiles/prova_node.dir/src/prova.cpp.o.requires
	$(MAKE) -f prova/CMakeFiles/prova_node.dir/build.make prova/CMakeFiles/prova_node.dir/src/prova.cpp.o.provides.build
.PHONY : prova/CMakeFiles/prova_node.dir/src/prova.cpp.o.provides

prova/CMakeFiles/prova_node.dir/src/prova.cpp.o.provides.build: prova/CMakeFiles/prova_node.dir/src/prova.cpp.o

# Object files for target prova_node
prova_node_OBJECTS = \
"CMakeFiles/prova_node.dir/src/prova.cpp.o"

# External object files for target prova_node
prova_node_EXTERNAL_OBJECTS =

/home/parallels/catkin_prove/devel/lib/prova/prova_node: prova/CMakeFiles/prova_node.dir/src/prova.cpp.o
/home/parallels/catkin_prove/devel/lib/prova/prova_node: prova/CMakeFiles/prova_node.dir/build.make
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/libcv_bridge.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/libimage_transport.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/libmessage_filters.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/libclass_loader.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/libPocoFoundation.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libdl.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/libroslib.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/libroscpp.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/librosconsole.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/liblog4cxx.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/librostime.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /opt/ros/indigo/lib/libcpp_common.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/parallels/catkin_prove/devel/lib/prova/prova_node: prova/CMakeFiles/prova_node.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/parallels/catkin_prove/devel/lib/prova/prova_node"
	cd /home/parallels/catkin_prove/build/prova && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/prova_node.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
prova/CMakeFiles/prova_node.dir/build: /home/parallels/catkin_prove/devel/lib/prova/prova_node
.PHONY : prova/CMakeFiles/prova_node.dir/build

prova/CMakeFiles/prova_node.dir/requires: prova/CMakeFiles/prova_node.dir/src/prova.cpp.o.requires
.PHONY : prova/CMakeFiles/prova_node.dir/requires

prova/CMakeFiles/prova_node.dir/clean:
	cd /home/parallels/catkin_prove/build/prova && $(CMAKE_COMMAND) -P CMakeFiles/prova_node.dir/cmake_clean.cmake
.PHONY : prova/CMakeFiles/prova_node.dir/clean

prova/CMakeFiles/prova_node.dir/depend:
	cd /home/parallels/catkin_prove/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/parallels/catkin_prove/src /home/parallels/catkin_prove/src/prova /home/parallels/catkin_prove/build /home/parallels/catkin_prove/build/prova /home/parallels/catkin_prove/build/prova/CMakeFiles/prova_node.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : prova/CMakeFiles/prova_node.dir/depend
