/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include "ImagePackerNative1Test.h"
#include "hilog/log.h"
#include "multimedia/image_framework/image/image_receiver_native.h"
#include "node_api.h"

#include <multimedia/image_framework/image/image_packer_native.h>

#include <vector>

using namespace std;

#define IMAGE_LOG_TAG "IMAGE_RECEIVER_TAGLOG"
#define IMAGE_LOG_DOMAIN 0x3200

#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_INFO, IMAGE_LOG_DOMAIN, IMAGE_LOG_TAG, fmt, ##__VA_ARGS__)

static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr uint32_t NUM_4 = 4;

static constexpr int32_t NUM_1000 = 1000;
static constexpr int32_t NUM_2000 = 2000;
static constexpr int32_t NUM_3000 = 3000;
#define MAX_BUFFER_SIZE 512
OH_PixelmapNative *TEST_PIXELMAP_TEMP = nullptr;


napi_value PackerCreate(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);

    OH_ImagePackerNative *res = nullptr;
    Image_ErrorCode errCode = OH_ImagePackerNative_Create(&res);
    if (errCode != IMAGE_SUCCESS) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_status status = napi_create_external(env, reinterpret_cast<void *>(res), nullptr, nullptr, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create external object");
        return nullptr;
    }
    return result;
}

napi_value CreateFromFd(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    int32_t fd;
    napi_get_value_int32(env, argValue[NUM_0], &fd);
    if (fd < 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    OH_ImageSourceNative *res = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(fd, &res);
    if (errCode != IMAGE_SUCCESS) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_status status = napi_create_external(env, reinterpret_cast<void *>(res), nullptr, nullptr, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create external object");
        return nullptr;
    }
    return result;
}

napi_value CreateDecodingOptions(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    OH_DecodingOptions *deops;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&deops);
    if (IMAGE_SUCCESS != errCode) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    napi_status status = napi_create_external(env, reinterpret_cast<void *>(deops), nullptr, nullptr, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create external object");
        return nullptr;
    }
    return result;
}

napi_value CreatePixelMapWithImageSoure(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok) {
        return result;
    }
    void *ptr = nullptr;
    napi_status status = napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImageSourceNative *imageSource = reinterpret_cast<OH_ImageSourceNative *>(ptr);

    OH_DecodingOptions *decodeOpts = nullptr;
    if (argCount == NUM_2) {
        status = napi_get_value_external(env, argValue[NUM_1], &ptr);
        decodeOpts = reinterpret_cast<OH_DecodingOptions *>(ptr);
    }
    OH_PixelmapNative *resPixMap = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreatePixelmap(imageSource, decodeOpts, &resPixMap);
    if (errCode != IMAGE_SUCCESS) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if (TEST_PIXELMAP_TEMP != nullptr) {
        errCode = OH_PixelmapNative_Release(TEST_PIXELMAP_TEMP);
        if (errCode != IMAGE_SUCCESS) {
            return result;
        }
    }
    TEST_PIXELMAP_TEMP = resPixMap;

    status = napi_create_external(env, reinterpret_cast<void *>(resPixMap), nullptr, nullptr, &result);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create external object");
        return result;
    }
    return result;
}

