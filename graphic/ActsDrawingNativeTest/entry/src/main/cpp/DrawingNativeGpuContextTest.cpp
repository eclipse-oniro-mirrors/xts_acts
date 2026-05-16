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

#include "include/DrawingNativeGpuContextTest.h"
#include "EGL/egl.h"
#include "EGL/eglext.h"
#include "include/OhosCommonTest.h"

namespace OHOS {
namespace Rosen {
namespace Drawing {

namespace {
// Constants for test values
constexpr int TEST_LOOP_COUNT_10 = 10;
constexpr int TEST_COUNT_100 = 100;
constexpr int TEST_COUNT_200 = 200;
constexpr uint32_t TEST_RECT_SIZE_4096 = 4096;
constexpr uint32_t TEST_RECT_SIZE_2160 = 2160;
constexpr uint32_t TEST_RECT_SIZE_400 = 400;
constexpr uint32_t TEST_RECT_SIZE_200 = 200;
constexpr uint32_t TEST_RECT_SIZE_NEGATIVE_400 = -400;

constexpr time_t TEST_TIME_T_0 = 0;
constexpr int TEST_NUMBER_0 = 0;
constexpr int TEST_NUMBER_1 = 1;
constexpr int TEST_NUMBER_2 = 2;
constexpr int TEST_NUMBER_3 = 3;
constexpr int TEST_NUMBER_4 = 4;
constexpr int TEST_NUMBER_5 = 5;
constexpr int TEST_NUMBER_6 = 6;
constexpr int TEST_NUMBER_7 = 7;
constexpr int TEST_NUMBER_8 = 8;
constexpr int TEST_NUMBER_10 = 10;
} // namespace

// Global EGL state variables for SetUp/TearDown
static EGLDisplay g_eglDisplay = EGL_NO_DISPLAY;
static EGLConfig g_eglConfig = EGL_NO_CONFIG_KHR;
static EGLContext g_eglContext = EGL_NO_CONTEXT;
static EGLSurface g_eglSurface = EGL_NO_SURFACE;

// Common SetUp and TearDown functions implementation
void DrawingNativeGpuContextTestSetUp()
{
    g_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    EXPECT_NE(g_eglDisplay, EGL_NO_DISPLAY);

    EGLint eglMajVers;
    EGLint eglMinVers;
    EGLBoolean ret = eglInitialize(g_eglDisplay, &eglMajVers, &eglMinVers);
    EXPECT_EQ(ret, EGL_TRUE);

    EGLint count;
    EGLint configAttribs[] = {
        EGL_SURFACE_TYPE,    EGL_WINDOW_BIT,     EGL_RED_SIZE,  TEST_NUMBER_8,  EGL_GREEN_SIZE,
        TEST_NUMBER_8,       EGL_BLUE_SIZE,      TEST_NUMBER_8, EGL_ALPHA_SIZE, TEST_NUMBER_8,
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT, EGL_NONE,
    };
    ret = eglChooseConfig(g_eglDisplay, configAttribs, &g_eglConfig, TEST_NUMBER_1, &count);
    EXPECT_EQ(ret, EGL_TRUE);
    EXPECT_GE(count, TEST_NUMBER_1);

    const EGLint contextAttribs[] = { EGL_CONTEXT_CLIENT_VERSION, TEST_NUMBER_2, EGL_NONE };
    g_eglContext = eglCreateContext(g_eglDisplay, g_eglConfig, EGL_NO_CONTEXT, contextAttribs);
    EXPECT_NE(g_eglContext, EGL_NO_CONTEXT);

    EGLint attribs[] = { EGL_WIDTH, TEST_NUMBER_1, EGL_HEIGHT, TEST_NUMBER_1, EGL_NONE };
    g_eglSurface = eglCreatePbufferSurface(g_eglDisplay, g_eglConfig, attribs);
    EXPECT_NE(g_eglSurface, EGL_NO_SURFACE);

    ret = eglMakeCurrent(g_eglDisplay, g_eglSurface, g_eglSurface, g_eglContext);
    EXPECT_EQ(ret, EGL_TRUE);
}

void DrawingNativeGpuContextTestTearDown()
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
}

/**
 * @tc.name   testGpuContextCreateFromGLDestroyNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0100
 * @tc.desc   Test for creating and destroying GPU context with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestGpuContextCreateFromGLDestroyNormal()
{
    DrawingNativeGpuContextTestSetUp();
    OH_Drawing_GpuContextOptions options;
    options.allowPathMaskCaching = true;
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
    EXPECT_NE(gpuContext, nullptr);
    OH_Drawing_GpuContextDestroy(gpuContext);
    DrawingNativeGpuContextTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testGpuContextDestroyNULL
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0200
 * @tc.desc   Test for destroying GPU context with NULL parameter.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestGpuContextDestroyNULL()
{
    DrawingNativeGpuContextTestSetUp();
    OH_Drawing_GpuContextDestroy(nullptr);
    // add assert
    EXPECT_TRUE(true);
    DrawingNativeGpuContextTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testGpuContextCreateFromGLDestroyMultipleCalls
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0300
 * @tc.desc   Test for repeatedly creating and destroying GPU context.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL3
 */
int TestGpuContextCreateFromGLDestroyMultipleCalls()
{
    DrawingNativeGpuContextTestSetUp();
    for (int i = 0; i < TEST_LOOP_COUNT_10; i++) {
        OH_Drawing_GpuContextOptions options;
        options.allowPathMaskCaching = true;
        OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreateFromGL(options);
        EXPECT_NE(gpuContext, nullptr);
        OH_Drawing_GpuContextDestroy(gpuContext);
    }
    DrawingNativeGpuContextTestTearDown();
    return OH_DRAWING_SUCCESS;
}

/**
 * @tc.name   testGpuContextCreateNormal
 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_GPU_CONTEXT_0400
 * @tc.desc   Test for creating GPU context with normal parameters.
 * @tc.type   FUNCTION
 * @tc.size   SMALLTEST
 * @tc.level  LEVEL0
 */
int TestGpuContextCreateNormal()
{
    DrawingNativeGpuContextTestSetUp();
    OH_Drawing_GpuContext* gpuContext = OH_Drawing_GpuContextCreate();
    EXPECT_NE(gpuContext, nullptr);
    OH_Drawing_GpuContextDestroy(gpuContext);
    DrawingNativeGpuContextTestTearDown();
    return OH_DRAWING_SUCCESS;
}

} // namespace Drawing
} // namespace Rosen
} // namespace OHOS
