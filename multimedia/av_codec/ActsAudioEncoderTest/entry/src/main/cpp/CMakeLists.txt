# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsAudioEncoderTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(audioencoder SHARED
NapiInitTest.cpp
NullCheckTest.cpp
ParamCheckTest.cpp
StatusCheck1Test.cpp
StatusCheck2Test.cpp
AvcodecAudioAvbufferEncoderDemoTest.cpp
 OhosCommonTest.cpp)

target_link_libraries(audioencoder PUBLIC libace_napi.z.so
libhilog_ndk.z.so
libnative_media_core.so
libnative_media_acodec.so
libnative_media_codecbase.so
libuv.so
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)