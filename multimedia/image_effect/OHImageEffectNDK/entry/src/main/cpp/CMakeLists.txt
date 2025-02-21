# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.1)
project(OHImageEffectNDK)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
    ${NATIVERENDER_ROOT_PATH}/utils
)

add_library(imageEffect SHARED
    napi_init.cpp
    effect_filter_test.cpp
    imageEffect.cpp
    utils/common_utils.cpp
    utils/pixelmap_helper.cpp
)
target_link_libraries(imageEffect PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libimage_effect.so
    libpixelmap.so
    libnative_window.so
    libnative_buffer.so
    libpixelmap_ndk.z.so
    libimage_packer.so
    libimage_source.so
    libpicture.so
)