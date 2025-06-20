# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(picture_ndk_xts)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(PictureNdk SHARED PictureNdk.cpp)
target_link_libraries(PictureNdk PUBLIC libace_napi.z.so libhilog_ndk.z.so libohimage.so libimage_source.so
                      libpicture.so libimage_common.so libimage_packer.so libpixelmap.so
)