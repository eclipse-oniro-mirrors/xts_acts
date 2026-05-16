# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(GraphicGlesExtension)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(graphic_gles_extension_test SHARED
    GraphicGlesExtensionInterfaceTest.cpp
    GraphicGlesExtensionTest.cpp
)
target_link_libraries(graphic_gles_extension_test PUBLIC libace_napi.z.so libOpenSLES.so libace_ndk.z.so libGLESv3.so libEGL.so libhilog_ndk.z.so)