napi_value JSPackToDataFromImageSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_4) {
        return result;
    }

    void *ptr = nullptr;
    napi_status status = napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImagePackerNative *packer = reinterpret_cast<OH_ImagePackerNative *>(ptr);

    ptr = nullptr;
    status = napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PackingOptions *opts = reinterpret_cast<OH_PackingOptions *>(ptr);

    ptr = nullptr;
    status = napi_get_value_external(env, argValue[NUM_2], &ptr);
    OH_ImageSourceNative *imageSource = reinterpret_cast<OH_ImageSourceNative *>(ptr);

    uint8_t *outBuffer = nullptr;
    size_t outBufferSize = 0;

    status = napi_get_buffer_info(env, argValue[NUM_3], (void **)&outBuffer, &outBufferSize);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create napi_get_buffer_info object");
        return result;
    }
    Image_ErrorCode errCode =
        OH_ImagePackerNative_PackToDataFromImageSource(packer, opts, imageSource, outBuffer, &outBufferSize);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackToDataFromImageSourceBadParamter(napi_env env, napi_callback_info info)
{
    size_t outBufferSize = 0;
    Image_ErrorCode errCode =
        OH_ImagePackerNative_PackToDataFromImageSource(nullptr, nullptr, nullptr, nullptr, &outBufferSize);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackToDataFromPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_4) {
        return result;
    }

    void *ptr = nullptr;
    napi_status status = napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImagePackerNative *packer = reinterpret_cast<OH_ImagePackerNative *>(ptr);

    ptr = nullptr;
    status = napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PackingOptions *opts = reinterpret_cast<OH_PackingOptions *>(ptr);

    ptr = nullptr;
    status = napi_get_value_external(env, argValue[NUM_2], &ptr);
    OH_PixelmapNative *pixMap = reinterpret_cast<OH_PixelmapNative *>(ptr);

    Image_MimeType mineType;
    OH_PackingOptions_GetMimeType(opts, &mineType);

    uint8_t *outBuffer = nullptr;
    size_t outBufferSize = 0;

    status = napi_get_buffer_info(env, argValue[NUM_3], (void **)&outBuffer, &outBufferSize);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create napi_get_buffer_info object");
        return result;
    }
    Image_ErrorCode errCode =
        OH_ImagePackerNative_PackToDataFromPixelmap(packer, opts, pixMap, outBuffer, &outBufferSize);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackToDataFromPixelmapBadParamter(napi_env env, napi_callback_info info)
{
    uint8_t *outBuffer = nullptr;
    size_t outBufferSize = 0;
    Image_ErrorCode errCode =
        OH_ImagePackerNative_PackToDataFromPixelmap(nullptr, nullptr, nullptr, outBuffer, &outBufferSize);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackToDataFromPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;

    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_4) {
        return result;
    }

    void *ptr = nullptr;
    napi_status status = napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImagePackerNative *packer = reinterpret_cast<OH_ImagePackerNative *>(ptr);

    ptr = nullptr;
    status = napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PackingOptions *opts = reinterpret_cast<OH_PackingOptions *>(ptr);

    ptr = nullptr;
    status = napi_get_value_external(env, argValue[NUM_2], &ptr);
    OH_PixelmapNative *pixMap = reinterpret_cast<OH_PixelmapNative *>(ptr);

    Image_MimeType mineType;
    OH_PackingOptions_GetMimeType(opts, &mineType);

    uint8_t *outBuffer = nullptr;
    size_t outBufferSize = 0;

    status = napi_get_buffer_info(env, argValue[NUM_3], (void **)&outBuffer, &outBufferSize);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create napi_get_buffer_info object");
        return result;
    }
    OH_PictureNative *picture = nullptr;
    OH_PictureNative_CreatePicture(pixMap, &picture);
    
    Image_ErrorCode errCode =
        OH_ImagePackerNative_PackToDataFromPicture(packer, opts, picture, outBuffer, &outBufferSize);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackToDataFromPictureBadParamter(napi_env env, napi_callback_info info)
{
    size_t outBufferSize = 0;
    Image_ErrorCode res =
        OH_ImagePackerNative_PackToDataFromPicture(nullptr, nullptr, nullptr, nullptr, &outBufferSize);
    int32_t resultValue = res == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackToDataFromPixelmapSequence(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_3] = {0};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        return result;
    }
    void *ptr = nullptr;
    napi_status status = napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImagePackerNative *packer = reinterpret_cast<OH_ImagePackerNative *>(ptr);
    
    ptr = nullptr;
    status = napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PixelmapNative *pixMap = reinterpret_cast<OH_PixelmapNative *>(ptr);
    
    uint8_t *outBuffer = nullptr;
    size_t outBufferSize = 0;
    status = napi_get_buffer_info(env, argValue[NUM_2], (void **)&outBuffer, &outBufferSize);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Failed to create napi_get_buffer_info object");
        return result;
    }
    OH_PackingOptionsForSequence* option = nullptr;
    Image_ErrorCode errCode = OH_PackingOptionsForSequence_Create(&option);
    OH_PackingOptionsForSequence_SetFrameCount(option, NUM_3);
    int32_t delayTimeList = 10;
    size_t delayTimeListLength = NUM_1;
    OH_PackingOptionsForSequence_SetDelayTimeList(option, &delayTimeList, delayTimeListLength);
    OH_PackingOptionsForSequence_SetLoopCount(option, NUM_3);
    uint32_t types[] = {NUM_3, NUM_3, NUM_3};
    size_t count = sizeof(types) / sizeof(types[0]);
    OH_PackingOptionsForSequence_SetDisposalTypes(option, types, count);
    
    std::vector<OH_PixelmapNative*> pixelMaps;
    pixelMaps.push_back(pixMap);
    
    errCode = OH_ImagePackerNative_PackToDataFromPixelmapSequence(packer, option,
        pixelMaps.data(), NUM_1, outBuffer, &outBufferSize);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackToDataFromPixelmapSequenceBadParamter(napi_env env, napi_callback_info info)
{
    size_t outBufferSize = 0;
    Image_ErrorCode errCode =
        OH_ImagePackerNative_PackToDataFromPixelmapSequence(nullptr, nullptr, nullptr, NUM_1, nullptr, &outBufferSize);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackToFileFromImageSource(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;
    napi_get_undefined(env, &result);

    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_4) {
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImagePackerNative *packer = reinterpret_cast<OH_ImagePackerNative *>(ptr);
    ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PackingOptions *opts = reinterpret_cast<OH_PackingOptions *>(ptr);
    ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_2], &ptr);
    OH_ImageSourceNative *imageSource = reinterpret_cast<OH_ImageSourceNative *>(ptr);

    int fd;
    napi_get_value_int32(env, argValue[NUM_3], &fd);

    Image_ErrorCode errCode = OH_ImagePackerNative_PackToFileFromImageSource(packer, opts, imageSource, fd);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackToFileFromImageSourceBadParamter(napi_env env, napi_callback_info info)
{
    int fd = NUM_4;
    Image_ErrorCode errCode = OH_ImagePackerNative_PackToFileFromImageSource(nullptr, nullptr, nullptr, fd);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSPackToFileFromPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_4) {
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImagePackerNative *packer = reinterpret_cast<OH_ImagePackerNative *>(ptr);

    ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PackingOptions *opts = reinterpret_cast<OH_PackingOptions *>(ptr);

    ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_2], &ptr);
    OH_PixelmapNative *pixmap = reinterpret_cast<OH_PixelmapNative *>(ptr);

    int fd;
    napi_get_value_int32(env, argValue[NUM_3], &fd);

    Image_ErrorCode errCode = OH_ImagePackerNative_PackToFileFromPixelmap(packer, opts, pixmap, fd);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackToFileFromPixelmapBadParamter(napi_env env, napi_callback_info info)
{
    int fd = NUM_4;
    Image_ErrorCode errCode = OH_ImagePackerNative_PackToFileFromPixelmap(nullptr, nullptr, nullptr, fd);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}


