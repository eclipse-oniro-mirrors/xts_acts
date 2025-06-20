/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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

#include "napi/native_api.h"
#include "native_common.h"

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <EGL/eglplatform.h>
#include <GLES3/gl32.h>

#include <cmath>
#include <node_api.h>

#define NUMERIC_VALUE
#ifdef NUMERIC_VALUE

#define ARRAY_INDEX_ZERO 0
#define ARRAY_INDEX_ONE 1
#define ARRAY_INDEX_TWO 2
#define ARRAY_INDEX_THREE 3
#define ARRAY_INDEX_FORE 4
#define INT_INIT_VAL 0
#define CREAT_ERROR 0
#define CREAT_NUM_ONE 1
#define PIPELINES_NUM_ONE 1
#define INFO_LEN_ONE 1
#define TEXTURES_NUM_ONE 1
#define IMAGE2D_LEVEL 0
#define IMAGE_WIDTH 256
#define IMAGE_HEIGHT 256
#define IMAGE_DEPTH 256
#define IMAGE_BORDER 0
#define GL_BUF_SIZE 256
#define GEN_BUF_NUM 1
#define COUNT_NUM 1
#define ATTRIB_INDEX 0
#define VERTEX_NUM 3
#define RGB_SIZE 8
#define INIT_WIDTH 480
#define INIT_HEIGHT 800
#define INIT_EGL_VERSION 3
#define VARYING_NUM 2
#define ATTRIB_SIZE 3
#define FRAME_BUFFER_OBJECT 2
#define CLEAR_00 0.0f
#define CLEAR_01 0.1f
#define CLEAR_10 1.0f
#define CLEAR_50 5.0f
#define SUB_DATA_SIZE 32
#define COMPUTE_VAL 10
#define POINT_LIGHT_COUNT 4
#define MATRIX_2 2
#define MATRIX_3 3
#define MATRIX_4 4
#define MATRIX_6 6
#define MATRIX_8 8
#define MATRIX_9 9
#define MATRIX_12 12
#define MATRIX_15 15
#define MATRIX_16 16
#define IMAGE2D_LEVEL_ONE 1
#define TIME_OUT 1000000000
#define SAMPLES 4
#define OFF_SET 32
#define TEX_BUF_SIZE 1024

#undef LOG_TAG
#undef LOG_DOMAIN
#define LOG_TAG "gl32"
#define LOG_DOMAIN 0xFEFE
#define GL_MAX_TEST_NUM 0xFFFF
#define GL_CLIENT_VERSION 0x02
#define GL_MAJOR_VERSION_2 0x02
#define GL_MAJOR_VERSION_3 0x03
#define GL_MINOR_VERSION_0 0x00
#endif

#define STATE_VALUE
#ifdef STATE_VALUE

#define SUCCESS 0
#define FAILED -1
#endif

typedef struct _EGLWindow {
    EGLDisplay eglDisPlay;
    EGLSurface eglLSurface;
    EGLContext eglContext;
} EGLWindow;

static void initGLES(EGLWindow *eglWindow)
{
    if (eglWindow == nullptr) {
        return;
    }
    eglWindow->eglDisPlay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    if (eglWindow->eglDisPlay == EGL_NO_DISPLAY) {
        return;
    }
    EGLint majorVersion = GL_MAJOR_VERSION_2;
    EGLint minorVersion = GL_MINOR_VERSION_0;
    EGLBoolean ret = eglInitialize(eglWindow->eglDisPlay, &majorVersion, &minorVersion);
    if (ret == EGL_FALSE) {
        return;
    }
    EGLint clientVersion = majorVersion == GL_MAJOR_VERSION_3 ? EGL_OPENGL_ES3_BIT : EGL_OPENGL_ES2_BIT;
    const EGLint configAttribs[] = {
        EGL_RED_SIZE,   RGB_SIZE, EGL_GREEN_SIZE,      RGB_SIZE,      EGL_BLUE_SIZE,    RGB_SIZE,
        EGL_ALPHA_SIZE, RGB_SIZE, EGL_RENDERABLE_TYPE, clientVersion, EGL_SURFACE_TYPE, EGL_PBUFFER_BIT,
        EGL_NONE};
    EGLConfig config = nullptr;
    EGLint numConfigs = 0x00;
    ret = eglChooseConfig(eglWindow->eglDisPlay, configAttribs, &config, GL_ONE, &numConfigs);
    if (ret == EGL_FALSE) {
        return;
    }
    const EGLint surfaceAttribs[] = {EGL_WIDTH,          INIT_WIDTH,         EGL_HEIGHT,
                                     INIT_HEIGHT,        EGL_TEXTURE_FORMAT, EGL_TEXTURE_RGBA,
                                     EGL_TEXTURE_TARGET, EGL_TEXTURE_2D,     EGL_NONE};
    eglWindow->eglLSurface = eglCreatePbufferSurface(eglWindow->eglDisPlay, config, surfaceAttribs);
    if (eglWindow->eglLSurface == EGL_NO_SURFACE) {
        return;
    }
    const EGLint contextAttribs[] = {EGL_CONTEXT_CLIENT_VERSION, GL_CLIENT_VERSION, EGL_NONE};
    eglWindow->eglContext = eglCreateContext(eglWindow->eglDisPlay, config, EGL_NO_CONTEXT, contextAttribs);
    if (eglWindow->eglContext == EGL_NO_CONTEXT) {
        return;
    }
    eglMakeCurrent(eglWindow->eglDisPlay, eglWindow->eglLSurface, eglWindow->eglLSurface,
                   eglWindow->eglContext);
    return;
}

static void destroyGLES(EGLWindow *eglWindow)
{
    if (eglWindow == nullptr) {
        return;
    }
    if (eglWindow->eglDisPlay != EGL_NO_DISPLAY && eglWindow->eglLSurface != EGL_NO_SURFACE) {
        eglDestroySurface(eglWindow->eglDisPlay, eglWindow->eglLSurface);
    }
    if (eglWindow->eglDisPlay != EGL_NO_DISPLAY && eglWindow->eglContext != EGL_NO_CONTEXT) {
        eglDestroyContext(eglWindow->eglDisPlay, eglWindow->eglContext);
    }
    if (eglWindow->eglDisPlay != EGL_NO_DISPLAY) {
        eglTerminate(eglWindow->eglDisPlay);
    }
    eglSwapBuffers(eglWindow->eglDisPlay, eglWindow->eglLSurface);
    eglWindow->eglDisPlay = EGL_NO_DISPLAY;
    eglWindow->eglLSurface = EGL_NO_SURFACE;
    eglWindow->eglContext = EGL_NO_CONTEXT;
    return;
}

static const char *vertexSource = "attribute vec4 position;\n"
                                  "uniform mat4 mvpMatrix;\n"
                                  "void main() {\n"
                                  "  gl_Position = mvpMatrix * position;\n"
                                  "}\n";

static const char *fragmentSource = "precision mediump float;\n"
                                    "uniform float color;\n"
                                    "void main() {\n"
                                    "  gl_FragColor = vec4(color, 0.0, 0.0, 1.0);\n;\n"
                                    "}\n";

static const char *vertexShaderSource = "    #version 300 es                          \n\
                                      		layout(location = 0) in vec4 vPosition;  \n\
                                      		layout (std140) uniform MatrixBlock { \n\
                                                mat4 viewMatrix;  \n\
                                                mat4 projMatrix; \n\
                                            } matrices;                             \n\
                                                                       \n\
                                      		void main()                              \n\
                                      		{                                        \n\
                                      		   gl_Position = vPosition;              \n\
                                      		}        ";
static const char *fragmentShaderSource = "     #version 300 es                              \n\
                                          		precision mediump float;                     \n\
                                          		out vec4 fragColor;                          \n\
                                          		void main()                                  \n\
                                          		{                                            \n\
                                          		   fragColor = vec4 ( 1.0, 0.0, 0.0, 1.0 );  \n\
                                          		}";

static const char *fragmentShaderSourceCompute = "#version 310 es\n\
                                                layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;\n\
                                                layout(std430, binding = 0) buffer OutputBuffer {\n\
                                                    float data[];\n\
                                                } outputBuffer;\n\
                                                void main() {\n\
                                                    uint index = gl_GlobalInvocationID.x;\n\
                                                    outputBuffer.data[index] = float(index);\n\
                                                }";
static const char *fragmentShaderSourceComputeIndirect = "#version 310 es\n\
                                                        layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;\n\
                                                        layout(std430, binding = 0) buffer OutputBuffer {\n\
                                                            float data[];\n\
                                                        } outputBuffer;\n\
                                                        void main() {\n\
                                                            uint index = gl_GlobalInvocationID.x;\n\
                                                            outputBuffer.data[index] = float(index);\n\
                                                        }";
