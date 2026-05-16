# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication9)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED  image_packer_module_test.cpp image_packing_test.cpp image_packer_module_test.h image_packing_test.h )
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_image.so libimage_packer.so libpixelmap.so libimage_packer_ndk.z.so)