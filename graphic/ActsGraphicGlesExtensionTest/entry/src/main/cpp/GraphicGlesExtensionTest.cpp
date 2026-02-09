/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "include/GraphicGlesExtensionTest.h"
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <EGL/eglplatform.h>
#include <GLES3/gl3.h>
#include <GLES3/gl32.h>
#include <iostream>
#include <map>
#include <vector>
#include "cstring"
#include "hilog/log.h"
#include "string"

#undef LOG_DOMAIN
#define LOG_DOMAIN 0xD003200

using namespace std;

namespace OHOS {
namespace Rosen {
int OH_GLES_Extension001Test()
{
    OH_LOG_ERROR(LOG_APP, "OH_GLES_Extension001Test start");
    EGLDisplay display;
    EGLConfig config;
    EGLContext context;
    EGLSurface surfaceCache;
    EGLint majorVersion;
    EGLint minorVersion;
    EGLint numConfigs;
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    EGLint attribs[] = {
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT, EGL_BLUE_SIZE, 8, EGL_GREEN_SIZE, 8, EGL_RED_SIZE, 8, EGL_NONE
    };
    eglChooseConfig(display, attribs, &config, 1, &numConfigs);
    context = eglCreateContext(display, config, EGL_NO_CONTEXT, NULL);
    surfaceCache = eglCreatePbufferSurface(display, config, NULL);
    eglMakeCurrent(display, surfaceCache, surfaceCache, context);
    char* strTest = new char[1024];
    strTest = (char*)glGetString(GL_VERSION);
    string strTest2(strTest);
    vector<string> vv;
    string my = "";
    strTest2 = strTest2 + ' ';
    for (int i = 0; i < strTest2.size() - 1; i++) {
        if (strTest2[i + 1] == ' ') {
            vv.push_back(my);
            my = "";
        } else {
            my += strTest2[i];
        }
    }
    map<string, string> myMap;
    myMap["glBufferPageCommitmentMemNV"] = "GL_NV_memory_object_sparse";
    myMap["glCreateSemaphoresNV"] = "GL_NV_timeline_semaphore";
    myMap["glExtrapolateTex2DQCOM"] = "GL_QCOM_frame_extrapolation";
    bool isHave1 = strTest2.find("GL_NV_memory_object_sparse") != -1 ? true : false;
    bool isHave2 = strTest2.find("GL_NV_timeline_semaphore") != -1 ? true : false;
    bool isHave3 = strTest2.find("GL_QCOM_frame_extrapolation") != -1 ? true : false;
    if (isHave1 || isHave2 || isHave3) {
        return -1;
    }
    return 0;
}

int OH_GLES_Extension002Test()
{
    EGLDisplay display;
    EGLConfig config;
    EGLContext context;
    EGLSurface surfaceCache;
    EGLint majorVersion;
    EGLint minorVersion;
    EGLint numConfigs;
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    EGLint attribs[] = {
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT, EGL_BLUE_SIZE, 8, EGL_GREEN_SIZE, 8, EGL_RED_SIZE, 8, EGL_NONE
    };
    eglChooseConfig(display, attribs, &config, 1, &numConfigs);
    context = eglCreateContext(display, config, EGL_NO_CONTEXT, NULL);
    surfaceCache = eglCreatePbufferSurface(display, config, NULL);
    eglMakeCurrent(display, surfaceCache, surfaceCache, context);
    char* strTest = new char[1024];
    strTest = (char*)glGetString(GL_VERSION);
    string strTest2(strTest);
    vector<string> vv;
    string my = "";
    strTest2 = strTest2 + ' ';
    for (int i = 0; i < strTest2.size() - 1; i++) {
        if (strTest2[i + 1] == ' ') {
            vv.push_back(my);
            my = "";
        } else {
            my += strTest2[i];
        }
    }
    map<string, string> myMap;
    myMap["glFramebufferParameteriMESA"] = "GL_MESA_framebuffer_flip_y";
    myMap["glGetFramebufferParameterivMESA"] = "GL_MESA_framebuffer_flip_y";
    myMap["glGetSemaphoreParameterivNV"] = "GL_NV_timeline_semaphore";
    bool isHave1 = strTest2.find("GL_MESA_framebuffer_flip_y") != -1 ? true : false;
    bool isHave2 = strTest2.find("GL_MESA_framebuffer_flip_y") != -1 ? true : false;
    bool isHave3 = strTest2.find("GL_NV_timeline_semaphore") != -1 ? true : false;
    if (isHave1 || isHave2 || isHave3) {
        return -1;
    }
    return 0;
}

int OH_GLES_Extension003Test()
{
    EGLDisplay display;
    EGLConfig config;
    EGLContext context;
    EGLSurface surfaceCache;
    EGLint majorVersion;
    EGLint minorVersion;
    EGLint numConfigs;
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    EGLint attribs[] = {
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT, EGL_BLUE_SIZE, 8, EGL_GREEN_SIZE, 8, EGL_RED_SIZE, 8, EGL_NONE
    };
    eglChooseConfig(display, attribs, &config, 1, &numConfigs);
    context = eglCreateContext(display, config, EGL_NO_CONTEXT, NULL);
    surfaceCache = eglCreatePbufferSurface(display, config, NULL);
    eglMakeCurrent(display, surfaceCache, surfaceCache, context);
    char* strTest = new char[1024];
    strTest = (char*)glGetString(GL_VERSION);
    string strTest2(strTest);
    vector<string> vv;
    string my = "";
    strTest2 = strTest2 + ' ';
    for (int i = 0; i < strTest2.size() - 1; i++) {
        if (strTest2[i + 1] == ' ') {
            vv.push_back(my);
            my = "";
        } else {
            my += strTest2[i];
        }
    }
    map<string, string> myMap;
    myMap["glNamedBufferPageCommitmentMemNV"] = "GL_NV_memory_object_sparse";
    myMap["glSemaphoreParameterivNV"] = "GL_NV_timeline_semaphore";
    myMap["glShadingRateQCOM"] = "GL_QCOM_shading_rate";
    bool isHave1 = strTest2.find("GL_NV_memory_object_sparse") != -1 ? true : false;
    bool isHave2 = strTest2.find("GL_NV_timeline_semaphore") != -1 ? true : false;
    bool isHave3 = strTest2.find("GL_QCOM_shading_rate") != -1 ? true : false;
    if (isHave1 || isHave2 || isHave3) {
        return -1;
    }
    return 0;
}

int OH_GLES_Extension004Test()
{
    EGLDisplay display;
    EGLConfig config;
    EGLContext context;
    EGLSurface surfaceCache;
    EGLint majorVersion;
    EGLint minorVersion;
    EGLint numConfigs;
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    EGLint attribs[] = {
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT, EGL_BLUE_SIZE, 8, EGL_GREEN_SIZE, 8, EGL_RED_SIZE, 8, EGL_NONE
    };
    eglChooseConfig(display, attribs, &config, 1, &numConfigs);
    context = eglCreateContext(display, config, EGL_NO_CONTEXT, NULL);
    surfaceCache = eglCreatePbufferSurface(display, config, NULL);
    eglMakeCurrent(display, surfaceCache, surfaceCache, context);
    char* strTest = new char[1024];
    strTest = (char*)glGetString(GL_VERSION);
    string strTest2(strTest);
    vector<string> vv;
    string my = "";
    strTest2 = strTest2 + ' ';
    for (int i = 0; i < strTest2.size() - 1; i++) {
        if (strTest2[i + 1] == ' ') {
            vv.push_back(my);
            my = "";
        } else {
            my += strTest2[i];
        }
    }
    map<string, string> myMap;
    myMap["glTexEstimateMotionQCOM"] = "GL_QCOM_motion_estimation";
    myMap["glTexEstimateMotionRegionsQCOM"] = "GL_QCOM_motion_estimation";
    myMap["glTexPageCommitmentMemNV"] = "GL_NV_memory_object_sparse";
    bool isHave1 = strTest2.find("GL_QCOM_motion_estimation") != -1 ? true : false;
    bool isHave2 = strTest2.find("GL_NV_memory_object_sparse") != -1 ? true : false;
    bool isHave3 = strTest2.find("GL_NV_memory_object_sparse") != -1 ? true : false;
    if (isHave1 || isHave2 || isHave3) {
        return -1;
    }
    return 0;
}

int OH_GLES_Extension005Test()
{
    EGLDisplay display;
    EGLConfig config;
    EGLContext context;
    EGLSurface surfaceCache;
    EGLint majorVersion;
    EGLint minorVersion;
    EGLint numConfigs;
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    display = eglGetDisplay(EGL_DEFAULT_DISPLAY);
    eglInitialize(display, &majorVersion, &minorVersion);
    EGLint attribs[] = {
        EGL_RENDERABLE_TYPE, EGL_OPENGL_ES2_BIT, EGL_BLUE_SIZE, 8, EGL_GREEN_SIZE, 8, EGL_RED_SIZE, 8, EGL_NONE
    };
    eglChooseConfig(display, attribs, &config, 1, &numConfigs);
    context = eglCreateContext(display, config, EGL_NO_CONTEXT, NULL);
    surfaceCache = eglCreatePbufferSurface(display, config, NULL);
    eglMakeCurrent(display, surfaceCache, surfaceCache, context);
    char* strTest = new char[1024];
    strTest = (char*)glGetString(GL_VERSION);
    string strTest2(strTest);
    vector<string> vv;
    string my = "";
    strTest2 = strTest2 + ' ';
    for (int i = 0; i < strTest2.size() - 1; i++) {
        if (strTest2[i + 1] == ' ') {
            vv.push_back(my);
            my = "";
        } else {
            my += strTest2[i];
        }
    }
    map<string, string> myMap;
    myMap["glTexturePageCommitmentMemNV"] = "GL_NV_memory_object_sparse";
    myMap["TexStorageAttribs2DEXT"] = "GL_EXT_texture_storage_compression";
    myMap["TexStorageAttribs3DEXT"] = "GL_EXT_texture_storage_compression";
    bool isHave1 = strTest2.find("GL_EXT_texture_storage_compression") != -1 ? true : false;
    bool isHave2 = strTest2.find("GL_EXT_texture_storage_compression") != -1 ? true : false;
    bool isHave3 = strTest2.find("GL_QCOM_motion_estimation") != -1 ? true : false;
    if (isHave1 || isHave2 || isHave3) {
        return -1;
    }
    return 0;
}
} // namespace Rosen
} // namespace OHOS