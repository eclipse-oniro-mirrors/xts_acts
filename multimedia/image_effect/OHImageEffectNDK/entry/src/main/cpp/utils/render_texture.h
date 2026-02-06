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

#ifndef RENDER_TEXTURE_H
#define RENDER_TEXTURE_H

#include "gl_utils.h"

class RenderTexture {
public:
    RenderTexture(GLsizei w, GLsizei h, GLenum interFmt = GL_RGBA8)
    {
        internalFormat_ = interFmt;
        width_ = w;
        height_ = h;
    }

    ~RenderTexture()
    {
        Release();
    }

    bool IsReady() const
    {
        return isReady_;
    }

    void SetReady(bool flag)
    {
        isReady_ = flag;
    }

    unsigned int Width()
    {
        return width_;
    }

    unsigned int Height()
    {
        return height_;
    }

    GLenum Format()
    {
        return internalFormat_;
    }

    void SetName(unsigned int name)
    {
        name_ = name;
    }

    unsigned int GetName()
    {
        return name_;
    }

    bool Init()
    {
        if (!IsReady()) {
            name_ = GLUtils::CreateTexture2D(width_, height_, 1, internalFormat_);
            SetReady(true);
        }
        return true;
    }

    bool Release()
    {
        GLUtils::DeleteTexture(name_);
        name_ = GL_ZERO;
        width_ = 0;
        height_ = 0;
        SetReady(false);
        return true;
    }

private:
    GLuint name_{ GL_ZERO };
    GLsizei width_{ 0 };
    GLsizei height_{ 0 };
    GLenum internalFormat_;
    bool isReady_ = false;
};
#endif