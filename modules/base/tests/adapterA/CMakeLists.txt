cmake_minimum_required(VERSION 3.3)

# includes (CMake)

# dependencies
# find_package(...)

###
# Test targets
###

# targets
add_executable(test_adapterA TestAdapterA.cpp)
target_compile_features(test_adapterA
	PRIVATE cxx_auto_type)
target_link_libraries(test_adapterA
	PRIVATE base::adapterA)

###
# Tests
###

add_test(use_adapterA_library test_adapterA)

