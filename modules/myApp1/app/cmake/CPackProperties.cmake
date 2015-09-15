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
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} MyApp MyAppDevel PARENT_SCOPE)

# name & description
set(CPACK_COMPONENT_MYAPP_DISPLAY_NAME "App 1" PARENT_SCOPE)
set(CPACK_COMPONENT_MYAPPDEVEL_DISPLAY_NAME "App 1 Development" PARENT_SCOPE)

# required
set(CPACK_COMPONENT_MYAPP_REQUIRED ON PARENT_SCOPE)

# dependencies
set(CPACK_COMPONENT_MYAPPDEVEL_DEPENDS MyApp1Devel MyApp PARENT_SCOPE)

# groups
# Runtime
set(CPACK_COMPONENT_MYAPP_GROUP "Runtime" PARENT_SCOPE)

# Development
set(CPACK_COMPONENT_MYAPPDEVEL_GROUP "Development" PARENT_SCOPE)

