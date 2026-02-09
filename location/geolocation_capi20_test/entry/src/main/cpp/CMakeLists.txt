# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsLocationCApi20Test)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(locationcapi20 SHARED GeoLocationCApi20Test.cpp)
target_link_libraries(locationcapi20 PUBLIC libace_napi.z.so liblocation_ndk.so)