/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/DrawingNativeSurFaceTest.h"
#include <vector>
#include "EGL/egl.h"
#include "EGL/eglext.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr EGLint EGL_COLOR_SIZE_8 = 8;
constexpr EGLint EGL_CONFIG_COUNT_1 = 1;
constexpr EGLint EGL_MIN_COUNT_1 = 1;
constexpr EGLint EGL_CONTEXT_CLIENT_VERSION_2 = 2;
constexpr EGLint EGL_PBUFFER_WIDTH_1 = 1;
constexpr EGLint EGL_PBUFFER_HEIGHT_1 = 1;
constexpr int32_t TEST_SURFACE_WIDTH_500 = 500;
constexpr int32_t TEST_SURFACE_HEIGHT_500 = 500;
constexpr int32_t TEST_SURFACE_WIDTH_4K = 4096;
constexpr int32_t TEST_SURFACE_HEIGHT_4K = 2160;
constexpr int32_t TEST_SURFACE_WIDTH_0 = 0;
constexpr int32_t TEST_SURFACE_HEIGHT_0 = 0;
constexpr int TEST_COLOR_FORMAT_COUNT_5 = 5;
constexpr int TEST_ALPHA_FORMAT_COUNT_3 = 3;
constexpr int TEST_LOOP_COUNT_10 = 10;
constexpr float TEST_RECT_X_10 = 10.0f;
constexpr float TEST_RECT_Y_100 = 100.0f;
constexpr float TEST_RECT_WIDTH_200 = 200.0f;
constexpr float TEST_RECT_HEIGHT_300 = 300.0f;
} // namespace

// Static variables for EGL context
static EGLDisplay g_eglDisplay = EGL_NO_DISPLAY;
static EGLConfig g_eglConfig = EGL_NO_CONFIG_KHR;
static EGLContext g_eglContext = EGL_NO_CONTEXT;
static EGLSurface g_eglSurface = EGL_NO_SURFACE;

