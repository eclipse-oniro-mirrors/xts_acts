# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(nativehuksNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(nativehuksndk SHARED nativehuks/NapiRenderInitTest.cpp
nativehuks/HuksApiTest.cpp
nativehuks/HuksApi2Test.cpp
common/CommonTest.cpp)

target_link_libraries(nativehuksndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libhuks_ndk.z.so)