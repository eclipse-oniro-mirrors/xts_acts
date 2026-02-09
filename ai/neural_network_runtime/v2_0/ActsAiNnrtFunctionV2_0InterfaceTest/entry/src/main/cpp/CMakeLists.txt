# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsAiNnrtFunctionV2_0InterfaceTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(nnrt_function_v2_0_interface_test SHARED 
    NapiInitTest.cpp
    include/NnrtUtilsTest.cpp
)
target_link_libraries(nnrt_function_v2_0_interface_test PUBLIC libace_napi.z.so libhilog_ndk.z.so libneural_network_runtime.so libneural_network_core.so)