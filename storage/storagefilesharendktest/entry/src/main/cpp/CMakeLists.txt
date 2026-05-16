# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(fileshare_ndk_test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(fileshare SHARED fileshare.cpp)
target_link_libraries(fileshare PUBLIC libace_napi.z.so libohfileshare.so libhilog_ndk.z.so)