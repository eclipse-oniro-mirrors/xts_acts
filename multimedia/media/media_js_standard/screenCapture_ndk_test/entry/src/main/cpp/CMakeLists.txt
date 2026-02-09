# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(avscreencapture)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(nativeAVScreenCapturendk SHARED nativeAVScreenCapturendk.cpp)
target_link_libraries(nativeAVScreenCapturendk PUBLIC libace_napi.z.so libnative_buffer.so libhilog_ndk.z.so libnative_avscreen_capture.so
libace_ndk.z.so libnative_media_codecbase.so libnative_media_core.so libnative_media_venc.so libnative_window.so libnative_media_avdemuxer.so
libnative_media_avsource.so libnative_image.so librawfile.z.so libnative_media_avmuxer.so libnative_media_adec.so libnative_media_aenc.so
libnative_media_vdec.so)