# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(rdbNapiTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)
add_library(cursor SHARED rdb_store_cursor_test)
target_link_libraries(cursor PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_rdb_ndk.z.so)

add_library(encrypt SHARED rdb_store_encrypt_test)
target_link_libraries(encrypt PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_rdb_ndk.z.so)

add_library(rdbtest SHARED rdb_store_test)
target_link_libraries(rdbtest PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_rdb_ndk.z.so)
