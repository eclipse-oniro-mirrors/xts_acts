# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(basic_ndk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(pcsAudioTest SHARED pcsAudioTest.cpp)
target_link_libraries(pcsAudioTest PUBLIC libhilog_ndk.z.so libace_napi.z.so libnative_media_core.so
                        libnative_media_acodec.so libnative_media_codecbase.so)

add_library(pcsNetworkTest SHARED pcsNetworkTest.cpp)
target_link_libraries(pcsNetworkTest PUBLIC libace_napi.z.so libc++_shared.so)

add_library(softwareNdk SHARED softwareNdk.cpp)
target_link_libraries(softwareNdk PUBLIC libace_napi.z.so)

add_library(openglNdk SHARED openglNdk.cpp)
target_link_libraries(openglNdk PUBLIC libace_napi.z.so libGLESv3.so libEGL.so)