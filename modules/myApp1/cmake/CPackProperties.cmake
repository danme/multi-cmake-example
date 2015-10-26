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
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_BINARY_DIR}/COPYING.txt")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_BINARY_DIR}/README.txt")
set(CPACK_RESOURCE_FILE_WELCOME "${CMAKE_CURRENT_BINARY_DIR}/WELCOME.txt")

set(CPACK_ARCHIVE_COMPONENT_INSTALL ON)
set(CPACK_COMPONENTS_GROUPING ONE_PER_GROUP)

# components
string(TOUPPER "${PROJECT_NAME}Devel" CompDUpper)

# names & descriptions
set(CPACK_COMPONENT_${CompDUpper}_DISPLAY_NAME "My App 1 Development" CACHE INTERNAL "" FORCE)
set(CPACK_COMPONENT_${CompDUpper}_DESCRIPTION "CMake support for MyApp1 package." CACHE INTERNAL "" FORCE)

# requireds

# dependencies

# groups
# Runtime

# Development
set(CPACK_COMPONENT_${CompDUpper}_GROUP "Development" CACHE INTERNAL "" FORCE)

