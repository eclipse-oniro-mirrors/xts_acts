# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(InputInjectKeyEvent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(inputinjectnopermissionndk SHARED OHInputInjectKeyEventTest.cpp InjectKeyEventTest.cpp)
target_link_libraries(inputinjectnopermissionndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so libohinput.so libnative_rdb_ndk.z.so)