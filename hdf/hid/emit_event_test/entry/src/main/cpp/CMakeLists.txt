# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(musl)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(hidemiteventndk SHARED emit_event_ndk_test.cpp)
target_link_libraries(hidemiteventndk PUBLIC libace_napi.z.so libc++.a libhilog_ndk.z.so libhid.z.so)