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
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} A ADevel PARENT_SCOPE)

# names & descriptions
set(CPACK_COMPONENT_A_DISPLAY_NAME "Core Adapter A" PARENT_SCOPE)
set(CPACK_COMPONENT_A_DESCRIPTION "Adpater for the Base core library conforming to the A interface." PARENT_SCOPE)

# requireds

# dependencies
set(CPACK_COMPONENT_A_DEPENDS Core PARENT_SCOPE)
set(CPACK_COMPONENT_ADEVEL_DEPENDS CoreDevel A PARENT_SCOPE)

# groups
# Runtime
set(CPACK_COMPONENT_A_GROUP "Runtime" PARENT_SCOPE)

# Development
set(CPACK_COMPONENT_ADEVEL_GROUP "Development" PARENT_SCOPE)

