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

#include "Gl4ApiTest.h"
#include <hilog/log.h>
#undef LOG_DOMAIN
#define LOG_DOMAIN 0xD003200
#ifndef LOGI
#define LOGI(FMT, VARS...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, "GL4_LOG", FMT, ##VARS))
#endif

#define INT_INIT_VAL 0
#define CLEAR_10 1.0f
#define CREAT_NUM_ONE 1
bool Gl4ApiTest::InitContext(void* window)
{
    LOGI("InitContext");
    eglWindow = static_cast<EGLNativeWindowType>(window);
    eglDisplay = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    if (eglDisplay == EGL_NO_DISPLAY) {
        LOGI("eglGetDisplay: unable to get EGL display");
        return false;
    }
    EGLint majorVersion = 0;
    EGLint minorVersion = 0;
    if (!eglInitialize(eglDisplay, &majorVersion, &minorVersion)) {
        LOGI("eglInitialize: unable to get initialize EGL display");
        return false;
    }
    eglBindAPI(EGL_OPENGL_API);
    const char *eglVendor = eglQueryString(eglDisplay, EGL_VENDOR);
    if (eglVendor != nullptr) {
        LOGI("egl vendor %{public}s", eglVendor);
    }
    return true;
}

void Gl4ApiTest::Release()
{
    LOGI("Release");
    if (eglDisplay != EGL_NO_DISPLAY) {
        eglTerminate(eglDisplay);
        eglDisplay = EGL_NO_DISPLAY;
    }
    eglWindow = nullptr;
}

GLenum Gl4ApiTest::GLTextureARBAbnormal()
{
    glActiveTextureARB(GL_TEXTURE0);
    return glGetError();
}

GLenum Gl4ApiTest::GLBufferARBAbnormal()
{
    GLuint vbo = INT_INIT_VAL;
    glGenBuffersARB(CREAT_NUM_ONE, &vbo);
    glBindBufferARB(GL_ARRAY_BUFFER, vbo);
    GLfloat vertices[] = {CLEAR_10, CLEAR_10, CLEAR_10, CLEAR_10};
    glBufferDataARB(GL_ARRAY_BUFFER, sizeof(vertices), vertices, GL_STATIC_DRAW);
    glBufferSubDataARB(GL_ZERO, FAILED, FAILED, nullptr);
    glDrawBuffersARB(FAILED, nullptr);
    glGetBufferSubDataARB(GL_ZERO, FAILED, FAILED, nullptr);
    glDeleteBuffersARB(CREAT_NUM_ONE, &vbo);
    return glGetError();
}

GLenum Gl4ApiTest::GLUniformARBAbnormal()
{
    glUniform1fvARB(GL_ZERO, FAILED, nullptr);
    glUniform1iARB(GL_ZERO, GL_ZERO);
    glUniform1ivARB(GL_ZERO, FAILED, nullptr);
    glUniform2fvARB(GL_ZERO, FAILED, nullptr);
    glUniform2ivARB(GL_ZERO, FAILED, nullptr);
    glUniform3fvARB(GL_ZERO, FAILED, nullptr);
    glUniform3ivARB(GL_ZERO, FAILED, nullptr);
    glUniform4fvARB(GL_ZERO, FAILED, nullptr);
    glUniform4ivARB(GL_ZERO, FAILED, nullptr);
    return glGetError();
}

GLenum Gl4ApiTest::GLUniformMatrixARBAbnormal()
{
    glUniformMatrix2fvARB(GL_ZERO, FAILED, GL_TRUE, nullptr);
    glUniformMatrix3fvARB(GL_ZERO, FAILED, GL_TRUE, nullptr);
    glUniformMatrix4fvARB(GL_ZERO, FAILED, GL_TRUE, nullptr);
    return glGetError();
}
