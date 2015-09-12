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
  if (NOT ";${_supported_components};" MATCHES ${_comp})
    set(Base_FOUND False)
    set(Base_NOTFOUND_MESSAGE "Specified unsupported component: ${_comp}")
  endif()
  include("${CMAKE_CURRENT_LIST_DIR}/Base${_comp}Targets.cmake")
endforeach()
