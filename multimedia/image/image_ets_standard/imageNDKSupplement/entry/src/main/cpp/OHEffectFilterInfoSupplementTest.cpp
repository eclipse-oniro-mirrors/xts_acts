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

#include "napi/native_api.h"
#include "utils/CommonUtilsTest.h"
#include "utils/PixelmapHelperTest.h"
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include "OHEffectFilterInfoSupplementTest.h"

#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)
#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"
#define CUSTOM_FILTER "CustomCrop"
#define IMAGE_NULL_STRING ""


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

napi_value OHEffectFilterInfoSetFilterNameSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilterInfo_SetFilterName(nullptr, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, nullptr);
        break;
    case CASE_INDEX_4:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, IMAGE_NULL_STRING);
        break;
    default:
        break;
    }
    
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoGetFilterNameSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    char *getName = nullptr;
    ImageEffect_ErrorCode code;
    char getArgs[] = "";
    char* getPtr = getArgs;
    char* getNamePtr = getPtr;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilterInfo_SetFilterName(filterInfo, OH_EFFECT_BRIGHTNESS_FILTER);
        code = OH_EffectFilterInfo_GetFilterName(filterInfo, &getName);
        if (strcmp(getName, OH_EFFECT_BRIGHTNESS_FILTER) != 0) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilterInfo_GetFilterName(filterInfo, nullptr);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilterInfo_GetFilterName(nullptr, &getName);
        break;
    case CASE_INDEX_4:
        code = OH_EffectFilterInfo_GetFilterName(filterInfo, &getNamePtr);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);
    
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoSetSupportedBufferTypesSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_BufferType bufferTypes[2] = {};
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        break;
    case CASE_INDEX_2:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        bufferTypes[1] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_TEXTURE;
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        break;
    default:
        break;
    }
    uint32_t size = sizeof(bufferTypes) / sizeof(ImageEffect_BufferType);
    code = OH_EffectFilterInfo_SetSupportedBufferTypes(filterInfo, size, bufferTypes);
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoGetSupportedBufferTypesSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_BufferType bufferTypes[2] = {};
    uint32_t size = sizeof(bufferTypes) / sizeof(ImageEffect_BufferType);
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_ErrorCode code;
    
    napi_value ret;
    ImageEffect_BufferType *bufferTypeArray = nullptr;
    uint32_t getSize;
    switch (index) {
    case CASE_INDEX_1:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        code = OH_EffectFilterInfo_SetSupportedBufferTypes(filterInfo, size, bufferTypes);
        code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
        if (getSize != size) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        bufferTypes[0] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL;
        bufferTypes[1] = ImageEffect_BufferType::EFFECT_BUFFER_TYPE_TEXTURE;
        code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        code = OH_EffectFilterInfo_GetSupportedBufferTypes(filterInfo, &getSize, &bufferTypeArray);
        break;
    default:
        break;
    }
    
    OH_EffectFilterInfo_Release(filterInfo);

    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoSetSupportedFormatsSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_Format formats[2] = {};
    switch (index) {
    case CASE_INDEX_1:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        break;
    case CASE_INDEX_2:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        formats[1] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        break;
    default:
        break;
    }
    uint32_t size = sizeof(formats) / sizeof(ImageEffect_Format);
    ImageEffect_ErrorCode code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, size, formats);
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoGetSupportedFormatsSuppTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_Format formats[2] = {};
    uint32_t setSize = sizeof(formats) / sizeof(ImageEffect_Format);
    ImageEffect_ErrorCode code;
    
    napi_value ret;
    uint32_t getSize;
    ImageEffect_Format *formatArray = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        code = OH_EffectFilterInfo_SetSupportedFormats(filterInfo, setSize, formats);
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        if (getSize != setSize) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        formats[0] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888;
        formats[1] = ImageEffect_Format::EFFECT_PIXEL_FORMAT_NV12;
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    case CASE_INDEX_3:
        filterInfo = nullptr;
        code = OH_EffectFilterInfo_GetSupportedFormats(filterInfo, &getSize, &formatArray);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHEffectFilterInfoReleaseSupplementTest(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = nullptr;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        filterInfo = OH_EffectFilterInfo_Create();
        break;
    case CASE_INDEX_2:
        filterInfo = nullptr;
        break;
    default:
        break;
    }
    code = OH_EffectFilterInfo_Release(filterInfo);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
