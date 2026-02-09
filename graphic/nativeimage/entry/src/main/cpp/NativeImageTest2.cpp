/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "NativeImageTest.h"
#include "common/native_common.h"
#include "napi/native_api.h"
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES2/gl2ext.h>
#include <GLES3/gl32.h>
#include <cstring>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <native_window/external_window.h>
#include <common/log_common.h>

using GetPlatformDisplayExt = PFNEGLGETPLATFORMDISPLAYEXTPROC;
constexpr const char *EGL_EXT_PLATFORM_WAYLAND = "EGL_EXT_platform_wayland";
constexpr const char *EGL_KHR_PLATFORM_WAYLAND = "EGL_KHR_platform_wayland";
constexpr int32_t EGL_CONTEXT_CLIENT_VERSION_NUM = 2;
constexpr char CHARACTER_WHITESPACE = ' ';
constexpr const char *CHARACTER_STRING_WHITESPACE = " ";
constexpr const char *EGL_GET_PLATFORM_DISPLAY_EXT = "eglGetPlatformDisplayEXT";
static EGLContext eglContext_ = EGL_NO_CONTEXT;
static EGLDisplay eglDisplay_ = EGL_NO_DISPLAY;
static inline EGLConfig config_;
static int32_t g_callBack = 0;

static bool CheckEglExtension(const char *extensions, const char *extension)
{
    size_t extlen = strlen(extension);
    const char *end = extensions + strlen(extensions);

    while (extensions < end) {
        size_t n = PARAM_0;
        if (*extensions == CHARACTER_WHITESPACE) {
            extensions++;
            continue;
        }
        n = strcspn(extensions, CHARACTER_STRING_WHITESPACE);
        if (n == extlen && strncmp(extension, extensions, n) == PARAM_0) {
            return true;
        }
        extensions += n;
    }
    return false;
}

static EGLDisplay GetPlatformEglDisplay(EGLenum platform, void *native_display, const EGLint *attrib_list)
{
    static GetPlatformDisplayExt eglGetPlatformDisplayExt = nullptr;

    if (!eglGetPlatformDisplayExt) {
        const char *extensions = eglQueryString(EGL_NO_DISPLAY, EGL_EXTENSIONS);
        if (extensions && (CheckEglExtension(extensions, EGL_EXT_PLATFORM_WAYLAND) ||
                           CheckEglExtension(extensions, EGL_KHR_PLATFORM_WAYLAND))) {
            eglGetPlatformDisplayExt = (GetPlatformDisplayExt)eglGetProcAddress(EGL_GET_PLATFORM_DISPLAY_EXT);
        }
    }

    if (eglGetPlatformDisplayExt) {
        return eglGetPlatformDisplayExt(platform, native_display, attrib_list);
    }

    return eglGetDisplay((EGLNativeDisplayType)native_display);
}

static void InitEGLEnv()
{
    eglDisplay_ = GetPlatformEglDisplay(EGL_PLATFORM_OHOS_KHR, EGL_DEFAULT_DISPLAY, nullptr);
    EGLint major;
    EGLint minor;
    EGLBoolean initResult = eglInitialize(eglDisplay_, &major, &minor);
    if (initResult == EGL_FALSE) {
        return;
    }
    EGLBoolean bindResult = eglBindAPI(EGL_OPENGL_ES_API);
    if (bindResult == EGL_FALSE) {
        return;
    }
    unsigned int ret;
    EGLint count;
    EGLint config_attribs[] = {EGL_SURFACE_TYPE, EGL_WINDOW_BIT, EGL_RED_SIZE,        PARAM_8,
                               EGL_GREEN_SIZE,   PARAM_8,        EGL_BLUE_SIZE,       PARAM_8,
                               EGL_ALPHA_SIZE,   PARAM_8,        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT,
                               EGL_NONE};

    ret = eglChooseConfig(eglDisplay_, config_attribs, &config_, PARAM_1, &count);
    if (ret == 0) {
        return;
    }
    static const EGLint context_attribs[] = {EGL_CONTEXT_CLIENT_VERSION, EGL_CONTEXT_CLIENT_VERSION_NUM, EGL_NONE};
    eglContext_ = eglCreateContext(eglDisplay_, config_, EGL_NO_CONTEXT, context_attribs);
    if (eglContext_ == EGL_NO_CONTEXT) {
        return;
    }
    eglMakeCurrent(eglDisplay_, EGL_NO_SURFACE, EGL_NO_SURFACE, eglContext_);
}

static void DealCallback(void * context)
{
    g_callBack++;
    return;
}

static void OnFrameAvailable(void *context)
{
    DealCallback(context);
    return;
}

static OH_NativeImage *getNativeImage()
{
    GLuint textureId = SUCCESS;
    glGenTextures(ONEVAL, &textureId);
    OH_NativeImage *image = OH_NativeImage_Create(textureId, GL_TEXTURE_2D);
    return image;
}

