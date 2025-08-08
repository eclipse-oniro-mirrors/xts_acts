# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(InputNdkNormal)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(inputndk SHARED inputndk.cpp)
target_link_libraries(inputndk PUBLIC libace_napi.z.so libohinput.so libhilog_ndk.z.so)