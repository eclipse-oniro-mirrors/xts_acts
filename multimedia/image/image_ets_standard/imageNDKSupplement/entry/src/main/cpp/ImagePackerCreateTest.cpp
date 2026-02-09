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
#include "ImagePackerCreateTest.h"
#include <cstdlib>
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image_source_mdk.h>
#include <multimedia/image_framework/image_packer_mdk.h>

constexpr size_t SIZE_ZERO = 0;
constexpr size_t SIZE_ONE = 1;
constexpr size_t SIZE_TWO = 2;
constexpr size_t SIZE_THREE = 3;
constexpr size_t SIZE_FOUR = 4;
constexpr size_t SIZE_FIVE = 5;
constexpr size_t DEFAULT_PACKING_SIZE = 25 * 1024 * 1024;
constexpr uint32_t ARGS_FIRST = 0;
constexpr uint32_t ARGS_SECOND = 1;
constexpr uint32_t ARGS_THIRD = 2;
constexpr uint32_t ARGS_FOURTH = 3;
constexpr int32_t INVALID_FD = -1;

#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImagePackerCreateCpp"
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
#define OPTION_QUALITY 95
#define TAG "CppImageNdk.ImagePackerCreateTest"
static constexpr size_t TEST_SIZE = 0;
constexpr int TEST_ARG_SUM = 1;
#define IMAGE_RESULT_OPERATION_FAILED (-3)

napi_value ImagePackerCreateTest(napi_env env, napi_callback_info info)
{
    size_t argc = TEST_ARG_SUM;
    napi_value args[TEST_ARG_SUM] = {nullptr};
    napi_status status = napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (status != napi_ok || argc != TEST_ARG_SUM) {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
    // 2. 将JS传入的index转为C++的int32_t
    int32_t index = 0;
    status = napi_get_value_int32(env, args[0], &index);
    if (status != napi_ok) {
        napi_value result = nullptr;
        napi_create_int32(env, -1, &result);
        return result;
    }
    napi_value imagePacker = nullptr;
    int32_t returnValue = IMAGE_RESULT_OPERATION_FAILED; // 初始化为默认错误
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_ImagePacker_Create(env, &imagePacker);
        break;
    case CASE_INDEX_2:
        returnValue = OH_ImagePacker_Create(nullptr, &imagePacker);
        break;
    case CASE_INDEX_3:
        returnValue = OH_ImagePacker_Create(env, nullptr);
        break;
    default:
        returnValue = IMAGE_RESULT_INVALID_PARAMETER;
        break;
    }
    napi_value result;
    napi_create_int32(env, returnValue, &result);
    return result;
}

napi_value ImagePackerInitNativeTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImagePacker_Create start");
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO];
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImagePacker_PackToData error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    napi_value imagePacker = nullptr;
    int32_t createRet = IMAGE_RESULT_INVALID_PARAMETER;
    switch (index) {
    case CASE_INDEX_1:
        createRet = OH_ImagePacker_Create(env, &imagePacker);
        LOGI("OH_ImagePacker_PackToData %{public}d", createRet);
        break;
    case CASE_INDEX_2:
        createRet = OH_ImagePacker_Create(nullptr, &imagePacker);
        LOGI("OH_ImagePacker_PackToData %{public}d", createRet);
        break;
    case CASE_INDEX_3:
        createRet = OH_ImagePacker_Create(env, nullptr);
        LOGI("OH_ImagePacker_PackToData %{public}d", createRet);
        break;
    default:
        break;
    }
    // 7. 返回错误码给ArkTS层（NAPI转换为JS整数）
    napi_value result = nullptr;
    napi_create_int32(env, createRet, &result);
    return result;
}

