/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

// Created on 2024/12/2.
// Node APIs are not fully supported. To solve the compilation error of the interface cannot be found,
// please include "napi/native_api.h".

#include "EGLRender.h"
#include "EGLConst.h"
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl3.h>
#include <cmath>
#include <cstdio>
#include <algorithm>
#include <hilog/log.h>
#include <iostream>

GLuint LoadShader(GLenum type, const char* shaderSrc)
{
    GLuint shader = glCreateShader(type);
    glShaderSource(shader, 1, &shaderSrc, nullptr);
    glCompileShader(shader);
    return shader;
}

GLuint createShaderProgram(const char* vertexShader, const char* fragShader)
{
    if ((vertexShader == nullptr) || (fragShader == nullptr)) {
        return 0;
    }
    GLuint vertex = LoadShader(GL_VERTEX_SHADER, vertexShader);
    GLuint fragment = LoadShader(GL_FRAGMENT_SHADER, fragShader);
    GLuint program = glCreateProgram();
    
    // The gl function has no return value.
    glAttachShader(program, vertex);
    glAttachShader(program, fragment);
    glLinkProgram(program);
    
    return program;
}

void EGLRender::createStar() 
{
    starVertices.clear();
    float ratio = 1.f * height_ / width_;
    float inner = 0.3;
    constexpr float outer = 0.95f;
    constexpr GLfloat CenterX = 0.f;
    constexpr GLfloat CenterY = 0.f;
    constexpr float pentaAngle = 2. * PI / 5.f;
    for (int i = 0; i < 5; ++i) {
        starVertices.push_back(CenterX);
        starVertices.push_back(CenterY);
        starVertices.push_back(inner * cosf(-PI * 0.5f - pentaAngle * 2.f - pentaAngle * i) * ratio);
        starVertices.push_back(inner * sinf(-PI * 0.5f - pentaAngle * 2.f - pentaAngle * i));
        starVertices.push_back(outer * cosf(PI * 0.5f - pentaAngle * i) * ratio);
        starVertices.push_back(outer * sinf(PI * 0.5f - pentaAngle * i));
        starVertices.push_back(inner * cosf(-PI * 0.5f - pentaAngle * 3.f - pentaAngle * i) * ratio);
        starVertices.push_back(inner * sinf(-PI * 0.5f - pentaAngle * 3.f - pentaAngle * i));
    }
}

void EGLRender::createStarColor()
{
    starColors.clear();
    constexpr float inner = 0.5f;
    constexpr float outer = 2.f;
    constexpr GLfloat CenterX = 0.f;
    constexpr GLfloat CenterY = 0.f;
    constexpr float pentaAngle = 2. * PI / 5.f;
    for (int i = 0; i < 5; ++i) {
        starColors.push_back(251.0f / 255);
        starColors.push_back(126.0f / 255);
        starColors.push_back(126.0f / 255);
        starColors.push_back(88.0f / 255);
        starColors.push_back(50.0f / 255);
        starColors.push_back(50.0f / 255);
        starColors.push_back(251.0f / 255);
        starColors.push_back(126.0f / 255);
        starColors.push_back(126.0f / 255);
        starColors.push_back(88.0f / 255);
        starColors.push_back(50.0f / 255);
        starColors.push_back(50.0f / 255);
    }
}

void EGLRender::SetUpEGLContext(void* window, int64_t surface_id)
{
    this->surface_id = surface_id;
    eglWindow_ = (EGLNativeWindowType)(window);
    eglDisplay_ = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    EGLint majorVersion;
    EGLint minorVersion;
    eglInitialize(eglDisplay_, &majorVersion, &minorVersion);
    const EGLint maxConfigSize = 1;
    EGLint numConfigs;
    eglChooseConfig(eglDisplay_, ATTRIB_LIST, &eglConfig_, maxConfigSize, &numConfigs);
    eglSurface_ = eglCreateWindowSurface(eglDisplay_, eglConfig_, eglWindow_, NULL);
    eglContext_ = eglCreateContext(eglDisplay_, eglConfig_, EGL_NO_CONTEXT, CONTEXT_ATTRIBS);
    eglMakeCurrent(eglDisplay_, eglSurface_, eglSurface_, eglContext_);
    program_ = createShaderProgram(VERTEX_SHADER, FRAGMENT_SHADER);
    glUseProgram(program_);
    shader_vertex_position = glGetAttribLocation(program_, "a_position");
    createStarColor();
}

void EGLRender::SetEGLWindowSize(int width, int height)
{
    width_ = width;
    height_ = height;
    createStar();
}

