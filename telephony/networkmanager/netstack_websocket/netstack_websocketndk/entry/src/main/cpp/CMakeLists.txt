# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(netstack_websocket)
# 定义一个变量，并赋值为当前模块cpp目录
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()
# 添加头文件.h目录，包括cpp，cpp/include，告诉cmake去这里找到代码引入的头文件
include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)
# 声明一个产物libentry.so，SHARED表示产物为动态库，net_stack_ndk_test.cpp为产物的源代码
add_library(testNetStackWebsocketNdk SHARED net_stack_websocket_ndk_test.cpp)
# 声明产物entry链接时需要的三方库libace_napi.z.so
# 这里直接写三方库的名称是因为它是在ndk中，已在链接寻址路径中，无需额外声明
target_link_libraries(testNetStackWebsocketNdk PUBLIC libace_napi.z.so libhilog_ndk.z.so libnet_websocket.so libnet_ssl.so)

