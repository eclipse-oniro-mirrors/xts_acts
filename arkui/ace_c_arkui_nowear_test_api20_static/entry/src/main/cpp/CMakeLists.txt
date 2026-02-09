# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)

add_library(entry SHARED
    AniTest.cpp
    manager/plugin_manager.cpp
    button/button_gettype_test.cpp
    drag/GetDisplayIdTest.cpp
    drag/GetDragSourceTest.cpp
    dropBadge/EnableDropDisallowedBadgeTest.cpp
)

find_library(
    # Sets the name of the path variable.
    hilog-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    hilog_ndk.z
)

find_library(
    # Sets the name of the path variable.
    libace-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    ace_ndk.z
)

find_library(
    # Sets the name of the path variable.
    libnapi-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    ace_napi.z
)

find_library(
    # Sets the name of the path variable.
    libuv-lib
    # Specifies the name of the NDK library that
    # you want CMake to locate.
    uv
)

target_link_libraries(entry PUBLIC
    libnative_drawing.so libpixelmap.so libace_napi.z.so libhilog_ndk.z.so ${hilog-lib} ${libace-lib} ${libnapi-lib} ${libuv-lib} libudmf.so)