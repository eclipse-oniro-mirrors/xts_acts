# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsCapabilityStartSelfUIAbilityTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(entry SHARED ActScapiStartSelfUiAbilityTest20Test.cpp NativeChildDemoTest.cpp ExportsApiTest.cpp)
target_link_libraries(entry PUBLIC libace_napi.z.so libhilog_ndk.z.so libos_account_ndk.so libohinput.so libchild_process.so libability_runtime.so libability_base_want.so libpixelmap.so)