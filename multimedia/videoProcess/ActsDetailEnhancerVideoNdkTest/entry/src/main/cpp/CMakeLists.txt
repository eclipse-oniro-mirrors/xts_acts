# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsDetailEnhancerVideoNdkTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(
    entry
    SHARED
    NapiInitTest.cpp
    DetailEnhancerVideoNdkUnitTest.cpp
    OhosCommonTest.cpp
    VideoSampleTest.cpp
)
target_link_libraries(
    entry
    PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libnative_buffer.so
    libvideo_processing.so
    libnative_window.so
    libnative_media_core.so
    libnative_drawing.so
    libnative_image.so
)