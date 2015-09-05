cmake_minimum_required(VERSION 3.3)

# Package configuration
project(base CXX)

# includes
include(CPack)
include(CTest)
include(CMakePackageConfigHelpers)

# package variables
set(base_VERSION 0.0.1)
set(LibraryPackageLocation lib/base)
set(IncludePackageLocation include/base)

###
# Targets
# subprojects / components containing the targets
# the targets contribute to baseTargets for exports and installs
###
add_subdirectory(core)
#add_subdirectory(adapterA)
#add_subdirectory(adapterB)

# tests
if(BUILD_TESTING)
	add_subdirectory(tests/core)
endif()

###
# Versioning
# create version file for base package
###
write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/baseConfigVersion.cmake"
	VERSION ${base_VERSION}
	COMPATIBILITY AnyNewerVersion)

###
# Export
###

# create cmake files in build directory to use the build directly
# create targets file with paths into the build dir
export(EXPORT baseTargets
	FILE "${CMAKE_CURRENT_BINARY_DIR}/baseTargets.cmake"
	NAMESPACE base::)
# copy config for use of the build dir
configure_file(cmake/baseConfig.cmake
	"${CMAKE_CURRENT_BINARY_DIR}/baseConfig.cmake"
	COPYONLY)

###
# Install
###

# create cmake files in install directory
set(ConfigPackageLocation lib/cmake/base)
# create targets file with paths into the install dir
install(EXPORT baseTargets
	FILE baseTargets.cmake
	NAMESPACE base::
	DESTINATION ${ConfigPackageLocation})
# copy config for development use of the installed version
install(FILES cmake/baseConfig.cmake
		"${CMAKE_CURRENT_BINARY_DIR}/baseConfigVersion.cmake"
	DESTINATION ${ConfigPackageLocation}
	COMPONENT Devel)

