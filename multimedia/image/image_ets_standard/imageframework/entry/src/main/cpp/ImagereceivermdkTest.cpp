/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include "imagereceivermdkTest.h"
#include "node_api.h"
#include <cstdlib>
#include <hilog/log.h>
#include <multimedia/image_framework/image_pixel_map_napi.h>
#include <multimedia/image_framework/image_receiver_mdk.h>
#include <multimedia/image_framework/image_source_mdk.h> //
static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr uint32_t NUM_4 = 4;
static constexpr uint32_t NUM_5 = 5;
static constexpr uint32_t IMAGE_WIDTH = 600;
static constexpr uint32_t IMAGE_HEIGHT = 400;
uint32_t A = 0xff000000;
uint32_t R = 0x00ff0000;
uint32_t G = 0x0000ff00;
uint32_t B = 0x000000ff;
uint32_t colorArray[240000] = {0};
constexpr size_t SIZE_ZERO = 0;
constexpr size_t SIZE_ONE = 1;
constexpr size_t SIZE_THREE = 3;
constexpr size_t SIZE_FOUR = 4;
constexpr size_t SIZE_FIVE = 4;
constexpr size_t DEFAULT_PACKING_SIZE = 25 * 1024 * 1024;
constexpr uint32_t ARGS_FIRST = 0;
constexpr uint32_t ARGS_SECOND = 1;
constexpr uint32_t ARGS_THIRD = 2;
constexpr uint32_t ARGS_FOURTH = 3;
constexpr int32_t INVALID_FD = -1;
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
constexpr size_t ID_SIZE = 64;
constexpr uint32_t INVALID_FRAME_COUNT = 0;
constexpr int32_t DEFAULT_INDEX = 0;
napi_value CreateImageReceiver(napi_env env, napi_callback_info info)
{
    struct OhosImageReceiverInfo receiverInfo;
    napi_value receiver = nullptr;
    int32_t returnValue = OH_Image_Receiver_CreateImageReceiver(env, receiverInfo, &receiver);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value GetReceivingSurfaceId(napi_env env, napi_callback_info info)
{
    char buf[ID_SIZE] = {0};
    int32_t returnValue = OH_Image_Receiver_GetReceivingSurfaceId(nullptr, buf, ID_SIZE);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ReadLatestImage(napi_env env, napi_callback_info info)
{
    napi_value result1 = nullptr;
    int32_t returnValue = OH_Image_Receiver_ReadLatestImage(nullptr, &result1);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ReadNextImage(napi_env env, napi_callback_info info)
{
    napi_value result1 = nullptr;
    int32_t returnValue = OH_Image_Receiver_ReadNextImage(nullptr, &result1);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
void OnEvent() {}
napi_value ReceiverOn(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_Image_Receiver_On(nullptr, OnEvent);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ReceiverGetSize(napi_env env, napi_callback_info info)
{
    struct OhosImageSize size;
    int32_t returnValue = OH_Image_Receiver_GetSize(nullptr, &size);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ReceiverGetCapacity(napi_env env, napi_callback_info info)
{
    int32_t capacity;
    int32_t returnValue = OH_Image_Receiver_GetCapacity(nullptr, &capacity);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ReceiverGetFormat(napi_env env, napi_callback_info info)
{
    int32_t format;
    int32_t returnValue = OH_Image_Receiver_GetFormat(nullptr, &format);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ReceiverRelease(napi_env env, napi_callback_info info)
{
    ImageReceiverNative *p = nullptr;
    int32_t returnValue = OH_Image_Receiver_Release(p);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceCreate(napi_env env, napi_callback_info info)
{
    napi_env env1 = nullptr;
    struct OhosImageSource src;
    struct OhosImageSourceOps ops;
    napi_value imageSource = nullptr;
    int32_t returnValue = OH_ImageSource_Create(env1, &src, &ops, &imageSource);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceCreateFromUri(napi_env env, napi_callback_info info)
{
    size_t uriSize = 2;
    char *uri = "aa";
    struct OhosImageSourceOps ops = {
        .density=0,
        .pixelFormat=0,
        .size = {
            .width=0,
            .height=0
        }
    };
    napi_value imageSource = nullptr;
    int32_t returnValue = OH_ImageSource_CreateFromUri(env, uri, uriSize, &ops, &imageSource);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceCreateFromFd(napi_env env, napi_callback_info info)
{
    int32_t fd;
    struct OhosImageSourceOps ops;
    napi_value imageSource = nullptr;
    int32_t returnValue = OH_ImageSource_CreateFromFd(env, fd, &ops, &imageSource);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceCreateFromData(napi_env env, napi_callback_info info)
{
    void *buf = nullptr;
    size_t bufferSize = 0;
    uint8_t *data = reinterpret_cast<uint8_t *>(buf);
    struct OhosImageSourceOps ops;
    napi_value imageSource = nullptr;
    int32_t returnValue = OH_ImageSource_CreateFromData(env, data, bufferSize, &ops, &imageSource);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceCreateFromRawFile(napi_env env, napi_callback_info info)
{
    RawFileDescriptor rawFileDescriptor = {};
    struct OhosImageSourceOps ops;
    napi_value imageSource = nullptr;
    int32_t returnValue = OH_ImageSource_CreateFromRawFile(env, rawFileDescriptor, &ops, &imageSource);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceCreateIncremental(napi_env env, napi_callback_info info)
{
    struct OhosImageSource src;
    struct OhosImageSourceOps ops;
    napi_value imageSource = nullptr;
    int32_t returnValue = OH_ImageSource_CreateIncremental(env, &src, &ops, &imageSource);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceCreateIncrementalFromData(napi_env env, napi_callback_info info)
{
    void *buf = nullptr;
    size_t bufferSize = 0;
    uint8_t *data = reinterpret_cast<uint8_t *>(buf);
    struct OhosImageSourceOps ops;
    napi_value imageSource = nullptr;
    int32_t returnValue = OH_ImageSource_CreateIncrementalFromData(env, data, bufferSize, &ops, &imageSource);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceGetSupportedFormats(napi_env env, napi_callback_info info)
{
    struct OhosImageSourceSupportedFormatList formatList;
    int32_t returnValue = OH_ImageSource_GetSupportedFormats(&formatList);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceCreatePixelMap(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ImageSource_CreatePixelMap(nullptr, nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceCreatePixelMapList(napi_env env, napi_callback_info info)
{
    struct OhosImageDecodingOps ops;
    napi_value pixelmapList = nullptr;
    int32_t returnValue = OH_ImageSource_CreatePixelMapList(nullptr, &ops, &pixelmapList);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSource_GetDelayTime(napi_env env, napi_callback_info info)
{
    struct OhosImageSourceDelayTimeList timeList;
    int32_t returnValue = OH_ImageSource_GetDelayTime(nullptr, &timeList);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceGetFrameCount(napi_env env, napi_callback_info info)
{
    uint32_t frameCount = INVALID_FRAME_COUNT;
    int32_t returnValue = OH_ImageSource_GetFrameCount(nullptr, &frameCount);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceGetImageInfo(napi_env env, napi_callback_info info)
{
    int32_t index = DEFAULT_INDEX;
    struct OhosImageSourceInfo imageInfo;
    int32_t returnValue = OH_ImageSource_GetImageInfo(nullptr, index, &imageInfo);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceGetImageProperty(napi_env env, napi_callback_info info)
{
    struct OhosImageSourceProperty key;
    struct OhosImageSourceProperty val;
    int32_t returnValue = OH_ImageSource_GetImageProperty(nullptr, &key, &val);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceModifyImageProperty(napi_env env, napi_callback_info info)
{
    struct OhosImageSourceProperty key;
    struct OhosImageSourceProperty val;
    int32_t returnValue = OH_ImageSource_ModifyImageProperty(nullptr, &key, &val);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceUpdateData(napi_env env, napi_callback_info info)
{
    struct OhosImageSourceUpdateData data;
    int32_t returnValue = OH_ImageSource_UpdateData(nullptr, &data);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImageSourceRelease(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ImageSource_Release(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
