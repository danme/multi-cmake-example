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

# CPack properties for my app

# components
string(TOUPPER ${ComponentName} CompUpper)
string(TOUPPER ${ComponentDevelName} CompDUpper)

# name & description
set(CPACK_COMPONENT_${CompUpper}_DISPLAY_NAME "App 1" CACHE INTERNAL "" FORCE)
set(CPACK_COMPONENT_${CompDUpper}_DISPLAY_NAME "App 1 Development" CACHE INTERNAL "" FORCE)

# required
set(CPACK_COMPONENT_${CompUpper}_REQUIRED ON CACHE INTERNAL "" FORCE)

# dependencies
set(CPACK_COMPONENT_${CompDUpper}_DEPENDS ${PROJECT_NAME}Devel ${ComponentName} CACHE INTERNAL "" FORCE)

# groups
# Runtime
set(CPACK_COMPONENT_${CompUpper}_GROUP "Runtime" CACHE INTERNAL "" FORCE)

# Development
set(CPACK_COMPONENT_${CompDUpper}_GROUP "Development" CACHE INTERNAL "" FORCE)

