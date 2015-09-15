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
project(UpstreamA CXX)

# includes
include(cmake/CPackProperties.cmake)
include(CTest)
include(CMakePackageConfigHelpers)

# package variables
set(UpstreamA_VERSION 0.0.1)
set(ExecutablePackageLocation bin)
set(LibraryPackageLocation lib)
set(IncludePackageLocation include/upstreamA)
set(ConfigPackageLocation lib/cmake/upstreamA)
set(PackageNamespace UpstreamA::)

###
# Targets
# subprojects / components containing the targets
# the targets contribute to baseTargets for exports and installs
###
add_subdirectory(lib)

# tests
if(BUILD_TESTING)
	add_subdirectory(tests)
endif()

###
# Versioning
# create version file for base package
###
write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/UpstreamAConfigVersion.cmake"
	VERSION ${UpstreamA_VERSION}
	COMPATIBILITY AnyNewerVersion)

###
# Export
###

# create cmake files in build directory to use the build directly
# copy config for use of the build dir
configure_file(cmake/UpstreamAConfig.cmake
	"${CMAKE_CURRENT_BINARY_DIR}/UpstreamAConfig.cmake"
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
install(FILES cmake/UpstreamAConfig.cmake
		"${CMAKE_CURRENT_BINARY_DIR}/UpstreamAConfigVersion.cmake"
	DESTINATION ${ConfigPackageLocation}
	COMPONENT UpstreamADevel)

###
# Packaging
###

# exceptional include at the end for CPack (special case)
include(CPack)

