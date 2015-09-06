# Package export configuration

###
# Dependencies
###

#include(CMakeFindDependencyMacro)
#find_dependency(<dep> <version>)

###
# Target includes
###

# must have includes
include("${CMAKE_CURRENT_LIST_DIR}/BaseCoreTargets.cmake")

# selectable components
set(_supported_components A B)

foreach(_comp ${Base_FIND_COMPONENTS})
  if (NOT ";${_supported_components};" MATCHES _comp)
    set(Base_FOUND False)
    set(Base_NOTFOUND_MESSAGE "Specified unsupported component: ${_comp}")
  endif()
  include("${CMAKE_CURRENT_LIST_DIR}/Base${_comp}Targets.cmake")
endforeach()
