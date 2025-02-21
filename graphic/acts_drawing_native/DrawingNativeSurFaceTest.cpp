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
    EXPECT_NE(surface_, nullptr);
    OH_Drawing_SurfaceDestroy(surface_);
    surface_ = OH_Drawing_SurfaceCreateFromGpuContext(gpuContext_, false, imageInfo);
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
    // 2. OH_Drawing_SurfaceGetCanvas, get the canvas object from the surface object, a pointer to the surface object,
    // and call the drawing interface
    canvas_ = OH_Drawing_SurfaceGetCanvas(surface_);
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
    // 2. OH_Drawing_SurfaceGetCanvas, get the canvas object from the surface object, a pointer to the surface object,
    // and call the drawing interface
    canvas_ = OH_Drawing_SurfaceGetCanvas(surface_);
    EXPECT_NE(canvas_, nullptr);
    // 3. Free memory
    OH_Drawing_SurfaceDestroy(surface_);
}
} // namespace Drawing
} // namespace Rosen
} // namespace OHOS