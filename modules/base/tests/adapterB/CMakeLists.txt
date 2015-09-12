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

cmake_minimum_required(VERSION 3.3)

# includes (CMake)

# dependencies
# find_package(...)

###
# Test targets
###

# targets
add_executable(test_adapterB TestAdapterB.cpp)
target_compile_features(test_adapterB
	PRIVATE cxx_auto_type)
target_link_libraries(test_adapterB
	PRIVATE Base::adapterB)

###
# Tests
###

add_test(use_adapterB_library test_adapterB)

