# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(NeuralNetworkCore)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(neuralnetworkcoretest SHARED ExportsApiTest.cpp NeuralNetworkCoreTest.cpp NeuralNetworkRuntimeTest.cpp
                                            NeuralNetworkRuntimeTypeTest.cpp NeuralNetworkTensorTypeTest.cpp)
target_link_libraries(neuralnetworkcoretest PUBLIC libace_napi.z.so libhilog_ndk.z.so libneural_network_core.so
                                                       libneural_network_runtime.so)