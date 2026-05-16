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
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image_pixel_map_napi.h>
#include "ImageNdkErrCodeTest.h"
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
#define CASE_INDEX_12 12
#define CASE_INDEX_13 13
#define CASE_INDEX_14 14
#define CASE_INDEX_15 15
#define CASE_INDEX_16 16
#define CASE_INDEX_17 17
#define CASE_INDEX_18 18
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

napi_value OHIRNdkErrCodeTestSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    int32_t number;
    switch (index) {
    case CASE_INDEX_1:
        number = IMAGE_RESULT_FILE_DAMAGED;
        break;
    case CASE_INDEX_2:
        number = IMAGE_RESULT_CREATE_DECODER_FAILED;
        break;
    case CASE_INDEX_3:
        number = IMAGE_RESULT_CREATE_ENCODER_FAILED;
        break;
    case CASE_INDEX_4:
        number = IMAGE_RESULT_CHECK_FORMAT_ERROR;
        break;
    case CASE_INDEX_5:
        number = IMAGE_RESULT_HW_DECODE_FAILED;
        break;
    case CASE_INDEX_6:
        number = IMAGE_RESULT_ALLOCATER_TYPE_ERROR;
        break;
    case CASE_INDEX_7:
        number = IMAGE_RESULT_ALPHA_TYPE_ERROR;
        break;
        case CASE_INDEX_8:
        number = IMAGE_RESULT_INDEX_INVALID;
        break;
    case CASE_INDEX_9:
        number = IMAGE_RESULT_MEDIA_UNKNOWN;
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, number, &ret);
    return ret;
}

