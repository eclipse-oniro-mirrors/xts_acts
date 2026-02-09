# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(AccountNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)
add_library(avcode SHARED AVCode/AVCodeTest.cpp AVCode/AVCodeInitTest.cpp AVCode/AVCodeTwoTest.cpp
    AVCode/AVCodeThreeTest.cpp AVCode/AVCodeBaseTest.cpp AVCode/AVCodeBaseTwoTest.cpp AVCode/AVCodeBaseThreeTest.cpp
    AVCode/AVEncodeTest.cpp AVCode/AVDecodeTest.cpp)
target_link_libraries(avcode PUBLIC libace_napi.z.so libhilog_ndk.z.so libohaudio.so libnative_media_core.so
    libnative_media_codecbase.so libnative_media_venc.so libnative_media_vdec.so libnative_media_acodec.so
    libnative_media_adec.so libnative_media_avsource.so libnative_media_aenc.so  libnative_media_avcencinfo.so
    libnative_media_avdemuxer.so  libnative_media_avmuxer.so libnative_window.so libnative_buffer.so
    libnative_media_vdec.so)