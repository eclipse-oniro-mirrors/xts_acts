# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(musl)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(baseddkndk SHARED base_ddk_test.cpp)
target_link_libraries(baseddkndk PUBLIC libace_napi.z.so libc++.a libhilog_ndk.z.so libddk_base.z.so)