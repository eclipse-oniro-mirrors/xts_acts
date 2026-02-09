# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(font)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(nativeFontNdk SHARED nativeFontNdk.cpp nativeFontNdk1.cpp nativeFontNdk2.cpp
    NativeFontNdk5Test.cpp font_common.h native_common.h common.h log_common.h)

find_library(
    # Sets the name of the path variable.
    hilog-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    hilog_ndk.z
)

target_link_libraries(nativeFontNdk PUBLIC libace_napi.z.so libnative_drawing.so ${hilog-lib})