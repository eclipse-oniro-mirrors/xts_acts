# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsVpeVideoNativeHapTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(
    entry
    SHARED
    NapiInit.cpp
    CommonTool.cpp
    ApiTest.cpp
)
target_link_libraries(
    entry
    PUBLIC
    libace_napi.z.so
    libvideo_processing.so
    libnative_buffer.so
    libnative_window.so
    libnative_image.so
    libnative_media_core.so
    libhilog_ndk.z.so
)