napi_value OHNativeImageCreateWithSingleBufferModeUsingTextImageNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    GLenum nativeImageTexId_;
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, nativeImageTexId_);
    nativeImage = OH_NativeImage_CreateWithSingleBufferMode(nativeImageTexId_, GL_TEXTURE_EXTERNAL_OES, true);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

napi_value OHNativeImageCreateWithSingleBufferModeUsingTextImageNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *nativeImage = nullptr;
    InitEGLEnv();
    nativeImage = OH_NativeImage_CreateWithSingleBufferMode(0, 0, true);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    nativeImage = OH_NativeImage_CreateWithSingleBufferMode(NUM_MAX, NUM_MAX, true);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

napi_value OHNativeImageCreateWithSingleBufferModeUsingTextImageAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    OH_NativeImage *nativeImage = OH_NativeImage_CreateWithSingleBufferMode(-1, -1, true);
    if (nativeImage != nullptr) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);
    nativeImage = OH_NativeImage_CreateWithSingleBufferMode(NUM_MAX + 1, NUM_MAX + 1, true);
    if (nativeImage != nullptr) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

napi_value OHNativeImageCreateWithSingleBufferModeUsingTextImageMultipleCalls(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const int count = NUMBER_10;
    OH_NativeImage *imageArray[10] = {nullptr};
    for (int i = 0; i < count; ++i) {
        glBindTexture(GL_TEXTURE_EXTERNAL_OES, 1);
        imageArray[i] = OH_NativeImage_CreateWithSingleBufferMode(1, GL_TEXTURE_EXTERNAL_OES, true);
        if (imageArray[i] == nullptr) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    for (int i = 0; i < count; ++i) {
        if (imageArray[i] != nullptr) {
            OH_NativeImage_Destroy(&imageArray[i]); // 销毁单个图像
            if (imageArray[i] != nullptr) {
                napi_create_int32(env, FAIL, &result);
                return result;
            }
        }
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageNormal(napi_env env,
    napi_callback_info info)
{
    int backInfo = FAIL;
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_2, &result);
    OH_NativeImage *nativeImage = OH_ConsumerSurface_CreateWithSingleBufferMode(true);
    if (nativeImage != nullptr) {
        backInfo = SUCCESS;
    }
    napi_create_int32(env, backInfo, &result1);
    napi_set_element(env, result, ARR_NUMBER_0, result1);
    OH_NativeImage_Destroy(&nativeImage);
    nativeImage = OH_ConsumerSurface_CreateWithSingleBufferMode(false);
    if (nativeImage != nullptr) {
        backInfo = SUCCESS;
    }
    napi_create_int32(env, backInfo, &result2);
    napi_set_element(env, result, ARR_NUMBER_1, result2);
    return result;
}

napi_value OHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageAbnormal(napi_env env,
    napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_3, &result);
    OH_NativeImage *nativeImage = OH_ConsumerSurface_CreateWithSingleBufferMode(true);
    NAPI_ASSERT(env, nativeImage != nullptr, "nativeImage == nullptr");
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    NAPI_ASSERT(env, nativeWindow != nullptr, "nativeWindow == nullptr");
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd = -1;
    int32_t ret0 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    if (ret0 == 0 && buffer == nullptr) {
        napi_create_int32(env, FAIL, &result1);
    } else {
        napi_create_int32(env, SUCCESS, &result1);
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);
    Region region{nullptr, PARAM_0};
    int32_t ret1 = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    int32_t ret2 = OH_NativeImage_AcquireNativeWindowBuffer(nativeImage, &buffer, &fenceFd);
    int32_t ret3 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    if (ret1 != NATIVE_ERROR_OK || ret2 != NATIVE_ERROR_OK || ret3 != NATIVE_ERROR_NO_BUFFER) {
        napi_create_int32(env, FAIL, &result2);
    } else {
        napi_create_int32(env, SUCCESS, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);
    int32_t ret4 = OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage, buffer, fenceFd);
    int32_t ret5 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    if (ret4 != NATIVE_ERROR_OK || ret5 != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result3);
    } else {
        napi_create_int32(env, SUCCESS, &result3);
    }
    napi_set_element(env, result, ARR_NUMBER_2, result3);
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

napi_value OHConsumerSurfaceCreateWithSingleBufferModeUnusingTextImageMultipleCalls(napi_env env,
    napi_callback_info info)
{
    napi_value result = nullptr;
    const int count = NUMBER_10;
    OH_NativeImage *imageArray[10] = {nullptr};
    for (int i = 0; i < count; ++i) {
        imageArray[i] = OH_ConsumerSurface_CreateWithSingleBufferMode(true);
        if (imageArray[i] == nullptr) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    for (int i = 0; i < count; ++i) {
        if (imageArray[i] != nullptr) {
            OH_NativeImage_Destroy(&imageArray[i]); // 销毁单个图像
            if (imageArray[i] != nullptr) {
                napi_create_int32(env, FAIL, &result);
                return result;
            }
        }
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeImageReleaseTextImageNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_2D, true);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    if (nativeWindow == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    if (buffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    Region region{nullptr, PARAM_0};
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    OH_NativeImage_UpdateSurfaceImage(nativeImage);
    int32_t ret = OH_NativeImage_ReleaseTextImage(nativeImage);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, ret, &result);
        return result;
    }
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeImageReleaseTextImageNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int32_t ret = OH_NativeImage_ReleaseTextImage(nullptr);
    if (ret == NATIVE_ERROR_OK) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHNativeImageReleaseTextImageMultipleCalls(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const int count = NUMBER_10;
    OH_NativeImage *imageArray[10] = {nullptr};
    for (int i = 0; i < count; ++i) {
        InitEGLEnv();
        GLuint textureId;
        glGenTextures(PARAM_1, &textureId);
        imageArray[i] = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_2D, true);
        if (imageArray[i] == nullptr) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
        OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(imageArray[i]);
        int code = SET_BUFFER_GEOMETRY;
        int32_t width = PARAM_800;
        int32_t height = PARAM_600;
        OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
        OHNativeWindowBuffer *buffer = nullptr;
        int fenceFd;
        OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
        if (buffer == nullptr) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
        Region region{nullptr, PARAM_0};
        OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
        OH_NativeImage_UpdateSurfaceImage(imageArray[i]);
        OH_NativeImage_ReleaseTextImage(imageArray[i]);
        OH_NativeWindow_DestroyNativeWindowBuffer(buffer);
        OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    }
    for (int i = 0; i < count; ++i) {
        if (imageArray[i] != nullptr) {
            OH_NativeImage_Destroy(&imageArray[i]); // 销毁单个图像
            if (imageArray[i] != nullptr) {
                napi_create_int32(env, FAIL, &result);
                return result;
            }
        }
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeImageReleaseTextImageDestroyImage(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_2D, true);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    if (nativeWindow == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    if (buffer == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    Region region{nullptr, PARAM_0};
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    OH_NativeImage_UpdateSurfaceImage(nativeImage);
    OH_NativeImage_Destroy(&nativeImage);
    int32_t ret = OH_NativeImage_ReleaseTextImage(nativeImage);
    napi_create_int32(env, ret, &result);
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    return result;
}

napi_value OHNativeImageGetColorSpaceNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_CreateWithSingleBufferMode(true);
    NAPI_ASSERT(env, image != nullptr, "image == nullptr");
    OH_NativeBuffer_ColorSpace colorSpace;
    int32_t ret = OH_NativeImage_GetColorSpace(image, &colorSpace);
    if (ret == NATIVE_ERROR_OK) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeImage_Destroy(&image);
    return result;
}

napi_value OHNativeImageGetColorSpaceNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeBuffer_ColorSpace colorSpace;
    int32_t ret = OH_NativeImage_GetColorSpace(nullptr, &colorSpace);
    if (ret == NATIVE_ERROR_OK) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    return result;
}

napi_value OHNativeImageGetColorSpaceMultipleCalls(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    const int count = NUMBER_10;
    OH_NativeBuffer_ColorSpace colorSpace;
    OH_NativeImage *imageArray[10] = {nullptr};
    for (int i = 0; i < count; ++i) {
        glBindTexture(GL_TEXTURE_EXTERNAL_OES, 1);
        imageArray[i] = OH_NativeImage_CreateWithSingleBufferMode(1, GL_TEXTURE_EXTERNAL_OES, true);
        if (imageArray[i] == nullptr) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
        int32_t ret = OH_NativeImage_GetColorSpace(imageArray[i], &colorSpace);
        if (ret != NATIVE_ERROR_OK) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    for (int i = 0; i < count; ++i) {
        if (imageArray[i] != nullptr) {
            OH_NativeImage_Destroy(&imageArray[i]); // 销毁单个图像
            if (imageArray[i] != nullptr) {
                napi_create_int32(env, FAIL, &result);
                return result;
            }
        }
    }
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeImageGetColorSpaceDestoryImage(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image = nullptr;
    OH_NativeBuffer_ColorSpace colorSpace;
    GLenum nativeImageTexId_;
    glBindTexture(GL_TEXTURE_EXTERNAL_OES, nativeImageTexId_);
    image = OH_NativeImage_CreateWithSingleBufferMode(nativeImageTexId_, GL_TEXTURE_EXTERNAL_OES, true);
    if (image == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&image);
    int32_t ret = OH_NativeImage_GetColorSpace(image, &colorSpace);
    if (ret == NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    return result;
}

// 单buffer模式下，OH_NativeImage_CreateWithSingleBufferMode与更新纹理、释放纹理、获取ColorSpace组合使用
napi_value OHNativeImageCreateWithSingleBufferModeTest1(napi_env env, napi_callback_info info)
{
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *image = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_2D, true);
    NAPI_ASSERT(env, image != nullptr, "image == nullptr");
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    NAPI_ASSERT(env, nativeWindow != nullptr, "nativeWindow == nullptr");
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    OH_NativeBuffer* nativeBuffer = nullptr;
    OH_NativeBuffer_FromNativeWindowBuffer(buffer, &nativeBuffer);
    OH_NativeBuffer_ColorSpace colorSpace = OH_COLORSPACE_BT601_EBU_FULL;
    OH_NativeBuffer_SetColorSpace(nativeBuffer, colorSpace);
    Region region{nullptr, PARAM_0};
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    OH_NativeImage_UpdateSurfaceImage(image);
    OH_NativeBuffer_ColorSpace colorSpace1;
    OH_NativeImage_GetColorSpace(image, &colorSpace1);
    napi_value result = nullptr;
    if (colorSpace == colorSpace1) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeImage_ReleaseTextImage(image);
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeBuffer_Unreference(nativeBuffer);
    OH_NativeImage_Destroy(&image);
    return result;
}

// 多buffer模式下，OH_NativeImage_CreateWithSingleBufferMode与更新纹理、释放纹理、获取ColorSpace组合使用
napi_value OHNativeImageCreateWithSingleBufferModeTest2(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *image = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_2D, false);
    NAPI_ASSERT(env, image != nullptr, "image == nullptr");
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(image);
    NAPI_ASSERT(env, nativeWindow != nullptr, "nativeWindow == nullptr");
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer1 = nullptr;
    OHNativeWindowBuffer *buffer2 = nullptr;
    OHNativeWindowBuffer *buffer3 = nullptr;
    int fenceFd;
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer1, &fenceFd);
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer2, &fenceFd);
    OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer3, &fenceFd);
    OH_NativeBuffer* nativeBuffer = nullptr;
    OH_NativeBuffer_FromNativeWindowBuffer(buffer1, &nativeBuffer);
    OH_NativeBuffer_FromNativeWindowBuffer(buffer2, &nativeBuffer);
    OH_NativeBuffer_FromNativeWindowBuffer(buffer3, &nativeBuffer);
    OH_NativeBuffer_ColorSpace colorSpace = OH_COLORSPACE_BT601_EBU_FULL;
    OH_NativeBuffer_SetColorSpace(nativeBuffer, colorSpace);
    Region region{nullptr, PARAM_0};
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer1, fenceFd, region);
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer2, fenceFd, region);
    OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer3, fenceFd, region);
    int32_t errorCode1 = OH_NativeImage_UpdateSurfaceImage(image);
    NAPI_ASSERT(env, errorCode1 == NATIVE_ERROR_OK, "errorCode1 != NATIVE_ERROR_OK");
    OH_NativeBuffer_ColorSpace colorSpace1;
    OH_NativeImage_GetColorSpace(image, &colorSpace1);
    int32_t errorCode2 = OH_NativeImage_ReleaseTextImage(image);
    NAPI_ASSERT(env, errorCode2 == NATIVE_ERROR_OK, "errorCode2 != NATIVE_ERROR_OK");
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer1);
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer2);
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer3);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeBuffer_Unreference(nativeBuffer);
    OH_NativeImage_Destroy(&image);
    return result;
}

