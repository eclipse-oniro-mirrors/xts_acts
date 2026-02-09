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
#include "ImagePixelMapTest.h"
#include <cstdlib>
#include <hilog/log.h>
#include <multimedia/image_framework/image_mdk_common.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include "utils/CommonUtilsTest.h"
#include "utils/PixelmapHelperTest.h"

#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImagePixelMapCreateCpp"
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
#define CASE_INDEX_7 7
namespace {
constexpr uint32_t NUM_0 = 0;
constexpr uint32_t NUM_1 = 1;
constexpr uint32_t NUM_2 = 2;
constexpr uint32_t NUM_3 = 3;
constexpr uint32_t NUM_4 = 4;
constexpr uint32_t NUM_5 = 5;
} // namespace
#define OPTION_WIDTH_SMALL 4
#define OPTION_HEIGHT_SMALL 6
#define OPTION_PIXEL_FORMAT_SMALL 4
#define OPTION_ALPHA_ZERO 0
#define OPTION_EDITABLE_ZERO 0
#define OPTION_SCALE_ZERO 0
#define OPTION_WIDTH_BIG 100
#define OPTION_HEIGHT_BIG 50
#define OPTION_PIXEL_FORMAT_BIG 9

napi_value CreatePixelMapTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelMap_GetBytesNumberPerRow start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelMap_GetBytesNumberPerRow error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);

    napi_value udfVar = nullptr;
    napi_value pixelMap = nullptr;

    struct OhosPixelMapCreateOps createOps;
    createOps.width = OPTION_WIDTH_SMALL;
    createOps.height = OPTION_HEIGHT_SMALL;
    createOps.pixelFormat = OPTION_PIXEL_FORMAT_SMALL;
    createOps.alphaType = OPTION_ALPHA_ZERO;
    createOps.editable = OPTION_EDITABLE_ZERO;
    createOps.scaleMode = OPTION_SCALE_ZERO;
    size_t bufferSize = createOps.width * createOps.height * 4;
    void *buff = malloc(bufferSize);
    if (buff == nullptr) {
        return udfVar;
    }
    char *cc = reinterpret_cast<char *>(buff);
    for (int i = 0; i < bufferSize; ++i) {
        *(cc++) = static_cast<char>(i);
    }

    int32_t res = IMAGE_RESULT_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, -1, &pixelMap);
        LOGI("OH_PixelMap_CreatePixelMap %{public}d", res);
        break;
    case CASE_INDEX_2:
        res = OH_PixelMap_CreatePixelMap(env, createOps, nullptr, bufferSize, &pixelMap);
        LOGI("OH_PixelMap_CreatePixelMap %{public}d", res);
        break;
    case CASE_INDEX_3:
        createOps.pixelFormat = -1;
        res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
        LOGI("OH_PixelMap_CreatePixelMap %{public}d", res);
        break;
    case CASE_INDEX_4:
        res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, nullptr);
        LOGI("OH_PixelMap_CreatePixelMap %{public}d", res);
        break;
    case CASE_INDEX_5:
        res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
        LOGI("OH_PixelMap_CreatePixelMap %{public}d", res);
        break;
    case CASE_INDEX_6:
        res = OH_PixelMap_CreatePixelMap(nullptr, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
        LOGI("OH_PixelMap_CreatePixelMap %{public}d", res);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, res, &result);
    return result;
}

napi_value CreatePixelMap(napi_env env)
{
    LOGI("OH_PixelMap_CreatePixelMap start");
    napi_value udfVar = nullptr;
    napi_value pixelMap = nullptr;
    struct OhosPixelMapCreateOps createOps;
    createOps.width = OPTION_WIDTH_SMALL;
    createOps.height = OPTION_HEIGHT_SMALL;
    createOps.pixelFormat = OPTION_PIXEL_FORMAT_SMALL;
    createOps.alphaType = OPTION_ALPHA_ZERO;
    createOps.editable = OPTION_EDITABLE_ZERO;
    createOps.scaleMode = OPTION_SCALE_ZERO;
    size_t bufferSize = createOps.width * createOps.height * 4;
    void *buff = malloc(bufferSize);
    if (buff == nullptr) {
        return udfVar;
    }
    char *cc = reinterpret_cast<char *>(buff);
    for (int i = 0; i < bufferSize; ++i) {
        *(cc++) = static_cast<char>(i);
    }
    int32_t res = IMAGE_RESULT_SUCCESS;
    res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
    LOGI("OH_PixelMap_CreatePixelMap %{public}d", res);
    return pixelMap;
}


napi_value CreatePixelMapWithStrideTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelMap_CreatePixelMapWithStride start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelMap_CreatePixelMapWithStride error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    void *buff = nullptr;
    size_t bufferLen = 0;
    int32_t rowStride = 0;
    struct OhosPixelMapCreateOps createOps;
    createOps.width = OPTION_WIDTH_BIG;
    createOps.height = OPTION_HEIGHT_BIG;
    createOps.pixelFormat = OPTION_PIXEL_FORMAT_BIG; // 合法像素格式
    createOps.alphaType = OPTION_ALPHA_ZERO;
    rowStride = createOps.width * 4; // 预期行步长（400）
    bufferLen = createOps.height * rowStride;
    napi_value pixelmap = nullptr;
    buff = malloc(bufferLen);
    if (buff == nullptr) {
        LOGE("内存分配失败");
        return nullptr;
    }
    memset(buff, 0, bufferLen);
    int32_t returnValue = IMAGE_RESULT_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_PixelMap_CreatePixelMapWithStride(nullptr, createOps, buff, bufferLen, rowStride, &pixelmap);
        LOGI("OH_PixelMap_CreatePixelMapWithStride %{public}d", returnValue);
        break;

    case CASE_INDEX_2:
        returnValue = OH_PixelMap_CreatePixelMapWithStride(env, createOps, buff, bufferLen, rowStride, &pixelmap);
        LOGI("OH_PixelMap_CreatePixelMapWithStride %{public}d", returnValue);
        break;

    case CASE_INDEX_3:
        returnValue = OH_PixelMap_CreatePixelMapWithStride(env, createOps, buff, -1, rowStride, &pixelmap);
        LOGI("OH_PixelMap_CreatePixelMapWithStride %{public}d", returnValue);
        break;

    case CASE_INDEX_4:
        createOps.pixelFormat = -1;
        returnValue = OH_PixelMap_CreatePixelMapWithStride(env, createOps, buff, bufferLen, rowStride, &pixelmap);
        LOGI("OH_PixelMap_CreatePixelMapWithStride %{public}d", returnValue);
        break;

    case CASE_INDEX_5:
        returnValue = OH_PixelMap_CreatePixelMapWithStride(env, createOps, buff, bufferLen, rowStride, nullptr);
        LOGI("OH_PixelMap_CreatePixelMapWithStride %{public}d", returnValue);
        break;
    case CASE_INDEX_6:
        returnValue = OH_PixelMap_CreatePixelMapWithStride(env, createOps, nullptr, bufferLen, rowStride, &pixelmap);
        LOGI("OH_PixelMap_CreatePixelMapWithStride %{public}d", returnValue);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value CreateAlphaPixelMapTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelMap_CreateAlphaPixelMap start");
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    napi_value alphaPixelMap = nullptr;
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        return udfVar;
    }
    napi_value pixelMap = nullptr;
    struct OhosPixelMapCreateOps createOps;
    createOps.width = OPTION_WIDTH_SMALL;
    createOps.height = OPTION_HEIGHT_SMALL;
    createOps.pixelFormat = OPTION_PIXEL_FORMAT_SMALL;
    createOps.alphaType = OPTION_ALPHA_ZERO;
    createOps.editable = OPTION_EDITABLE_ZERO;
    createOps.scaleMode = OPTION_SCALE_ZERO;
    size_t bufferSize = createOps.width * createOps.height * 4;
    void *buff = malloc(bufferSize);
    if (buff == nullptr) {
        return udfVar;
    }
    char *cc = reinterpret_cast<char *>(buff);
    for (int i = 0; i < bufferSize; ++i) {
        *(cc++) = static_cast<char>(i);
    }
    int32_t res = IMAGE_RESULT_SUCCESS;
    res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    int32_t returnValue = IMAGE_RESULT_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, -1, &pixelMap);
        returnValue = OH_PixelMap_CreateAlphaPixelMap(env, pixelMap, &alphaPixelMap);
        LOGI("OH_PixelMap_CreateAlphaPixelMap %{public}d", returnValue);
        break;
    case CASE_INDEX_2:
        returnValue = OH_PixelMap_CreateAlphaPixelMap(nullptr, pixelMap, &alphaPixelMap);
        LOGI("OH_PixelMap_CreateAlphaPixelMap %{public}d", returnValue);
        break;
    case CASE_INDEX_3:
        returnValue = OH_PixelMap_CreateAlphaPixelMap(env, nullptr, &alphaPixelMap);
        LOGI("OH_PixelMap_CreateAlphaPixelMap %{public}d", returnValue);
        break;
    case CASE_INDEX_4:
        returnValue = OH_PixelMap_CreateAlphaPixelMap(env, pixelMap, nullptr);
        LOGI("OH_PixelMap_CreateAlphaPixelMap %{public}d", returnValue);
        break;
    case CASE_INDEX_5:
        res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
        returnValue = OH_PixelMap_CreateAlphaPixelMap(env, pixelMap, &alphaPixelMap);
        LOGI("OH_PixelMap_CreateAlphaPixelMap %{public}d", returnValue);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value PixelMapGetImageInfoTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelMap_GetImageInfo start");
    napi_value result;
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        return udfVar;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    napi_value pixelmap = nullptr;
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    OhosPixelMapInfos pixelmapInfo;
    int32_t res = IMAGE_RESULT_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        res = OH_PixelMap_GetImageInfo(nullptr, &pixelmapInfo);
        LOGI("OH_PixelMap_GetImageInfo %{public}d", res);
        break;
    case CASE_INDEX_2:
        res = OH_PixelMap_GetImageInfo(Native, nullptr);
        LOGI("OH_PixelMap_GetImageInfo %{public}d", res);
        break;
    default:
        break;
    }
    napi_create_int32(env, res, &result);
    return result;
}
napi_value PixelMapAccessPixelsTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelMap_GetImageInfo start");
    napi_value result;
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        return udfVar;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    napi_value pixelmap = nullptr;
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    double p = 0.0;
    void *pixels = &p;
    int32_t res = IMAGE_RESULT_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        res = OH_PixelMap_AccessPixels(nullptr, &pixels);
        LOGI("OH_PixelMap_GetImageInfo %{public}d", res);
        break;
    default:
        break;
    }
    napi_create_int32(env, res, &result);
    return result;
}
napi_value PixelMapUnAccessPixelsTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelMap_GetImageInfo start");
    napi_value result;
    napi_value udfVar = nullptr;
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    napi_get_undefined(env, &udfVar);
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        return udfVar;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    napi_value pixelmap = nullptr;
    NativePixelMap *Native = OH_PixelMap_InitNativePixelMap(env, pixelmap);
    int32_t res = IMAGE_RESULT_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        res = OH_PixelMap_UnAccessPixels(nullptr);
        LOGI("OH_PixelMap_UnAccessPixels %{public}d", res);
        break;
    default:
        break;
    }
    napi_create_int32(env, res, &result);
    return result;
}