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

# CPack properties for my app

# components
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} MySApp MySAppDevel CACHE INTERNAL "" FORCE)

# name & description
set(CPACK_COMPONENT_MYSAPP_DISPLAY_NAME "App S" CACHE INTERNAL "" FORCE)
set(CPACK_COMPONENT_MYSAPPDEVEL_DISPLAY_NAME "App S Development" CACHE INTERNAL "" FORCE)

# required
set(CPACK_COMPONENT_MYSAPP_REQUIRED ON CACHE INTERNAL "" FORCE)

# dependencies
set(CPACK_COMPONENT_MYSAPPDEVEL_DEPENDS MySAppDevel MySApp CACHE INTERNAL "" FORCE)

# groups
# Runtime
set(CPACK_COMPONENT_MYSAPP_GROUP "Runtime" CACHE INTERNAL "" FORCE)

# Development
set(CPACK_COMPONENT_MYSAPPDEVEL_GROUP "Development" CACHE INTERNAL "" FORCE)

