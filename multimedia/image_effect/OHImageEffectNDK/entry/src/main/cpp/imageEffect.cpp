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

#include "imageEffect.h"

#include "napi/native_api.h"
#include "utils/common_utils.h"
#include "utils/pixelmap_helper.h"
#include <bits/alltypes.h>
#include <hilog/log.h>
#include <multimedia/image_effect/image_effect.h>
#include <multimedia/image_effect/image_effect_errors.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <native_window/external_window.h>
#include <string>

#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)

#define OH_EFFECT_BRIGHTNESS_FILTER "Brightness"
#define OH_EFFECT_CONTRAST_FILTER "Contrast"
#define OH_EFFECT_CROP_FILTER "Crop"
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
#define IMAGE_EFFECT_4090 4090
#define IMAGE_EFFECT_5120 5120
#define IMAGE_EFFECT_CODE_401 401
#define IMAGE_EFFECT_1722514390000 1722514390000

const std::string g_jpgUri = std::string("file:///data/test/resource/image_effect_1k_test1.jpg");
static std::string imagePath;
static std::string outImagePath;

napi_value savePixelMapForPath(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    imagePath = CommonUtils::GetStringArgument(env, args[0]);
    napi_value ret;
    int status = -1;
    if (imagePath.length() > 0) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value creatOutPixeMapForPath(napi_env env, napi_callback_info info)
{
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    outImagePath = CommonUtils::GetStringArgument(env, args[0]);
    napi_value ret;
    int status = -1;
    if (outImagePath.length() > 0) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

ImageEffect_FilterDelegate getFilterDelegate()
{
    ImageEffect_FilterDelegate filterDelegate = {
        .setValue = [](OH_EffectFilter *filter, const char *key, const ImageEffect_Any *value) { return true; },
        .render = [](OH_EffectFilter *filter, OH_EffectBufferInfo *info,
    OH_EffectFilterDelegate_PushData pushData) { return true; },
        .save = [](OH_EffectFilter *filter, char **info) { return true; },
        .restore = [](const char *info) {
        OH_EffectFilter *filter = OH_EffectFilter_Create(CUSTOM_FILTER);
        return filter;
        }
    };
    return filterDelegate;
}

/**---------------------------------------------- EffectFilterRender ------------------------------------------------**/
napi_value OHEffectFilterRender(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);
    OH_PixelmapNative *inputPixelmap = pixelmapNativePtr.get();
    OH_PixelmapNative *outputPixelmap = inputPixelmap;
    ImageEffect_FilterDelegate filterDelegate = getFilterDelegate();
    // 创建 OH_EffectFilterInfo 实例
    OH_EffectFilterInfo *customFilterInfo = OH_EffectFilterInfo_Create();
    // 设置自定义滤镜滤镜名
    OH_EffectFilterInfo_SetFilterName(customFilterInfo, CUSTOM_FILTER);
    // 设置自定义滤镜所支持的内存类型
    ImageEffect_BufferType bufferTypeArray[] = {ImageEffect_BufferType::EFFECT_BUFFER_TYPE_PIXEL};
    OH_EffectFilterInfo_SetSupportedBufferTypes(
        customFilterInfo, sizeof(bufferTypeArray) / sizeof(ImageEffect_BufferType), bufferTypeArray);
    // 设置自定义滤镜所支持的像素格式
    ImageEffect_Format formatArray[] = {ImageEffect_Format::EFFECT_PIXEL_FORMAT_RGBA8888};
    OH_EffectFilterInfo_SetSupportedFormats(customFilterInfo, sizeof(formatArray) / sizeof(ImageEffect_Format),
                                            formatArray);
    // 注册自定义滤镜
    ImageEffect_ErrorCode errorCode = OH_EffectFilter_Register(customFilterInfo, &filterDelegate);
    // 创建滤镜。比如：创建对比度效果器
    OH_EffectFilter *filter = OH_EffectFilter_Create(CUSTOM_FILTER);
    
    std::shared_ptr<OH_PixelmapNative> outPixePtr = PixelMapHelper::Decode(outImagePath);

    // 生效滤镜效果
    switch (index) {
    case CASE_INDEX_1:
        outputPixelmap = nullptr;
        break;
    case CASE_INDEX_2:
        outputPixelmap = inputPixelmap;
        break;
    case CASE_INDEX_3:
        outputPixelmap = outPixePtr.get();
        break;
    default:
        break;
    }
    errorCode = OH_EffectFilter_Render(filter, inputPixelmap, outputPixelmap);
    OH_EffectFilter_Release(filter);
    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

/**-------------------------------------------------- Effect -------------------------------------------------------**/
napi_value OHImageEffectCreate(napi_env env, napi_callback_info info)
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
        imageEffect = OH_ImageEffect_Create(nullptr);
        break;
    default:
        break;
    }

    int code = IMAGE_EFFECT_CODE_401;
    if (imageEffect != nullptr) {
        OH_ImageEffect_Release(imageEffect);
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectConfigure(napi_env env, napi_callback_info info)
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
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_2;
        break;
    case CASE_INDEX_2:
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        break;
    case CASE_INDEX_3:
        imageEffect = nullptr;
        key = "runningType";
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        break;
    case CASE_INDEX_4:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = nullptr;
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        break;
    case CASE_INDEX_5:
        imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
        key = nullptr;
    default:
        break;
    }
    ImageEffect_ErrorCode code = OH_ImageEffect_Configure(imageEffect, key, &value);
    OH_ImageEffect_Release(imageEffect);
    
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectAddFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        filter = OH_ImageEffect_AddFilter(nullptr, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        filter = OH_ImageEffect_AddFilter(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    
    int code = IMAGE_EFFECT_CODE_401;
    if (filter != nullptr) {
        code = 0;
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectAddFilterByFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode errorCode = ImageEffect_ErrorCode::EFFECT_SUCCESS;
    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_ImageEffect_AddFilterByFilter(imageEffect, filter);
        break;
    case CASE_INDEX_2:
        errorCode = OH_ImageEffect_AddFilterByFilter(nullptr, filter);
        break;
    case CASE_INDEX_3:
        errorCode = OH_ImageEffect_AddFilterByFilter(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(filter);
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

napi_value OHImageEffectGetFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
    int32_t getFilterIndex;
    switch (index) {
    case CASE_INDEX_1:
        getFilterIndex = 0;
        break;
    case CASE_INDEX_2:
        getFilterIndex = 1;
        break;
    default:
        break;
    }
    OH_EffectFilter *getFilter = OH_ImageEffect_GetFilter(imageEffect, getFilterIndex);
    OH_ImageEffect_Release(imageEffect);
    
    int status = IMAGE_EFFECT_CODE_401;
    if (getFilter != nullptr) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHImageEffectGetFilterCount(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    int32_t count = 0;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        count = OH_ImageEffect_GetFilterCount(imageEffect);
        break;
    case CASE_INDEX_2:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        count = OH_ImageEffect_GetFilterCount(imageEffect);
        break;
    case CASE_INDEX_3:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        count = OH_ImageEffect_GetFilterCount(imageEffect);
        break;
    case CASE_INDEX_4:
        count = OH_ImageEffect_GetFilterCount(nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);

    int status = IMAGE_EFFECT_CODE_401;
    if (count >= 0) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHImageEffectGetInputSurface(napi_env env, napi_callback_info info)
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

napi_value OHImageEffectInsertFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *insertFilter = nullptr;
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    switch (index) {
    case CASE_INDEX_1:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, 1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        insertFilter = OH_ImageEffect_InsertFilter(nullptr, 0, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, -1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_4:
        insertFilter = OH_ImageEffect_InsertFilter(imageEffect, 0, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);

    int status = IMAGE_EFFECT_CODE_401;
    if (insertFilter != nullptr) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHImageEffectInsertFilterByFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_ErrorCode errorCode = ImageEffect_ErrorCode::EFFECT_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        errorCode = OH_ImageEffect_InsertFilterByFilter(imageEffect, 1, filter);
        break;
    case CASE_INDEX_2:
        errorCode = OH_ImageEffect_InsertFilterByFilter(nullptr, 0, filter);
        break;
    case CASE_INDEX_3:
        errorCode = OH_ImageEffect_InsertFilterByFilter(imageEffect, -1, filter);
        break;
    case CASE_INDEX_4:
        errorCode = OH_ImageEffect_InsertFilterByFilter(imageEffect, 0, nullptr);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(filter);
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

napi_value OHImageEffectReplaceFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_EffectFilter *replaceFilter = nullptr;
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
    switch (index) {
    case CASE_INDEX_1:
        replaceFilter = OH_ImageEffect_ReplaceFilter(imageEffect, 0, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        replaceFilter = OH_ImageEffect_ReplaceFilter(nullptr, 0, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_3:
        replaceFilter = OH_ImageEffect_ReplaceFilter(imageEffect, -1, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_4:
        replaceFilter = OH_ImageEffect_ReplaceFilter(imageEffect, 0, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);

    int status = IMAGE_EFFECT_CODE_401;
    if (replaceFilter != nullptr) {
        status = 0;
    }
    napi_value ret;
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHImageEffectReplaceFilterByFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
    OH_EffectFilter *filter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    ImageEffect_ErrorCode errorCode = ImageEffect_ErrorCode::EFFECT_SUCCESS;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        errorCode = OH_ImageEffect_ReplaceFilterByFilter(imageEffect, 0, filter);
        break;
    case CASE_INDEX_2:
        errorCode = OH_ImageEffect_ReplaceFilterByFilter(nullptr, 0, filter);
        break;
    case CASE_INDEX_3:
        errorCode = OH_ImageEffect_ReplaceFilterByFilter(imageEffect, -1, filter);
        break;
    case CASE_INDEX_4:
        errorCode = OH_ImageEffect_ReplaceFilterByFilter(imageEffect, 0, nullptr);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(filter);
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

napi_value OHImageEffectRelease(napi_env env, napi_callback_info info)
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
    ImageEffect_ErrorCode code = OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectRemoveFilter(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    int32_t result;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        result = OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    case CASE_INDEX_2:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CROP_FILTER);
        result = OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_CROP_FILTER);
        break;
    case CASE_INDEX_3:
        result = OH_ImageEffect_RemoveFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    
    napi_value ret;
    int32_t status = IMAGE_EFFECT_CODE_401;
    if (result > 0) {
        status = 0;
    }
    napi_create_int32(env, status, &ret);
    return ret;
}

napi_value OHImageEffectRemoveFilterByIndex(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    int32_t errorCode = ImageEffect_ErrorCode::EFFECT_SUCCESS;
    OH_EffectFilter *brightnessFilter = OH_EffectFilter_Create(OH_EFFECT_BRIGHTNESS_FILTER);
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_AddFilterByFilter(imageEffect, brightnessFilter);
        errorCode = OH_ImageEffect_RemoveFilterByIndex(imageEffect, 0);
        break;
    case CASE_INDEX_2:
        OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_CONTRAST_FILTER);
        OH_ImageEffect_AddFilterByFilter(imageEffect, brightnessFilter);
        errorCode = OH_ImageEffect_RemoveFilterByIndex(imageEffect, 1);
        errorCode |= OH_ImageEffect_RemoveFilterByIndex(imageEffect, 0);
        break;
    case CASE_INDEX_3:
        errorCode = OH_ImageEffect_RemoveFilterByIndex(imageEffect, 0);
        break;
    default:
        break;
    }
    OH_EffectFilter_Release(brightnessFilter);
    OH_ImageEffect_Release(imageEffect);
    
    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

napi_value OHImageEffectSave(napi_env env, napi_callback_info info)
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

napi_value OHImageEffectRestore(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    OH_ImageEffect *saveImageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_ImageEffect *restoreImageEffect = nullptr;
    char *imageEffectInfo = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        OH_ImageEffect_Save(saveImageEffect, &imageEffectInfo);
        restoreImageEffect = OH_ImageEffect_Restore(imageEffectInfo);
        break;
    case CASE_INDEX_2:
        restoreImageEffect = OH_ImageEffect_Restore("");
        break;
    case CASE_INDEX_3:
        restoreImageEffect = OH_ImageEffect_Restore(nullptr);
        break;
    default:
        break;
    }

    int32_t code = 401;
    if (restoreImageEffect != nullptr) {
        code = 0;
    }
    napi_value ret = nullptr;
    napi_create_int32(env, code, &ret);
    return ret;
}

OH_NativeBuffer_Config config{
    .width = 0x100,
    .height = 0x100,
};

napi_value OHImageEffectSetInputNativeBuffer(napi_env env, napi_callback_info info)
{
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_100F;
    ImageEffect_ErrorCode code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
    
    OH_NativeBuffer *buffer = (OH_NativeBuffer *)0x1;
    code = OH_ImageEffect_SetInputNativeBuffer(imageEffect, buffer);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectSetInputPixelmap(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);
    OH_PixelmapNative *inputPixelmap = pixelmapNativePtr.get();
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create(IMAGE_EFFECT_NAME);
    ImageEffect_ErrorCode code = EFFECT_UNKNOWN;
    switch (index) {
    case CASE_INDEX_1:
        code = OH_ImageEffect_SetInputPixelmap(imageEffect, inputPixelmap);
        break;
    case CASE_INDEX_2:
        code = OH_ImageEffect_SetInputPixelmap(nullptr, inputPixelmap);
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

ImageEffect_ErrorCode SetInputUri1(int32_t index, OH_ImageEffect *imageEffect, OH_EffectFilter *filter)
{
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = INT32_MIN;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_2:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_3:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_DOUBLE;
        value.dataValue.doubleValue = IMAGE_EFFECT_100D;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_4:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_CHAR;
        value.dataValue.charValue = 'A';
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    default:
        break;
    }
    return code;
}

ImageEffect_ErrorCode SetInputUri2(int32_t index, OH_ImageEffect *imageEffect, OH_EffectFilter *filter)
{
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_5:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_LONG;
        value.dataValue.longValue = 100L;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_6:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_BOOL;
        value.dataValue.boolValue = true;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_7:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_PTR;
        value.dataValue.ptrValue = nullptr;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_8:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, nullptr, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    default:
        break;
    }
    return code;
}

napi_value OHImageEffectSetInputUri(napi_env env, napi_callback_info info)
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
    case CASE_INDEX_2:
    case CASE_INDEX_3:
    case CASE_INDEX_4:
        code = SetInputUri1(index, imageEffect, filter);
        break;
    case CASE_INDEX_5:
    case CASE_INDEX_6:
    case CASE_INDEX_7:
    case CASE_INDEX_8:
        code = SetInputUri2(index, imageEffect, filter);
        break;
    case CASE_INDEX_9:
        code = OH_ImageEffect_SetInputUri(nullptr, nullptr);
        break;
    case CASE_INDEX_10:
        code = OH_ImageEffect_SetInputUri(nullptr, g_jpgUri.c_str());
        break;
    case CASE_INDEX_11:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, nullptr);
        break;
    default:
        break;
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectSetOutputNativeBuffer(napi_env env, napi_callback_info info)
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
        code = OH_ImageEffect_SetOutputNativeBuffer(imageEffect, outNativeBuffer);
    }
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectSetOutputPixelmap(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);
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

napi_value OHImageEffectSetOutputSurface(napi_env env, napi_callback_info info)
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

ImageEffect_ErrorCode SetInputUri3(int32_t index, OH_ImageEffect *imageEffect, OH_EffectFilter *filter)
{
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_1:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = INT32_MIN;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_2:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
        value.dataValue.floatValue = IMAGE_EFFECT_100F;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_3:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_DOUBLE;
        value.dataValue.doubleValue = IMAGE_EFFECT_100D;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_4:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_CHAR;
        value.dataValue.charValue = 'A';
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    default:
        break;
    }
    return code;
}

ImageEffect_ErrorCode SetInputUri4(int32_t index, OH_ImageEffect *imageEffect, OH_EffectFilter *filter)
{
    ImageEffect_Any value;
    ImageEffect_ErrorCode code;
    switch (index) {
    case CASE_INDEX_5:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_LONG;
        value.dataValue.longValue = 100L;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_6:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_BOOL;
        value.dataValue.boolValue = true;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_7:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_PTR;
        value.dataValue.ptrValue = nullptr;
        code = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    case CASE_INDEX_8:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, nullptr, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, g_jpgUri.c_str());
        break;
    default:
        break;
    }
    return code;
}

napi_value OHImageEffectSetOutputUri(napi_env env, napi_callback_info info)
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
    case CASE_INDEX_2:
    case CASE_INDEX_3:
    case CASE_INDEX_4:
        code = SetInputUri3(index, imageEffect, filter);
        break;
    case CASE_INDEX_5:
    case CASE_INDEX_6:
    case CASE_INDEX_7:
    case CASE_INDEX_8:
        code = SetInputUri4(index, imageEffect, filter);
        break;
    case CASE_INDEX_9:
        code = OH_ImageEffect_SetInputUri(nullptr, nullptr);
        break;
    case CASE_INDEX_10:
        code = OH_ImageEffect_SetInputUri(nullptr, g_jpgUri.c_str());
        break;
    case CASE_INDEX_11:
        value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_INT32;
        value.dataValue.int32Value = IMAGE_EFFECT_100;
        code = OH_EffectFilter_SetValue(filter, nullptr, &value);
        code = OH_ImageEffect_SetInputUri(imageEffect, nullptr);
        break;
    default:
        break;
    }
    if (code == EFFECT_SUCCESS) {
        code = OH_ImageEffect_SetOutputUri(imageEffect, g_jpgUri.c_str());
    }
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, code, &ret);
    return ret;
}

napi_value OHImageEffectStart(napi_env env, napi_callback_info info)
{
    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);

    OH_PixelmapNative *inputPixelmap = pixelmapNativePtr.get();
    OH_PixelmapNative *outputPixelmap = inputPixelmap;

    // 1、创建imageEffect实例，“ImageEdit”是imageEffect实例别名。
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create("ImageEdit");

    // 2、添加滤镜，多次调用该接口可以添加多个滤镜，组成滤镜链。
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    // 3、设置滤镜参数, 滤镜强度设置为50
    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_50F;
    ImageEffect_ErrorCode errorCode = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);
    
    // 4、设置输入的Pixelmap
    errorCode = OH_ImageEffect_SetInputPixelmap(imageEffect, inputPixelmap);
    if (errorCode != EFFECT_SUCCESS) {
        napi_value ret;
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    // 5、设置输出的Pixelmap（可选），不调用该接口时会在输入Pixelmap上直接生效滤镜效果
    errorCode = OH_ImageEffect_SetOutputPixelmap(imageEffect, outputPixelmap);
    if (errorCode != EFFECT_SUCCESS) {
        napi_value ret;
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    // 6、执行生效滤镜效果
    errorCode = OH_ImageEffect_Start(imageEffect);
    // 7、释放imageEffect实例资源
    OH_ImageEffect_Release(imageEffect);
    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}

napi_value OHImageEffectStop(napi_env env, napi_callback_info info)
{
    std::shared_ptr<OH_PixelmapNative> pixelmapNativePtr = PixelMapHelper::Decode(imagePath);

    OH_PixelmapNative *inputPixelmap = pixelmapNativePtr.get();
    OH_PixelmapNative *outputPixelmap = inputPixelmap;

    // 1、创建imageEffect实例，“ImageEdit”是imageEffect实例别名。
    OH_ImageEffect *imageEffect = OH_ImageEffect_Create("ImageEdit");

    // 2、添加滤镜，多次调用该接口可以添加多个滤镜，组成滤镜链。
    OH_EffectFilter *filter = OH_ImageEffect_AddFilter(imageEffect, OH_EFFECT_BRIGHTNESS_FILTER);

    // 3、设置滤镜参数, 滤镜强度设置为50
    ImageEffect_Any value;
    value.dataType = ImageEffect_DataType::EFFECT_DATA_TYPE_FLOAT;
    value.dataValue.floatValue = IMAGE_EFFECT_50F;
    ImageEffect_ErrorCode errorCode = OH_EffectFilter_SetValue(filter, KEY_FILTER_INTENSITY, &value);

    // 4、设置输入的Pixelmap
    errorCode = OH_ImageEffect_SetInputPixelmap(imageEffect, inputPixelmap);
    if (errorCode != EFFECT_SUCCESS) {
        napi_value ret;
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    // 5、设置输出的Pixelmap（可选），不调用该接口时会在输入Pixelmap上直接生效滤镜效果
    errorCode = OH_ImageEffect_SetOutputPixelmap(imageEffect, outputPixelmap);
    if (errorCode != EFFECT_SUCCESS) {
        napi_value ret;
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    // 6、执行生效滤镜效果
    errorCode = OH_ImageEffect_Start(imageEffect);
    if (errorCode != EFFECT_SUCCESS) {
        napi_value ret;
        napi_create_int32(env, errorCode, &ret);
        return ret;
    }
    // 7、执行生效滤镜效果
    errorCode = OH_ImageEffect_Stop(imageEffect);

    // 7、释放imageEffect实例资源
    OH_ImageEffect_Release(imageEffect);

    napi_value ret;
    napi_create_int32(env, errorCode, &ret);
    return ret;
}
