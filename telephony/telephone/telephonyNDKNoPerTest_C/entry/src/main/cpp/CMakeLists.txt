# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(AccountNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(osaccountndk SHARED TelephonyNDK20Test.cpp)
target_link_libraries(osaccountndk PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so libtelephony_data.so libtelephony_radio.so)