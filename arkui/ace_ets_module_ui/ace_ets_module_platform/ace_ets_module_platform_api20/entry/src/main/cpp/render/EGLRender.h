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

#ifndef XCOMPONENTDEMOBASE_EGL_H
#define XCOMPONENTDEMOBASE_EGL_H
#include <native_window/external_window.h>
#include "EGLConst.h"
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <GLES3/gl3.h>
#include <mutex>
#include <ace/xcomponent/native_interface_xcomponent.h>

class EGLRender {
public:
    
    void SetUpEGLContext(void* window, int64_t surface_id=0);

    void SetEGLWindowSize(int width, int height);

    void DrawBackground(const GLfloat* color);

    void DrawStar();
    
    void DrawOnFrame();
    
    int64_t surface_id;
    std::string xcomponentId;
    EGLNativeWindowType eglWindow_;

    EGLDisplay eglDisplay_ = EGL_NO_DISPLAY;
    EGLConfig eglConfig_ = EGL_NO_CONFIG_KHR;
    EGLSurface eglSurface_ = EGL_NO_SURFACE;
    EGLContext eglContext_ = EGL_NO_CONTEXT;
    GLuint program_;
    bool flag_ = false;
    int width_ = 0;
    int height_ = 0;
    GLfloat widthPercent_;
    GLuint shader_vertex_position;
    ~EGLRender();
    OH_NativeXComponent_Callback renderCallback_;
    OH_NativeXComponent_ExpectedRateRange renderFrameRate_;

private:
    int frameCnt = 0;
    void createStar();
    
    void createStarColor();
    
    void drawTriangleFanColor(const GLfloat* color, const GLfloat shapeVertices[], uint32_t length);
    
    void drawTriangles(const GLfloat* color, const GLfloat shapeVertices[], uint32_t length);
    
    void drawTriangleFan(const GLfloat shapeVertices[], uint32_t length);
    
    void drawLine(const GLfloat* color, const GLfloat lneVertices[], uint32_t length);
};

#endif //XCOMPONENTDEMOBASE_EGL_H