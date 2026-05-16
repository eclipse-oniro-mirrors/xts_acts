# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsH263swDecoderTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(h263swdecoder_test SHARED 
    NapiInitTest.cpp
    FuncTest.cpp
    VideodecApi11SampleTest.cpp
    SecurecTest.cpp)

target_link_libraries(h263swdecoder_test PUBLIC 
    libace_napi.z.so
    libnative_media_codecbase.so
    libnative_media_core.so
    libnative_media_vdec.so)