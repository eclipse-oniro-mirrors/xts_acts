# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(InputNdkSystem)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(inputndksys SHARED inputndksys.cpp)
target_link_libraries(inputndksys PUBLIC libace_napi.z.so libohinput.so libhilog_ndk.z.so)