/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
#include <gtest/gtest.h>
#include <iservice_registry.h>
#include <native_image.h>
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include "graphic_common_c.h"
#include "surface_type.h"
#include "window.h"
#include "GLES/gl.h"
#include "buffer_log.h"
#include "graphic_error_code.h"

using namespace testing;
using namespace testing::ext;
using namespace std;

namespace OHOS::Rosen {
using GetPlatformDisplayExt = PFNEGLGETPLATFORMDISPLAYEXTPROC;
constexpr const char* EGL_EXT_PLATFORM_WAYLAND = "EGL_EXT_platform_wayland";
constexpr const char* EGL_KHR_PLATFORM_WAYLAND = "EGL_KHR_platform_wayland";
constexpr int32_t EGL_CONTEXT_CLIENT_VERSION_NUM = 2;
constexpr char CHARACTER_WHITESPACE = ' ';
constexpr const char* CHARACTER_STRING_WHITESPACE = " ";
constexpr const char* EGL_GET_PLATFORM_DISPLAY_EXT = "eglGetPlatformDisplayEXT";
constexpr int32_t MATRIX_SIZE = 16;

struct TEST_IMAGE {
    int a;
    bool b;
};

static bool CheckEglExtension(const char* extensions, const char* extension)
{
    size_t extlen = strlen(extension);
    const char* end = extensions + strlen(extensions);

    while (extensions < end) {
        size_t n = 0;
        /* Skip whitespaces, if any */
        if (*extensions == CHARACTER_WHITESPACE) {
            extensions++;
            continue;
        }
        n = strcspn(extensions, CHARACTER_STRING_WHITESPACE);
        /* Compare strings */
        if (n == extlen && strncmp(extension, extensions, n) == 0) {
            return true; /* Found */
        }
        extensions += n;
    }
    /* Not found */
    return false;
}

static EGLDisplay GetPlatformEglDisplay(EGLenum platform, void* native_display, const EGLint* attrib_list)
{
    static GetPlatformDisplayExt eglGetPlatformDisplayExt = NULL;

    if (!eglGetPlatformDisplayExt) {
        const char* extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
        if (extensions &&
            (CheckEglExtension(extensions, EGL_EXT_PLATFORM_WAYLAND) ||
                CheckEglExtension(extensions, EGL_KHR_PLATFORM_WAYLAND))) {
            eglGetPlatformDisplayExt = (GetPlatformDisplayExt)eglGetProcAddress(EGL_GET_PLATFORM_DISPLAY_EXT);
        }
    }

    if (eglGetPlatformDisplayExt) {
        return eglGetPlatformDisplayExt(platform, native_display, attrib_list);
    }

    return eglGetDisplay((EGLNativeDisplayType)native_display);
}

class NativeImageTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();

    static void InitEglContext();
    static void Deinit();

    static inline OH_NativeImage* image = nullptr;
    static inline OHNativeWindow* nativeWindow = nullptr;
    static inline GLuint textureId = 0;
    static inline GLuint textureId2 = 0;
    static inline EGLDisplay eglDisplay_ = EGL_NO_DISPLAY;
    static inline EGLContext eglContext_ = EGL_NO_CONTEXT;
    static inline EGLConfig config_;
    static void OnFrameAvailable(void *context);
};

void NativeImageTest::OnFrameAvailable(void *context)
{
    (void) context;
    cout << "OnFrameAvailable is called" << endl;
}

void NativeImageTest::SetUpTestCase()
{
    image = nullptr;
    nativeWindow = nullptr;
    glGenTextures(1, &textureId);
    glGenTextures(1, &textureId2);
}

void NativeImageTest::TearDownTestCase()
{
    image = nullptr;
    nativeWindow = nullptr;
    Deinit();
}

