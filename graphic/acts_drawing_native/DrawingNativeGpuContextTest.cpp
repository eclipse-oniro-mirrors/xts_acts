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
#include "drawing_gpu_context.h"
#include "gtest/gtest.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS {
namespace Rosen {
namespace Drawing {
class DrawingNativeGpuContextTest : public testing::Test {
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
};

void DrawingNativeGpuContextTest::SetUpTestCase() {}
void DrawingNativeGpuContextTest::TearDownTestCase() {}
void DrawingNativeGpuContextTest::SetUp()
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

void DrawingNativeGpuContextTest::TearDown()
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
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_GPU_CONTEXT_0100
 * @tc.name: testGpuContextCreateFromGLDestroyNormal
 * @tc.desc: Test for creating and destroying GPU context with normal parameters.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 0
 */
HWTEST_F(DrawingNativeGpuContextTest, testGpuContextCreateFromGLDestroyNormal, TestSize.Level0) {
    OH_Drawing_GpuContextOptions options;
    options.allowPathMaskCaching = true;
    gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext_, nullptr);
    OH_Drawing_GpuContextDestroy(gpuContext_);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_GPU_CONTEXT_0101
 * @tc.name: testGpuContextDestroyNULL
 * @tc.desc: Test for destroying GPU context with NULL parameter.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeGpuContextTest, testGpuContextDestroyNULL, TestSize.Level3) {
    OH_Drawing_GpuContextDestroy(nullptr);
}

/*
 * @tc.number: SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_GPU_CONTEXT_0102
 * @tc.name: testGpuContextCreateFromGLDestroyMultipleCalls
 * @tc.desc: Test for repeatedly creating and destroying GPU context.
 * @tc.size  : SmallTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(DrawingNativeGpuContextTest, testGpuContextCreateFromGLDestroyMultipleCalls, TestSize.Level3) {
    for (int i = 0; i < 10; i++) {
        OH_Drawing_GpuContextOptions options;
        options.allowPathMaskCaching = true;
        gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
        EXPECT_NE(gpuContext_, nullptr);
        OH_Drawing_GpuContextDestroy(gpuContext_);
    }
    for (int i = 0; i < 10; i++) {
        OH_Drawing_GpuContextOptions options;
        options.allowPathMaskCaching = true;
        gpuContext_ = OH_Drawing_GpuContextCreateFromGL(options);
        EXPECT_NE(gpuContext_, nullptr);
    }
    OH_Drawing_GpuContextDestroy(gpuContext_);
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS