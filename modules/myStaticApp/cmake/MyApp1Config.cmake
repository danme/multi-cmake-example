# Package export configuration

###
# Dependencies
###

include(CMakeFindDependencyMacro)
find_dependency(UpstreamA 0.0.1)

###
# Target includes
###

# must have includes
include("${CMAKE_CURRENT_LIST_DIR}/MyApp1Targets.cmake")