void NativeImageTest::InitEglContext()
{
    if (eglContext_ != EGL_NO_DISPLAY) {
        return;
    }

    BLOGI("Creating EGLContext!!!");
    eglDisplay_ = GetPlatformEglDisplay(EGL_PLATFORM_OHOS_KHR, EGL_DEFAULT_DISPLAY, NULL);
    if (eglDisplay_ == EGL_NO_DISPLAY) {
        BLOGW("Failed to create EGLDisplay gl errno : %{public}x", eglGetError());
        return;
    }

    EGLint major, minor;
    if (eglInitialize(eglDisplay_, &major, &minor) == EGL_FALSE) {
        BLOGE("Failed to initialize EGLDisplay");
        return;
    }

    if (eglBindAPI(EGL_OPENGL_ES_API) == EGL_FALSE) {
        BLOGE("Failed to bind OpenGL ES API");
        return;
    }

    unsigned int ret;
    EGLint count;
    EGLint config_attribs[] = { EGL_SURFACE_TYPE, EGL_WINDOW_BIT, EGL_RED_SIZE, 8, EGL_GREEN_SIZE, 8, EGL_BLUE_SIZE, 8,
        EGL_ALPHA_SIZE, 8, EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT, EGL_NONE };

    ret = eglChooseConfig(eglDisplay_, config_attribs, &config_, 1, &count);
    if (!(ret && static_cast<unsigned int>(count) >= 1)) {
        BLOGE("Failed to eglChooseConfig");
        return;
    }

    static const EGLint context_attribs[] = { EGL_CONTEXT_CLIENT_VERSION, EGL_CONTEXT_CLIENT_VERSION_NUM, EGL_NONE };

    eglContext_ = eglCreateContext(eglDisplay_, config_, EGL_NO_CONTEXT, context_attribs);
    if (eglContext_ == EGL_NO_CONTEXT) {
        BLOGE("Failed to create egl context %{public}x", eglGetError());
        return;
    }

    EGLint attribs[] = {EGL_WIDTH, 1, EGL_HEIGHT, 1, EGL_NONE};
    EGLSurface pbufferSurface_ = eglCreatePbufferSurface(eglDisplay_, config_, attribs);

    eglMakeCurrent(eglDisplay_, pbufferSurface_, pbufferSurface_, eglContext_);

    BLOGW("Create EGL context successfully, version %{public}d.%{public}d", major, minor);
}

