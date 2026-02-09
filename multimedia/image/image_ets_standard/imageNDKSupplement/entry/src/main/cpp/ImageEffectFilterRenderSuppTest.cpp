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

#include "napi/native_api.h"
#include "utils/CommonUtilsTest.h"
#include "utils/PixelmapHelperTest.h"
#include <bits/alltypes.h>
#include <hilog/log.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_errors.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <native_color_space_manager/native_color_space_manager.h>
#include <native_window/external_window.h>
#include <string>

#include "GlUtilsTest.h"
#include "render_texture.h"
#include "ImageEffectFilterRenderSuppTest.h"

#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)

#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"
#define CUSTOM_FILTER "CustomCrop"
#define IMAGE_NULLSTRING ""

#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define CASE_INDEX_7 7
#define CASE_INDEX_8 8
#define CASE_INDEX_9 9
#define CASE_INDEX_10 10
#define CASE_INDEX_11 11

#define IMAGE_EFFECT_2 2
#define IMAGE_EFFECT_100 100
#define IMAGE_EFFECT_100F 100.f
#define IMAGE_EFFECT_50F 50.f
#define IMAGE_EFFECT_100D 100.0
#define IMAGE_EFFECT_1000 1000
#define IMAGE_EFFECT_1024 1024
#define IMAGE_EFFECT_1048576 1048576
#define IMAGE_EFFECT_1073741824 1073741824
#define IMAGE_EFFECT_1080 1080
#define IMAGE_EFFECT_1920 1920
#define IMAGE_EFFECT_4090 4090
#define IMAGE_EFFECT_5120 5120
#define IMAGE_EFFECT_CODE_401 401
#define IMAGE_EFFECT_1722514390000 1722514390000
#define EFFECT_PARAM_ERROR 29000121
#define IMAGE_EFFECT_INVALID_PARAMETER 401
#define IMAGE_EFFECT_SUCCESS 0
static std::string g_imagePath;
static std::string g_outImagePath;


ImageEffect_FilterDelegate getFilterDelegate()
{
    ImageEffect_FilterDelegate filterDelegate;

    filterDelegate.setValue = [](OH_EffectFilter *filter, const char *key, const ImageEffect_Any *value) {
        return true;
    };
    filterDelegate.render = [](OH_EffectFilter *filter, OH_EffectBufferInfo *info,
                               OH_EffectFilterDelegate_PushData pushData) { return true; };
    filterDelegate.save = [](OH_EffectFilter *filter, char **info) {
        return true;
    };
    filterDelegate.restore = [](const char *info) {
        OH_EffectFilter *filter = OH_EffectFilter_Create(CUSTOM_FILTER);
        OH_EffectFilter_Release(filter);
        return filter;
    };
    return filterDelegate;
}
napi_value OHEffectFilterRenderSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(g_imagePath);
    OH_PixelmapNative *inputPixelmap = pixelmapNativePtr.get();
    OH_PixelmapNative *outputPixelmap = inputPixelmap;
    ImageEffect_FilterDelegate filterDelegate = getFilterDelegate();
    OH_EffectFilterInfo *customFilterInfo = OH_EffectFilterInfo_Create();
    OH_EffectFilterInfo_SetFilterName(customFilterInfo, CUSTOM_FILTER);
    ImageEffect_BufferType bufferTypeArray[] = {ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL};
    OH_EffectFilterInfo_SetSupportedBufferTypes(
        customFilterInfo, sizeof(bufferTypeArray) / sizeof(ImageEffect_BufferType), bufferTypeArray);
    ImageEffect_Format formatArray[] = {ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888};
    OH_EffectFilterInfo_SetSupportedFormats(customFilterInfo, sizeof(formatArray) / sizeof(ImageEffect_Format),
                                            formatArray);
    
    ImageEffect_ErrorCode errorCode = OH_EffectFilter_Register(customFilterInfo, &filterDelegate);
    OH_EffectFilter *filter = OH_EffectFilter_Create(CUSTOM_FILTER);
    std::shared_ptr<OH_PixelmapNative> outPixelPtr = PixelMapHelper::Decode(g_outImagePath);
    switch (index) {
    case CASE_INDEX_1:
        outputPixelmap = nullptr;
        break;
    default:
        break;
    }
    errorCode = OH_EffectFilter_Render(filter, inputPixelmap, outputPixelmap);
    OH_EffectFilter_Release(filter);
    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

napi_value OHEffectFilterRenderWithTextureIdSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_FilterDelegate filterDelegate = getFilterDelegate();
    OH_EffectFilterInfo *customFilterInfo = OH_EffectFilterInfo_Create();
    OH_EffectFilterInfo_SetFilterName(customFilterInfo, CUSTOM_FILTER);

    ImageEffect_BufferType bufferTypeArray[] = {ImageEffect_BufferType::EFFECT_BUFFER_TYPE_TEXTURE};
    OH_EffectFilterInfo_SetSupportedBufferTypes(
        customFilterInfo, sizeof(bufferTypeArray) / sizeof(ImageEffect_BufferType), bufferTypeArray);
    ImageEffect_Format formatArray[] = {ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888};
    OH_EffectFilterInfo_SetSupportedFormats(customFilterInfo, sizeof(formatArray) / sizeof(ImageEffect_Format),
                                            formatArray);
    ImageEffect_ErrorCode errorCode = OH_EffectFilter_Register(customFilterInfo, &filterDelegate);
    OH_EffectFilter *filter = OH_EffectFilter_Create(CUSTOM_FILTER);

    std::shared_ptr<RenderTexture> input =
        std::make_shared<RenderTexture>(IMAGE_EFFECT_1920, IMAGE_EFFECT_1080, GL_RGBA8);
    input->Init();
    std::shared_ptr<RenderTexture> output =
        std::make_shared<RenderTexture>(IMAGE_EFFECT_1920, IMAGE_EFFECT_1080, GL_RGBA8);
    output->Init();

    switch (index) {
    case CASE_INDEX_1:
        errorCode =
            OH_EffectFilter_RenderWithTextureId(nullptr, input->GetName(), output->GetName(), ColorSpaceName::SRGB);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(filter);
    OH_EffectFilterInfo_Release(customFilterInfo);
    
    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}