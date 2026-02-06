# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsZlibTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED ActsZlibTest.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libz.so libhilog_ndk.z.so libmindspore_lite_ndk.so)