void EGLRender::drawTriangleFan(const GLfloat shapeVertices[], uint32_t length)
{
    glVertexAttribPointer(shader_vertex_position, 2, GL_FLOAT, GL_FALSE, 0, shapeVertices);
    glEnableVertexAttribArray(shader_vertex_position);
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 0, starColors.data());
    glEnableVertexAttribArray(1);
    glDrawArrays(GL_TRIANGLE_FAN, 0, length / 2);
    glDisableVertexAttribArray(shader_vertex_position);
    glDisableVertexAttribArray(1);
}

void EGLRender::drawTriangleFanColor(const GLfloat* color, const GLfloat shapeVertices[], uint32_t length)
{
    glVertexAttribPointer(shader_vertex_position, 2, GL_FLOAT, GL_FALSE, 0, shapeVertices);
    glEnableVertexAttribArray(shader_vertex_position);
    glVertexAttrib4fv(1, color);
    glDrawArrays(GL_TRIANGLE_FAN, 0, length / 2);
    glDisableVertexAttribArray(shader_vertex_position);
}

void EGLRender::drawTriangles(const GLfloat* color, const GLfloat shapeVertices[], uint32_t length)
{
    glVertexAttribPointer(shader_vertex_position, 2, GL_FLOAT, GL_FALSE, 0, shapeVertices);
    glEnableVertexAttribArray(shader_vertex_position);
    glVertexAttrib4fv(1, color);
    glDrawArrays(GL_TRIANGLES, 0, length / 2);
    glDisableVertexAttribArray(shader_vertex_position);
}

void EGLRender::DrawBackground(const GLfloat* color)
{
    eglMakeCurrent(eglDisplay_, eglSurface_, eglSurface_, eglContext_);
    glViewport(0, 0, width_, height_);
    glClearColor(0.9, 0.9, 0.9, 1);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glUseProgram(program_);
    drawTriangles(color, screenTriangle, 12);
    glFlush();
    glFinish();
    eglSwapBuffers(eglDisplay_, eglSurface_);
}

void EGLRender::drawLine(const GLfloat* color, const GLfloat lneVertices[], uint32_t length)
{
    glVertexAttribPointer(shader_vertex_position, 2, GL_FLOAT, GL_FALSE, 0, lneVertices);
    glEnableVertexAttribArray(shader_vertex_position);
    glVertexAttrib4fv(1, color);
    glLineWidth(20);
    glDrawArrays(GL_LINES, 0, length / 2);
    glDisableVertexAttribArray(shader_vertex_position);
}

void EGLRender::DrawOnFrame()
{
    frameCnt += 1;
    frameCnt %= 100;
    eglMakeCurrent(eglDisplay_, eglSurface_, eglSurface_, eglContext_);
    glViewport(frameCnt * 10, 0, width_, height_);
    glClearColor(0.9, 0.9, 0.9, 1);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glUseProgram(program_);
    const GLfloat red[] = {1, 0, 0, 1.0f};
        GLfloat linePoint[] = {
        -1.0f , -1.0, -1.0f, 1.0f
    };
    drawLine(red, linePoint, 4);
    glFlush();
    glFinish();
    eglSwapBuffers(eglDisplay_, eglSurface_);
}

void EGLRender::DrawStar()
{
    eglMakeCurrent(eglDisplay_, eglSurface_, eglSurface_, eglContext_);
    glViewport(0, 0, width_, height_);
    glClearColor(0.9, 0.9, 0.9, 1);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glUseProgram(program_);
    const GLfloat color[] = {126.0f / 255, 143.0f / 255, 251.0f / 255, 1.0f};
    drawTriangleFan(starVertices.data(), starVertices.size());
    glFlush();
    glFinish();
    float ratio = 0.5 * height_ / width_ ;
    GLfloat corners[24] = {
        1.0, -1.0, 1.f - ratio, -1.0, 1.0, -0.5,
        -1., 1., -1.f + ratio, 1., -1., 0.5,
        1., 1., 1., 0.5, 1.f - ratio, 1.,
        -1., -1., -1.f + ratio, -1., -1., -0.5
    };
    drawTriangles(color, corners, 24);
    glFlush();
    glFinish();
    auto ret = eglSwapBuffers(eglDisplay_, eglSurface_);
}

EGLRender::~EGLRender()
{
    if ((eglDisplay_ == nullptr) || (eglSurface_ == nullptr) || (!eglDestroySurface(eglDisplay_, eglSurface_))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "EGLCore", "Release eglDestroySurface failed");
    }

    if ((eglDisplay_ == nullptr) || (eglContext_ == nullptr) || (!eglDestroyContext(eglDisplay_, eglContext_))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "EGLCore", "Release eglDestroySurface failed");
    }

    if ((eglDisplay_ == nullptr) || (!eglTerminate(eglDisplay_))) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, 0xff00, "EGLCore", "Release eglDestroySurface failed");
    }
}