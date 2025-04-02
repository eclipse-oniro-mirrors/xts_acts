# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(windowNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)
set(CMAKE_CXX_STANDARD 17)

add_library(entry SHARED windowNdkTest.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so hilog_ndk.z libace_ndk.z.so libnative_window_manager.so libohinput.so libpixelmap.so 
libnative_image.so libnative_drawing.so)