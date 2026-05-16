# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(execute_promise_after_module_load)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED ExecutePromiseAfterModuleLoadTest.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so)

add_library(entrytaskpool SHARED SoLoadInTaskPoolTest.cpp)
target_link_libraries(entrytaskpool PUBLIC libace_napi.z.so libhilog_ndk.z.so)