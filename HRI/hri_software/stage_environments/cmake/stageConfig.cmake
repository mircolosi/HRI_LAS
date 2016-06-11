# - Try to find Stage
#
# Once done this will define
#
#  Stage_FOUND - system has Stage
#  Stage_INCLUDE_DIRS - the Stage include directory
#  Stage_LIBRARIES - the Stage libraries
#
# Written by William Woodall <william@osrfoundation.org>
#

find_package(PkgConfig)
pkg_check_modules(PC_STAGE stage)

find_library(STAGE_LIBRARIES
  NAMES ${PC_STAGE_LIBRARIES}
  PATHS ${PC_STAGE_LIBRARY_DIRS}
)

set(STAGE_INCLUDE_DIRS ${PC_STAGE_INCLUDE_DIRS})

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(Stage
	DEFAULT_MSG
	STAGE_LIBRARIES STAGE_INCLUDE_DIRS
)

mark_as_advanced(STAGE_LIBRARIES STAGE_INCLUDE_DIRS)

set(Stage_FOUND ${STAGE_FOUND})

