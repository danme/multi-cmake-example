cmake_minimum_required(VERSION 3.3)

# includes (CMake)

# dependencies
# find_package(...)

###
# Test targets
###

# targets
add_executable(test_core TestCore.cpp)
target_compile_features(test_core
	PRIVATE cxx_auto_type)
target_link_libraries(test_core
	PRIVATE base::core)

###
# Tests
###

add_test(use_core_library test_core)

