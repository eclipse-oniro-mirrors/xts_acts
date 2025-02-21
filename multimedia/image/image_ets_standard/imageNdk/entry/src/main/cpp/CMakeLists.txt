# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication2)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(ImageNdk SHARED ImageNdk.cpp)
target_link_libraries(ImageNdk PUBLIC libace_napi.z.so libimage_source.so libimage_packer.so libpixelmap.so libhilog_ndk.z.so)