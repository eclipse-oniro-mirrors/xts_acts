# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(drm_ndk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED DrmNdkTest.cpp)

target_link_libraries(entry PUBLIC libace_napi.z.so libnative_drm.so libhilog_ndk.z.so)
