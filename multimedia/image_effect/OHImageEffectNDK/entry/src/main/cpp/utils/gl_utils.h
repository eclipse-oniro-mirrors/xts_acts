/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

#ifndef OHIMAGEEFFECTNDK_GL_UTILS_H
#define OHIMAGEEFFECTNDK_GL_UTILS_H

#include <cstdio>
#include <cstdlib>
#include <string>
#include <GLES3/gl3.h>

class GLUtils {
public:
    static GLuint CreateTexture2D(int width, int height, int levels, GLenum internalFormat);
    static void DeleteTexture(unsigned int textureId);
};
#endif // OHIMAGEEFFECTNDK_GL_UTILS_H