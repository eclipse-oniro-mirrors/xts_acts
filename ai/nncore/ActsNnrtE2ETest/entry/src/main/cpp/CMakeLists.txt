# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsNnrtE2ETest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${NATIVERENDER_ROOT_PATH}/common)

add_library(nnrt_e2e_test SHARED 
    NapiInitTest.cpp
    include/NNcoreUtilsTest.cpp
)

target_link_libraries(nnrt_e2e_test PUBLIC libace_napi.z.so libhilog_ndk.z.so libneural_network_runtime.so libneural_network_core.so )