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
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_BINARY_DIR}/COPYING.txt")
set(CPACK_RESOURCE_FILE_README "${CMAKE_CURRENT_BINARY_DIR}/README.txt")
set(CPACK_RESOURCE_FILE_WELCOME "${CMAKE_CURRENT_BINARY_DIR}/WELCOME.txt")

set(CPACK_ARCHIVE_COMPONENT_INSTALL ON)
set(CPACK_COMPONENTS_GROUPING ONE_PER_GROUP)

# coponents
# import components also from dependencies
set(CPACK_COMPONENTS_ALL BaseDevel CoreDevel ADevel UpstreamADevel LibDevel MyStaticAppDevel)

# names & descriptions
set(CPACK_COMPONENT_MYSTATICAPPDEVEL_DISPLAY_NAME "My App 1 Development")
set(CPACK_COMPONENT_MYSTATICAPPDEVEL_DESCRIPTION "CMake support for MyApp1 package.")

# requireds

# dependencies

# groups
# Runtime

# Development
set(CPACK_COMPONENT_MYSTATICAPPDEVEL_GROUP "Development")
set(CPACK_COMPONENT_BASEDEVEL_GROUP "Development")
set(CPACK_COMPONENT_COREDEVEL_GROUP "Development")
set(CPACK_COMPONENT_ADEVEL_GROUP "Development")
set(CPACK_COMPONENT_BDEVEL_GROUP "Development")
set(CPACK_COMPONENT_UPSTREAMADEVEL_GROUP "Development")
set(CPACK_COMPONENT_LIBDEVEL_GROUP "Development")

