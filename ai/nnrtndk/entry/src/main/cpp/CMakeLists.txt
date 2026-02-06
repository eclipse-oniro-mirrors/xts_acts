# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(nnrt)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(nnrtndk SHARED nnrtndk.cpp)
target_link_libraries(nnrtndk PUBLIC libace_napi.z.so libneural_network_runtime.so libneural_network_core.so libhilog_ndk.z.so)
