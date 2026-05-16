# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(bluetoothcapi)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(bluetoothcapi SHARED napi_init.cpp)
target_link_libraries(bluetoothcapi PUBLIC libace_napi.z.so libbluetooth_ndk.so libhilog_ndk.z.so)