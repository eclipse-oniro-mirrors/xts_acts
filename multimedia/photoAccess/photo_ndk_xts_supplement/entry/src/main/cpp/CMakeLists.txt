# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.1)
project(MyApplication)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${NATIVERENDER_ROOT_PATH}/utils)

add_library(entry SHARED
    PhotoMainTest.cpp
    OHMediaAssetCreateTest.cpp
    OHMediaAssetManagerRequestTest.cpp
    MediaAssetManagerCancelRequestTest)

find_library(
    # Sets the name of the path variable.
    EGL-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    EGL
)

find_library(
    # Sets the name of the path variable.
    GLES-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    GLESv3
)
target_link_libraries(entry PUBLIC
    libace_napi.z.so
    libohcamera.so
    libhilog_ndk.z.so
    libmedia_asset_manager.so
    libimage_effect.so
    libpixelmap.so
    libnative_window.so
    libnative_buffer.so
    libpixelmap_ndk.z.so
    libimage_packer.so
    libpicture.so
    libimage_ndk.z.so
    libimage_source.so
    libimage_source_ndk.z.so
    libmedia_asset_manager.so
    libohcamera.so
    ${EGL-lib}
    ${GLES-lib}
)