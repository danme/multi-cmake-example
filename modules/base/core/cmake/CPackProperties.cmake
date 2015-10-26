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

# CPack properties

# coponents
string(TOUPPER ${ComponentName} CompUpper)
string(TOUPPER ${ComponentDevelName} CompDUpper)

# names & descriptions
set(CPACK_COMPONENT_${CompUpper}_DISPLAY_NAME "Core"
  CACHE INTERNAL "" FORCE)
file(READ ${CMAKE_CURRENT_SOURCE_DIR}/doc/DESCRIPTION Description)
string(REGEX REPLACE "\n" " " Description "${Description}")
set(CPACK_COMPONENT_${CompUpper}_DESCRIPTION "${Description}"
  CACHE INTERNAL "" FORCE)

# requireds
set(CPACK_COMPONENT_${CompUpper}_REQUIRED ON CACHE INTERNAL "" FORCE)

# dependencies
set(CPACK_COMPONENT_${CompDUpper}_DEPENDS ${PROJECT_NAME}Devel ${ComponentName}
  CACHE INTERNAL "" FORCE)

# groups
# Runtime
set(CPACK_COMPONENT_${CompUpper}_GROUP "Runtime" CACHE INTERNAL "" FORCE)

# Development
set(CPACK_COMPONENT_${CompDUpper}_GROUP "Development" CACHE INTERNAL "" FORCE)
