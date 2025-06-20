# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(nativewindow)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(nativewindow SHARED nativewindow.cpp nativewindow1.cpp nativewindow2.cpp nativewindow3.cpp)
target_link_libraries(nativewindow PUBLIC libace_napi.z.so libnative_window.so libnative_buffer.so libnative_image.so libace_ndk.z.so libEGL.so libGLESv3.so libipc_capi.so libhilog_ndk.z.so)
