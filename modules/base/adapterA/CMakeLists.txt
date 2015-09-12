cmake_minimum_required(VERSION 3.3)

# includes (CMake)
include(cmake/CPackProperties.cmake)
include(GenerateExportHeader)

# dependencies
# find_package(...)

###
# Target
###

# target
add_library(adapterA src/CoreAdapterA.cpp)
add_library(Base::adapterA ALIAS adapterA) # make the target accessible via its exported name
generate_export_header(adapterA
	EXPORT_FILE_NAME ${CMAKE_CURRENT_BINARY_DIR}/include/base/adaptera_export.h)
target_compile_features(adapterA
	PRIVATE cxx_auto_type)
target_include_directories(adapterA
	PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)
target_link_libraries(adapterA
	PUBLIC Base::core)

# target version properties
set_target_properties(adapterA PROPERTIES
	OUTPUT_NAME baseadapterA
	VERSION ${Base_VERSION}
	SOVERSION 0
	INTERFACE_adapterA_MAJOR_VERSION 0)
set_property(TARGET adapterA APPEND PROPERTY
	COMPATIBLE_INTERFACE_STRING adapterA_MAJOR_VERSION)

###
# Install
###

# install core library
install(TARGETS adapterA
	EXPORT  adapterATargets
	LIBRARY DESTINATION ${LibraryPackageLocation} COMPONENT A
	ARCHIVE DESTINATION ${LibraryPackageLocation} COMPONENT ADevel
	RUNTIME DESTINATION bin COMPONENT A
	INCLUDES DESTINATION include)

# install core library headers for development
install(FILES include/base/CoreAdapterA.h
		"${CMAKE_CURRENT_BINARY_DIR}/include/base/adaptera_export.h"
	DESTINATION ${IncludePackageLocation}
	COMPONENT ADevel)

###
# Export
###

# create targets file with paths into the build dir
export(EXPORT adapterATargets
	FILE "${CMAKE_BINARY_DIR}/BaseATargets.cmake"
	NAMESPACE Base::)

# create targets file with paths into the install dir
install(EXPORT adapterATargets
	FILE BaseATargets.cmake
	NAMESPACE Base::
	DESTINATION ${ConfigPackageLocation}
	COMPONENT ADevel)

