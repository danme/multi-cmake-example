cmake_minimum_required(VERSION 3.3)

# includes (CMake)
include(GenerateExportHeader)

# dependencies
# find_package(...)

###
# Target
###

# target
add_library(core src/BaseCore.cpp)
add_library(Base::core ALIAS core) # make the target accessible via its exported name
generate_export_header(core
	EXPORT_FILE_NAME ${CMAKE_CURRENT_BINARY_DIR}/include/base/core_export.h)
target_compile_features(core
	PRIVATE cxx_auto_type)
target_include_directories(core
	PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

# target version properties
set_target_properties(core PROPERTIES
	OUTPUT_NAME basecore
	VERSION ${Base_VERSION}
	SOVERSION 0
	INTERFACE_core_MAJOR_VERSION 0)
set_property(TARGET core APPEND PROPERTY
	COMPATIBLE_INTERFACE_STRING core_MAJOR_VERSION)

###
# Install
###

# install core library (add to export targets)
install(TARGETS core
	EXPORT  coreTargets
	LIBRARY DESTINATION ${LibraryPackageLocation} COMPONENT Core
	ARCHIVE DESTINATION ${LibraryPackageLocation} COMPONENT CoreDevel
	RUNTIME DESTINATION ${ExecutablePackageLocation} COMPONENT Core
	INCLUDES DESTINATION ${IncludePackageLocation} COMPONENT CoreDevel)

# install core library headers for development
install(FILES include/base/BaseCore.h
		"${CMAKE_CURRENT_BINARY_DIR}/include/base/core_export.h"
	DESTINATION ${IncludePackageLocation}
	COMPONENT CoreDevel)

###
# Export
###

# create targets file with paths into the build dir
export(EXPORT coreTargets
	FILE "${CMAKE_CURRENT_BINARY_DIR}/BaseCoreTargets.cmake"
	NAMESPACE Base::)

# create targets file with paths into the install dir
install(EXPORT coreTargets
	FILE BaseCoreTargets.cmake
	NAMESPACE Base::
	DESTINATION ${ConfigPackageLocation}
	COMPONENT CoreDevel)