napi_value JSPackToFileFromPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_4] = {0};
    size_t argCount = NUM_4;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_4) {
        return result;
    }
    void *ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_0], &ptr);
    OH_ImagePackerNative *packer = reinterpret_cast<OH_ImagePackerNative *>(ptr);

    ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_1], &ptr);
    OH_PackingOptions *opts = reinterpret_cast<OH_PackingOptions *>(ptr);

    ptr = nullptr;
    napi_get_value_external(env, argValue[NUM_2], &ptr);
    OH_PixelmapNative *pixmap = reinterpret_cast<OH_PixelmapNative *>(ptr);

    OH_PictureNative *picture = nullptr;
    OH_PictureNative_CreatePicture(pixmap, &picture);
    
    int fd;
    napi_get_value_int32(env, argValue[NUM_3], &fd);

    Image_ErrorCode errCode = OH_ImagePackerNative_PackToFileFromPicture(packer, opts, picture, fd);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackToFileFromPictureBadParamter(napi_env env, napi_callback_info info)
{
    int32_t fd = 0;
    Image_ErrorCode res = OH_ImagePackerNative_PackToFileFromPicture(nullptr, nullptr, nullptr, fd);
    int32_t resultValue = res == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSPackToFileFromPixelmapSequenceBadParamter(napi_env env, napi_callback_info info)
{
    int32_t fd = 0;
    Image_ErrorCode res =
        OH_ImagePackerNative_PackToFileFromPixelmapSequence(nullptr, nullptr, nullptr, NUM_1, fd);
    int32_t resultValue = res == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}


napi_value JSImagePackerNativeRelease(napi_env env, napi_callback_info info)
{
    OH_ImagePackerNative *imagePacker = nullptr;
    Image_ErrorCode errCode = OH_ImagePackerNative_Create(&imagePacker);
    errCode = OH_ImagePackerNative_Release(imagePacker);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImagePackerNativeReleaseBadParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImagePackerNative_Release(nullptr);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSGetSupportedFormats(napi_env env, napi_callback_info info)
{
    Image_MimeType *supportedFormat = nullptr;
    size_t length = 0;
    Image_ErrorCode errCode = OH_ImagePackerNative_GetSupportedFormats(&supportedFormat, &length);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSGetSupportedFormatsBadParamter(napi_env env, napi_callback_info info)
{
    size_t length = 0;
    Image_ErrorCode errCode = OH_ImagePackerNative_GetSupportedFormats(nullptr, &length);
    
    int32_t resultValue = errCode == IMAGE_PACKER_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverOptionsCreate(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverOptionsCreateBadParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverOptionsGetSize(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    Image_Size size;
    errCode = OH_ImageReceiverOptions_GetSize(options, &size);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverOptionsSetSize(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);

    Image_Size size = {0};
    errCode = OH_ImageReceiverOptions_SetSize(options, size);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverOptionsSetSizeBadParamter(napi_env env, napi_callback_info info)
{
    Image_Size imageSize;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_SetSize(nullptr, imageSize);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverOptionsGetCapacitySuccess(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    int32_t capacity = 0;
    errCode = OH_ImageReceiverOptions_GetCapacity(options, &capacity);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverOptionsSetCapacitySuccess(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    
    errCode = OH_ImageReceiverOptions_SetCapacity(options, NUM_1);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverOptionsSetCapacityBadParamter(napi_env env, napi_callback_info info)
{
    int32_t capacity;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_SetCapacity(nullptr, capacity);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverOptionsRelease(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    errCode = OH_ImageReceiverOptions_Release(options);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeCreate(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeCreateBadParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverNative_Create(nullptr, nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeGetReceivingSurfaceId(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    uint64_t id = 0;
    errCode = OH_ImageReceiverNative_GetReceivingSurfaceId(receiver, &id);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
void TestImageReceiverOnCallback(OH_ImageReceiverNative* receiver)
{
    LOG("TestImageReceiverOnCallback is callback function");
}

napi_value JSImageReceiverNativeReadLatestImageBadParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverNative_ReadLatestImage(nullptr, nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeReadLatestImageUnknownError(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    
    OH_ImageNative *image;
    errCode = OH_ImageReceiverNative_ReadLatestImage(receiver, &image);
    int32_t resultValue = errCode == IMAGE_UNKNOWN_ERROR ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageReceiverNativeReadNextImageBadParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverNative_ReadNextImage(nullptr, nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageReceiverNativeReadNextImageUnknownError(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    OH_ImageNative *image;
    errCode = OH_ImageReceiverNative_ReadNextImage(receiver, &image);
    int32_t resultValue = errCode == IMAGE_UNKNOWN_ERROR ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageReceiverNativeOnSuccess(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    errCode = OH_ImageReceiverNative_On(receiver, TestImageReceiverOnCallback);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeOnBadParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverNative_On(nullptr, nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageReceiverNativeOff(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    errCode = OH_ImageReceiverNative_Off(receiver);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeOffBadParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverNative_Off(nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

static void TestImageReceiverImageArriveCallback(OH_ImageReceiverNative *receiver, void *userData)
{
    if (userData != nullptr) {
        int32_t *number = static_cast<int32_t *>(userData);
        *number = 1;
    }
}
napi_value JSImageReceiverNativeOnImageArrive(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    int32_t number = 0;
    void* userData = &number;
    errCode = OH_ImageReceiverNative_OnImageArrive(receiver, TestImageReceiverImageArriveCallback, userData);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeOnImageArriveInvaildParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverNative_OnImageArrive(nullptr, nullptr, nullptr);
    int32_t resultValue = errCode == IMAGE_RECEIVER_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeOffImageArrive(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    int32_t number = 0;
    void* userData = &number;
    errCode = OH_ImageReceiverNative_OnImageArrive(receiver, TestImageReceiverImageArriveCallback, userData);
    errCode = OH_ImageReceiverNative_OffImageArrive(receiver, TestImageReceiverImageArriveCallback);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeOffImageArriveInvaildParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverNative_OffImageArrive(nullptr, nullptr);
    
    int32_t resultValue = errCode == IMAGE_RECEIVER_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeGetSize(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    Image_Size imageSize;
    errCode = OH_ImageReceiverNative_GetSize(receiver, &imageSize);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeGetCapacity(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    int32_t capacity = 0;
    errCode = OH_ImageReceiverNative_GetCapacity(receiver, &capacity);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeRelease(napi_env env, napi_callback_info info)
{
    OH_ImageReceiverOptions *options = nullptr;
    Image_ErrorCode errCode = OH_ImageReceiverOptions_Create(&options);
    OH_ImageReceiverNative *receiver;
    errCode = OH_ImageReceiverNative_Create(options, &receiver);
    errCode = OH_ImageReceiverNative_Release(receiver);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageReceiverNativeReleaseBadParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageReceiverNative_Release(nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}