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
#include "GlUtilsTest.h"
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
#include "render_texture.h"
#include "ImageFrameworkPixelMapNativeCreateSuppTest.h"

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

#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageEffectNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

#define OPTION_WIDTH 6
#define OPTION_HEIGHT 4

napi_value OHPixelmapNativeCreateScaledPixelMapSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTION_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTION_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelMap);
    OH_PixelmapNative *dstPixelmap = nullptr;
    OH_PixelmapNative *srcPixelmap = nullptr;
    float scaleX = 1.5;
    float scaleY = 1.5;
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_PixelmapNative_CreateScaledPixelMap(pixelMap, &dstPixelmap, scaleX, scaleY);
        LOGI("OH_PixelmapNative_CreateScaledPixelMap %{public}d", errCode);
        break;
    default:
        break;
    }
    OH_PixelmapNative_Release(dstPixelmap);
    OH_PixelmapNative_Release(srcPixelmap);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPixelmapNativeCreateScaledPixelMapWithAntiAliasingSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTION_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTION_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *srcPixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &srcPixelmap);

    OH_PixelmapNative *dstPixelmap = nullptr;
    OH_Pixelmap_ImageInfo *srcImageInfoBefore;
    OH_PixelmapImageInfo_Create(&srcImageInfoBefore);
    LOGI("OH_PixelmapImageInfo_Create,%{public}d", srcImageInfoBefore);
    OH_PixelmapNative_GetImageInfo(srcPixelmap, srcImageInfoBefore);
    LOGI("OH_PixelmapNative_GetImageInfo,%{public}d,%{public}d", srcPixelmap, srcImageInfoBefore);
    float scaleX = 1.5;
    float scaleY = 1.5;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_PixelmapNative_CreateScaledPixelMapWithAntiAliasing(
            srcPixelmap, &dstPixelmap, scaleX, scaleY,
            OH_PixelmapNative_AntiAliasingLevel::OH_PixelmapNative_AntiAliasing_HIGH);
        break;
        case CASE_INDEX_2:
        errCode = OH_PixelmapNative_CreateScaledPixelMapWithAntiAliasing(
            nullptr, &dstPixelmap, scaleX, scaleY,
            OH_PixelmapNative_AntiAliasingLevel::OH_PixelmapNative_AntiAliasing_HIGH);
        break;
    default:
        errCode = IMAGE_UNKNOWN_ERROR;
        break;
    }
    if (dstPixelmap != nullptr) {
        OH_PixelmapNative_Release(dstPixelmap);
    }
    if (srcPixelmap != nullptr && srcPixelmap != dstPixelmap) {
        OH_PixelmapNative_Release(srcPixelmap);
    }
    OH_PixelmapInitializationOptions_Release(createOpts);
    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    return result;
}
napi_value OHPixelmapNativeTranslateSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTION_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTION_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);

    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelMap);
    LOGI("OH_PixelmapNative_CreatePixelmap %{public}d", errCode);
    
    switch (index) {
    case CASE_INDEX_1: {
        float x = 0;
        float y = 0;
        errCode = OH_PixelmapNative_Translate(pixelMap, x, y);
        break;
    }
    case CASE_INDEX_4: {
        float x = INFINITY;
        float y = -INFINITY;
        errCode = OH_PixelmapNative_Translate(nullptr, x, y);
        break;
    }
    default:
        break;
    }
    LOGI("OH_PixelmapNative_CreatePixelmap 1 %{public}d", errCode);
    OH_PixelmapNative_Release(pixelMap);
    OH_PixelmapInitializationOptions_Release(createOpts);

    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    return result;
}
