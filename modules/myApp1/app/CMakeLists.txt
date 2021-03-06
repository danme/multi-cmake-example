# Copyright 2015 Daniel Menke
#
# This file is part of multi-cmake-example.
#
# multi-cmake-example is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# multi-cmake-example is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with multi-cmake-example.  If not, see <http://www.gnu.org/licenses/>.

cmake_minimum_required(VERSION 3.3)

# target variables
# treat them as constants, later modification can lead to hard to track bugs.
set(TargetName myapp1)
set(ExportsName "${PROJECT_NAME}${TargetName}Targets")
# install components
# use a qualified name that is unlikely to colide when imported to external
# projects like <package name><target name>
set(ComponentName ${PROJECT_NAME}${TargetName})
set(ComponentDevelName ${PROJECT_NAME}${TargetName}Devel)
# targets-file
# targets-file name is usually "<package name><component key>Targets.cmake"
# see CPackProperties.cmake and The ...Config.cmake file for the components usage
# NOTE: the component key if a free string used in the Config file.
#       The install components do not imply the keys automatically.
set(TargetsFilename MyApp1Targets.cmake)
# output name
# this name is used for the output file like: lib<package>_<target>.so
# and must be designed to unlikely colide with existing files,
# since on Linux typically all libraries are installed in a central lib folder.
string(TOLOWER "${PROJECT_NAME}_${TargetName}" OutputName)

# sources
# collecting the sources at the beginning is often seen and can be usefull
# for example when generating Qt MOC files.
set(TargetSources src/MyApp.cpp)

# includes (CMake)
include(cmake/CPackProperties.cmake)

# dependencies
find_package(UpstreamA 0.0.1 REQUIRED)

###
# Target
###

# target
add_executable(${TargetName} ${TargetSources})
# make target accessible via its exported name
add_executable(${PackageNamespace}${TargetName} ALIAS ${TargetName})
target_compile_features(${TargetName}
	PRIVATE cxx_auto_type)

# linking
target_link_libraries(${TargetName}
	PRIVATE UpstreamA::lib)

# target version properties
set_target_properties(${TargetName} PROPERTIES
	OUTPUT_NAME ${OutputName}
	VERSION ${PROJECT_VERSION})

###
# Install
###

# install core library (add to export targets)
install(TARGETS ${TargetName}
	EXPORT  ${ExportsName}
	LIBRARY DESTINATION ${LibraryPackageLocation} COMPONENT ${ComponentName}
	ARCHIVE DESTINATION ${LibraryPackageLocation} COMPONENT ${ComponentDevelName}
	RUNTIME DESTINATION ${ExecutablePackageLocation} COMPONENT ${ComponentName}
	INCLUDES DESTINATION include)

###
# Export
###

# create targets file with paths into the build dir
export(EXPORT ${ExportsName}
	FILE "${CMAKE_BINARY_DIR}/${TargetsFilename}"
	NAMESPACE ${PackageNamespace})

# create targets file with paths into the install dir
install(EXPORT ${ExportsName}
	FILE ${TargetsFilename}
	NAMESPACE ${PackageNamespace}
	DESTINATION ${ConfigPackageLocation}
	COMPONENT ${ComponentDevelName})

