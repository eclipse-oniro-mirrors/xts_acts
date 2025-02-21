/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "native_common.h"
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl32.h>
#define NO_ERR 0
#define SUCCESS 1
#define FAIL (-1)
#define TRUE 1
#define FALSE 0
#define RGB_SIZE 0x08
#define INIT_WIDTH 0x08
#define INIT_HEIGHT 0x08
#define GL_CLIENT_VERSION 0x02
#define GL_MAJOR_VERSION_2 0x02
#define GL_MAJOR_VERSION_3 0x03
#define GL_MINOR_VERSION_0 0x00
#define EGL_ONE 0x01
#define GL_VERSION_15 0x0F
#define GL_MAJOR_VERSION_MARK 0x0A
typedef struct _MyEGLWindow {
    EGLDisplay eglDisplay;
    EGLSurface eglLSurface;
    EGLContext eglContext;
    EGLConfig eglConfig;
    EGLint eglVersion;
} MyEGLWindow;

static napi_value createMyEglWindow(napi_env env, MyEGLWindow *myEGLWindow)
{
    if (myEGLWindow == nullptr) {
        return nullptr;
    }
    myEGLWindow->eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, myEGLWindow->eglDisplay != EGL_NO_DISPLAY, "eglInitialize error");
    EGLint majorVersion = GL_MAJOR_VERSION_2;
    EGLint minorVersion = GL_MINOR_VERSION_0;
    EGLBoolean Ret = eglInitialize(myEGLWindow->eglDisplay, &majorVersion, &minorVersion);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglInitialize error");
    myEGLWindow->eglVersion = majorVersion * GL_MAJOR_VERSION_MARK + minorVersion;
    EGLint clientVersion = majorVersion == GL_MAJOR_VERSION_3 ? EGL_OPENGL_ES3_BIT : EGL_OPENGL_ES2_BIT;
    const EGLint configAttribs[] = {
        EGL_RED_SIZE,   RGB_SIZE, EGL_GREEN_SIZE,      RGB_SIZE,      EGL_BLUE_SIZE,    RGB_SIZE,
        EGL_ALPHA_SIZE, RGB_SIZE, EGL_RENDERABLE_TYPE, clientVersion, EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
        EGL_NONE,       EGL_NONE};
    EGLint numConfigs = 0x00;
    Ret = eglChooseConfig(myEGLWindow->eglDisplay, configAttribs, &myEGLWindow->eglConfig, EGL_ONE, &numConfigs);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglChooseConfig error");
    const EGLint surfaceAttribs[] = {EGL_WIDTH,          INIT_WIDTH,       EGL_HEIGHT,         INIT_HEIGHT,
                                     EGL_TEXTURE_FORMAT, EGL_TEXTURE_RGBA, EGL_TEXTURE_TARGET, EGL_TEXTURE_2D,
                                     EGL_NONE,           EGL_NONE};
    myEGLWindow->eglLSurface = eglCreatePbufferSurface(myEGLWindow->eglDisplay, myEGLWindow->eglConfig, surfaceAttribs);
    NAPI_ASSERT(env, myEGLWindow->eglLSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    const EGLint contextAttribs[] = {EGL_CONTEXT_CLIENT_VERSION, GL_CLIENT_VERSION, EGL_NONE, EGL_NONE};
    myEGLWindow->eglContext =
        eglCreateContext(myEGLWindow->eglDisplay, myEGLWindow->eglConfig, EGL_NO_CONTEXT, contextAttribs);
    NAPI_ASSERT(env, myEGLWindow->eglContext != EGL_NO_CONTEXT, "eglCreateContext error");
    Ret = eglMakeCurrent(myEGLWindow->eglDisplay, myEGLWindow->eglLSurface, myEGLWindow->eglLSurface,
                         myEGLWindow->eglContext);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglMakeCurrent error");
    return nullptr;
}

static napi_value destroyMyEglWindow(napi_env env, MyEGLWindow *myEGLWindow)
{
    if (myEGLWindow == nullptr) {
        return nullptr;
    }
    if (myEGLWindow->eglDisplay != EGL_NO_DISPLAY) {
        EGLBoolean Ret = eglTerminate(myEGLWindow->eglDisplay);
        NAPI_ASSERT_BASE(env, Ret == EGL_TRUE, "eglTerminate error", EGL_FALSE);
    }
    myEGLWindow->eglDisplay = EGL_NO_DISPLAY;
    myEGLWindow->eglLSurface = EGL_NO_SURFACE;
    myEGLWindow->eglContext = EGL_NO_CONTEXT;
    myEGLWindow->eglConfig = nullptr;
    return nullptr;
}

