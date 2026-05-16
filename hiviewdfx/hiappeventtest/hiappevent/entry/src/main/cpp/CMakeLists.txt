# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(PerformanceAnalysisKit)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED PerformanceAnalysisKitTest.cpp HiappeventTest.cpp HicollieTest.cpp PerformanceTest.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so
                    libace_ndk.z.so libace_ndk.z.so libnative_display_manager.so libace_ndk.z.so libhiappevent_ndk.z.so libohhicollie.so libhitrace_ndk.z.so libohhidebug.so)