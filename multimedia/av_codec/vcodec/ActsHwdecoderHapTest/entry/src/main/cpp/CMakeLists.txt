# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsHwdecoderHapTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(
    entry
    SHARED
    CommonTool.cpp
    JsonWrapper.cpp
    ApiTest.cpp
    Func2Test.cpp
    FuncTest.cpp
    Hwh265Hdr2sdrTest.cpp
    NapiInit.cpp
    StateTest.cpp
    VideoDecApi11Sample.cpp
    VideoDecNdkSample.cpp
)
target_link_libraries(
    entry
    PUBLIC
    libace_napi.z.so
    libnative_media_core.so
    libnative_buffer.so
    libnative_media_codecbase.so
    libvideo_processing.so
    libnative_media_vdec.so
    libnative_window.so
    libnative_image.so
    libohcrypto.so
    libhilog_ndk.z.so
)