static napi_value eglGetErrorInit()
{
    EGLint eglError = NO_ERR;
    do {
        eglError = eglGetError();
    } while (eglError != EGL_SUCCESS);
    return nullptr;
}
static const EGLint surfaceAttr[] = {EGL_WIDTH, 1, EGL_HEIGHT, 1, EGL_NONE};

static const EGLint confAttr[] = {EGL_SURFACE_TYPE, EGL_WINDOW_BIT,
                                  EGL_BLUE_SIZE,    8,
                                  EGL_GREEN_SIZE,   8,
                                  EGL_RED_SIZE,     8,
                                  EGL_ALPHA_SIZE,   8,
                                  EGL_DEPTH_SIZE,   16,
                                  EGL_NONE};

static napi_value EglChooseConfig(napi_env env, napi_callback_info info)
{
    EGLint numConfigs;
    EGLConfig config = nullptr;
    EGLint config_size = 1;
    EGLDisplay display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, display != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(display, nullptr, nullptr);
    EGLBoolean Ret = eglChooseConfig(display, confAttr, &config, config_size, &numConfigs);
    NAPI_ASSERT(env, Ret == TRUE, "eglChooseConfig error");
    eglReleaseThread();
    eglTerminate(display);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglChooseConfigAbnormal(napi_env env, napi_callback_info info)
{
    EGLint numConfigs;
    EGLConfig config = nullptr;
    EGLDisplay display = nullptr;
    EGLint config_size = 1;
    EGLBoolean Ret = eglChooseConfig(display, confAttr, &config, config_size, &numConfigs);
    NAPI_ASSERT(env, Ret == FALSE, "eglChooseConfig error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCopyBuffersAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);
    EGLSurface m_eglSurface = nullptr;
    EGLNativePixmapType mNativeDisplay = 0;
    EGLBoolean Ret = eglCopyBuffers(m_eglDisplay, m_eglSurface, mNativeDisplay);
    NAPI_ASSERT(env, Ret == FALSE, "eglCopyBuffers error");
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreateContext(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE};
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
    NAPI_ASSERT(env, m_eglCtx != EGL_NO_CONTEXT, "eglCreateContext error");
    eglDestroyContext(m_eglDisplay, m_eglCtx);
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreateContextAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE};
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
    NAPI_ASSERT(env, m_eglCtx == EGL_NO_CONTEXT, "eglCreateContext error");
    eglDestroyContext(m_eglDisplay, m_eglCtx);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreatePbufferSurface(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);
    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);
    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreatePbufferSurfaceAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);
    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface == EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreatePixmapSurfaceAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);
    EGLNativePixmapType pixmap = 0;
    EGLSurface m_eglSurface = eglCreatePixmapSurface(m_eglDisplay, m_eglConf, pixmap, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface == EGL_NO_SURFACE, "eglCreatePixmapSurface error");
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreateWindowSurfaceAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);
    NativeWindowType window = 0;
    EGLSurface m_eglSurface = eglCreateWindowSurface(m_eglDisplay, m_eglConf, window, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface == EGL_NO_SURFACE, "eglCreateWindowSurface error");
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglDestroyContext(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE};
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
    EGLBoolean Ret = eglDestroyContext(m_eglDisplay, m_eglCtx);
    NAPI_ASSERT(env, Ret == TRUE, "eglDestroyContext error");
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglDestroyContextAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, nullptr);
    EGLBoolean Ret = eglDestroyContext(m_eglDisplay, m_eglCtx);
    NAPI_ASSERT(env, Ret == FALSE, "eglDestroyContext error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglDestroySurface(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);
    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    EGLBoolean Ret = eglDestroySurface(m_eglDisplay, m_eglSurface);
    NAPI_ASSERT(env, Ret == TRUE, "eglDestroySurface error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglDestroySurfaceAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);

    EGLBoolean Ret = eglDestroySurface(m_eglDisplay, m_eglSurface);
    NAPI_ASSERT(env, Ret == FALSE, "eglDestroySurface error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetConfigAttrib(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf[10];
    EGLint numConfigs;
    EGLint config_size = 10;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    eglGetConfigs(m_eglDisplay, m_eglConf, config_size, &numConfigs);
    EGLBoolean Ret;
    for (int i = 0; i < numConfigs; ++i) {
        Ret = eglGetConfigAttrib(m_eglDisplay, m_eglConf[i], EGL_BUFFER_SIZE, &numConfigs);
        Ret = eglGetConfigAttrib(m_eglDisplay, m_eglConf[i], EGL_ALPHA_SIZE, &numConfigs);
    }
    NAPI_ASSERT(env, Ret == TRUE, "eglGetConfigAttrib error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetConfigAttribAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf[10];
    EGLint numConfigs;
    EGLint config_size = 10;
    eglGetConfigs(m_eglDisplay, m_eglConf, config_size, &numConfigs);
    EGLBoolean Ret;
    for (int i = 0; i < numConfigs; ++i) {
        Ret = eglGetConfigAttrib(m_eglDisplay, m_eglConf[i], EGL_BUFFER_SIZE, &numConfigs);
        Ret = eglGetConfigAttrib(m_eglDisplay, m_eglConf[i], EGL_ALPHA_SIZE, &numConfigs);
    }
    NAPI_ASSERT(env, Ret == FALSE, "eglGetConfigAttrib error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetConfigs(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf[10];
    EGLint numConfigs;
    EGLint config_size = 10;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    EGLBoolean Ret = eglGetConfigs(m_eglDisplay, m_eglConf, config_size, &numConfigs);
    NAPI_ASSERT(env, Ret == TRUE, "eglGetConfigs error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetConfigsAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf[10];
    EGLint numConfigs;
    EGLint config_size = 10;

    EGLBoolean Ret = eglGetConfigs(m_eglDisplay, m_eglConf, config_size, &numConfigs);
    NAPI_ASSERT(env, Ret == FALSE, "eglGetConfigs error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetCurrentDisplay(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE};
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
    eglMakeCurrent(m_eglDisplay, m_eglSurface, m_eglSurface, m_eglCtx);
    m_eglDisplay = eglGetCurrentDisplay();
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetCurrentDisplay error");
    eglDestroyContext(m_eglDisplay, m_eglCtx);
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetCurrentDisplayAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    m_eglDisplay = eglGetCurrentDisplay();
    NAPI_ASSERT(env, m_eglDisplay == EGL_NO_DISPLAY, "eglGetCurrentDisplay error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetCurrentSurface(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE};
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
    eglMakeCurrent(m_eglDisplay, m_eglSurface, m_eglSurface, m_eglCtx);
    m_eglDisplay = eglGetCurrentDisplay();
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetCurrentDisplay error");
    m_eglSurface = eglGetCurrentSurface(EGL_DRAW);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglGetCurrentSurface error");
    eglDestroyContext(m_eglDisplay, m_eglCtx);
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetCurrentSurfaceAbnormal(napi_env env, napi_callback_info info)
{
    eglGetCurrentDisplay();
    EGLSurface m_eglSurface = eglGetCurrentSurface(EGL_DRAW);
    NAPI_ASSERT(env, m_eglSurface == EGL_NO_SURFACE, "eglGetCurrentSurface error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetDisplay(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetError(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    eglGetErrorInit();
    const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE};
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
    NAPI_ASSERT(env, m_eglCtx == EGL_NO_CONTEXT, "eglGetCurrentSurface error");
    EGLint Ret = eglGetError();
    NAPI_ASSERT(env, Ret == EGL_BAD_DISPLAY, "eglGetError error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

typedef EGLBoolean (*PFNCREATEIMAGEKHR)(EGLDisplay, EGLContext, EGLenum, EGLClientBuffer, const int *);
static napi_value EglGetProcAddress(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    PFNCREATEIMAGEKHR createImageKHR = (PFNCREATEIMAGEKHR)eglGetProcAddress("eglCreateImageKHR");
    NAPI_ASSERT(env, createImageKHR != nullptr, "eglGetProcAddress error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetProcAddressAbnormal(napi_env env, napi_callback_info info)
{
    PFNCREATEIMAGEKHR createImageKHR = (PFNCREATEIMAGEKHR)eglGetProcAddress("eglCreateImageKHR1");
    NAPI_ASSERT(env, createImageKHR == nullptr, "eglGetProcAddress error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglInitialize(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    EGLBoolean Ret = eglInitialize(m_eglDisplay, nullptr, nullptr);
    NAPI_ASSERT(env, Ret == TRUE, "eglGetProcAddress error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglInitializeAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLBoolean Ret = eglInitialize(m_eglDisplay, nullptr, nullptr);
    NAPI_ASSERT(env, Ret == FALSE, "eglGetProcAddress error");
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglMakeCurrent(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE};
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
    EGLBoolean Ret = eglMakeCurrent(m_eglDisplay, m_eglSurface, m_eglSurface, m_eglCtx);
    NAPI_ASSERT(env, Ret == TRUE, "eglMakeCurrent error");
    eglDestroyContext(m_eglDisplay, m_eglCtx);
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglMakeCurrentAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLSurface m_eglSurface = nullptr;
    EGLContext m_eglCtx = nullptr;
    EGLBoolean Ret = eglMakeCurrent(m_eglDisplay, m_eglSurface, m_eglSurface, m_eglCtx);
    NAPI_ASSERT(env, Ret == FALSE, "eglMakeCurrent error");
    eglDestroyContext(m_eglDisplay, m_eglCtx);
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglQueryContext(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    const EGLint ctxAttr[] = {EGL_CONTEXT_CLIENT_VERSION, 2, EGL_NONE};
    EGLContext m_eglCtx = eglCreateContext(m_eglDisplay, m_eglConf, EGL_NO_CONTEXT, ctxAttr);
    EGLBoolean Ret = eglQueryContext(m_eglDisplay, m_eglCtx, EGL_CONTEXT_CLIENT_VERSION, &numConfigs);
    NAPI_ASSERT(env, Ret == TRUE, "eglQueryContext error");
    eglDestroyContext(m_eglDisplay, m_eglCtx);
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglQueryContextAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);

    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    EGLContext m_eglCtx = nullptr;
    EGLBoolean Ret = eglQueryContext(m_eglDisplay, m_eglCtx, EGL_CONTEXT_CLIENT_VERSION, &numConfigs);
    NAPI_ASSERT(env, Ret == FALSE, "eglQueryContext error");
    eglDestroyContext(m_eglDisplay, m_eglCtx);
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglQueryString(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);
    const char *vendor = eglQueryString(m_eglDisplay, EGL_VENDOR);
    NAPI_ASSERT(env, vendor != nullptr, "eglQueryString error");

    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglQueryStringAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    const char *vendor = eglQueryString(m_eglDisplay, EGL_VENDOR);
    NAPI_ASSERT(env, vendor == nullptr, "eglQueryString error");

    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglQuerySurface(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);
    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = eglCreatePbufferSurface(m_eglDisplay, m_eglConf, surfaceAttr);
    NAPI_ASSERT(env, m_eglSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    EGLint width;
    EGLBoolean Ret = eglQuerySurface(m_eglDisplay, m_eglSurface, EGL_WIDTH, &width);
    NAPI_ASSERT(env, Ret == TRUE, "eglQuerySurface error");
    eglDestroySurface(m_eglDisplay, m_eglSurface);
    eglReleaseThread();
    eglTerminate(m_eglDisplay);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglQuerySurfaceAbnormal(napi_env env, napi_callback_info info)
{
    EGLDisplay m_eglDisplay = nullptr;
    EGLConfig m_eglConf = nullptr;
    EGLint numConfigs;
    EGLint config_size = 1;
    m_eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    NAPI_ASSERT(env, m_eglDisplay != EGL_NO_DISPLAY, "eglGetDisplay error");
    eglInitialize(m_eglDisplay, nullptr, nullptr);
    eglChooseConfig(m_eglDisplay, confAttr, &m_eglConf, config_size, &numConfigs);

    EGLSurface m_eglSurface = nullptr;
    EGLint width;
    EGLBoolean Ret = eglQuerySurface(m_eglDisplay, m_eglSurface, EGL_WIDTH, &width);
    NAPI_ASSERT(env, Ret == FALSE, "eglQuerySurface error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglSwapBuffers(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglSwapBuffers(myEGLWindow.eglDisplay, myEGLWindow.eglLSurface);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglSwapBuffers error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglSwapBuffersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLBoolean Ret = eglSwapBuffers(EGL_NO_DISPLAY, EGL_NO_SURFACE);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglGetError error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglTerminate(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglTerminate(myEGLWindow.eglDisplay);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglTerminate error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglTerminateAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLBoolean Ret = eglTerminate(EGL_NO_DISPLAY);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglGetError error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglWaitGL(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglWaitGL();
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglWaitGL error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglWaitNative(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglWaitNative(EGL_CORE_NATIVE_ENGINE);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglWaitNative error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglBindTexImage(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    const EGLint surfaceAttribs[] = {EGL_WIDTH,          INIT_WIDTH,       EGL_HEIGHT,         INIT_HEIGHT,
                                     EGL_TEXTURE_FORMAT, EGL_TEXTURE_RGBA, EGL_TEXTURE_TARGET, EGL_TEXTURE_2D,
                                     EGL_NONE,           EGL_NONE};
    EGLSurface eglLSurface = eglCreatePbufferSurface(myEGLWindow.eglDisplay, myEGLWindow.eglConfig, surfaceAttribs);
    NAPI_ASSERT(env, eglLSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    GLuint texture = GL_ZERO;
    glGenTextures(GL_ONE, &texture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    EGLBoolean Ret = eglBindTexImage(myEGLWindow.eglDisplay, eglLSurface, EGL_BACK_BUFFER);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglBindTexImage error");
    Ret = eglReleaseTexImage(myEGLWindow.eglDisplay, eglLSurface, EGL_BACK_BUFFER);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglReleaseTexImage error");
    Ret = eglDestroySurface(myEGLWindow.eglDisplay, eglLSurface);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglDestroySurface error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglBindTexImageAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLBoolean Ret = eglBindTexImage(EGL_NO_DISPLAY, EGL_NO_SURFACE, 0x00);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglBindTexImage error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglReleaseTexImage(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    const EGLint surfaceAttribs[] = {EGL_WIDTH,          INIT_WIDTH,       EGL_HEIGHT,         INIT_HEIGHT,
                                     EGL_TEXTURE_FORMAT, EGL_TEXTURE_RGBA, EGL_TEXTURE_TARGET, EGL_TEXTURE_2D,
                                     EGL_NONE,           EGL_NONE};
    EGLSurface eglLSurface = eglCreatePbufferSurface(myEGLWindow.eglDisplay, myEGLWindow.eglConfig, surfaceAttribs);
    NAPI_ASSERT(env, eglLSurface != EGL_NO_SURFACE, "eglCreatePbufferSurface error");
    GLuint texture = GL_ZERO;
    glGenTextures(GL_ONE, &texture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    EGLBoolean Ret = eglBindTexImage(myEGLWindow.eglDisplay, eglLSurface, EGL_BACK_BUFFER);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglBindTexImage error");
    Ret = eglReleaseTexImage(myEGLWindow.eglDisplay, eglLSurface, EGL_BACK_BUFFER);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglReleaseTexImage error");
    Ret = eglDestroySurface(myEGLWindow.eglDisplay, eglLSurface);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglDestroySurface error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglReleaseTexImageAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLBoolean Ret = eglReleaseTexImage(EGL_NO_DISPLAY, EGL_NO_SURFACE, 0x00);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglReleaseTexImage error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglSurfaceAttrib(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglSurfaceAttrib(myEGLWindow.eglDisplay, myEGLWindow.eglLSurface, EGL_MIPMAP_LEVEL, EGL_ONE);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglSurfaceAttrib error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglSurfaceAttribAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLBoolean Ret = eglSurfaceAttrib(EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_MIPMAP_LEVEL, EGL_ONE);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglSurfaceAttrib error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglSwapInterval(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglSwapInterval(myEGLWindow.eglDisplay, EGL_ONE);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglSwapInterval error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglSwapIntervalAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLBoolean Ret = eglSwapInterval(EGL_NO_DISPLAY, EGL_ONE);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglSwapInterval error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglBindAPI(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglBindAPI(EGL_OPENGL_ES_API);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglBindAPI error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglBindAPIAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglBindAPI(EGL_OPENGL_API);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglBindAPI error");
    Ret = eglBindAPI(EGL_OPENVG_API);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglBindAPI error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglQueryAPI(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    NAPI_ASSERT(env, eglQueryAPI() == EGL_OPENGL_ES_API, "eglQueryAPI error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreatePbufferFromClientBufferAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLSurface eglSurface =
        eglCreatePbufferFromClientBuffer(EGL_NO_DISPLAY, EGL_OPENVG_IMAGE, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, eglSurface == EGL_NO_SURFACE, "eglCreatePbufferFromClientBuffer error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglReleaseThread(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglReleaseThread();
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglReleaseThread error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglWaitClient(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglWaitClient();
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglWaitClient error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetCurrentContext(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLContext eglContext = eglGetCurrentContext();
    NAPI_ASSERT(env, eglContext != EGL_NO_CONTEXT, "eglGetCurrentContext error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreateSync(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    if (myEGLWindow.eglVersion >= GL_VERSION_15) {
        const EGLAttrib attr[] = {EGL_NONE};
        EGLSync eglSync = eglCreateSync(myEGLWindow.eglDisplay, EGL_SYNC_FENCE, attr);
        NAPI_ASSERT(env, eglSync != EGL_NO_SYNC, "eglCreateSync error");
        EGLBoolean Ret = eglDestroySync(myEGLWindow.eglDisplay, eglSync);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglDestroySync error");
    }
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreateSyncAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLSync eglSync = eglCreateSync(EGL_NO_DISPLAY, EGL_SYNC_FENCE, nullptr);
    NAPI_ASSERT(env, eglSync == EGL_NO_SYNC, "eglCreateSync error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglDestroySync(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    if (myEGLWindow.eglVersion >= GL_VERSION_15) {
        const EGLAttrib attr[] = {EGL_NONE};
        EGLSync eglSync = eglCreateSync(myEGLWindow.eglDisplay, EGL_SYNC_FENCE, attr);
        NAPI_ASSERT(env, eglSync != EGL_NO_SYNC, "eglCreateSync error");
        EGLBoolean Ret = eglDestroySync(myEGLWindow.eglDisplay, eglSync);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglDestroySync error");
    }
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglDestroySyncAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLBoolean Ret = eglDestroySync(EGL_NO_DISPLAY, EGL_NO_SYNC);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglDestroySync error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglClientWaitSync(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    if (myEGLWindow.eglVersion >= GL_VERSION_15) {
        const EGLAttrib attr[] = {EGL_NONE};
        EGLSync eglSync = eglCreateSync(myEGLWindow.eglDisplay, EGL_SYNC_FENCE, attr);
        NAPI_ASSERT(env, eglSync != EGL_NO_SYNC, "eglCreateSync error");
        EGLBoolean Ret = eglClientWaitSync(myEGLWindow.eglDisplay, eglSync, 0x00, EGL_FOREVER);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglClientWaitSync error");
        Ret = eglDestroySync(myEGLWindow.eglDisplay, eglSync);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglDestroySync error");
    }
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglClientWaitSyncAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglClientWaitSync(myEGLWindow.eglDisplay, EGL_NO_SYNC, 0x00, EGL_FOREVER);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglClientWaitSync error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetSyncAttrib(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    if (myEGLWindow.eglVersion >= GL_VERSION_15) {
        const EGLAttrib attr[] = {EGL_NONE};
        EGLSync eglSync = eglCreateSync(myEGLWindow.eglDisplay, EGL_SYNC_FENCE, attr);
        NAPI_ASSERT(env, eglSync != EGL_NO_SYNC, "eglCreateSync error");
        EGLAttrib value[1] = {0x00};
        EGLBoolean Ret = eglGetSyncAttrib(myEGLWindow.eglDisplay, eglSync, EGL_SYNC_TYPE, value);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglGetSyncAttrib error");
        Ret = eglDestroySync(myEGLWindow.eglDisplay, eglSync);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglDestroySync error");
    }
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetSyncAttribAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLAttrib value[1] = {0x00};
    EGLBoolean Ret = eglGetSyncAttrib(EGL_NO_DISPLAY, EGL_NO_SYNC, EGL_SYNC_TYPE, value);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglGetSyncAttrib error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreateImage(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    if (myEGLWindow.eglVersion >= GL_VERSION_15) {
        int texture = EGL_ONE;
        glBindTexture(GL_TEXTURE_2D, texture);
        glTexImage2D(GL_TEXTURE_2D, 0x00, GL_RGBA, INIT_WIDTH, INIT_HEIGHT, 0x00, GL_RGBA, GL_UNSIGNED_BYTE, nullptr);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        const EGLAttrib eglAttrib[] = {EGL_GL_TEXTURE_LEVEL, 0x00, EGL_NONE};
        EGLImage image = eglCreateImage(myEGLWindow.eglDisplay, myEGLWindow.eglContext, EGL_GL_TEXTURE_2D,
                                        (void *)(static_cast<intptr_t>(texture)), eglAttrib);
        NAPI_ASSERT(env, image != EGL_NO_IMAGE, "eglCreateImage error");
        EGLBoolean Ret = eglDestroyImage(myEGLWindow.eglDisplay, image);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglDestroyImage error");
    }
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreateImageAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLImage image = eglCreateImage(EGL_NO_DISPLAY, EGL_NO_CONTEXT, EGL_GL_TEXTURE_2D, nullptr, nullptr);
    NAPI_ASSERT(env, image == EGL_NO_IMAGE, "eglCreateImage error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglDestroyImage(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    if (myEGLWindow.eglVersion >= GL_VERSION_15) {
        int texture = EGL_ONE;
        glBindTexture(GL_TEXTURE_2D, texture);
        glTexImage2D(GL_TEXTURE_2D, 0x00, GL_RGBA, INIT_WIDTH, INIT_HEIGHT, 0x00, GL_RGBA, GL_UNSIGNED_BYTE, nullptr);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        const EGLAttrib eglAttrib[] = {EGL_GL_TEXTURE_LEVEL, 0x00, EGL_NONE};
        EGLImage image = eglCreateImage(myEGLWindow.eglDisplay, myEGLWindow.eglContext, EGL_GL_TEXTURE_2D,
                                        (void *)(static_cast<intptr_t>(texture)), eglAttrib);
        NAPI_ASSERT(env, image != EGL_NO_IMAGE, "eglCreateImage error");
        EGLBoolean Ret = eglDestroyImage(myEGLWindow.eglDisplay, image);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglDestroyImage error");
    }
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglDestroyImageAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLBoolean Ret = eglDestroyImage(EGL_NO_DISPLAY, EGL_NO_IMAGE);
    NAPI_ASSERT(env, Ret != EGL_TRUE, "eglDestroyImage error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetPlatformDisplay(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLDisplay eglDisplay = eglGetPlatformDisplay(EGL_PLATFORM_OHOS_KHR, EGL_DEFAULT_DISPLAY, nullptr);
    NAPI_ASSERT(env, eglDisplay != EGL_NO_DISPLAY, "eglGetPlatformDisplay error");
    EGLBoolean Ret = eglTerminate(eglDisplay);
    NAPI_ASSERT(env, Ret == EGL_TRUE, "eglTerminate error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglGetPlatformDisplayAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLDisplay eglDisplay = eglGetPlatformDisplay(0x00, nullptr, nullptr);
    NAPI_ASSERT(env, eglDisplay == EGL_NO_DISPLAY, "eglGetPlatformDisplay error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_PARAMETER, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreatePlatformWindowSurfaceAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLSurface eglSurface = eglCreatePlatformWindowSurface(EGL_NO_DISPLAY, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, eglSurface == EGL_NO_SURFACE, "eglCreatePlatformWindowSurface error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglCreatePlatformPixmapSurfaceAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    eglGetErrorInit();
    EGLSurface eglSurface = eglCreatePlatformPixmapSurface(EGL_NO_DISPLAY, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, eglSurface == EGL_NO_SURFACE, "eglCreatePlatformPixmapSurface error");
    EGLint eglError = eglGetError();
    NAPI_ASSERT(env, eglError == EGL_BAD_DISPLAY, "eglGetError error");
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglWaitSync(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    if (myEGLWindow.eglVersion >= GL_VERSION_15) {
        const EGLAttrib attr[] = {EGL_NONE};
        EGLSync eglSync = eglCreateSync(myEGLWindow.eglDisplay, EGL_SYNC_FENCE, attr);
        NAPI_ASSERT(env, eglSync != EGL_NO_SYNC, "eglCreateSync error");
        EGLBoolean Ret = eglWaitSync(myEGLWindow.eglDisplay, eglSync, 0x00);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglWaitSync error");
        Ret = eglDestroySync(myEGLWindow.eglDisplay, eglSync);
        NAPI_ASSERT(env, Ret == EGL_TRUE, "eglDestroySync error");
    }
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

static napi_value EglWaitSyncAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    MyEGLWindow myEGLWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    createMyEglWindow(env, &myEGLWindow);
    EGLBoolean Ret = eglWaitSync(myEGLWindow.eglDisplay, EGL_NO_SYNC, EGL_ONE);
    NAPI_ASSERT(env, Ret == EGL_FALSE, "eglWaitSync error");
    destroyMyEglWindow(env, &myEGLWindow);
    napi_value result = nullptr;
    napi_create_int32(env, SUCCESS, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"eglChooseConfig", nullptr, EglChooseConfig, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglChooseConfigAbnormal", nullptr, EglChooseConfigAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglCopyBuffersAbnormal", nullptr, EglCopyBuffersAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglCreateContext", nullptr, EglCreateContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglCreateContextAbnormal", nullptr, EglCreateContextAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglCreatePbufferSurface", nullptr, EglCreatePbufferSurface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglCreatePbufferSurfaceAbnormal", nullptr, EglCreatePbufferSurfaceAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"eglCreatePixmapSurfaceAbnormal", nullptr, EglCreatePixmapSurfaceAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"eglCreateWindowSurfaceAbnormal", nullptr, EglCreateWindowSurfaceAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"eglDestroyContext", nullptr, EglDestroyContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglDestroyContextAbnormal", nullptr, EglDestroyContextAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglDestroySurface", nullptr, EglDestroySurface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglDestroySurfaceAbnormal", nullptr, EglDestroySurfaceAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglGetConfigAttrib", nullptr, EglGetConfigAttrib, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetConfigAttribAbnormal", nullptr, EglGetConfigAttribAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglGetConfigs", nullptr, EglGetConfigs, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetConfigsAbnormal", nullptr, EglGetConfigsAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetCurrentDisplay", nullptr, EglGetCurrentDisplay, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetCurrentDisplayAbnormal", nullptr, EglGetCurrentDisplayAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglGetCurrentSurface", nullptr, EglGetCurrentSurface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetCurrentSurfaceAbnormal", nullptr, EglGetCurrentSurfaceAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglGetDisplay", nullptr, EglGetDisplay, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetError", nullptr, EglGetError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetProcAddress", nullptr, EglGetProcAddress, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetProcAddressAbnormal", nullptr, EglGetProcAddressAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglInitialize", nullptr, EglInitialize, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglInitializeAbnormal", nullptr, EglInitializeAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglMakeCurrent", nullptr, EglMakeCurrent, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglMakeCurrentAbnormal", nullptr, EglMakeCurrentAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglQueryContext", nullptr, EglQueryContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglQueryContextAbnormal", nullptr, EglQueryContextAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglQueryString", nullptr, EglQueryString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglQueryStringAbnormal", nullptr, EglQueryStringAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglQuerySurface", nullptr, EglQuerySurface, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglQuerySurfaceAbnormal", nullptr, EglQuerySurfaceAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglSwapBuffers", nullptr, EglSwapBuffers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglSwapBuffersAbnormal", nullptr, EglSwapBuffersAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglTerminate", nullptr, EglTerminate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglTerminateAbnormal", nullptr, EglTerminateAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglWaitGL", nullptr, EglWaitGL, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglWaitNative", nullptr, EglWaitNative, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglBindTexImage", nullptr, EglBindTexImage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglBindTexImageAbnormal", nullptr, EglBindTexImageAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglReleaseTexImage", nullptr, EglReleaseTexImage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglReleaseTexImageAbnormal", nullptr, EglReleaseTexImageAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglSurfaceAttrib", nullptr, EglSurfaceAttrib, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglSurfaceAttribAbnormal", nullptr, EglSurfaceAttribAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglSwapInterval", nullptr, EglSwapInterval, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglSwapIntervalAbnormal", nullptr, EglSwapIntervalAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglBindAPI", nullptr, EglBindAPI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglBindAPIAbnormal", nullptr, EglBindAPIAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglQueryAPI", nullptr, EglQueryAPI, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglCreatePbufferFromClientBufferAbnormal", nullptr, EglCreatePbufferFromClientBufferAbnormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"eglReleaseThread", nullptr, EglReleaseThread, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglWaitClient", nullptr, EglWaitClient, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetCurrentContext", nullptr, EglGetCurrentContext, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglCreateSync", nullptr, EglCreateSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglCreateSyncAbnormal", nullptr, EglCreateSyncAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglDestroySync", nullptr, EglDestroySync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglDestroySyncAbnormal", nullptr, EglDestroySyncAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglClientWaitSync", nullptr, EglClientWaitSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglClientWaitSyncAbnormal", nullptr, EglClientWaitSyncAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglGetSyncAttrib", nullptr, EglGetSyncAttrib, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetSyncAttribAbnormal", nullptr, EglGetSyncAttribAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"eglCreateImage", nullptr, EglCreateImage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglCreateImageAbnormal", nullptr, EglCreateImageAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglDestroyImage", nullptr, EglDestroyImage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglDestroyImageAbnormal", nullptr, EglDestroyImageAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetPlatformDisplay", nullptr, EglGetPlatformDisplay, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglGetPlatformDisplayAbnormal", nullptr, EglGetPlatformDisplayAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"eglCreatePlatformWindowSurfaceAbnormal", nullptr, EglCreatePlatformWindowSurfaceAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"eglCreatePlatformPixmapSurfaceAbnormal", nullptr, EglCreatePlatformPixmapSurfaceAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"eglWaitSync", nullptr, EglWaitSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"eglWaitSyncAbnormal", nullptr, EglWaitSyncAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "eglndk",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterModule(void) { napi_module_register(&demoModule); }
