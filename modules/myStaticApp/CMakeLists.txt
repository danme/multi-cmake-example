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

# Package configuration
project(MyStaticApp CXX)

# includes
include(cmake/CPackProperties.cmake)
include(CTest)
include(CMakePackageConfigHelpers)

# package variables
set(MyStaticApp_VERSION 0.0.2)
set(ExecutablePackageLocation bin)
set(LibraryPackageLocation lib/mystaticapp)
set(IncludePackageLocation include/mystaticapp)
set(ConfigPackageLocation lib/cmake/mystaticapp)

###
# Dependencies
###

add_subdirectory(base)
add_subdirectory(upstreamA)

###
# Targets
# subprojects / components containing the targets
# the targets contribute to baseTargets for exports and installs
###
add_subdirectory(app)

# tests
if(BUILD_TESTING)
	add_subdirectory(tests)
endif()

###
# Versioning
# create version file for base package
###
write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/MyStaticAppConfigVersion.cmake"
	VERSION ${MyStaticApp_VERSION}
	COMPATIBILITY AnyNewerVersion)

###
# Export
###

# create cmake files in build directory to use the build directly
# copy config for use of the build dir
configure_file(cmake/MyApp1Config.cmake
	"${CMAKE_CURRENT_BINARY_DIR}/MyStaticAppConfig.cmake"
	COPYONLY)
# CPack - license
configure_file(COPYING
	"${CMAKE_CURRENT_BINARY_DIR}/COPYING.txt"
	COPYONLY)
# CPack - readme
configure_file(README
	"${CMAKE_CURRENT_BINARY_DIR}/README.txt"
	COPYONLY)
# CPack - welcome
configure_file(WELCOME
	"${CMAKE_CURRENT_BINARY_DIR}/WELCOME.txt"
	COPYONLY)

###
# Install
###

# create cmake files in install directory
# copy config for development use of the installed version
install(FILES cmake/MyApp1Config.cmake
	"${CMAKE_CURRENT_BINARY_DIR}/MyStaticAppConfigVersion.cmake"
	DESTINATION ${ConfigPackageLocation}
	COMPONENT MyStaticAppDevel)

###
# Packaging
###

# exceptional include at the end for CPack (special case)
include(CPack)

