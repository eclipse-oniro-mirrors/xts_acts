# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(print_errorcode)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(printerrorcode SHARED ActsErrorCodeTest.cpp ActsPrintErrorCodeTest.cpp ActsScanErrorCodeTest.cpp)
target_link_libraries(printerrorcode PUBLIC libace_napi.z.so libohprint.so libohscan.so libhilog_ndk.z.so libffrt.z.so)