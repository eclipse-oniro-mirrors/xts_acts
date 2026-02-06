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

#include "ImageSourceNativeGetImagePropertyTest.h"
#include <cstddef>
#include <cstdint>
#include "napi/native_api.h"
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include "multimedia/image_framework/image/image_packer_native.h"
#include "multimedia/image_framework/image/image_source_native.h"
#include <string>
#include <unistd.h>
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageSourceNativeNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define CASE_INDEX_1 1
#define CASE_INDEX_2 2

static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr uint32_t MAX_STRING_SIZE = 128;
static constexpr uint32_t MAKER_NOTE_SIZE_MAX = 64 * 1024;

static Image_String CreateImageStringFromArg(napi_env env, napi_value arg)
{
    Image_String imgStr = {0};
    size_t strLen = 0;
    napi_get_value_string_utf8(env, arg, nullptr, 0, &strLen);
    imgStr.size = strLen;
    if (strLen > MAKER_NOTE_SIZE_MAX) {
        return imgStr;
    }
    imgStr.data = static_cast<char *>(malloc(strLen + 1));
    if (imgStr.data == NULL) {
        imgStr.size = 0;
        return imgStr;
    }
    napi_get_value_string_utf8(env, arg, imgStr.data, strLen + 1, &strLen);
    return imgStr;
}

napi_value ImageSourceNativeGetImagePropertyLong(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_3) {
        return result;
    }
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    int32_t fd = 0;
    napi_get_value_int32(env, args[1], &fd);
    Image_ErrorCode errCode;
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    LOGI("OH_ImageSourceNative_CreateFromUri, errCode: %{public}d", errCode);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOGE("Create ImageSource failed, errCode: %d", errCode);
        napi_value ret;
        napi_create_int32(env, errCode, &ret);
        return ret;
    }
    Image_String key = CreateImageStringFromArg(env, args[2]);
    uint32_t value = 0;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_GetImagePropertyLong(imageSource, &key, &value);
        LOGI("值：%{public}d", errCode);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_GetImagePropertyLong(nullptr, &key, &value);
        LOGI("值：%{public}d", errCode);
        break;
    default:
        break;
    }
    if (imageSource != nullptr) {
        OH_ImageSourceNative_Release(imageSource);
    }
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}
   
napi_value ImageSourceNativeGetImagePropertyShort(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_3) {
        return result;
    }
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    int32_t fd = 0;
    napi_get_value_int32(env, args[1], &fd);
    Image_ErrorCode errCode;
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    LOGI("OH_ImageSourceNative_CreateFromUri, errCode: %{public}d", errCode);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOGE("Create ImageSource failed, errCode: %d", errCode);
        napi_value ret;
        napi_create_int32(env, errCode, &ret);
        return ret;
    }
    Image_String key = CreateImageStringFromArg(env, args[2]);
    uint16_t value = 0;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_GetImagePropertyShort(imageSource, &key, &value);
        LOGI("值：%{public}d", errCode);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_GetImagePropertyShort(nullptr, &key, &value);
        LOGI("值：%{public}d", errCode);
        break;
    default:
        break;
    }
    if (imageSource != nullptr) {
        OH_ImageSourceNative_Release(imageSource);
    }
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

napi_value ImageSourceNativeGetImagePropertyDouble(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_3) {
        return result;
    }
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    int32_t fd = 0;
    napi_get_value_int32(env, args[1], &fd);
    Image_ErrorCode errCode;
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    LOGI("OH_ImageSourceNative_CreateFromUri, errCode: %{public}d", errCode);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOGE("Create ImageSource failed, errCode: %d", errCode);
        napi_value ret;
        napi_create_int32(env, errCode, &ret);
        return ret;
    }
    Image_String key = CreateImageStringFromArg(env, args[2]);
    double value = 0.0;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_GetImagePropertyDouble(imageSource, &key, &value);
        LOGI("值：%{public}d", errCode);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_GetImagePropertyDouble(nullptr, &key, &value);
        LOGI("值：%{public}d", errCode);
        break;
    default:
        break;
    }
    if (imageSource != nullptr) {
        OH_ImageSourceNative_Release(imageSource);
    }
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

napi_value ImageSourceGetImagePropertyArraySize(napi_env env, napi_callback_info info)
{
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_3) {
        return result;
    }
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    int32_t fd = 0;
    napi_get_value_int32(env, args[1], &fd);
    Image_ErrorCode errCode;
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    LOGI("OH_ImageSourceNative_CreateFromUri, errCode: %{public}d", errCode);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOGE("Create ImageSource failed, errCode: %d", errCode);
        napi_value ret;
        napi_create_int32(env, errCode, &ret);
        return ret;
    }
    Image_String key = CreateImageStringFromArg(env, args[2]);
    size_t size = 0;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_GetImagePropertyArraySize(imageSource, &key, &size);
        LOGI("值：%{public}d", errCode);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_GetImagePropertyArraySize(nullptr, &key, &size);
        LOGI("值：%{public}d", errCode);
        break;
    default:
        break;
    }
    if (imageSource != nullptr) {
        OH_ImageSourceNative_Release(imageSource);
    }
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}