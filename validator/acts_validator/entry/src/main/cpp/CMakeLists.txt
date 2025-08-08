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


add_library(nativeKeyEvent SHARED
    keyEvent/container.cpp
    keyEvent/manager.cpp
    native_keyEventinit.cpp )

add_library(nativeDragAction SHARED
    NativeDragActionTest.cpp
    dragAction/ManagerTest.cpp
    dragAction/DataLoadingDragActionTest.cpp
    dragAction/ContainerTest.cpp )

add_library(nativeDragEvent SHARED
    NativeDragEventTest.cpp
    dragEvent/ManagerTest.cpp
    dragEvent/DataLoadingDragEventTest.cpp
    dragEvent/ContainerTest.cpp )


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

find_library(
    libnative_drawing

    native_drawing
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
target_link_libraries(nativeKeyEvent PUBLIC
    ${hilog-lib} ${libace-lib} ${libnapi-lib}  ${libnative_drawing})

target_link_libraries(nativeDragEvent PUBLIC libace_napi.z.so)
target_link_libraries(nativeDragEvent PUBLIC libace_ndk.z.so)
target_link_libraries(nativeDragEvent PUBLIC libnative_drawing.so)
target_link_libraries(nativeDragEvent PUBLIC libhilog_ndk.z.so)
target_link_libraries(nativeDragEvent PUBLIC libace_napi.z.so libhilog_ndk.z.so libpixelmap_ndk.z.so)
target_link_libraries(nativeDragEvent PUBLIC libhilog_ndk.z.so libpixelmap.so)
target_link_libraries(nativeDragEvent PUBLIC libudmf.so)
target_link_libraries(nativeDragEvent PUBLIC libohfileio.so)

target_link_libraries(nativeDragAction PUBLIC libace_napi.z.so)
target_link_libraries(nativeDragAction PUBLIC libace_ndk.z.so)
target_link_libraries(nativeDragAction PUBLIC libnative_drawing.so)
target_link_libraries(nativeDragAction PUBLIC libhilog_ndk.z.so)
target_link_libraries(nativeDragAction PUBLIC libace_napi.z.so libhilog_ndk.z.so libpixelmap_ndk.z.so)
target_link_libraries(nativeDragAction PUBLIC libhilog_ndk.z.so libpixelmap.so)
target_link_libraries(nativeDragAction PUBLIC libudmf.so)
target_link_libraries(nativeDragAction PUBLIC libohfileio.so)