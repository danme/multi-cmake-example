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
set(LibraryPackageLocation lib)
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

