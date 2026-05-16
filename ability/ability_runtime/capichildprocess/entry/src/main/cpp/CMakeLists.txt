# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(capichildprocess)

set(CMAKE_CXX_STANDARD 17)
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED
    hello.cpp
    IpcProxy.cpp
    IpcStub.cpp
    ChildProcess.cpp
    native_child_demo.cpp
)

target_link_libraries(entry PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libchild_process.so
    libipc_capi.so
)

add_library(invalidstub SHARED
    InvalidStubLib.cpp
)

target_link_libraries(invalidstub PUBLIC
    libhilog_ndk.z.so
    libchild_process.so
)

add_library(busytest SHARED
    BusyTest.cpp
)

target_link_libraries(busytest PUBLIC
    libhilog_ndk.z.so
    libchild_process.so
)