void NativeImageTest::Deinit()
{
    if (eglDisplay_ == EGL_NO_DISPLAY) {
        return;
    }
    eglDestroyContext(eglDisplay_, eglContext_);
    eglMakeCurrent(eglDisplay_, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
    eglTerminate(eglDisplay_);
    eglReleaseThread();

    eglDisplay_ = EGL_NO_DISPLAY;
    eglContext_ = EGL_NO_CONTEXT;
}

/*
 * @tc.name: OHNativeImageCreate001
 * @tc.desc: test for call OH_NativeImage_Create and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageCreate001, Function | MediumTest | Level1)
{
    image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    ASSERT_NE(image, nullptr);
}

/*
 * @tc.name: OHNativeImageAcquireNativeWindow001
 * @tc.desc: test for call OH_NativeImage_AcquireNativeWindow by abnormal input and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindow001, Function | MediumTest | Level2)
{
    nativeWindow = OH_NativeImage_AcquireNativeWindow(nullptr);
    ASSERT_EQ(nativeWindow, nullptr);
}

/*
 * @tc.name: OHNativeImageAcquireNativeWindow001
 * @tc.desc: test for call OH_NativeImage_AcquireNativeWindow and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindow002, Function | MediumTest | Level1)
{
    nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativeWindow, nullptr);
}

/*
 * @tc.name: OHNativeImageAttachContext001
 * @tc.desc: test for call OH_NativeImage_AttachContext by abnormal input and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeImageTest, OHNativeImageAttachContext001, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeImage_AttachContext(nullptr, textureId);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageDetachContext001
 * @tc.desc: test for call OHNativeImageDetachContext by abnormal input and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeImageTest, OHNativeImageDetachContext001, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeImage_DetachContext(nullptr);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageDetachContext002
 * @tc.desc: test for call OHNativeImageDetachContext and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageDetachContext002, Function | MediumTest | Level1)
{
    int32_t ret = OH_NativeImage_DetachContext(image);
    ASSERT_EQ(ret, NATIVE_ERROR_EGL_STATE_UNKNOWN);
}

/*
 * @tc.name: OHNativeImageDetachContext003
 * @tc.desc: test for call OHNativeImageDetachContext and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageDetachContext003, Function | MediumTest | Level1)
{
    InitEglContext();
    int32_t ret = OH_NativeImage_DetachContext(image);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageDetachContext003
 * @tc.desc: test for call OH_NativeImage_AttachContext and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageAttachContext002, Function | MediumTest | Level1)
{
    int32_t ret = OH_NativeImage_AttachContext(image, textureId);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageUpdateSurfaceImage001
 * @tc.desc: test for  call OH_NativeImage_UpdateSurfaceImage by abnormal input and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeImageTest, OHNativeImageUpdateSurfaceImage001, Function | MediumTest | Level2)
{
    int32_t ret = OH_NativeImage_UpdateSurfaceImage(nullptr);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageUpdateSurfaceImage002
 * @tc.desc: test for call OH_NativeImage_UpdateSurfaceImage and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageUpdateSurfaceImage002, Function | MediumTest | Level1)
{
    int32_t ret = OH_NativeImage_UpdateSurfaceImage(image);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageUpdateSurfaceImage003
 * @tc.desc: test for call OH_NativeImage_UpdateSurfaceImage.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageUpdateSurfaceImage003, Function | MediumTest | Level1)
{
    int code = SET_USAGE;
    int32_t usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA;
    int32_t ret = NativeWindowHandleOpt(nativeWindow, code, usage);
    if (ret != NATIVE_ERROR_OK) {
        std::cout << "NativeWindowHandleOpt SET_USAGE faile" << std::endl;
    }
    code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    ret = NativeWindowHandleOpt(nativeWindow, code, width, height);
    if (ret != NATIVE_ERROR_OK) {
        std::cout << "NativeWindowHandleOpt SET_BUFFER_GEOMETRY failed" << std::endl;
    }
    code = SET_STRIDE;
    int32_t stride = 0x8;
    ret = NativeWindowHandleOpt(nativeWindow, code, stride);
    if (ret != NATIVE_ERROR_OK) {
        std::cout << "NativeWindowHandleOpt SET_STRIDE failed" << std::endl;
    }
    code = SET_FORMAT;
    int32_t format = GRAPHIC_PIXEL_FMT_RGBA_8888;
    ret = NativeWindowHandleOpt(nativeWindow, code, format);
    if (ret != NATIVE_ERROR_OK) {
        std::cout << "NativeWindowHandleOpt SET_FORMAT failed" << std::endl;
    }

    NativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    delete region;

    ret = OH_NativeImage_UpdateSurfaceImage(image);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageGetTimestamp001
 * @tc.desc: test for call OH_NativeImage_GetTimestamp by abnormal input and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeImageTest, OHNativeImageGetTimestamp001, Function | MediumTest | Level2)
{
    int64_t timeStamp = OH_NativeImage_GetTimestamp(nullptr);
    ASSERT_EQ(timeStamp, -1);
}

/*
 * @tc.name: OHNativeImageGetTimestamp002
 * @tc.desc: test for call OH_NativeImage_GetTimestamp and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageGetTimestamp002, Function | MediumTest | Level1)
{
    int64_t timeStamp = OH_NativeImage_GetTimestamp(image);
    ASSERT_NE(timeStamp, NATIVE_ERROR_UNKNOWN);
}

/*
 * @tc.name: OHNativeImageGetTransformMatrix001
 * @tc.desc: test for call OH_NativeImage_GetTransformMatrix by abnormal input and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeImageTest, OHNativeImageGetTransformMatrix001, Function | MediumTest | Level2)
{
    float matrix[MATRIX_SIZE];
    int32_t ret = OH_NativeImage_GetTransformMatrix(nullptr, matrix);
    ASSERT_NE(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageGetTransformMatrix002
 * @tc.desc: test for call OH_NativeImage_GetTransformMatrix and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageGetTransformMatrix002, Function | MediumTest | Level1)
{
    float matrix[MATRIX_SIZE];
    int32_t ret = OH_NativeImage_GetTransformMatrix(image, matrix);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

bool CheckMatricIsSame(float matrixOld[MATRIX_SIZE], float matrixNew[MATRIX_SIZE])
{
    for (int32_t i = 0; i < MATRIX_SIZE; i++) {
        if (fabs(matrixOld[i] - matrixNew[i]) > 1e-6) {
            return false;
        }
    }
    return true;
}

int32_t g_testType[] = {
    GraphicTransformType::GRAPHIC_ROTATE_NONE, GraphicTransformType::GRAPHIC_ROTATE_90,
    GraphicTransformType::GRAPHIC_ROTATE_180, GraphicTransformType::GRAPHIC_ROTATE_270,
    GraphicTransformType::GRAPHIC_FLIP_H, GraphicTransformType::GRAPHIC_FLIP_V,
    GraphicTransformType::GRAPHIC_FLIP_H_ROT90, GraphicTransformType::GRAPHIC_FLIP_V_ROT90,
    GraphicTransformType::GRAPHIC_FLIP_H_ROT180, GraphicTransformType::GRAPHIC_FLIP_V_ROT180,
    GraphicTransformType::GRAPHIC_FLIP_H_ROT270, GraphicTransformType::GRAPHIC_FLIP_V_ROT270,
};
float g_matrixArr[][MATRIX_SIZE] = {
    {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {-1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {-1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {-1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},
};

/*
 * @tc.name: OHNativeImageGetTransformMatrix003
 * @tc.desc: test for call OH_NativeImage_GetTransformMatrix and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageGetTransformMatrix003, Function | MediumTest | Level1)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }

    if (nativeWindow == nullptr) {
        nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
        ASSERT_NE(nativeWindow, nullptr);
    }

    OH_OnFrameAvailableListener listener;
    listener.context = this;
    listener.onFrameAvailable = NativeImageTest::OnFrameAvailable;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(image, listener);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    NativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    
    for (int32_t i = 0; i < sizeof(g_testType) / sizeof(int32_t); i++) {
        int code = SET_TRANSFORM;
        ret = NativeWindowHandleOpt(nativeWindow, code, g_testType[i]);
        ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);

        rect->x = 0x100;
        rect->y = 0x100;
        rect->w = 0x100;
        rect->h = 0x100;
        region->rects = rect;
        ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);

        ret = OH_NativeImage_UpdateSurfaceImage(image);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);

        float matrix[16];
        int32_t ret = OH_NativeImage_GetTransformMatrix(image, matrix);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);

        bool bRet = CheckMatricIsSame(matrix, g_matrixArr[i]);
        ASSERT_EQ(bRet, true);
    }
    delete region;
}

float g_matrixArrV2[][MATRIX_SIZE] = {
    {1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1},   // 单位矩阵
    {0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},    // 90度矩阵
    {-1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1},   // 180度矩阵
    {0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1},  // 270度矩阵
    {-1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1},  // 水平翻转
    {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},    // 垂直翻转
    {0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1},   // 水平*90
    {0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1},   // 垂直*90
    {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1},    // 水平*180
    {-1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1},  // 垂直*180
    {0, -1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1},   // 水平*270
    {0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1},   // 垂直*270
};

/*
* Function: OH_NativeImage_GetTransformMatrix
* Type: Function
* Rank: Important(1)
* EnvConditions: N/A
* CaseDescription: 1. call OH_NativeImage_GetTransformMatrix
*                  2. check ret
* @tc.require: issueI5KG61
*/
HWTEST_F(NativeImageTest, OHNativeImageGetTransformMatrix004, Function | MediumTest | Level1)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }

    if (nativeWindow == nullptr) {
        nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
        ASSERT_NE(nativeWindow, nullptr);
    }

    OH_OnFrameAvailableListener listener;
    listener.context = this;
    listener.onFrameAvailable = NativeImageTest::OnFrameAvailable;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(image, listener);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    NativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();

    for (int32_t i = 0; i < sizeof(g_testType) / sizeof(int32_t); i++) {
        int code = SET_TRANSFORM;
        ret = NativeWindowHandleOpt(nativeWindow, code, g_testType[i]);
        ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);

        rect->x = 0x100;
        rect->y = 0x100;
        rect->w = 0x100;
        rect->h = 0x100;
        region->rects = rect;
        ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);

        ret = OH_NativeImage_UpdateSurfaceImage(image);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);

        float matrix[16];
        int32_t ret = OH_NativeImage_GetTransformMatrixV2(image, matrix);
        ASSERT_EQ(ret, NATIVE_ERROR_OK);

        bool bRet = CheckMatricIsSame(matrix, g_matrixArrV2[i]);
        ASSERT_EQ(bRet, true);
    }
    delete region;
}

/*
 * @tc.name: OHNativeImageGetTransformMatrix003
 * @tc.desc: test for call OH_NativeImage_GetTransformMatrix with another texture and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageAttachContext003, Function | MediumTest | Level1)
{
    int32_t ret = OH_NativeImage_AttachContext(image, textureId2);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageUpdateSurfaceImage004
 * @tc.desc: test for OH_NativeImage_UpdateSurfaceImage after the OPENGL ES texture changed and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageUpdateSurfaceImage004, Function | MediumTest | Level1)
{
    NativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    delete region;

    ret = OH_NativeImage_UpdateSurfaceImage(image);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageDetachContext004
 * @tc.desc: test for call OH_NativeImage_DetachContext and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageDetachContext004, Function | MediumTest | Level1)
{
    int32_t ret = OH_NativeImage_DetachContext(image);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageAttachContext004
 * @tc.desc: test for call OH_NativeImage_AttachContext after OH_NativeImage_DetachContext and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageAttachContext004, Function | MediumTest | Level1)
{
    int32_t ret = OH_NativeImage_AttachContext(image, textureId2);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageUpdateSurfaceImage005
 * @tc.desc: test for OHNativeImageUpdateSurfaceImage again and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageUpdateSurfaceImage005, Function | MediumTest | Level1)
{
    NativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    delete region;

    ret = OH_NativeImage_UpdateSurfaceImage(image);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageGetSurfaceId001
 * @tc.desc: test for call OH_NativeImage_GetSurfaceId
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageGetSurfaceId001, Function | MediumTest | Level1)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }

    uint64_t surfaceId;
    int32_t ret = OH_NativeImage_GetSurfaceId(image, &surfaceId);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageSetOnFrameAvailableListener001
 * @tc.desc: test for call OH_NativeImage_SetOnFrameAvailableListener
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageSetOnFrameAvailableListener001, Function | MediumTest | Level1)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }

    if (nativeWindow == nullptr) {
        nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
        ASSERT_NE(nativeWindow, nullptr);
    }

    OH_OnFrameAvailableListener listener;
    listener.context = this;
    listener.onFrameAvailable = NativeImageTest::OnFrameAvailable;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(image, listener);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    NativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);

    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, nativeWindowBuffer, fenceFd, *region);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    delete region;

    ret = OH_NativeImage_UpdateSurfaceImage(image);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}

/*
 * @tc.name: OHNativeImageUnsetOnFrameAvailableListener001
 * @tc.desc: test for call OH_NativeImage_UnsetOnFrameAvailableListener
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageUnsetOnFrameAvailableListener001, Function | MediumTest | Level1)
{
    int32_t ret = OH_NativeImage_UnsetOnFrameAvailableListener(image);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
}
/*
 * @tc.name: OHNativeImageDestroy001
 * @tc.desc: test for call OH_NativeImage_Destroy by abnormal input and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageDestroy001, Function | MediumTest | Level2)
{
    OH_NativeImage_Destroy(nullptr);
    ASSERT_NE(image, nullptr);
}

/*
 * @tc.name: OHNativeImageDestroy002
 * @tc.desc: test for call OH_NativeImage_Destroy and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHNativeImageDestroy002, Function | MediumTest | Level1)
{
    OH_NativeImage_Destroy(&image);
    ASSERT_EQ(image, nullptr);
}

/*
 * @tc.name: OHNativeImageAcquireNativeWindowBufferNormal
 * @tc.desc: test for Normal OH_NativeImage_AcquireNativeWindowBuffer and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */

HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindowBufferNormal, Function | MediumTest | Level1)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }
    OHNativeWindow* nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativewindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, usage);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t retq = OH_NativeWindow_NativeWindowRequestBuffer(nativewindow, &nativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    retq = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, nativeWindowBuffer, fenceFd, *region);
    int32_t ret = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    int32_t ret1 = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ASSERT_EQ(ret1, NATIVE_ERROR_OK);
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(nativewindow);
}

/*
 * @tc.name: OH_NativeImage_AcquireNativeWindowBuffer4KBoundary
 * @tc.desc: test for call OH_NativeImage_AcquireNativeWindowBuffer4KBoundary and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */

HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindowBuffer4KBoundary, Function | MediumTest | Level1) {
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }
    OHNativeWindow *nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativewindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 4096;
    int32_t height = 2160;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, usage);
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t retq = OH_NativeWindow_NativeWindowRequestBuffer(nativewindow, &nativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    retq = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, nativeWindowBuffer, fenceFd, *region);
    int32_t ret = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    int32_t ret1 = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ASSERT_EQ(ret1, NATIVE_ERROR_OK);
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(nativewindow);
}

/*
 * @tc.name: OHNativeImageAcquireNativeWindowBufferCalls
 * @tc.desc: test for Calls OH_NativeImage_AcquireNativeWindowBuffer and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindowBufferCalls, Function | MediumTest | Level2)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }
    OHNativeWindow* nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativewindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, usage);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t retq = OH_NativeWindow_NativeWindowRequestBuffer(nativewindow, &nativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    retq = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, nativeWindowBuffer, fenceFd, *region);
    int32_t ret0;
    for (int i = 0; i < 10; i++) {
        ret0 = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    }
    int32_t ret = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    int32_t ret1 = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, fenceFd);
    ASSERT_EQ(ret0, NATIVE_ERROR_NO_BUFFER);
    ASSERT_EQ(ret, NATIVE_ERROR_NO_BUFFER);
    ASSERT_EQ(ret1, NATIVE_ERROR_OK);
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(nativewindow);
}
/*
 * @tc.name: OHNativeImageReleaseNativeWindowBufferAbnormal001
 * @tc.desc: test for Abnormal OH_NativeImage_AcquireNativeWindowBuffer and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindowBufferAbnormal001, Function | MediumTest | Level3)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }
    OHNativeWindow* nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativewindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, usage);
    OHNativeWindowBuffer* nativeWindowBuffer = 0;
    int fenceFd = -1;
    int32_t retq = OH_NativeWindow_NativeWindowRequestBuffer(nativewindow, &nativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    retq = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, nativeWindowBuffer, fenceFd, *region);
    int32_t ret = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    int32_t ret1 = OH_NativeImage_ReleaseNativeWindowBuffer(image, 0, fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ASSERT_EQ(ret1, NATIVE_ERROR_INVALID_ARGUMENTS);
    delete region;
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(nativewindow);
}
/*
 * @tc.name: OHNativeImageReleaseNativeWindowBufferAbnormal002
 * @tc.desc: test for Abnormal OH_NativeImage_AcquireNativeWindowBuffer and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindowBufferAbnormal002, Function | MediumTest | Level3)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }
    OHNativeWindow* nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativewindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, usage);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t retq = OH_NativeWindow_NativeWindowRequestBuffer(nativewindow, &nativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    retq = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, nativeWindowBuffer, fenceFd, *region);
    image = nullptr;
    int32_t ret2 = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    int32_t ret3 = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, fenceFd);
    ASSERT_EQ(ret2, NATIVE_ERROR_INVALID_ARGUMENTS);
    ASSERT_EQ(ret3, NATIVE_ERROR_INVALID_ARGUMENTS);
    delete region;
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(nativewindow);
}
/*
 * @tc.name: OHNativeImageReleaseNativeWindowBufferAbnormal003
 * @tc.desc: test for Abnormal OH_NativeImage_AcquireNativeWindowBuffer and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindowBufferAbnormal003, Function | MediumTest | Level3)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }
    OHNativeWindow* nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativewindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, usage);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t retq = OH_NativeWindow_NativeWindowRequestBuffer(nativewindow, &nativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    retq = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, nativeWindowBuffer, fenceFd, *region);
    image = 0;
    int32_t ret4 = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    int32_t ret5 = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, fenceFd);
    ASSERT_EQ(ret4, NATIVE_ERROR_INVALID_ARGUMENTS);
    ASSERT_EQ(ret5, NATIVE_ERROR_INVALID_ARGUMENTS);
    delete region;
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(nativewindow);
}
/*
 * @tc.name: OHNativeImageReleaseNativeWindowBufferAbnormal004
 * @tc.desc: test for Abnormal OH_NativeImage_AcquireNativeWindowBuffer and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindowBufferAbnormal004, Function | MediumTest | Level3)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }
    OHNativeWindow* nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativewindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, usage);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = 0;
    int32_t retq = OH_NativeWindow_NativeWindowRequestBuffer(nativewindow, &nativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    retq = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, nativeWindowBuffer, fenceFd, *region);
    int32_t ret6 = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, 0);
    int32_t ret7 = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    ret7 = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, 0);
    ASSERT_EQ(ret6, NATIVE_ERROR_INVALID_ARGUMENTS);
    ASSERT_EQ(ret7, NATIVE_ERROR_OK);
    delete region;
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(nativewindow);
}
/*
 * @tc.name: OHNativeImageReleaseNativeWindowBufferAbnormal005
 * @tc.desc: test for Abnormal OH_NativeImage_AcquireNativeWindowBuffer and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeImageTest, OHNativeImageAcquireNativeWindowBufferAbnormal005, Function | MediumTest | Level3)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }
    OHNativeWindow* nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativewindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, usage);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t retq = OH_NativeWindow_NativeWindowRequestBuffer(nativewindow, &nativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    retq = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, nativeWindowBuffer, fenceFd, *region);
    int32_t ret8 = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, fenceFd);
    int32_t ret9 = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret8, NATIVE_ERROR_BUFFER_STATE_INVALID);
    ASSERT_EQ(ret9, NATIVE_ERROR_OK);
    delete region;
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(nativewindow);
}
/*
 * @tc.name: OHNativeImageReleaseNativeWindowBufferAbnormal006
 * @tc.desc: test for Abnormal OH_NativeImage_ReleaseNativeWindowBuffer and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeImageTest, OHNativeImageReleaseNativeWindowBufferAbnormal006, Function | MediumTest | Level3)
{
    if (image == nullptr) {
        image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
        ASSERT_NE(image, nullptr);
    }
    OHNativeWindow* nativewindow = OH_NativeImage_AcquireNativeWindow(image);
    ASSERT_NE(nativewindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(nativewindow, code, usage);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = -1;
    int32_t retq = OH_NativeWindow_NativeWindowRequestBuffer(nativewindow, &nativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    retq = OH_NativeWindow_NativeWindowFlushBuffer(nativewindow, nativeWindowBuffer, fenceFd, *region);
    int32_t ret12 = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, fenceFd);
    ASSERT_EQ(ret12, NATIVE_ERROR_BUFFER_STATE_INVALID);
    delete region;
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindow(nativewindow);
}
/*
 * @tc.name: OHConsumerSurfaceCreateNormal
 * @tc.desc: test for call OH_ConsumerSurface_Create and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHConsumerSurfaceCreateNormal, Function | MediumTest | Level1)
{
    OH_NativeImage* newImage = nullptr;
    newImage = OH_ConsumerSurface_Create();
    ASSERT_NE(newImage, nullptr);
    OHNativeWindow* newNativeWindow = OH_NativeImage_AcquireNativeWindow(newImage);
    ASSERT_NE(newNativeWindow, nullptr);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = 0x100;
    int32_t height = 0x100;
    int32_t res = OH_NativeWindow_NativeWindowHandleOpt(newNativeWindow, code, width, height);
    ASSERT_EQ(res, NATIVE_ERROR_OK);
    code = SET_USAGE;
    int32_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    res = OH_NativeWindow_NativeWindowHandleOpt(newNativeWindow, code, usage);
    OHNativeWindowBuffer* newNativeWindowBuffer = nullptr;
    int fenceFd;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(newNativeWindow, &newNativeWindowBuffer, &fenceFd);
    struct Region *region = new Region();
    struct Region::Rect *rect = new Region::Rect();
    rect->x = 0x100;
    rect->y = 0x100;
    rect->w = 0x100;
    rect->h = 0x100;
    region->rects = rect;
    ret = OH_NativeWindow_NativeWindowFlushBuffer(newNativeWindow, newNativeWindowBuffer, fenceFd, *region);
    ret = OH_NativeImage_AcquireNativeWindowBuffer(newImage, &newNativeWindowBuffer, &fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ASSERT_NE(newNativeWindowBuffer, nullptr);
    ret = OH_NativeImage_ReleaseNativeWindowBuffer(newImage, newNativeWindowBuffer, fenceFd);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    uint64_t surfaceId = 999999999;
    ret = OH_NativeImage_GetSurfaceId(newImage, &surfaceId);
    ASSERT_NE(surfaceId, 999999999);
    OH_OnFrameAvailableListener listener;
    listener.context = this;
    listener.onFrameAvailable = NativeImageTest::OnFrameAvailable;
    ret = OH_NativeImage_SetOnFrameAvailableListener(newImage, listener);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    ret = OH_NativeImage_UnsetOnFrameAvailableListener(newImage);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    OH_NativeImage_Destroy(&newImage);
    ASSERT_EQ(newImage, nullptr);
    OH_NativeWindow_DestroyNativeWindow(newNativeWindow);
}

/*
 * @tc.name: OHConsumerSurfaceCreateMuch
 * @tc.desc: test for call OH_ConsumerSurface_Create and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHConsumerSurfaceCreateMuch, Function | MediumTest | Level1)
{
    OH_NativeImage* newImage[500];
    for (int i = 0; i < 500; i++) {
        newImage[i] = nullptr;
        newImage[i] = OH_ConsumerSurface_Create();
        ASSERT_NE(newImage[i], nullptr);
    }
    for (int i = 0; i < 500; i++) {
        OH_NativeImage_Destroy(&newImage[i]);
        ASSERT_EQ(newImage[i], nullptr);
    }
}
/*
 * @tc.name: OHConsumerSurfaceSetDefaultUsageNormal
 * @tc.desc: test for Normal OH_ConsumerSuface_SetDefaultUsage and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHConsumerSurfaceSetDefaultUsageNormal, Function | MediumTest | Level1)
{
    OH_NativeImage* image = nullptr;
    image = OH_ConsumerSurface_Create();
    ASSERT_NE(image, nullptr);
    int32_t ret = OH_ConsumerSurface_SetDefaultUsage(image, 0);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    int32_t ret1 = OH_ConsumerSurface_SetDefaultUsage(image, 1000);
    ASSERT_EQ(ret1, NATIVE_ERROR_OK);
    int32_t ret2 = OH_ConsumerSurface_SetDefaultUsage(image, UINT64_MAX - 1);
    ASSERT_EQ(ret2, NATIVE_ERROR_OK);
    
    uint64_t usage[] = {0, 1000, UINT64_MAX - 1};
    for (int i = 0; i < 3; i++) {
        usage[i] += 1;
        int32_t ret3 = OH_ConsumerSurface_SetDefaultUsage(image, usage[i]);
        ASSERT_EQ(ret3, NATIVE_ERROR_OK);
    }
    for (int i = 0; i < 100000; i++) {
        int32_t ret4 = OH_ConsumerSurface_SetDefaultUsage(image, 100);
        ASSERT_EQ(ret4, NATIVE_ERROR_OK);
    }
    OH_NativeImage_Destroy(&image);
}
/*
 * @tc.name: OHConsumerSurfaceSetDefaultUsageAbnormal
 * @tc.desc: test for AbNormal OH_ConsumerSuface_SetDefaultUsage and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeImageTest, OHConsumerSurfaceSetDefaultUsageAbnormal, Function | MediumTest | Level3)
{
    OH_NativeImage* image = nullptr;
    image = OH_ConsumerSurface_Create();
    ASSERT_NE(image, nullptr);
    int32_t ret = OH_ConsumerSurface_SetDefaultUsage(image, -1);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    int32_t ret1 = OH_ConsumerSurface_SetDefaultUsage(image, -1000);
    ASSERT_EQ(ret1, NATIVE_ERROR_OK);
    int32_t ret2 = OH_ConsumerSurface_SetDefaultUsage(image, UINT64_MAX);
    ASSERT_EQ(ret2, NATIVE_ERROR_OK);
    int32_t ret3 = OH_ConsumerSurface_SetDefaultUsage(image, -UINT64_MAX);
    ASSERT_EQ(ret3, NATIVE_ERROR_OK);
    int32_t ret4 = OH_ConsumerSurface_SetDefaultUsage(nullptr, 100);
    ASSERT_EQ(ret4, NATIVE_ERROR_INVALID_ARGUMENTS);
    OH_NativeImage_Destroy(&image);
}
/*
 * @tc.name: OHConsumerSurfaceSetDefaultSizeNormal
 * @tc.desc: test for Normal OH_ConsumerSuface_SetDefaultSize and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 1
 */
HWTEST_F(NativeImageTest, OHConsumerSurfaceSetDefaultSizeNormal, Function | MediumTest | Level1)
{
    OH_NativeImage* image = nullptr;
    image = OH_ConsumerSurface_Create();
    ASSERT_NE(image, nullptr);
    int32_t res = 1 << 16;
    int32_t ret = OH_ConsumerSurface_SetDefaultSize(image, 1, 1);
    ASSERT_EQ(ret, NATIVE_ERROR_OK);
    int32_t ret1 = OH_ConsumerSurface_SetDefaultSize(image, 1, res - 1);
    ASSERT_EQ(ret1, NATIVE_ERROR_OK);
    int32_t ret2 = OH_ConsumerSurface_SetDefaultSize(image, res - 1, 1);
    ASSERT_EQ(ret2, NATIVE_ERROR_OK);
    int32_t ret3 = OH_ConsumerSurface_SetDefaultSize(image, 100, 100);
    ASSERT_EQ(ret3, NATIVE_ERROR_OK);
    int32_t ret4 = OH_ConsumerSurface_SetDefaultSize(image, 10000, 10000);
    ASSERT_EQ(ret4, NATIVE_ERROR_OK);
    int32_t ret5 = OH_ConsumerSurface_SetDefaultSize(image, res - 1, res - 1);
    ASSERT_EQ(ret5, NATIVE_ERROR_OK);
    
    int32_t w[] = {1, 100, 10000};
    int32_t h[] = {1, 100, 10000};
    for (int i = 0; i < 3; i++) {
        w[i] += 1;
        h[i] += 1;
        int32_t ret6 = OH_ConsumerSurface_SetDefaultSize(image, w[i], h[i]);
        ASSERT_EQ(ret6, NATIVE_ERROR_OK);
    }
    for (int i = 0; i < 100000; i++) {
        int32_t ret7 = OH_ConsumerSurface_SetDefaultSize(image, 1, 1);
        ASSERT_EQ(ret7, NATIVE_ERROR_OK);
    }
    OH_NativeImage_Destroy(&image);
}
/*
 * @tc.name: OHConsumerSurfaceSetDefaultSizeAbNormal
 * @tc.desc: test for AbNormal OH_ConsumerSuface_SetDefaultSize and check ret.
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 3
 */
