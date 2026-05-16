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

#include <cstdlib>
#include "napi/native_api.h"
#include "native_common.h"
#include "Gl4ApiTest.h"
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <EGL/eglplatform.h>
#include <GL/gl.h>
#include <GL/glcorearb.h>

static napi_value getError(const napi_env env, const GLenum glError)
{
    napi_value result = nullptr;
    if (GL_NO_ERROR == glError) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

typedef EGLBoolean(*PFNOHGRAPHICSQUERYGLPROC)(void);
static napi_value IsSupportGL(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    PFNOHGRAPHICSQUERYGLPROC OH_Graphics_QueryGL = reinterpret_cast<PFNOHGRAPHICSQUERYGLPROC>(
        eglGetProcAddress("OH_Graphics_QueryGL")
    );
    if (OH_Graphics_QueryGL) {
        if (OH_Graphics_QueryGL()) {
            napi_create_int32(env, SUCCESS, &result);
        } else {
            napi_create_int32(env, FAILED, &result);
        }
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

static napi_value GLTextureARBTest(napi_env env, napi_callback_info info)
{
    (void)info;
    Gl4ApiTest gl4ApiTest;
    gl4ApiTest.InitContext(nullptr);
    GLenum glError = gl4ApiTest.GLTextureARBAbnormal();
    gl4ApiTest.Release();
    return getError(env, glError);
}

static napi_value GLBufferARBTest(napi_env env, napi_callback_info info)
{
    (void)info;
    Gl4ApiTest gl4ApiTest;
    gl4ApiTest.InitContext(nullptr);
    GLenum glError = gl4ApiTest.GLBufferARBAbnormal();
    gl4ApiTest.Release();
    return getError(env, glError);
}

static napi_value GLUniformARBTest(napi_env env, napi_callback_info info)
{
    (void)info;
    Gl4ApiTest gl4ApiTest;
    gl4ApiTest.InitContext(nullptr);
    GLenum glError = gl4ApiTest.GLUniformARBAbnormal();
    gl4ApiTest.Release();
    return getError(env, glError);
}

static napi_value GLUniformMatrixARBTest(napi_env env, napi_callback_info info)
{
    (void)info;
    Gl4ApiTest gl4ApiTest;
    gl4ApiTest.InitContext(nullptr);
    GLenum glError = gl4ApiTest.GLUniformMatrixARBAbnormal();
    gl4ApiTest.Release();
    return getError(env, glError);
}

static napi_value GLLineStippleHalfEmpty(napi_env env, napi_callback_info info)
{
    // 测试标准虚线模式
    glEnable(GL_LINE_STIPPLE);
    glLineStipple(1, 0x00FF);  // 一半像素实线一半像素空白
    GLenum glError = glGetError();
    glDisable(GL_LINE_STIPPLE); // 清理状态
    return getError(env, glError);
}

static napi_value GLLineStippleMaxFactor(napi_env env, napi_callback_info info)
{
    // max factor test
    glEnable(GL_LINE_STIPPLE);
    GLint maxRepeatFactor = 256;
    GLushort halfDashedPattern = 0x00FF;
    glLineStipple(maxRepeatFactor, halfDashedPattern);
    GLenum glError = glGetError();
    glDisable(GL_LINE_STIPPLE); // clean state
    return getError(env, glError);
}

static napi_value GLLineStippleDottedPattern(napi_env env, napi_callback_info info)
{
    // dotted pattern test
    glEnable(GL_LINE_STIPPLE);
    GLint minRepeatFactor = 1;
    GLushort dottedPattern = 0x0101;
    glLineStipple(minRepeatFactor, dottedPattern);
    GLenum glError = glGetError();
    glDisable(GL_LINE_STIPPLE); // clean state
    return getError(env, glError);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"gLTextureARBTest", nullptr, GLTextureARBTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBufferARBTest", nullptr, GLBufferARBTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformARBTest", nullptr, GLUniformARBTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrixARBTest", nullptr, GLUniformMatrixARBTest, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glLineStippleHalfEmpty", nullptr, GLLineStippleHalfEmpty, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glLineStippleMaxFactor", nullptr, GLLineStippleMaxFactor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glLineStippleDottedPattern", nullptr, GLLineStippleDottedPattern, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"isSupportGL", nullptr, IsSupportGL, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    setenv("NEED_OPENGL", "1", 1);
    setenv("MESA_GL_VERSION_OVERRIDE", "4.2", 1);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "media",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }