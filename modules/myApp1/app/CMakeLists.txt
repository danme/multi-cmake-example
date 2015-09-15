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
find_package(UpstreamA 0.0.1 REQUIRED)

###
# Target
###

# target
add_executable(myapp src/MyApp.cpp)
add_executable(MyApp1::myapp ALIAS myapp) # make the target accessible via its exported name
target_compile_features(myapp
	PRIVATE cxx_auto_type)
target_link_libraries(myapp
	PRIVATE UpstreamA::lib)

# target version properties
set_target_properties(myapp PROPERTIES
	OUTPUT_NAME myapp1
	VERSION ${MyApp1_VERSION})

###
# Install
###

# install core library (add to export targets)
install(TARGETS myapp
	EXPORT  myappTargets
	LIBRARY DESTINATION ${LibraryPackageLocation} COMPONENT MyApp
	ARCHIVE DESTINATION ${LibraryPackageLocation} COMPONENT MyAppDevel
	RUNTIME DESTINATION ${ExecutablePackageLocation} COMPONENT MyApp
	INCLUDES DESTINATION ${IncludePackageLocation} COMPONENT MyAppDevel)

###
# Export
###

# create targets file with paths into the build dir
export(EXPORT myappTargets
	FILE "${CMAKE_CURRENT_BINARY_DIR}/MyApp1Targets.cmake"
	NAMESPACE MyApp1::)

# create targets file with paths into the install dir
install(EXPORT myappTargets
	FILE MyApp1Targets.cmake
	NAMESPACE MyApp1::
	DESTINATION ${ConfigPackageLocation}
	COMPONENT MyAppDevel)

