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

#ifndef GL4_API_TEST_H
#define GL4_API_TEST_H
#include <EGL/egl.h>
#include <EGL/eglext.h>
#include <EGL/eglplatform.h>
#include <GL/gl.h>
#include <GL/glext.h>
#include <GL/glcorearb.h>

#define SUCCESS 0
#define FAILED (-1)
class Gl4ApiTest {
public:
    bool InitContext(void* window);
    void Release();

    GLenum GLTextureARBAbnormal();
    GLenum GLBufferARBAbnormal();
    GLenum GLUniformARBAbnormal();
    GLenum GLUniformMatrixARBAbnormal();

private:
    EGLNativeWindowType eglWindow = nullptr;
    EGLDisplay eglDisplay = EGL_NO_DISPLAY;
};
#endif
