# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(AvMetadataExtractorNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(avmetadataextractorndk SHARED avmetadataextractor_ndk_test.cpp)
target_link_libraries(avmetadataextractorndk PUBLIC libavmetadata_extractor.so libace_napi.z.so libnative_media_core.so 
    libnative_media_codecbase.so libnative_media_venc.so libnative_window.so libavplayer.so libnative_image.so 
        libpixelmap.so libpixelmap_ndk.z.so libGLESv3.so libEGL.so libhilog_ndk.z.so)