#!/bin/bash

CUR_DIR=$(cd $(dirname $0) && pwd)
cd $CUR_DIR

# build all example modules

cmake -E make_directory build
cd build

# dynamic libraries
# base
cmake -E make_directory base
cd base

if [ ! -f CMakeCache.txt ]
then
    cmake \
        -D CMAKE_INSTALL_PREFIX=${CUR_DIR}/install \
        -D CMAKE_PREFIX_PATH=${CUR_DIR}/install \
	-D BUILD_SHARED_LIBS=ON \
	-D CMAKE_BUILD_TYPE=Release \
	../../modules/base/
fi
cmake --build ./ --target all
cmake --build ./ --target install
cd ..

# upstream A
cmake -E make_directory upstreamA
cd upstreamA

if [ ! -f CMakeCache.txt ]
then
    cmake \
        -D CMAKE_INSTALL_PREFIX=${CUR_DIR}/install \
        -D CMAKE_PREFIX_PATH=${CUR_DIR}/install \
	-D BUILD_SHARED_LIBS=ON \
	-D CMAKE_BUILD_TYPE=Release \
	../../modules/upstreamA/
fi
cmake --build ./ --target all
cmake --build ./ --target install
cd ..

# my app 1
cmake -E make_directory myapp1
cd myapp1

if [ ! -f CMakeCache.txt ]
then
    cmake \
        -D CMAKE_INSTALL_PREFIX=${CUR_DIR}/install \
        -D CMAKE_PREFIX_PATH=${CUR_DIR}/install \
	-D BUILD_SHARED_LIBS=ON \
	-D CMAKE_BUILD_TYPE=Release \
	../../modules/myApp1/
fi
cmake --build ./ --target all
cmake --build ./ --target install
cd ..

# static libraries
# of course this app can also be build with shared libraries
# my static app
cmake -E make_directory mystaticapp
cd mystaticapp

if [ ! -f CMakeCache.txt ]
then
    cmake \
        -D CMAKE_INSTALL_PREFIX=${CUR_DIR}/install \
	-D CMAKE_BUILD_TYPE=Release \
	../../modules/myStaticApp/
fi
cmake --build ./ --target all
# Do not override the installed shared libraries in this example
# cmake --build ./ --target install
# Only install the Runtime component and not the development ones
cmake -D COMPONENT=MySApp -P cmake_install.cmake
cd ..

cd ..

# create packages as TGZ
cmake -E make_directory dist
cd dist

cpack -G TGZ --config ../build/base/CPackConfig.cmake
cpack -G TGZ --config ../build/upstreamA/CPackConfig.cmake
cpack -G TGZ --config ../build/myapp1/CPackConfig.cmake
cpack -G TGZ --config ../build/mystaticapp/CPackConfig.cmake