// Common SetUp and TearDown functions implementation
void DrawingNativeSurFaceTestSetUp()
{
    g_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    EXPECT_NE(g_eglDisplay, EGL_NO_DISPLAY);

    EGLint eglMajVers;
    EGLint eglMinVers;
    EGLBoolean ret = eglInitialize(g_eglDisplay, &eglMajVers, &eglMinVers);
    EXPECT_EQ(ret, EGL_TRUE);

    EGLint count;
    EGLint configAttribs[] = {
        EGL_SURFACE_TYPE,
        EGL_WINDOW_BIT,
        EGL_RED_SIZE,
        EGL_COLOR_SIZE_8,
        EGL_GREEN_SIZE,
        EGL_COLOR_SIZE_8,
        EGL_BLUE_SIZE,
        EGL_COLOR_SIZE_8,
        EGL_ALPHA_SIZE,
        EGL_COLOR_SIZE_8,
        EGL_RENDERABLE_TYPE,
        EGL_OPENGL_ES3_BIT,
        EGL_NONE,
    };
    ret = eglChooseConfig(g_eglDisplay, configAttribs, &g_eglConfig, EGL_CONFIG_COUNT_1, &count);
    EXPECT_EQ(ret, EGL_TRUE);
    EXPECT_GE(count, EGL_MIN_COUNT_1);

    const EGLint contextAttribs[] = { EGL_CONTEXT_CLIENT_VERSION, EGL_CONTEXT_CLIENT_VERSION_2, EGL_NONE };
    g_eglContext = eglCreateContext(g_eglDisplay, g_eglConfig, EGL_NO_CONTEXT, contextAttribs);
    EXPECT_NE(g_eglContext, EGL_NO_CONTEXT);

    EGLint attribs[] = { EGL_WIDTH, EGL_PBUFFER_WIDTH_1, EGL_HEIGHT, EGL_PBUFFER_HEIGHT_1, EGL_NONE };
    g_eglSurface = eglCreatePbufferSurface(g_eglDisplay, g_eglConfig, attribs);
    EXPECT_NE(g_eglSurface, EGL_NO_SURFACE);

    ret = eglMakeCurrent(g_eglDisplay, g_eglSurface, g_eglSurface, g_eglContext);
    EXPECT_EQ(ret, EGL_TRUE);
    // 初始化errorCode
    std::cout << "DrawingNativeSurFaceTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeSurFaceTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeSurFaceTestTearDown()
{
    EGLBoolean ret = eglDestroySurface(g_eglDisplay, g_eglSurface);
    EXPECT_EQ(ret, EGL_TRUE);

    ret = eglDestroyContext(g_eglDisplay, g_eglContext);
    EXPECT_EQ(ret, EGL_TRUE);

    ret = eglTerminate(g_eglDisplay);
    EXPECT_EQ(ret, EGL_TRUE);

    g_eglSurface = EGL_NO_SURFACE;
    g_eglContext = EGL_NO_CONTEXT;
    g_eglDisplay = EGL_NO_DISPLAY;
    std::cout << "DrawingNativeSurFaceTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeSurFaceTest errorCodeReset after each test case." << std::endl;
}

/**
 * @tc.name   testSurfaceCreateFromGpuContextNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_0100
 * @tc.desc   test for testSurfaceCreateFromGpuContextNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestSurfaceCreateFromGpuContextNormal()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContextOptions options{ true };
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    const int32_t width = TEST_SURFACE_WIDTH_500;
    const int32_t height = TEST_SURFACE_HEIGHT_500;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext, true, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(surface, nullptr);
    OH_Drawing_SurfaceDestroy(surface);
    surface = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext, false, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(surface, nullptr);
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceCreateFromGpuContextNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_0200
 * @tc.desc   test for testSurfaceCreateFromGpuContextNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSurfaceCreateFromGpuContextNull()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContextOptions options{ true };
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    const int32_t width = TEST_SURFACE_WIDTH_500;
    const int32_t height = TEST_SURFACE_HEIGHT_500;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    // OH_Drawing_GpuContext is NULL, check error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateFromGpuContext(nullptr, true, imageInfo);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // Exceptional parameter passing for OH_Drawing_Image_Info
    OH_Drawing_Image_Info imageInfo2 = { TEST_SURFACE_WIDTH_0, TEST_SURFACE_HEIGHT_0, COLOR_FORMAT_RGBA_8888,
        ALPHA_FORMAT_OPAQUE };
    surface = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext, false, imageInfo2);
    EXPECT_EQ(surface, nullptr);
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceCreateFromGpuContextBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_0300
 * @tc.desc   test for testSurfaceCreateFromGpuContextBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestSurfaceCreateFromGpuContextBoundary()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContextOptions options{ true };
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    const int32_t width = TEST_SURFACE_WIDTH_4K;
    const int32_t height = TEST_SURFACE_HEIGHT_4K;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext, true, imageInfo);
    EXPECT_NE(surface, nullptr);
    OH_Drawing_SurfaceDestroy(surface);
    surface = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext, false, imageInfo);
    EXPECT_NE(surface, nullptr);
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_0400
 * @tc.desc   test for testSurfaceDestroyNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestSurfaceDestroyNormal()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContextOptions options{ true };
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    const int32_t width = TEST_SURFACE_WIDTH_500;
    const int32_t height = TEST_SURFACE_HEIGHT_500;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext, true, imageInfo);
    EXPECT_NE(surface, nullptr);
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceDestroyNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_0500
 * @tc.desc   test for testSurfaceDestroyNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSurfaceDestroyNull()
{
    DrawingNativeSurFaceTestSetUp();

    // free
    OH_Drawing_SurfaceDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceGetCanvasNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_0600
 * @tc.desc   test for testSurfaceGetCanvasNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestSurfaceGetCanvasNormal()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContextOptions options{ true };
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = TEST_SURFACE_WIDTH_500;
    const int32_t height = TEST_SURFACE_HEIGHT_500;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext, true, imageInfo);
    EXPECT_NE(surface, nullptr);
    // 2.OH_Drawing_SurfaceGetCanvas, get the canvas object from the surface object,a pointer to the surface object
    //  and call the drawing interface
    OH_Drawing_Canvas* canvas = OH_Drawing_SurfaceGetCanvas(surface);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(canvas, nullptr);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceGetCanvasNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_0700
 * @tc.desc   test for testSurfaceGetCanvasNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSurfaceGetCanvasNull()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContextOptions options{ true };
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = TEST_SURFACE_WIDTH_500;
    const int32_t height = TEST_SURFACE_HEIGHT_500;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext, true, imageInfo);
    EXPECT_NE(surface, nullptr);
    // 2. OH_Drawing_SurfaceGetCanvas with null parameter, check error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_Canvas* canvas = OH_Drawing_SurfaceGetCanvas(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceGetCanvasBoundary
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_0800
 * @tc.desc   test for testSurfaceGetCanvasBoundary.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestSurfaceGetCanvasBoundary()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContextOptions options{ true };
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = TEST_SURFACE_WIDTH_4K;
    const int32_t height = TEST_SURFACE_HEIGHT_4K;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext, true, imageInfo);
    EXPECT_NE(surface, nullptr);
    // 2. OH_Drawing_SurfaceGetCanvas, get the canvas object from the surface object,a pointer to the surface object
    //  and call the drawing interface
    OH_Drawing_Canvas* canvas = OH_Drawing_SurfaceGetCanvas(surface);
    EXPECT_NE(canvas, nullptr);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceCreateOnScreenNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_0900
 * @tc.desc   test for testSurfaceCreateOnScreenNormal.window
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestSurfaceCreateOnScreenNormal()
{
    DrawingNativeSurFaceTestSetUp();

    // 1、OH_Drawing_SurfaceCreateOnScreen正常入参调用
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext, nullptr);
    const int32_t width = TEST_SURFACE_WIDTH_4K;
    const int32_t height = TEST_SURFACE_HEIGHT_4K;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    // 1. OH_Drawing_SurfaceCreateOnScreen
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfo, nullptr);
    OH_Drawing_Canvas* canvas = OH_Drawing_SurfaceGetCanvas(surface);
    // 2. Free memory
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceCreateOnScreenNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_01000
 * @tc.desc   test for testSurfaceCreateOnScreenNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSurfaceCreateOnScreenNull()
{
    DrawingNativeSurFaceTestSetUp();

    // 1. OH_Drawing_SurfaceCreateOnScreen第一个参数传空
    const int32_t width = TEST_SURFACE_WIDTH_4K;
    const int32_t height = TEST_SURFACE_HEIGHT_4K;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateOnScreen(nullptr, imageInfo, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Free memory
    OH_Drawing_SurfaceDestroy(surface);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceCreateOnScreenMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_01100
 * @tc.desc   test for testSurfaceCreateOnScreenMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSurfaceCreateOnScreenMultipleCalls()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext, nullptr);
    const int32_t width = TEST_SURFACE_WIDTH_4K;
    const int32_t height = TEST_SURFACE_HEIGHT_4K;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,   COLOR_FORMAT_ARGB_4444,
        COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };

    std::vector<OH_Drawing_Image_Info> imageInfos;
    // Loop to create different imageInfo structures
    for (int i = 0; i < TEST_COLOR_FORMAT_COUNT_5; ++i) {     // Loop through formats
        for (int j = 0; j < TEST_ALPHA_FORMAT_COUNT_3; ++j) { // Loop through alphaFormats
            OH_Drawing_Image_Info imageInfo = { width, height, formats[i], alphaFormats[j] };
            imageInfos.push_back(imageInfo);
        }
    }

    for (int index = 0; index < TEST_LOOP_COUNT_10; ++index) {
        OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfos[index], nullptr);
        EXPECT_EQ(surface, nullptr);
        // Free memory
        OH_Drawing_SurfaceDestroy(surface);
    }
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceFlushNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_01200
 * @tc.desc   test for testSurfaceFlushNormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestSurfaceFlushNormal()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = TEST_SURFACE_WIDTH_4K;
    const int32_t height = TEST_SURFACE_HEIGHT_4K;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfo, nullptr);
    EXPECT_EQ(surface, nullptr);
    // 2. OH_Drawing_SurfaceFlush
    auto result = OH_Drawing_SurfaceFlush(surface);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceFlushNull
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_01300
 * @tc.desc   test for testSurfaceFlushNull.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSurfaceFlushNull()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_ErrorCode errorCode = OH_Drawing_SurfaceFlush(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceFlushAbnormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_01400
 * @tc.desc   test for testSurfaceFlushAbnormal.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSurfaceFlushAbnormal()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContextOptions options{ true };
    // 1. OH_Drawing_GPUContextCreateFromGL
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    const int32_t width = TEST_SURFACE_WIDTH_4K;
    const int32_t height = TEST_SURFACE_HEIGHT_4K;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    // 2. OH_Drawing_SurfaceCreateOnScreen
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfo, nullptr);
    // 3. OH_Drawing_SurfaceFlush
    auto result = OH_Drawing_SurfaceFlush(surface);
    EXPECT_NE(result, OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceFlushMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_01500
 * @tc.desc   test for testSurfaceFlushMultipleCalls.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSurfaceFlushMultipleCalls()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext, nullptr);
    const int32_t width = TEST_SURFACE_WIDTH_4K;
    const int32_t height = TEST_SURFACE_HEIGHT_4K;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfo, nullptr);

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_X_10, TEST_RECT_Y_100, TEST_RECT_WIDTH_200,
                                                  TEST_RECT_HEIGHT_300);
    EXPECT_NE(rect, nullptr);

    // 1. OH_Drawing_CanvasDrawRect-OH_Drawing_SurfaceFlush循环调用10次
    for (int i = 0; i < TEST_LOOP_COUNT_10; ++i) {
        OH_Drawing_CanvasDrawRect(canvas, rect);
        auto result1 = OH_Drawing_SurfaceFlush(surface);
        EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }

    // 2. OH_Drawing_SurfaceFlush直接循环调用10次
    for (int i = 0; i < TEST_LOOP_COUNT_10; ++i) {
        auto result2 = OH_Drawing_SurfaceFlush(surface);
        EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    // 3. 创建不同surface（通过创建不同imageinfo）-OH_Drawing_SurfaceFlush循环调用10次
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,   COLOR_FORMAT_ARGB_4444,
        COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };

    std::vector<OH_Drawing_Image_Info> imageInfos;
    // Loop to create different imageInfo structures
    for (int i = 0; i < TEST_COLOR_FORMAT_COUNT_5; ++i) {     // Loop through formats
        for (int j = 0; j < TEST_ALPHA_FORMAT_COUNT_3; ++j) { // Loop through alphaFormats
            OH_Drawing_Image_Info imageInfo = { width, height, formats[i], alphaFormats[j] };
            imageInfos.push_back(imageInfo);
        }
    }

    for (int index = 0; index < TEST_LOOP_COUNT_10; ++index) {
        surface = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfos[index], nullptr);
        auto result3 = OH_Drawing_SurfaceFlush(surface);
        EXPECT_EQ(result3, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }

    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testSurfaceFlushTiming
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_SURFACE_1600
 * @tc.desc   test for testSurfaceFlushTiming.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestSurfaceFlushTiming()
{
    DrawingNativeSurFaceTestSetUp();

    OH_Drawing_GpuContextOptions options{ true };
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    const int32_t width = TEST_SURFACE_WIDTH_4K;
    const int32_t height = TEST_SURFACE_HEIGHT_4K;
    OH_Drawing_Image_Info imageInfo = { width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE };

    OH_Drawing_Canvas* canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(TEST_RECT_X_10, TEST_RECT_Y_100, TEST_RECT_WIDTH_200,
                                                  TEST_RECT_HEIGHT_300);
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_SurfaceCreateOnScreen-OH_Drawing_CanvasDrawRect-OH_Drawing_SurfaceFlush正常时序
    OH_Drawing_Surface* surface = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfo, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_SurfaceFlush(surface);

    // 2. OH_Drawing_SurfaceCreateOnScreen-OH_Drawing_SurfaceFlush创建surface之后直接调用flush
    surface = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfo, nullptr);
    OH_Drawing_SurfaceFlush(surface);

    // 3. 创建两个canvas-创建两个surface-各自进行绘制-各自flush
    OH_Drawing_Canvas* canvas1 = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect1 = OH_Drawing_RectCreate(TEST_RECT_X_10, TEST_RECT_Y_100, TEST_RECT_WIDTH_200,
                                                   TEST_RECT_HEIGHT_300);
    OH_Drawing_CanvasDrawRect(canvas1, rect1);
    OH_Drawing_Surface* surface1 = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfo, nullptr);
    OH_Drawing_Canvas* canvas2 = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect* rect2 = OH_Drawing_RectCreate(TEST_RECT_X_10, TEST_RECT_Y_100, TEST_RECT_WIDTH_200,
                                                   TEST_RECT_HEIGHT_300);
    OH_Drawing_CanvasDrawRect(canvas2, rect2);
    OH_Drawing_Surface* surface2 = OH_Drawing_SurfaceCreateOnScreen(gpuContext, imageInfo, nullptr);

    OH_Drawing_SurfaceDestroy(surface);
    OH_Drawing_SurfaceDestroy(surface1);
    OH_Drawing_SurfaceDestroy(surface2);
    OH_Drawing_GpuContextDestroy(gpuContext);

    DrawingNativeSurFaceTestTearDown();

    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS