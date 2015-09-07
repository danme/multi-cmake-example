cmake_minimum_required(VERSION 3.3)

# includes (CMake)

# dependencies
# find_package(...)

###
# Test targets
###

# targets
add_executable(test_liba TestLibA.cpp)
target_compile_features(test_liba
	PRIVATE cxx_auto_type)
target_link_libraries(test_liba
	PRIVATE UpstreamA::lib)

###
# Tests
###

add_test(use_liba_library test_liba)

