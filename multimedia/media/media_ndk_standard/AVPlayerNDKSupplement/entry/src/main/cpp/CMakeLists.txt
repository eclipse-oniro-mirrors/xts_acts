# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(tmp)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(avplayerndk SHARED AvplayerNdkTest.cpp)
target_link_libraries(avplayerndk PUBLIC 
    libohaudio.so
    libace_napi.z.so
    libhilog_ndk.z.so
    libace_ndk.z.so
    libnative_window.so
    libnative_drm.so
    libavplayer.so
    libohfileuri.so
    libnative_media_core.so
    libnative_media_codecbase.so
    libavmedia_source.so
)