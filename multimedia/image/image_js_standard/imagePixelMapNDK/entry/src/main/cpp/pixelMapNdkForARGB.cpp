/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "napi/native_api.h"
#include "pixelMapNdkForDMA.h"
#include "common/log_common.h"
#include <node_api.h>
#include <bits/alltypes.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sstream>
#include <fstream>

#define NUM_0 0
#define NUM_1 1
#define NUM_2 2
#define NUM_3 3
#define NUM_4 4
#define NUM_5 5
#define NUM_500 500
#define MAX_PATH_SIZE 1024
#define MAX_STRING_SIZE 128

static napi_value CreatePixelMapByImageSourceFromUri(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_5] = {0};
    size_t argCount = NUM_5;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_5) {
        H_LOGE("CreateTestImageSource, the input parameters are smaller than the required parameters");
        return result;
    }

    const size_t maxUriLen = MAX_PATH_SIZE;
    char uri[maxUriLen] = "";
    size_t uriSize = NUM_0;
    napi_get_value_string_utf8(env, argValue[NUM_0], uri, maxUriLen, &uriSize);
    uint32_t temp = NUM_0;
    napi_get_value_uint32(env, argValue[NUM_1], &temp);
    PIXEL_FORMAT pixelFormat = static_cast<PIXEL_FORMAT>(temp);
    int32_t desiredDynamicRange;
    napi_get_value_int32(env, argValue[NUM_3], &desiredDynamicRange);
    napi_get_value_uint32(env, argValue[NUM_4], &temp);
    IMAGE_ALLOCATOR_TYPE allocatorType = static_cast<IMAGE_ALLOCATOR_TYPE>(temp);
    OH_ImageSourceNative *imageSource = nullptr;
    if (OH_ImageSourceNative_CreateFromUri(uri, uriSize, &imageSource) != IMAGE_SUCCESS) {
        H_LOGE("CreateTestImageSource create image source from url failed");
        return result;
    }
    OH_DecodingOptions *ops = nullptr;
    if (OH_DecodingOptions_Create(&ops) != IMAGE_SUCCESS) {
        H_LOGE("OH_DecodingOptions_Create failed");
        return result;
    }
    if (OH_DecodingOptions_SetPixelFormat(ops, pixelFormat) != IMAGE_SUCCESS) {
        H_LOGE("OH_DecodingOptions_SetPixelFormat failed");
        return result;
    }
    if (OH_DecodingOptions_SetDesiredDynamicRange(ops, desiredDynamicRange) != IMAGE_SUCCESS) {
        H_LOGE("OH_DecodingOptions_SetDesiredDynamicRange failed");
        return result;
    }
    OH_PixelmapNative *pixelMap = nullptr;
    Image_Size desiredSize = {NUM_500, NUM_500};
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredSize(ops, &desiredSize);
    if (errCode != IMAGE_SUCCESS) {
        OH_DecodingOptions_Release(ops);
        OH_ImageSourceNative_Release(imageSource);
        H_LOGE("OH_DecodingOptions_SetDesiredSize failed");
        return result;
    }
    bool isAlloactorType = false;
    napi_get_value_bool(env, argValue[NUM_2], &isAlloactorType);
    if (isAlloactorType) {
        H_LOGI("In CreatePixelmapUsingAllocator");
        errCode = OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, ops, allocatorType, &pixelMap);
    } else {
        H_LOGI("In CreatePixelmap");
        errCode = OH_ImageSourceNative_CreatePixelmap(imageSource, ops, &pixelMap);
    }
    OH_DecodingOptions_Release(ops);
    OH_ImageSourceNative_Release(imageSource);
    if (errCode != IMAGE_SUCCESS) {
        H_LOGE("CreatePixelmap failed, error code is: %{public}d", errCode);
        napi_value resultNapi = nullptr;
        napi_create_int32(env, errCode, &resultNapi);
        return resultNapi;
    } else {
        H_LOGI("CreatePixelmap success!");
    }
    napi_create_external(env, reinterpret_cast<void *>(pixelMap), nullptr, nullptr, &result);
    return result;
}