// 多buffer模式下，OH_NativeImage_CreateWithSingleBufferMode与Acquire、ReleaseNativeWindowBuffer组合使用
napi_value OHNativeImageCreateWithSingleBufferModeTest3(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *image = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_2D, true);
    if (image == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    int fenceFd = 1;
    OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    int32_t ret = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, fenceFd);
    napi_create_int32(env, ret, &result);
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    OH_NativeImage_Destroy(&image);
    return result;
}

// 多buffer模式下，OH_NativeImage_CreateWithSingleBufferMode与Acquire、ReleaseNativeWindowBuffer组合使用
napi_value OHConsumerSurfaceCreateWithSingleBufferModeTest(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    int fenceFd;
    OHNativeWindowBuffer *nativeWindowBuffer = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_CreateWithSingleBufferMode(false);
    if (image == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    int32_t ret = OH_NativeImage_ReleaseNativeWindowBuffer(image, nativeWindowBuffer, fenceFd);
    if (ret == NATIVE_ERROR_OK) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeWindow_DestroyNativeWindowBuffer(nativeWindowBuffer);
    OH_NativeImage_Destroy(&image);
    return result;
}

napi_value OHNativeImageAcquireLatestNativeWindowBufferAbNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_Create();
    OHNativeWindowBuffer *NativeWindowBuffer = 0;
    int fenceFd = -1;
    int32_t ret1 = OH_NativeImage_AcquireLatestNativeWindowBuffer(nullptr, &NativeWindowBuffer, &fenceFd);
    int32_t ret2 = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, nullptr, &fenceFd);
    int32_t ret3 = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer, NULL);
    if (ret1 != NATIVE_ERROR_INVALID_ARGUMENTS || ret2 != NATIVE_ERROR_INVALID_ARGUMENTS ||
        ret3 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, ARR_NUMBER_1, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeWindow_DestroyNativeWindowBuffer(NativeWindowBuffer);
    OH_NativeImage_Destroy(&image);
    return result;
}

