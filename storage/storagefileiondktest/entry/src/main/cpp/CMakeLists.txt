# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(fileio_ndk_test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(fileio SHARED fileio.cpp)
target_link_libraries(fileio PUBLIC libace_napi.z.so libohfileio.so libhilog_ndk.z.so)