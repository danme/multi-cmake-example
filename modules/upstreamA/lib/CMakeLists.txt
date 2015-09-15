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

# target variables
set(TargetName lib)
set(ExportsName libTargets)
# install components
set(ComponentName Lib)
set(ComponentDevelName LibDevel)
# targets-file name is usually "<package name><component name>Targets.cmake"
# see CPackProperties.cmake and The ...Config.cmake file for the components usage
set(TargetsFilename UpstreamALibTargets.cmake)
# sources
set(TargetSources src/LibA.cpp)
set(TargetHeaders ${IncludePackageLocation}/LibA.h)

# includes (CMake)
include(cmake/CPackProperties.cmake)
include(GenerateExportHeader)

# dependencies
find_package(Base 0.0.1 REQUIRED COMPONENTS A)

###
# Target
###

# target
add_library(${TargetName} ${TargetSources})
# make target accessible via its exported name
add_library(${PackageNamespace}${TargetName} ALIAS ${TargetName})
generate_export_header(${TargetName}
	EXPORT_FILE_NAME ${CMAKE_CURRENT_BINARY_DIR}/${IncludePackageLocation}/${TargetName}_export.h)
target_compile_features(${TargetName}
	PRIVATE cxx_auto_type)
target_include_directories(${TargetName}
	PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/include>
		$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)
target_link_libraries(${TargetName}
	PRIVATE Base::adapterA)

# target version properties
# define unique names and versions here !!!
set_target_properties(${TargetName} PROPERTIES
	OUTPUT_NAME upstreamalib # <-- unique install name
	VERSION ${UpstreamA_VERSION}
	SOVERSION 0
	INTERFACE_${TargetName}_MAJOR_VERSION 0) # <-- target name is part of the property
set_property(TARGET ${TargetName} APPEND PROPERTY
	COMPATIBLE_INTERFACE_STRING ${TargetName}_MAJOR_VERSION)

###
# Install
###

# install library (add to export targets)
# INCLUDES defines the include directories after installation,
# we use the same path in dev as in installation with the origin include
install(TARGETS ${TargetName}
	EXPORT  ${ExportsName}
	LIBRARY DESTINATION ${LibraryPackageLocation} COMPONENT ${ComponentName}
	ARCHIVE DESTINATION ${LibraryPackageLocation} COMPONENT ${ComponentDevelName}
	RUNTIME DESTINATION ${ExecutablePackageLocation} COMPONENT ${ComponentName}
	INCLUDES DESTINATION include)

# install library headers for development
install(FILES ${TargetHeaders}
		"${CMAKE_CURRENT_BINARY_DIR}/${IncludePackageLocation}/${TargetName}_export.h"
	DESTINATION ${IncludePackageLocation}
	COMPONENT ${ComponentDevelName})

###
# Export
###

# create targets file with paths into the build dir
export(EXPORT ${ExportsName}
	FILE "${CMAKE_CURRENT_BINARY_DIR}/${TargetsFilename}"
	NAMESPACE ${PackageNamespace})

# create targets file with paths into the install dir
install(EXPORT ${ExportsName}
	FILE ${TargetsFilename}
	NAMESPACE ${PackageNamespace}
	DESTINATION ${ConfigPackageLocation}
	COMPONENT ${ComponentDevelName})

