# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication9)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED   eglndk.cpp native_common.h napi_helper.cpp native_common.h napi_helper.h)
target_link_libraries(entry PUBLIC libace_ndk.z.so libace_napi.z.so libGLESv3.so libEGL.so)