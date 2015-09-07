cmake_minimum_required(VERSION 3.3)

# includes (CMake)
include(cmake/CPackProperties.cmake)
include(GenerateExportHeader)

# dependencies
find_package(Base 0.0.1 REQUIRED COMPONENTS A)

###
# Target
###

# target
add_library(libA src/LibA.cpp)
add_library(UpstreamA::lib ALIAS libA) # make the target accessible via its exported name
generate_export_header(libA
	EXPORT_FILE_NAME ${CMAKE_CURRENT_BINARY_DIR}/include/upstreamA/lib_export.h)
target_compile_features(libA
	PRIVATE cxx_auto_type)
target_include_directories(libA
	PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)
target_link_libraries(libA
	PRIVATE Base::adapterA)

# target version properties
set_target_properties(libA PROPERTIES
	OUTPUT_NAME upstreamalib
	VERSION ${UpstreamA_VERSION}
	SOVERSION 0
	INTERFACE_libA_MAJOR_VERSION 0)
set_property(TARGET libA APPEND PROPERTY
	COMPATIBLE_INTERFACE_STRING libA_MAJOR_VERSION)

###
# Install
###

# install core library (add to export targets)
install(TARGETS libA
	EXPORT  libATargets
	LIBRARY DESTINATION ${LibraryPackageLocation} COMPONENT Lib
	ARCHIVE DESTINATION ${LibraryPackageLocation} COMPONENT LibDevel
	RUNTIME DESTINATION ${ExecutablePackageLocation} COMPONENT Lib
	INCLUDES DESTINATION ${IncludePackageLocation} COMPONENT LibDevel)

# install core library headers for development
install(FILES include/base/LibA.h
		"${CMAKE_CURRENT_BINARY_DIR}/include/upstreamA/lib_export.h"
	DESTINATION ${IncludePackageLocation}
	COMPONENT LibDevel)

###
# Export
###

# create targets file with paths into the build dir
export(EXPORT libATargets
	FILE "${CMAKE_CURRENT_BINARY_DIR}/BaseCoreTargets.cmake"
	NAMESPACE UpstreamA::)

# create targets file with paths into the install dir
install(EXPORT libATargets
	FILE UpstreamALibTargets.cmake
	NAMESPACE UpstreamA::
	DESTINATION ${ConfigPackageLocation}
	COMPONENT LibDevel)

