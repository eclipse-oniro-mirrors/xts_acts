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

#include "ImageSourceNativeErrorCodeTest.h"
#include "hilog/log.h"
#include "multimedia/image_framework/image/image_receiver_native.h"
#include "node_api.h"
#include <multimedia/image_framework/image/image_packer_native.h>
#include "native_color_space_manager/native_color_space_manager.h"
#include <multimedia/image_framework/image/picture_native.h>
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

napi_value JSImageSoureNativeImageDynamicRangeAuto(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredDynamicRange(opts, IMAGE_DYNAMIC_RANGE_AUTO);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeImageDynamicRangeSDR(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredDynamicRange(opts, IMAGE_DYNAMIC_RANGE_SDR);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageDynamicRangeHDR(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredDynamicRange(opts, IMAGE_DYNAMIC_RANGE_HDR);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageAllocatorTypeAuto(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    OH_PixelmapNative *resPixMap = nullptr;
    errCode =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, opts, IMAGE_ALLOCATOR_TYPE_AUTO, &resPixMap);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageAllocatorTypeDMA(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    OH_PixelmapNative *resPixMap = nullptr;
    errCode =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, opts, IMAGE_ALLOCATOR_TYPE_DMA, &resPixMap);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageAllocatorTypeShareMemory(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    OH_PixelmapNative *resPixMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, opts, IMAGE_ALLOCATOR_TYPE_SHARE_MEMORY,
                                                                &resPixMap);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageCropAndScaleStrategyScaleFirst(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    Image_ErrorCode errCode =
        OH_DecodingOptions_SetCropAndScaleStrategy(opts, IMAGE_CROP_AND_SCALE_STRATEGY_SCALE_FIRST);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageCropAndScaleStrategyCropFirst(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    Image_ErrorCode errCode =
        OH_DecodingOptions_SetCropAndScaleStrategy(opts, IMAGE_CROP_AND_SCALE_STRATEGY_CROP_FIRST);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeImageSourceInfoGetWidth(napi_env env, napi_callback_info info)
{
    OH_ImageSource_Info *imageInfo;
    OH_ImageSourceInfo_Create(&imageInfo);
    uint32_t width = 0;
    Image_ErrorCode errCode = OH_ImageSourceInfo_GetWidth(imageInfo, &width);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageSourceInfoGetWidthBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t width = 0;
    Image_ErrorCode errCode = OH_ImageSourceInfo_GetWidth(nullptr, &width);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageSourceInfoGetHeight(napi_env env, napi_callback_info info)
{
    OH_ImageSource_Info *imageInfo;
    OH_ImageSourceInfo_Create(&imageInfo);
    uint32_t height = 0;
    Image_ErrorCode errCode = OH_ImageSourceInfo_GetHeight(imageInfo, &height);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageSourceInfoGetHeightBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t height = 0;
    Image_ErrorCode errCode = OH_ImageSourceInfo_GetHeight(nullptr, &height);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageSourceInfoGetDynamicRange(napi_env env, napi_callback_info info)
{
    OH_ImageSource_Info *imageInfo;
    OH_ImageSourceInfo_Create(&imageInfo);
    bool isHdr = false;
    Image_ErrorCode errCode = OH_ImageSourceInfo_GetDynamicRange(imageInfo, &isHdr);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageSourceInfoGetDynamicRangeBadParameter(napi_env env, napi_callback_info info)
{
    bool isHdr = false;
    Image_ErrorCode errCode = OH_ImageSourceInfo_GetDynamicRange(nullptr, &isHdr);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageSourceInfoGetMimeType(napi_env env, napi_callback_info info)
{
    OH_ImageSource_Info *imageInfo;
    OH_ImageSourceInfo_Create(&imageInfo);
    Image_MimeType mimeType;
    Image_ErrorCode errCode = OH_ImageSourceInfo_GetMimeType(imageInfo, &mimeType);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeImageSourceInfoRelease(napi_env env, napi_callback_info info)
{
    OH_ImageSource_Info *imageInfo;
    OH_ImageSourceInfo_Create(&imageInfo);
    Image_ErrorCode errCode = OH_ImageSourceInfo_Release(imageInfo);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeImageSourceInfoReleasBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageSourceInfo_Release(nullptr);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsGetPixelFormat(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode =  OH_DecodingOptions_SetPixelFormat(ops, NUM_1);
    int32_t pixelFormat = 0;
    errCode =  OH_DecodingOptions_GetPixelFormat(ops, &pixelFormat);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetPixelFormatBadParameter(napi_env env, napi_callback_info info)
{
    int32_t pixelFormat = 0;
    Image_ErrorCode errCode =  OH_DecodingOptions_GetPixelFormat(nullptr, &pixelFormat);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetPixelFormatBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode =  OH_DecodingOptions_SetPixelFormat(nullptr, NUM_1);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetIndex(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode = OH_DecodingOptions_SetIndex(ops, NUM_1);
    uint32_t index = 0;
    errCode = OH_DecodingOptions_GetIndex(ops, &index);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetIndexBadParameter(napi_env env, napi_callback_info info)
{
    uint32_t index = 0;
    Image_ErrorCode errCode =  OH_DecodingOptions_GetIndex(nullptr, &index);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetIndex(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode =  OH_DecodingOptions_SetIndex(ops, NUM_1);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetIndexBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode =  OH_DecodingOptions_SetIndex(nullptr, NUM_1);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetRotate(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode =  OH_DecodingOptions_SetRotate(ops, NUM_1);
    float rotate = 0;
    errCode =  OH_DecodingOptions_GetRotate(ops, &rotate);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetRotateBadParameter(napi_env env, napi_callback_info info)
{
    float rotate = 0;
    Image_ErrorCode errCode =  OH_DecodingOptions_GetRotate(nullptr, &rotate);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetRotate(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode =  OH_DecodingOptions_SetRotate(ops, NUM_1);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetRotateBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode =  OH_DecodingOptions_SetRotate(nullptr, NUM_1);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetDesiredSize(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_Size desiredSize = {0, 0};
    Image_Size desiredSize2 = {1, 2};
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode = OH_DecodingOptions_SetDesiredSize(ops, &desiredSize2);
    errCode = OH_DecodingOptions_GetDesiredSize(ops, &desiredSize);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetDesiredSizeBadParameter(napi_env env, napi_callback_info info)
{
    Image_Size desiredSize = {0, 0};
    Image_ErrorCode errCode = OH_DecodingOptions_GetDesiredSize(nullptr, &desiredSize);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetDesiredSizeBadParameter(napi_env env, napi_callback_info info)
{
    Image_Size desiredSize2 = {NUM_1, NUM_2};
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredSize(nullptr, &desiredSize2);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetDesiredRegion(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_Region desiredRegion = {0, 0, 0, 0};
    Image_Region desiredRegion2 = {NUM_1, NUM_2, NUM_3, NUM_4};
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode = OH_DecodingOptions_SetDesiredRegion(ops, &desiredRegion2);
    errCode = OH_DecodingOptions_GetDesiredRegion(ops, &desiredRegion);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetDesiredRegionBadParameter(napi_env env, napi_callback_info info)
{
    Image_Region desiredRegion = {0, 0, 0, 0};
    Image_ErrorCode errCode = OH_DecodingOptions_GetDesiredRegion(nullptr, &desiredRegion);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetDesiredRegion(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_Region desiredRegion2 = {NUM_1, NUM_2, NUM_3, NUM_4};
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode = OH_DecodingOptions_SetDesiredRegion(ops, &desiredRegion2);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetDesiredRegionBadParameter(napi_env env, napi_callback_info info)
{
    Image_Region desiredRegion2 = {NUM_1, NUM_2, NUM_3, NUM_4};
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredRegion(nullptr, &desiredRegion2);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}


napi_value JSImageSoureNativeDecodingOptionsGetDesiredDynamicRange(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    int32_t desiredDynamicRange;
    errCode = OH_DecodingOptions_GetDesiredDynamicRange(ops, &desiredDynamicRange);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetDesiredDynamicRangeBadParameter(napi_env env, napi_callback_info info)
{
    int32_t desiredDynamicRange;
    Image_ErrorCode errCode = OH_DecodingOptions_GetDesiredDynamicRange(nullptr, &desiredDynamicRange);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetDesiredDynamicRange(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    int32_t desiredDynamicRange = NUM_1;
    errCode = OH_DecodingOptions_SetDesiredDynamicRange(ops, desiredDynamicRange);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetDesiredDynamicRangeBadParameter(napi_env env, napi_callback_info info)
{
    int32_t desiredDynamicRange = NUM_1;
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredDynamicRange(nullptr, desiredDynamicRange);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsSetCropAndScaleStrategy(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode = OH_DecodingOptions_SetCropAndScaleStrategy(ops, IMAGE_CROP_AND_SCALE_STRATEGY_CROP_FIRST);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetCropAndScaleStrategyBadParameter(napi_env env, napi_callback_info info)
{
    int32_t cropAndScaleStrategy = NUM_3;
    Image_ErrorCode errCode = OH_DecodingOptions_SetCropAndScaleStrategy(nullptr, cropAndScaleStrategy);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetCropAndScaleStrategy(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptions_Create(&ops);
    errCode = OH_DecodingOptions_SetCropAndScaleStrategy(ops, IMAGE_CROP_AND_SCALE_STRATEGY_CROP_FIRST);

    int32_t cropAndScaleStrategy = 0;
    errCode = OH_DecodingOptions_GetCropAndScaleStrategy(ops, &cropAndScaleStrategy);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetCropAndScaleStrategyBadParameter(napi_env env, napi_callback_info info)
{
    int32_t cropAndScaleStrategy = 0;
    Image_ErrorCode errCode = OH_DecodingOptions_GetCropAndScaleStrategy(nullptr, &cropAndScaleStrategy);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsSetCropRegionInvaildParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_DecodingOptions_SetCropRegion(nullptr, nullptr);
    int32_t resultValue = errCode == IMAGE_SOURCE_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetCropRegionInvaildParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_DecodingOptions_GetCropRegion(nullptr, nullptr);
    int32_t resultValue = errCode == IMAGE_SOURCE_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsGetDesiredColorSpace(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    int32_t colorSpaceName;
    Image_ErrorCode errCode = OH_DecodingOptions_GetDesiredColorSpace(opts, &colorSpaceName);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsGetDesiredColorSpaceInvaildParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_DecodingOptions_GetDesiredDynamicRange(nullptr, nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsSetDesiredColorSpace(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    int32_t colorSpaceName = ADOBE_RGB;
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredColorSpace(opts, colorSpaceName);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsSetDesiredColorSpaceInvaildParamter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_DecodingOptions_SetDesiredColorSpace(nullptr, ADOBE_RGB);
    int32_t resultValue = errCode == IMAGE_SOURCE_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsRelease(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *opts = nullptr;
    OH_DecodingOptions_Create(&opts);
    Image_ErrorCode errCode = OH_DecodingOptions_Release(opts);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsReleaseBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_DecodingOptions_Release(nullptr);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeCreateFromUri(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreateFromUriBadParameter(napi_env env, napi_callback_info info)
{
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(nullptr, 0, &imageSource);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeCreateFromFdBadParameter(napi_env env, napi_callback_info info)
{
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromFd(-1, &imageSource);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreateFromData(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_1] = {nullptr};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    void *data = nullptr;
    size_t dataSize = NUM_0;
    napi_status status = napi_get_buffer_info(env, argValue[NUM_0], &data, &dataSize);
    if (status != napi_ok) {
        return result;
    }

    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromData(reinterpret_cast<uint8_t *>(data), dataSize, &source);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreateFromDataBadParameter(napi_env env, napi_callback_info info)
{
    OH_ImageSourceNative *imageSource = nullptr;
    uint8_t *data = nullptr;
    size_t dataSize = 0;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromData(data, dataSize, &imageSource);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeCreateFromDataWithUserBuffer(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    void *data = nullptr;
    size_t dataSize = 0;
    napi_status status = napi_get_buffer_info(env, argValue[NUM_0], &data, &dataSize);
    if (status != napi_ok) {
        return result;
    }
    OH_LOG_INFO(LOG_APP, "Creat ImageSource with user buffer, size: %{public}zu", dataSize);
    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode errCode =
        OH_ImageSourceNative_CreateFromDataWithUserBuffer(reinterpret_cast<uint8_t *>(data), dataSize, &source);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreateFromDataWithUserBufferInvaildParamter(napi_env env, napi_callback_info info)
{
    OH_ImageSourceNative *imageSource = nullptr;
    uint8_t *data = nullptr;
    size_t dataSize = 0;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromDataWithUserBuffer(data, dataSize, &imageSource);
    int32_t resultValue = errCode == IMAGE_SOURCE_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeCreateFromRawFile(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    napi_value argValue[NUM_3] = {nullptr};
    size_t argCount = NUM_3;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_3) {
        return result;
    }

    RawFileDescriptor rawDesc;
    napi_get_value_int32(env, argValue[NUM_0], &rawDesc.fd);
    if (rawDesc.fd < 0) {
        napi_create_int32(env, -1, &result);
        return result;
    }
    int64_t tmp;
    napi_get_value_int64(env, argValue[NUM_1], &tmp);
    rawDesc.start = static_cast<long>(tmp);
    napi_get_value_int64(env, argValue[NUM_2], &tmp);
    rawDesc.length = static_cast<long>(tmp);

    OH_LOG_INFO(LOG_APP, "lhb CreateFromRawFile fd:%{public}d, start:%{public}ld, length:%{public}ld", rawDesc.fd,
                rawDesc.start, rawDesc.length);

    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromRawFile(&rawDesc, &source);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreateFromRawFileBadParameter(napi_env env, napi_callback_info info)
{
    OH_ImageSourceNative *source = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromRawFile(nullptr, &source);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeCreatePixelmapBadParameter(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *resPixMap = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreatePixelmap(nullptr, nullptr, &resPixMap);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeCreatePixelmapUsingAllocatorBadParameter(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *resPixMap = nullptr;
    Image_ErrorCode errCode =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(nullptr, nullptr, IMAGE_ALLOCATOR_TYPE_DMA, &resPixMap);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreatePixelmapUsingAllocatorUnsuportedAllocatorType(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    
    OH_DecodingOptions *opts = nullptr;
    errCode = OH_DecodingOptions_Create(&opts);
    errCode = OH_DecodingOptions_SetDesiredDynamicRange(opts, IMAGE_DYNAMIC_RANGE_SDR);
    errCode = OH_DecodingOptions_SetCropAndScaleStrategy(opts, IMAGE_CROP_AND_SCALE_STRATEGY_SCALE_FIRST);
    
    OH_PixelmapNative *resPixMap = nullptr;
    errCode =
        OH_ImageSourceNative_CreatePixelmapUsingAllocator(imageSource, opts, IMAGE_ALLOCATOR_TYPE_DMA, &resPixMap);
    
    int32_t resultValue = errCode == IMAGE_SOURCE_UNSUPPORTED_ALLOCATOR_TYPE ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeCreatePixelmapList(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    
    OH_DecodingOptions *decodeOpts = nullptr;
    errCode = OH_DecodingOptions_Create(&decodeOpts);

    uint32_t frameCnt = 0;
    errCode = OH_ImageSourceNative_GetFrameCount(imageSource, &frameCnt);
    if (frameCnt > 0) {
        OH_PixelmapNative **resPixMapList = new (std::nothrow) OH_PixelmapNative *[frameCnt];
        size_t arrayLength = frameCnt;
        errCode = OH_ImageSourceNative_CreatePixelmapList(imageSource, decodeOpts, resPixMapList, arrayLength);
    } else {
        return nullptr;
    }
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreatePixelmapListBadParameter(napi_env env, napi_callback_info info)
{
    OH_DecodingOptions *ops = nullptr;
    OH_ImageSourceNative *imageSource = nullptr;
    OH_PixelmapNative **resVecPixMap = nullptr;
    size_t outSize = 0;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreatePixelmapList(imageSource, ops, resVecPixMap, outSize);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeCreatePicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);

    OH_DecodingOptionsForPicture *decodingOptions = nullptr;
    errCode = OH_DecodingOptionsForPicture_Create(&decodingOptions);
    
    OH_PictureNative *picture = nullptr;
    errCode = OH_ImageSourceNative_CreatePicture(imageSource, decodingOptions, &picture);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreatePictureBadParameter(napi_env env, napi_callback_info info)
{
    OH_PictureNative *picture = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreatePicture(nullptr, nullptr, &picture);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeCreatePictureAtIndex(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    
    OH_PictureNative *picture = nullptr;
    errCode = OH_ImageSourceNative_CreatePictureAtIndex(imageSource, NUM_1, &picture);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreatePictureAtIndexBadSource(napi_env env, napi_callback_info info)
{
    OH_PictureNative *picture = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreatePictureAtIndex(nullptr, NUM_0, &picture);

    int32_t resultValue = errCode == IMAGE_BAD_SOURCE ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeCreatePictureAtIndexUnsuportedOptions(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);

    OH_PictureNative *picture = nullptr;
    errCode = OH_ImageSourceNative_CreatePictureAtIndex(imageSource, NUM_0, nullptr);

    int32_t resultValue = errCode == IMAGE_SOURCE_UNSUPPORTED_OPTIONS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeGetDelayTimeList(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);

    uint32_t frameCnt = 0;
    errCode = OH_ImageSourceNative_GetFrameCount(imageSource, &frameCnt);
    if (errCode != IMAGE_SUCCESS) {
        napi_create_int32(env, errCode, &result);
        return result;
    }
    if (frameCnt <= 0) {
        return result;
    }

    int32_t *delayTimeList = new (std::nothrow) int32_t[frameCnt];
    size_t size = frameCnt;
    errCode = OH_ImageSourceNative_GetDelayTimeList(imageSource, delayTimeList, size);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeGetDelayTimeListBadParameter(napi_env env, napi_callback_info info)
{
    size_t size = NUM_3;
    Image_ErrorCode errCode = OH_ImageSourceNative_GetDelayTimeList(nullptr, nullptr, size);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeGetImageInfo(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);

    OH_ImageSource_Info *imageInfo = nullptr;
    errCode = OH_ImageSourceInfo_Create(&imageInfo);

    int32_t index = 0;
    errCode = OH_ImageSourceNative_GetImageInfo(imageSource, index, imageInfo);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeGetImageInfoBadParameter(napi_env env, napi_callback_info info)
{
    int32_t index = 0;
    Image_ErrorCode errCode = OH_ImageSourceNative_GetImageInfo(nullptr, index, nullptr);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeGetImagePropertyBadParameter(napi_env env, napi_callback_info info)
{
    napi_value typeString;
    napi_create_string_utf8(env, "SceneType", NAPI_AUTO_LENGTH, &typeString);

    const size_t maxKeyLen = MAX_BUFFER_SIZE;
    char key[maxKeyLen];
    size_t keySize = 0;
    napi_get_value_string_utf8(env, typeString, key, maxKeyLen, &keySize);

    Image_String imageKey;
    Image_String imageValue = {nullptr, 0};
    imageKey.data = key;
    imageKey.size = keySize;
    Image_ErrorCode errCode = OH_ImageSourceNative_GetImageProperty(nullptr, &imageKey, &imageValue);
    
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeGetImagePropertyAllocFailed(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        return result;
    }

    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    
    const size_t maxKeyLen = MAX_BUFFER_SIZE;
    char key[maxKeyLen];
    size_t keySize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_1], key, maxKeyLen, &keySize);

    Image_String imageKey;
    Image_String imageValue = {nullptr, 0};
    imageKey.data = key;
    imageKey.size = keySize;
    imageValue.size = -1;

    errCode = OH_ImageSourceNative_GetImageProperty(imageSource, &imageKey, &imageValue);

    int32_t resultValue = errCode == IMAGE_ALLOC_FAILED ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeGetImagePropertyWithNullInvaildParamter(napi_env env, napi_callback_info info)
{
    OH_ImageSourceNative *imageSource = nullptr;
    Image_String* key = nullptr;
    Image_String* value = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_GetImagePropertyWithNull(imageSource, key, value);

    int32_t resultValue = errCode == IMAGE_SOURCE_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeModifyImageProperty(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    
    napi_value typeString;
    napi_create_string_utf8(env, "Orientation", NAPI_AUTO_LENGTH, &typeString);

    const size_t maxKeyLen = MAX_BUFFER_SIZE;
    char key[maxKeyLen];
    size_t keySize = 0;
    napi_get_value_string_utf8(env, typeString, key, maxKeyLen, &keySize);
    
    Image_String imageKey;
    imageKey.data = key;
    imageKey.size = keySize;
    
    Image_String  imageValue;
    napi_value typeStringValue;
    napi_create_string_utf8(env, "4", NAPI_AUTO_LENGTH, &typeStringValue);

    char value[maxKeyLen];
    size_t valueSize = 0;
    napi_get_value_string_utf8(env, typeStringValue, value, maxKeyLen, &valueSize);
    
    imageValue.data = value;
    imageValue.size = valueSize;
    errCode = OH_ImageSourceNative_ModifyImageProperty(imageSource, &imageKey, &imageValue);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeModifyImagePropertyBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageSourceNative_ModifyImageProperty(nullptr, nullptr, nullptr);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeGetFrameCount(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    uint32_t frameCnt = 0;
    errCode = OH_ImageSourceNative_GetFrameCount(imageSource, &frameCnt);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeGetFrameCountBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageSourceNative_GetFrameCount(nullptr, 0);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeRelease(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    errCode = OH_ImageSourceNative_Release(imageSource);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeReleaseBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_ImageSourceNative_Release(nullptr);

    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsForPictureCreateBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_DecodingOptionsForPicture_Create(nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsForPictureGetDesiredAuxiliaryPictures(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        return result;
    }

    int32_t length = 0;
    napi_get_value_int32(env, argValue[NUM_0], &length);

    Image_AuxiliaryPictureType auxTypes[length];
    napi_value element = nullptr;
    int32_t type = 0;
    for (int32_t i = 0; i < length; i++) {
        napi_get_element(env, argValue[NUM_1], i, &element);
        napi_get_value_int32(env, element, &type);
        auxTypes[i] = static_cast<Image_AuxiliaryPictureType>(type);
    }
    
    OH_DecodingOptionsForPicture *decodingOptions = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptionsForPicture_Create(&decodingOptions);
    errCode = OH_DecodingOptionsForPicture_SetDesiredAuxiliaryPictures(decodingOptions, auxTypes,
                                                                       static_cast<size_t>(length));
    Image_AuxiliaryPictureType *auxTypes2 = nullptr;
    size_t length2 = 0;
    errCode = OH_DecodingOptionsForPicture_GetDesiredAuxiliaryPictures(decodingOptions, &auxTypes2, &length2);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsForPictureGetDesiredAuxiliaryPicturesBadParameter(napi_env env,
                                                                                              napi_callback_info info)
{
    Image_ErrorCode errCode = OH_DecodingOptionsForPicture_GetDesiredAuxiliaryPictures(nullptr, nullptr, 0);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsForPictureSetDesiredAuxiliaryPictures(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_2] = {0};
    size_t argCount = NUM_2;

    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_2) {
        return result;
    }

    int32_t length = 0;
    napi_get_value_int32(env, argValue[NUM_0], &length);

    Image_AuxiliaryPictureType auxTypes[length];
    napi_value element = nullptr;
    int32_t type = 0;
    for (int32_t i = 0; i < length; i++) {
        napi_get_element(env, argValue[NUM_1], i, &element);
        napi_get_value_int32(env, element, &type);
        auxTypes[i] = static_cast<Image_AuxiliaryPictureType>(type);
    }
    
    OH_DecodingOptionsForPicture *decodingOptions = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptionsForPicture_Create(&decodingOptions);
    errCode = OH_DecodingOptionsForPicture_SetDesiredAuxiliaryPictures(decodingOptions, auxTypes,
                                                                       static_cast<size_t>(length));
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsForPictureSetDesiredAuxiliaryPicturesBadParameter(napi_env env,
                                                                                              napi_callback_info info)
{
    Image_ErrorCode errCode = OH_DecodingOptionsForPicture_SetDesiredAuxiliaryPictures(nullptr, nullptr, 0);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeDecodingOptionsForPictureRelease(napi_env env, napi_callback_info info)
{
    OH_DecodingOptionsForPicture *decodingOptions = nullptr;
    Image_ErrorCode errCode = OH_DecodingOptionsForPicture_Create(&decodingOptions);
    
    errCode = OH_DecodingOptionsForPicture_Release(decodingOptions);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeDecodingOptionsForPictureReleaseBadParameter(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_DecodingOptionsForPicture_Release(nullptr);
    int32_t resultValue = errCode == IMAGE_BAD_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value JSImageSoureNativeGetSupportedFormats(napi_env env, napi_callback_info info)
{
    Image_MimeType *image_MimeType = nullptr;
    size_t length = NUM_0;
    Image_ErrorCode errCode = OH_ImageSourceNative_GetSupportedFormats(&image_MimeType, &length);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value JSImageSoureNativeGetSupportedFormatsInvalidParameter(napi_env env, napi_callback_info info)
{
    size_t length;
    Image_ErrorCode errCode = OH_ImageSourceNative_GetSupportedFormats(nullptr, &length);
    int32_t resultValue = errCode == IMAGE_SOURCE_INVALID_PARAMETER ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_PictureNative_CreatePicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);

    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(pixelMap, &picture);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_PictureNative_GetMainPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(pixelMap, &picture);
    OH_PixelmapNative *pixelMap2 = nullptr;
    errCode = OH_PictureNative_GetMainPixelmap(picture, &pixelMap2);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_PictureNative_GetHdrComposedPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(pixelMap, &picture);
    OH_PixelmapNative *pixelMap2 = nullptr;
    errCode = OH_PictureNative_GetHdrComposedPixelmap(picture, &pixelMap2);

    int32_t resultValue = (errCode == IMAGE_SUCCESS ||  errCode == IMAGE_UNSUPPORTED_OPERATION)? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_PictureNative_GetGainmapPixelmap(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(pixelMap, &picture);
    OH_PixelmapNative *pixelMap2 = nullptr;
    errCode = OH_PictureNative_GetGainmapPixelmap(picture, &pixelMap2);

    int32_t resultValue = (errCode == IMAGE_SUCCESS || errCode == IMAGE_ALLOC_FAILED)? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

const int32_t BUFFER_LENGTH = 255900;
const int32_t SIZE_WIDTH = 820;
const int32_t SIZE_HEIGHT = 312;
napi_value Test_OH_PictureNative_SetAuxiliaryPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(pixelMap, &picture);
    OH_AuxiliaryPictureNative* auxiliaryPicture = nullptr;
    
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    errCode = OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength, &size,
        Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    
    errCode = OH_PictureNative_SetAuxiliaryPicture(picture, AUXILIARY_PICTURE_TYPE_GAINMAP, auxiliaryPicture);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_PictureNative_GetAuxiliaryPicture(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(pixelMap, &picture);
    OH_AuxiliaryPictureNative* auxiliaryPicture = nullptr;
    
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    errCode = OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength, &size,
        Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    errCode = OH_PictureNative_SetAuxiliaryPicture(picture, AUXILIARY_PICTURE_TYPE_GAINMAP, auxiliaryPicture);
    errCode = OH_PictureNative_GetAuxiliaryPicture(picture, AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_PictureNative_GetMetadata(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(pixelMap, &picture);
    OH_PictureMetadata *metadata = nullptr;
    errCode = OH_PictureMetadata_Create(EXIF_METADATA, &metadata);
    errCode = OH_PictureNative_SetMetadata(picture, EXIF_METADATA, metadata);
    errCode = OH_PictureNative_GetMetadata(picture, EXIF_METADATA, &metadata);

    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_PictureNative_SetMetadata(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(pixelMap, &picture);
    OH_PictureMetadata *metadata = nullptr;
    errCode = OH_PictureMetadata_Create(EXIF_METADATA, &metadata);
    errCode = OH_PictureNative_SetMetadata(picture, EXIF_METADATA, metadata);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_PictureNative_Release(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_value argValue[NUM_1] = {0};
    size_t argCount = NUM_1;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argCount, argValue, nullptr, nullptr) != napi_ok || argCount < NUM_1) {
        return result;
    }
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, argValue[NUM_0], url, maxUrlLen, &urlSize);
    OH_ImageSourceNative *imageSource = nullptr;
    Image_ErrorCode errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &imageSource);
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(pixelMap, &picture);
    errCode = OH_PictureNative_Release(picture);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_AuxiliaryPictureNativeWritePixelsImage(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative* auxiliaryPicture = nullptr;
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    Image_ErrorCode errCode = OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength,
        &size, Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    size_t bufferSize = BUFFER_LENGTH;
    uint8_t *source = (uint8_t*)malloc(bufferSize);
    errCode = OH_AuxiliaryPictureNative_WritePixels(auxiliaryPicture, source, bufferSize);
    int32_t resultValue = (errCode == IMAGE_SUCCESS || errCode == IMAGE_COPY_FAILED)? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_AuxiliaryPictureNative_ReadPixels(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative* auxiliaryPicture = nullptr;
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    Image_ErrorCode errCode = OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength,
        &size, Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    size_t bufferSize = BUFFER_LENGTH;
    uint8_t source;
    errCode = OH_AuxiliaryPictureNative_ReadPixels(auxiliaryPicture, &source, &bufferSize);
    int32_t resultValue = (errCode == IMAGE_SUCCESS || errCode == IMAGE_BAD_PARAMETER)? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_AuxiliaryPictureNative_GetType(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative* auxiliaryPicture = nullptr;
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    Image_ErrorCode errCode = OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength,
        &size, Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    Image_AuxiliaryPictureType type;
    errCode = OH_AuxiliaryPictureNative_GetType(auxiliaryPicture, &type);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value Test_OH_AuxiliaryPictureNative_GetInfo(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative* auxiliaryPicture = nullptr;
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    Image_ErrorCode errCode = OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength,
        &size, Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    OH_AuxiliaryPictureInfo* info2 = nullptr;
    errCode = OH_AuxiliaryPictureNative_GetInfo(auxiliaryPicture, &info2);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value Test_OH_AuxiliaryPictureNative_SetInfo(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative* auxiliaryPicture = nullptr;
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    Image_ErrorCode errCode = OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength,
        &size, Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    OH_AuxiliaryPictureInfo* info2;
    errCode = OH_AuxiliaryPictureInfo_Create(&info2);
    errCode = OH_AuxiliaryPictureNative_GetInfo(auxiliaryPicture, &info2);
    errCode = OH_AuxiliaryPictureNative_SetInfo(auxiliaryPicture, info2);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_AuxiliaryPictureNative_GetMetadata(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative* auxiliaryPicture = nullptr;
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    Image_ErrorCode errCode = OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength,
        &size, Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    OH_AuxiliaryPictureInfo* info2;
    errCode = OH_AuxiliaryPictureInfo_Create(&info2);
    
    OH_PictureMetadata *metadata0 = nullptr;
    errCode = OH_PictureMetadata_Create(EXIF_METADATA, &metadata0);
    errCode = OH_AuxiliaryPictureNative_SetMetadata(auxiliaryPicture, EXIF_METADATA, metadata0);
    
    OH_PictureMetadata *metadata = nullptr;
    errCode = OH_AuxiliaryPictureNative_GetMetadata(auxiliaryPicture, EXIF_METADATA, &metadata);
    int32_t resultValue = (errCode == IMAGE_SUCCESS || errCode == IMAGE_UNSUPPORTED_METADATA)? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value Test_OH_AuxiliaryPictureNative_SetMetadata(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative* auxiliaryPicture = nullptr;
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    Image_ErrorCode errCode = OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength,
        &size, Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    OH_AuxiliaryPictureInfo* info2;
    errCode = OH_AuxiliaryPictureInfo_Create(&info2);
    OH_PictureMetadata *metadata = nullptr;
    errCode = OH_PictureMetadata_Create(EXIF_METADATA, &metadata);
    errCode = OH_AuxiliaryPictureNative_SetMetadata(auxiliaryPicture, EXIF_METADATA, metadata);
    int32_t resultValue = errCode == IMAGE_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