napi_value OHNativeImageAcquireLatestNativeWindowBufferAbNormal01(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_Create();
    InitNativeWindow *initNative = new InitNativeWindow(image);
    OHNativeWindowBuffer *latestNativeWindowBuffer = nullptr;
    OHNativeWindowBuffer *NativeWindowBuffer = nullptr;
    OHNativeWindowBuffer *NativeWindowBuffer1 = nullptr;
    BufferHandle *handle1 = nullptr;
    int fenceFd = -1;
    // 生产3个buffer，返回最新的buffer地址
    int32_t ret = initNative->OH_FlushBuffer1(&handle1);
    // 消费端请求buffer，保留最新的buffer
    int32_t ret1 = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer, &fenceFd);
    BufferHandle *handle2 = OH_NativeWindow_GetBufferHandleFromNative(NativeWindowBuffer);
    if (ret != 0 || ret1 != NATIVE_ERROR_OK || handle1 != handle2) {
        napi_create_int32(env, ARR_NUMBER_1, &result);
        return result;
    }
    //  消费端重复请求
    ret = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer1, &fenceFd);
    ret1 = OH_NativeImage_AcquireNativeWindowBuffer(image, &NativeWindowBuffer1, &fenceFd);
    // 消费端有一个buffer未释放，所以还能再生产两个buffer
    int32_t ret2 = initNative->OH_FlushBuffer();
    int32_t ret3 = initNative->OH_FlushBuffer();
    int32_t ret4 = initNative->OH_FlushBuffer();
    if (ret != NATIVE_ERROR_NO_BUFFER || ret1 != NATIVE_ERROR_NO_BUFFER ||
        ret2 != 0 || ret3 != 0 || ret4 != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, ARR_NUMBER_2, &result);
        return result;
    }
    // 将消费端未释放的1个buffer释放掉
    int32_t ret5 = OH_NativeImage_ReleaseNativeWindowBuffer(image, NativeWindowBuffer, fenceFd);
    // 生产端再去生产buffer
    int32_t ret6 = initNative->OH_FlushBuffer();
    if (ret5 != NATIVE_ERROR_OK || ret6 != 0) {
        napi_create_int32(env, ARR_NUMBER_3, &result);
        return result;
    }
    // 消费端再次请求buffer
    int32_t ret7 = OH_NativeImage_AcquireNativeWindowBuffer(image, &NativeWindowBuffer, &fenceFd);
    int32_t ret8 = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer1, &fenceFd);
    int32_t ret9 = OH_NativeImage_ReleaseNativeWindowBuffer(image, NativeWindowBuffer, fenceFd);
    int32_t ret10 = OH_NativeImage_ReleaseNativeWindowBuffer(image, NativeWindowBuffer1, fenceFd);
    if (ret7 != NATIVE_ERROR_OK || ret8 != NATIVE_ERROR_OK || ret9 != NATIVE_ERROR_OK || ret10 != NATIVE_ERROR_OK) {
        napi_create_int32(env, ARR_NUMBER_4, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindowBuffer(latestNativeWindowBuffer);
    OH_NativeWindow_DestroyNativeWindowBuffer(NativeWindowBuffer);
    OH_NativeWindow_DestroyNativeWindowBuffer(NativeWindowBuffer1);
    delete initNative;
    return result;
}

napi_value OHNativeImageAcquireLatestNativeWindowBufferAbNormal02(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_Create();
    InitNativeWindow *initNative = new InitNativeWindow(image);
    OHNativeWindowBuffer *LatestNativeWindowBuffer = nullptr;
    BufferHandle *handle1 = nullptr;
    // 生产3个buffer
    int32_t ret = initNative->OH_FlushBuffer1(&handle1);
    OHNativeWindowBuffer *NativeWindowBuffer = nullptr;
    int fenceFd = -1;
    // 消费端请求buffer，保留最新的buffer
    int32_t ret1 = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer, &fenceFd);
    BufferHandle *handle2 = OH_NativeWindow_GetBufferHandleFromNative(NativeWindowBuffer);
    if (ret1 != NATIVE_ERROR_OK || ret != 0 || handle1 != handle2) {
        napi_create_int32(env, ARR_NUMBER_1, &result);
        return result;
    }
    // 消费端释放buffer
    OH_NativeImage_ReleaseNativeWindowBuffer(image, NativeWindowBuffer, fenceFd);
    // 生产2个buffer
    ret = initNative->OH_FlushBuffer1(&handle1, 2);
    // 消费端请求buffer，保留最新的buffer
    ret1 = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer, &fenceFd);
    handle2 = OH_NativeWindow_GetBufferHandleFromNative(NativeWindowBuffer);
    if (ret1 != 0 || ret != 0 || handle1 != handle2) {
        napi_create_int32(env, ARR_NUMBER_2, &result);
        return result;
    }
    // 消费端释放buffer
    OH_NativeImage_ReleaseNativeWindowBuffer(image, NativeWindowBuffer, fenceFd);
    // 生产1个buffer
    ret = initNative->OH_FlushBuffer1(&handle1, 1);
    // 消费端请求buffer，保留最新的buffer
    ret1 = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer, &fenceFd);
    handle2 = OH_NativeWindow_GetBufferHandleFromNative(NativeWindowBuffer);
    if (ret1 != 0 || ret != 0 || handle1 != handle2) {
        napi_create_int32(env, ARR_NUMBER_3, &result);
        return result;
    }
    // 消费端释放buffer
    OH_NativeImage_ReleaseNativeWindowBuffer(image, NativeWindowBuffer, fenceFd);
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeImage_Destroy(&image);
    OH_NativeWindow_DestroyNativeWindowBuffer(LatestNativeWindowBuffer);
    OH_NativeWindow_DestroyNativeWindowBuffer(NativeWindowBuffer);
    delete initNative;
    return result;
}

