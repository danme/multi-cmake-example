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

