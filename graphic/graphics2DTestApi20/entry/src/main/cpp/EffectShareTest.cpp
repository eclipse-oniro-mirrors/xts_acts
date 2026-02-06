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

#include "EffectShareTest.h"
#include <native_drawing/drawing_rect.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <native_drawing/drawing_shader_effect.h>
#include <native_drawing/drawing_matrix.h>
#include <native_drawing/drawing_pixel_map.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include <native_drawing/drawing_sampling_options.h>
#include <native_buffer/native_buffer.h>
#include <native_drawing/drawing_image_filter.h>

void addEffectShareTest(std::vector<napi_property_descriptor>& descData)
{
    descData.push_back({"shaderEffectCreatePixelMapShaderSuccess", nullptr,
        OH_Drawing_ShaderEffectCreatePixelMapShaderSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"shaderEffectCreatePixelMapShaderInvalue", nullptr,
        OH_Drawing_ShaderEffectCreatePixelMapShaderInvalue, nullptr, nullptr, nullptr, napi_default, nullptr});
    descData.push_back({"imageFilterCreateBlurWithCropSuccess", nullptr,
        OH_Drawing_ImageFilterCreateBlurWithCropSuccess, nullptr, nullptr, nullptr, napi_default, nullptr});
}

napi_value OH_Drawing_ShaderEffectCreatePixelMapShaderSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    uint32_t width = 100;
    uint32_t height = 100;
    uint8_t* data = new uint8_t[100 * 100 * 4];
    size_t dataLength = 100 * 100 * 4;
    for (int i = 0; i < dataLength;i++) {
        data[i] = 0xFF;
    }
    OH_Pixelmap_InitializationOptions* options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, width);
    OH_PixelmapInitializationOptions_SetHeight(options, height);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, NATIVEBUFFER_PIXEL_FMT_BGRA_8888);
    OH_PixelmapNative *pixelMapNative = nullptr;
    OH_PixelmapNative_CreatePixelmap(data, dataLength, options, &pixelMapNative);

    OH_Drawing_PixelMap *pixelMap = OH_Drawing_PixelMapGetFromOhPixelMapNative(pixelMapNative);
    OH_Drawing_SamplingOptions* samplingOptions = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR,
        MIPMAP_MODE_LINEAR);
    OH_Drawing_Matrix* matrix = OH_Drawing_MatrixCreate();
    OH_Drawing_ShaderEffect* peffect = OH_Drawing_ShaderEffectCreatePixelMapShader(pixelMap, CLAMP, CLAMP,
        samplingOptions, matrix);
    napi_create_int32(env,  peffect != nullptr, &result);
    return result;
}

napi_value OH_Drawing_ShaderEffectCreatePixelMapShaderInvalue(napi_env env, napi_callback_info info)
{
    napi_value result;
    OH_Drawing_PixelMap* pixelMap = nullptr;
    OH_Drawing_SamplingOptions* samplingOptions = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR,
        MIPMAP_MODE_LINEAR);
    OH_Drawing_Matrix* matrix = nullptr;
    OH_Drawing_TileMode tileMode;
    OH_Drawing_ShaderEffect* peffect = OH_Drawing_ShaderEffectCreatePixelMapShader(nullptr, tileMode, tileMode,
        nullptr, nullptr);
    napi_create_int32(env, peffect == nullptr, &result);
    return result;
}
 napi_value OH_Drawing_ImageFilterCreateBlurWithCropSuccess(napi_env env, napi_callback_info info)
{
    napi_value result;
    float sigmaX;
    float sigmaY;
    OH_Drawing_ImageFilter* input = nullptr;
    float left = 10;
    float top = 10;
    float right = 10;
    float bottom = 10;
    OH_Drawing_Rect* rect = OH_Drawing_RectCreate(left, top, right, bottom);
    OH_Drawing_TileMode mode;
    OH_Drawing_ImageFilter* iFile = OH_Drawing_ImageFilterCreateBlurWithCrop(sigmaX, sigmaY, MIRROR, input, rect);
    napi_create_int32(env, iFile != nullptr, &result);
    return result;
}