napi_value ImagePackerPackToDataTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImagePacker_PackToData start");
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO];
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImagePacker_PackToData error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    int32_t fdNumber;
    napi_get_value_int32(env, argValue[1], &fdNumber);
    LOGI("get fdNumber %{public}d", fdNumber);
    struct OhosImageSourceOps options = {.density = 0, .pixelFormat = 0, .size = {.width = 0, .height = 0}};
    napi_value imageSource = nullptr;
    int32_t code = OH_ImageSource_CreateFromFd(env, fdNumber, &options, &imageSource);
    LOGI("OH_ImageSource_CreateFromFd %{public}d", code);
    // 使用napi_value承接创建的编码器对象。
    napi_value packer;
    // 通过napi_env创建编码器，返回result为IMAGE_RESULT_SUCCESS则创建成功。
    int32_t errorCode = OH_ImagePacker_Create(env, &packer);
    // 通过napi_env及上述创建的编码器对象初始化实例对象。
    ImagePacker_Native *nativePacker = OH_ImagePacker_InitNative(env, packer);
    // 编码参数。
    struct ImagePacker_Opts_ opts;
    // 配置编码格式（必须）。
    opts.format = "image/jpeg";
    // 配置编码质量（必须）。
    opts.quality = OPTION_QUALITY;
    // 配置输出的缓存区大小为4k（缓存区大小视应用场景定）。
    size_t bufferSize = 4 * 1024;
    // 申请图片编码缓存区。
    uint8_t *outData = (uint8_t *)(malloc(bufferSize));
    // 开始对输入source进行编码过程，返回result为IMAGE_RESULT_SUCCESS则编码成功，同时bufferSize中包含编码实际使用缓存区大小。
    int32_t packRet = IMAGE_RESULT_OPERATION_FAILED;
    switch (index) {
    case CASE_INDEX_1:
        packRet = OH_ImagePacker_PackToData(nativePacker, imageSource, &opts, outData, &bufferSize);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    case CASE_INDEX_2:
        packRet = OH_ImagePacker_PackToData(nullptr, imageSource, &opts, outData, &bufferSize);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    case CASE_INDEX_3:
        packRet = OH_ImagePacker_PackToData(nativePacker, nullptr, &opts, outData, &bufferSize);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    case CASE_INDEX_4:
        packRet = OH_ImagePacker_PackToData(nativePacker, imageSource, nullptr, outData, &bufferSize);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    case CASE_INDEX_5:
        packRet = OH_ImagePacker_PackToData(nativePacker, imageSource, &opts, nullptr, &bufferSize);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    case CASE_INDEX_6:
        packRet = OH_ImagePacker_PackToData(nativePacker, imageSource, &opts, outData, nullptr);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    default:
        break;
    }
    free(outData);
    outData = NULL;
    errorCode = OH_ImagePacker_Release(nativePacker);
    napi_value result;
    napi_create_int32(env, packRet, &result);
    return result;
}
napi_value ImagePackerPackToFileTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImagePacker_PackToData start");
    napi_value thisVar = nullptr;
    napi_value argValue[SIZE_TWO];
    size_t argCount = SIZE_TWO;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImagePacker_PackToData error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    int32_t fdNumber;
    napi_get_value_int32(env, argValue[1], &fdNumber);
    LOGI("get fdNumber %{public}d", fdNumber);
    struct OhosImageSourceOps options = {.density = 0, .pixelFormat = 0, .size = {.width = 0, .height = 0}};
    napi_value imageSource = nullptr;
    int32_t code = OH_ImageSource_CreateFromFd(env, fdNumber, &options, &imageSource);
    LOGI("OH_ImageSource_CreateFromFd %{public}d", code);
    // 使用napi_value承接创建的编码器对象。
    napi_value packer;
    // 通过napi_env创建编码器，返回result为IMAGE_RESULT_SUCCESS则创建成功。
    int32_t errorCode = OH_ImagePacker_Create(env, &packer);
    // 通过napi_env及上述创建的编码器对象初始化实例对象。
    ImagePacker_Native *nativePacker = OH_ImagePacker_InitNative(env, packer);
    // 编码参数。
    struct ImagePacker_Opts_ opts;
    // 配置编码格式（必须）。
    opts.format = "image/jpeg";
    // 配置编码质量（必须）。
    opts.quality = OPTION_QUALITY;
    // 配置输出的缓存区大小为4k（缓存区大小视应用场景定）。
    int32_t packRet = IMAGE_RESULT_OPERATION_FAILED;
    switch (index) {
    case CASE_INDEX_1:
        packRet = OH_ImagePacker_PackToFile(nativePacker, imageSource, &opts, fdNumber);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    case CASE_INDEX_2:
        packRet = OH_ImagePacker_PackToFile(nullptr, imageSource, &opts, fdNumber);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    case CASE_INDEX_3:
        packRet = OH_ImagePacker_PackToFile(nativePacker, nullptr, &opts, fdNumber);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    case CASE_INDEX_4:
        packRet = OH_ImagePacker_PackToFile(nativePacker, imageSource, nullptr, fdNumber);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    case CASE_INDEX_5:
        packRet = OH_ImagePacker_PackToFile(nativePacker, imageSource, &opts, -1);
        LOGI("OH_ImagePacker_PackToData %{public}d", packRet);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, packRet, &result);
    return result;
}
