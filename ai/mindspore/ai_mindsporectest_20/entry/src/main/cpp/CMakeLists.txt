# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(MindSporeNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(mindsporendk SHARED mindspore/NapiRenderInitTest.cpp
common/CommonTest.cpp
mindspore/MindSporeContextTest.cpp
mindspore/MindSporeDataTypeTest.cpp
mindspore/MindSporeFormatTest.cpp
mindspore/MindSporeModelTest.cpp
mindspore/MindSporeStatusTest.cpp
mindspore/MindSporeTypesTest.cpp
)

target_link_libraries(mindsporendk PUBLIC libace_napi.z.so libhilog_ndk.z.so libmindspore_lite_ndk.so)