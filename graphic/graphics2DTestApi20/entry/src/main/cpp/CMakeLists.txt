# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(AccountNdk)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                        ${NATIVERENDER_ROOT_PATH}/include)

add_library(graphicsApiNdk SHARED ActsGraphics2DApi20Test.cpp BrushPointRecordTest.cpp RectFontTest.cpp CanvasPenTest.cpp EffectTest.cpp EffectShareTest.cpp BufferTextTest.cpp ColorSpaceNameTest.cpp NativeBufferTest.cpp ExternalWindowTest.cpp ErrorCodeTest.cpp ErrorCodeWindowTest.cpp VSyncFenceTest.cpp TypographyTest.cpp)
target_link_libraries(graphicsApiNdk PUBLIC libace_napi.z.so libnative_drawing.so libnative_color_space_manager.so libpixelmap.so libnative_buffer.so libnative_window.so libnative_image.so libnative_media_core.so libGLESv2.so libnative_effect.so libipc_capi.so  libnative_vsync.so libnative_fence.so libohenvironment.so libGLESv3.so libEGL.so libnative_image.so)