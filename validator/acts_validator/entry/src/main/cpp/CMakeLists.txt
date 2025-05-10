# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(XComponent)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
add_definitions(-DOHOS_PLATFORM)

include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)

add_library(nativerender SHARED
    manager/plugin_manager.cpp
    manager/xcomponent_manager.cpp
    manager/AccessibilityManager.cpp
    napi_init.cpp
)

add_library(nativerender_ SHARED
    manager/plugin_manager.cpp
    manager/xcomponent_manager.cpp
    manager/AccessibilityManager_.cpp
    napi_init_.cpp
)

add_library(nativeNode SHARED
    capihand/container.cpp
    capihand/manager.cpp
    init.cpp )

add_library(nativegamecrontroller SHARED
    GameCtroller/container.cpp
    GameCtroller/manager.cpp
    native_gameinit.cpp )



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
    libnative_window

    native_window
)

find_library(
    libnative_drawing

    native_drawing
)


target_link_libraries(nativerender PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib}  ${libnative_window})
target_link_libraries(nativerender_ PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib}  ${libnative_window})
target_link_libraries(nativeNode PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib}  ${libnative_drawing})
target_link_libraries(nativegamecrontroller PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib}  ${libnative_drawing})    