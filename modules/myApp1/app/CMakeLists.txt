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

