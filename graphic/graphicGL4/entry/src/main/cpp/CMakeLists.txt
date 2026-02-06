# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication9)

add_definitions(-DOHOS_PLATFORM)
add_definitions(-DGL_GLEXT_PROTOTYPES)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED Gl4ApiTest.cpp Gl4Test.cpp native_common.h)
target_link_libraries(entry PUBLIC libace_ndk.z.so libace_napi.z.so libhilog_ndk.z.so libEGL.so libGLv4.so)