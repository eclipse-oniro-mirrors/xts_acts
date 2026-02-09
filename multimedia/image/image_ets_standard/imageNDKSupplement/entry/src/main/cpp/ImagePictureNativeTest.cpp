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
#include "ImagePictureNativeTest.h"
#include <cstdlib>
#include <cstring>
#include <hilog/log.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image/picture_native.h>
#define LOG_TAG "ImagePackerNativeCpp"
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
napi_value SetDesiredPixelFormatTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ComposeOptions_SetDesiredPixelFormat start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ComposeOptions_SetDesiredPixelFormat error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_ComposeOptions *options = nullptr;
    OH_ComposeOptions_Create(&options);
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_ComposeOptions_SetDesiredPixelFormat(nullptr,PIXEL_FORMAT_RGBA_1010102);
        LOGI("OH_ComposeOptions_SetDesiredPixelFormat %{public}d", errorCode);
        break;
    default:
        break;
    }
    if (options != nullptr) {
        OH_ComposeOptions_Release(options);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    return result;
}
napi_value GetDesiredPixelFormatTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ComposeOptions_GetDesiredPixelFormat start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ComposeOptions_GetDesiredPixelFormat error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_ComposeOptions *options = nullptr;
    OH_ComposeOptions_Create(&options);
    PIXEL_FORMAT pixelFormatValue = PIXEL_FORMAT_RGBA_1010102;
    PIXEL_FORMAT *desiredPixelFormat = &pixelFormatValue;
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_ComposeOptions_GetDesiredPixelFormat(options,desiredPixelFormat);
        LOGI("OH_ComposeOptions_GetDesiredPixelFormat %{public}d", errorCode);
        break;
    case CASE_INDEX_2:
        errorCode = OH_ComposeOptions_GetDesiredPixelFormat(nullptr,desiredPixelFormat);
        LOGI("OH_ComposeOptions_GetDesiredPixelFormat %{public}d", errorCode);
        break;
    default:
        break;
    }
    if (options != nullptr) {
        OH_ComposeOptions_Release(options);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    return result;
}
napi_value ComposeOptionsReleaseTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ComposeOptions_Release start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ComposeOptions_Release error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_ComposeOptions *options = nullptr;
    OH_ComposeOptions_Create(&options);
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_ComposeOptions_Release(nullptr);
        LOGI("OH_ComposeOptions_Release %{public}d", errorCode);
        break;
    default:
        break;
    }
    if (options != nullptr) {
        OH_ComposeOptions_Release(options);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    return result;
}
napi_value GetHdrComposedPixelmapWithOptionsTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_PictureNative_GetHdrComposedPixelmapWithOptions start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_PictureNative_GetHdrComposedPixelmapWithOptions error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_PictureNative *picture = nullptr;
    OH_ComposeOptions *options = nullptr;
    OH_ComposeOptions_Create(&options);
    OH_PixelmapNative *hdrPixelmap = nullptr;
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_PictureNative_GetHdrComposedPixelmapWithOptions(picture,options,&hdrPixelmap);
        LOGI("OH_PictureNative_GetHdrComposedPixelmapWithOptions %{public}d", errorCode);
        break;
    default:
        break;
    }
    if (options != nullptr) {
        OH_ComposeOptions_Release(options);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    return result;
}
napi_value ComposeOptionsCreateTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ComposeOptions_Create start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ComposeOptions_Create error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_ComposeOptions *options = nullptr;
    Image_ErrorCode errorCode;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_ComposeOptions_Create(nullptr);
        LOGI("OH_ComposeOptions_Create %{public}d", errorCode);
        break;
    default:
        break;
    }
    if (options != nullptr) {
        OH_ComposeOptions_Release(options);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errorCode, &result);
    return result;
}
