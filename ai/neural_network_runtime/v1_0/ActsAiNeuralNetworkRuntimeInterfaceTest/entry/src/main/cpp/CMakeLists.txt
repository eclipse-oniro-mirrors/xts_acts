# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(AiNnrtInterface)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

# 包含头文件路径
include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${NATIVERENDER_ROOT_PATH}/common)

# 添加共享库
add_library(ai_nnrt_interface_test SHARED 
    CompileTest.cpp
    DeviceTest.cpp
    ExecutorTest.cpp
    MemoryTest.cpp
    ModelTest.cpp
    NnrtInterfaceNapiTest.cpp 
    common/NnrtUtilsTest.cpp)

# 链接必要的库
target_link_libraries(ai_nnrt_interface_test PUBLIC 
    libace_napi.z.so           # NAPI接口
    libhilog_ndk.z.so          # 日志系统
    libneural_network_core.so
     libneural_network_runtime.so

)

target_link_options(ai_nnrt_interface_test PRIVATE
    -Wl,--allow-shlib-undefined
    -Wl,--unresolved-symbols=ignore-all
)
