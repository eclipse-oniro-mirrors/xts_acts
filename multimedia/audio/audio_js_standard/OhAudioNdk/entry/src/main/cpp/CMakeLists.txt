# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(OhAudioNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(ohaudiondk SHARED ohaudiondk.cpp)
target_link_libraries(ohaudiondk PUBLIC libace_napi.z.so libohaudio.so libhilog_ndk.z.so libOpenSLES.so)