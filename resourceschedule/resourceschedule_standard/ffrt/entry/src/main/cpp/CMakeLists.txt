# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(ffrtndk SHARED ffrtndk.cpp)
target_link_libraries(ffrtndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libffrt.z.so)