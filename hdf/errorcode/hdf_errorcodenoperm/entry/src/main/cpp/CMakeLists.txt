# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(hdf_errorcodenoperm)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(baskddkerrorcodenoperm SHARED ActsErrorCodeTest.cpp ActsBaseDDkNoPermTest.cpp UsbDDkNoPermTest.cpp)
target_link_libraries(baskddkerrorcodenoperm PUBLIC libace_napi.z.so libhilog_ndk.z.so libc++.a libhid.z.so libqos.so
libipc_capi.so libddk_base.z.so libusb_ndk.z.so libscsi.z.so libusb_serial_ndk.z.so)