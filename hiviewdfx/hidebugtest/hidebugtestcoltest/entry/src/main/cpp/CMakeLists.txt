# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication9)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(hidebugndk SHARED hidebugndk.cpp)
target_link_libraries(hidebugndk PUBLIC libace_napi.z.so libohhidebug.so libhilog_ndk.z.so libc++.so)