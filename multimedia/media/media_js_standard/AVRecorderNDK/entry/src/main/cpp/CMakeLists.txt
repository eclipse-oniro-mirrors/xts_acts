# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(tmp)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(avrecorderndk SHARED avrecorder_ndk_test.cpp)
target_link_libraries(avrecorderndk PUBLIC libace_napi.z.so libavrecorder.so
libnative_media_core.so libnative_media_codecbase.so libnative_media_venc.so
libnative_window.so libavplayer.so libnative_image.so libGLESv3.so libEGL.so
libace_napi.z.so libnative_buffer.so libhilog_ndk.z.so
librawfile.z.so
)