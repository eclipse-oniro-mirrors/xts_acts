# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(initndk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(initndk SHARED initndk.cpp napi_helper.h native_common.h napi_helper.cpp)
target_link_libraries(initndk PUBLIC libace_napi.z.so libdeviceinfo_ndk.z.so libhilog_ndk.z.so libc.so libc++_shared.so)