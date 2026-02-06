# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication2)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(ImageNdk SHARED ImageNdkTest.cpp)

find_library(
    # Sets the name of the path variable.
    hilog-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    hilog_ndk.z
)

target_link_libraries(ImageNdk PUBLIC libace_napi.z.so libimage_source.so libimage_packer.so libpixelmap.so
 libpixelmap_ndk.z.so ${hilog-lib})