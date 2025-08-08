# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(photoAccess)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED main.cpp photoAccessHelper.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_image.so libimage_source.so libimage_source_ndk.z.so
librawfile.z.so libmedia_asset_manager.so libuv.so libpurgeable_memory_ndk.z.so libc.so libimage_common.so libimage_effect.so libimage_ndk.z.so libimage_packer.so libimage_packer_ndk.z.so
libimage_receiver.so libimage_receiver_ndk.z.so libohimage.so libnative_media_acodec.so libnative_media_adec.so libnative_media_aenc.so libnative_media_avcencinfo.so
libnative_media_avdemuxer.so libnative_media_avmuxer.so libnative_media_avsource.so libnative_media_codecbase.so libnative_media_core.so libnative_media_vdec.so libnative_media_venc.so)