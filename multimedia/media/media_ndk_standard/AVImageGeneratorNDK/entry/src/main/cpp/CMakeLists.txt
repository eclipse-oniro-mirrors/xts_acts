# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(tmp)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(avimagegeneratorndk SHARED avimagegenerator_ndk_test.cpp)
target_link_libraries(avimagegeneratorndk PUBLIC libavimage_generator.so libnative_image.so libpixelmap.so libpixelmap_ndk.z.so libace_napi.z.so)