# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(transactionTestApi20)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED TransactionTestApi20Test.cpp TransactionTest.cpp ValuesBucketTest.cpp RelationalStoreTest.cpp RdbErrorCodeTest.cpp CryptoParamTest.cpp PredicatesTest.cpp CursorTest.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so libnative_rdb_ndk.z.so)



