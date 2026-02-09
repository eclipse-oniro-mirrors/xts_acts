/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

#include "PixelmapNativeCropTest.h"
#include <cstdlib>
#include <hilog/log.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#define LOG_TAG "PixelMapNativeCropCpp"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5
#define CASE_INDEX_6 6
#define PARAM_960000 960000
#define PARAM_200 200
#define PARAM_300 300
napi_value PixelmapNativeCropTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelmapNative_Crop start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelmapNative_Crop error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_PixelmapNative *pixelmap = nullptr;
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_200);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelmap);
    Image_Region region = {
    .x = 10,
    .y = 10,
    .width = 100,
    .height = 200
    };
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_PixelmapNative_Crop(pixelmap, &region);
        LOGI("OH_PixelmapNative_Crop %{public}d", code);
        break;
    default:
        break;
    }
    if (pixelmap != nullptr) {
        OH_PixelmapNative_Release(pixelmap);
    }
    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}
napi_value ConvertAlphaFormatTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelmapNative_ConvertAlphaFormat start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelmapNative_ConvertAlphaFormat error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_PixelmapNative *pixelmap = nullptr;
    size_t dataSize = PARAM_960000;
    uint8_t data[dataSize];
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_PixelmapNative *dstPixelmap = nullptr;
    OH_Pixelmap_InitializationOptions *options = nullptr;
    OH_PixelmapInitializationOptions_Create(&options);
    OH_PixelmapInitializationOptions_SetWidth(options, PARAM_200);
    OH_PixelmapInitializationOptions_SetHeight(options, PARAM_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(options, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(options, PIXELMAP_ALPHA_TYPE_PREMULTIPLIED);
    OH_PixelmapNative_CreatePixelmap(data, dataSize, options, &pixelmap);
    OH_Pixelmap_InitializationOptions *dstOptions = nullptr;
    OH_PixelmapInitializationOptions_Create(&dstOptions);
    OH_PixelmapInitializationOptions_SetWidth(dstOptions, PARAM_200);
    OH_PixelmapInitializationOptions_SetHeight(dstOptions, PARAM_300);
    OH_PixelmapInitializationOptions_SetPixelFormat(dstOptions, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(dstOptions, PIXELMAP_ALPHA_TYPE_UNPREMULTIPLIED);
    OH_PixelmapNative_CreateEmptyPixelmap(dstOptions, &dstPixelmap);
    const bool isPremul = false;
    Image_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_PixelmapNative_ConvertAlphaFormat(pixelmap, dstPixelmap, isPremul);
        LOGI("OH_PixelmapNative_ConvertAlphaFormat %{public}d", code);
        break;
    default:
        break;
    }
    if (pixelmap != nullptr) {
        OH_PixelmapNative_Release(pixelmap);
    }
    if (dstPixelmap != nullptr) {
        OH_PixelmapNative_Release(dstPixelmap);
    }
    napi_value result = nullptr;
    napi_create_int32(env, code, &result);
    return result;
}