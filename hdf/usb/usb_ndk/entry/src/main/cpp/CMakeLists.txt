# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(musl)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(usbddkndk SHARED usbddk.cpp)
target_link_libraries(usbddkndk PUBLIC libace_napi.z.so libc++.a libhilog_ndk.z.so libusb_ndk.z.so libddk_base.z.so libscsi.z.so libusb_serial_ndk.z.so)