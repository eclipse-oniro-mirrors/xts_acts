# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(windowManagerNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(windowndkapi20 SHARED
    common/CommonTest.cpp
    window/WindowManagerTest.cpp
    window/WindowTest.cpp
    window/WindowPipTest.cpp
    display/DisplayTest.cpp
    display/NativeDisplayManagerTest.cpp
    display/NativeDisplayManagerErrorCodeTest.cpp
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

target_link_libraries(windowndkapi20 PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib} libace_napi.z.so libnative_window_manager.so libnative_display_manager.so
    libohinput.so libpixelmap.so)

add_library(displaymanager SHARED displaymanager/DisplayManagerTest.cpp displaymanager/DisplayTest.cpp)
target_link_libraries(displaymanager PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_display_manager.so libace_ndk.z.so)

add_library(osaccountndk SHARED ArkuiNdkTest.cpp)
target_link_libraries(osaccountndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so
                    libace_ndk.z.so libace_ndk.z.so libnative_display_manager.so libace_ndk.z.so libpixelmap.so libudmf.so)