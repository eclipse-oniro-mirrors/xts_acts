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

#include "napi/native_api.h"
#include "utils/CommonUtilsTest.h"
#include "utils/PixelmapHelperTest.h"
#include <cstdint>
#include <hilog/log.h>


#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include <multimedia/image_framework/image_receiver_mdk.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/pixelmap_native.h>
#include "OHImageSourceNativeSupplementTest.h"

#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageEffectNDK"
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
#define PROP_KEY_EXAMPLE "image_size"
#define OH_CREATEFROMFD_NUMBER_3 3
#define OH_CREATEFROMFD_NUMBER_1 1
#define OH_INVALID_PIXELMAP nullptr
#define IMAGE_INVALID_BUFFER_SIZE -1
#define MAX_ALLOWED_SIZE 100
#define ERR_INVALID_BUFFER_SIZE -2

static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr uint32_t NUM_4 = 4;
static constexpr uint32_t NUM_6 = 6;
static constexpr uint32_t NUM_10 = 10;
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

void FreeImageString(Image_String &imgStr)
{
    if (imgStr.data != nullptr) {
        free(imgStr.data);
        imgStr.data = nullptr;
    }
}


napi_value OHImageSourceNativeGetImagePropertyIntArraySupp(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_4;
    napi_value args[NUM_4] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_4) {
        return result;
    }
    int32_t index;
    napi_get_value_int32(env, args[NUM_0], &index);

    int32_t fd = 0;
    napi_get_value_int32(env, args[NUM_1], &fd);
    Image_ErrorCode errCode;
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOGI("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    Image_String key = CreateImageStringFromArg(env, args[NUM_2]);
    int32_t bufSize = 1;
    napi_get_value_int32(env, args[NUM_3], &bufSize);
    size_t size = static_cast<size_t>(bufSize);
    if (size == 0 || size > MAX_ALLOWED_SIZE) {
        LOGE("createImageSource Invalid buffer size: %{public}zu", size);
        FreeImageString(key);
        napi_create_int32(env, ERR_INVALID_BUFFER_SIZE, &result);
        return result;
    }
    int32_t *value = new (std::nothrow) int32_t[bufSize]();
    if (value == nullptr) {
        FreeImageString(key);
        return result;
    }
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_GetImagePropertyIntArray(nullptr, &key, value, size);
        break;
    case CASE_INDEX_2:
        size = NUM_10;
        errCode = OH_ImageSourceNative_GetImagePropertyIntArray(imageSource, &key, value, size);
        break;
    default:
        break;
    }

    FreeImageString(key);
    delete[] value;
    if (imageSource != nullptr) {
        OH_ImageSourceNative_Release(imageSource);
    }
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}


napi_value ImageSourceNativeGetImagePropertyDoubleArraySupp(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_4;
    napi_value args[NUM_4] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_4) {
        return result;
    }
    int32_t index;
    napi_get_value_int32(env, args[NUM_0], &index);

    int32_t fd = 0;
    napi_get_value_int32(env, args[NUM_1], &fd);
    Image_ErrorCode errCode;
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOGI("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }
    Image_String key = CreateImageStringFromArg(env, args[NUM_2]);
    int32_t bufSize = 1;
    if (bufSize <= 0) {
    LOGI("createImageSource: Invalid buffer size: %{public}d", bufSize);
    FreeImageString(key);
    napi_create_int32(env, IMAGE_INVALID_BUFFER_SIZE, &result);
    return result;
}
    napi_get_value_int32(env, args[NUM_3], &bufSize);
    size_t size = static_cast<size_t>(bufSize);
    double *value = new (std::nothrow) double[bufSize]();
    if (value == nullptr) {
        FreeImageString(key);
        return result;
    }
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_GetImagePropertyDoubleArray(nullptr, &key, value, size);
        break;
    case CASE_INDEX_2:
        size = NUM_6;
        errCode = OH_ImageSourceNative_GetImagePropertyDoubleArray(imageSource, &key, value, size);
        break;
    default:
        break;
    }

    FreeImageString(key);
    delete[] value;
    if (imageSource != nullptr) {
        OH_ImageSourceNative_Release(imageSource);
    }
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}

napi_value OHImageSourceNativeModifyImagePropertyLongSupp(napi_env env, napi_callback_info info)
{
    size_t argc = NUM_4;
    napi_value args[NUM_4] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_3) {
        return result;
    }
    int32_t index;
    napi_get_value_int32(env, args[NUM_0], &index);

    int32_t fd = 0;
    napi_get_value_int32(env, args[NUM_1], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOGI("createImageSource: Failed to create imageSource, error code: %{public}d", errCode);
        napi_create_int32(env, errCode, &result);
        return result;
    }

    Image_String key = CreateImageStringFromArg(env, args[NUM_2]);
    uint32_t value = 0;
    if (napi_get_value_uint32(env, args[NUM_3], &value) != napi_ok) {
        LOGI("ModifyImagePropertyLong: Failed to get value parameter");
        FreeImageString(key);
        return result;
    }
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_ModifyImagePropertyLong(nullptr, &key, value);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_ModifyImagePropertyLong(imageSource, &key, value);
        break;
    default:
        break;
    }

    FreeImageString(key);
    if (imageSource != nullptr) {
        OH_ImageSourceNative_Release(imageSource);
    }
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}
napi_value ImageErrCodeSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    int32_t number;
    switch (index) {
    case CASE_INDEX_1:
        number = Image_ErrorCode::IMAGE_GET_IMAGE_DATA_FAILED;
        break;
    case CASE_INDEX_2:
        number = Image_ErrorCode::IMAGE_SOURCE_UNSUPPORTED_METADATA;
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, number, &ret);
    return ret;
}