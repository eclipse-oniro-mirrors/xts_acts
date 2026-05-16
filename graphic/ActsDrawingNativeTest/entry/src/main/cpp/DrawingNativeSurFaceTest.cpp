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

#define DRAWING_NUMBER_3 3
#define DRAWING_NUMBER_5 5
#define DRAWING_NUMBER_10 10
#define DRAWING_NUMBER_100 100
#define DRAWING_NUMBER_200 200
#define DRAWING_NUMBER_300 300
#define DRAWING_NUMBER_500 500
#define DRAWING_NUMBER_2160 2160
#define DRAWING_NUMBER_4096 4096

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

int TestSurfaceCreateFromGpuContextNormal()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContextOptions options{true};
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 500;
    const int32_t height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, false, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceCreateFromGpuContextNull()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContextOptions options{true};
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = DRAWING_NUMBER_500;
    const int32_t height = DRAWING_NUMBER_500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // OH_Drawing_GpuContext is NULL, check error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateFromGpuContext(nullptr, true, imageInfo);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // Exceptional parameter passing for OH_Drawing_Image_Info
    OH_Drawing_Image_Info imageInfo2 = {0, 0, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, false, imageInfo2);
    EXPECT_EQ(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceCreateFromGpuContextBoundary()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContextOptions options{true};
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = DRAWING_NUMBER_4096;
    const int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, false, imageInfo);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceDestroyNormal()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContextOptions options{true};
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 500;
    const int32_t height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceDestroyNull()
{
    DrawingNativeSurFaceTestSetUp();
    // free
    OH_Drawing_Surface *surface = nullptr;
    OH_Drawing_SurfaceDestroy(nullptr);
    EXPECT_EQ(surface, nullptr);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceGetCanvasNormal()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContextOptions options{true};
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = 500;
    const int32_t height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    //2.OH_Drawing_SurfaceGetCanvas, get the canvas object from the surface object,a pointer to the surface object
    // and call the drawing interface
    OH_Drawing_Canvas* canvas_ = OH_Drawing_SurfaceGetCanvas(surface_);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(canvas_, nullptr);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceGetCanvasNull()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContextOptions options{true};
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = 500;
    const int32_t height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    // 2. OH_Drawing_SurfaceGetCanvas with null parameter, check error code using OH_Drawing_ErrorCodeGet
    OH_Drawing_Canvas* canvas_ = OH_Drawing_SurfaceGetCanvas(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceGetCanvasBoundary()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContextOptions options{true};
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = DRAWING_NUMBER_4096;
    const int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    //2. OH_Drawing_SurfaceGetCanvas, get the canvas object from the surface object,a pointer to the surface object
    // and call the drawing interface
    OH_Drawing_Canvas* canvas_ = OH_Drawing_SurfaceGetCanvas(surface_);
    EXPECT_NE(canvas_, nullptr);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceCreateOnScreenNormal()
{
    DrawingNativeSurFaceTestSetUp();
    // 1、OH_Drawing_SurfaceCreateOnScreen正常入参调用
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = DRAWING_NUMBER_4096;
    const int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // 1. OH_Drawing_SurfaceCreateOnScreen
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    OH_Drawing_Canvas* canvas_ = OH_Drawing_SurfaceGetCanvas(surface_);
    // 2. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceCreateOnScreenNull()
{
    DrawingNativeSurFaceTestSetUp();
    // 1. OH_Drawing_SurfaceCreateOnScreen第一个参数传空
    const int32_t width = DRAWING_NUMBER_4096;
    const int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateOnScreen(nullptr, imageInfo, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceCreateOnScreenMultipleCalls()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = DRAWING_NUMBER_4096;
    const int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };

    std::vector<OH_Drawing_Image_Info> imageInfos;
    // Loop to create different imageInfo structures
    for (int i = 0; i < DRAWING_NUMBER_5; ++i) { // Loop through formats
        for (int j = 0; j < DRAWING_NUMBER_3; ++j) { // Loop through alphaFormats
            OH_Drawing_Image_Info imageInfo = {width, height, formats[i], alphaFormats[j]};
            imageInfos.push_back(imageInfo);
        }
    }

    for (int index = 0; index < DRAWING_NUMBER_10; ++index) {
        OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfos[index], nullptr);
        EXPECT_EQ(surface_, nullptr);
        // Free memory
        OH_Drawing_SurfaceDestroy(surface_);
    }
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceFlushNormal()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext_, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = DRAWING_NUMBER_4096;
    const int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    EXPECT_EQ(surface_, nullptr);
    // 2. OH_Drawing_SurfaceFlush
    auto result = OH_Drawing_SurfaceFlush(surface_);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceFlushNull()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SurfaceFlush(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceFlushAbnormal()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContextOptions options{true};
    // 1. OH_Drawing_GPUContextCreateFromGL
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = DRAWING_NUMBER_4096;
    const int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // 2. OH_Drawing_SurfaceCreateOnScreen
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    // 3. OH_Drawing_SurfaceFlush
    auto result = OH_Drawing_SurfaceFlush(surface_);
    EXPECT_NE(result, OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceFlushMultipleCalls()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = DRAWING_NUMBER_4096;
    const int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);

    // 1. OH_Drawing_CanvasDrawRect-OH_Drawing_SurfaceFlush循环调用10次
    for (int i = 0; i < DRAWING_NUMBER_10; ++i) {
        OH_Drawing_CanvasDrawRect(canvas, rect);
        auto result1 = OH_Drawing_SurfaceFlush(surface_);
        EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }

    // 2. OH_Drawing_SurfaceFlush直接循环调用10次
    for (int i = 0; i < DRAWING_NUMBER_10; ++i) {
        auto result2 = OH_Drawing_SurfaceFlush(surface_);
        EXPECT_EQ(result2, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }
    // 3. 创建不同surface（通过创建不同imageinfo）-OH_Drawing_SurfaceFlush循环调用10次
    OH_Drawing_ColorFormat formats[] = {
        COLOR_FORMAT_ALPHA_8,   COLOR_FORMAT_RGB_565,
        COLOR_FORMAT_ARGB_4444, COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888,
    };
    OH_Drawing_AlphaFormat alphaFormats[] = {
        ALPHA_FORMAT_OPAQUE,
        ALPHA_FORMAT_PREMUL,
        ALPHA_FORMAT_UNPREMUL,
    };

    std::vector<OH_Drawing_Image_Info> imageInfos;
    // Loop to create different imageInfo structures
    for (int i = 0; i < DRAWING_NUMBER_5; ++i) { // Loop through formats
        for (int j = 0; j < DRAWING_NUMBER_3; ++j) { // Loop through alphaFormats
            OH_Drawing_Image_Info imageInfo = {width, height, formats[i], alphaFormats[j]};
            imageInfos.push_back(imageInfo);
        }
    }

    for (int index = 0; index < DRAWING_NUMBER_10; ++index) {
        surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfos[index], nullptr);
        auto result3 = OH_Drawing_SurfaceFlush(surface_);
        EXPECT_EQ(result3, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }

    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

int TestSurfaceFlushTiming()
{
    DrawingNativeSurFaceTestSetUp();
    OH_Drawing_GpuContextOptions options{true};
    OH_Drawing_GpuContext* gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = DRAWING_NUMBER_4096;
    const int32_t height = DRAWING_NUMBER_2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888,
        ALPHA_FORMAT_OPAQUE};

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300);
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_SurfaceCreateOnScreen-OH_Drawing_CanvasDrawRect-OH_Drawing_SurfaceFlush正常时序
    OH_Drawing_Surface* surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_SurfaceFlush(surface_);

    // 2. OH_Drawing_SurfaceCreateOnScreen-OH_Drawing_SurfaceFlush创建surface之后直接调用flush
    surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    OH_Drawing_SurfaceFlush(surface_);

    // 3. 创建两个canvas-创建两个surface-各自进行绘制-各自flush
    OH_Drawing_Canvas *canvas1 = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300);
    OH_Drawing_CanvasDrawRect(canvas1, rect1);
    OH_Drawing_Surface* surface1 = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    OH_Drawing_Canvas *canvas2 = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(DRAWING_NUMBER_10, DRAWING_NUMBER_100, DRAWING_NUMBER_200,
        DRAWING_NUMBER_300);
    OH_Drawing_CanvasDrawRect(canvas2, rect2);
    OH_Drawing_Surface* surface2 = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);

    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_SurfaceDestroy(surface1);
    OH_Drawing_SurfaceDestroy(surface2);
    OH_Drawing_GpuContextDestroy(gpuContext_);
    DrawingNativeSurFaceTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
