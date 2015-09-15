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

# CPack properties

# coponents
string(TOUPPER ${ComponentName} CompUpper)
string(TOUPPER ${ComponentDevelName} CompDUpper)

# names & descriptions
set(CPACK_COMPONENT_${CompUpper}_DISPLAY_NAME "Core Adapter B" CACHE INTERNAL "" FORCE)
set(CPACK_COMPONENT_${CompUpper}_DESCRIPTION "Adpater for the Base core library conforming to the B interface." CACHE INTERNAL "" FORCE)

# requireds

# dependencies
set(CPACK_COMPONENT_${CompUpper}_DEPENDS Basecore CACHE INTERNAL "" FORCE)
set(CPACK_COMPONENT_${CompDUpper}_DEPENDS BasecoreDevel ${ComponentName} CACHE INTERNAL "" FORCE)

# groups
# Runtime
set(CPACK_COMPONENT_${CompUpper}_GROUP "Runtime" CACHE INTERNAL "" FORCE)

# Development
set(CPACK_COMPONENT_${CompDUpper}_GROUP "Development" CACHE INTERNAL "" FORCE)

