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
CMAKE_SOURCE_DIR = /home/parallels/Desktop/demos/grid_localizer_1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/parallels/Desktop/demos/grid_localizer_1/build

# Include any dependencies generated for this target.
include src/CMakeFiles/grid_localizer.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/grid_localizer.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/grid_localizer.dir/flags.make

src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o: src/CMakeFiles/grid_localizer.dir/flags.make
src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o: ../src/grid_localizer.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/parallels/Desktop/demos/grid_localizer_1/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o"
	cd /home/parallels/Desktop/demos/grid_localizer_1/build/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o -c /home/parallels/Desktop/demos/grid_localizer_1/src/grid_localizer.cpp

src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/grid_localizer.dir/grid_localizer.cpp.i"
	cd /home/parallels/Desktop/demos/grid_localizer_1/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/parallels/Desktop/demos/grid_localizer_1/src/grid_localizer.cpp > CMakeFiles/grid_localizer.dir/grid_localizer.cpp.i

src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/grid_localizer.dir/grid_localizer.cpp.s"
	cd /home/parallels/Desktop/demos/grid_localizer_1/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/parallels/Desktop/demos/grid_localizer_1/src/grid_localizer.cpp -o CMakeFiles/grid_localizer.dir/grid_localizer.cpp.s

src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o.requires:
.PHONY : src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o.requires

src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o.provides: src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/grid_localizer.dir/build.make src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o.provides.build
.PHONY : src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o.provides

src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o.provides.build: src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o

src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o: src/CMakeFiles/grid_localizer.dir/flags.make
src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o: ../src/grid_localizer_main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/parallels/Desktop/demos/grid_localizer_1/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o"
	cd /home/parallels/Desktop/demos/grid_localizer_1/build/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o -c /home/parallels/Desktop/demos/grid_localizer_1/src/grid_localizer_main.cpp

src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.i"
	cd /home/parallels/Desktop/demos/grid_localizer_1/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/parallels/Desktop/demos/grid_localizer_1/src/grid_localizer_main.cpp > CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.i

src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.s"
	cd /home/parallels/Desktop/demos/grid_localizer_1/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/parallels/Desktop/demos/grid_localizer_1/src/grid_localizer_main.cpp -o CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.s

src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o.requires:
.PHONY : src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o.requires

src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o.provides: src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/grid_localizer.dir/build.make src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o.provides.build
.PHONY : src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o.provides

src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o.provides.build: src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o

# Object files for target grid_localizer
grid_localizer_OBJECTS = \
"CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o" \
"CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o"

# External object files for target grid_localizer
grid_localizer_EXTERNAL_OBJECTS =

../bin/grid_localizer: src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o
../bin/grid_localizer: src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o
../bin/grid_localizer: src/CMakeFiles/grid_localizer.dir/build.make
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_ts.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
../bin/grid_localizer: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
../bin/grid_localizer: src/CMakeFiles/grid_localizer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../../bin/grid_localizer"
	cd /home/parallels/Desktop/demos/grid_localizer_1/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/grid_localizer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/grid_localizer.dir/build: ../bin/grid_localizer
.PHONY : src/CMakeFiles/grid_localizer.dir/build

src/CMakeFiles/grid_localizer.dir/requires: src/CMakeFiles/grid_localizer.dir/grid_localizer.cpp.o.requires
src/CMakeFiles/grid_localizer.dir/requires: src/CMakeFiles/grid_localizer.dir/grid_localizer_main.cpp.o.requires
.PHONY : src/CMakeFiles/grid_localizer.dir/requires

src/CMakeFiles/grid_localizer.dir/clean:
	cd /home/parallels/Desktop/demos/grid_localizer_1/build/src && $(CMAKE_COMMAND) -P CMakeFiles/grid_localizer.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/grid_localizer.dir/clean

src/CMakeFiles/grid_localizer.dir/depend:
	cd /home/parallels/Desktop/demos/grid_localizer_1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/parallels/Desktop/demos/grid_localizer_1 /home/parallels/Desktop/demos/grid_localizer_1/src /home/parallels/Desktop/demos/grid_localizer_1/build /home/parallels/Desktop/demos/grid_localizer_1/build/src /home/parallels/Desktop/demos/grid_localizer_1/build/src/CMakeFiles/grid_localizer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/grid_localizer.dir/depend

