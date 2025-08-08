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

#include "EGL/egl.h"
#include "EGL/eglext.h"
#include "drawing_bitmap.h"
#include "drawing_error_code.h"
#include "drawing_gpu_context.h"
#include "drawing_surface.h"
#include "drawing_canvas.h"
#include "drawing_rect.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeSurFaceTest : public testing::Test {
  public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp() override;
    void TearDown() override;

  protected:
    EGLDisplay eglDisplay_ = EGL_NO_DISPLAY;
    EGLConfig eglConfig_ = EGL_NO_CONFIG_KHR;
    EGLContext eglContext_ = EGL_NO_CONTEXT;
    EGLSurface eglSurface_ = EGL_NO_SURFACE;
    OH_Drawing_GpuContext *gpuContext_ = nullptr;
    OH_Drawing_Surface *surface_ = nullptr;
    OH_Drawing_Canvas *canvas_ = nullptr;
};

void DrawingNativeSurFaceTest::SetUpTestCase() {}
void DrawingNativeSurFaceTest::TearDownTestCase() {}
void DrawingNativeSurFaceTest::SetUp()
{
    eglDisplay_ = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    EXPECT_NE(eglDisplay_, EGL_NO_DISPLAY);

    EGLint eglMajVers;
    EGLint eglMinVers;
    EGLBoolean ret = eglInitialize(eglDisplay_, &eglMajVers, &eglMinVers);
    EXPECT_EQ(ret, EGL_TRUE);

    EGLint count;
    EGLint configAttribs[] = {
        EGL_SURFACE_TYPE,
        EGL_WINDOW_BIT,
        EGL_RED_SIZE,
        8,
        EGL_GREEN_SIZE,
        8,
        EGL_BLUE_SIZE,
        8,
        EGL_ALPHA_SIZE,
        8,
        EGL_RENDERABLE_TYPE,
        EGL_OPENGL_ES3_BIT,
        EGL_NONE,
    };
    ret = eglChooseConfig(eglDisplay_, configAttribs, &eglConfig_, 1, &count);
    EXPECT_EQ(ret, EGL_TRUE);
    EXPECT_GE(count, 1);

    const EGLint contextAttribs[] = {EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE};
    eglContext_ = eglCreateContext(eglDisplay_, eglConfig_, EGL_NO_CONTEXT, contextAttribs);
    EXPECT_NE(eglContext_, EGL_NO_CONTEXT);

    EGLint attribs[] = {EGL_WIDTH, 1, EGL_HEIGHT, 1, EGL_NONE};
    eglSurface_ = eglCreatePbufferSurface(eglDisplay_, eglConfig_, attribs);
    EXPECT_NE(eglSurface_, EGL_NO_SURFACE);

    ret = eglMakeCurrent(eglDisplay_, eglSurface_, eglSurface_, eglContext_);
    EXPECT_EQ(ret, EGL_TRUE);
    // 初始化errorCode
    std::cout << "DrawingNativeSurFaceTest Setup code called before each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeSurFaceTest errorCodeReset before each test case." << std::endl;
}

