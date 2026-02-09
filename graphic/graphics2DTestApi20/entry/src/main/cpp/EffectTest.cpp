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

#include "EffectTest.h"
#include <native_effect/effect_filter.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <native_image/native_image.h>
#include <native_window/graphic_error_code.h>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <native_drawing/drawing_matrix.h>
#include <native_drawing/drawing_pixel_map.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <native_drawing/drawing_sampling_options.h>
#include <common/native_common.h>

void addEffectTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"createEffectFail", nullptr, OH_Filter_CreateEffectFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"releaseFail", nullptr, OH_Filter_ReleaseFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"blurWithTileModeSuccess", nullptr, OH_Filter_BlurWithTileModeSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"blurWithTileModeFail", nullptr, OH_Filter_BlurWithTileModeFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"getEffectPixelMapFail", nullptr, OH_Filter_GetEffectPixelMapFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"getTransformMatrixV2Success", nullptr, OH_NativeImage_GetTransformMatrixV2Success,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"acquireNativeWindowBufferSuccess", nullptr, OH_NativeImage_AcquireNativeWindowBufferSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"acquireNativeWindowBufferFail", nullptr, OH_NativeImage_AcquireNativeWindowBufferFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"releaseNativeWindowBufferFail", nullptr, OH_NativeImage_ReleaseNativeWindowBufferFail,
            nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"setDropBufferModeSuccess", nullptr, OH_NativeImage_SetDropBufferModeSuccess,
            nullptr, nullptr, nullptr, napi_default, nullptr});
}

 napi_value OH_Filter_CreateEffectFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Filter* filter;
    EffectErrorCode errCode = OH_Filter_CreateEffect(nullptr, &filter);
    napi_create_int32(env, errCode == EFFECT_BAD_PARAMETER, &result);
    return result;
}
 napi_value OH_Filter_ReleaseFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Filter* filter = nullptr;
    EffectErrorCode errCode = OH_Filter_Release(filter);
    napi_create_int32(env, errCode == EFFECT_BAD_PARAMETER, &result);
    return result;
}

 napi_value OH_Filter_BlurWithTileModeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t width = 100;
    uint32_t height = 100;
    OH_Filter* filter = nullptr;
    float radius = 10;
    uint8_t* data = new uint8_t[100 * 100 * 4];
    size_t dataLength = 100 * 100 * 4;
    for (int i = 0; i < dataLength; i++) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, NATIVEBUFFER_PIXEL_FMT_BGRA_8888);
    OH_PixelmapNative *pixelMapNative = nullptr;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);
    OH_Filter_CreateEffect(pixelMapNative, &filter);
    EffectErrorCode errCode = OH_Filter_BlurWithTileMode(filter, radius, REPEAT);

    napi_create_int32(env, errCode == EFFECT_SUCCESS, &result);
    return result;
}

 napi_value OH_Filter_BlurWithTileModeFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Filter* filter = nullptr;
    float radius = 10;
    EffectErrorCode errCode = OH_Filter_BlurWithTileMode(filter, radius, REPEAT);
    OH_Filter_Blur(filter, radius);
    napi_create_int32(env, errCode == EFFECT_BAD_PARAMETER, &result);
    return result;
}

 napi_value OH_Filter_GetEffectPixelMapFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    EffectErrorCode errCode = OH_Filter_GetEffectPixelMap(nullptr, nullptr);
    napi_create_int32(env,  errCode == EFFECT_BAD_PARAMETER, &result);
    return result;
}

 napi_value OH_NativeImage_GetTransformMatrixV2Success(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeImage* image = OH_NativeImage_Create(0, 0);
    float matrix[16] = {0};
    int32_t  errorCode =  OH_NativeImage_GetTransformMatrixV2(image, matrix);
    NAPI_ASSERT(env, errorCode == NATIVE_ERROR_OK, "");
    errorCode =  OH_NativeImage_GetTransformMatrixV2(nullptr, matrix);
    napi_create_int32(env, errorCode == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

 napi_value OH_NativeImage_AcquireNativeWindowBufferSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeImage* image = OH_NativeImage_Create(0, 0);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = 0;
    int32_t  errorCode = OH_NativeImage_AcquireNativeWindowBuffer(image, &nativeWindowBuffer, &fenceFd);
    napi_create_int32(env, errorCode == NATIVE_ERROR_NO_BUFFER, &result);
    return result;
}

 napi_value OH_NativeImage_AcquireNativeWindowBufferFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t  errorCode =  OH_NativeImage_AcquireNativeWindowBuffer(nullptr, nullptr, nullptr);
    napi_create_int32(env, errorCode == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

 napi_value OH_NativeImage_ReleaseNativeWindowBufferFail(napi_env env, napi_callback_info info)
{
    napi_value result;
    int32_t  errorCode =  OH_NativeImage_ReleaseNativeWindowBuffer(nullptr, nullptr, 0);
    napi_create_int32(env, errorCode == NATIVE_ERROR_INVALID_ARGUMENTS, &result);
    return result;
}

 napi_value OH_NativeImage_SetDropBufferModeSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_NativeImage* image = OH_NativeImage_Create(0, 0);
    OHNativeWindowBuffer* nativeWindowBuffer = nullptr;
    int fenceFd = 0;
    int32_t  errorCode = OH_NativeImage_SetDropBufferMode(image, true);
    napi_create_int32(env, errorCode == NATIVE_ERROR_OK, &result);
    return result;
}
