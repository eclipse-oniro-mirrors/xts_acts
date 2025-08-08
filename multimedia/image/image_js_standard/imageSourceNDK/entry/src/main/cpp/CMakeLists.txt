# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication9)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED   image_source_test.cpp image_source_test.h)
add_library(entryMDK SHARED   image_source_module_test.cpp image_source_module_test.h image_source_native_test.cpp image_source_native_test.h)
target_link_libraries(entry PUBLIC libace_napi.z.so libnative_image.so libimage_source_ndk.z.so libimage_source.so libimage_ndk.z.so libohimage.so libpixelmap_ndk.z.so libpixelmap.so libnative_media_acodec.so libnative_media_codecbase.so libhilog_ndk.z.so)
target_link_libraries(entryMDK PUBLIC libace_napi.z.so libnative_image.so libimage_source_ndk.z.so libimage_source.so libimage_ndk.z.so libohimage.so libpixelmap_ndk.z.so libpixelmap.so libnative_media_acodec.so libnative_media_codecbase.so libhilog_ndk.z.so)