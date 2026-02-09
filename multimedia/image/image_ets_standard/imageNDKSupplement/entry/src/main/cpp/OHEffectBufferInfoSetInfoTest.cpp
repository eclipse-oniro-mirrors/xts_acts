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
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include "OHEffectBufferInfoSetInfoTest.h"
#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)
#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"
#define CUSTOM_FILTER "CustomCrop"
#define IMAGE_NULL_STRING ""
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

napi_value OHEffectBufferInfoSetHeightTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    int32_t height;
    switch (index) {
    case CASE_INDEX_1:
        height = 0;
        break;
    case CASE_INDEX_2:
        height = IMAGE_EFFECT_1080;
        break;
    case CASE_INDEX_3:
        height = -IMAGE_EFFECT_1080;
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        height = IMAGE_EFFECT_1080;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_SetHeight(bufferInfo, height);
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetHeightTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setHeight;
    int32_t getHeight;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setHeight = 0;
        code = OH_EffectBufferInfo_SetHeight(bufferInfo, setHeight);
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        if (getHeight != setHeight) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setHeight = IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        break;
    case CASE_INDEX_3:
        setHeight = -IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setHeight = IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_GetHeight(bufferInfo, &getHeight);
        break;
    default:
        break;
    }
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoSetWidthTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t width;
    switch (index) {
    case CASE_INDEX_1:
        width = 0;
        break;
    case CASE_INDEX_2:
        width = IMAGE_EFFECT_1080;
        break;
    case CASE_INDEX_3:
        width = -IMAGE_EFFECT_1080;
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        width = IMAGE_EFFECT_1080;
        break;
    default:
        break;
    }
    code = OH_EffectBufferInfo_SetWidth(bufferInfo, width);
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetWidthTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setWidth;
    int32_t getWidth;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setWidth = 0;
        code = OH_EffectBufferInfo_SetWidth(bufferInfo, setWidth);
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        if (getWidth != setWidth) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setWidth = IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        break;
    case CASE_INDEX_3:
        setWidth = -IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setWidth = IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_GetWidth(bufferInfo, &getWidth);
        break;
    default:
        break;
    }
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoSetRowSizeTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t rowSize;
    switch (index) {
    case CASE_INDEX_1:
        rowSize = 0;
        break;
    case CASE_INDEX_2:
        rowSize = IMAGE_EFFECT_1080;
        break;
    case CASE_INDEX_3:
        rowSize = IMAGE_EFFECT_1080;
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        rowSize = IMAGE_EFFECT_1080;
        break;
    default:
        break;
    }
    code = OH_EffectBufferInfo_SetRowSize(bufferInfo, rowSize);
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoGetRowSizeTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_EffectBufferInfo *bufferInfo = OH_EffectBufferInfo_Create();
    ImageEffect_ErrorCode code;
    int32_t setRowSize;
    int32_t getRowSize;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setRowSize = 0;
        code = OH_EffectBufferInfo_SetRowSize(bufferInfo, setRowSize);
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        if (getRowSize != setRowSize) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setRowSize = IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        break;
    case CASE_INDEX_3:
        setRowSize = IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        break;
    case CASE_INDEX_4:
        bufferInfo = nullptr;
        setRowSize = IMAGE_EFFECT_1080;
        code = OH_EffectBufferInfo_GetRowSize(bufferInfo, &getRowSize);
        break;
    default:
        break;
    }
    OH_EffectBufferInfo_Release(bufferInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectBufferInfoReleaseTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_EffectBufferInfo *bufferInfo = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        bufferInfo = OH_EffectBufferInfo_Create();
        break;
    case CASE_INDEX_2:
        bufferInfo = nullptr;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_EffectBufferInfo_Release(bufferInfo);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}