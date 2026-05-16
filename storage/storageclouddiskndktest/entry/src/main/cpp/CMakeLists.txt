# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(clouddisk_ndk_test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(clouddisk SHARED CloudDiskTest.cpp)
target_link_libraries(clouddisk PUBLIC libace_napi.z.so libace_ndk.z.so libohclouddiskmanager.so libohfileuri.so libnative_rdb_ndk.z.so libohpreferences.so libhilog_ndk.z.so)