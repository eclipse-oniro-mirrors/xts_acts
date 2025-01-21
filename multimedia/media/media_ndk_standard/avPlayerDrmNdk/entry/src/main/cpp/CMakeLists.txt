# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(entry)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED hello.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libnative_drm.so libavplayer.so libhilog_ndk.z.so libnative_media_codecbase.so libnative_media_avdemuxer.so libnative_media_avsource.so libnative_media_core.so libnative_media_core.so libnative_media_acodec.so libnative_media_vdec.so)
