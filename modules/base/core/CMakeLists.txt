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
	INCLUDES DESTINATION include)

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
	FILE "${CMAKE_BINARY_DIR}/BaseCoreTargets.cmake"
	NAMESPACE Base::)

# create targets file with paths into the install dir
install(EXPORT coreTargets
	FILE BaseCoreTargets.cmake
	NAMESPACE Base::
	DESTINATION ${ConfigPackageLocation}
	COMPONENT CoreDevel)

