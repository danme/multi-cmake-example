#!/bin/bash

BASE_DIR=$(cd $(dirname $0) && pwd)

# if you want to use the packages without providing a CMAKE_PREFIX_PATH
# export the build directories into cmake's user package registry

USER_PACKAGE_REGISTRY=${HOME}/.cmake/packages

BUILD_DIR="${BASE_DIR}/build/base"
PACKAGE_DIR="${USER_PACKAGE_REGISTRY}/base"
MD5=$(md5 -q -s "${BUILD_DIR}")
[ -d ${PACKAGE_DIR} ] || mkdir -p ${PACKAGE_DIR}
echo ${BUILD_DIR} > ${USER_PACKAGE_REGISTRY}/base/${MD5}

