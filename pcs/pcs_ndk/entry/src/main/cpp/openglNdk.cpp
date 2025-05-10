/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#include <EGL/egl.h>
#include <EGL/eglplatform.h>
#include <GLES2/gl2.h>

#define INT_INIT_VAL 0
#define CREAT_NUM_ONE 1
#define RGB_SIZE 8
#define INIT_WIDTH 480
#define INIT_HEIGHT 800
#define INIT_EGL_VERSION 3
    
static EGLDisplay eglDisplay = nullptr;
static EGLContext eglContext = nullptr;
static EGLSurface eglSurface = nullptr;
void InitGLES()
{
    eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(eglDisplay, nullptr, nullptr);
    EGLint numConfigs = INT_INIT_VAL;
    const EGLint configAttribs[] = {EGL_RED_SIZE,  RGB_SIZE, EGL_GREEN_SIZE,      RGB_SIZE,
                                    EGL_BLUE_SIZE, RGB_SIZE, EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT,
                                    EGL_NONE};
    EGLConfig config = nullptr;
    eglChooseConfig(eglDisplay, configAttribs, &config, CREAT_NUM_ONE, &numConfigs);
    const EGLint surfaceAttribs[] = {EGL_WIDTH, INIT_WIDTH, EGL_HEIGHT, INIT_HEIGHT, EGL_NONE};
    eglSurface = eglCreatePbufferSurface(eglDisplay, config, surfaceAttribs);
    const EGLint contextAttribs[] = {EGL_CONTEXT_CLIENT_VERSION, INIT_EGL_VERSION, EGL_NONE};
    eglContext = eglCreateContext(eglDisplay, config, EGL_NO_CONTEXT, contextAttribs);
    eglMakeCurrent(eglDisplay, eglSurface, eglSurface, eglContext);
}
void DestroyGLES()
{
    eglDestroySurface(eglDisplay, eglSurface);
    eglDestroyContext(eglDisplay, eglContext);
    eglTerminate(eglDisplay);
    eglSwapBuffers(eglDisplay, eglSurface);
}

static napi_value OpenglExist(napi_env env, napi_callback_info info)
{
    InitGLES();
    const GLubyte *renderer = glGetString(GL_RENDERER);
    napi_value result = nullptr;
    if (renderer != nullptr) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, 1, &result);
    }
    DestroyGLES();
    return result;
}

static napi_value OpenglEnabled(napi_env env, napi_callback_info info)
{
    InitGLES();
    napi_value result = nullptr;
    GLboolean isEnabled = glIsEnabled(GL_DITHER);
    if (isEnabled) {
        napi_create_int32(env, 0, &result);
    } else {
        napi_create_int32(env, 1, &result);
    }
    DestroyGLES();
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"OpenglExist", nullptr, OpenglExist, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"OpenglEnabled", nullptr, OpenglEnabled, nullptr, nullptr, nullptr, napi_default, nullptr}
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
    .nm_modname = "openglNdk",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
