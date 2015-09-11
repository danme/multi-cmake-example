cmake_minimum_required(VERSION 3.3)

# Package configuration
project(Base CXX)

# includes
include(cmake/CPackProperties.cmake)
include(CTest)
include(CMakePackageConfigHelpers)

# package variables
set(Base_VERSION 0.0.1)
set(ExecutablePackageLocation bin)
set(LibraryPackageLocation lib)
set(IncludePackageLocation include/base)
set(ConfigPackageLocation lib/cmake/base)

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
write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/BaseConfigVersion.cmake"
	VERSION ${Base_VERSION}
	COMPATIBILITY AnyNewerVersion)

###
# Export
###

# create cmake files in build directory to use the build directly
# copy config for use of the build dir
configure_file(cmake/BaseConfig.cmake
	"${CMAKE_CURRENT_BINARY_DIR}/BaseConfig.cmake"
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
install(FILES cmake/BaseConfig.cmake
		"${CMAKE_CURRENT_BINARY_DIR}/BaseConfigVersion.cmake"
	DESTINATION ${ConfigPackageLocation}
	COMPONENT BaseDevel)

###
# Packaging
###

# exception: CPack needs to be included at the end (special case)
include(CPack)

