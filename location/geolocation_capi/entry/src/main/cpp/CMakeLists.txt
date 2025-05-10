# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(geolocationcapi)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(geolocationcapi SHARED geolocationcapi.cpp)
target_link_libraries(geolocationcapi PUBLIC libace_napi.z.so liblocation_ndk.so)