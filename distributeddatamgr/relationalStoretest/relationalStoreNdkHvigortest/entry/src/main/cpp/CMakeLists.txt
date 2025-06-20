# the minimum version of CMake.
cmake_minimum_required(VERSION 3.4.1)
project(MyApplication7002)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED napi_init.cpp)

target_link_libraries(entry PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libnative_rdb_ndk.z.so
)

add_library(rdbvalue SHARED rdb_store_value.cpp)
target_link_libraries(rdbvalue PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libnative_rdb_ndk.z.so
)

add_library(transaction SHARED transactionNdk.cpp)
target_link_libraries(transaction PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libnative_rdb_ndk.z.so
)

add_library(rdbvector SHARED rdbVector.cpp)
target_link_libraries(rdbvector PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libnative_rdb_ndk.z.so
)

add_library(cryptoParam SHARED rdb_crypto_param_test.cpp)
target_link_libraries(cryptoParam PUBLIC
     libace_napi.z.so
     libhilog_ndk.z.so
     libnative_rdb_ndk.z.so
)

add_library(interfacetest SHARED RdbInterfaceTest.cpp)
target_link_libraries(interfacetest PUBLIC 
     libace_napi.z.so 
     libhilog_ndk.z.so 
     libnative_rdb_ndk.z.so
)