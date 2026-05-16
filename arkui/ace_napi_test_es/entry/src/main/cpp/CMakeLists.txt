cmake_minimum_required(VERSION 3.5)

project(napitest)
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH})
add_library(napitest SHARED ./napi/napi_test.cpp)

target_link_libraries(napitest PUBLIC libace_napi.z.so libuv.so libhilog_ndk.z.so)