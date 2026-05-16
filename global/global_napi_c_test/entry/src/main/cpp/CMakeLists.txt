# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication9)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED   globalnapi.gni  globalnapitest/GlobalNapi1Test.cpp
                                           globalnapitest/GlobalNapiFunTest.cpp
                                           globalnapitest/GlobalNapi2Test.cpp
                                           globalnapitest/GlobalNapi3Test.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so librawfile.z.so libohresmgr.so)