HWTEST_F(NativeImageTest, OHConsumerSurfaceSetDefaultSizeAbNormal, Function | MediumTest | Level3)
{
    OH_NativeImage* image = nullptr;
    image = OH_ConsumerSurface_Create();
    ASSERT_NE(image, nullptr);
    int32_t res = 1 << 16;
    int32_t ret = OH_ConsumerSurface_SetDefaultSize(image, 1, 0);
    ASSERT_EQ(ret, NATIVE_ERROR_INVALID_ARGUMENTS);
    int32_t ret1 = OH_ConsumerSurface_SetDefaultSize(image, -1, 0);
    ASSERT_EQ(ret1, NATIVE_ERROR_INVALID_ARGUMENTS);
    int32_t ret2 = OH_ConsumerSurface_SetDefaultSize(image, 0, -1);
    ASSERT_EQ(ret2, NATIVE_ERROR_INVALID_ARGUMENTS);
    int32_t ret3 = OH_ConsumerSurface_SetDefaultSize(image, -1000, -1000);
    ASSERT_EQ(ret3, NATIVE_ERROR_INVALID_ARGUMENTS);
    int32_t ret4 = OH_ConsumerSurface_SetDefaultSize(image, 1000, -1000);
    ASSERT_EQ(ret4, NATIVE_ERROR_INVALID_ARGUMENTS);
    int32_t ret5 = OH_ConsumerSurface_SetDefaultSize(image, -res, 100);
    ASSERT_EQ(ret5, NATIVE_ERROR_INVALID_ARGUMENTS);
    int32_t ret6 = OH_ConsumerSurface_SetDefaultSize(image, -100, res - 1);
    ASSERT_EQ(ret6, NATIVE_ERROR_INVALID_ARGUMENTS);
    int32_t ret7 = OH_ConsumerSurface_SetDefaultSize(image, -res, -res);
    ASSERT_EQ(ret7, NATIVE_ERROR_INVALID_ARGUMENTS);
    int32_t ret8 = OH_ConsumerSurface_SetDefaultSize(image, res + 1, res + 1);
    ASSERT_EQ(ret8, NATIVE_ERROR_OK);
    int32_t ret9 = OH_ConsumerSurface_SetDefaultSize(nullptr, 100, 100);
    ASSERT_EQ(ret9, NATIVE_ERROR_INVALID_ARGUMENTS);
    OH_NativeImage_Destroy(&image);
}
}
