# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)

project(gamecontrollerndk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

set(GAMECONTROLLER_SOURCES
    ${NATIVERENDER_ROOT_PATH}/acts/src/GameDeviceEventTest.cpp
    ${NATIVERENDER_ROOT_PATH}/acts/src/GameControllerRealTest.cpp
    ${NATIVERENDER_ROOT_PATH}/acts/src/GamePadEventTest.cpp
    ${NATIVERENDER_ROOT_PATH}/acts/src/GamePadTest.cpp
    ${NATIVERENDER_ROOT_PATH}/acts/src/GameDeviceTest.cpp
    ${NATIVERENDER_ROOT_PATH}/ExportsApiTest.cpp
)

set(FRAMEGENERATION_INCLUDE_DIRECTORIES
    ${NATIVERENDER_ROOT_PATH}/acts/include
)

add_library(entry SHARED ${GAMECONTROLLER_SOURCES})


target_link_libraries(entry PUBLIC libace_napi.z.so libace_ndk.z.so 
    libhilog_ndk.z.so libohgame_controller.z.so libuv.so)