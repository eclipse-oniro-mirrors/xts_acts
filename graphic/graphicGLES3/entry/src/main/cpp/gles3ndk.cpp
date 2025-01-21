/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
#include <EGL/egl.h>
#include <EGL/eglext.h>
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

static napi_value GLActiveShaderProgram(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObjectRed = glCreateProgram();
    glAttachShader(programObjectRed, shaderVertex);
    glAttachShader(programObjectRed, shaderFragment);
    glLinkProgram(programObjectRed);
    GLuint programObjectGreen = glCreateProgram();
    glAttachShader(programObjectGreen, shaderVertex);
    glAttachShader(programObjectGreen, shaderFragment);
    glLinkProgram(programObjectGreen);
    glUseProgram(programObjectRed);
    GLuint pipeline = INT_INIT_VAL;
    glGenProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    glActiveShaderProgram(pipeline, programObjectGreen);
    glError = glGetError();
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(programObjectRed);
    glDeleteProgram(programObjectGreen);
    glDeleteProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    destroyGLES();
    napi_value result = nullptr;
    if (GL_NO_ERROR == glError) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    return result;
}

static napi_value GLActiveTexture(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint textureId = INT_INIT_VAL;
    glGenTextures(TEXTURES_NUM_ONE, &textureId);
    glBindTexture(GL_TEXTURE_2D, textureId);
    glActiveTexture(GL_TEXTURE0);
    glError = glGetError();
    glDeleteTextures(TEXTURES_NUM_ONE, &textureId);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLAttachShader(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint programObjectRed = glCreateProgram();
    glAttachShader(programObjectRed, shaderVertex);
    glError = glGetError();
    glLinkProgram(programObjectRed);
    glDeleteShader(shaderVertex);
    glDeleteProgram(programObjectRed);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBeginQuery(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint queryID = INT_INIT_VAL;
    glGenQueries(1, &queryID);
    glBeginQuery(GL_ANY_SAMPLES_PASSED, queryID);
    glError = glGetError();
    glEndQuery(GL_ANY_SAMPLES_PASSED);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBeginTransformFeedback(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint tfBuffer;
    glGenBuffers(CREAT_NUM_ONE, &tfBuffer);
    GLuint vao;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glBindVertexArray(vao);
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObject = glCreateProgram();
    glAttachShader(programObject, shaderVertex);
    glAttachShader(programObject, shaderFragment);
    glLinkProgram(programObject);
    glUseProgram(programObject);
    glBindBufferBase(GL_TRANSFORM_FEEDBACK_BUFFER, INT_INIT_VAL, tfBuffer);
    glTransformFeedbackVaryings(programObject, VARYING_NUM, (const char *[]){"gl_Position", "vColor"},
                                GL_SEPARATE_ATTRIBS);
    glEnable(GL_RASTERIZER_DISCARD);
    glBeginTransformFeedback(GL_POINTS);
    glError = glGetError();
    glEndTransformFeedback();
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindAttribLocation(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint programID = INT_INIT_VAL;
    GLuint vertexShader = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint fragmentShader = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    programID = glCreateProgram();
    glAttachShader(programID, vertexShader);
    glAttachShader(programID, fragmentShader);
    glBindAttribLocation(programID, ATTRIB_INDEX, "position");
    glError = glGetError();
    glDeleteShader(vertexShader);
    glDeleteShader(fragmentShader);
    glDeleteProgram(programID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindBuffer(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint bufferID = INT_INIT_VAL;
    glGenBuffers(GEN_BUF_NUM, &bufferID);
    glBindBuffer(GL_ARRAY_BUFFER, bufferID);
    glError = glGetError();
    glDeleteBuffers(GEN_BUF_NUM, &bufferID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindBufferBase(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint bufferID = INT_INIT_VAL;
    glGenBuffers(GEN_BUF_NUM, &bufferID);
    glBindBufferBase(GL_SHADER_STORAGE_BUFFER, INT_INIT_VAL, bufferID);
    glError = glGetError();
    glDeleteBuffers(GEN_BUF_NUM, &bufferID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindBufferRange(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint bufferID = INT_INIT_VAL;
    glGenBuffers(GEN_BUF_NUM, &bufferID);
    GLint data[] = {2, 4, 6, 8};
    glBindBufferRange(GL_SHADER_STORAGE_BUFFER, INT_INIT_VAL, bufferID, INT_INIT_VAL, sizeof(data));
    glBufferData(GL_SHADER_STORAGE_BUFFER, sizeof(data), data, GL_STATIC_DRAW);
    glError = glGetError();
    glDeleteBuffers(GEN_BUF_NUM, &bufferID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindFramebuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint fbo = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    napi_value result = nullptr;
    if (CREAT_ERROR != glCheckFramebufferStatus(GL_FRAMEBUFFER)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteFramebuffers(CREAT_NUM_ONE, &fbo);
    destroyGLES();
    return result;
}

static napi_value GLBindImageTexture(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint textureId = INT_INIT_VAL;
    glGenTextures(TEXTURES_NUM_ONE, &textureId);
    glBindTexture(GL_TEXTURE_2D, textureId);
    glTexStorage2D(GL_TEXTURE_2D, RGB_SIZE, GL_RGBA8, INIT_WIDTH, INIT_HEIGHT);
    GLuint imageBindingIndex = INT_INIT_VAL;
    glBindImageTexture(imageBindingIndex, textureId, INT_INIT_VAL, GL_FALSE, INT_INIT_VAL, GL_READ_WRITE, GL_RGBA8);
    glError = glGetError();
    glDeleteTextures(TEXTURES_NUM_ONE, &textureId);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindProgramPipeline(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObject = glCreateProgram();
    glAttachShader(programObject, shaderVertex);
    glAttachShader(programObject, shaderFragment);
    glLinkProgram(programObject);
    glUseProgram(programObject);
    GLuint pipeline = INT_INIT_VAL;
    glGenProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    glBindProgramPipeline(pipeline);
    glError = glGetError();
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(programObject);
    glDeleteProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindRenderbuffer(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint rbo;
    glGenRenderbuffers(CREAT_NUM_ONE, &rbo);
    glBindRenderbuffer(GL_RENDERBUFFER, rbo);
    glError = glGetError();
    glDeleteRenderbuffers(CREAT_NUM_ONE, &rbo);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindSampler(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint textureId = INT_INIT_VAL;
    glGenTextures(TEXTURES_NUM_ONE, &textureId);
    glBindTexture(GL_TEXTURE_2D, textureId);
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    glBindSampler(textureId, sampler);
    glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    glDeleteTextures(TEXTURES_NUM_ONE, &textureId);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindTexture(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint textureId = INT_INIT_VAL;
    glGenTextures(TEXTURES_NUM_ONE, &textureId);
    glBindTexture(GL_TEXTURE_2D, textureId);
    glError = glGetError();
    glDeleteTextures(TEXTURES_NUM_ONE, &textureId);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindTransformFeedback(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint transformFeedback;
    glGenTransformFeedbacks(CREAT_NUM_ONE, &transformFeedback);
    glBindTransformFeedback(GL_TRANSFORM_FEEDBACK, transformFeedback);
    glError = glGetError();
    glDeleteTransformFeedbacks(CREAT_NUM_ONE, &transformFeedback);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindVertexArray(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint vao;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glBindVertexArray(vao);
    glError = glGetError();
    glDeleteVertexArrays(CREAT_NUM_ONE, &vao);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBindVertexBuffer(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLfloat vertices[] = {CLEAR_00, 0.5f, CLEAR_00, -0.5f, -0.5f, CLEAR_00, 0.5f, -0.5f, CLEAR_00};
    GLuint VAO;
    GLuint VBO;
    glGenVertexArrays(CREAT_NUM_ONE, &VAO);
    glBindVertexArray(VAO);
    glGenBuffers(CREAT_NUM_ONE, &VBO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glVertexAttribPointer(INT_INIT_VAL, ATTRIB_SIZE, GL_FLOAT, GL_FALSE, INT_INIT_VAL, INT_INIT_VAL);
    glEnableVertexAttribArray(INT_INIT_VAL);
    glBindVertexBuffer(INT_INIT_VAL, VBO, INT_INIT_VAL, sizeof(vertices));
    glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &VBO);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendBarrier(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glBlendBarrier();
    glError = glGetError();
    glDisable(GL_BLEND);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendColor(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glBlendColor(CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10);
    glError = glGetError();
    glDisable(GL_BLEND);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendEquation(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_BLEND);
    glBlendEquation(GL_FUNC_ADD);
    glError = glGetError();
    glDisable(GL_BLEND);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendEquationi(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_BLEND);
    glBlendEquationi(CREAT_NUM_ONE, GL_FUNC_ADD);
    glError = glGetError();
    glDisable(GL_BLEND);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendEquationSeparate(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_BLEND);
    glBlendEquationSeparate(GL_FUNC_REVERSE_SUBTRACT, GL_MAX);
    glError = glGetError();
    glDisable(GL_BLEND);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendEquationSeparatei(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_BLEND);
    glBlendEquationSeparatei(INT_INIT_VAL, GL_FUNC_REVERSE_SUBTRACT, GL_MAX);
    glError = glGetError();
    glDisable(GL_BLEND);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendFunc(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glError = glGetError();
    glDisable(GL_BLEND);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendFunci(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glEnable(GL_BLEND);
    glBlendFunci(INT_INIT_VAL, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glError = glGetError();
    glDisable(GL_BLEND);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendFuncSeparate(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ZERO);
    glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlendFuncSeparatei(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glBlendFuncSeparatei(INT_INIT_VAL, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ZERO);
    glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBlitFramebuffer(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint framebuffer;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_READ_FRAMEBUFFER, framebuffer);
    GLuint texture;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, INT_INIT_VAL, GL_RGBA, INIT_WIDTH, INIT_HEIGHT, INT_INIT_VAL, GL_RGBA, GL_UNSIGNED_BYTE,
                 nullptr);
    glFramebufferTexture2D(GL_READ_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, INT_INIT_VAL);
    glBindFramebuffer(GL_DRAW_FRAMEBUFFER, INT_INIT_VAL);
    glBlitFramebuffer(INT_INIT_VAL, INT_INIT_VAL, INIT_WIDTH, INIT_HEIGHT, INT_INIT_VAL, INT_INIT_VAL, INIT_WIDTH,
                      INIT_HEIGHT, GL_COLOR_BUFFER_BIT, GL_LINEAR);
    glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    glDeleteFramebuffers(CREAT_NUM_ONE, &framebuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBufferData(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint bufferID;
    GLfloat vertices[] = {CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00};
    glGenBuffers(CREAT_NUM_ONE, &bufferID);
    glBindBuffer(GL_ARRAY_BUFFER, bufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glError = glGetError();
    glDeleteBuffers(GEN_BUF_NUM, &bufferID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLBufferSubData(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint bufferID;
    GLfloat vertices[] = {CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00};
    glGenBuffers(CREAT_NUM_ONE, &bufferID);
    glBindBuffer(GL_ARRAY_BUFFER, bufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    GLfloat newData[] = {CLEAR_00, CLEAR_00};
    glBufferSubData(GL_ARRAY_BUFFER, sizeof(GLfloat) * ATTRIB_SIZE, sizeof(newData), newData);
    glError = glGetError();
    glDeleteBuffers(GEN_BUF_NUM, &bufferID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCheckFramebufferStatus(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint fbo = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    napi_value result = nullptr;
    if (CREAT_ERROR != glCheckFramebufferStatus(GL_FRAMEBUFFER)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteFramebuffers(CREAT_NUM_ONE, &fbo);
    destroyGLES();
    return result;
}

static napi_value GLClear(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glClear(GL_COLOR_BUFFER_BIT);
    glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLClearBufferfi(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint bufferID = INT_INIT_VAL;
    glGenBuffers(GEN_BUF_NUM, &bufferID);
    glBindBuffer(GL_ARRAY_BUFFER, bufferID);
    glClearBufferfi(GL_DEPTH_STENCIL, INT_INIT_VAL, CLEAR_00, INT_INIT_VAL);
    glError = glGetError();
    glDeleteBuffers(GEN_BUF_NUM, &bufferID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLClearBufferfv(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLfloat clearColor[] = {CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00};
    GLuint bufferID = INT_INIT_VAL;
    glGenBuffers(GEN_BUF_NUM, &bufferID);
    glBindBuffer(GL_ARRAY_BUFFER, bufferID);
    glClearBufferfv(GL_COLOR, INT_INIT_VAL, clearColor);
    glError = glGetError();
    glDeleteBuffers(GEN_BUF_NUM, &bufferID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLClearBufferiv(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint bufferID = INT_INIT_VAL;
    glGenBuffers(GEN_BUF_NUM, &bufferID);
    glBindBuffer(GL_ARRAY_BUFFER, bufferID);
    GLint clearStencil = INT_INIT_VAL;
    glClearBufferiv(GL_STENCIL, INT_INIT_VAL, &clearStencil);
    glError = glGetError();
    glDeleteBuffers(GEN_BUF_NUM, &bufferID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLClearBufferuiv(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint bufferID = INT_INIT_VAL;
    glGenBuffers(GEN_BUF_NUM, &bufferID);
    glBindBuffer(GL_ARRAY_BUFFER, bufferID);
    GLuint clearColor[] = {INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL};
    glClearBufferuiv(GL_COLOR, INT_INIT_VAL, clearColor);
    glError = glGetError();
    glDeleteBuffers(GEN_BUF_NUM, &bufferID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLClearColor(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glClearColor(CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00);
    glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLClearDepthf(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glClearDepthf(CLEAR_00);
    glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLClearStencil(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glClearStencil(INT_INIT_VAL);
    glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLClientWaitSync(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    initGLES();
    GLsync sync = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, INT_INIT_VAL);
    if (GL_WAIT_FAILED != glClientWaitSync(sync, INT_INIT_VAL, INT_INIT_VAL)) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteSync(sync);
    destroyGLES();
    return result;
}

static napi_value GLColorMask(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glColorMask(GL_TRUE, GL_FALSE, GL_FALSE, GL_TRUE);
    glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLColorMaski(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glColorMaski(INT_INIT_VAL, GL_TRUE, GL_FALSE, GL_FALSE, GL_TRUE);
    glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCompileShader(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    glColorMaski(INT_INIT_VAL, GL_TRUE, GL_FALSE, GL_FALSE, GL_FALSE);
    glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCompressedTexImage2D(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint tex = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &tex);
    glBindTexture(GL_TEXTURE_2D, tex);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    GLubyte textureData[TEX_BUF_SIZE] = {INT_INIT_VAL};
    glCompressedTexImage2D(
        GL_TEXTURE_2D, INT_INIT_VAL, GL_COMPRESSED_R11_EAC, SUB_DATA_SIZE, SUB_DATA_SIZE, INT_INIT_VAL,
        ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * RGB_SIZE, textureData);
    glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &tex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCompressedTexImage3D(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint tex = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &tex);
    glBindTexture(GL_TEXTURE_2D_ARRAY, tex);
    glTexParameteri(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    GLubyte textureData[TEX_BUF_SIZE] = {INT_INIT_VAL};
    glCompressedTexImage3D(GL_TEXTURE_2D_ARRAY, INT_INIT_VAL, GL_COMPRESSED_R11_EAC, SUB_DATA_SIZE, SUB_DATA_SIZE,
                           CREAT_NUM_ONE, INT_INIT_VAL,
                           ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * RGB_SIZE,
                           textureData);
    glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &tex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCompressedTexSubImage2D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    GLubyte textureData[TEX_BUF_SIZE] = {INT_INIT_VAL};
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glCompressedTexImage2D(
        GL_TEXTURE_2D, INT_INIT_VAL, GL_COMPRESSED_R11_EAC, SUB_DATA_SIZE, SUB_DATA_SIZE, INT_INIT_VAL,
        ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * RGB_SIZE, textureData);
    glCompressedTexSubImage2D(
        GL_TEXTURE_2D, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, RGB_SIZE, RGB_SIZE, GL_COMPRESSED_R11_EAC,
        ceil(RGB_SIZE / POINT_LIGHT_COUNT) * ceil(RGB_SIZE / POINT_LIGHT_COUNT) * RGB_SIZE, textureData);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCompressedTexSubImage3D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    GLubyte textureData[TEX_BUF_SIZE] = {INT_INIT_VAL};
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D_ARRAY, texture);
    glTexParameteri(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameteri(GL_TEXTURE_2D_ARRAY, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
    glCompressedTexImage3D(GL_TEXTURE_2D_ARRAY, INT_INIT_VAL, GL_COMPRESSED_R11_EAC, SUB_DATA_SIZE, SUB_DATA_SIZE,
                           CREAT_NUM_ONE, INT_INIT_VAL,
                           ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * RGB_SIZE,
                           textureData);
    glCompressedTexSubImage3D(
        GL_TEXTURE_2D_ARRAY, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, SUB_DATA_SIZE, SUB_DATA_SIZE,
        CREAT_NUM_ONE, GL_COMPRESSED_R11_EAC,
        ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * ceil(SUB_DATA_SIZE / POINT_LIGHT_COUNT) * RGB_SIZE, textureData);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCopyBufferSubData(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer1 = INT_INIT_VAL, buffer2 = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer1);
    glGenBuffers(CREAT_NUM_ONE, &buffer2);
    glBindBuffer(GL_COPY_READ_BUFFER, buffer1);
    glBindBuffer(GL_COPY_WRITE_BUFFER, buffer2);
    GLfloat vertices[] = {CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00};
    glBufferData(GL_COPY_READ_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glBufferData(GL_COPY_WRITE_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    GLintptr readOffset = INT_INIT_VAL;
    GLintptr writeOffset = INT_INIT_VAL;
    GLsizeiptr size = SUB_DATA_SIZE;
    glCopyBufferSubData(GL_COPY_READ_BUFFER, GL_COPY_WRITE_BUFFER, readOffset, writeOffset, size);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &buffer1);
    glDeleteBuffers(CREAT_NUM_ONE, &buffer2);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCopyImageSubData(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint sourceTex, destTex;
    glGenTextures(CREAT_NUM_ONE, &sourceTex);
    glGenTextures(CREAT_NUM_ONE, &destTex);
    glBindTexture(GL_TEXTURE_2D, sourceTex);
    glTexStorage2D(GL_TEXTURE_2D, CREAT_NUM_ONE, GL_RGBA8, IMAGE_WIDTH, IMAGE_HEIGHT);
    glBindTexture(GL_TEXTURE_2D, destTex);
    glTexStorage2D(GL_TEXTURE_2D, CREAT_NUM_ONE, GL_RGBA8, IMAGE_WIDTH, IMAGE_HEIGHT);
    GLint srcX = INT_INIT_VAL;
    GLint srcY = INT_INIT_VAL;
    GLsizei srcWidth = IMAGE_WIDTH;
    GLsizei srcHeight = IMAGE_WIDTH;
    GLint destX = INT_INIT_VAL;
    GLint destY = INT_INIT_VAL;
    glCopyImageSubData(sourceTex, GL_TEXTURE_2D, INT_INIT_VAL, srcX, srcY, INT_INIT_VAL, destTex, GL_TEXTURE_2D,
                       INT_INIT_VAL, destX, destY, INT_INIT_VAL, srcWidth, srcHeight, CREAT_NUM_ONE);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &destTex);
    glDeleteTextures(CREAT_NUM_ONE, &sourceTex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCopyTexImage2D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture;
    GLuint fbo;
    glGenFramebuffers(CREAT_NUM_ONE, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, INT_INIT_VAL, GL_RGB, IMAGE_WIDTH, IMAGE_HEIGHT, INT_INIT_VAL, GL_RGB, GL_UNSIGNED_BYTE,
                 nullptr);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, INT_INIT_VAL);
    glCopyTexImage2D(GL_TEXTURE_2D, INT_INIT_VAL, GL_RGB, INT_INIT_VAL, INT_INIT_VAL, IMAGE_WIDTH, IMAGE_HEIGHT,
                     INT_INIT_VAL);
    GLenum glError = glGetError();
    glDeleteFramebuffers(CREAT_NUM_ONE, &fbo);
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCopyTexSubImage2D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture;
    GLuint fbo;
    glGenFramebuffers(CREAT_NUM_ONE, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, INT_INIT_VAL, GL_RGB, IMAGE_WIDTH, IMAGE_HEIGHT, INT_INIT_VAL, GL_RGB, GL_UNSIGNED_BYTE,
                 nullptr);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, INT_INIT_VAL);
    glCopyTexSubImage2D(GL_TEXTURE_2D, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL,
                        IMAGE_WIDTH, IMAGE_HEIGHT);
    GLenum glError = glGetError();
    glDeleteFramebuffers(CREAT_NUM_ONE, &fbo);
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCopyTexSubImage3D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_3D, texture);
    glTexImage3D(GL_TEXTURE_3D, INT_INIT_VAL, GL_R8, MATRIX_8, MATRIX_8, MATRIX_8, INT_INIT_VAL,
                 GL_RED, GL_UNSIGNED_BYTE, nullptr);
    GLuint framebuffer;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    glFramebufferTextureLayer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, texture, INT_INIT_VAL, MATRIX_8);
    glGenerateMipmap(GL_TEXTURE_3D);
    glTexImage3D(GL_TEXTURE_3D, INT_INIT_VAL, GL_R8UI, MATRIX_16, MATRIX_16, MATRIX_16, INT_INIT_VAL,
                 GL_RED_INTEGER, GL_UNSIGNED_BYTE, nullptr);
    glCopyTexSubImage3D(GL_TEXTURE_3D, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, MATRIX_2, MATRIX_2,
                        MATRIX_15, MATRIX_16, MATRIX_16);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLCreateProgram(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    initGLES();
    GLuint programObject = glCreateProgram();
    if (CREAT_ERROR != programObject) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteProgram(programObject);
    destroyGLES();
    return result;
}

static napi_value GLCreateShader(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    initGLES();
    GLuint shader = glCreateShader(GL_VERTEX_SHADER);
    if (CREAT_ERROR != shader) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteShader(shader);
    destroyGLES();
    return result;
}

static napi_value GLCreateShaderProgramv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shader = glCreateShaderProgramv(GL_VERTEX_SHADER, CREAT_NUM_ONE, &vertexShaderSource);
    napi_value result = nullptr;
    if (CREAT_ERROR == shader) {
        napi_create_int32(env, FAILED, &result);
    } else {
        napi_create_int32(env, SUCCESS, &result);
    }
    glDeleteShader(shader);
    destroyGLES();
    return result;
}

static napi_value GLCullFace(napi_env env, napi_callback_info info)
{
    initGLES();
    glCullFace(GL_BACK);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDebugMessageCallback(napi_env env, napi_callback_info info)
{
    initGLES();
    glDebugMessageCallback(nullptr, nullptr);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDebugMessageControl(napi_env env, napi_callback_info info)
{
    initGLES();
    glDebugMessageControl(GL_DONT_CARE, GL_DEBUG_TYPE_OTHER, GL_DEBUG_SEVERITY_LOW, INT_INIT_VAL, nullptr, GL_FALSE);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDebugMessageInsert(napi_env env, napi_callback_info info)
{
    initGLES();
    glDebugMessageInsert(GL_DEBUG_SOURCE_APPLICATION, GL_DEBUG_TYPE_ERROR, INT_INIT_VAL, GL_DEBUG_SEVERITY_HIGH,
                         SUB_DATA_SIZE, "Fragment shader compilation failed");
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteBuffers(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteFramebuffers(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &buffer);
    glDeleteFramebuffers(CREAT_NUM_ONE, &buffer);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteProgram(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = glCreateProgram();
    glDeleteProgram(programObject);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteProgramPipelines(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint pipeline = INT_INIT_VAL;
    glGenProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    glDeleteProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteQueries(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint queryIds = INT_INIT_VAL;
    glGenQueries(CREAT_NUM_ONE, &queryIds);
    glDeleteQueries(CREAT_NUM_ONE, &queryIds);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteRenderbuffers(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint rbo = INT_INIT_VAL;
    glGenRenderbuffers(CREAT_NUM_ONE, &rbo);
    glDeleteRenderbuffers(CREAT_NUM_ONE, &rbo);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteSamplers(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteShader(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shader = glCreateShader(GL_VERTEX_SHADER);
    glDeleteShader(shader);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteSync(napi_env env, napi_callback_info info)
{
    initGLES();
    GLsync sync = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, INT_INIT_VAL);
    glClientWaitSync(sync, INT_INIT_VAL, INT_INIT_VAL);
    glDeleteSync(sync);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteTextures(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteTransformFeedbacks(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint transformFeedback = INT_INIT_VAL;
    glGenTransformFeedbacks(CREAT_NUM_ONE, &transformFeedback);
    glDeleteTransformFeedbacks(CREAT_NUM_ONE, &transformFeedback);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDeleteVertexArrays(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint vao = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glDeleteVertexArrays(CREAT_NUM_ONE, &vao);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDepthFunc(napi_env env, napi_callback_info info)
{
    initGLES();
    glDepthFunc(GL_LEQUAL);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDepthMask(napi_env env, napi_callback_info info)
{
    initGLES();
    glDepthMask(GL_TRUE);
    glDepthMask(GL_FALSE);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDepthRangef(napi_env env, napi_callback_info info)
{
    initGLES();
    glDepthRangef(CLEAR_01, CLEAR_10);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}
static napi_value GLDetachShader(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObject = glCreateProgram();
    glAttachShader(programObject, shaderVertex);
    glAttachShader(programObject, shaderFragment);
    glLinkProgram(programObject);
    glDetachShader(programObject, shaderFragment);
    GLenum glError = glGetError();
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDisable(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_BLEND);
    glDisable(GL_BLEND);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDisablei(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_BLEND);
    glDisablei(GL_BLEND, INT_INIT_VAL);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDisableVertexAttribArray(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint vao = INT_INIT_VAL, vbo = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glGenBuffers(CREAT_NUM_ONE, &vbo);
    glBindVertexArray(vao);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glEnableVertexAttribArray(INT_INIT_VAL);
    glDisableVertexAttribArray(INT_INIT_VAL);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteVertexArrays(CREAT_NUM_ONE, &vao);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDispatchCompute(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shader = esLoadShader(GL_COMPUTE_SHADER, fragmentShaderSourceCompute);
    GLuint program = glCreateProgram();
    glAttachShader(program, shader);
    glLinkProgram(program);
    GLuint buffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_SHADER_STORAGE_BUFFER, buffer);
    glBufferData(GL_SHADER_STORAGE_BUFFER, sizeof(float) * COMPUTE_VAL, nullptr, GL_STATIC_DRAW);
    glBindBufferBase(GL_SHADER_STORAGE_BUFFER, INT_INIT_VAL, buffer);
    glUseProgram(program);
    glDispatchCompute(COMPUTE_VAL, CREAT_NUM_ONE, CREAT_NUM_ONE);
    GLenum glError = glGetError();
    glDeleteShader(shader);
    glDeleteProgram(program);
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDispatchComputeIndirect(napi_env env, napi_callback_info info)
{
    initGLES();
    typedef struct {
        GLuint num_groups_x;
        GLuint num_groups_y;
        GLuint num_groups_z;
    } DispatchIndirectCommand;
    DispatchIndirectCommand command = {INT_INIT_VAL};
    command.num_groups_x = COMPUTE_VAL;
    command.num_groups_y = CREAT_NUM_ONE;
    command.num_groups_z = CREAT_NUM_ONE;
    GLuint shader = esLoadShader(GL_COMPUTE_SHADER, fragmentShaderSourceComputeIndirect);
    GLuint program = glCreateProgram();
    glAttachShader(program, shader);
    glLinkProgram(program);
    GLuint indirectCommandBuffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &indirectCommandBuffer);
    glBindBuffer(GL_DISPATCH_INDIRECT_BUFFER, indirectCommandBuffer);
    glBufferData(GL_DISPATCH_INDIRECT_BUFFER, sizeof(DispatchIndirectCommand), &command, GL_STATIC_DRAW);
    glUseProgram(program);
    glDispatchComputeIndirect(INT_INIT_VAL);
    GLenum glError = glGetError();
    glMemoryBarrier(GL_SHADER_STORAGE_BARRIER_BIT);
    glDeleteShader(shader);
    glDeleteProgram(program);
    glDeleteBuffers(CREAT_NUM_ONE, &indirectCommandBuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawArrays(napi_env env, napi_callback_info info)
{
    initGLES();
    glDrawArrays(GL_TRIANGLES, ARRAY_INDEX_ZERO, ARRAY_INDEX_THREE);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawArraysIndirect(napi_env env, napi_callback_info info)
{
    initGLES();
    GLfloat vertices[] = {CLEAR_00, 0.5f, 0.5f, -0.5f, -0.5f, -0.5f};
    typedef struct {
        GLuint count;
        GLuint primCount;
        GLuint first;
        GLuint baseInstance;
    } DrawArraysIndirectCommand;
    DrawArraysIndirectCommand cmd;
    cmd.count = ARRAY_INDEX_THREE;
    cmd.primCount = CREAT_NUM_ONE;
    cmd.first = INT_INIT_VAL;
    cmd.baseInstance = INT_INIT_VAL;
    GLuint vao = GL_NO_ERROR;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glBindVertexArray(vao);
    GLuint vbo = GL_NO_ERROR;
    glGenBuffers(CREAT_NUM_ONE, &vbo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    GLuint drawCmdBuf = GL_NO_ERROR;
    glGenBuffers(CREAT_NUM_ONE, &drawCmdBuf);
    glBindBuffer(GL_DRAW_INDIRECT_BUFFER, drawCmdBuf);
    glBufferData(GL_DRAW_INDIRECT_BUFFER, sizeof(cmd), &cmd, GL_STATIC_DRAW);
    glDrawArraysIndirect(GL_TRIANGLES, INT_INIT_VAL);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteBuffers(CREAT_NUM_ONE, &drawCmdBuf);
    glDeleteVertexArrays(CREAT_NUM_ONE, &vao);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawArraysInstanced(napi_env env, napi_callback_info info)
{
    initGLES();
    glDrawArraysInstanced(GL_TRIANGLES, ARRAY_INDEX_ZERO, ARRAY_INDEX_THREE, ARRAY_INDEX_THREE);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawBuffers(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint fbo = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    GLenum drawBufs[] = {GL_COLOR_ATTACHMENT0, GL_COLOR_ATTACHMENT1};
    glDrawBuffers(ARRAY_INDEX_TWO, drawBufs);
    GLenum glError = glGetError();
    glDeleteFramebuffers(CREAT_NUM_ONE, &fbo);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawElements(napi_env env, napi_callback_info info)
{
    initGLES();
    glDrawElements(GL_TRIANGLES, ARRAY_INDEX_TWO, GL_UNSIGNED_SHORT, ARRAY_INDEX_ZERO);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawElementsBaseVertex(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint ibo = INT_INIT_VAL;
    GLint baseVertex = ARRAY_INDEX_ZERO;
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
    glDrawElementsBaseVertex(GL_TRIANGLES, ARRAY_INDEX_TWO, GL_UNSIGNED_SHORT, ARRAY_INDEX_ZERO, baseVertex);
    GLenum glError = glGetError();
    glBindVertexArray(ARRAY_INDEX_ZERO);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawElementsIndirect(napi_env env, napi_callback_info info)
{
    initGLES();
    GLfloat vertices[] = {CLEAR_00, 0.5f, CLEAR_00, 0.5f, -0.5f, CLEAR_00, -0.5f, -0.5f, CLEAR_00};
    GLuint indices[] = {0, 1, 2};
    typedef struct {
        GLuint count;
        GLuint instanceCount;
        GLuint firstIndex;
        GLuint baseVertex;
        GLuint baseInstance;
    } DrawElementsIndirectCommand;
    DrawElementsIndirectCommand cmd;
    GLuint vertexBuffer, indexBuffer, indirectBuffer;
    unsigned int VAO;
    glGenVertexArrays(CREAT_NUM_ONE, &VAO);
    glBindVertexArray(VAO);
    glGenBuffers(CREAT_NUM_ONE, &vertexBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glGenBuffers(CREAT_NUM_ONE, &indexBuffer);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexBuffer);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);
    glGenBuffers(CREAT_NUM_ONE, &indirectBuffer);
    cmd.count = ARRAY_INDEX_THREE;
    cmd.instanceCount = CREAT_NUM_ONE;
    cmd.firstIndex = INT_INIT_VAL;
    cmd.baseVertex = INT_INIT_VAL;
    cmd.baseInstance = INT_INIT_VAL;
    glBindBuffer(GL_DRAW_INDIRECT_BUFFER, indirectBuffer);
    glBufferData(GL_DRAW_INDIRECT_BUFFER, sizeof(DrawElementsIndirectCommand), &cmd, GL_STATIC_DRAW);
    glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
    glEnableVertexAttribArray(INT_INIT_VAL);
    glVertexAttribPointer(INT_INIT_VAL, ARRAY_INDEX_THREE, GL_FLOAT, GL_FALSE, INT_INIT_VAL, INT_INIT_VAL);
    glBindBuffer(GL_DRAW_INDIRECT_BUFFER, indirectBuffer);
    glDrawElementsIndirect(GL_TRIANGLES, GL_UNSIGNED_INT, INT_INIT_VAL);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vertexBuffer);
    glDeleteBuffers(CREAT_NUM_ONE, &indexBuffer);
    glDeleteBuffers(CREAT_NUM_ONE, &indirectBuffer);
    glDeleteVertexArrays(CREAT_NUM_ONE, &VAO);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawElementsInstanced(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint vbo;
    GLuint ibo;
    GLfloat vertices[] = {-0.5f, CLEAR_00, CLEAR_00, 0.5f, CLEAR_00, CLEAR_00, CLEAR_00, 0.5f, CLEAR_00};
    GLubyte indices[] = {0, 1, 2};
    glGenBuffers(ARRAY_INDEX_ONE, &vbo);
    glGenBuffers(ARRAY_INDEX_ONE, &ibo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);
    glVertexAttribPointer(ARRAY_INDEX_ZERO, ARRAY_INDEX_THREE, GL_FLOAT, GL_FALSE, ARRAY_INDEX_ZERO, ARRAY_INDEX_ZERO);
    glEnableVertexAttribArray(ARRAY_INDEX_ZERO);
    glDrawElementsInstanced(GL_TRIANGLES, ARRAY_INDEX_THREE, GL_UNSIGNED_BYTE, ARRAY_INDEX_ZERO, ARRAY_INDEX_TWO);
    glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteBuffers(CREAT_NUM_ONE, &ibo);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawElementsInstancedBaseVertex(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint vbo = INT_INIT_VAL;
    GLuint ibo = INT_INIT_VAL;
    GLfloat vertices[] = {-0.5f, -0.5f, CLEAR_00, 0.5f, -0.5f, CLEAR_00, CLEAR_00, 0.5f, CLEAR_00};
    GLubyte indices[] = {0, 1, 2};
    glGenBuffers(ARRAY_INDEX_ONE, &vbo);
    glGenBuffers(ARRAY_INDEX_ONE, &ibo);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);
    glVertexAttribPointer(ARRAY_INDEX_ZERO, ARRAY_INDEX_THREE, GL_FLOAT, GL_FALSE, ARRAY_INDEX_ZERO, ARRAY_INDEX_ZERO);
    glEnableVertexAttribArray(ARRAY_INDEX_ZERO);
    glDrawElementsInstancedBaseVertex(GL_TRIANGLES, ARRAY_INDEX_THREE, GL_UNSIGNED_BYTE, ARRAY_INDEX_ZERO,
                                      ARRAY_INDEX_THREE, ARRAY_INDEX_ONE);
    glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteBuffers(CREAT_NUM_ONE, &ibo);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawRangeElements(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint vbo = INT_INIT_VAL;
    GLuint ibo = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &vbo);
    glGenBuffers(CREAT_NUM_ONE, &ibo);
    GLfloat vertices[] = {-0.5f, -0.5f, CLEAR_00, 0.5f, -0.5f, CLEAR_00, CLEAR_00, 0.5f, CLEAR_00};
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    GLuint indices[] = {ARRAY_INDEX_ZERO, ARRAY_INDEX_ONE, ARRAY_INDEX_TWO};
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);
    glVertexAttribPointer(ARRAY_INDEX_ZERO, ARRAY_INDEX_THREE, GL_FLOAT, GL_FALSE, ARRAY_INDEX_ZERO, ARRAY_INDEX_ZERO);
    glEnableVertexAttribArray(ARRAY_INDEX_ZERO);
    glDrawRangeElements(GL_TRIANGLES, ARRAY_INDEX_ONE, ARRAY_INDEX_TWO, ARRAY_INDEX_TWO, GL_UNSIGNED_BYTE,
                        ARRAY_INDEX_ZERO);
    glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteBuffers(CREAT_NUM_ONE, &ibo);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLDrawRangeElementsBaseVertex(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint vbo = INT_INIT_VAL;
    GLuint ibo = INT_INIT_VAL;
    GLuint vao = INT_INIT_VAL;
    glGenBuffers(ARRAY_INDEX_ONE, &vbo);
    glGenBuffers(ARRAY_INDEX_ONE, &ibo);
    GLfloat vertices[] = {-0.5f, -0.5f, CLEAR_00, 0.5f, -0.5f, CLEAR_00, CLEAR_00, 0.5f, CLEAR_00};
    GLuint indices[] = {0, 1, 2};
    glBindVertexArray(vao);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ibo);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);
    glVertexAttribPointer(ARRAY_INDEX_ZERO, ARRAY_INDEX_THREE, GL_FLOAT, GL_FALSE, ARRAY_INDEX_ZERO, ARRAY_INDEX_ZERO);
    glEnableVertexAttribArray(ARRAY_INDEX_ZERO);
    glDrawRangeElementsBaseVertex(GL_TRIANGLES, ARRAY_INDEX_ONE, ARRAY_INDEX_TWO, ARRAY_INDEX_TWO, GL_UNSIGNED_INT,
                                  ARRAY_INDEX_ZERO, ARRAY_INDEX_ONE);
    glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &vbo);
    glDeleteBuffers(CREAT_NUM_ONE, &ibo);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLEnable(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_BLEND);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLEnablei(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnablei(GL_BLEND, ARRAY_INDEX_ZERO);
    GLenum glError = glGetError();
    glDisablei(GL_BLEND, ARRAY_INDEX_ZERO);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLEnableVertexAttribArray(napi_env env, napi_callback_info info)
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
    glEnableVertexAttribArray(INT_INIT_VAL);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &VBO);
    glDeleteVertexArrays(CREAT_NUM_ONE, &VAO);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLEndQuery(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint queryID = INT_INIT_VAL;
    glGenQueries(CREAT_NUM_ONE, &queryID);
    glBeginQuery(GL_ANY_SAMPLES_PASSED, queryID);
    glEndQuery(GL_ANY_SAMPLES_PASSED);
    GLenum glError = glGetError();
    glDeleteQueries(CREAT_NUM_ONE, &queryID);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLEndTransformFeedback(napi_env env, napi_callback_info info)
{
    GLenum glError = GL_NO_ERROR;
    initGLES();
    GLuint tfBuffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &tfBuffer);
    GLuint vao = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &vao);
    glBindVertexArray(vao);
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObject = glCreateProgram();
    glAttachShader(programObject, shaderVertex);
    glAttachShader(programObject, shaderFragment);
    glLinkProgram(programObject);
    glUseProgram(programObject);
    glBindBufferBase(GL_TRANSFORM_FEEDBACK_BUFFER, INT_INIT_VAL, tfBuffer);
    glTransformFeedbackVaryings(programObject, VARYING_NUM, (const char *[]){"gl_Position", "vColor"},
                                GL_SEPARATE_ATTRIBS);
    glEnable(GL_RASTERIZER_DISCARD);
    glBeginTransformFeedback(GL_POINTS);
    glEndTransformFeedback();
    glError = glGetError();
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(programObject);
    glDeleteVertexArrays(CREAT_NUM_ONE, &vao);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLFenceSync(napi_env env, napi_callback_info info)
{
    initGLES();
    glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, ARRAY_INDEX_ZERO);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLFinish(napi_env env, napi_callback_info info)
{
    initGLES();
    glClearColor(INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL);
    glClear(GL_COLOR_BUFFER_BIT);
    glFinish();
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLFlush(napi_env env, napi_callback_info info)
{
    initGLES();
    glClearColor(INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL, INT_INIT_VAL);
    glClear(GL_COLOR_BUFFER_BIT);
    glFlush();
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLFlushMappedBufferRange(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, GL_BUF_SIZE, nullptr, GL_DYNAMIC_DRAW);
    glMapBufferRange(GL_ARRAY_BUFFER, INT_INIT_VAL, GL_BUF_SIZE,
                     GL_MAP_WRITE_BIT | GL_MAP_UNSYNCHRONIZED_BIT | GL_MAP_FLUSH_EXPLICIT_BIT);

    glFlushMappedBufferRange(GL_ARRAY_BUFFER, INT_INIT_VAL, GL_BUF_SIZE);
    GLenum glError = glGetError();
    glUnmapBuffer(GL_ARRAY_BUFFER);
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLFramebufferParameteri(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint framebuffer = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);

    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    glFramebufferParameteri(GL_FRAMEBUFFER, GL_FRAMEBUFFER_DEFAULT_WIDTH, INIT_HEIGHT);
    GLenum glError = glGetError();
    glDeleteFramebuffers(CREAT_NUM_ONE, &framebuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLFramebufferRenderbuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint framebuffer;
    GLuint renderbuffer;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glGenRenderbuffers(CREAT_NUM_ONE, &renderbuffer);

    glBindRenderbuffer(GL_RENDERBUFFER, renderbuffer);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, INIT_HEIGHT, INIT_WIDTH);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, renderbuffer);

    GLenum status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
    napi_value result = nullptr;
    if (status == GL_FRAMEBUFFER_COMPLETE) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }

    glDeleteFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glDeleteRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    destroyGLES();
    return result;
}

static napi_value GLFramebufferTexture(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, INT_INIT_VAL, GL_RGB, INIT_HEIGHT, INIT_WIDTH, INT_INIT_VAL, GL_RGB, GL_UNSIGNED_BYTE,
                 nullptr);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

    GLuint framebuffer = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);

    glFramebufferTexture(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, texture, INT_INIT_VAL);
    GLenum status = glCheckFramebufferStatus(GL_FRAMEBUFFER);

    napi_value result = nullptr;
    if (status == GL_FRAMEBUFFER_COMPLETE) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }

    glDeleteFramebuffers(INFO_LEN_ONE, &framebuffer);
    glDeleteTextures(INFO_LEN_ONE, &texture);
    destroyGLES();
    return result;
}

static napi_value GLFramebufferTexture2D(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, INT_INIT_VAL, GL_RGB, INIT_WIDTH, INIT_WIDTH, INT_INIT_VAL, GL_RGB, GL_UNSIGNED_BYTE,
                 nullptr);

    GLuint framebuffer = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);

    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, INT_INIT_VAL);
    GLenum status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
    napi_value result = nullptr;
    if (status == GL_FRAMEBUFFER_COMPLETE) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteFramebuffers(INFO_LEN_ONE, &framebuffer);
    glDeleteTextures(INFO_LEN_ONE, &texture);
    destroyGLES();
    return result;
}

static napi_value GLFramebufferTextureLayer(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D_ARRAY, texture);
    glTexStorage3D(GL_TEXTURE_2D_ARRAY, IMAGE2D_LEVEL_ONE, GL_RGBA8, INIT_WIDTH, INIT_HEIGHT, VARYING_NUM);

    GLuint framebuffer = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);

    glFramebufferTextureLayer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, texture, INT_INIT_VAL, INT_INIT_VAL);
    GLenum status = glCheckFramebufferStatus(GL_FRAMEBUFFER);

    napi_value result = nullptr;
    if (status == GL_FRAMEBUFFER_COMPLETE) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteFramebuffers(INFO_LEN_ONE, &framebuffer);
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return result;
}

static napi_value GLFrontFace(napi_env env, napi_callback_info info)
{
    initGLES();
    glClearColor(CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10);
    glClear(GL_COLOR_BUFFER_BIT);
    glFrontFace(GL_CW);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenBuffers(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenerateMipmap(napi_env env, napi_callback_info info)
{
    initGLES();
    unsigned char pixels[] = {255, 255, 255, 0, 0, 0, 255, 255, 255, 0, 0, 0};
    GLuint texture;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, INT_INIT_VAL, GL_RGB, VARYING_NUM, VARYING_NUM, INT_INIT_VAL, GL_RGB, GL_UNSIGNED_BYTE,
                 pixels);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_NEAREST);

    glGenerateMipmap(GL_TEXTURE_2D);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenFramebuffers(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint framebuffer = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    GLenum glError = glGetError();
    glDeleteFramebuffers(CREAT_NUM_ONE, &framebuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenProgramPipelines(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint pipeline = INT_INIT_VAL;
    glGenProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    GLenum glError = glGetError();
    glDeleteProgramPipelines(CREAT_NUM_ONE, &pipeline);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenQueries(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint query = INT_INIT_VAL;
    glGenQueries(CREAT_NUM_ONE, &query);
    GLenum glError = glGetError();
    glDeleteQueries(CREAT_NUM_ONE, &query);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenRenderbuffers(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint renderbuffer = INT_INIT_VAL;
    glGenRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    GLenum glError = glGetError();
    glDeleteRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenSamplers(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);

    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenTextures(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenTransformFeedbacks(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint transformFeedback;
    glGenTransformFeedbacks(CREAT_NUM_ONE, &transformFeedback);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &transformFeedback);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGenVertexArrays(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint vertex;
    glGenVertexArrays(CREAT_NUM_ONE, &vertex);
    GLenum glError = glGetError();
    glDeleteVertexArrays(CREAT_NUM_ONE, &vertex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetActiveAttrib(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObjectRed = glCreateProgram();
    glAttachShader(programObjectRed, shaderVertex);
    glAttachShader(programObjectRed, shaderFragment);
    glLinkProgram(programObjectRed);
    glUseProgram(programObjectRed);

    GLint numAttribs = INT_INIT_VAL;
    glGetProgramiv(programObjectRed, GL_ACTIVE_ATTRIBUTES, &numAttribs);
    if (numAttribs == INT_INIT_VAL) {
        napi_value result = nullptr;
        napi_create_int32(env, FAILED, &result);
        return result;
    }
    char name[GL_BUF_SIZE];
    glGetActiveAttrib(programObjectRed, INT_INIT_VAL, GL_BUF_SIZE, nullptr, nullptr, nullptr, name);
    GLenum glError = glGetError();

    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(programObjectRed);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetAttachedShaders(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObjectRed = glCreateProgram();
    glAttachShader(programObjectRed, shaderVertex);
    glAttachShader(programObjectRed, shaderFragment);
    glLinkProgram(programObjectRed);
    glUseProgram(programObjectRed);

    GLint shaderCount;
    glGetProgramiv(programObjectRed, GL_ATTACHED_SHADERS, &shaderCount);
    GLuint *shaders = (GLuint *)malloc(shaderCount * sizeof(GLuint));
    glGetAttachedShaders(programObjectRed, shaderCount, nullptr, shaders);
    GLenum glError = glGetError();
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(programObjectRed);
    free(shaders);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetAttribLocation(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObjectRed = glCreateProgram();
    glAttachShader(programObjectRed, shaderVertex);
    glAttachShader(programObjectRed, shaderFragment);
    glLinkProgram(programObjectRed);
    glUseProgram(programObjectRed);

    glGetAttribLocation(programObjectRed, "vPosition");
    GLenum glError = glGetError();
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(programObjectRed);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetBooleani_v(napi_env env, napi_callback_info info)
{
    initGLES();
    GLint max = INT_INIT_VAL;
    glGetIntegerv(GL_MAX_COLOR_ATTACHMENTS, &max);
    GLboolean attachments[max];
    glGetBooleani_v(GL_COLOR_WRITEMASK, INT_INIT_VAL, attachments);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetBooleanv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLboolean val = INT_INIT_VAL;
    glGetBooleanv(GL_DEPTH_WRITEMASK, &val);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetBufferParameteri64v(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer = INT_INIT_VAL;
    GLint64 bufferSize = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glGetBufferParameteri64v(GL_ARRAY_BUFFER, GL_BUFFER_SIZE, &bufferSize);
    GLenum glError = glGetError();

    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetBufferParameteriv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer = INT_INIT_VAL;
    GLint bufferUsage = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glGetBufferParameteriv(GL_ARRAY_BUFFER, GL_BUFFER_USAGE, &bufferUsage);
    GLenum glError = glGetError();

    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetBufferPointerv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer = INT_INIT_VAL;
    GLvoid *bufferPtr = nullptr;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glGetBufferPointerv(GL_ARRAY_BUFFER, GL_BUFFER_MAP_POINTER, &bufferPtr);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetDebugMessageLog(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint count = COUNT_NUM;
    GLenum source = INT_INIT_VAL;
    GLenum type = INT_INIT_VAL;
    GLuint id = INT_INIT_VAL;
    GLenum severity = INT_INIT_VAL;
    GLsizei length = INT_INIT_VAL;
    GLchar messageLog[GL_BUF_SIZE];
    GLuint countSize = GL_BUF_SIZE;
    glEnable(GL_DEBUG_OUTPUT);
    glGetDebugMessageLog(count, countSize, &source, &type, &id, &severity, &length, messageLog);

    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetError(napi_env env, napi_callback_info info)
{
    initGLES();
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetFloatv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLfloat currentLineWidth;
    glLineWidth(CLEAR_50);
    glGetFloatv(GL_LINE_WIDTH, &currentLineWidth);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetFragDataLocation(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint programObjectRed = glCreateProgram();
    glAttachShader(programObjectRed, shaderVertex);
    glAttachShader(programObjectRed, shaderFragment);
    glLinkProgram(programObjectRed);
    glUseProgram(programObjectRed);

    glGetFragDataLocation(programObjectRed, "fragColor");
    GLenum glError = glGetError();
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(programObjectRed);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetFramebufferAttachmentParameteriv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint framebuffer = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    GLint param = INT_INIT_VAL;
    glGetFramebufferAttachmentParameteriv(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE,
                                          &param);
    GLenum glError = glGetError();

    glDeleteFramebuffers(CREAT_NUM_ONE, &framebuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetFramebufferParameteriv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint framebuffer = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    GLint param = INT_INIT_VAL;
    glGetFramebufferParameteriv(GL_FRAMEBUFFER, GL_FRAMEBUFFER_DEFAULT_WIDTH, &param);
    GLenum glError = glGetError();

    glDeleteFramebuffers(CREAT_NUM_ONE, &framebuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetGraphicsResetStatus(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLenum resetStatus = glGetGraphicsResetStatus();
    if (resetStatus == GL_NO_ERROR || resetStatus == GL_GUILTY_CONTEXT_RESET ||
        resetStatus == GL_INNOCENT_CONTEXT_RESET || resetStatus == GL_UNKNOWN_CONTEXT_RESET) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    destroyGLES();
    return result;
}

static napi_value GLGetInteger64i_v(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint buffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_SHADER_STORAGE_BUFFER, buffer);
    GLint64 bufferSize = INT_INIT_VAL;
    glGetInteger64i_v(GL_SHADER_STORAGE_BUFFER_SIZE, buffer, &bufferSize);
    GLenum glError = glGetError();
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetInteger64v(napi_env env, napi_callback_info info)
{
    initGLES();
    GLint64 value = INT_INIT_VAL;
    glGetInteger64v(GL_MAX_TEXTURE_SIZE, &value);
    GLenum glError = glGetError();
    return getError(env, glError);
}

static napi_value GLGetIntegeri_v(napi_env env, napi_callback_info info)
{
    initGLES();
    GLint index = INT_INIT_VAL;
    glGetIntegeri_v(GL_UNIFORM_BUFFER_BINDING, INT_INIT_VAL, &index);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetIntegerv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLint max = INT_INIT_VAL;
    glGetIntegerv(GL_MAX_COLOR_ATTACHMENTS, &max);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetInternalformativ(napi_env env, napi_callback_info info)
{
    initGLES();
    GLint numFormats = INT_INIT_VAL;
    glGetInternalformativ(GL_RENDERBUFFER, GL_RGB, GL_NUM_SAMPLE_COUNTS, COUNT_NUM, &numFormats);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetMultisamplefv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint framebuffer = INT_INIT_VAL;
    GLuint renderbuffer = INT_INIT_VAL;
    GLuint texture = INT_INIT_VAL;
    glGenRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, renderbuffer);
    glRenderbufferStorageMultisample(GL_RENDERBUFFER, SAMPLES, GL_DEPTH_COMPONENT24, IMAGE_WIDTH, IMAGE_HEIGHT);

    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_DRAW_FRAMEBUFFER, framebuffer);
    glFramebufferTexture2D(GL_DRAW_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, INT_INIT_VAL);
    glFramebufferRenderbuffer(GL_DRAW_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, renderbuffer);
    GLfloat samplePositions[8][2];
    glGetMultisamplefv(GL_SAMPLE_POSITION, INT_INIT_VAL, &samplePositions[0][0]);
    GLenum glError = glGetError();

    glDeleteFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glDeleteRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetObjectLabel(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint vertexShader = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    glObjectLabel(GL_SHADER, vertexShader, FAILED, "Vertex Shader");
    GLsizei len;
    glGetObjectLabel(GL_SHADER, vertexShader, GL_MAX_LABEL_LENGTH, &len, nullptr);
    char label[len];
    glGetObjectLabel(GL_SHADER, vertexShader, len, nullptr, label);
    GLenum glError = glGetError();
    glDeleteShader(vertexShader);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetObjectPtrLabel(napi_env env, napi_callback_info info)
{
    initGLES();
    GLsync syncObject = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, INT_INIT_VAL);
    GLsizei outLen = INT_INIT_VAL;
    glGetObjectPtrLabel(syncObject, INT_INIT_VAL, &outLen, nullptr);
    GLenum glError = glGetError();
    glDeleteSync(syncObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetPointerv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLvoid *params = nullptr;
    glGetPointerv(GL_DEBUG_CALLBACK_USER_PARAM, &params);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetProgramBinary(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint program = glCreateProgram();
    glObjectLabel(GL_SHADER, shaderVertex, FAILED, "Vertex Shader");

    glAttachShader(program, shaderVertex);
    glAttachShader(program, shaderFragment);
    glLinkProgram(program);

    GLint binaryLength = INT_INIT_VAL;
    glGetProgramiv(program, GL_PROGRAM_BINARY_LENGTH, &binaryLength);
    GLubyte *binary = (GLubyte *)malloc(binaryLength);
    GLenum binaryFormat = INT_INIT_VAL;
    GLsizei length = INT_INIT_VAL;
    glGetProgramBinary(program, binaryLength, &length, &binaryFormat, binary);
    GLenum glError = glGetError();
    free(binary);
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetProgramInfoLog(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint program = glCreateProgram();
    glAttachShader(program, shaderVertex);
    glAttachShader(program, shaderFragment);
    glLinkProgram(program);

    char log[] = "My program log";
    glObjectLabel(GL_PROGRAM, program, sizeof(log), log);

    GLint length;
    glGetProgramiv(program, GL_INFO_LOG_LENGTH, &length);
    GLchar outLog[length];
    glGetProgramInfoLog(program, length, nullptr, outLog);
    GLenum glError = glGetError();

    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetProgramInterfaceiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = glCreateProgram();
    GLint numInterfaces;
    glGetProgramInterfaceiv(program, GL_UNIFORM_BLOCK, GL_ACTIVE_RESOURCES, &numInterfaces);
    GLenum glError = glGetError();

    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetProgramiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = glCreateProgram();
    glLinkProgram(program);
    GLint length;
    glGetProgramiv(program, GL_INFO_LOG_LENGTH, &length);
    GLenum glError = glGetError();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetProgramPipelineiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint pipeline = INT_INIT_VAL;
    glGenProgramPipelines(CREAT_NUM_ONE, &pipeline);
    GLint param = INT_INIT_VAL;
    glGetProgramPipelineiv(pipeline, GL_ACTIVE_PROGRAM, &param);
    GLenum glError = glGetError();
    glDeleteProgramPipelines(CREAT_NUM_ONE, &pipeline);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetProgramResourceIndex(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint program = glCreateProgram();
    glAttachShader(program, shaderVertex);
    glAttachShader(program, shaderFragment);
    glLinkProgram(program);

    glGetProgramResourceIndex(program, GL_PROGRAM_INPUT, "vPosition");
    GLenum glError = glGetError();

    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetProgramResourceiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint program = glCreateProgram();
    glAttachShader(program, shaderVertex);
    glAttachShader(program, shaderFragment);
    glLinkProgram(program);

    GLint numAttrs = INT_INIT_VAL;
    glGetProgramInterfaceiv(program, GL_PROGRAM_INPUT, GL_ACTIVE_RESOURCES, &numAttrs);
    GLenum properties[] = {GL_NAME_LENGTH, GL_TYPE, GL_LOCATION};
    GLuint index = glGetProgramResourceIndex(program, GL_PROGRAM_INPUT, "vPosition");

    napi_value result;
    if (index != GL_INVALID_INDEX) {
        GLint values[GL_BUF_SIZE];
        GLsizei length = INT_INIT_VAL;
        glGetProgramResourceiv(program, GL_PROGRAM_INPUT, index, VERTEX_NUM, properties, GL_BUF_SIZE, &length, values);
        GLenum glError = glGetError();
        result = getError(env, glError);

    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(program);
    destroyGLES();
    return result;
}

static napi_value GLGetProgramResourceLocation(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint program = glCreateProgram();
    glAttachShader(program, shaderVertex);
    glAttachShader(program, shaderFragment);
    glLinkProgram(program);

    glGetProgramResourceLocation(program, GL_PROGRAM_INPUT, "vPosition");
    GLenum glError = glGetError();

    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetProgramResourceName(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLuint program = glCreateProgram();
    glAttachShader(program, shaderVertex);
    glAttachShader(program, shaderFragment);
    glLinkProgram(program);

    GLsizei length = INT_INIT_VAL;
    char name[GL_BUF_SIZE];
    glGetProgramResourceName(program, GL_PROGRAM_INPUT, INT_INIT_VAL, GL_BUF_SIZE, &length, name);
    GLenum glError = glGetError();

    glDeleteShader(shaderVertex);
    glDeleteShader(shaderFragment);
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetQueryiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint query = INT_INIT_VAL;
    glGenQueries(CREAT_NUM_ONE, &query);
    glBeginQuery(GL_ANY_SAMPLES_PASSED, query);
    glEndQuery(GL_ANY_SAMPLES_PASSED);
    GLint available = INT_INIT_VAL;
    glGetQueryiv(GL_ANY_SAMPLES_PASSED, GL_CURRENT_QUERY, &available);
    GLenum glError = glGetError();

    glDeleteQueries(CREAT_NUM_ONE, &query);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetQueryObjectuiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint query = INT_INIT_VAL;
    glGenQueries(CREAT_NUM_ONE, &query);
    glBeginQuery(GL_ANY_SAMPLES_PASSED, query);
    glEndQuery(GL_ANY_SAMPLES_PASSED);
    GLint available = INT_INIT_VAL;
    glGetQueryObjectuiv(query, GL_QUERY_RESULT_AVAILABLE, (GLuint *)&available);
    GLenum glError = glGetError();

    glDeleteQueries(CREAT_NUM_ONE, &query);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetRenderbufferParameteriv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint renderbuffer;
    glGenRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, renderbuffer);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_RGBA4, INIT_WIDTH, INIT_HEIGHT);
    GLint width;
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &width);
    GLenum glError = glGetError();
    glDeleteRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetSamplerParameterfv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    glSamplerParameteri(sampler, GL_TEXTURE_WRAP_S, GL_REPEAT);
    GLfloat param = INT_INIT_VAL;
    glGetSamplerParameterfv(sampler, GL_TEXTURE_WRAP_S, &param);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return getError(env, glError);
}
static napi_value GLGetSamplerParameterIiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    glSamplerParameteri(sampler, GL_TEXTURE_MIN_FILTER, GL_LINEAR);

    GLint param = INT_INIT_VAL;
    glGetSamplerParameterIiv(sampler, GL_TEXTURE_MIN_FILTER, &param);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return getError(env, glError);
}
static napi_value GLGetSamplerParameterIuiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    glSamplerParameteri(sampler, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    GLuint param = INT_INIT_VAL;
    glGetSamplerParameterIuiv(sampler, GL_TEXTURE_MIN_FILTER, &param);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}
static napi_value GLGetSamplerParameteriv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    glSamplerParameteri(sampler, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    GLint param = INT_INIT_VAL;
    glGetSamplerParameteriv(sampler, GL_TEXTURE_MIN_FILTER, &param);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetShaderInfoLog(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderFragment = esLoadShader(GL_FRAGMENT_SHADER, fragmentShaderSource);
    GLchar log[SUB_DATA_SIZE];
    glGetShaderInfoLog(shaderFragment, SUB_DATA_SIZE, nullptr, log);
    GLenum glError = glGetError();
    glDeleteShader(shaderFragment);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetShaderiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLint params;
    glGetShaderiv(shaderVertex, GL_COMPILE_STATUS, &params);
    GLenum glError = glGetError();
    glDeleteShader(shaderVertex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetShaderPrecisionFormat(napi_env env, napi_callback_info info)
{
    initGLES();
    GLint range[2];
    GLint precision;
    glGetShaderPrecisionFormat(GL_FRAGMENT_SHADER, GL_HIGH_FLOAT, range, &precision);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetShaderSource(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexShaderSource);
    GLsizei length;
    glGetShaderiv(shaderVertex, GL_SHADER_SOURCE_LENGTH, &length);
    GLenum glError = FAILED;
    if (length > 0) {
        GLchar source[length];
        glGetShaderSource(shaderVertex, length, nullptr, source);
        glError = glGetError();
    }
    glDeleteShader(shaderVertex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetString(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    const GLubyte *renderer = glGetString(GL_RENDERER);
    if (renderer != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    destroyGLES();
    return result;
}

static napi_value GLGetStringi(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    const GLubyte *renderer = glGetStringi(GL_EXTENSIONS, INT_INIT_VAL);
    if (renderer != nullptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    destroyGLES();
    return result;
}

static napi_value GLGetSynciv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLsync sync = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, INT_INIT_VAL);
    GLsizei sizei = INT_INIT_VAL;
    GLint buff[256];
    glGetSynciv(sync, GL_OBJECT_TYPE, sizei, nullptr, buff);
    GLenum glError = glGetError();
    glDeleteSync(sync);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetTexLevelParameterfv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    GLfloat width;
    glGetTexLevelParameterfv(GL_TEXTURE_2D, INT_INIT_VAL, GL_TEXTURE_WIDTH, &width);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetTexLevelParameteriv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    GLint width;
    glGetTexLevelParameteriv(GL_TEXTURE_2D, INT_INIT_VAL, GL_TEXTURE_WIDTH, &width);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetTexParameterfv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    GLfloat params;
    glGetTexParameterfv(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, &params);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetTexParameterIiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    GLint params;
    glGetTexParameterIiv(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, &params);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetTexParameterIuiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    GLuint params;
    glGetTexParameterIuiv(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, &params);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetTexParameteriv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    GLint params;
    glGetTexParameteriv(GL_TEXTURE_2D, GL_TEXTURE_BASE_LEVEL, &params);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetTransformFeedbackVarying(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexShaderSource, fragmentShaderSource);
    GLint index = glGetAttribLocation(program, "vPosition");
    glBindAttribLocation(program, index, "vPosition");
    const char *varyings = "gl_Position";
    glTransformFeedbackVaryings(program, COUNT_NUM, &varyings, GL_INTERLEAVED_ATTRIBS);
    glLinkProgram(program);
    GLsizei size;
    GLenum type;
    GLchar name[SUB_DATA_SIZE];
    glGetTransformFeedbackVarying(program, INT_INIT_VAL, SUB_DATA_SIZE, nullptr, &size, &type, name);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetUniformBlockIndex(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram();
    GLuint blockIndex = glGetUniformBlockIndex(program, "MatrixBlock");
    GLenum glError = glGetError();
    if (blockIndex != GL_INVALID_INDEX) {
        glError = SUCCESS;
    }
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetUniformfv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexSource, fragmentSource);
    GLint location = glGetUniformLocation(program, "color");
    GLfloat param[4];
    glGetUniformfv(program, location, param);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetUniformIndices(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexShaderSource, fragmentShaderSource);
    GLuint Indices[2];
    GLchar *names[] = {};
    glGetUniformIndices(program, INT_INIT_VAL, names, Indices);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetUniformiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexSource, fragmentSource);
    GLint location = glGetUniformLocation(program, "color");
    GLint param[4];
    glGetUniformiv(program, location, param);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetUniformLocation(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint program = initProgram(vertexSource, fragmentSource);
    GLint location = glGetUniformLocation(program, "color");
    if (location != FAILED) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return result;
}

static napi_value GLGetUniformuiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexSource, fragmentSource);
    GLint location = glGetUniformLocation(program, "color");
    GLuint param[4];
    glGetUniformuiv(program, location, param);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetVertexAttribfv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLenum glError = FAILED;
    shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexSource);
    GLint maxVertexAttribs;
    glGetIntegerv(GL_MAX_VERTEX_ATTRIBS, &maxVertexAttribs);
    GLfloat params[4];
    if (maxVertexAttribs > INT_INIT_VAL) {
        glGetVertexAttribfv(ARRAY_INDEX_ZERO, GL_CURRENT_VERTEX_ATTRIB, params);
        glError = glGetError();
    }
    glDeleteShader(shaderVertex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetVertexAttribIiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLenum glError = FAILED;
    shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexSource);
    GLint maxVertexAttribs;
    glGetIntegerv(GL_MAX_VERTEX_ATTRIBS, &maxVertexAttribs);
    GLint params[4];
    if (maxVertexAttribs > INT_INIT_VAL) {
        glGetVertexAttribIiv(ARRAY_INDEX_ZERO, GL_CURRENT_VERTEX_ATTRIB, params);
        glError = glGetError();
    }
    glDeleteShader(shaderVertex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetVertexAttribIuiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLenum glError = FAILED;
    shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexSource);
    GLint maxVertexAttribs;
    glGetIntegerv(GL_MAX_VERTEX_ATTRIBS, &maxVertexAttribs);
    GLuint params[4];
    if (maxVertexAttribs > INT_INIT_VAL) {
        glGetVertexAttribIuiv(ARRAY_INDEX_ZERO, GL_CURRENT_VERTEX_ATTRIB, params);
    }
    glError = glGetError();
    glDeleteShader(shaderVertex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetVertexAttribiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLenum glError = FAILED;
    shaderVertex = esLoadShader(GL_VERTEX_SHADER, vertexSource);
    GLint maxVertexAttribs;
    glGetIntegerv(GL_MAX_VERTEX_ATTRIBS, &maxVertexAttribs);
    GLint params[4];
    if (maxVertexAttribs > INT_INIT_VAL) {
        glGetVertexAttribiv(ARRAY_INDEX_ZERO, GL_CURRENT_VERTEX_ATTRIB, params);
    }
    glError = glGetError();
    glDeleteShader(shaderVertex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLGetVertexAttribPointerv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLvoid *attribPointer;
    glGetVertexAttribPointerv(INT_INIT_VAL, GL_VERTEX_ATTRIB_ARRAY_POINTER, &attribPointer);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLHint(napi_env env, napi_callback_info info)
{
    initGLES();
    glHint(GL_FRAGMENT_SHADER_DERIVATIVE_HINT, GL_FASTEST);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLInvalidateFramebuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint fbo, tex, rbo;
    glGenTextures(CREAT_NUM_ONE, &tex);
    glBindTexture(GL_TEXTURE_2D, tex);
    glTexStorage2D(GL_TEXTURE_2D, CREAT_NUM_ONE, GL_RGBA8, INIT_WIDTH, INIT_HEIGHT);
    glGenRenderbuffers(CREAT_NUM_ONE, &rbo);
    glBindRenderbuffer(GL_RENDERBUFFER, rbo);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8, INIT_WIDTH, INIT_HEIGHT);

    glGenFramebuffers(CREAT_NUM_ONE, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, tex, INT_INIT_VAL);
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_STENCIL_ATTACHMENT, GL_RENDERBUFFER, rbo);
    GLenum attachments[2] = {GL_DEPTH_STENCIL_ATTACHMENT, GL_COLOR_ATTACHMENT0};
    glInvalidateFramebuffer(GL_FRAMEBUFFER, 2, attachments);
    GLenum glError = glGetError();

    glDeleteFramebuffers(CREAT_NUM_ONE, &fbo);
    glDeleteRenderbuffers(CREAT_NUM_ONE, &rbo);
    glDeleteTextures(CREAT_NUM_ONE, &tex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLInvalidateSubFramebuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint fbo, tex;
    glGenFramebuffers(CREAT_NUM_ONE, &fbo);
    glBindFramebuffer(GL_FRAMEBUFFER, fbo);
    glGenTextures(CREAT_NUM_ONE, &tex);
    glBindTexture(GL_TEXTURE_2D, tex);
    glTexStorage2D(GL_TEXTURE_2D, IMAGE2D_LEVEL_ONE, GL_RGBA8, INIT_WIDTH, INIT_HEIGHT);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, tex, INT_INIT_VAL);
    GLenum attachments[1] = {GL_COLOR_ATTACHMENT0};
    glInvalidateSubFramebuffer(GL_FRAMEBUFFER, COUNT_NUM, attachments, 100, 100, 300, 300);
    GLenum glError = glGetError();

    glDeleteFramebuffers(CREAT_NUM_ONE, &fbo);
    glDeleteTextures(CREAT_NUM_ONE, &tex);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLIsBuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint buffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_SHADER_STORAGE_BUFFER, buffer);
    GLboolean isBuffer = glIsBuffer(buffer);
    if (isBuffer) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    return result;
}

static napi_value GLIsEnabled(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLboolean isEnabled = glIsEnabled(GL_DITHER);
    if (isEnabled) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    destroyGLES();
    return result;
}

static napi_value GLIsEnabledi(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    glEnablei(GL_BLEND, INT_INIT_VAL);
    GLboolean isEnabled = glIsEnabledi(GL_BLEND, INT_INIT_VAL);
    if (isEnabled) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    destroyGLES();
    return result;
}

static napi_value GLIsFramebuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint framebuffer = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    GLboolean isFramebuffer = glIsFramebuffer(framebuffer);
    if (isFramebuffer) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteFramebuffers(CREAT_NUM_ONE, &framebuffer);
    destroyGLES();
    return result;
}

static napi_value GLIsProgram(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint Program = glCreateProgram();
    GLboolean isProgram = glIsProgram(Program);
    if (isProgram) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteProgram(Program);
    destroyGLES();
    return result;
}

static napi_value GLIsProgramPipeline(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint pipeline = INT_INIT_VAL;
    glGenProgramPipelines(PIPELINES_NUM_ONE, &pipeline);
    glBindProgramPipeline(pipeline);
    GLboolean isPipeline = glIsProgramPipeline(pipeline);
    if (isPipeline) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteProgramPipelines(CREAT_NUM_ONE, &pipeline);
    destroyGLES();
    return result;
}

static napi_value GLIsQuery(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint query = INT_INIT_VAL;
    glGenQueries(CREAT_NUM_ONE, &query);
    glBeginQuery(GL_ANY_SAMPLES_PASSED, query);
    GLboolean isQuery = glIsQuery(query);
    if (isQuery) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteQueries(CREAT_NUM_ONE, &query);
    destroyGLES();
    return result;
}

static napi_value GLIsRenderbuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint renderBuffer = INT_INIT_VAL;
    glGenRenderbuffers(CREAT_NUM_ONE, &renderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, renderBuffer);
    GLboolean isRenderbuffer = glIsRenderbuffer(renderBuffer);
    if (isRenderbuffer) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteRenderbuffers(CREAT_NUM_ONE, &renderBuffer);
    destroyGLES();
    return result;
}

static napi_value GLIsSampler(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    GLboolean isSampler = glIsSampler(sampler);
    if (isSampler) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return result;
}

static napi_value GLIsShader(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint shader = glCreateShader(GL_VERTEX_SHADER);
    GLboolean isShader = glIsShader(shader);
    if (isShader) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteSamplers(CREAT_NUM_ONE, &shader);
    destroyGLES();
    return result;
}

static napi_value GLIsSync(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLsync sync = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, INT_INIT_VAL);
    GLboolean isSync = glIsSync(sync);
    if (isSync) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteSync(sync);
    destroyGLES();
    return result;
}

static napi_value GLIsTexture(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    GLboolean isTexture = glIsTexture(texture);
    if (isTexture) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return result;
}

static napi_value GLIsTransformFeedback(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint id = INT_INIT_VAL;
    glGenTransformFeedbacks(CREAT_NUM_ONE, &id);
    glBindTransformFeedback(GL_TRANSFORM_FEEDBACK, id);
    GLboolean isId = glIsTransformFeedback(id);
    if (isId) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteTransformFeedbacks(CREAT_NUM_ONE, &id);
    destroyGLES();
    return result;
}

static napi_value GLIsVertexArray(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint array = INT_INIT_VAL;
    glGenVertexArrays(CREAT_NUM_ONE, &array);
    glBindVertexArray(array);
    GLboolean isArray = glIsVertexArray(array);
    if (isArray) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteVertexArrays(CREAT_NUM_ONE, &array);
    destroyGLES();
    return result;
}

static napi_value GLLineWidth(napi_env env, napi_callback_info info)
{
    initGLES();
    glLineWidth(CLEAR_50);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLLinkProgram(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = glCreateProgram();
    glLinkProgram(program);
    GLenum glError = glGetError();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLMapBufferRange(napi_env env, napi_callback_info info)
{
    initGLES();
    napi_value result = nullptr;
    GLuint buffer = INT_INIT_VAL;
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, GL_BUF_SIZE, nullptr, GL_DYNAMIC_DRAW);
    GLvoid *ptr = glMapBufferRange(GL_ARRAY_BUFFER, INT_INIT_VAL, GL_BUF_SIZE, GL_MAP_WRITE_BIT);
    if (ptr) {
        napi_create_int32(env, SUCCESS, &result);
    } else {
        napi_create_int32(env, FAILED, &result);
    }
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    destroyGLES();
    return result;
}

static napi_value GLMemoryBarrier(napi_env env, napi_callback_info info)
{
    initGLES();
    glMemoryBarrier(GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLMemoryBarrierByRegion(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint framebuffer = INT_INIT_VAL;
    GLuint texture = INT_INIT_VAL;
    glGenFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, framebuffer);
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexStorage2D(GL_TEXTURE_2D, IMAGE2D_LEVEL_ONE, GL_RGBA8, INIT_WIDTH, INIT_HEIGHT);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, texture, INT_INIT_VAL);
    glMemoryBarrierByRegion(GL_FRAMEBUFFER_BARRIER_BIT);
    GLenum glError = glGetError();
    glDeleteFramebuffers(CREAT_NUM_ONE, &framebuffer);
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLMinSampleShading(napi_env env, napi_callback_info info)
{
    initGLES();
    glMinSampleShading(INT_INIT_VAL);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLObjectLabel(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram(vertexShaderSource, fragmentShaderSource);
    char log[] = "My program log";
    glObjectLabel(GL_PROGRAM, program, sizeof(log), log);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLObjectPtrLabel(napi_env env, napi_callback_info info)
{
    initGLES();
    GLsync syncObject = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, INT_INIT_VAL);
    char log[] = "My program log";
    glObjectPtrLabel(syncObject, sizeof(log), log);
    GLenum glError = glGetError();
    glDeleteSync(syncObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLPatchParameteri(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint array;
    glGenVertexArrays(CREAT_NUM_ONE, &array);
    glBindVertexArray(array);
    glPatchParameteri(GL_PATCH_VERTICES, ARRAY_INDEX_THREE);
    GLenum glError = glGetError();
    glDeleteVertexArrays(CREAT_NUM_ONE, &array);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLPauseTransformFeedback(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint array;
    GLuint buffer; 
    GLuint feedbackBuffer;
    GLuint tbBuffer;
    glGenBuffers(CREAT_NUM_ONE, &tbBuffer);
    glGenBuffers(CREAT_NUM_ONE, &feedbackBuffer);
    GLuint program = initProgram(vertexShaderSource, fragmentShaderSource);
    glUseProgram(program);
    GLuint transformFeedback;
    glGenTransformFeedbacks(CREAT_NUM_ONE, &transformFeedback);
    glBindTransformFeedback(GL_TRANSFORM_FEEDBACK, transformFeedback);
    glGenVertexArrays(CREAT_NUM_ONE, &array);
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindVertexArray(array);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);

    glBindBufferBase(GL_TRANSFORM_FEEDBACK_BUFFER, INT_INIT_VAL, feedbackBuffer);
    glEnable(GL_RASTERIZER_DISCARD);
    glBindBufferBase(GL_TRANSFORM_FEEDBACK_BUFFER, INT_INIT_VAL, tbBuffer);
    glTransformFeedbackVaryings(program, VARYING_NUM, (const char*[]){"gl_Position", "vColor"}, GL_SEPARATE_ATTRIBS);
    glLinkProgram(program);
    
    glBeginTransformFeedback(GL_POINTS);
    glPauseTransformFeedback();
    GLenum glError = glGetError();
    
    deleteProgram();
    glDeleteProgram(program);
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    glDeleteBuffers(CREAT_NUM_ONE, &feedbackBuffer);
    glDeleteVertexArrays(CREAT_NUM_ONE, &array);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLPixelStorei(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint texture = INT_INIT_VAL;
    glGenTextures(CREAT_NUM_ONE, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glPixelStorei(GL_UNPACK_ALIGNMENT, CREAT_NUM_ONE);
    GLenum glError = glGetError();
    glDeleteTextures(CREAT_NUM_ONE, &texture);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLPolygonOffset(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_DEPTH_TEST);
    glPolygonOffset(CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLPopDebugGroup(napi_env env, napi_callback_info info)
{
    initGLES();
    glPushDebugGroup(GL_DEBUG_SOURCE_APPLICATION, INT_INIT_VAL, FAILED, "Draw Scene");
    glPopDebugGroup();
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLPrimitiveBoundingBox(napi_env env, napi_callback_info info)
{
    initGLES();
    glPrimitiveBoundingBox(CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramBinary(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = initProgram();
    GLuint programBin = glCreateProgram();
    GLint binaryLength = INT_INIT_VAL;
    glGetProgramiv(program, GL_PROGRAM_BINARY_LENGTH, &binaryLength);
    GLubyte *binary = (GLubyte *)malloc(binaryLength);
    GLenum binaryFormat = INT_INIT_VAL;
    GLsizei length = INT_INIT_VAL;
    glGetProgramBinary(program, binaryLength, &length, &binaryFormat, binary);
    glProgramBinary(programBin, binaryFormat, binary, length);
    GLenum glError = glGetError();
    free(binary);
    deleteProgram();
    glDeleteProgram(program);
    glDeleteProgram(programBin);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramParameteri(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint program = glCreateProgram();
    glProgramParameteri(program, GL_PROGRAM_BINARY_RETRIEVABLE_HINT, GL_TRUE);
    GLenum glError = glGetError();
    glDeleteProgram(program);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform1f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform1f(programObject, uniformLocation, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform1fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat brightness[POINT_LIGHT_COUNT] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glProgramUniform1fv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform1i(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform1i(programObject, uniformLocation, COUNT_NUM);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform1iv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLint brightness[POINT_LIGHT_COUNT] = {COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM};
    glProgramUniform1iv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform1ui(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform1ui(programObject, uniformLocation, COUNT_NUM);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform1uiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLuint brightness[POINT_LIGHT_COUNT] = {COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM};
    glProgramUniform1uiv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform2f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform2f(programObject, uniformLocation, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform2fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat brightness[POINT_LIGHT_COUNT] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glProgramUniform2fv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform2i(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform2i(programObject, uniformLocation, COUNT_NUM, COUNT_NUM);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform2iv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLint brightness[POINT_LIGHT_COUNT] = {COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM};
    glProgramUniform2iv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform2ui(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform2ui(programObject, uniformLocation, COUNT_NUM, COUNT_NUM);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform2uiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLuint brightness[POINT_LIGHT_COUNT] = {COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM};
    glProgramUniform2uiv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform3f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform3f(programObject, uniformLocation, CLEAR_10, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform3fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat brightness[POINT_LIGHT_COUNT] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glProgramUniform3fv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform3i(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform3i(programObject, uniformLocation, COUNT_NUM, COUNT_NUM, COUNT_NUM);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform3iv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLint brightness[POINT_LIGHT_COUNT] = {COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM};
    glProgramUniform3iv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform3ui(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform3ui(programObject, uniformLocation, COUNT_NUM, COUNT_NUM, COUNT_NUM);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform3uiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLuint brightness[POINT_LIGHT_COUNT] = {COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM};
    glProgramUniform3uiv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform4f(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform4f(programObject, uniformLocation, CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform4fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat brightness[POINT_LIGHT_COUNT] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glProgramUniform4fv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform4i(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform4i(programObject, uniformLocation, COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform4iv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLint brightness[POINT_LIGHT_COUNT] = {COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM};
    glProgramUniform4iv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform4ui(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    glProgramUniform4ui(programObject, uniformLocation, COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniform4uiv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLuint brightness[POINT_LIGHT_COUNT] = {COUNT_NUM, COUNT_NUM, COUNT_NUM, COUNT_NUM};
    glProgramUniform4uiv(programObject, uniformLocation, POINT_LIGHT_COUNT, brightness);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniformMatrix2fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat matrix[MATRIX_4] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_10};
    glProgramUniformMatrix2fv(programObject, uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniformMatrix2x3fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat matrix[MATRIX_6] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_10};
    glProgramUniformMatrix2x3fv(programObject, uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniformMatrix2x4fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat matrix[MATRIX_8] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_10};
    glProgramUniformMatrix2x4fv(programObject, uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniformMatrix3fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat matrix[MATRIX_9] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00,
                                CLEAR_10, CLEAR_00, CLEAR_10, CLEAR_10};
    glProgramUniformMatrix3fv(programObject, uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniformMatrix3x2fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat matrix[MATRIX_6] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_10};
    glProgramUniformMatrix3x2fv(programObject, uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniformMatrix3x4fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat matrix[MATRIX_12] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10,
                                 CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00};
    glProgramUniformMatrix3x4fv(programObject, uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniformMatrix4fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat matrix[MATRIX_16] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_00,
                                 CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10};
    glProgramUniformMatrix4fv(programObject, uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniformMatrix4x2fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat matrix[MATRIX_8] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_10, CLEAR_00, CLEAR_10};
    glProgramUniformMatrix4x2fv(programObject, uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLProgramUniformMatrix4x3fv(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint programObject = initProgram();
    GLint uniformLocation = glGetUniformLocation(programObject, "u_brightness");
    GLfloat matrix[MATRIX_12] = {CLEAR_10, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10,
                                 CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_00, CLEAR_10, CLEAR_00};
    glProgramUniformMatrix4x3fv(programObject, uniformLocation, CREAT_NUM_ONE, GL_TRUE, matrix);
    GLenum glError = glGetError();
    deleteProgram();
    glDeleteProgram(programObject);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLPushDebugGroup(napi_env env, napi_callback_info info)
{
    initGLES();
    glEnable(GL_DEBUG_OUTPUT);
    glPushDebugGroup(GL_DEBUG_SOURCE_APPLICATION, CREAT_NUM_ONE, FAILED, "Render Group");
    GLenum glError = glGetError();
    glPopDebugGroup();
    glDisable(GL_DEBUG_OUTPUT);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLReadBuffer(napi_env env, napi_callback_info info)
{
    initGLES();
    glReadBuffer(GL_BACK);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLReadnPixels(napi_env env, napi_callback_info info)
{
    initGLES();
    GLubyte *pixelData = new GLubyte[MATRIX_4 * MATRIX_4 * MATRIX_4];
    glReadnPixels(INT_INIT_VAL, INT_INIT_VAL, MATRIX_4, MATRIX_4, GL_RGBA, GL_UNSIGNED_BYTE,
                  MATRIX_4 * MATRIX_4 * MATRIX_4, pixelData);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLReadPixels(napi_env env, napi_callback_info info)
{
    initGLES();
    GLubyte *pixels = new GLubyte[MATRIX_4 * MATRIX_4 * MATRIX_4];
    glReadPixels(INT_INIT_VAL, INT_INIT_VAL, MATRIX_4, MATRIX_4, GL_RGBA, GL_UNSIGNED_BYTE, pixels);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLReleaseShaderCompiler(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint shader = glCreateShader(GL_VERTEX_SHADER);
    glShaderSource(shader, CREAT_NUM_ONE, &vertexShaderSource, nullptr);
    glCompileShader(shader);
    glReleaseShaderCompiler();
    GLenum glError = glGetError();
    glDeleteShader(shader);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLRenderbufferStorage(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint renderbuffer = INT_INIT_VAL;
    glGenRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, renderbuffer);
    glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH24_STENCIL8, INIT_WIDTH, INIT_WIDTH);
    GLenum glError = glGetError();
    glDeleteRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLRenderbufferStorageMultisample(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint renderbuffer = INT_INIT_VAL;
    glGenRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, renderbuffer);
    glRenderbufferStorageMultisample(GL_RENDERBUFFER, SAMPLES, GL_RGBA8, INIT_WIDTH, INIT_WIDTH);
    GLenum glError = glGetError();
    glDeleteRenderbuffers(CREAT_NUM_ONE, &renderbuffer);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLResumeTransformFeedback(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint array;
    GLuint buffer; 
    GLuint feedbackBuffer;
    GLuint tbBuffer;
    glGenBuffers(CREAT_NUM_ONE, &tbBuffer);
    glGenBuffers(CREAT_NUM_ONE, &feedbackBuffer);
    GLuint program = initProgram(vertexShaderSource, fragmentShaderSource);
    glUseProgram(program);
    GLuint transformFeedback;
    glGenTransformFeedbacks(CREAT_NUM_ONE, &transformFeedback);
    glBindTransformFeedback(GL_TRANSFORM_FEEDBACK, transformFeedback);
    glGenVertexArrays(CREAT_NUM_ONE, &array);
    glGenBuffers(CREAT_NUM_ONE, &buffer);
    glBindVertexArray(array);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);

    glBindBufferBase(GL_TRANSFORM_FEEDBACK_BUFFER, INT_INIT_VAL, feedbackBuffer);
    glEnable(GL_RASTERIZER_DISCARD);
    glBindBufferBase(GL_TRANSFORM_FEEDBACK_BUFFER, INT_INIT_VAL, tbBuffer);
    glTransformFeedbackVaryings(program, VARYING_NUM, (const char*[]){"gl_Position", "vColor"}, GL_SEPARATE_ATTRIBS);
    glLinkProgram(program);
    
    glBeginTransformFeedback(GL_POINTS);
    glPauseTransformFeedback();
    glResumeTransformFeedback();
    GLenum glError = glGetError();
    
    deleteProgram();
    glDeleteProgram(program);
    glDeleteBuffers(CREAT_NUM_ONE, &buffer);
    glDeleteBuffers(CREAT_NUM_ONE, &feedbackBuffer);
    glDeleteVertexArrays(CREAT_NUM_ONE, &array);
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLSampleCoverage(napi_env env, napi_callback_info info)
{
    initGLES();
    glSampleCoverage(CLEAR_10, GL_TRUE);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLSampleMaski(napi_env env, napi_callback_info info)
{
    initGLES();
    glSampleMaski(INT_INIT_VAL, GL_TRIANGLE_STRIP);
    GLenum glError = glGetError();
    destroyGLES();
    return getError(env, glError);
}

static napi_value GLSamplerParameterf(napi_env env, napi_callback_info info)
{
    initGLES();
    GLuint sampler = INT_INIT_VAL;
    glGenSamplers(CREAT_NUM_ONE, &sampler);
    glSamplerParameterf(sampler, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    GLenum glError = glGetError();
    glDeleteSamplers(CREAT_NUM_ONE, &sampler);
    destroyGLES();
    return getError(env, glError);
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
        {"gLActiveShaderProgram", nullptr, GLActiveShaderProgram, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLActiveTexture", nullptr, GLActiveTexture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLAttachShader", nullptr, GLAttachShader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBeginQuery", nullptr, GLBeginQuery, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBeginTransformFeedback", nullptr, GLBeginTransformFeedback, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLBindAttribLocation", nullptr, GLBindAttribLocation, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindBuffer", nullptr, GLBindBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindBufferBase", nullptr, GLBindBufferBase, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindBufferRange", nullptr, GLBindBufferRange, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindFramebuffer", nullptr, GLBindFramebuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindImageTexture", nullptr, GLBindImageTexture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindProgramPipeline", nullptr, GLBindProgramPipeline, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindRenderbuffer", nullptr, GLBindRenderbuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindSampler", nullptr, GLBindSampler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindTexture", nullptr, GLBindTexture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindTransformFeedback", nullptr, GLBindTransformFeedback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindVertexArray", nullptr, GLBindVertexArray, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBindVertexBuffer", nullptr, GLBindVertexBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlendBarrier", nullptr, GLBlendBarrier, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlendColor", nullptr, GLBlendColor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlendEquation", nullptr, GLBlendEquation, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlendEquationi", nullptr, GLBlendEquationi, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlendEquationSeparate", nullptr, GLBlendEquationSeparate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlendEquationSeparatei", nullptr, GLBlendEquationSeparatei, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLBlendFunc", nullptr, GLBlendFunc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlendFunci", nullptr, GLBlendFunci, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlendFuncSeparate", nullptr, GLBlendFuncSeparate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlendFuncSeparatei", nullptr, GLBlendFuncSeparatei, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBlitFramebuffer", nullptr, GLBlitFramebuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBufferData", nullptr, GLBufferData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLBufferSubData", nullptr, GLBufferSubData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCheckFramebufferStatus", nullptr, GLCheckFramebufferStatus, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLClear", nullptr, GLClear, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLClearBufferfi", nullptr, GLClearBufferfi, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLClearBufferfv", nullptr, GLClearBufferfv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLClearBufferiv", nullptr, GLClearBufferiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLClearBufferuiv", nullptr, GLClearBufferuiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLClearColor", nullptr, GLClearColor, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLClearDepthf", nullptr, GLClearDepthf, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLClearStencil", nullptr, GLClearStencil, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLClientWaitSync", nullptr, GLClientWaitSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLColorMask", nullptr, GLColorMask, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLColorMaski", nullptr, GLColorMaski, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCompileShader", nullptr, GLCompileShader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCompressedTexImage2D", nullptr, GLCompressedTexImage2D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCompressedTexImage3D", nullptr, GLCompressedTexImage3D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCompressedTexSubImage2D", nullptr, GLCompressedTexSubImage2D, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLCompressedTexSubImage3D", nullptr, GLCompressedTexSubImage3D, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLCopyBufferSubData", nullptr, GLCopyBufferSubData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCopyImageSubData", nullptr, GLCopyImageSubData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCopyTexImage2D", nullptr, GLCopyTexImage2D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCopyTexSubImage2D", nullptr, GLCopyTexSubImage2D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCopyTexSubImage3D", nullptr, GLCopyTexSubImage3D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCreateProgram", nullptr, GLCreateProgram, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCreateShader", nullptr, GLCreateShader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCreateShaderProgramv", nullptr, GLCreateShaderProgramv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLCullFace", nullptr, GLCullFace, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDebugMessageCallback", nullptr, GLDebugMessageCallback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDebugMessageControl", nullptr, GLDebugMessageControl, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDebugMessageInsert", nullptr, GLDebugMessageInsert, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteBuffers", nullptr, GLDeleteBuffers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteFramebuffers", nullptr, GLDeleteFramebuffers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteProgram", nullptr, GLDeleteProgram, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteProgramPipelines", nullptr, GLDeleteProgramPipelines, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLDeleteQueries", nullptr, GLDeleteQueries, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteRenderbuffers", nullptr, GLDeleteRenderbuffers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteSamplers", nullptr, GLDeleteSamplers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteShader", nullptr, GLDeleteShader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteSync", nullptr, GLDeleteSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteTextures", nullptr, GLDeleteTextures, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDeleteTransformFeedbacks", nullptr, GLDeleteTransformFeedbacks, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLDeleteVertexArrays", nullptr, GLDeleteVertexArrays, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDepthFunc", nullptr, GLDepthFunc, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDepthMask", nullptr, GLDepthMask, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDepthRangef", nullptr, GLDepthRangef, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDetachShader", nullptr, GLDetachShader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDisable", nullptr, GLDisable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDisablei", nullptr, GLDisablei, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDisableVertexAttribArray", nullptr, GLDisableVertexAttribArray, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLDispatchCompute", nullptr, GLDispatchCompute, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDispatchComputeIndirect", nullptr, GLDispatchComputeIndirect, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLDrawArrays", nullptr, GLDrawArrays, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDrawArraysIndirect", nullptr, GLDrawArraysIndirect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDrawArraysInstanced", nullptr, GLDrawArraysInstanced, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDrawBuffers", nullptr, GLDrawBuffers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDrawElements", nullptr, GLDrawElements, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDrawElementsBaseVertex", nullptr, GLDrawElementsBaseVertex, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLDrawElementsIndirect", nullptr, GLDrawElementsIndirect, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDrawElementsInstanced", nullptr, GLDrawElementsInstanced, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDrawElementsInstancedBaseVertex", nullptr, GLDrawElementsInstancedBaseVertex, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gLDrawRangeElements", nullptr, GLDrawRangeElements, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLDrawRangeElementsBaseVertex", nullptr, GLDrawRangeElementsBaseVertex, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gLEnable", nullptr, GLEnable, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLEnablei", nullptr, GLEnablei, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLEnableVertexAttribArray", nullptr, GLEnableVertexAttribArray, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLEndQuery", nullptr, GLEndQuery, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLEndTransformFeedback", nullptr, GLEndTransformFeedback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLFenceSync", nullptr, GLFenceSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLFinish", nullptr, GLFinish, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLFlush", nullptr, GLFlush, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLFlushMappedBufferRange", nullptr, GLFlushMappedBufferRange, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLFramebufferParameteri", nullptr, GLFramebufferParameteri, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLFramebufferRenderbuffer", nullptr, GLFramebufferRenderbuffer, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLFramebufferTexture", nullptr, GLFramebufferTexture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLFramebufferTexture2D", nullptr, GLFramebufferTexture2D, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLFramebufferTextureLayer", nullptr, GLFramebufferTextureLayer, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLFrontFace", nullptr, GLFrontFace, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenBuffers", nullptr, GLGenBuffers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenerateMipmap", nullptr, GLGenerateMipmap, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenFramebuffers", nullptr, GLGenFramebuffers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenProgramPipelines", nullptr, GLGenProgramPipelines, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenQueries", nullptr, GLGenQueries, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenRenderbuffers", nullptr, GLGenRenderbuffers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenSamplers", nullptr, GLGenSamplers, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenTextures", nullptr, GLGenTextures, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenTransformFeedbacks", nullptr, GLGenTransformFeedbacks, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGenVertexArrays", nullptr, GLGenVertexArrays, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetActiveAttrib", nullptr, GLGetActiveAttrib, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetActiveUniform", nullptr, GLGetActiveUniform, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetActiveUniformBlockiv", nullptr, GLGetActiveUniformBlockiv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetActiveUniformBlockName", nullptr, GLGetActiveUniformBlockName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetActiveUniformsiv", nullptr, GLGetActiveUniformsiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetAttachedShaders", nullptr, GLGetAttachedShaders, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetAttribLocation", nullptr, GLGetAttribLocation, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetBooleani_v", nullptr, GLGetBooleani_v, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetBooleanv", nullptr, GLGetBooleanv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetBufferParameteri64v", nullptr, GLGetBufferParameteri64v, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetBufferParameteriv", nullptr, GLGetBufferParameteriv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetBufferPointerv", nullptr, GLGetBufferPointerv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetDebugMessageLog", nullptr, GLGetDebugMessageLog, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetError", nullptr, GLGetError, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetFloatv", nullptr, GLGetFloatv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetFragDataLocation", nullptr, GLGetFragDataLocation, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetFramebufferAttachmentParameteriv", nullptr, GLGetFramebufferAttachmentParameteriv, nullptr, nullptr,
         nullptr, napi_default, nullptr},
        {"gLGetFramebufferParameteriv", nullptr, GLGetFramebufferParameteriv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetGraphicsResetStatus", nullptr, GLGetGraphicsResetStatus, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetInteger64i_v", nullptr, GLGetInteger64i_v, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetInteger64v", nullptr, GLGetInteger64v, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetIntegeri_v", nullptr, GLGetIntegeri_v, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetIntegerv", nullptr, GLGetIntegerv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetInternalformativ", nullptr, GLGetInternalformativ, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetMultisamplefv", nullptr, GLGetMultisamplefv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetnUniformfv", nullptr, GLGetnUniformfv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetnUniformiv", nullptr, GLGetnUniformiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetnUniformuiv", nullptr, GLGetnUniformuiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetObjectLabel", nullptr, GLGetObjectLabel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetObjectPtrLabel", nullptr, GLGetObjectPtrLabel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetPointerv", nullptr, GLGetPointerv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetProgramBinary", nullptr, GLGetProgramBinary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetProgramInfoLog", nullptr, GLGetProgramInfoLog, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetProgramInterfaceiv", nullptr, GLGetProgramInterfaceiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetProgramiv", nullptr, GLGetProgramiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetProgramPipelineInfoLog", nullptr, GLGetProgramPipelineInfoLog, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetProgramPipelineiv", nullptr, GLGetProgramPipelineiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetProgramResourceIndex", nullptr, GLGetProgramResourceIndex, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetProgramResourceiv", nullptr, GLGetProgramResourceiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetProgramResourceLocation", nullptr, GLGetProgramResourceLocation, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetProgramResourceName", nullptr, GLGetProgramResourceName, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetQueryiv", nullptr, GLGetQueryiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetQueryObjectuiv", nullptr, GLGetQueryObjectuiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetRenderbufferParameteriv", nullptr, GLGetRenderbufferParameteriv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetSamplerParameterfv", nullptr, GLGetSamplerParameterfv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetSamplerParameterIiv", nullptr, GLGetSamplerParameterIiv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetSamplerParameterIuiv", nullptr, GLGetSamplerParameterIuiv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetSamplerParameteriv", nullptr, GLGetSamplerParameteriv, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"gLGetShaderInfoLog", nullptr, GLGetShaderInfoLog, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetShaderiv", nullptr, GLGetShaderiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetShaderPrecisionFormat", nullptr, GLGetShaderPrecisionFormat, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetShaderSource", nullptr, GLGetShaderSource, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetString", nullptr, GLGetString, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetStringi", nullptr, GLGetStringi, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetSynciv", nullptr, GLGetSynciv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetTexLevelParameterfv", nullptr, GLGetTexLevelParameterfv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetTexLevelParameteriv", nullptr, GLGetTexLevelParameteriv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLGetTexParameterfv", nullptr, GLGetTexParameterfv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetTexParameterIiv", nullptr, GLGetTexParameterIiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetTexParameterIuiv", nullptr, GLGetTexParameterIuiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetTexParameteriv", nullptr, GLGetTexParameteriv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetTransformFeedbackVarying", nullptr, GLGetTransformFeedbackVarying, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gLGetUniformBlockIndex", nullptr, GLGetUniformBlockIndex, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetUniformfv", nullptr, GLGetUniformfv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetUniformIndices", nullptr, GLGetUniformIndices, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetUniformiv", nullptr, GLGetUniformiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetUniformLocation", nullptr, GLGetUniformLocation, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetUniformuiv", nullptr, GLGetUniformuiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetVertexAttribfv", nullptr, GLGetVertexAttribfv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetVertexAttribIiv", nullptr, GLGetVertexAttribIiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetVertexAttribIuiv", nullptr, GLGetVertexAttribIuiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetVertexAttribiv", nullptr, GLGetVertexAttribiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLGetVertexAttribPointerv", nullptr, GLGetVertexAttribPointerv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLHint", nullptr, GLHint, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLInvalidateFramebuffer", nullptr, GLInvalidateFramebuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLInvalidateSubFramebuffer", nullptr, GLInvalidateSubFramebuffer, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLIsBuffer", nullptr, GLIsBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsEnabled", nullptr, GLIsEnabled, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsEnabledi", nullptr, GLIsEnabledi, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsFramebuffer", nullptr, GLIsFramebuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsProgram", nullptr, GLIsProgram, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsProgramPipeline", nullptr, GLIsProgramPipeline, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsQuery", nullptr, GLIsQuery, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsRenderbuffer", nullptr, GLIsRenderbuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsSampler", nullptr, GLIsSampler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsShader", nullptr, GLIsShader, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsSync", nullptr, GLIsSync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsTexture", nullptr, GLIsTexture, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsTransformFeedback", nullptr, GLIsTransformFeedback, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLIsVertexArray", nullptr, GLIsVertexArray, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLLineWidth", nullptr, GLLineWidth, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLLinkProgram", nullptr, GLLinkProgram, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLMapBufferRange", nullptr, GLMapBufferRange, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLMemoryBarrier", nullptr, GLMemoryBarrier, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLMemoryBarrierByRegion", nullptr, GLMemoryBarrierByRegion, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLMinSampleShading", nullptr, GLMinSampleShading, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLObjectLabel", nullptr, GLObjectLabel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLObjectPtrLabel", nullptr, GLObjectPtrLabel, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLPatchParameteri", nullptr, GLPatchParameteri, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLPauseTransformFeedback", nullptr, GLPauseTransformFeedback, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLPixelStorei", nullptr, GLPixelStorei, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLPolygonOffset", nullptr, GLPolygonOffset, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLPopDebugGroup", nullptr, GLPopDebugGroup, nullptr, nullptr, nullptr, napi_default, nullptr},

        {"gLPrimitiveBoundingBox", nullptr, GLPrimitiveBoundingBox, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramBinary", nullptr, GLProgramBinary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramParameteri", nullptr, GLProgramParameteri, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform1f", nullptr, GLProgramUniform1f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform1fv", nullptr, GLProgramUniform1fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform1i", nullptr, GLProgramUniform1i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform1iv", nullptr, GLProgramUniform1iv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform1ui", nullptr, GLProgramUniform1ui, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform1uiv", nullptr, GLProgramUniform1uiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform2f", nullptr, GLProgramUniform2f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform2fv", nullptr, GLProgramUniform2fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform2i", nullptr, GLProgramUniform2i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform2iv", nullptr, GLProgramUniform2iv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform2ui", nullptr, GLProgramUniform2ui, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform2uiv", nullptr, GLProgramUniform2uiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform3f", nullptr, GLProgramUniform3f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform3fv", nullptr, GLProgramUniform3fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform3i", nullptr, GLProgramUniform3i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform3iv", nullptr, GLProgramUniform3iv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform3ui", nullptr, GLProgramUniform3ui, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform3uiv", nullptr, GLProgramUniform3uiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform4f", nullptr, GLProgramUniform4f, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform4fv", nullptr, GLProgramUniform4fv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform4i", nullptr, GLProgramUniform4i, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform4iv", nullptr, GLProgramUniform4iv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform4ui", nullptr, GLProgramUniform4ui, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniform4uiv", nullptr, GLProgramUniform4uiv, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLProgramUniformMatrix2fv", nullptr, GLProgramUniformMatrix2fv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLProgramUniformMatrix2x3fv", nullptr, GLProgramUniformMatrix2x3fv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLProgramUniformMatrix2x4fv", nullptr, GLProgramUniformMatrix2x4fv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLProgramUniformMatrix3fv", nullptr, GLProgramUniformMatrix3fv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLProgramUniformMatrix3x2fv", nullptr, GLProgramUniformMatrix3x2fv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLProgramUniformMatrix3x4fv", nullptr, GLProgramUniformMatrix3x4fv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLProgramUniformMatrix4fv", nullptr, GLProgramUniformMatrix4fv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLProgramUniformMatrix4x2fv", nullptr, GLProgramUniformMatrix4x2fv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLProgramUniformMatrix4x3fv", nullptr, GLProgramUniformMatrix4x3fv, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLPushDebugGroup", nullptr, GLPushDebugGroup, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLReadBuffer", nullptr, GLReadBuffer, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLReadnPixels", nullptr, GLReadnPixels, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLReadPixels", nullptr, GLReadPixels, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLReleaseShaderCompiler", nullptr, GLReleaseShaderCompiler, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLRenderbufferStorage", nullptr, GLRenderbufferStorage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLRenderbufferStorageMultisample", nullptr, GLRenderbufferStorageMultisample, nullptr, nullptr, nullptr,
         napi_default, nullptr},
        {"gLResumeTransformFeedback", nullptr, GLResumeTransformFeedback, nullptr, nullptr, nullptr, napi_default,
         nullptr},
        {"gLSampleCoverage", nullptr, GLSampleCoverage, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLSampleMaski", nullptr, GLSampleMaski, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"gLSamplerParameterf", nullptr, GLSamplerParameterf, nullptr, nullptr, nullptr, napi_default, nullptr},
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
