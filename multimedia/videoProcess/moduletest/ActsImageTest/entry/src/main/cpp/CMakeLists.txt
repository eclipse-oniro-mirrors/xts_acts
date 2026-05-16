# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsImageTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(imagetest SHARED
NapiInitTest.cpp
ApiTest.cpp)

target_link_libraries(imagetest PUBLIC libace_napi.z.so
libimage_processing.so
libnative_color_space_manager.so
libpixelmap.so
)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
