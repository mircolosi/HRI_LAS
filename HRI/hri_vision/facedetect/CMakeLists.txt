project(facedetector)

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

find_package(OpenCV 2.4.6 REQUIRED)

include_directories(${PROJECT_BINARY_DIR})

add_executable (facedetector facedetect.cpp)
target_link_libraries (facedetector ${OpenCV_LIBS})
