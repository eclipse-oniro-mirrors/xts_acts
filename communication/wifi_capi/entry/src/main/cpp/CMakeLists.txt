# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(wificapi)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(wificapi SHARED napi_init.cpp)
target_link_libraries(wificapi PUBLIC libace_napi.z.so libwifi_ndk.so libhilog_ndk.z.so)