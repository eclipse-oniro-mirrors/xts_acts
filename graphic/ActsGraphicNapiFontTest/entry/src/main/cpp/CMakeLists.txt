# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsGraphicNapiDrawingTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(graphicdrawing SHARED
    NapiInitTest.cpp
    OhosCommonTest.cpp
    NativeCopyStyleTest.cpp
    NativeDrawingFontMgrTest.cpp
    NativeFontTest.cpp
    NativeTextLineTest.cpp
    NativeTextRunTest.cpp
    NativeTypographyAutoSpaceTest.cpp
    NativeTypographyUpdateTest.cpp
    NativeUndefinedGlyphDisplayTest.cpp
    OHDrawingTypographyTest.cpp
)
target_link_libraries(graphicdrawing PUBLIC libace_napi.z.so libnative_drawing.so libhilog_ndk.z.so)