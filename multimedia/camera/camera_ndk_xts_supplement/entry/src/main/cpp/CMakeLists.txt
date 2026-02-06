# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED CameraMainTest.cpp  CameraSessionNdkTest.cpp CameraNdkTest.cpp)

target_link_libraries(entry PUBLIC
    libace_napi.z.so
    libohcamera.so
    libhilog_ndk.z.so
    libohcamera.so
)