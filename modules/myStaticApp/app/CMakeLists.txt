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

