# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(AccountNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(netconnectiontest SHARED
            NetConnectionTest.cpp
            )
target_link_libraries(netconnectiontest PUBLIC
            libnet_http.so
            libace_napi.z.so
            libhilog_ndk.z.so
            libnet_connection.so
            libnet_websocket.so
            libnet_ssl.so
            )


add_library(nethttptest SHARED
            NetHttpTest.cpp
            )
target_link_libraries(nethttptest PUBLIC
            libnet_http.so
            libace_napi.z.so
            libhilog_ndk.z.so
            libnet_connection.so
            libnet_websocket.so
            libnet_ssl.so
            )
