# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsAudioDecoderTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(
entry
SHARED
NapiInitTest.cpp
CommonToolTest.cpp
NullCheckTest.cpp
ParamCheckTest.cpp
StatusCheckTest.cpp
AvcodecAudioAvBufferDecoderDemoTest.cpp
)
target_link_libraries(
entry
PUBLIC
libace_napi.z.so
libnative_media_codecbase.so
libnative_media_core.so
libnative_media_avsource.so
libnative_media_acodec.so
libnative_media_avdemuxer.so
libnative_media_codecbase.so
libhilog_ndk.z.so
)