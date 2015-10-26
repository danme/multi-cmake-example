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

# Package configuration
project(Base VERSION 0.0.1 LANGUAGES CXX)

# package variables
# destination paths for installation
set(ExecutablePackageLocation bin)
set(LibraryPackageLocation lib)
set(IncludePackageLocation include/base)
set(ConfigPackageLocation lib/cmake/base)
set(PackageNamespace "${PROJECT_NAME}::")

# workaround to disable CTest targets like Continuous Nightly etc. for CDash
# But we still want ctest to produce an output for our own Dashboard
set_property(GLOBAL PROPERTY CTEST_TARGETS_ADDED 1)

# includes
include(cmake/CPackProperties.cmake)
include(CTest)
include(CMakePackageConfigHelpers)

###
# Targets
# subprojects / components containing the targets
# the targets contribute to baseTargets for exports and installs
###
add_subdirectory(core)
add_subdirectory(adapterA)
add_subdirectory(adapterB)

# tests
if(BUILD_TESTING)
  add_subdirectory(tests/core)
  add_subdirectory(tests/adapterA)
  add_subdirectory(tests/adapterB)
endif()

###
# Versioning
# create version file for base package
###

# create a tweak version for the current day for development
string(TIMESTAMP Today "%y%m%d")
write_basic_package_version_file(
  "${CMAKE_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  VERSION ${PROJECT_VERSION}.${Today}
  COMPATIBILITY AnyNewerVersion)

###
# Export
###

# create cmake files in build directory
# putting the files in the build root enables the use of the build dir
# directly to find the package (PackageRegistry, CMAKE_PREFIX_PATH, ...)

# configure the package config using the targets components
get_property(RequiredPackageComponents GLOBAL PROPERTY
  ${PROJECT_NAME}ComponentsRequired)
get_property(OptionalPackageComponents GLOBAL PROPERTY
  ${PROJECT_NAME}ComponentsOptional)
configure_package_config_file(cmake/${PROJECT_NAME}Config.cmake.in
  "${CMAKE_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
  INSTALL_DESTINATION ${ConfigPackageLocation}
  NO_SET_AND_CHECK_MACRO)
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
install(FILES
    "${CMAKE_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    "${CMAKE_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  DESTINATION ${ConfigPackageLocation}
  COMPONENT ${PROJECT_NAME}Devel)

###
# Packaging
###

# exception: CPack needs to be included at the end
include(CPack)
