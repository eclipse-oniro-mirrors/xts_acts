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

#include "OHImageNdkFrameworkTest.h"

#include <cstdint>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image/image_packer_native.h>
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
#define OPTION_SET_WIDTH 6
#define OPTION_SET_HEIGHT 4
#define IMAGE_EFFECT_1722514390000 1722514390000
#define LOG_DOMAIN 0x0000
#define LOG_TAG "OHImageFramwork"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))


napi_value ImagePackerNativeCreateTest(napi_env env, napi_callback_info info)
{
    OH_ImagePackerNative *imagePacker = nullptr;
    Image_ErrorCode errorCode = OH_ImagePackerNative_Create(&imagePacker);
    LOGI("OH_ImagePackerNative_Create %{public}d", errorCode);
    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

napi_value OHDecodingOptionsCreateTest(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *options = nullptr;
    Image_ErrorCode errorCode = OH_DecodingOptions_Create(&options);
    LOGI("OH_DecodingOptions_Create %{public}d", errorCode);
    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

static OH_PixelmapNative* getPixelMap()
{
    uint8_t length = OPTION_SET_WIDTH * OPTION_SET_HEIGHT * 4;
    uint8_t data[length];
    size_t dataSize = length;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTION_SET_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTION_SET_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *srcPixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &srcPixelmap);
    OH_PixelmapInitializationOptions_Release(createOpts);
    return srcPixelmap;
}

napi_value OH_PixelmapNative_GetImageInfoTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_PixelmapNative *srcPixelmap = getPixelMap();
    OH_Pixelmap_ImageInfo *srcImageInfoBefore;
    OH_PixelmapImageInfo_Create(&srcImageInfoBefore);
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_PixelmapNative_GetImageInfo(srcPixelmap, srcImageInfoBefore);
        LOGI("OH_PixelmapNative_GetImageInfo %{public}d", errCode);
        break;
    default:
        break;
    }
    if (srcPixelmap != nullptr) {
        OH_PixelmapNative_Release(srcPixelmap);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    return result;
}

napi_value OH_PixelmapNative_ConvertAlphaFormatTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_PixelmapNative *srcPixelmap = getPixelMap();
    OH_PixelmapNative *dstpixelmap = getPixelMap();
    Image_ErrorCode errCode = IMAGE_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_PixelmapNative_ConvertAlphaFormat(srcPixelmap, dstpixelmap, false);
        LOGI("OH_PixelmapNative_ConvertAlphaFormat %{public}d", errCode);
        break;
    default:
        break;
    }
    if (srcPixelmap != nullptr) {
        OH_PixelmapNative_Release(srcPixelmap);
    }
    if (dstpixelmap != nullptr) {
        OH_PixelmapNative_Release(dstpixelmap);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    return result;
}