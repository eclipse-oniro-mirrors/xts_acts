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

#include "ErrorCodeWindowTest.h"
#include <cstdint>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <native_window/graphic_error_code.h>
#include <native_buffer/native_buffer.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <GLES3/gl3.h>
#include <native_image/native_image.h>

void addErrorCodeWindowTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"OHDrawingBufferErrorCodeWindowOK", nullptr, OH_Drawing_BufferErrorCodeWindowOK,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHNativeErrorCodeWindowBufferInvalid", nullptr, OH_OHNativeErrorCodeWindowBufferInvalid,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHNativeErrorCodeWindowNoBuffer", nullptr, OH_OHNativeErrorCodeWindowNoBuffer,
        nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHNativeWindow_ErrCodeBUFFER_STATE_INVALID", nullptr,
        OH_NativeWindow_ErrCodeBUFFER_STATE_INVALID, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"OHErrorCodeWindowInvalid", nullptr, OH_ErrorCodeWindowInvalid,
        nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value OH_Drawing_BufferErrorCodeWindowOK(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeBuffer_Planes outPlanes;
    OH_NativeBuffer_Config config = {
        .width = 0x100,
        .height = 0x100,
        .format = 12,
        .usage = (1ULL << 0) | (1ULL << 1) |  (1ULL << 3),
    };
    OH_NativeBuffer* buffer = OH_NativeBuffer_Alloc(&config);
    int32_t res = OH_NativeBuffer_Unmap(buffer);
    napi_create_int32(env, res == NATIVE_ERROR_OK, &result);
    return result;
}

napi_value OH_OHNativeErrorCodeWindowBufferInvalid(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeBuffer_ColorSpace colorSpace;
    int32_t res = OH_NativeBuffer_GetColorSpace(nullptr, &colorSpace);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

napi_value OH_OHNativeErrorCodeWindowNoBuffer(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeImage* image = OH_NativeImage_Create(0, 0);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = 0;
    int32_t  errorCode = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    napi_create_int32(env, errorCode == NATIVE_ERROR_NO_BUFFER, &result);
    return result;
}

napi_value OH_NativeWindow_ErrCodeBUFFER_STATE_INVALID(napi_env env, napi_callback_info info)
{
    napi_value result;
    GLuint textureId = 0;
    OH_NativeImage *nativeImage = OH_NativeImage_Create(textureId, GL_TEXTURE_BINDING_2D);
    OH_NativeImage_AttachContext(nativeImage, textureId);
    OH_OnFrameAvailableListener listener;
    int32_t ret = OH_NativeImage_SetOnFrameAvailableListener(nativeImage, listener);
    OHNativeWindow *nativeWindow = OH_NativeImage_AcquireNativeWindow(nativeImage);
    
    int32_t code = SET_BUFFER_GEOMETRY;
    int32_t height = 0x100;
    int32_t width = 0x100;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, height, width);
    code = SET_FORMAT;
    int32_t format = NATIVEBUFFER_PIXEL_FMT_BGRA_8888;
    OH_NativeWindow_NativeWindowHandleOpt(nativeWindow, code, format);

    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fd;
    int pCount = 4;
    float matrix[16] = {
        0, -0.5, 0, 0,
        -0.5, 0, 0, 0,
        0, 0, 1, 0,
        1, 1, 0, 1
    };
    OH_NativeBuffer* nativebuffer = nullptr;
    int fenceFd = 0;
    int32_t err0 = OH_NativeWindow_NativeWindowRequestBuffer(nativeWindow, &windowBuffer, &fd);
    int32_t errCode = OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage, windowBuffer, fenceFd);
    napi_create_int32(env, errCode == NATIVE_ERROR_BUFFER_STATE_INVALID, &result);
    return result;
}

napi_value OH_ErrorCodeWindowInvalid(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t res = OH_NativeWindow_WriteToParcel(nullptr, nullptr);
    napi_create_int32(env, res == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}