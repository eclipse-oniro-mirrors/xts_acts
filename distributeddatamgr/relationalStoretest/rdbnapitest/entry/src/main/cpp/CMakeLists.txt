# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(rdbNapiTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)
add_library(backup SHARED rdb_store_backup_test)
target_link_libraries(backup PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_rdb_ndk.z.so)

add_library(level SHARED rdb_store_level_test)
target_link_libraries(level PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_rdb_ndk.z.so)

add_library(predicates SHARED rdb_store_predicates_test)
target_link_libraries(predicates PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_rdb_ndk.z.so)
