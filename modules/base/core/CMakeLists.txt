cmake_minimum_required(VERSION 3.3)

# includes (CMake)
include(GenerateExportHeader)

# dependencies
# find_package(...)

###
# Target
###

# target
add_library(core BaseCore.cpp)
add_library(base::core ALIAS core) # make the target accessible via its exported name
generate_export_header(core)
target_compile_features(core
	PRIVATE cxx_auto_type)
target_include_directories(core
	PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
	INTERFACE $<INSTALL_INTERFACE:${IncludePackageLocation}>
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)

# target version properties
set_target_properties(core PROPERTIES
	VERSION ${base_VERSION}
	SOVERSION 0
	INTERFACE_core_MAJOR_VERSION 0)
set_property(TARGET core APPEND PROPERTY
	COMPATIBLE_INTERFACE_STRING core_MAJOR_VERSION)

###
# Install
###

# install core library
install(TARGETS core
	EXPORT  baseTargets
	LIBRARY DESTINATION ${LibraryPackageLocation}
	ARCHIVE DESTINATION ${LibraryPackageLocation}
	RUNTIME DESTINATION bin
	INCLUDES DESTINATION ${IncludePackageLocation}
	COMPONENT core)

# install core library headers for development
install(FILES BaseCore.h
		"${CMAKE_CURRENT_BINARY_DIR}/core_export.h"
	DESTINATION ${IncludePackageLocation}
	COMPONENT Devel)

