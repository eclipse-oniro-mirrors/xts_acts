# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(storageenvironment_ndk_test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(environment SHARED environment.cpp)
target_link_libraries(environment PUBLIC libace_napi.z.so libohenvironment.so libhilog_ndk.z.so)