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

# dependencies
# not needed since we include the source directory directly
# find_package(UpstreamA 0.0.1 REQUIRED)

###
# Target
###

# target
add_executable(mysapp src/MyApp.cpp)
add_executable(MyStaticApp::mysapp ALIAS mysapp) # make the target accessible via its exported name
target_compile_features(mysapp
	PRIVATE cxx_auto_type)
target_link_libraries(mysapp
	PRIVATE UpstreamA::lib)

# target version properties
set_target_properties(mysapp PROPERTIES
	OUTPUT_NAME mysapp
	VERSION ${MyStaticApp_VERSION})

###
# Install
###

# install core library (add to export targets)
install(TARGETS mysapp
	EXPORT  mysappTargets
	LIBRARY DESTINATION ${LibraryPackageLocation} COMPONENT MySApp
	ARCHIVE DESTINATION ${LibraryPackageLocation} COMPONENT MySAppDevel
	RUNTIME DESTINATION ${ExecutablePackageLocation} COMPONENT MySApp
	INCLUDES DESTINATION ${IncludePackageLocation} COMPONENT MySAppDevel)

###
# Export
###

# create targets file with paths into the build dir
export(EXPORT mysappTargets
	FILE "${CMAKE_CURRENT_BINARY_DIR}/MySAppTargets.cmake"
	NAMESPACE MyStaticApp::)

# create targets file with paths into the install dir
install(EXPORT mysappTargets
	FILE MySAppTargets.cmake
	NAMESPACE MyStaticApp::
	DESTINATION ${ConfigPackageLocation}
	COMPONENT MySAppDevel)

