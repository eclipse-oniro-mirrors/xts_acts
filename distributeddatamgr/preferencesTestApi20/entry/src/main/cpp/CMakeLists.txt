# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(preferences)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(preferencestest SHARED PreferencesTest.cpp)
target_link_libraries(preferencestest PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_rdb_ndk.z.so libohpreferences.so libc++_shared.so)

