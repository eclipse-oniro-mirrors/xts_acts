# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsNncoreTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(nn_core_test SHARED
    NapiInitTest.cpp
    include/NNcoreUtilsTest.cpp
    HdiCompilationTest.cpp
    HdiExecutorTest.cpp
    HdiModelTest.cpp
    HdiTensorDescTest.cpp
    HdiTensorTest.cpp
)

target_link_libraries(nn_core_test PUBLIC 
    libace_napi.z.so 
    libhilog_ndk.z.so 
    libneural_network_runtime.so 
    libneural_network_core.so
)