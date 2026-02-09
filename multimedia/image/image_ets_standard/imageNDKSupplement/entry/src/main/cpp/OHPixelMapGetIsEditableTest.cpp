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

#include "OHPixelMapGetIsEditableTest.h"
#include "napi/native_api.h"
#include <hilog/log.h>
#include <multimedia/image_framework/image_mdk_common.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include "utils/CommonUtilsTest.h"
#include "utils/PixelmapHelperTest.h"

#define LOG_DOMAIN 0x0000
#define LOG_TAG "PixelMapGetIsEditableNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2
#define CASE_INDEX_3 3
#define CASE_INDEX_4 4
#define CASE_INDEX_5 5

#define OPTION_WIDTH 4
#define OPTION_HEIGHT 6
#define OPTION_PIXEL_FORMAT 9
#define OPTION_ALPHA_ZERO 0

napi_value PixelMapTest(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    napi_value pixelMap = nullptr;
    struct OhosPixelMapCreateOps createOps;
    createOps.width = OPTION_WIDTH;
    createOps.height = OPTION_HEIGHT;
    createOps.pixelFormat = OPTION_PIXEL_FORMAT;
    createOps.alphaType = OPTION_ALPHA_ZERO;
    size_t bufferSize = createOps.width * createOps.height * 4;
    void *buff = malloc(bufferSize);
    if (buff == nullptr) {
        return udfVar;
    }

    char *cc = reinterpret_cast<char *>(buff);
    for (int i = 0; i < bufferSize; ++i) {
        *(cc++) = static_cast<char>(i);
    }
    int32_t res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
    free(buff);
    if (res != IMAGE_RESULT_SUCCESS || pixelMap == nullptr) {
        return udfVar;
    }
    return pixelMap;
}

napi_value OHPixelMapGetIsEditable(napi_env env, napi_callback_info info)
{
    LOGI("OH_PixelMap_GetIsEditable start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;

    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PixelMap_GetIsEditable error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    NativePixelMap *native = OH_PixelMap_InitNativePixelMap(env, PixelMapTest(env, info));
    if (native == nullptr) {
        LOGI("OH_PixelMap_GetIsEditable error2");
        return result;
    }
    int32_t editable;
    int32_t imageResult;
    switch (index) {
    case CASE_INDEX_1:
        imageResult = OH_PixelMap_GetIsEditable(native, &editable);
        if (imageResult == 0) {
            LOGI("OH_PixelMap_GetIsEditable可编辑 值：%{public}d", imageResult);
        }
        break;
    case CASE_INDEX_2:
        imageResult = OH_PixelMap_GetIsEditable(nullptr, &editable);
        if (imageResult == -1) {
            LOGI("OH_PixelMap_GetIsEditable不可编辑 值：%{public}d", imageResult);
        }
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, imageResult, &ret);
    return ret;
}