napi_value OHNativeImageAcquireLatestNativeWindowBufferAbNormal03(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_Create();
    InitNativeWindow *initNative = new InitNativeWindow(image);
    OHNativeWindowBuffer *LatestNativeWindowBuffer = nullptr;
    OHNativeWindowBuffer *NativeWindowBuffer = nullptr;
    BufferHandle *handle1 = nullptr;
    int fenceFd = -1;
    // 未生产buffer直接，消费端直接请求
    int32_t ret = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer, &fenceFd);
    if (ret != NATIVE_ERROR_NO_BUFFER) {
        napi_create_int32(env, ARR_NUMBER_1, &result);
        return result;
    }
    int32_t ret1 = initNative->OH_FlushBuffer1(&handle1);
    ret = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer, &fenceFd);
    BufferHandle *handle2 = OH_NativeWindow_GetBufferHandleFromNative(NativeWindowBuffer);
    if (ret != 0 || ret1 != 0 || handle1 != handle2) {
        napi_create_int32(env, ARR_NUMBER_2, &result);
        return result;
    }
    // releaseBuffer后调用AcquireLatestNativeWindowBuffer
    int32_t ret2 = OH_NativeImage_ReleaseNativeWindowBuffer(image, NativeWindowBuffer, fenceFd);
    ret = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer, &fenceFd);
    if (ret2 != 0 || ret != NATIVE_ERROR_NO_BUFFER) {
        napi_create_int32(env, ARR_NUMBER_3, &result);
        return result;
    }
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeWindow_DestroyNativeWindowBuffer(LatestNativeWindowBuffer);
    OH_NativeWindow_DestroyNativeWindowBuffer(NativeWindowBuffer);
    OH_NativeImage_Destroy(&image);
    delete initNative;
    return result;
}

napi_value OHNativeImageAcquireLatestNativeWindowBufferCall(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage *image = OH_ConsumerSurface_Create();
    InitNativeWindow *initNative = new InitNativeWindow(image);
    OHNativeWindowBuffer *latestNativeWindowBuffer = nullptr;
    OHNativeWindowBuffer *NativeWindowBuffer = nullptr;
    BufferHandle *handle1 = nullptr;
    int fenceFd = -1;
    int num = 10;
    for (int i = 0; i < num; i++) {
        int32_t ret1 = initNative->OH_FlushBuffer1(&handle1);
        int32_t ret2 = OH_NativeImage_AcquireLatestNativeWindowBuffer(image, &NativeWindowBuffer, &fenceFd);
        BufferHandle *handle2 = OH_NativeWindow_GetBufferHandleFromNative(NativeWindowBuffer);
        if (ret1 != NATIVE_ERROR_OK || ret2 != NATIVE_ERROR_OK || handle1 != handle2) {
            napi_create_int32(env, ARR_NUMBER_1, &result);
            return result;
        }
        int32_t ret3 = OH_NativeImage_ReleaseNativeWindowBuffer(image, NativeWindowBuffer, fenceFd);
        if (ret3 != 0) {
            napi_create_int32(env, ARR_NUMBER_2, &result);
            return result;
        }
    }
    napi_create_int32(env, SUCCESS, &result);
    OH_NativeWindow_DestroyNativeWindowBuffer(latestNativeWindowBuffer);
    OH_NativeWindow_DestroyNativeWindowBuffer(NativeWindowBuffer);
    OH_NativeImage_Destroy(&image);
    delete initNative;
    return result;
}

