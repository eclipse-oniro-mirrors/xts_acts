# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(web_error_code)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(weberrorcodetest SHARED WebErrorCodeTest.cpp WebErrorCodeListTest.cpp WebSchemeHandlerTest.cpp WebRequestTest.cpp)
target_link_libraries(weberrorcodetest PUBLIC librawfile.z.so libace_napi.z.so libhilog_ndk.z.so libohweb.so)

add_library(nativeinterfacetest SHARED NativeInterfaceTest.cpp)
target_link_libraries(nativeinterfacetest PUBLIC libace_napi.z.so libhilog_ndk.z.so libohweb.so)
