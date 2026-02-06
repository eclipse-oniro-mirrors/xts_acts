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
#include <string>
#include <cstdint>
#include <hilog/log.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include "ImageEffectsSuppTest.h"
#include <multimedia/image_framework/image_mdk_common.h>
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
#define CASE_INDEX_19 19
#define CASE_INDEX_20 20
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
#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageEffectNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

#define OPTION_WIDTH 6
#define OPTION_HEIGHT 4
#define OPTION_WIDTH_SMALL 4
#define OPTION_HEIGHT_SMALL 6
#define OPTION_PIXEL_FORMAT_SMALL 4
#define OPTION_ALPHA_ZERO 0
#define VALUE_DAYA_BOOLVALUE 2

static std::string g_imagePath;
static std::string g_outImagePath;

namespace {
    constexpr uint32_t NUM_0 = 0;
    constexpr uint32_t NUM_1 = 1;
    constexpr uint32_t NUM_2 = 2;
    constexpr uint32_t NUM_3 = 3;
    constexpr uint32_t NUM_4 = 4;
    constexpr uint32_t NUM_5 = 5;
}

napi_value savePixelMapForPathSupp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    g_imagePath = CommonUtils::GetStringArgument(env, args[0]);
    LOGI(" Received image path: %{public}s", g_imagePath.c_str());
    napi_value ret;
    int status = -1;
    if (g_imagePath.length() > 0) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value CreatOutPixelMapForPathSupp(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    g_outImagePath = CommonUtils::GetStringArgument(env, args[0]);
    napi_value ret;
    int status = -1;
    if (g_outImagePath.length() > 0) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHImageEffectConfigureSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = nullptr;
    const char *key = nullptr;
    ImageEffect_Any value;
    switch (index) {
    case CASE_INDEX_1:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.int32Value = 0;
        break;
    case CASE_INDEX_2:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.int32Value = -1;
        break;
    case CASE_INDEX_3:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = NAN;
        break;
    case CASE_INDEX_4:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.doubleValue = NAN;
        break;
    case CASE_INDEX_5:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.charValue = '\0';
        break;
    case CASE_INDEX_6:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.charValue = '\x00';
        break;
    case CASE_INDEX_7:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.longValue = -1L;
        break;
    case CASE_INDEX_8:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.longValue = LONG_MIN;
        break;
    case CASE_INDEX_9:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.boolValue = VALUE_DAYA_BOOLVALUE;
        break;
    case CASE_INDEX_10:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.boolValue = -1;
        break;
    case CASE_INDEX_11:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = NAN;
        break;
    case CASE_INDEX_12:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.ptrValue = nullptr;
        break;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_ImageEffect_Configure(imageEffect, key, &value);
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectSetOutputSurfaceSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OHNativeWindow *nativeWindow = nullptr;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_GetInputSurface(imageEffect, &nativeWindow);
        code = OH_ImageEffect_SetOutputSurface(imageEffect, nativeWindow);
        break;
    case CASE_INDEX_2:
        OH_ImageEffect_GetInputSurface(imageEffect, &nativeWindow);
        code = OH_ImageEffect_SetOutputSurface(nullptr, nativeWindow);
        break;
    default:
        break;
    }

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectGetInputSurfaceSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case CASE_INDEX_2:
        imageEffect = nullptr;
        break;
    default:
        break;
    }
    OHNativeWindow *nativeWindow = nullptr;
    ImageEffect_ErrorCode code = OH_ImageEffect_GetInputSurface(imageEffect, &nativeWindow);
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectSetInputPixelmapSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    LOGI("Input index: %{public}d", index);

    if (g_imagePath.empty()) {
        LOGE("Image path is not set!");
        napi_value ret;
        napi_create_int32(env, EFFECT_ERROR_PARAM_INVALID, &ret);
        return ret;
    }

    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }

    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTION_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTION_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelmap = nullptr;
    Image_ErrorCode errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelmap);
    LOGI(" Decoded pixelmap pointer: %{public}p", pixelmap);

    OH_ImageEffect* imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    if (!imageEffect) {
        LOGE(" Failed to create image effect");
        napi_value ret;
        napi_create_int32(env, EFFECT_ERROR_PARAM_INVALID, &ret);
        return ret;
    }
    LOGI(" 1Created image effect: %{public}p", imageEffect);

    ImageEffect_ErrorCode code = EFFECT_UNKNOWN;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_ImageEffect_SetInputPixelmap(imageEffect, pixelmap);
        break;
    case CASE_INDEX_2:
        code = OH_ImageEffect_SetInputPixelmap(nullptr, nullptr);
        break;
    case CASE_INDEX_3:
        code = OH_ImageEffect_SetInputPixelmap(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectSetOutputPixelmapSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(g_imagePath);
    OH_PixelmapNative *outputPixelmap = pixelmapNativePtr.get();
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code = EFFECT_UNKNOWN;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_ImageEffect_SetOutputPixelmap(imageEffect, outputPixelmap);
        break;
    case CASE_INDEX_2:
        code = OH_ImageEffect_SetOutputPixelmap(nullptr, outputPixelmap);
        break;
    case CASE_INDEX_3:
        code = OH_ImageEffect_SetOutputPixelmap(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectSaveSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code;
    char *imageEffectInfo = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_ImageEffect_Save(imageEffect, &imageEffectInfo);
        break;
    case CASE_INDEX_2:
        code = OH_ImageEffect_Save(nullptr, &imageEffectInfo);
        break;
    case CASE_INDEX_3:
        code = OH_ImageEffect_Save(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectEmuSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        code = ImageEffect_ErrorCode::EFFECT_ERROR_PERMISSION_DENIED;
        break;
    case CASE_INDEX_2:
        code = ImageEffect_ErrorCode::EFFECT_BUFFER_SIZE_NOT_MATCH;
        break;
    case CASE_INDEX_3:
        code = ImageEffect_ErrorCode::EFFECT_COLOR_SPACE_NOT_MATCH;
        break;
    case CASE_INDEX_4:
        code = ImageEffect_ErrorCode::EFFECT_INPUT_OUTPUT_NOT_MATCH;
        break;
    case CASE_INDEX_5:
        code = ImageEffect_ErrorCode::EFFECT_EFFECT_NUMBER_LIMITED;
        break;
    case CASE_INDEX_6:
        code = ImageEffect_ErrorCode::EFFECT_INPUT_OUTPUT_NOT_SUPPORTED;
        break;
    case CASE_INDEX_7:
        code = ImageEffect_ErrorCode::EFFECT_ALLOCATE_MEMORY_FAILED;
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value CreatePixelMap(napi_env env, napi_callback_info info)
{
    napi_value udfVar = nullptr;
    napi_value pixelMap = nullptr;

    struct OhosPixelMapCreateOps createOps;
    createOps.width = OPTION_WIDTH_SMALL;
    createOps.height = OPTION_HEIGHT_SMALL;
    createOps.pixelFormat = 0;
    createOps.alphaType = -1;
    createOps.editable = false;
    size_t bufferSize = createOps.width * createOps.height * 4;
    void *buff = malloc(bufferSize);
    if (buff == nullptr) {
        return udfVar;
    }
    char *cc = reinterpret_cast<char *>(buff);
    for (int i = 0; i < bufferSize; ++i) {
        *(cc++) = static_cast<char>(i);
    }
    int32_t res = OH_PixelMap_CreatePixelMap(env, createOps, (uint8_t *)buff, bufferSize, &pixelMap);
    free(buff);
    if (res != IMAGE_RESULT_SUCCESS || pixelMap == nullptr) {
        return udfVar;
    }
    return pixelMap;
}

napi_value OHImageEffectSetInputUriSupp(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = INT32_MIN;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, nullptr);
        break;
    case CASE_INDEX_2:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(nullptr, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectSetOutputUriSupp(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = INT32_MIN;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, nullptr);
        break;
    case CASE_INDEX_2:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(nullptr, nullptr);
        break;
    case CASE_INDEX_3:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_DOUBLE;
        value.dataValue.doubleValue = IMAGE_EFFECT_100D;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, "");
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OIRNdkErrCodeEmuSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    IRNdkErrCode code;
    switch (index) {
        case CASE_INDEX_1:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_SEEK_ERR;
            break;
        case CASE_INDEX_2:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_PERMISSION_DENIED;
            break;
        case CASE_INDEX_3:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_DEAD_OBJECT;
            break;
        case CASE_INDEX_4:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_TIMED_OUT;
            break;
        case CASE_INDEX_5:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_TRACK_NOT_ALL_SUPPORTED;
            break;
        case CASE_INDEX_6:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_ADAPTER_INIT_FAILED;
            break;
        case CASE_INDEX_7:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_WRITE_PARCEL_FAIL;
            break;
        case CASE_INDEX_8:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_READ_PARCEL_FAIL;
            break;
        case CASE_INDEX_9:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_NO_AVAIL_BUFFER;
            break;
        case CASE_INDEX_10:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_INVALID_PARAM;
            break;
        case CASE_INDEX_11:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_CODEC_ADAPTER_NOT_EXIST;
            break;
        case CASE_INDEX_12:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_CREATE_CODEC_ADAPTER_FAILED;
            break;
        case CASE_INDEX_13:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_CODEC_ADAPTER_NOT_INIT;
            break;
        case CASE_INDEX_14:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_ZCODEC_CREATE_FAILED;
            break;
        case CASE_INDEX_15:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_ZCODEC_NOT_EXIST;
            break;
        case CASE_INDEX_16:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_JNI_CLASS_NOT_EXIST;
            break;
        case CASE_INDEX_17:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_JNI_METHOD_NOT_EXIST;
            break;
        case CASE_INDEX_18:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_JNI_NEW_OBJ_FAILED;
            break;
        case CASE_INDEX_19:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_JNI_COMMON_ERROR;
            break;
        case CASE_INDEX_20:
            code = IRNdkErrCode::IMAGE_RESULT_MEDIA_DISTRIBUTE_NOT_SUPPORT;
            break;
        default:
            break;
    }

    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