void DrawingNativeSurFaceTest::TearDown()
{
    EGLBoolean ret = eglDestroySurface(eglDisplay_, eglSurface_);
    EXPECT_EQ(ret, EGL_TRUE);

    ret = eglDestroyContext(eglDisplay_, eglContext_);
    EXPECT_EQ(ret, EGL_TRUE);

    ret = eglTerminate(eglDisplay_);
    EXPECT_EQ(ret, EGL_TRUE);

    eglSurface_ = EGL_NO_SURFACE;
    eglContext_ = EGL_NO_CONTEXT;
    eglDisplay_ = EGL_NO_DISPLAY;
    std::cout << "DrawingNativeSurFaceTest Setup code called after each test case." << std::endl;
    OH_Drawing_ErrorCodeReset();
    std::cout << "DrawingNativeSurFaceTest errorCodeReset after each test case." << std::endl;
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0100
 * @tc.name: testSurfaceCreateFromGpuContextNormal
 * @tc.desc: test for testSurfaceCreateFromGpuContextNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceCreateFromGpuContextNormal, TestSize.Level0) {
    OH_Drawing_GpuContextOptions options{true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 500;
    const int32_t height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, false, imageInfo);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0101
 * @tc.name: testSurfaceCreateFromGpuContextNull
 * @tc.desc: test for testSurfaceCreateFromGpuContextNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceCreateFromGpuContextNull, TestSize.Level3) {
    OH_Drawing_GpuContextOptions options{true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 500;
    const int32_t height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // OH_Drawing_GpuContext is NULL, check error code using OH_Drawing_ErrorCodeGet
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(nullptr, true, imageInfo);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // Exceptional parameter passing for OH_Drawing_Image_Info
    OH_Drawing_Image_Info imageInfo2 = {0, 0, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, false, imageInfo2);
    EXPECT_EQ(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0102
 * @tc.name: testSurfaceCreateFromGpuContextBoundary
 * @tc.desc: test for testSurfaceCreateFromGpuContextBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceCreateFromGpuContextBoundary, TestSize.Level0) {
    OH_Drawing_GpuContextOptions options{true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 4096;
    const int32_t height = 2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, false, imageInfo);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0200
 * @tc.name: testSurfaceDestroyNormal
 * @tc.desc: test for testSurfaceDestroyNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceDestroyNormal, TestSize.Level0) {
    OH_Drawing_GpuContextOptions options{true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 500;
    const int32_t height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0201
 * @tc.name: testSurfaceDestroyNull
 * @tc.desc: test for testSurfaceDestroyNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceDestroyNull, TestSize.Level3) {
    // free
    OH_Drawing_SurfaceDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0300
 * @tc.name: testSurfaceGetCanvasNormal
 * @tc.desc: test for testSurfaceGetCanvasNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceGetCanvasNormal, TestSize.Level0) {
    OH_Drawing_GpuContextOptions options{true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = 500;
    const int32_t height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    //2.OH_Drawing_SurfaceGetCanvas, get the canvas object from the surface object,a pointer to the surface object
    // and call the drawing interface
    canvas_ = OH_Drawing_SurfaceGetCanvas(surface_);
    // add assert
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_SUCCESS);
    EXPECT_NE(canvas_, nullptr);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0301
 * @tc.name: testSurfaceGetCanvasNull
 * @tc.desc: test for testSurfaceGetCanvasNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceGetCanvasNull, TestSize.Level3) {
    OH_Drawing_GpuContextOptions options{true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = 500;
    const int32_t height = 500;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    // 2. OH_Drawing_SurfaceGetCanvas with null parameter, check error code using OH_Drawing_ErrorCodeGet
    canvas_ = OH_Drawing_SurfaceGetCanvas(nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0302
 * @tc.name: testSurfaceGetCanvasBoundary
 * @tc.desc: test for testSurfaceGetCanvasBoundary.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceGetCanvasBoundary, TestSize.Level0) {
    OH_Drawing_GpuContextOptions options{true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = 4096;
    const int32_t height = 2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, true, imageInfo);
    EXPECT_NE(surface_, nullptr);
    //2. OH_Drawing_SurfaceGetCanvas, get the canvas object from the surface object,a pointer to the surface object
    // and call the drawing interface
    canvas_ = OH_Drawing_SurfaceGetCanvas(surface_);
    EXPECT_NE(canvas_, nullptr);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0400
 * @tc.name: testSurfaceCreateOnScreenNormal
 * @tc.desc: test for testSurfaceCreateOnScreenNormal.window
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceCreateOnScreenNormal, TestSize.Level0) {
    // 1、OH_Drawing_SurfaceCreateOnScreen正常入参调用
    gpuContext_ = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 4096;
    const int32_t height = 2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // 1. OH_Drawing_SurfaceCreateOnScreen
    surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    canvas_ = OH_Drawing_SurfaceGetCanvas(surface_);
    // 2. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0401
 * @tc.name: testSurfaceCreateOnScreenNull
 * @tc.desc: test for testSurfaceCreateOnScreenNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceCreateOnScreenNull, TestSize.Level3) {
    // 1. OH_Drawing_SurfaceCreateOnScreen第一个参数传空
    const int32_t width = 4096;
    const int32_t height = 2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateOnScreen(nullptr, imageInfo, nullptr);
    EXPECT_EQ(OH_Drawing_ErrorCodeGet(), OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 2. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0402
 * @tc.name: testSurfaceCreateOnScreenMultipleCalls
 * @tc.desc: test for testSurfaceCreateOnScreenMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceCreateOnScreenMultipleCalls, TestSize.Level3) {
    gpuContext_ = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 4096;
    const int32_t height = 2160;
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
    for (int i = 0; i < 5; ++i) { // Loop through formats
        for (int j = 0; j < 3; ++j) { // Loop through alphaFormats
            OH_Drawing_Image_Info imageInfo = {width, height, formats[i], alphaFormats[j]};
            imageInfos.push_back(imageInfo);
        }
    }
    
    for (int index = 0; index < 10; ++index) {
        surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfos[index], nullptr);
        EXPECT_EQ(surface_, nullptr);
        // Free memory
        OH_Drawing_SurfaceDestroy(surface_);
    }
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0500
 * @tc.name: testSurfaceFlushNormal
 * @tc.desc: test for testSurfaceFlushNormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceFlushNormal, TestSize.Level0) {
    gpuContext_ = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext_, nullptr);
    // 1. OH_Drawing_SurfaceCreateFromGpuContext
    const int32_t width = 4096;
    const int32_t height = 2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    EXPECT_EQ(surface_, nullptr);
    // 2. OH_Drawing_SurfaceFlush
    auto result = OH_Drawing_SurfaceFlush(surface_);
    EXPECT_EQ(result, OH_DRAWING_ERROR_INVALID_PARAMETER);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0501
 * @tc.name: testSurfaceFlushNull
 * @tc.desc: test for testSurfaceFlushNull.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceFlushNull, TestSize.Level3) {
    OH_Drawing_ErrorCode errorCode = OH_Drawing_SurfaceFlush(nullptr);
    EXPECT_EQ(errorCode, OH_DRAWING_ERROR_INVALID_PARAMETER);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0502
 * @tc.name: testSurfaceFlushAbnormal
 * @tc.desc: test for testSurfaceFlushAbnormal.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceFlushAbnormal, TestSize.Level3) {
    OH_Drawing_GpuContextOptions options{true};
    // 1. OH_Drawing_GPUContextCreateFromGL
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 4096;
    const int32_t height = 2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    // 2. OH_Drawing_SurfaceCreateOnScreen
    surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    // 3. OH_Drawing_SurfaceFlush
    auto result = OH_Drawing_SurfaceFlush(surface_);
    EXPECT_NE(result, OH_DRAWING_SUCCESS);
    // 4. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0503
 * @tc.name: testSurfaceFlushMultipleCalls
 * @tc.desc: test for testSurfaceFlushMultipleCalls.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceFlushMultipleCalls, TestSize.Level3) {
    gpuContext_ = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 4096;
    const int32_t height = 2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_OPAQUE};
    surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    EXPECT_NE(rect, nullptr);

    // 1. OH_Drawing_CanvasDrawRect-OH_Drawing_SurfaceFlush循环调用10次
    for (int i = 0; i < 10; ++i) {
        OH_Drawing_CanvasDrawRect(canvas, rect);
        auto result1 = OH_Drawing_SurfaceFlush(surface_);
        EXPECT_EQ(result1, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }

    // 2. OH_Drawing_SurfaceFlush直接循环调用10次
    for (int i = 0; i < 10; ++i) {
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
    for (int i = 0; i < 5; ++i) { // Loop through formats
        for (int j = 0; j < 3; ++j) { // Loop through alphaFormats
            OH_Drawing_Image_Info imageInfo = {width, height, formats[i], alphaFormats[j]};
            imageInfos.push_back(imageInfo);
        }
    }

    for (int index = 0; index < 10; ++index) {
        surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfos[index], nullptr);
        auto result3 = OH_Drawing_SurfaceFlush(surface_);
        EXPECT_EQ(result3, OH_DRAWING_ERROR_INVALID_PARAMETER);
    }

    OH_Drawing_SurfaceDestroy(surface_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_SURFACE_0504
 * @tc.name: testSurfaceFlushTiming
 * @tc.desc: test for testSurfaceFlushTiming.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeSurFaceTest, testSurfaceFlushTiming, TestSize.Level3) {
    OH_Drawing_GpuContextOptions options{true};
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    const int32_t width = 4096;
    const int32_t height = 2160;
    OH_Drawing_Image_Info imageInfo = {width, height, COLOR_FORMAT_RGBA_8888,
        ALPHA_FORMAT_OPAQUE};

    OH_Drawing_Canvas *canvas = OH_Drawing_CanvasCreate();
    EXPECT_NE(canvas, nullptr);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(10, 100, 200, 300);
    EXPECT_NE(rect, nullptr);
    // 1. OH_Drawing_SurfaceCreateOnScreen-OH_Drawing_CanvasDrawRect-OH_Drawing_SurfaceFlush正常时序
    surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_SurfaceFlush(surface_);

    // 2. OH_Drawing_SurfaceCreateOnScreen-OH_Drawing_SurfaceFlush创建surface之后直接调用flush
    surface_ = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    OH_Drawing_SurfaceFlush(surface_);

    // 3. 创建两个canvas-创建两个surface-各自进行绘制-各自flush
    OH_Drawing_Canvas *canvas1 = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *rect1 = OH_Drawing_RectCreate(10, 100, 200, 300);
    OH_Drawing_CanvasDrawRect(canvas1, rect1);
    OH_Drawing_Surface* surface1 = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);
    OH_Drawing_Canvas *canvas2 = OH_Drawing_CanvasCreate();
    OH_Drawing_Rect *rect2 = OH_Drawing_RectCreate(10, 100, 200, 300);
    OH_Drawing_CanvasDrawRect(canvas2, rect2);
    OH_Drawing_Surface* surface2 = OH_Drawing_SurfaceCreateOnScreen(gpuContext_, imageInfo, nullptr);

    OH_Drawing_SurfaceDestroy(surface_);
    OH_Drawing_SurfaceDestroy(surface1);
    OH_Drawing_SurfaceDestroy(surface2);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS