# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(hilogndk SHARED hilogndk.cpp)
target_link_libraries(hilogndk PUBLIC libace_napi.z.so  libc++.a libhilog_ndk.z.so )