# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsAudioCPPStandardTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(audio_cpp_standard_test SHARED 
    NapiInitTest.cpp
    ActsOpenslesPlayerNdkTest.cpp
    FileUtilsTest.cpp)
target_link_libraries(audio_cpp_standard_test PUBLIC libace_napi.z.so libOpenSLES.so libhilog_ndk.z.so)