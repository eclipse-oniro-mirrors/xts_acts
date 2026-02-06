# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(MyApplication9)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include
                    ${NATIVERENDER_ROOT_PATH}/cpp
                    ${NATIVERENDER_ROOT_PATH}/tee)

add_library(client_api_test1 SHARED test/ClientApi1Test.cpp)
target_link_libraries(client_api_test1 PUBLIC libace_napi.z.so)
target_link_libraries(client_api_test1 PUBLIC libhilog_ndk.z.so)
target_link_libraries(client_api_test1 PUBLIC libteec.so)
target_link_libraries(client_api_test1 PUBLIC -rdynamic -ldl)

add_library(client_api_test2 SHARED test/ClientApi2Test.cpp)
target_link_libraries(client_api_test2 PUBLIC libace_napi.z.so)
target_link_libraries(client_api_test2 PUBLIC libhilog_ndk.z.so)
target_link_libraries(client_api_test2 PUBLIC libteec.so)
target_link_libraries(client_api_test2 PUBLIC -rdynamic -ldl)

add_library(client_api_test3 SHARED test/ClientApi3Test.cpp)
target_link_libraries(client_api_test3 PUBLIC libace_napi.z.so)
target_link_libraries(client_api_test3 PUBLIC libhilog_ndk.z.so)
target_link_libraries(client_api_test3 PUBLIC libteec.so)
target_link_libraries(client_api_test3 PUBLIC -rdynamic -ldl)