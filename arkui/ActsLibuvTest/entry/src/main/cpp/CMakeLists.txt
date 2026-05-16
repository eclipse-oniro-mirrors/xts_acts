# CMakeLists.txt for LibuvTest HAP
cmake_minimum_required(VERSION 3.4.1)
project(libuvtest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

# 添加头文件路径
include_directories(
    ${NATIVERENDER_ROOT_PATH}
    ${NATIVERENDER_ROOT_PATH}/include
)

# 编译 NAPI 模块
add_library(uvtest SHARED LibuvNapiTest.cpp)

# 链接必要的库
target_link_libraries(uvtest PUBLIC
    libace_napi.z.so
    libuv.so
    libhilog_ndk.z.so
)