static EGLDisplay display = nullptr;
static EGLContext context = nullptr;
static EGLSurface surface = nullptr;

GLuint esLoadShader(GLenum type, const char *shaderSrc);
static napi_value getError(const napi_env env, const GLenum glError);
void initGLES();
void destroyGLES();

void initGLES()
{
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, nullptr, nullptr);
    EGLint numConfigs = INT_INIT_VAL;
    const EGLint configAttribs[] = {EGL_RED_SIZE,  RGB_SIZE, EGL_GREEN_SIZE,      RGB_SIZE,
                                    EGL_BLUE_SIZE, RGB_SIZE, EGL_RENDERABLE_TYPE, EGL_OPENGL_ES3_BIT,
                                    EGL_NONE};
    EGLConfig config = nullptr;
    eglChooseConfig(display, configAttribs, &config, CREAT_NUM_ONE, &numConfigs);
    const EGLint surfaceAttribs[] = {EGL_WIDTH, INIT_WIDTH, EGL_HEIGHT, INIT_HEIGHT, EGL_NONE};
    surface = eglCreatePbufferSurface(display, config, surfaceAttribs);
    const EGLint contextAttribs[] = {EGL_CONTEXT_CLIENT_VERSION, INIT_EGL_VERSION, EGL_NONE};
    context = eglCreateContext(display, config, EGL_NO_CONTEXT, contextAttribs);
    eglMakeCurrent(display, surface, surface, context);
}
void destroyGLES()
{
    eglDestroySurface(display, surface);
    eglDestroyContext(display, context);
    eglTerminate(display);
    eglSwapBuffers(display, surface);
}

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

GLuint esLoadShader(GLenum type, const char *shaderSrc)
{
    GLuint shader = INT_INIT_VAL;
    shader = glCreateShader(type);
    if (CREAT_ERROR == shader) {
        return CREAT_ERROR;
    }
    glShaderSource(shader, CREAT_NUM_ONE, &shaderSrc, nullptr);
    glCompileShader(shader);
    return shader;
}

static GLuint shaderVertex = INT_INIT_VAL;
static GLuint shaderFragment = INT_INIT_VAL;
static GLuint initProgram(void)
{
    shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObject = glCreateProgram();
    glAttachShader(programObject, shaderVertex);
    glAttachShader(programObject, shaderFragment);
    glLinkProgram(programObject);
    return programObject;
}

static GLuint initProgram(const char *vertexSource, const char *fragmentSource)
{
    shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexSource);
    shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentSource);
    GLuint programObject = glCreateProgram();
    glAttachShader(programObject, shaderVertex);
    glAttachShader(programObject, shaderFragment);
    glLinkProgram(programObject);
    return programObject;
}

static void deleteProgram(void)
{
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
}