napi_value OHNativeImageCreateWithSingleBufferModeChangeTextureTarget(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_EXTERNAL_OES, true);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    if (nativeWindow == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    Region region{nullptr, PARAM_0};
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeImage_UpdateSurfaceImage(nativeImage);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeImage_ReleaseTextImage(nativeImage);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeImageIsReleasedNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage* image = nullptr;
    bool isReleased = false;
    int32_t ret = OH_NativeImage_IsReleased(image, &isReleased);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&image);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeImageIsReleasedNull1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t textureId = 1;
    uint32_t textureTarget = 1;
    bool singleBufferMode = true;
    OH_NativeImage* nativeImage =
        OH_NativeImage_CreateWithSingleBufferMode(textureId, textureTarget, singleBufferMode);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t ret = OH_NativeImage_IsReleased(nativeImage, nullptr);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

napi_value OHNativeImageIsReleasedNormal0(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_EXTERNAL_OES, true);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    Region region{nullptr, PARAM_0};
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeImage_UpdateSurfaceImage(nativeImage);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeImage_ReleaseTextImage(nativeImage);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    bool isReleased = false;
    ret = OH_NativeImage_IsReleased(nativeImage, &isReleased);
    if (ret == NATIVE_ERROR_OK && isReleased == true) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer);
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}
napi_value OHNativeImageIsReleasedNormal1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    bool isReleased = false;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_EXTERNAL_OES, true);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    int code = SET_BUFFER_GEOMETRY;
    int32_t width = PARAM_800;
    int32_t height = PARAM_600;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, width, height);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd;
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &buffer, &fenceFd);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    Region region{nullptr, PARAM_0};
    ret = OH_NativeWindow_NativeWindowFlushBuffer(nativeWindow, buffer, fenceFd, region);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeImage_UpdateSurfaceImage(nativeImage);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    ret = OH_NativeImage_Release(nativeImage);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    isReleased = false;
    ret = OH_NativeImage_IsReleased(nativeImage, &isReleased);
    if (ret == NATIVE_ERROR_OK && isReleased == false) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeWindow_DestroyNativeWindow(nativeWindow);
    OH_NativeWindow_DestroyNativeWindowBuffer(buffer);
    OH_NativeImage_Destroy(&nativeImage);
    return result;
}

napi_value OHNativeImageReleasedNull(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    OH_NativeImage* image = nullptr;
    int32_t ret = OH_NativeImage_Release(image);
    if (ret != NATIVE_ERROR_INVALID_ARGUMENTS) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&image);
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value OHNativeImageReleasedNormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_EXTERNAL_OES, true);
    InitNativeWindow *initNative = new InitNativeWindow(nativeImage);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t ret = initNative->OH_FlushBuffer();
    ret = OH_NativeImage_Release(nativeImage);
    if (ret != NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    OH_NativeImage_Destroy(&nativeImage);
    napi_create_int32(env, SUCCESS, &result);
    delete initNative;
    return result;
}
napi_value OHNativeImageReleasedNormal1(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value result1 = nullptr;
    napi_value result2 = nullptr;
    napi_value result3 = nullptr;
    napi_create_array_with_length(env, ARR_NUMBER_3, &result);
    uint32_t textureId = 1;
    OH_NativeImage* nativeImage = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_2D, true);
    OHNativeWindow* nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    InitNativeWindow *initNative = new InitNativeWindow(nativeImage);
    if (nativeImage == nullptr || nativeWindow == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    BufferHandle *handle1 = nullptr;
    int32_t ret = initNative->OH_FlushBuffer1(&handle1);
    bool isReleased = false;
    ret = OH_NativeImage_IsReleased(nativeImage, &isReleased);
    if (ret == NATIVE_ERROR_OK && isReleased == false) {
        napi_create_int32(env, SUCCESS, &result1);
    } else {
        napi_create_int32(env, FAIL, &result1);
        return result;
    }
    napi_set_element(env, result, ARR_NUMBER_0, result1);
    ret = OH_NativeImage_UpdateSurfaceImage(nativeImage);
    isReleased = false;
    ret = OH_NativeImage_IsReleased(nativeImage, &isReleased);
    if (ret == NATIVE_ERROR_OK && isReleased == false) {
        napi_create_int32(env, SUCCESS, &result2);
    } else {
        napi_create_int32(env, FAIL, &result2);
    }
    napi_set_element(env, result, ARR_NUMBER_1, result2);
    ret = OH_NativeImage_Release(nativeImage);
    isReleased = false;
    ret = OH_NativeImage_IsReleased(nativeImage, &isReleased);
    if (ret == NATIVE_ERROR_OK && isReleased == false) {
        napi_create_int32(env, SUCCESS, &result3);
    } else {
        napi_create_int32(env, FAIL, &result3);
    }
    napi_set_element(env, result, ARR_NUMBER_2, result3);
    OH_NativeImage_Destroy(&nativeImage);
    delete initNative;
    return result;
}
napi_value OHNativeImageIsReleasedCalls(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    uint32_t textureId = 1;
    uint32_t textureTarget = 1;
    bool singleBufferMode = true;
    bool isReleased = false;
    OH_NativeImage* nativeImage =
    OH_NativeImage_CreateWithSingleBufferMode(textureId, textureTarget, singleBufferMode);
    InitNativeWindow *initNative = new InitNativeWindow(nativeImage);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t ret = initNative->OH_FlushBuffer();
    ret = OH_NativeImage_UpdateSurfaceImage(nativeImage);
    ret = OH_NativeImage_UnsetOnFrameAvailableListener(nativeImage);
    ret = OH_NativeImage_ReleaseTextImage(nativeImage);
    for (int i = 0; i < NUMBER_100; ++i) {
        ret = OH_NativeImage_IsReleased(nativeImage, &isReleased);
        if (ret != NATIVE_ERROR_OK) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    OH_NativeImage_Destroy(&nativeImage);
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value OHNativeImageReleasedCalls(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_EXTERNAL_OES, true);
    InitNativeWindow *initNative = new InitNativeWindow(nativeImage);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t ret = initNative->OH_FlushBuffer();
    ret = OH_NativeImage_UpdateSurfaceImage(nativeImage);
    ret = OH_NativeImage_UnsetOnFrameAvailableListener(nativeImage);
    ret = OH_NativeImage_ReleaseTextImage(nativeImage);
    for (int i = 0; i < NUMBER_100; i++) {
        ret = OH_NativeImage_Release(nativeImage);
        if (ret != NATIVE_ERROR_OK) {
            napi_create_int32(env, FAIL, &result);
            return result;
        }
    }
    OH_NativeImage_Destroy(&nativeImage);
    delete initNative;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}
napi_value OHNativeImageReleaseAbnormal(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    InitEGLEnv();
    GLuint textureId;
    glGenTextures(PARAM_1, &textureId);
    OH_NativeImage *nativeImage = OH_NativeImage_CreateWithSingleBufferMode(textureId, GL_TEXTURE_EXTERNAL_OES, true);
    InitNativeWindow *initNative = new InitNativeWindow(nativeImage);
    if (nativeImage == nullptr) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    int32_t ret = initNative->OH_FlushBuffer();
    ret = OH_NativeImage_Release(nativeImage);
    ret = OH_NativeImage_ReleaseTextImage(nativeImage);
    if (ret == NATIVE_ERROR_OK) {
        napi_create_int32(env, FAIL, &result);
        return result;
    }
    bool isReleased = false;
    ret = OH_NativeImage_IsReleased(nativeImage, &isReleased);
    if (ret == NATIVE_ERROR_OK && isReleased == false) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAIL, &result);
    }
    OH_NativeImage_Destroy(&nativeImage);
    delete initNative;
    return result;
}

napi_value OHNativeErrorCodeCover(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    NAPI_ASSERT(env, NATIVE_ERROR_OK == ERRORCODE_0, "");
    NAPI_ASSERT(env, NATIVE_ERROR_MEM_OPERATION_ERROR == ERRORCODE_30001000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_INVALID_ARGUMENTS == ERRORCODE_40001000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_NO_PERMISSION == ERRORCODE_40301000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_NO_BUFFER == ERRORCODE_40601000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_NO_CONSUMER == ERRORCODE_41202000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_NOT_INIT == ERRORCODE_41203000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_CONSUMER_CONNECTED == ERRORCODE_41206000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BUFFER_STATE_INVALID == ERRORCODE_41207000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BUFFER_IN_CACHE == ERRORCODE_41208000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BUFFER_QUEUE_FULL == ERRORCODE_41209000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BUFFER_NOT_IN_CACHE == ERRORCODE_41210000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_CONSUMER_DISCONNECTED == ERRORCODE_41211000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_CONSUMER_NO_LISTENER_REGISTERED == ERRORCODE_41212000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_UNSUPPORTED == ERRORCODE_50102000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_UNKNOWN == ERRORCODE_50002000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_HDI_ERROR == ERRORCODE_50007000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_BINDER_ERROR == ERRORCODE_50401000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_EGL_STATE_UNKNOWN == ERRORCODE_60001000, "");
    NAPI_ASSERT(env, NATIVE_ERROR_EGL_API_FAILED == ERRORCODE_60002000, "");
    napi_create_int32(env, SUCCESS, &result);
    return result;
}