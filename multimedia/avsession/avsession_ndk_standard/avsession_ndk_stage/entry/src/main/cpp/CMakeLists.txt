# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication9)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

# 需要使用到variant 设置使用 C++17 标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)  # 关闭编译器特定的扩展，使用标准 C++

add_library(entry SHARED AvsessionTest.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libohavsession.so libhilog_ndk.z.so)