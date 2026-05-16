# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(NativeTemplate)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(drawingnative SHARED
NapiInitTest.cpp
OhosCommonTest.cpp
DrawingCanvasDrawRecordCmdTest.cpp
DrawingRecordCmdDestroyTest.cpp
DrawingRecordCmdUtilsBeginTest.cpp
DrawingRecordCmdUtilsDestroyTest.cpp
DrawingRecordCmdUtilsFinishTest.cpp
DrawingNativeCanvasTest.cpp
DrawingNativeCanvasPart2Test.cpp
DrawingNativeCanvasPart3Test.cpp
DrawingNativeCanvasPart4Test.cpp
DrawingNativeCanvasPart5Test.cpp
DrawingNativeCanvasPart6Test.cpp
DrawingNativeCanvasCommonTest.cpp
DrawingNativeBitmapTest.cpp
DrawingNativeBrushTest.cpp
DrawingNativeColorFilterTest.cpp
DrawingNativeColorSpaceTest.cpp
DrawingNativeColorTest.cpp
DrawingNativeFilterTest.cpp
DrawingNativeFontTest.cpp
DrawingNativeFontPart2Test.cpp
DrawingNativeGpuContextTest.cpp
DrawingNativeImageFilterTest.cpp
DrawingNativeImageTest.cpp
DrawingNativeMaskFilterTest.cpp
DrawingNativeMatrixTest.cpp
DrawingNativeMatrixPart2Test.cpp
DrawingNativeMemoryStreamTest.cpp
DrawingNativePathEffectTest.cpp
DrawingNativePathTest.cpp
DrawingNativePathPart2Test.cpp
DrawingNativePathPart3Test.cpp
DrawingNativePathPart4Test.cpp
DrawingNativePenTest.cpp
DrawingNativePixelMapTest.cpp
DrawingNativeRegionTest.cpp
DrawingNativeRectTest.cpp
DrawingNativeRoundRectTest.cpp
DrawingNativeSamplingOptionsTest.cpp
DrawingNativeShadowLayerTest.cpp
DrawingNativeShaderEffectTest.cpp
DrawingNativeSurFaceTest.cpp
DrawingNativePointTest.cpp
DrawingNativeTextBlobTest.cpp
DrawingNativeTypeFaceTest.cpp
DrawingNativeLatticeTest.cpp
DrawingNativePathIteratorTest.cpp
)

target_link_libraries(drawingnative PUBLIC 
libace_napi.z.so 
libEGL.so 
libpixelmap.so 
libGLESv3.so 
libnative_drawing.so 
libhilog_ndk.z.so)