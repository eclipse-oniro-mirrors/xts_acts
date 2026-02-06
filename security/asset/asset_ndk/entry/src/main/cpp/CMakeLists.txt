# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(assetNdkDevco2)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(assetndktest SHARED hello.cpp)
target_link_libraries(assetndktest PUBLIC libace_napi.z.so)
target_link_libraries(assetndktest PUBLIC libasset_ndk.z.so)