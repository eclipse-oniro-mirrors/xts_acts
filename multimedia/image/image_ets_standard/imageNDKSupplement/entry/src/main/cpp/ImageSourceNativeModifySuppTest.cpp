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
#include <bits/alltypes.h>
#include <fcntl.h>
#include <hilog/log.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_errors.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <native_color_space_manager/native_color_space_manager.h>
#include <native_window/external_window.h>
#include <string>
#include "GlUtilsTest.h"
#include "render_texture.h"
#include "ImageSourceNativeModifySuppTest.h"
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
#define MAX_BUFFER_SIZE 512


static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr uint32_t NUM_4 = 4;
static constexpr uint32_t NUM_5 = 2.0;

static constexpr uint32_t MAKER_NOTE_SIZE_MAX = 64 * 1024;


#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageEffectNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

#define OH_CREATEFROMFD_NUMBER_1 1
#define OH_CREATEFROMFD_NUMBER_3 3


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
int32_t* ParseIntArrayFromArg(napi_env env, napi_value arg, uint32_t* arrayLength)
{
    bool isArray = false;
    if (napi_is_array(env, arg, &isArray) != napi_ok || !isArray ||
        napi_get_array_length(env, arg, arrayLength) != napi_ok) {
        return nullptr;
    }
    int32_t *valueArray = static_cast<int32_t *>(malloc(*arrayLength * sizeof(int32_t)));
    if (valueArray == nullptr) {
        return nullptr;
    }
    for (uint32_t i = 0; i < *arrayLength; i++) {
        napi_value element;
        if (napi_get_element(env, arg, i, &element) != napi_ok ||
            napi_get_value_int32(env, element, &valueArray[i]) != napi_ok) {
            free(valueArray);
            return nullptr;
        }
    }
    return valueArray;
}
double* ParseDoubleArrayFromArg(napi_env env, napi_value arg, uint32_t* arrayLength)
{
    bool isArray = false;
    if (napi_is_array(env, arg, &isArray) != napi_ok || !isArray ||
        napi_get_array_length(env, arg, arrayLength) != napi_ok) {
        return nullptr;
    }
    double *valueArray = static_cast<double *>(malloc(*arrayLength * sizeof(double)));
    if (valueArray == nullptr) {
        return nullptr;
    }
    for (uint32_t i = 0; i < *arrayLength; i++) {
        napi_value element;
        if (napi_get_element(env, arg, i, &element) != napi_ok ||
            napi_get_value_double(env, element, &valueArray[i]) != napi_ok) {
            free(valueArray);
            return nullptr;
        }
    }
    return valueArray;
}
void* ParseArrayBufferFromArg(napi_env env, napi_value arg, size_t* bufferSize)
{
    bool isArrayBuffer = false;
    if (napi_is_arraybuffer(env, arg, &isArrayBuffer) != napi_ok || !isArrayBuffer) {
        return nullptr;
    }
    void *data = nullptr;
    if (napi_get_arraybuffer_info(env, arg, &data, bufferSize) != napi_ok) {
        return nullptr;
    }
    if (data == nullptr || *bufferSize == 0) {
        return nullptr;
    }
    void *copiedData = malloc(*bufferSize);
    if (copiedData == nullptr) {
        return nullptr;
    }
    std::copy(static_cast<const char*>(data), static_cast<const char*>(data) + *bufferSize,
        static_cast<char*>(copiedData));
    return copiedData;
}
napi_value OHImageSourceNativeModifyImagePropertyDoubleSupp(napi_env env, napi_callback_info info)
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
    Image_ErrorCode errCode;
    int32_t fd = 0;
    napi_get_value_int32(env, args[1], &fd);
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fd, &imageSource);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        napi_value ret;
        napi_create_int32(env, errCode, &ret);
        return ret;
    }
    Image_String key = CreateImageStringFromArg(env, args[2]);
    double propertyValue;
    switch (index) {
    case CASE_INDEX_1:
        propertyValue = 1.0;
        errCode = OH_ImageSourceNative_ModifyImagePropertyDouble(nullptr, &key, propertyValue);
        break;
    case CASE_INDEX_2:
        propertyValue = 'sss';
        errCode = OH_ImageSourceNative_ModifyImagePropertyDouble(imageSource, &key, propertyValue);
        break;
    case CASE_INDEX_3:
        propertyValue = NUM_5;
        errCode = OH_ImageSourceNative_ModifyImagePropertyDouble(imageSource, &key, propertyValue);
        break;
    case CASE_INDEX_4:
        propertyValue = 0.0;
        errCode = OH_ImageSourceNative_ModifyImagePropertyDouble(imageSource, &key, propertyValue);
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
napi_value ImageModifyImagePropertyIntArraySupp(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_4) {
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
    uint32_t arrayLength = 0;
    int32_t *valueArray = ParseIntArrayFromArg(env, args[3], &arrayLength);
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_ModifyImagePropertyIntArray(nullptr, &key, valueArray, arrayLength);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_ModifyImagePropertyIntArray(imageSource, &key, valueArray, arrayLength);
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
napi_value ImageModifyImagePropertyDoubleArraySupp(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_4) {
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
    uint32_t arrayLength = 0;
    double *valueArray = ParseDoubleArrayFromArg(env, args[3], &arrayLength);
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_ModifyImagePropertyDoubleArray(imageSource, &key, valueArray, arrayLength);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_ModifyImagePropertyDoubleArray(nullptr, &key, valueArray, arrayLength);
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
napi_value OHImageSourceNativeModifyImagePropertyBlobSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_4) {
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
    size_t bufferSize = 0;
    void *bufferData = ParseArrayBufferFromArg(env, args[3], &bufferSize);
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_ModifyImagePropertyBlob(imageSource, &key, bufferData, bufferSize);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_ModifyImagePropertyBlob(nullptr, &key, bufferData, bufferSize);
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
napi_value ImageModifyImagePropertyShortSupp(napi_env env, napi_callback_info info)
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
    LOGI("OH_ImageSourceNative_CreateFromUri, errCode: %{public}d", errCode);
    if (errCode != IMAGE_SUCCESS || imageSource == nullptr) {
        LOGE("Create ImageSource failed, errCode: %d", errCode);
        napi_value ret;
        napi_create_int32(env, errCode, &ret);
        return ret;
    }
    Image_String key = CreateImageStringFromArg(env, args[NUM_2]);
    uint32_t valueFromJS = 0;
    napi_get_value_uint32(env, args[NUM_3], &valueFromJS);
    uint16_t value = static_cast<uint16_t>(valueFromJS);
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_ModifyImagePropertyShort(nullptr, &key, value);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_ModifyImagePropertyShort(imageSource, &key, value);
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
napi_value OHImageSourceNativeGetImagePropertyBlobSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_4) {
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
        LOGI("Received key: %{public}s", key.data);
//    int32_t bufSizeFromJS = 0;
//    napi_get_value_int32(env, args[3], &bufSizeFromJS);
//    size_t bufSize = static_cast<size_t>(bufSizeFromJS);
//    char *value = new (std::nothrow) char[bufSize]();
    size_t bufferSize = 0;
    void *bufferData = ParseArrayBufferFromArg(env, args[3], &bufferSize);
    switch (index) {
    case CASE_INDEX_1:
        errCode= OH_ImageSourceNative_ModifyImagePropertyBlob(imageSource, &key, bufferData, bufferSize);
        LOGI("OH_ImageSourceNative_ModifyImagePropertyBlob: %{public}d,%{public}p,%{public}p,%{public}d", errCode,&key,bufferData,bufferSize);
        errCode = OH_ImageSourceNative_GetImagePropertyBlob(imageSource, &key, bufferData, bufferSize);
        LOGI("OH_ImageSourceNative_GetImagePropertyBlob: %{public}d,%{public}p,%{public}p,%{public}d", errCode,&key,bufferData,bufferSize);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_GetImagePropertyBlob(nullptr, &key, bufferData, bufferSize);
        break;
    default:
        break;
    }
    if (imageSource != nullptr) {
        OH_ImageSourceNative_Release(imageSource);
    }
//        delete[] value;
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}
napi_value OHImageSourceNativeGetImagePropertyStringSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 4;
    napi_value args[4] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < NUM_4) {
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
    int32_t bufSizeFromJS = 0;
    napi_get_value_int32(env, args[3], &bufSizeFromJS);
    size_t bufSize = static_cast<size_t>(bufSizeFromJS);
    char *value = new (std::nothrow) char[bufSize]();
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageSourceNative_GetImagePropertyString(imageSource, &key, value, bufSize);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageSourceNative_GetImagePropertyString(nullptr, &key, value, bufSize);
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