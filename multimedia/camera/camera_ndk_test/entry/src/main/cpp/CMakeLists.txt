# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED main.cpp camera_manager.cpp camera_manager_ndk.h)
target_link_libraries(entry PUBLIC libohcamera.so libace_napi.z.so libnative_buffer.so libhilog_ndk.z.so libavplayer.so)