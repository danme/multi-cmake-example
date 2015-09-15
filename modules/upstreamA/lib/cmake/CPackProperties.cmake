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

# CPack properties for libA

# components
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} Lib LibDevel PARENT_SCOPE)

# name & description
set(CPACK_COMPONENT_LIB_DISPLAY_NAME "Lib" PARENT_SCOPE)
set(CPACK_COMPONENT_LIBDEVEL_DISPLAY_NAME "Lib Development" PARENT_SCOPE)

# required
set(CPACK_COMPONENT_LIB_REQUIRED ON PARENT_SCOPE)

# dependencies
set(CPACK_COMPONENT_LIBDEVEL_DEPENDS UpstreamADevel Lib PARENT_SCOPE)

# groups
# Runtime
set(CPACK_COMPONENT_LIB_GROUP "Runtime" PARENT_SCOPE)

# Development
set(CPACK_COMPONENT_LIBDEVEL_GROUP "Development" PARENT_SCOPE)

