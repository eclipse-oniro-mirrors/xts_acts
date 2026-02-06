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
#include "ImageReceiverNativeTest.h"
#include <cstdint>
#include <cstring>
#include <hilog/log.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/image_receiver_native.h>
#include <multimedia/image_framework/image/image_source_native.h>
#include <multimedia/image_framework/image_receiver_mdk.h>
#include <multimedia/image_framework/image_mdk.h>
#include <arkui/drawable_descriptor.h>
#define LOG_TAG "ImageReceiverNativeCpp"
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
#define MAX_BUFFER_SIZE 512
#define PARAM_2 2
#define PARAM_960000 960000
#define PARAM_200 200
#define PARAM_300 300
namespace {
    constexpr uint32_t NUM_0 = 0;
    constexpr uint32_t NUM_1 = 1;
    constexpr uint32_t NUM_2 = 2;
    constexpr uint32_t NUM_3 = 3;
    constexpr uint32_t NUM_4 = 4;
    constexpr size_t ID_SIZE = 64;
}
napi_value ImageReceiverNativeReadLatestImageTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageReceiverNative_ReadLatestImage start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageReceiverNative_ReadLatestImage error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    OH_ImageNative *image;
    errCode = OH_ImageReceiverNative_ReadLatestImage(receiver, &image);
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_ImageReceiverNative_ReadLatestImage(nullptr, &image);
        LOGI("OH_ImageReceiverNative_ReadLatestImage %{public}d", errCode);
        break;
    case CASE_INDEX_2:
        errCode = OH_ImageReceiverNative_ReadLatestImage(receiver, &image);
        LOGI("OH_ImageReceiverNative_ReadLatestImage %{public}d", errCode);
        break;
    case CASE_INDEX_3:
        errCode = OH_ImageReceiverNative_ReadLatestImage(receiver, nullptr);
        LOGI("OH_ImageReceiverNative_ReadLatestImage %{public}d", errCode);
        break;
    default:
        break;
    }
    napi_value result;
    napi_create_int32(env, errCode, &result);
    return result;
}
napi_value InitImageReceiverNativeTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageReceiverNative_ReadLatestImage start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageReceiverNative_ReadLatestImage error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    napi_ref reference;
    napi_create_reference(env, argValue[0], 1, &reference);
    napi_value imgReceiver_js;
    napi_get_reference_value(env, reference, &imgReceiver_js);
    ImageReceiverNative *imgReceiver = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        imgReceiver = OH_Image_Receiver_InitImageReceiverNative(nullptr, imgReceiver_js);
        LOGI("OH_ImageReceiverNative_ReadLatestImage %{public}d", imgReceiver);
        break;
    case CASE_INDEX_2:
        imgReceiver = OH_Image_Receiver_InitImageReceiverNative(env, nullptr);
        LOGI("OH_ImageReceiverNative_ReadLatestImage %{public}d", imgReceiver);
        break;
    default:
        break;
    }
    int code = 401;
    if (imgReceiver != nullptr) {
        code = 0;
    }
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}
static ImageNative* getNativeImage(napi_env env, napi_callback_info info)
{
    napi_value thisVar = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok ||
        argCount < NUM_1 || argValue[NUM_0] == nullptr) {
        return nullptr;
    }
    return OH_Image_InitImageNative(env, argValue[NUM_0]);
}
napi_value OHImageClipRectTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_Image_ClipRect start");
    napi_value thisVar = nullptr;
    napi_value argValue[1] = {0};
    size_t argCount = 1;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_Image_ClipRect error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    ImageNative* native = getNativeImage(env, info);
    LOGI("getNativeImageSucceed %{public}d");
    struct OhosImageRect rect;
    int32_t res = IMAGE_RESULT_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        res = OH_Image_ClipRect(nullptr, &rect);
        LOGI("OH_Image_ClipRect %{public}d", res);
        break;
    case CASE_INDEX_2:
        res = OH_Image_ClipRect(native, nullptr);
        LOGI("OH_Image_ClipRect %{public}d", res);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, res, &result);
    return result;
}
napi_value CreatePixelmapUsingAllocatorTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageSourceNative_CreatePixelmapUsingAllocator start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageSourceNative_CreatePixelmapUsingAllocator error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    int32_t fdNumber;
    napi_get_value_int32(env, argValue[1], &fdNumber);
    LOGI("get fdNumber %{public}d", fdNumber);
    char name[1024];
    size_t nameSize = 1024;
    napi_get_value_string_utf8(env, argValue[NUM_0], name, nameSize, &nameSize);
    Image_MimeType* mimeType = nullptr;
    size_t length = 0;
    Image_ErrorCode errCode = OH_ImageSourceNative_GetSupportedFormats(&mimeType, &length);
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fdNumber, &imageSource);
    LOGI("OH_ImageSourceNative_CreateFromFd %{public}d", errCode);
    OH_DecodingOptions *options = nullptr;
    OH_DecodingOptions_Create(&options);
    int32_t format = -1;
    OH_DecodingOptions_GetPixelFormat(options, &format);
    IMAGE_ALLOCATOR_TYPE allocatorType = IMAGE_ALLOCATOR_TYPE::IMAGE_ALLOCATOR_TYPE_DMA;  // 使用DMA创建pixelMap。
    OH_PixelmapNative *pixelmap = nullptr;
    int32_t resultValue =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, options, allocatorType, &pixelmap);
    switch (index) {
    case CASE_INDEX_1:
        resultValue =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(nullptr, options, allocatorType, &pixelmap);
        LOGI("OH_ImageSourceNative_CreatePixelmapUsingAllocator %{public}d", resultValue);
        break;
    case CASE_INDEX_2:
        resultValue =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, nullptr, allocatorType, &pixelmap);
        LOGI("OH_ImageSourceNative_CreatePixelmapUsingAllocator %{public}d", resultValue);
        break;
    case CASE_INDEX_3:
        resultValue =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, options, allocatorType, &pixelmap);
        LOGI("OH_ImageSourceNative_CreatePixelmapUsingAllocator %{public}d", resultValue);
        break;
    case CASE_INDEX_4:
        resultValue =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, options, allocatorType, &pixelmap);
        LOGI("OH_ImageSourceNative_CreatePixelmapUsingAllocator %{public}d", resultValue);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}
napi_value PixelmapNativeSetMemoryNameTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, 4);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, 6);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelmap = nullptr;
    Image_ErrorCode errCode =
        OH_PixelmapNative_CreatePixelmapUsingAllocator(data, dataSize, createOpts, IMAGE_ALLOCATOR_MODE_DMA, &pixelmap);
    char name[] = "testName";
    size_t len = strlen(name);
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_PixelmapNative_SetMemoryName(pixelmap, name, &len);
        LOGI("OH_PixelmapNative_SetMemoryName %{public}d", returnValue);
        break;
    case CASE_INDEX_2:
        OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmap);
        returnValue = OH_PixelmapNative_SetMemoryName(pixelmap, name, &len);
        LOGI("OH_PixelmapNative_SetMemoryName %{public}d", returnValue);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value ImageSourceNativeCreatePictureTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageSourceNative_CreatePicture start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageSourceNative_CreatePicture error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    int32_t fdNumber;
    napi_get_value_int32(env, argValue[1], &fdNumber);
    LOGI("get fdNumber %{public}d", fdNumber);
    char name[1024];
    size_t nameSize = 1024;
    napi_get_value_string_utf8(env, argValue[NUM_0], name, nameSize, &nameSize);
    Image_MimeType* mimeType = nullptr;
    size_t length = 0;
    Image_ErrorCode errCode = OH_ImageSourceNative_GetSupportedFormats(&mimeType, &length);
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fdNumber, &imageSource);
    LOGI("OH_ImageSourceNative_CreateFromFd %{public}d", errCode);
    OH_DecodingOptionsForPicture *decodingOptions = nullptr;
    errCode = OH_DecodingOptionsForPicture_Create(&decodingOptions);
    OH_PictureNative *picture = nullptr;
    int32_t resultValue =
        OH_ImageSourceNative_CreatePicture(imageSource, decodingOptions, &picture);
    switch (index) {
    case CASE_INDEX_1:
        resultValue =
        OH_ImageSourceNative_CreatePicture(imageSource, decodingOptions, &picture);
        LOGI("OH_ImageSourceNative_CreatePixelmapUsingAllocator %{public}d", resultValue);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}
napi_value ImageSourceNativeCreatePictureAtIndexTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_ImageSourceNative_CreatePicture start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_ImageSourceNative_CreatePicture error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    int32_t fdNumber;
    napi_get_value_int32(env, argValue[1], &fdNumber);
    LOGI("get fdNumber %{public}d", fdNumber);
    char name[1024];
    size_t nameSize = 1024;
    napi_get_value_string_utf8(env, argValue[NUM_0], name, nameSize, &nameSize);
    Image_MimeType* mimeType = nullptr;
    size_t length = 0;
    Image_ErrorCode errCode = OH_ImageSourceNative_GetSupportedFormats(&mimeType, &length);
    OH_ImageSourceNative *imageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromFd(fdNumber, &imageSource);
    LOGI("OH_ImageSourceNative_CreateFromFd %{public}d", errCode);
    OH_DecodingOptionsForPicture *decodingOptions = nullptr;
    errCode = OH_DecodingOptionsForPicture_Create(&decodingOptions);
    OH_PictureNative *picture = nullptr;
    int32_t resultValue =
        OH_ImageSourceNative_CreatePictureAtIndex(imageSource, NUM_1, &picture);
    switch (index) {
    case CASE_INDEX_1:
        resultValue =
        OH_ImageSourceNative_CreatePictureAtIndex(imageSource, NUM_1, &picture);
        LOGI("OH_ImageSourceNative_CreatePixelmapUsingAllocator %{public}d", resultValue);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, resultValue, &result);
    return result;
}
napi_value DecodingOptionsGetDesiredColorSpaceTest(napi_env env, napi_callback_info info)
{
    LOGI("OH_DecodingOptions_GetDesiredColorSpace start");
    napi_value thisVar = nullptr;
    napi_value argValue[2] = {0};
    size_t argCount = 2;
    if (napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr) != napi_ok || argCount < 1 ||
        argValue[0] == nullptr) {
        LOGI("OH_DecodingOptions_GetDesiredColorSpace error1");
        return nullptr;
    }
    int32_t index;
    napi_get_value_int32(env, argValue[0], &index);
    LOGI("get argValue %{public}d", index);
    int32_t fdNumber;
    napi_get_value_int32(env, argValue[1], &fdNumber);
    LOGI("get fdNumber %{public}d", fdNumber);
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    int32_t colorSpaceName;
    Image_ErrorCode errCode = OH_DecodingOptions_GetDesiredColorSpace(opts, &colorSpaceName);
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_DecodingOptions_GetDesiredColorSpace(nullptr, &colorSpaceName);
        LOGI("OH_DecodingOptions_GetDesiredColorSpace %{public}d", errCode);
        break;
    default:
        break;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    return result;
}
