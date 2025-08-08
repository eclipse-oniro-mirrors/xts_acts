# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(ImageGetMimeType)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(ImageGetMimeType SHARED ImageGetMimeTypeTest.cpp)
target_link_libraries(ImageGetMimeType PUBLIC libace_napi.z.so libhilog_ndk.z.so libohimage.so libimage_source.so
                      libpicture.so libimage_common.so libimage_packer.so libpixelmap.so
)