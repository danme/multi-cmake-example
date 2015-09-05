cmake_minimum_required(VERSION 3.3)

# includes (CMake)
include(GenerateExportHeader)

# dependencies
# find_package(...)

###
# Target
###

# target
add_library(adapterA CoreAdapterA.cpp)
add_library(base::adapterA ALIAS adapterA) # make the target accessible via its exported name
generate_export_header(adapterA)
target_compile_features(adapterA
	PRIVATE cxx_auto_type)
target_include_directories(adapterA
	PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
	INTERFACE $<INSTALL_INTERFACE:${IncludePackageLocation}>
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>)
target_link_libraries(adapterA
	PUBLIC base::core)

# target version properties
set_target_properties(adapterA PROPERTIES
	VERSION ${base_VERSION}
	SOVERSION 0
	INTERFACE_adapterA_MAJOR_VERSION 0)
set_property(TARGET adapterA APPEND PROPERTY
	COMPATIBLE_INTERFACE_STRING adapterA_MAJOR_VERSION)

###
# Install
###

# install core library
install(TARGETS adapterA
	EXPORT  baseTargets
	LIBRARY DESTINATION ${LibraryPackageLocation}
	ARCHIVE DESTINATION ${LibraryPackageLocation}
	RUNTIME DESTINATION bin
	INCLUDES DESTINATION ${IncludePackageLocation}
	COMPONENT A)

# install core library headers for development
install(FILES CoreAdapterA.h
		"${CMAKE_CURRENT_BINARY_DIR}/core_export.h"
	DESTINATION ${IncludePackageLocation}
	COMPONENT Devel)

