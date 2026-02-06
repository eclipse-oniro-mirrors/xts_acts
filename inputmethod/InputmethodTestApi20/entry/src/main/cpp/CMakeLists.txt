# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(InputmethodTestApi20)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED InputmethodApi20Test.cpp InputmethodAttachOptionsCapiTest.cpp InputmethodControllerCapiTest.cpp InputmethodCursorInfoCapiTest.cpp InputmethodProxyCapiTest.cpp InputmethodPrivateCommandCapiTest.cpp InputmethodTextAvoidInfoCapiTest.cpp InputmethodTextConfigCapiTest.cpp InputmethodTextEditorProxyCapiTest.cpp InputmethodTypesCapiTest.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so libohinputmethod.so)