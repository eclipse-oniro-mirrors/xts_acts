# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(relationalStoreNdktest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED rdb_test.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_rdb_ndk.z.so)

add_library(corrupted SHARED RdbCorruptedHandleTest.cpp NapiAsyncTest.cpp napi_async_call.h)
target_link_libraries(corrupted PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    libnative_rdb_ndk.z.so
)
add_library(rdbQuery SHARED QueryWithoutRowCountTest.cpp)
target_link_libraries(rdbQuery PUBLIC
 	libace_napi.z.so
 	libhilog_ndk.z.so
 	libnative_rdb_ndk.z.so
)
 	 
add_library(rdbTran SHARED TranQueryWithoutRowCountTest.cpp)
target_link_libraries(rdbTran PUBLIC
 	libace_napi.z.so
 	libhilog_ndk.z.so
 	libnative_rdb_ndk.z.so
)

