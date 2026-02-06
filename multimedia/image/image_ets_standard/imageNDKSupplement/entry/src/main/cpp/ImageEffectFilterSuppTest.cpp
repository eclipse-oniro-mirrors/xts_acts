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
#include <bits/alltypes.h>
#include <hilog/log.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_errors.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <native_color_space_manager/native_color_space_manager.h>
#include <native_window/external_window.h>
#include <string>
#include "render_texture.h"
#include "ImageEffectFilterSuppTest.h"

#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)

#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
#define KEY_FILTER_INTENSITY "FilterIntensity"
#define IMAGE_EFFECT_NAME "imageEdit"
#define CUSTOM_FILTER "CustomCrop"
#define IMAGE_NULLSSTRING ""

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

napi_value OHEffectFilterCreateSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *effectFilter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        effectFilter = OH_EffectFilter_Create(IMAGE_EFFECT_NAME);
        break;
    case CASE_INDEX_2:
        effectFilter = OH_EffectFilter_Create(nullptr);
        break;
    case CASE_INDEX_3:
        effectFilter = OH_EffectFilter_Create(IMAGE_NULLSSTRING);
    default:
        break;
    }

    int code = IMAGE_EFFECT_CODE_401;
    if (effectFilter != nullptr) {
        OH_EffectFilter_Release(effectFilter);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value OHEffectFilterLookUpFiltersSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *effectFilter = OH_EffectFilter_Create(IMAGE_EFFECT_NAME);
    ImageEffect_FilterNames *lookupFilters = nullptr;

    switch (index) {
    case CASE_INDEX_1:
        lookupFilters = OH_EffectFilter_LookupFilters(IMAGE_EFFECT_NAME);
        break;
    case CASE_INDEX_2:
        lookupFilters = OH_EffectFilter_LookupFilters(nullptr);
        break;
    case CASE_INDEX_3:
        lookupFilters = OH_EffectFilter_LookupFilters(IMAGE_NULLSSTRING);
    default:
        break;
    }
    OH_EffectFilter_Release(effectFilter);

    int code = IMAGE_EFFECT_CODE_401;
    if (lookupFilters != nullptr) {
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value OHEffectFilterLookUpFiltersNullptrSupp(napi_env env, napi_callback_info info)
{
    ImageEffect_FilterNames *lookupFilters = nullptr;
    lookupFilters = OH_EffectFilter_LookupFilters(nullptr);
    napi_value ret;
    if (lookupFilters == nullptr) {
        napi_get_undefined(env, &ret);
    }
    return ret;
}
napi_value OHEffectFilterSetValueSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *effectFilter = OH_EffectFilter_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code;
    ImageEffect_Any setValue;

    switch (index) {
    case CASE_INDEX_2:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(effectFilter, KEY_FILTER_INTENSITY, &setValue);
        break;
    case CASE_INDEX_3:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(effectFilter, IMAGE_NULLSSTRING, &setValue);
        break;
    case CASE_INDEX_4:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(nullptr, KEY_FILTER_INTENSITY, &setValue);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(effectFilter);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value OHEffectFilterGetValueSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *effectFilter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_ErrorCode code;
    ImageEffect_Any setValue;
    ImageEffect_Any retValue;
    napi_value ret;
    switch (index) {
    case CASE_INDEX_1:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        OH_EffectFilter_SetValue(effectFilter, KEY_FILTER_INTENSITY, &setValue);
        code = OH_EffectFilter_GetValue(effectFilter, KEY_FILTER_INTENSITY, &retValue);
        if (retValue.dataType != setValue.dataType || retValue.dataValue.floatValue != setValue.dataValue.floatValue) {
            napi_create_int32(env, -1, &ret);
            return ret;
        }
        break;
    case CASE_INDEX_2:
        setValue.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        setValue.dataValue.floatValue = IMAGE_EFFECT_100F;
        OH_EffectFilter_SetValue(effectFilter, IMAGE_NULLSSTRING, &setValue);
        code = OH_EffectFilter_GetValue(effectFilter, IMAGE_NULLSSTRING, &retValue);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilter_GetValue(nullptr, KEY_FILTER_INTENSITY, &retValue);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(effectFilter);

    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value OHEffectFilterRegisterSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    ImageEffect_FilterDelegate delegate;
    delegate.setValue = [](OH_EffectFilter *filter, const char *key, const ImageEffect_Any *value) { return false; },
    delegate.render =
        [](OH_EffectFilter *filter, OH_EffectBufferInfo *src, OH_EffectFilterDelegate_PushData pushData) {
            pushData(filter, src);
            return true;
        },
    delegate.save = [](OH_EffectFilter *filter, char **info) { return true; },
    delegate.restore = [](const char *info) { return OH_EffectFilter_Create("CustomBrightnessEFilter"); };
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilter_Register(filterInfo, &delegate);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilter_Register(nullptr, &delegate);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value OHEffectFilterLookupFilterInfoSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    OH_EffectFilterInfo *filterInfo = OH_EffectFilterInfo_Create();
    switch (index) {
    case CASE_INDEX_1:
        code = OH_EffectFilter_LookupFilterInfo(OH_EFFECT_BRIGHTNESS_FILTER, filterInfo);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilter_LookupFilterInfo(OH_EFFECT_BRIGHTNESS_FILTER, nullptr);
        break;
    case CASE_INDEX_3:
        code = OH_EffectFilter_LookupFilterInfo(IMAGE_NULLSSTRING, filterInfo);
        break;
    default:
        break;
    }
    OH_EffectFilterInfo_Release(filterInfo);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}
napi_value OHEffectFilterReleaseSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    ImageEffect_ErrorCode code;
    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
        code = OH_EffectFilter_Release(filter);
        break;
    case CASE_INDEX_2:
        code = OH_EffectFilter_Release(nullptr);
        break;
    default:
        break;
    }

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

