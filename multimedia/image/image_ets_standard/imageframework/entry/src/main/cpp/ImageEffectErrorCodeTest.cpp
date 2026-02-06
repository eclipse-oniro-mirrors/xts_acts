/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

#include "ImageEffectErrorCodeTest.h"

#include "napi/native_api.h"
#include <hilog/log.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_errors.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <native_window/external_window.h>
#include <string>


#include <multimedia/image_framework/image/image_source_native.h>
#include <multimedia/image_framework/image/pixelmap_native.h>

#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)


#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"
#define CUSTOM_FILTER "CustomCrop"

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


napi_value OHImageEffectInsertFilterByFilterEffectSuccess(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_ErrorCode errorCode = OH_ImageEffect_InsertFilterByFilter(imageEffect, 0, filter);
    
    OH_EffectFilter_Release(filter);
    OH_ImageEffect_Release(imageEffect);

    int32_t resultValue = errorCode == EFFECT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHImageEffectConfigureEffectParamError(napi_env env, napi_callback_info info)
{
    int32_t resultValue =  -1;
    OH_ImageEffect *imageEffect = nullptr;
    const char *key = nullptr;
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    key = "runningType";
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_100F;
    imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    code = OH_ImageEffect_Configure(imageEffect, key, &value);
    resultValue = code == EFFECT_PARAM_ERROR ? 0 : -1;
    
    OH_ImageEffect_Release(imageEffect);
    
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHImageEffectSetInputNativeBufferErrorCode(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_100F;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
    
    OH_NativeBuffer *buffer = (OH_NativeBuffer *)0x1;
    code = OH_ImageEffect_SetInputNativeBuffer(nullptr, buffer);
    
    int32_t resultValue = code == EFFECT_ERROR_PARAM_INVALID ? 0 : -1;

    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHImageEffectSetOutputNativeBufferErrorCode(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_100F;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);

    OH_NativeBuffer *nativeBuffer = (OH_NativeBuffer *)0x1;
    if (code == EFFECT_SUCCESS) {
        code = OH_ImageEffect_SetInputNativeBuffer(imageEffect, nativeBuffer);
    }
    OH_NativeBuffer *outNativeBuffer = (OH_NativeBuffer *)0x2;
    if (code == EFFECT_SUCCESS) {
        code = OH_ImageEffect_SetOutputNativeBuffer(nullptr, outNativeBuffer);
    }

    int32_t resultValue = code == EFFECT_ERROR_PARAM_INVALID ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHImageEffectSetInputPictureErrorCode(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    const size_t maxUriLen = IMAGE_EFFECT_1024;
    char uri[maxUriLen] = "";
    size_t uriSize = 0;
    napi_get_value_string_utf8(env, args[0], uri, maxUriLen, &uriSize);
    
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    OH_PictureNative  *nativePicture = nullptr;
    OH_ImageSourceNative *tempImageSource = nullptr;
    OH_ImageSourceNative_CreateFromUri(uri, uriSize, &tempImageSource);
    OH_DecodingOptions *ops = nullptr;
    OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *pixelMap = nullptr;
    OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &pixelMap);
    OH_PictureNative_CreatePicture(pixelMap, &nativePicture);
    
    ImageEffect_ErrorCode code = OH_ImageEffect_SetInputPicture(imageEffect, nativePicture);
    LOG("OH_ImageEffect_SetInputPicture code value: %d", code);
    OH_ImageSourceNative_Release(tempImageSource);
    OH_PixelmapNative_Release(pixelMap);
    OH_PictureNative_Release(nativePicture);
    
    int32_t resultValue = code == EFFECT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHImageEffectSetOutputPictureErrorCode(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    
    OH_PictureNative *outNativePicture = nullptr;
    ImageEffect_ErrorCode code = OH_ImageEffect_SetOutputPicture(nullptr, nullptr);
    LOG("OH_ImageEffect_SetOutputPicture code value: %d", code);

    int32_t resultValue = code == EFFECT_ERROR_PARAM_INVALID ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHImageEffectStartErrorCode(napi_env env, napi_callback_info info)
{
    int32_t resultValue = -1;
    ImageEffect_ErrorCode errorCode = OH_ImageEffect_Start(nullptr);
    resultValue = errorCode == EFFECT_ERROR_PARAM_INVALID ? 0 : -1;
    
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHImageEffectStopErrorCode(napi_env env, napi_callback_info info)
{
    ImageEffect_ErrorCode errorCode = OH_ImageEffect_Stop(nullptr);
    int32_t resultValue = errorCode == EFFECT_ERROR_PARAM_INVALID ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value ImageEffectErrorCodeErrorParamInvalid(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    
    OH_PictureNative *outNativePicture = nullptr;
    ImageEffect_ErrorCode code = OH_ImageEffect_SetOutputPicture(nullptr, nullptr);
    LOG("OH_ImageEffect_SetOutputPicture code value: %d", code);

    int32_t resultValue = code == EFFECT_ERROR_PARAM_INVALID ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value ImageEffectErrorCodeParamError(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = nullptr;
    const char *key = nullptr;
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    
    key = "runningType";
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_100F;
    imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    code = OH_ImageEffect_Configure(imageEffect, key, &value);
    int32_t resultValue = code == EFFECT_PARAM_ERROR ? 0 : -1;
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value ImageEffectErrorCodeKeyError(napi_env env, napi_callback_info info)
{
    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_Any setValue;

    setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
    setValue.dataValue.floatValue = IMAGE_EFFECT_100;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
    int32_t resultValue = code == EFFECT_KEY_ERROR ? 0 : -1;
    OH_EffectFilter_Release(filter);

    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value ImageEffectDataTypeUnknown(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = nullptr;
    const char *key = nullptr;
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;

    imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    key = "runningType";
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_UNKNOWN;
    value.dataValue.int32Value = IMAGE_EFFECT_2;
    code = OH_ImageEffect_Configure(imageEffect, key, &value);
    int32_t resultValue = code == EFFECT_PARAM_ERROR ? 0 : -1;
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
napi_value ImageEffectBufferTypeUnknown(napi_env env, napi_callback_info info)
{
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_BufferType bufferTypes[2] = {};
    ImageEffect_ErrorCode code;
    bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_UNKNOWN;

    uint32_t size = sizeof(bufferTypes) / sizeof(ImageEffect_BufferType);
    code = OH_EffectFilterInfo_SetSupportedBufferTypes(filterInfo, size, bufferTypes);
    OH_EffectFilterInfo_Release(filterInfo);

    int32_t resultValue = code == EFFECT_SUCCESS ? 0 : -1;

    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHEffectFilterSetValueErrorCode(napi_env env, napi_callback_info info)
{
    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);

    ImageEffect_Any setValue;
    ImageEffect_ErrorCode code;
    int32_t resultValue = -1;

    setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
    setValue.dataValue.floatValue = IMAGE_EFFECT_100;
    code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
    resultValue = code == EFFECT_KEY_ERROR ? 0 : -1;
    OH_EffectFilter_Release(filter);

    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHEffectFilterGetValueErrorCode(napi_env env, napi_callback_info info)
{
    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_Any setValue;
    ImageEffect_Any retValue;

    setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
    setValue.dataValue.floatValue = IMAGE_EFFECT_100;
    OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &setValue);
    ImageEffect_ErrorCode code = OH_EffectFilter_GetValue(filter, KEY_FILTER_INTENSITY, &retValue);
    OH_EffectFilter_Release(filter);

    int32_t resultValue = code == EFFECT_KEY_ERROR ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHImageEffectImageEffectRegion(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CROP_FILTER);
    ImageEffect_Region cropRegion;
    cropRegion.x0 = 0;
    cropRegion.y0 = 0;
    cropRegion.x1 = IMAGE_EFFECT_100;
    cropRegion.y1 = IMAGE_EFFECT_100;
    
    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_PTR;
    value.dataValue.ptrValue = &cropRegion;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, OH_EFFECT_CROP_FILTER, &value);
    
    int32_t resultValue = code == EFFECT_SUCCESS ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHImageEffectImageEffectSize(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CROP_FILTER);
    ImageEffect_Size cropSize;
    cropSize.width  = IMAGE_EFFECT_100;
    cropSize.height = IMAGE_EFFECT_100;
    
    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_PTR;
    value.dataValue.ptrValue = &cropSize;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, OH_EFFECT_CROP_FILTER, &value);
    
    int32_t resultValue = code == EFFECT_SUCCESS ? 0 : -1;
    
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}

napi_value OHEffectFilterLookupFiltersFilterNames(napi_env env, napi_callback_info info)
{
    ImageEffect_FilterNames *filterNames = OH_EffectFilter_LookupFilters("Format:default");
    uint32_t size = filterNames->size;
    const char **nameList = filterNames->nameList;
    OH_EffectFilter_ReleaseFilterNames();
    if (!size) {
        LOG("filterNames size value: %{public}d", size);
    }
    if (!nameList) {
        LOG("filterNames nameList:  %{public}s", *nameList);
    }
    int32_t resultValue = *nameList != nullptr ? 0 : -1;
    napi_value ret;
    napi_create_int32(env, resultValue, &ret);
    return ret;
}
