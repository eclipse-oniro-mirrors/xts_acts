# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsDemuxerTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(demuxer_test SHARED
    NapiInitTest.cpp
    FuncTest.cpp
    FuncHelperTest.cpp
    Func2Test.cpp
    ProcTest.cpp
    ApiTest.cpp
    DemuxerHelperTest.cpp
)
target_link_libraries(demuxer_test PUBLIC libace_napi.z.so libnative_media_codecbase.so libnative_media_core.so libnative_media_avmuxer.so libnative_media_avsource.so libnative_media_avdemuxer.so libhilog_ndk.z.so )