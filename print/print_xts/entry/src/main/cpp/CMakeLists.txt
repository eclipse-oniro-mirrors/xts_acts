# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(print_xts)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED entry.cpp ohprint.cpp ohscan.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so  libohprint.so  libohscan.so)
