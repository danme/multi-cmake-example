# Copyright 2015 Daniel Menke
#
# This file is part of cmake-tutorial.
#
# cmake-tutorial is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# cmake-tutorial is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with cmake-tutorial.  If not, see <http://www.gnu.org/licenses/>.

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
add_library(adapterB src/CoreAdapterB.cpp)
add_library(Base::adapterB ALIAS adapterB) # make the target accessible via its exported name
generate_export_header(adapterB
	EXPORT_FILE_NAME ${CMAKE_CURRENT_BINARY_DIR}/include/base/adapterb_export.h)
target_compile_features(adapterB
	PRIVATE cxx_auto_type)
target_include_directories(adapterB
	PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)
target_link_libraries(adapterB
	PUBLIC Base::core)

# target version properties
set_target_properties(adapterB PROPERTIES
	OUTPUT_NAME baseadapterB
	VERSION ${Base_VERSION}
	SOVERSION 0
	INTERFACE_adapterB_MAJOR_VERSION 0)
set_property(TARGET adapterB APPEND PROPERTY
	COMPATIBLE_INTERFACE_STRING adapterB_MAJOR_VERSION)

###
# Install
###

# install core library
# shared libs: LIBRARY needed for runtime
# static libs: ARCHIVE needed for development
install(TARGETS adapterB
	EXPORT  adapterBTargets
	LIBRARY DESTINATION ${LibraryPackageLocation} COMPONENT B
	ARCHIVE DESTINATION ${LibraryPackageLocation} COMPONENT BDevel
	RUNTIME DESTINATION bin COMPONENT B
	INCLUDES DESTINATION include)

# install core library headers for development
install(FILES include/base/CoreAdapterB.h
		"${CMAKE_CURRENT_BINARY_DIR}/include/base/adapterb_export.h"
	DESTINATION ${IncludePackageLocation}
	COMPONENT BDevel)

###
# Export
###

# create targets file with paths into the build dir
export(EXPORT adapterBTargets
	FILE "${CMAKE_BINARY_DIR}/BaseBTargets.cmake"
	NAMESPACE Base::)

# create targets file with paths into the install dir
install(EXPORT adapterBTargets
	FILE BaseBTargets.cmake
	NAMESPACE Base::
	DESTINATION ${ConfigPackageLocation}
	COMPONENT BDevel)