static napi_value CreatePixelMapByImageSourceFromBuffer(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        H_LOGE("CreateTestImageSource get file path failed");
        return result;
    }

    void *data = nullptr;
    size_t dataSize = 0;
    napi_status status = napi_get_buffer_info(env, argValue[NUM_0], &data, &dataSize);
    uint32_t temp = 0;
    napi_get_value_uint32(env, argValue[NUM_1], &temp);
    PIXEL_FORMAT pixelFormat = static_cast<PIXEL_FORMAT>(temp);
    OH_ImageSourceNative *imageSource = nullptr;
    if (OH_ImageSourceNative_CreateFromData(reinterpret_cast<uint8_t *>(data), dataSize, &imageSource)
         != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "CreateTestImageSource create image source from url failed");
        return result;
    }
    OH_DecodingOptions *ops = nullptr;
    if (OH_DecodingOptions_Create(&ops) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_DecodingOptions_Create failed");
        return result;
    }
    if (OH_DecodingOptions_SetPixelFormat(ops, pixelFormat) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_DecodingOptions_SetPixelFormat failed");
        return result;
    }
    OH_PixelmapNative *pixelMap = nullptr;
    if (OH_ImageSourceNative_CreatePixelmap(imageSource, ops, &pixelMap) != IMAGE_SUCCESS) {
        OH_DecodingOptions_Release(ops);
        OH_ImageSourceNative_Release(imageSource);
        napi_throw_error(env, nullptr, "create pixelmap by imageSource failed");
        return result;
    }

    OH_DecodingOptions_Release(ops);
    OH_ImageSourceNative_Release(imageSource);
    napi_create_external(env, reinterpret_cast<void *>(pixelMap), nullptr, nullptr, &result);
    return result;
}

static napi_value GetPixelmapPixelFormat(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        napi_throw_error(env, nullptr, "PixelMap is nullptr,GetPixelmapImageSize failed");
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PixelmapNative *pixelMap = reinterpret_cast<OH_PixelmapNative *>(ptr);

    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    if (OH_PixelmapNative_GetImageInfo(pixelMap, imageInfo) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PixelmapNative_GetImageInfo failed");
        return result;
    }
    int32_t pixelFormat;
    if (OH_PixelmapImageInfo_GetPixelFormat(imageInfo, &pixelFormat) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PixelmapImageInfo_GetPixelFormat failed");
        return result;
    }

    OH_PixelmapImageInfo_Release(imageInfo);
    napi_create_int32(env, pixelFormat, &result);
    return result;
}

static napi_value PixelMapRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        napi_throw_error(env, nullptr, "PixelMap is nullptr,GetPixelmapImageSize failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PixelmapNative *pixelMap = reinterpret_cast<OH_PixelmapNative *>(ptr);

    Image_ErrorCode errCode = OH_PixelmapNative_Release(pixelMap);
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value PackPixelMapToData(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;

    napi_get_undefined(env, &result);
    napi_create_int32(env, -1, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        H_LOGI("PackToDataFromPicture: failed to get input arguments!");
        return result;
    }

    OH_ImagePackerNative *packer = nullptr;
    if (OH_ImagePackerNative_Create(&packer) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "CreateTestImagePacker create image packer failed");
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PixelmapNative *pixMap = reinterpret_cast<OH_PixelmapNative *>(ptr);
    ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PackingOptions *opts = reinterpret_cast<OH_PackingOptions *>(ptr);
    uint8_t *outBuffer = nullptr;
    size_t outBufferSize = 0;
    napi_get_buffer_info(env, argValue[NUM_2], (void **)&outBuffer, &outBufferSize);

    Image_ErrorCode errCode = OH_ImagePackerNative_PackToDataFromPixelmap(
        packer, opts, pixMap, outBuffer, &outBufferSize);
    if (OH_ImagePackerNative_Release(packer) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_ImagePackerNative_Release Failed");
        return result;
    }
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value PackPixelMapToFile(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;

    napi_get_undefined(env, &result);
    napi_create_int32(env, -1, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        H_LOGI("PackToDataFromPicture: failed to get input arguments!");
        return result;
    }

    OH_ImagePackerNative *packer = nullptr;
    if (OH_ImagePackerNative_Create(&packer) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "CreateTestImagePacker create image packer failed");
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PixelmapNative *pixMap = reinterpret_cast<OH_PixelmapNative *>(ptr);
    ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PackingOptions *opts = reinterpret_cast<OH_PackingOptions *>(ptr);
    int fd;
    napi_get_value_int32(env, argValue[NUM_2], &fd);

    Image_ErrorCode errCode = OH_ImagePackerNative_PackToFileFromPixelmap(packer, opts, pixMap, fd);
    if (OH_ImagePackerNative_Release(packer) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_ImagePackerNative_Release Failed");
        return result;
    }
    napi_create_int32(env, errCode, &result);
    return result;
}

static napi_value CreatePackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;

    napi_get_undefined(env, &result);

    OH_PackingOptions *res = nullptr;
    Image_ErrorCode errorCode = OH_PackingOptions_Create(&res);
    if (errorCode != IMAGE_SUCCESS) {
        napi_create_int32(env, errorCode, &result);
        return result;
    }

    napi_status status = napi_create_external(env, reinterpret_cast<void *>(res), nullptr, nullptr, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create external object");
        return nullptr;
    }
    return result;
}

static napi_value SetMimeTypeToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        H_LOGI("SetMimeTypeToTestPackingOptions get MimeType failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    char format[MAX_STRING_SIZE] = {0};
    size_t formatSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_1], format, MAX_STRING_SIZE, &formatSize);
    Image_MimeType mimeType = {.data = format, .size = formatSize};

    if (OH_PackingOptions_SetMimeType(packingOptions, &mimeType) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PackingOptions_SetMimeType failed");
        return result;
    }
    return result;
}

static napi_value SetNeedsPackPropertiesToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        H_LOGI("SetNeedsPackPropertiesToTestPackingOptions get needsPackProperties failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    bool needsPackProperties = true;
    napi_get_value_bool(env, argValue[NUM_1], &needsPackProperties);

    if (OH_PackingOptions_SetNeedsPackProperties(packingOptions, needsPackProperties) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PackingOptions_SetNeedsPackProperties failed");
        return result;
    }
    return result;
}
static napi_value SetDynamicRangeToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        H_LOGI("SetDynamicRangeToTestPackingOptions get DynamicRange failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    int32_t desiredDynamicRange = 0;
    napi_get_value_int32(env, argValue[NUM_1], &desiredDynamicRange);

    if (OH_PackingOptions_SetDesiredDynamicRange(packingOptions, desiredDynamicRange) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PackingOptions_SetDesiredDynamicRange failed");
        return result;
    }
    return result;
}

static napi_value SetQualityToTestPackingOptions(napi_env env, napi_callback_info info)
{
    napi_value result;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        H_LOGI("SetQualityToTestPackingOptions get Quality failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    int32_t quality = 0;
    napi_get_value_int32(env, argValue[NUM_1], &quality);

    if (OH_PackingOptions_SetQuality(packingOptions, quality) != IMAGE_SUCCESS) {
        napi_throw_error(env, nullptr, "OH_PackingOptions_SetQuality failed");
        return result;
    }

    return result;
}

static napi_value PackingOptionsRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        napi_throw_error(env, nullptr, "PixelMap is nullptr,GetPixelmapImageSize failed");
        return result;
    }

    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_PackingOptions *packingOptions = reinterpret_cast<OH_PackingOptions *>(ptr);

    Image_ErrorCode errCode = OH_PackingOptions_Release(packingOptions);
    napi_create_int32(env, errCode, &result);
    return result;
}

EXTERN_C_START static napi_value InitARGB(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"CreatePixelMapByImageSourceFromBuffer", nullptr, CreatePixelMapByImageSourceFromBuffer,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreatePixelMapByImageSourceFromUri", nullptr, CreatePixelMapByImageSourceFromUri,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"GetPixelmapPixelFormat", nullptr, GetPixelmapPixelFormat, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PixelMapRelease", nullptr, PixelMapRelease, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PackPixelMapToData", nullptr, PackPixelMapToData, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PackPixelMapToFile", nullptr, PackPixelMapToFile, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"CreatePackingOptions", nullptr, CreatePackingOptions, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetMimeTypeToTestPackingOptions", nullptr, SetMimeTypeToTestPackingOptions,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetDynamicRangeToTestPackingOptions", nullptr, SetDynamicRangeToTestPackingOptions,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetQualityToTestPackingOptions", nullptr, SetQualityToTestPackingOptions,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"SetNeedsPackPropertiesToTestPackingOptions", nullptr, SetNeedsPackPropertiesToTestPackingOptions,
            nullptr, nullptr, nullptr, napi_default, nullptr},
        {"PackingOptionsRelease", nullptr, PackingOptionsRelease, nullptr, nullptr, nullptr, napi_default, nullptr}
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END
