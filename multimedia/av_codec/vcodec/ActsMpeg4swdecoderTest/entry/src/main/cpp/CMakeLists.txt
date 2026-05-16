# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(mpeg4swdecoder)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry
SHARED
NapiInitTest.cpp
FuncTest.cpp
VideodecApi11SampleTest.cpp
include/FuncTest.h
include/VideodecApi11SampleTest.h)

target_link_libraries(entry PUBLIC libace_napi.z.so
 libnative_media_vdec.so
 libnative_media_core.so
 libnative_media_codecbase.so
 libnative_drawing.so
 libnative_window.so
 libnative_image.so
 libohcrypto.so
)