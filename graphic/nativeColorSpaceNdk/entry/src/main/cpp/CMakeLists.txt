# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(colorSpace)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(colorSpaceNdk SHARED colorSpaceNdk.cpp)
target_link_libraries(colorSpaceNdk PUBLIC libace_napi.z.so libnative_color_space_manager.so libhilog_ndk.z.so)