static napi_value GLSamplerParameterfv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLfloat params[ARRAY_INDEX_TWO] = {INT_INIT_VAL};
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    params[ARRAY_INDEX_ZERO] = GL_NEAREST;
    params[ARRAY_INDEX_ONE] = GL_LINEAR;
    glSamplerParameterfv(sampler, GL_TEXTURE_MIN_FILTER, params);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLSamplerParameteri(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    glSamplerParameteri(sampler, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLSamplerParameterIiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLint params[ARRAY_INDEX_TWO] = {INT_INIT_VAL};
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    params[ARRAY_INDEX_ZERO] = GL_NEAREST;
    params[ARRAY_INDEX_ONE] = GL_LINEAR;
    glSamplerParameterIiv(sampler, GL_TEXTURE_MAG_FILTER, params);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLSamplerParameterIuiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint params[ARRAY_INDEX_TWO] = {INT_INIT_VAL};
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    params[ARRAY_INDEX_ZERO] = GL_NEAREST;
    params[ARRAY_INDEX_ONE] = GL_LINEAR;
    glSamplerParameterIuiv(sampler, GL_TEXTURE_MAG_FILTER, params);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLSamplerParameteriv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLint params[ARRAY_INDEX_TWO] = {INT_INIT_VAL};
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    params[ARRAY_INDEX_ZERO] = GL_NEAREST;
    params[ARRAY_INDEX_ONE] = GL_LINEAR;
    glSamplerParameteriv(sampler, GL_TEXTURE_MAG_FILTER, params);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLScissor(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_SCISSOR_TEST);
    glScissor(IMAGE_WIDTH, IMAGE_HEIGHT, INIT_WIDTH, INIT_HEIGHT);
    GLenum glError = glGetError();
    glDisable(GL_SCISSOR_TEST);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLShaderBinary(napi_env env, napi_callback_info info)
{
    initGLES();
    GLubyte binary[TEX_BUF_SIZE] = {INT_INIT_VAL};
    GLuint shader = glCreateShader(GL_FRAGMENT_SHADER);
    glShaderBinary(CREAT_NUM_ONE, &shader, INT_INIT_VAL, binary, INT_INIT_VAL);
    GLenum glError = glGetError();
    glDeleteShader(shader);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLShaderSource(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(shader, CREAT_NUM_ONE, &vertexShaderSource, nullptr);
    GLenum glError = glGetError();
    glDeleteShader(shader);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLStencilFunc(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_STENCIL_TEST);
    glStencilFunc(GL_ALWAYS, CREAT_NUM_ONE, GL_INVALID_INDEX);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLStencilFuncSeparate(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_STENCIL_TEST);
    glStencilFuncSeparate(GL_FRONT, GL_EQUAL, CREAT_NUM_ONE, GL_INVALID_INDEX);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLStencilMask(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_STENCIL_TEST);
    glStencilMask(CREAT_NUM_ONE);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLStencilMaskSeparate(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_STENCIL_TEST);
    glStencilMaskSeparate(GL_FRONT_AND_BACK, CREAT_NUM_ONE);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLStencilOp(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_STENCIL_TEST);
    glStencilOp(GL_KEEP, GL_ZERO, GL_REPLACE);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLStencilOpSeparate(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_STENCIL_TEST);
    glStencilOpSeparate(GL_FRONT_AND_BACK, GL_KEEP, GL_ZERO, GL_REPLACE);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexBuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    GLuint buffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_TEXTURE_BUFFER, buffer);
    glBufferData(GL_TEXTURE_BUFFER, GL_BUF_SIZE, nullptr, GL_DYNAMIC_DRAW);
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_BUFFER, texture);
    glTexBuffer(GL_TEXTURE_BUFFER, GL_R32F, buffer);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexBufferRange(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    GLuint buffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_TEXTURE_BUFFER, buffer);
    glBufferData(GL_TEXTURE_BUFFER, GL_BUF_SIZE, nullptr, GL_DYNAMIC_DRAW);
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_BUFFER, texture);
    glTexBufferRange(GL_TEXTURE_BUFFER, GL_R32F, buffer, INT_INIT_VAL, CREAT_NUM_ONE);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexImage2D(napi_env env, napi_callback_info info)
{
    initGLES();
    unsigned char pixels[] = {255, 255, 255, 0, 0, 0, 255, 255, 255, 0, 0, 0};
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, INT_INIT_VAL, GL_RGB, VARYING_NUM, VARYING_NUM, INT_INIT_VAL, GL_RGB, GL_UNSIGNED_BYTE,
                 pixels);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexImage3D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_3D, texture);
    glTexImage3D(GL_TEXTURE_3D, INT_INIT_VAL, GL_RGB, IMAGE_WIDTH, IMAGE_HEIGHT, IMAGE_DEPTH, INT_INIT_VAL, GL_RGB,
                 GL_UNSIGNED_BYTE, nullptr);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexParameterf(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, CLEAR_10);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexParameterfv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    GLfloat color[] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glGenTextures(CREAT_NUM_ONE, &texture);
    glTexParameterfv(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, color);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexParameteri(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, CREAT_NUM_ONE);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexParameterIiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    GLint color[] = {CREAT_NUM_ONE, CREAT_NUM_ONE, CREAT_NUM_ONE, CREAT_NUM_ONE};
    glGenTextures(CREAT_NUM_ONE, &texture);
    glTexParameterIiv(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, color);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexParameterIuiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    GLuint color[] = {CREAT_NUM_ONE, CREAT_NUM_ONE, CREAT_NUM_ONE, CREAT_NUM_ONE};
    glGenTextures(CREAT_NUM_ONE, &texture);
    glTexParameterIuiv(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, color);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexParameteriv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    GLint color[] = {CREAT_NUM_ONE, CREAT_NUM_ONE, CREAT_NUM_ONE, CREAT_NUM_ONE};
    glGenTextures(CREAT_NUM_ONE, &texture);
    glTexParameteriv(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, color);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexStorage2D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexStorage2D(GL_TEXTURE_2D, CREAT_NUM_ONE, GL_RGBA8, IMAGE_WIDTH, IMAGE_HEIGHT);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexStorage2DMultisample(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D_MULTISAMPLE, texture);
    glTexStorage2DMultisample(GL_TEXTURE_2D_MULTISAMPLE, SAMPLES, GL_RGB8, IMAGE_WIDTH, IMAGE_HEIGHT, INT_INIT_VAL);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexStorage3D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D_ARRAY, texture);
    glTexStorage3D(GL_TEXTURE_2D_ARRAY, IMAGE2D_LEVEL_ONE, GL_RGBA8, INIT_WIDTH, INIT_HEIGHT, VARYING_NUM);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexStorage3DMultisample(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D_MULTISAMPLE_ARRAY, texture);
    glTexStorage3DMultisample(GL_TEXTURE_2D_MULTISAMPLE_ARRAY, CREAT_NUM_ONE, GL_RGBA8, SUB_DATA_SIZE, SUB_DATA_SIZE,
                              SUB_DATA_SIZE, GL_FALSE);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexSubImage2D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, INT_INIT_VAL, GL_RGB, VARYING_NUM, VARYING_NUM, INT_INIT_VAL, GL_RGB, GL_UNSIGNED_BYTE,
                 nullptr);
    glTexSubImage2D(GL_TEXTURE_2D, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, VARYING_NUM, VARYING_NUM, GL_RGB,
                    GL_UNSIGNED_BYTE, nullptr);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTexSubImage3D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D_ARRAY, texture);
    glTexImage3D(GL_TEXTURE_2D_ARRAY, INT_INIT_VAL, GL_RGB, IMAGE_WIDTH, IMAGE_HEIGHT, IMAGE_DEPTH, INT_INIT_VAL,
                 GL_RGB, GL_UNSIGNED_BYTE, nullptr);
    glTexSubImage3D(GL_TEXTURE_2D_ARRAY, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, IMAGE_WIDTH,
                    IMAGE_HEIGHT, IMAGE_DEPTH, GL_RGB, GL_UNSIGNED_BYTE, nullptr);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLTransformFeedbackVaryings(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLuint feedbackObjId = INT_INIT_VAL;
    glGenTransformFeedbacks(CREAT_NUM_ONE, &feedbackObjId);
    glBindTransformFeedback(GL_TRANSFORM_FEEDBACK, feedbackObjId);
    const char *varyingNames[] = {"outValue"};
    glTransformFeedbackVaryings(programObject, CREAT_NUM_ONE, varyingNames, GL_SEPARATE_ATTRIBS);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    glDeleteTransformFeedbacks(CREAT_NUM_ONE, &feedbackObjId);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform1f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform1f(uniformLocation, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform1fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat brightness[POINT_LIGHT_COUNT] = {0.8f, 0.2f, 0.6f, 0.4f};
    glUniform1fv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform1i(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform1i(uniformLocation, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform1iv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLint brightness[POINT_LIGHT_COUNT] = {0, 0, 0, 0};
    glUniform1iv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform1ui(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform1ui(uniformLocation, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform1uiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLuint brightness[POINT_LIGHT_COUNT] = {0, 0, 0, 0};
    glUniform1uiv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform2f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform2f(uniformLocation, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform2fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat brightness[POINT_LIGHT_COUNT] = {0.8f, 0.2f, 0.6f, 0.4f};
    glUniform2fv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform2i(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform2i(uniformLocation, INT_INIT_VAL, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform2iv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLint brightness[POINT_LIGHT_COUNT] = {0, 0, 0, 0};
    glUniform2iv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform2ui(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform2ui(uniformLocation, INT_INIT_VAL, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform2uiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLuint brightness[POINT_LIGHT_COUNT] = {0, 0, 0, 0};
    glUniform2uiv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform3f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform3f(uniformLocation, CLEAR_10, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform3fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat brightness[POINT_LIGHT_COUNT] = {0.8f, 0.2f, 0.6f, 0.4f};
    glUniform3fv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform3i(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform3i(uniformLocation, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform3iv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLint brightness[POINT_LIGHT_COUNT] = {0, 0, 0, 0};
    glUniform3iv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform3ui(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform3ui(uniformLocation, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform3uiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLuint brightness[POINT_LIGHT_COUNT] = {0, 0, 0, 0};
    glUniform3uiv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform4f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform4f(uniformLocation, CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform4fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat brightness[POINT_LIGHT_COUNT] = {0.8f, 0.2f, 0.6f, 0.4f};
    glUniform4fv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform4i(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform4i(uniformLocation, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform4iv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLint brightness[POINT_LIGHT_COUNT] = {0, 0, 0, 0};
    glUniform4iv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform4ui(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glUseProgram(programObject);
    glUniform4ui(uniformLocation, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniform4uiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLuint brightness[POINT_LIGHT_COUNT] = {0, 0, 0, 0};
    glUniform4uiv(uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformBlockBinding(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLuint matricesIndex = glGetUniformBlockIndex(programObject, "MatrixBlock");
    glUniformBlockBinding(programObject, matricesIndex, VARYING_NUM);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformMatrix2fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat matrix[MATRIX_4] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_10};
    glUniformMatrix2fv(uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformMatrix2x3fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat matrix[MATRIX_6] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00};
    glUniformMatrix2x3fv(uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformMatrix2x4fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat matrix[MATRIX_8] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_10};
    glUniformMatrix2x4fv(uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformMatrix3fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat matrix[MATRIX_9] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10,
                                CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10};
    glUniformMatrix3fv(uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformMatrix3x2fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat matrix[MATRIX_6] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_00};
    glUniformMatrix3x2fv(uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformMatrix3x4fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat matrix[MATRIX_12] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10,
                                 CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00};
    glUniformMatrix3x4fv(uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformMatrix4fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat matrix[MATRIX_16] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_00,
                                 CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10};
    glUniformMatrix4fv(uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformMatrix4x2fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat matrix[MATRIX_8] = {
        CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_00,
    };
    glUniformMatrix4x2fv(uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUniformMatrix4x3fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_pointLights[0].brightness");
    glUseProgram(programObject);
    GLfloat matrix[MATRIX_12] = {
        CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10,
        CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00,
    };
    glUniformMatrix4x3fv(uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUnmapBuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, GL_BUF_SIZE, nullptr, GL_DYNAMIC_DRAW);
    glMapBufferRange(GL_ARRAY_BUFFER, INT_INIT_VAL, GL_BUF_SIZE,
                     GL_MAP_WRITE_BIT | GL_MAP_UNSYNCHRONIZED_BIT | GL_MAP_FLUSH_EXPLICIT_BIT);
    glFlushMappedBufferRange(GL_ARRAY_BUFFER, INT_INIT_VAL, GL_BUF_SIZE);
    GLboolean glRet = glUnmapBuffer(GL_ARRAY_BUFFER);
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    napi_value result = nullptr;
    if (GL_TRUE == glRet) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

static napi_value GLUseProgram(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLUseProgramStages(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint pipeline = INT_INIT_VAL;
    glGenProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    glBindProgramPipeline(pipeline);
    GLuint program = glCreateShaderProgramv(GL_FRAGMENT_SHADER, CREAT_NUM_ONE, &fragmentShaderSource);
    glUseProgramStages(pipeline, GL_FRAGMENT_SHADER_BIT, program);
    GLenum glError = glGetError();
    glDeleteProgram(program);
    glDeleteProgramPipelines(CREAT_NUM_ONE, &pipeline);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLValidateProgram(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glValidateProgram(programObject);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLValidateProgramPipeline(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint pipeline = INT_INIT_VAL;
    glGenProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    glBindProgramPipeline(pipeline);
    glValidateProgramPipeline(pipeline);
    GLenum glError = glGetError();
    glDeleteProgramPipelines(CREAT_NUM_ONE, &pipeline);
    return getError(env, glError);
}

static napi_value GLVertexAttrib1f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    glVertexAttrib1f(attribLocation, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttrib1fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    GLfloat value[ARRAY_INDEX_ONE] = {CLEAR_10};
    glVertexAttrib1fv(attribLocation, value);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttrib2f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    glVertexAttrib2f(attribLocation, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttrib2fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    GLfloat value[ARRAY_INDEX_TWO] = {CLEAR_10, CLEAR_10};
    glVertexAttrib2fv(attribLocation, value);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttrib3f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    glVertexAttrib3f(attribLocation, CLEAR_10, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttrib3fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    GLfloat value[ARRAY_INDEX_THREE] = {CLEAR_10, CLEAR_10, CLEAR_10};
    glVertexAttrib3fv(attribLocation, value);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttrib4f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    glVertexAttrib4f(attribLocation, CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttrib4fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    GLfloat value[ARRAY_INDEX_FORE] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glVertexAttrib4fv(attribLocation, value);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribBinding(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint vao = INT_INIT_VAL;
    GLuint vbo = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glBindVertexArray(vao);
    glGenBuffers(CREAT_NUM_ONE, &vbo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    GLfloat vertices[] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(ARRAY_INDEX_ZERO);
    glVertexAttribFormat(ARRAY_INDEX_ZERO, ARRAY_INDEX_THREE, GL_FLOAT, GL_FALSE, ARRAY_INDEX_ZERO);
    glVertexAttribBinding(ARRAY_INDEX_ZERO, ARRAY_INDEX_ZERO);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteVertexArrays(CREAT_NUM_ONE, &vao);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribDivisor(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint vao = INT_INIT_VAL;
    GLuint vbo = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glBindVertexArray(vao);
    glGenBuffers(CREAT_NUM_ONE, &vbo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    GLfloat vertices[] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(ARRAY_INDEX_ZERO);
    glVertexAttribPointer(INT_INIT_VAL, ARRAY_INDEX_THREE, GL_FLOAT, GL_FALSE, ARRAY_INDEX_THREE * sizeof(GLfloat),
                          nullptr);
    glVertexAttribDivisor(INT_INIT_VAL, CREAT_NUM_ONE);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteVertexArrays(CREAT_NUM_ONE, &vao);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribFormat(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint vao = INT_INIT_VAL;
    GLuint vbo = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glBindVertexArray(vao);
    glGenBuffers(CREAT_NUM_ONE, &vbo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    GLfloat vertices[] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(ARRAY_INDEX_ZERO);
    glVertexAttribFormat(ARRAY_INDEX_ZERO, ARRAY_INDEX_THREE, GL_FLOAT, GL_FALSE, ARRAY_INDEX_ZERO);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteVertexArrays(CREAT_NUM_ONE, &vao);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribI4i(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    glVertexAttribI4i(attribLocation, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribI4iv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    GLint value[ARRAY_INDEX_FORE] = {INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL};
    glVertexAttribI4iv(attribLocation, value);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribI4ui(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    glVertexAttribI4ui(attribLocation, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribI4uiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    glUseProgram(programObject);
    GLint attribLocation = glGetAttribLocation(programObject, "vPosition");
    GLuint value[ARRAY_INDEX_FORE] = {INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL};
    glVertexAttribI4uiv(attribLocation, value);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribIFormat(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint vao = INT_INIT_VAL;
    GLuint vbo = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glBindVertexArray(vao);
    glGenBuffers(CREAT_NUM_ONE, &vbo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    GLfloat vertices[] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glEnableVertexAttribArray(ARRAY_INDEX_ZERO);
    glVertexAttribIFormat(INT_INIT_VAL, ARRAY_INDEX_FORE, GL_INT, INT_INIT_VAL);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteVertexArrays(CREAT_NUM_ONE, &vao);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribIPointer(napi_env env, napi_callback_info info)
{
    initGLES();
    GLint vertices[] = {INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL};
    GLuint VAO = INT_INIT_VAL;
    GLuint VBO = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &VAO);
    glBindVertexArray(VAO);
    glGenBuffers(CREAT_NUM_ONE, &VBO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glVertexAttribIPointer(INT_INIT_VAL, MATRIX_3, GL_INT, MATRIX_3 * sizeof(GLint), nullptr);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &VBO);
    glDeleteVertexArrays(CREAT_NUM_ONE, &VAO);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexAttribPointer(napi_env env, napi_callback_info info)
{
    initGLES();
    GLfloat vertices[] = {CLEAR_00, 0.5f, CLEAR_00, -0.5f, -0.5f, CLEAR_00, 0.5f, -0.5f, CLEAR_00};
    GLuint VAO = INT_INIT_VAL;
    GLuint VBO = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &VAO);
    glBindVertexArray(VAO);
    glGenBuffers(CREAT_NUM_ONE, &VBO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glVertexAttribPointer(INT_INIT_VAL, ATTRIB_SIZE, GL_FLOAT, GL_FALSE, INT_INIT_VAL, INT_INIT_VAL);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &VBO);
    glDeleteVertexArrays(CREAT_NUM_ONE, &VAO);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLVertexBindingDivisor(napi_env env, napi_callback_info info)
{
    initGLES();
    GLfloat vertices[] = {CLEAR_00, 0.5f, CLEAR_00, -0.5f, -0.5f, CLEAR_00, 0.5f, -0.5f, CLEAR_00};
    GLuint VAO = INT_INIT_VAL;
    GLuint VBO = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &VAO);
    glBindVertexArray(VAO);
    glGenBuffers(CREAT_NUM_ONE, &VBO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glVertexAttribPointer(INT_INIT_VAL, ATTRIB_SIZE, GL_FLOAT, GL_FALSE, INT_INIT_VAL, INT_INIT_VAL);
    glVertexBindingDivisor(INT_INIT_VAL, CREAT_NUM_ONE);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &VBO);
    glDeleteVertexArrays(CREAT_NUM_ONE, &VAO);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLViewport(napi_env env, napi_callback_info info)
{
    initGLES();
    glViewport(IMAGE_WIDTH, IMAGE_HEIGHT, IMAGE_WIDTH, IMAGE_HEIGHT);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLWaitSync(napi_env env, napi_callback_info info)
{
    initGLES();
    GLsync syncObject = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, INT_INIT_VAL);
    glWaitSync(syncObject, INT_INIT_VAL, GL_TIMEOUT_IGNORED);
    GLenum glError = glGetError();
    glDeleteSync(syncObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetProgramPipelineInfoLog(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint pipeline = INT_INIT_VAL;
    glGenProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    glBindProgramPipeline(pipeline);
    GLuint program = glCreateShaderProgramv(GL_FRAGMENT_SHADER, CREAT_NUM_ONE, &fragmentShaderSource);
    glUseProgramStages(pipeline, GL_FRAGMENT_SHADER_BIT, program);
    GLchar log[256];
    GLsizei length;
    glGetProgramPipelineInfoLog(pipeline, GL_BUF_SIZE, &length, log);
    GLenum glError = glGetError();
    glDeleteProgramPipelines(CREAT_NUM_ONE, &pipeline);
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetActiveUniform(napi_env env, napi_callback_info info)
{
    initGLES();
    GLenum glError = GL_NO_ERROR;
    GLuint program = initProgram(vertexSource, fragmentSource);
    GLint activeUniformCount;
    glGetProgramiv(program, GL_ACTIVE_UNIFORM_MAX_LENGTH, &activeUniformCount);
    GLchar uniformName[SUB_DATA_SIZE];
    GLsizei length;
    GLint size;
    GLenum type;
    if (activeUniformCount > 0) {
        glGetActiveUniform(program, ARRAY_INDEX_ZERO, SUB_DATA_SIZE, &length, &size, &type, uniformName);
        glError = glGetError();
    }
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetActiveUniformBlockiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexShaderSource, fragmentShaderSource);
    GLuint blockIndex = glGetUniformBlockIndex(program, "MatrixBlock");
    GLint param;
    glGetActiveUniformBlockiv(program, blockIndex, GL_UNIFORM_BLOCK_NAME_LENGTH, &param);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetActiveUniformBlockName(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexShaderSource, fragmentShaderSource);
    GLuint blockIndex = glGetUniformBlockIndex(program, "MatrixBlock");
    GLint nameLen;
    glGetActiveUniformBlockiv(program, blockIndex, GL_UNIFORM_BLOCK_NAME_LENGTH, &nameLen);
    GLsizei length;
    GLchar blockName[nameLen];
    glGetActiveUniformBlockName(program, blockIndex, nameLen, &length, blockName);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetActiveUniformsiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexShaderSource, fragmentShaderSource);
    GLuint blockIndex = glGetUniformBlockIndex(program, "MatrixBlock");
    GLint params;
    glGetActiveUniformsiv(program, CREAT_NUM_ONE, &blockIndex, GL_UNIFORM_TYPE, &params);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetnUniformfv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexSource, fragmentSource);
    GLint location = glGetUniformLocation(program, "color");
    GLfloat param;
    glGetnUniformfv(program, location, sizeof(GLfloat), &param);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}
static napi_value GLGetnUniformiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexSource, fragmentSource);
    GLint location = glGetUniformLocation(program, "color");
    GLint param;
    glGetnUniformiv(program, location, sizeof(GLint), &param);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}
static napi_value GLGetnUniformuiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexSource, fragmentSource);
    GLint location = glGetUniformLocation(program, "color");
    GLuint param;
    glGetnUniformuiv(program, location, sizeof(GLuint), &param);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLActiveShaderProgramAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glActiveShaderProgram(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glActiveShaderProgram error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLActiveTextureAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glActiveTexture(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glActiveTexture error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLAttachShaderAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glAttachShader(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glAttachShader error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBeginQueryAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBeginQuery(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBeginQuery error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBeginTransformFeedbackAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBeginTransformFeedback(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBeginTransformFeedback error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindAttribLocationAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindAttribLocation(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindAttribLocation error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindBufferAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindBuffer(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindBuffer error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindBufferBaseAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindBufferBase(GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindBufferBase error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindBufferRangeAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindBufferRange(GL_ZERO, GL_ZERO, GL_ZERO, GL_ONE, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindBufferRange error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindFramebufferAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindFramebuffer(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindFramebuffer error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindImageTextureAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindImageTexture(GL_ZERO, GL_ZERO, FAILED, GL_FALSE, GL_ZERO, GL_READ_ONLY, GL_RGBA8);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindImageTexture error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindProgramPipelineAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindProgramPipeline(GL_MAX_TEST_NUM);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindProgramPipeline error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindRenderbufferAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindRenderbuffer(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindRenderbuffer error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindSamplerAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindSampler(GL_MAX_TEST_NUM, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindSampler error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindTextureAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindTexture(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindTexture error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindTransformFeedbackAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindTransformFeedback(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindTransformFeedback error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindVertexArrayAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindVertexArray(GL_MAX_TEST_NUM);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindVertexArray error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBindVertexBufferAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBindVertexBuffer(GL_MAX_VERTEX_ATTRIB_BINDINGS, GL_ZERO, FAILED, FAILED);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBindVertexBuffer error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBlendEquationAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBlendEquation(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBlendEquation error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBlendEquationiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBlendEquationi(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBlendEquationi error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBlendEquationSeparateAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBlendEquationSeparate(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBlendEquationSeparate error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBlendEquationSeparateiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBlendEquationSeparatei(GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBlendEquationSeparatei error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBlendFuncAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBlendFunc(GL_MAX_TEST_NUM, GL_MAX_TEST_NUM);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBlendFunc error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBlendFunciAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBlendFunci(GL_MAX_DRAW_BUFFERS, GL_MAX_TEST_NUM, GL_MAX_TEST_NUM);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBlendFunci error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBlendFuncSeparateAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBlendFuncSeparate(GL_CULL_FACE, GL_CULL_FACE, GL_CULL_FACE, GL_CULL_FACE);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBlendFuncSeparate error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBlendFuncSeparateiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBlendFuncSeparatei(GL_MAX_DRAW_BUFFERS, GL_CULL_FACE, GL_CULL_FACE, GL_CULL_FACE, GL_CULL_FACE);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBlendFuncSeparatei error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBlitFramebufferAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBlitFramebuffer(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBlitFramebuffer error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBufferDataAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBufferData(GL_ARRAY_BUFFER, FAILED, nullptr, GL_STREAM_DRAW);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBufferData error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLBufferSubDataAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glBufferSubData(GL_ZERO, FAILED, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glBufferSubData error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCheckFramebufferStatusAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCheckFramebufferStatus(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCheckFramebufferStatus error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLClearAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glClear(GL_COLOR_BUFFER_BIT | GL_ONE);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glClear error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLClearBufferfiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glClearBufferfi(GL_ZERO, GL_ZERO, CLEAR_00, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glClearBufferfi error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLClearBufferfvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glClearBufferfv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "GlClearBufferfvAbnormal error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLClearBufferivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glClearBufferiv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glClearBufferiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLClearBufferuivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glClearBufferuiv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glClearBufferuiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLClientWaitSyncAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glClientWaitSync(reinterpret_cast<GLsync>(GL_MAX_TEST_NUM), GL_SYNC_FLUSH_COMMANDS_BIT, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glClientWaitSync error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLColorMaskiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glColorMaski(GL_MAX_DRAW_BUFFERS, GL_FALSE, GL_FALSE, GL_FALSE, GL_FALSE);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glColorMaski error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCopyBufferSubDataAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCopyBufferSubData(GL_ZERO, GL_ZERO, FAILED, FAILED, FAILED);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCopyBufferSubData error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCopyImageSubDataAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCopyImageSubData(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO,
                       GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCopyImageSubData error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCopyTexImage2DAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCopyTexImage2D(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCopyTexImage2D error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCopyTexSubImage2DAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCopyTexSubImage2D(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCopyTexSubImage2D error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCreateShaderAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCreateShader(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCreateShader error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCreateShaderProgramvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCreateShaderProgramv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCreateShaderProgramv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCullFaceAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCullFace(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCullFace error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDebugMessageControlAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDebugMessageControl(GL_ZERO, GL_ZERO, GL_ZERO, FAILED, nullptr, GL_TRUE);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDebugMessageControl error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteBuffersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteBuffers(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteBuffers error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteFramebuffersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteFramebuffers(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteFramebuffers error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteProgramAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteProgram(GL_MAX_TEST_NUM);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteProgram error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteProgramPipelinesAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteProgramPipelines(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteProgramPipelines error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteQueriesAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteQueries(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteQueries error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteRenderbuffersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteRenderbuffers(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteRenderbuffers error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteSamplersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteSamplers(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteSamplers error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteShaderAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteShader(GL_MAX_TEST_NUM);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteShader error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteSyncAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteSync(reinterpret_cast<GLsync>(GL_MAX_TEST_NUM));
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteSync error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteTexturesAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteTextures(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteTextures error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteTransformFeedbacksAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteTransformFeedbacks(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteTransformFeedbacks error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDeleteVertexArraysAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDeleteVertexArrays(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDeleteVertexArrays error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDepthFuncAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDepthFunc(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDepthFunc error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDetachShaderAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDetachShader(GL_MAX_TEST_NUM, GL_MAX_TEST_NUM);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDetachShader error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDisableAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDisable(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDisable error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDisableiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDisablei(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDisablei error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDisableVertexAttribArrayAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDisableVertexAttribArray(GL_MAX_VERTEX_ATTRIBS);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDisableVertexAttribArray error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDispatchComputeAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDispatchCompute(GL_MAX_TEST_NUM, GL_MAX_TEST_NUM, GL_MAX_TEST_NUM);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDispatchCompute error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDispatchComputeIndirectAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDispatchComputeIndirect(FAILED);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDispatchComputeIndirect error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawArraysAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawArrays(GL_POINTS, GL_ZERO, FAILED);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawArrays error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawArraysIndirectAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawArraysIndirect(GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawArraysIndirect error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawArraysInstancedAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawArraysInstanced(GL_POINTS, GL_ZERO, FAILED, FAILED);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawArraysInstanced error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawBuffersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawBuffers(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawBuffers error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLFlushMappedBufferRangeAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glFlushMappedBufferRange(GL_ARRAY_BUFFER, FAILED, FAILED);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glFlushMappedBufferRange error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLFramebufferParameteriAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glFramebufferParameteri(GL_ZERO, GL_FRAMEBUFFER_DEFAULT_WIDTH, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glFramebufferParameteri error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLFramebufferRenderbufferAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glFramebufferRenderbuffer(GL_ZERO, GL_DEPTH_STENCIL_ATTACHMENT, GL_RENDERBUFFER, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glFramebufferRenderbuffer error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLFramebufferTextureAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glFramebufferTexture(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glFramebufferTexture error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLFramebufferTexture2DAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glFramebufferTexture2D(GL_ZERO, GL_ZERO, GL_TEXTURE_CUBE_MAP_POSITIVE_X, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glFramebufferTexture2D error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLFramebufferTextureLayerAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glFramebufferTextureLayer(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glFramebufferTextureLayer error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLFrontFaceAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glFrontFace(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glFrontFace error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenBuffersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenBuffers(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenBuffers error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenerateMipmapAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenerateMipmap(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenerateMipmap error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenFramebuffersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenFramebuffers(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenFramebuffers error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenProgramPipelinesAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenProgramPipelines(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenProgramPipelines error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenQueriesAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenQueries(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenQueries error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenRenderbuffersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenRenderbuffers(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenRenderbuffers error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenSamplersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenSamplers(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenSamplers error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenTexturesAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenTextures(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenTextures error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenTransformFeedbacksAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenTransformFeedbacks(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenTransformFeedbacks error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGenVertexArraysAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGenVertexArrays(FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGenVertexArrays error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetActiveAttribAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetActiveAttrib(GL_ZERO, GL_ZERO, FAILED, nullptr, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetActiveAttrib error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetAttachedShadersAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetAttachedShaders(GL_ZERO, FAILED, nullptr, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetAttachedShaders error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetAttribLocationAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);

    GLint ret = glGetAttribLocation(GL_ZERO, nullptr);
    NAPI_ASSERT(env, ret == FAILED, "glGetAttribLocation error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetBooleani_vAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetBooleani_v(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetBooleani_v error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetBooleanvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetBooleanv(GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetBooleanv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetBufferParameteri64vAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetBufferParameteri64v(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetBufferParameteri64v error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetBufferParameterivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetBufferParameteriv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetBufferParameteriv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetBufferPointervAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetBufferPointerv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetBufferPointerv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetFloatvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetFloatv(GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetFloatv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetFragDataLocationAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetFragDataLocation(GL_MAX_TEST_NUM, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetFragDataLocation error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetFramebufferAttachmentParameterivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetFramebufferAttachmentParameteriv(GL_ZERO, GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetFramebufferAttachmentParameteriv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetFramebufferParameterivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetFramebufferParameteriv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetFramebufferParameteriv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetInteger64i_vAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetInteger64i_v(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetInteger64i_v error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetInteger64vAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetInteger64v(GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetInteger64v error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetIntegeri_vAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetIntegeri_v(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetIntegeri_v error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetIntegervAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetIntegerv(GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetIntegerv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetInternalformativAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetInternalformativ(GL_ZERO, GL_ZERO, GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetInternalformativ error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetObjectLabelAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetObjectLabel(GL_ZERO, GL_ZERO, GL_ZERO, nullptr, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetObjectLabel error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetObjectPtrLabelAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetObjectPtrLabel(nullptr, GL_ZERO, nullptr, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetObjectPtrLabel error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetPointervAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetPointerv(GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetPointerv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetProgramBinaryAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetProgramBinary(GL_ZERO, GL_ZERO, nullptr, nullptr, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetProgramBinary error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetProgramInterfaceivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetProgramInterfaceiv(GL_ZERO, GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetProgramInterfaceiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetProgramivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetProgramiv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetProgramiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetProgramPipelineivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetProgramPipelineiv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetProgramPipelineiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetProgramResourceIndexAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetProgramResourceIndex(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetProgramResourceIndex error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetProgramResourceivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetProgramResourceiv(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, nullptr, GL_ZERO, nullptr, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetProgramResourceiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetProgramResourceLocationAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetProgramResourceLocation(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetProgramResourceLocation error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetProgramResourceNameAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetProgramResourceName(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, nullptr, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetProgramResourceName error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetQueryivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetQueryiv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetQueryiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetQueryObjectuivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetQueryObjectuiv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetQueryObjectuiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetRenderbufferParameterivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetRenderbufferParameteriv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetRenderbufferParameteriv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetSamplerParameterfvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetSamplerParameterfv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetSamplerParameterfv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetSamplerParameterIivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetSamplerParameterIiv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetSamplerParameterIiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetSamplerParameterIuivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetSamplerParameterIuiv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetSamplerParameterIuiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLGetSamplerParameterivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glGetSamplerParameteriv(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glGetSamplerParameteriv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform1fAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform1f(GL_ZERO, CLEAR_00);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform1f error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform1fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform1fv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform1fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform1iAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform1i(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform1i error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform1ivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform1iv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform1iv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform1uiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform1ui(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform1ui error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform1uivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform1uiv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform1uiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform2fAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform2f(GL_ZERO, CLEAR_00, CLEAR_00);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform2f error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform2fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform2fv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform2fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform2iAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform2i(GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform2i error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform2ivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform2iv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform2iv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform2uiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform2ui(GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform2ui error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform2uivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform2uiv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform2uiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform3fAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform3f(GL_ZERO, CLEAR_00, CLEAR_00, CLEAR_00);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform3f error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform3fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform3fv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform3fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform3iAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform3i(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform3i error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform3ivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform3iv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform3iv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform3uiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform3ui(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform3ui error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform3uivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform3uiv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform3uiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform4fAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform4f(GL_ZERO, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform4f error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform4fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform4fv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform4fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform4iAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform4i(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform4i error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform4ivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform4iv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform4iv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform4uiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform4ui(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform4ui error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniform4uivAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniform4uiv(GL_ZERO, FAILED, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniform4uiv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformBlockBindingAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformBlockBinding(GL_ZERO, GL_MAX_TEST_NUM, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformBlockBinding error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformMatrix2fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformMatrix2fv(GL_ZERO, FAILED, GL_TRUE, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformMatrix2fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformMatrix2x3fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformMatrix2x3fv(GL_ZERO, FAILED, GL_TRUE, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformMatrix2x3fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformMatrix2x4fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformMatrix2x4fv(GL_ZERO, FAILED, GL_TRUE, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformMatrix2x4fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformMatrix3fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformMatrix3fv(GL_ZERO, FAILED, GL_TRUE, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformMatrix3fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformMatrix3x2fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformMatrix3x2fv(GL_ZERO, FAILED, GL_TRUE, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformMatrix3x2fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformMatrix3x4fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformMatrix3x4fv(GL_ZERO, FAILED, GL_TRUE, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformMatrix3x4fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformMatrix4fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformMatrix4fv(GL_ZERO, FAILED, GL_TRUE, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformMatrix4fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformMatrix4x2fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformMatrix4x2fv(GL_ZERO, GL_ZERO, GL_TRUE, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformMatrix4x2fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLUniformMatrix4x3fvAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glUniformMatrix4x3fv(GL_ZERO, FAILED, GL_TRUE, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glUniformMatrix4x3fv error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCompileShaderAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCompileShader(GL_MAX_TEST_NUM);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCompileShader error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCompressedTexImage2DAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCompressedTexImage2D(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ONE, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCompressedTexImage2D error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCompressedTexImage3DAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCompressedTexImage3D(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ONE, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCompressedTexImage3D error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCompressedTexSubImage2DAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCompressedTexSubImage2D(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCompressedTexSubImage2D error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCompressedTexSubImage3DAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCompressedTexSubImage3D(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO,
                              nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCompressedTexSubImage3D error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLCopyTexSubImage3DAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glCopyTexSubImage3D(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glCopyTexSubImage3D error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawElementsAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawElements(GL_ZERO, FAILED, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawElements error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawElementsBaseVertexAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawElementsBaseVertex(GL_ZERO, GL_ZERO, GL_ZERO, nullptr, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawElementsBaseVertex error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawElementsIndirectAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawElementsIndirect(GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawElementsIndirect error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawElementsInstancedAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawElementsInstanced(GL_ZERO, FAILED, GL_ZERO, nullptr, FAILED);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawElementsInstanced error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawElementsInstancedBaseVertexAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawElementsInstancedBaseVertex(FAILED, GL_ONE, GL_UNSIGNED_BYTE, nullptr, GL_ONE, GL_ONE);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawElementsInstancedBaseVertex error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawRangeElementsAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawRangeElements(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, nullptr);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawRangeElements error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLDrawRangeElementsBaseVertexAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glDrawRangeElementsBaseVertex(GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, GL_ZERO, nullptr, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glDrawRangeElementsBaseVertex error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLEnableAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glEnable(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glEnable error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLEnableiAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glEnablei(GL_ZERO, GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glEnablei error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLEnableVertexAttribArrayAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glEnableVertexAttribArray(GL_MAX_VERTEX_ATTRIBS);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glEnableVertexAttribArray error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLEndQueryAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glEndQuery(GL_ZERO);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glEndQuery error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLEndTransformFeedbackAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glEndTransformFeedback();
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glEndTransformFeedback error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

static napi_value GLFenceSyncAbnormal(napi_env env, napi_callback_info info)
{
    (void)info;
    EGLWindow eglWindow = {EGL_NO_DISPLAY, EGL_NO_SURFACE, EGL_NO_CONTEXT};
    initGLES(&eglWindow);
    glFenceSync(GL_ZERO, GL_ONE);
    NAPI_ASSERT(env, glGetError() != GL_NO_ERROR, "glFenceSync error");
    destroyGLES(&eglWindow);
    napi_value result = nullptr;
    napi_create_int32(env, FAILED, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"gLSamplerParameterfv", nullptr, GLSamplerParameterfv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLSamplerParameteri", nullptr, GLSamplerParameteri, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLSamplerParameterIiv", nullptr, GLSamplerParameterIiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLSamplerParameterIuiv", nullptr, GLSamplerParameterIuiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLSamplerParameteriv", nullptr, GLSamplerParameteriv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLScissor", nullptr, GLScissor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLShaderBinary", nullptr, GLShaderBinary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLShaderSource", nullptr, GLShaderSource, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLStencilFunc", nullptr, GLStencilFunc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLStencilFuncSeparate", nullptr, GLStencilFuncSeparate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLStencilMask", nullptr, GLStencilMask, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLStencilMaskSeparate", nullptr, GLStencilMaskSeparate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLStencilOp", nullptr, GLStencilOp, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLStencilOpSeparate", nullptr, GLStencilOpSeparate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexBuffer", nullptr, GLTexBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexBufferRange", nullptr, GLTexBufferRange, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexImage2D", nullptr, GLTexImage2D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexImage3D", nullptr, GLTexImage3D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexParameterf", nullptr, GLTexParameterf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexParameterfv", nullptr, GLTexParameterfv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexParameteri", nullptr, GLTexParameteri, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexParameterIiv", nullptr, GLTexParameterIiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexParameterIuiv", nullptr, GLTexParameterIuiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexParameteriv", nullptr, GLTexParameteriv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexStorage2D", nullptr, GLTexStorage2D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexStorage2DMultisample", nullptr, GLTexStorage2DMultisample, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLTexStorage3D", nullptr, GLTexStorage3D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexStorage3DMultisample", nullptr, GLTexStorage3DMultisample, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLTexSubImage2D", nullptr, GLTexSubImage2D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTexSubImage3D", nullptr, GLTexSubImage3D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLTransformFeedbackVaryings", nullptr, GLTransformFeedbackVaryings, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLUniform1f", nullptr, GLUniform1f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform1fv", nullptr, GLUniform1fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform1i", nullptr, GLUniform1i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform1iv", nullptr, GLUniform1iv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform1ui", nullptr, GLUniform1ui, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform1uiv", nullptr, GLUniform1uiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform2f", nullptr, GLUniform2f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform2fv", nullptr, GLUniform2fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform2i", nullptr, GLUniform2i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform2iv", nullptr, GLUniform2iv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform2ui", nullptr, GLUniform2ui, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform2uiv", nullptr, GLUniform2uiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform3f", nullptr, GLUniform3f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform3fv", nullptr, GLUniform3fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform3i", nullptr, GLUniform3i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform3iv", nullptr, GLUniform3iv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform3ui", nullptr, GLUniform3ui, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform3uiv", nullptr, GLUniform3uiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform4f", nullptr, GLUniform4f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform4fv", nullptr, GLUniform4fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform4i", nullptr, GLUniform4i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform4iv", nullptr, GLUniform4iv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform4ui", nullptr, GLUniform4ui, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniform4uiv", nullptr, GLUniform4uiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformBlockBinding", nullptr, GLUniformBlockBinding, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrix2fv", nullptr, GLUniformMatrix2fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrix2x3fv", nullptr, GLUniformMatrix2x3fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrix2x4fv", nullptr, GLUniformMatrix2x4fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrix3fv", nullptr, GLUniformMatrix3fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrix3x2fv", nullptr, GLUniformMatrix3x2fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrix3x4fv", nullptr, GLUniformMatrix3x4fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrix4fv", nullptr, GLUniformMatrix4fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrix4x2fv", nullptr, GLUniformMatrix4x2fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUniformMatrix4x3fv", nullptr, GLUniformMatrix4x3fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUnmapBuffer", nullptr, GLUnmapBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUseProgram", nullptr, GLUseProgram, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLUseProgramStages", nullptr, GLUseProgramStages, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLValidateProgram", nullptr, GLValidateProgram, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLValidateProgramPipeline", nullptr, GLValidateProgramPipeline, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLVertexAttrib1f", nullptr, GLVertexAttrib1f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttrib1fv", nullptr, GLVertexAttrib1fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttrib2f", nullptr, GLVertexAttrib2f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttrib2fv", nullptr, GLVertexAttrib2fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttrib3f", nullptr, GLVertexAttrib3f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttrib3fv", nullptr, GLVertexAttrib3fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttrib4f", nullptr, GLVertexAttrib4f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttrib4fv", nullptr, GLVertexAttrib4fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribBinding", nullptr, GLVertexAttribBinding, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribDivisor", nullptr, GLVertexAttribDivisor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribFormat", nullptr, GLVertexAttribFormat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribI4i", nullptr, GLVertexAttribI4i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribI4iv", nullptr, GLVertexAttribI4iv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribI4ui", nullptr, GLVertexAttribI4ui, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribI4uiv", nullptr, GLVertexAttribI4uiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribIFormat", nullptr, GLVertexAttribIFormat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribIPointer", nullptr, GLVertexAttribIPointer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexAttribPointer", nullptr, GLVertexAttribPointer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLVertexBindingDivisor", nullptr, GLVertexBindingDivisor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLViewport", nullptr, GLViewport, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLWaitSync", nullptr, GLWaitSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glActiveShaderProgramAbnormal", nullptr, GLActiveShaderProgramAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glActiveTextureAbnormal", nullptr, GLActiveTextureAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glAttachShaderAbnormal", nullptr, GLAttachShaderAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glBeginQueryAbnormal", nullptr, GLBeginQueryAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glBeginTransformFeedbackAbnormal", nullptr, GLBeginTransformFeedbackAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glBindAttribLocationAbnormal", nullptr, GLBindAttribLocationAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBindBufferAbnormal", nullptr, GLBindBufferAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glBindBufferBaseAbnormal", nullptr, GLBindBufferBaseAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBindBufferRangeAbnormal", nullptr, GLBindBufferRangeAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBindFramebufferAbnormal", nullptr, GLBindFramebufferAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBindImageTextureAbnormal", nullptr, GLBindImageTextureAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBindProgramPipelineAbnormal", nullptr, GLBindProgramPipelineAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glBindRenderbufferAbnormal", nullptr, GLBindRenderbufferAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBindSamplerAbnormal", nullptr, GLBindSamplerAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glBindTextureAbnormal", nullptr, GLBindTextureAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glBindTransformFeedbackAbnormal", nullptr, GLBindTransformFeedbackAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glBindVertexArrayAbnormal", nullptr, GLBindVertexArrayAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBindVertexBufferAbnormal", nullptr, GLBindVertexBufferAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBlendEquationAbnormal", nullptr, GLBlendEquationAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glBlendEquationiAbnormal", nullptr, GLBlendEquationiAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBlendEquationSeparateAbnormal", nullptr, GLBlendEquationSeparateAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glBlendEquationSeparateiAbnormal", nullptr, GLBlendEquationSeparateiAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glBlendFuncAbnormal", nullptr, GLBlendFuncAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glBlendFunciAbnormal", nullptr, GLBlendFunciAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glBlendFuncSeparateAbnormal", nullptr, GLBlendFuncSeparateAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBlendFuncSeparateiAbnormal", nullptr, GLBlendFuncSeparateiAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBlitFramebufferAbnormal", nullptr, GLBlitFramebufferAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glBufferDataAbnormal", nullptr, GLBufferDataAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glBufferSubDataAbnormal", nullptr, GLBufferSubDataAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glCheckFramebufferStatusAbnormal", nullptr, GLCheckFramebufferStatusAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glClearAbnormal", nullptr, GLClearAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glClearBufferfiAbnormal", nullptr, GLClearBufferfiAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glClearBufferfvAbnormal", nullptr, GLClearBufferfvAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glClearBufferivAbnormal", nullptr, GLClearBufferivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glClearBufferuivAbnormal", nullptr, GLClearBufferuivAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glClientWaitSyncAbnormal", nullptr, GLClientWaitSyncAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glColorMaskiAbnormal", nullptr, GLColorMaskiAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glCopyBufferSubDataAbnormal", nullptr, GLCopyBufferSubDataAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glCopyImageSubDataAbnormal", nullptr, GLCopyImageSubDataAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glCopyTexImage2DAbnormal", nullptr, GLCopyTexImage2DAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glCopyTexSubImage2DAbnormal", nullptr, GLCopyTexSubImage2DAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glCreateShaderAbnormal", nullptr, GLCreateShaderAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glCreateShaderProgramvAbnormal", nullptr, GLCreateShaderProgramvAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glCullFaceAbnormal", nullptr, GLCullFaceAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDebugMessageControlAbnormal", nullptr, GLDebugMessageControlAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDeleteBuffersAbnormal", nullptr, GLDeleteBuffersAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDeleteFramebuffersAbnormal", nullptr, GLDeleteFramebuffersAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glDeleteProgramAbnormal", nullptr, GLDeleteProgramAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDeleteProgramPipelinesAbnormal", nullptr, GLDeleteProgramPipelinesAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDeleteQueriesAbnormal", nullptr, GLDeleteQueriesAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDeleteRenderbuffersAbnormal", nullptr, GLDeleteRenderbuffersAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDeleteSamplersAbnormal", nullptr, GLDeleteSamplersAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glDeleteShaderAbnormal", nullptr, GLDeleteShaderAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDeleteSyncAbnormal", nullptr, GLDeleteSyncAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDeleteTexturesAbnormal", nullptr, GLDeleteTexturesAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glDeleteTransformFeedbacksAbnormal", nullptr, GLDeleteTransformFeedbacksAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDeleteVertexArraysAbnormal", nullptr, GLDeleteVertexArraysAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glDepthFuncAbnormal", nullptr, GLDepthFuncAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDetachShaderAbnormal", nullptr, GLDetachShaderAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDisableAbnormal", nullptr, GLDisableAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDisableiAbnormal", nullptr, GLDisableiAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDisableVertexAttribArrayAbnormal", nullptr, GLDisableVertexAttribArrayAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDispatchComputeAbnormal", nullptr, GLDispatchComputeAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glDispatchComputeIndirectAbnormal", nullptr, GLDispatchComputeIndirectAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDrawArraysAbnormal", nullptr, GLDrawArraysAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDrawArraysIndirectAbnormal", nullptr, GLDrawArraysIndirectAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glDrawArraysInstancedAbnormal", nullptr, GLDrawArraysInstancedAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDrawBuffersAbnormal", nullptr, GLDrawBuffersAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glFlushMappedBufferRangeAbnormal", nullptr, GLFlushMappedBufferRangeAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glFramebufferParameteriAbnormal", nullptr, GLFramebufferParameteriAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glFramebufferRenderbufferAbnormal", nullptr, GLFramebufferRenderbufferAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glFramebufferTextureAbnormal", nullptr, GLFramebufferTextureAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glFramebufferTexture2DAbnormal", nullptr, GLFramebufferTexture2DAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glFramebufferTextureLayerAbnormal", nullptr, GLFramebufferTextureLayerAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glFrontFaceAbnormal", nullptr, GLFrontFaceAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGenBuffersAbnormal", nullptr, GLGenBuffersAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGenerateMipmapAbnormal", nullptr, GLGenerateMipmapAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGenFramebuffersAbnormal", nullptr, GLGenFramebuffersAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGenProgramPipelinesAbnormal", nullptr, GLGenProgramPipelinesAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGenQueriesAbnormal", nullptr, GLGenQueriesAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGenRenderbuffersAbnormal", nullptr, GLGenRenderbuffersAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGenSamplersAbnormal", nullptr, GLGenSamplersAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGenTexturesAbnormal", nullptr, GLGenTexturesAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGenTransformFeedbacksAbnormal", nullptr, GLGenTransformFeedbacksAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGenVertexArraysAbnormal", nullptr, GLGenVertexArraysAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetActiveAttribAbnormal", nullptr, GLGetActiveAttribAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetAttachedShadersAbnormal", nullptr, GLGetAttachedShadersAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetAttribLocationAbnormal", nullptr, GLGetAttribLocationAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetBooleani_vAbnormal", nullptr, GLGetBooleani_vAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetBooleanvAbnormal", nullptr, GLGetBooleanvAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetBufferParameteri64vAbnormal", nullptr, GLGetBufferParameteri64vAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetBufferParameterivAbnormal", nullptr, GLGetBufferParameterivAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetBufferPointervAbnormal", nullptr, GLGetBufferPointervAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetFloatvAbnormal", nullptr, GLGetFloatvAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetFragDataLocationAbnormal", nullptr, GLGetFragDataLocationAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetFramebufferAttachmentParameterivAbnormal", nullptr, GLGetFramebufferAttachmentParameterivAbnormal,
         nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetFramebufferParameterivAbnormal", nullptr, GLGetFramebufferParameterivAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetInteger64i_vAbnormal", nullptr, GLGetInteger64i_vAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetInteger64vAbnormal", nullptr, GLGetInteger64vAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetIntegeri_vAbnormal", nullptr, GLGetIntegeri_vAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetIntegervAbnormal", nullptr, GLGetIntegervAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetInternalformativAbnormal", nullptr, GLGetInternalformativAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetObjectLabelAbnormal", nullptr, GLGetObjectLabelAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetObjectPtrLabelAbnormal", nullptr, GLGetObjectPtrLabelAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetPointervAbnormal", nullptr, GLGetPointervAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetProgramBinaryAbnormal", nullptr, GLGetProgramBinaryAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetProgramInterfaceivAbnormal", nullptr, GLGetProgramInterfaceivAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetProgramivAbnormal", nullptr, GLGetProgramivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetProgramPipelineivAbnormal", nullptr, GLGetProgramPipelineivAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetProgramResourceIndexAbnormal", nullptr, GLGetProgramResourceIndexAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetProgramResourceivAbnormal", nullptr, GLGetProgramResourceivAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetProgramResourceLocationAbnormal", nullptr, GLGetProgramResourceLocationAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"glGetProgramResourceNameAbnormal", nullptr, GLGetProgramResourceNameAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetQueryivAbnormal", nullptr, GLGetQueryivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glGetQueryObjectuivAbnormal", nullptr, GLGetQueryObjectuivAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glGetRenderbufferParameterivAbnormal", nullptr, GLGetRenderbufferParameterivAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"glGetSamplerParameterfvAbnormal", nullptr, GLGetSamplerParameterfvAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetSamplerParameterIivAbnormal", nullptr, GLGetSamplerParameterIivAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetSamplerParameterIuivAbnormal", nullptr, GLGetSamplerParameterIuivAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glGetSamplerParameterivAbnormal", nullptr, GLGetSamplerParameterivAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glUniform1fAbnormal", nullptr, GLUniform1fAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform1fvAbnormal", nullptr, GLUniform1fvAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform1iAbnormal", nullptr, GLUniform1iAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform1ivAbnormal", nullptr, GLUniform1ivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform1uiAbnormal", nullptr, GLUniform1uiAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform1uivAbnormal", nullptr, GLUniform1uivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform2fAbnormal", nullptr, GLUniform2fAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform2fvAbnormal", nullptr, GLUniform2fvAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform2iAbnormal", nullptr, GLUniform2iAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform2ivAbnormal", nullptr, GLUniform2ivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform2uiAbnormal", nullptr, GLUniform2uiAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform2uivAbnormal", nullptr, GLUniform2uivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform3fAbnormal", nullptr, GLUniform3fAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform3fvAbnormal", nullptr, GLUniform3fvAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform3iAbnormal", nullptr, GLUniform3iAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform3ivAbnormal", nullptr, GLUniform3ivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform3uiAbnormal", nullptr, GLUniform3uiAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform3uivAbnormal", nullptr, GLUniform3uivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform4fAbnormal", nullptr, GLUniform4fAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform4fvAbnormal", nullptr, GLUniform4fvAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform4iAbnormal", nullptr, GLUniform4iAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform4ivAbnormal", nullptr, GLUniform4ivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform4uiAbnormal", nullptr, GLUniform4uiAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniform4uivAbnormal", nullptr, GLUniform4uivAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glUniformBlockBindingAbnormal", nullptr, GLUniformBlockBindingAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glUniformMatrix2fvAbnormal", nullptr, GLUniformMatrix2fvAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glUniformMatrix2x3fvAbnormal", nullptr, GLUniformMatrix2x3fvAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glUniformMatrix2x4fvAbnormal", nullptr, GLUniformMatrix2x4fvAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glUniformMatrix3fvAbnormal", nullptr, GLUniformMatrix3fvAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glUniformMatrix3x2fvAbnormal", nullptr, GLUniformMatrix3x2fvAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glUniformMatrix3x4fvAbnormal", nullptr, GLUniformMatrix3x4fvAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glUniformMatrix4fvAbnormal", nullptr, GLUniformMatrix4fvAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glUniformMatrix4x2fvAbnormal", nullptr, GLUniformMatrix4x2fvAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glUniformMatrix4x3fvAbnormal", nullptr, GLUniformMatrix4x3fvAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glCompileShaderAbnormal", nullptr, GLCompileShaderAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glCompressedTexImage2DAbnormal", nullptr, GLCompressedTexImage2DAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glCompressedTexImage3DAbnormal", nullptr, GLCompressedTexImage3DAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glCompressedTexSubImage2DAbnormal", nullptr, GLCompressedTexSubImage2DAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glCompressedTexSubImage3DAbnormal", nullptr, GLCompressedTexSubImage3DAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glCopyTexSubImage3DAbnormal", nullptr, GLCopyTexSubImage3DAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glDrawElementsAbnormal", nullptr, GLDrawElementsAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glDrawElementsBaseVertexAbnormal", nullptr, GLDrawElementsBaseVertexAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDrawElementsIndirectAbnormal", nullptr, GLDrawElementsIndirectAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDrawElementsInstancedAbnormal", nullptr, GLDrawElementsInstancedAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glDrawElementsInstancedBaseVertexAbnormal", nullptr, GLDrawElementsInstancedBaseVertexAbnormal, nullptr,
         nullptr, nullptr, napi_default, nullptr},
        {"glDrawRangeElementsAbnormal", nullptr, GLDrawRangeElementsAbnormal, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"glDrawRangeElementsBaseVertexAbnormal", nullptr, GLDrawRangeElementsBaseVertexAbnormal, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"glEnableAbnormal", nullptr, GLEnableAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glEnableiAbnormal", nullptr, GLEnableiAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glEnableVertexAttribArrayAbnormal", nullptr, GLEnableVertexAttribArrayAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glEndQueryAbnormal", nullptr, GLEndQueryAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"glEndTransformFeedbackAbnormal", nullptr, GLEndTransformFeedbackAbnormal, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"glFenceSyncAbnormal", nullptr, GLFenceSyncAbnormal, nullptr, nullptr, nullptr, napi_default, nullptr},

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
    .nm_modname = "media",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
