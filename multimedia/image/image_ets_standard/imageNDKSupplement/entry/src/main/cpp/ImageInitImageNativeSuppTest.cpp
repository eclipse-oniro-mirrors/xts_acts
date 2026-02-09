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
#include <multimedia/image_framework/image/image_packer_native.h>
#include <multimedia/image_framework/image_mdk.h>
#include <multimedia/image_effect/image_effect_errors.h>
#include <multimedia/image_effect/image_effect_filter.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image/picture_native.h>
#include <multimedia/image_framework/image_receiver_mdk.h>
#include <multimedia/image_framework/image/image_common.h>
#include <native_color_space_manager/native_color_space_manager.h>
#include <native_window/external_window.h>
#include <string>

#include "GlUtilsTest.h"
#include "render_texture.h"
#include "ImageInitImageNativeSuppTest.h"

#define MY_LOG_DOMAIN 0x0000
#define MY_LOG_TAG "ImageEffectNDK"
#define LOG(fmt, ...) (void)OH_LOG_Print(LOG_APP, LOG_DEBUG, MY_LOG_DOMAIN, MY_LOG_TAG, fmt, ##__VA_ARGS__)

#define LOG_DOMAIN 0x0000
#define LOG_TAG "ImageEffectNDK"
#define LOGI(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGD(...) ((void)OH_LOG_Print(LOG_APP, LOG_DEBUG, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGW(...) ((void)OH_LOG_Print(LOG_APP, LOG_WARN, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define LOGE(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

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
#define IMAGE_EFFECT_1920 1920
#define IMAGE_EFFECT_4090 4090
#define IMAGE_EFFECT_5120 5120
#define IMAGE_EFFECT_CODE_401 401
#define IMAGE_EFFECT_1722514390000 1722514390000
#define EFFECT_PARAM_ERROR 29000121
#define IMAGE_EFFECT_INVALID_PARAMETER 401
#define IMAGE_EFFECT_SUCCESS 0
static constexpr uint32_t NUM_0 = 0;
static constexpr uint32_t NUM_1 = 1;
static constexpr uint32_t NUM_2 = 2;
static constexpr uint32_t NUM_3 = 3;
static constexpr uint32_t NUM_4 = 4;
static constexpr int32_t NUM_1000 = 1000;
static constexpr int32_t NUM_2000 = 2000;
static constexpr int32_t NUM_3000 = 3000;
#define MAX_BUFFER_SIZE 512
constexpr uint32_t NUM_100 = 100;
constexpr uint32_t NUM_200 = 200;

#define OPTIONS_SET_WIDTH 6
#define OPTIONS_SET_HEIGHT 4

napi_value OHImageInitImageNativeSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    struct OhosImageReceiverInfo receiverInfo;
    napi_value receiver = nullptr;
    receiverInfo.width = NUM_100;
    receiverInfo.height = NUM_200;
    receiverInfo.format = OHOS_IMAGE_FORMAT_JPEG;
    receiverInfo.capicity = NUM_1;
    OH_Image_Receiver_CreateImageReceiver(env, receiverInfo, &receiver);
    ImageNative *native = OH_Image_InitImageNative(env, nullptr);
    napi_value ret;
    if (native == nullptr) {
        napi_get_undefined(env, &ret);
    }
    return ret;
}
napi_value OHPictureMetadataGetPropertyWithNullSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);

    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    Image_MetadataType metadataType = FRAGMENT_METADATA;
    const std::string keyString = "ImageWidth";

    OH_PictureMetadata *metadataPtr = nullptr;
    Image_ErrorCode errCode1 = OH_PictureMetadata_Create(metadataType, &metadataPtr);
    Image_String key;
    key.data = strdup(keyString.c_str());
    key.size = strlen(key.data);
    Image_String srcValue;
    char bufferValue[] = "666";
    srcValue.data = bufferValue;
    srcValue.size = strlen(bufferValue);
    Image_ErrorCode errCode2 = OH_PictureMetadata_SetProperty(metadataPtr, &key, &srcValue);
    Image_String dstValue;
    Image_ErrorCode errCode;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_PictureMetadata_GetPropertyWithNull(nullptr, &key, &dstValue);
        break;
    case CASE_INDEX_2:
        errCode = OH_PictureMetadata_GetPropertyWithNull(metadataPtr, &key, &dstValue);
        break;
    default:
        break;
    }
    OH_PictureMetadata_Release(metadataPtr);
    napi_value ret;
    napi_create_int32(env, errCode, &ret);
    return ret;
}
napi_value OHPackingOptionsCreateSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_PackingOptions *options = nullptr;
    Image_ErrorCode res;
    switch (index) {
    case CASE_INDEX_1:
        res = OH_PackingOptions_Create(&options);
        break;
    default:
        break;
    }
    napi_value ret;
    napi_create_int32(env, res, &ret);
    return ret;
}
napi_value OHPixelmapNativeGetMetadataSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTIONS_SET_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTIONS_SET_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode errCode =
        OH_PixelmapNative_CreatePixelmapUsingAllocator(data, dataSize, createOpts, IMAGE_ALLOCATOR_MODE_DMA, &pixelMap);
    OH_Pixelmap_HdrMetadataValue *pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_BASE;
    errCode = OH_PixelmapNative_SetMetadata(pixelMap, HDR_METADATA_TYPE, pvalue);
    OH_Pixelmap_HdrMetadataValue *value = new OH_Pixelmap_HdrMetadataValue;
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_PixelmapNative_GetMetadata(pixelMap, HDR_METADATA_TYPE, &value);
        break;
    case CASE_INDEX_2:
        returnValue = OH_PixelmapNative_GetMetadata(nullptr, HDR_METADATA_TYPE, &value);
        break;
    case CASE_INDEX_3:
        returnValue = OH_PixelmapNative_GetMetadata(pixelMap, (OH_Pixelmap_HdrMetadataKey)6, &value);
        break;
    default:
        break;
    }
    if (pixelMap != nullptr) {
        OH_PixelmapNative_Release(pixelMap);
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPixelmapNativeSetMetadataSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTIONS_SET_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTIONS_SET_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode errCode =
        OH_PixelmapNative_CreatePixelmapUsingAllocator(data, dataSize, createOpts, IMAGE_ALLOCATOR_MODE_DMA, &pixelMap);
    OH_Pixelmap_HdrMetadataValue *pvalue = new OH_Pixelmap_HdrMetadataValue;
    pvalue->type = HDR_METADATA_TYPE_BASE;
    OH_Pixelmap_HdrDynamicMetadata *dValue = new OH_Pixelmap_HdrDynamicMetadata;
    dValue->data = data;
    dValue->length = 16;
    Image_ErrorCode returnValue;
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_PixelmapNative_SetMetadata(pixelMap, HDR_METADATA_TYPE, pvalue);
        break;
    case CASE_INDEX_2:
        returnValue = OH_PixelmapNative_SetMetadata(nullptr, HDR_METADATA_TYPE, pvalue);
        break;
    case CASE_INDEX_3:
        errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelMap);
        returnValue = OH_PixelmapNative_SetMetadata(pixelMap, HDR_METADATA_TYPE, pvalue);
        break;
    case CASE_INDEX_5:
        returnValue =
            OH_PixelmapNative_SetMetadata(pixelMap, HDR_DYNAMIC_METADATA, (OH_Pixelmap_HdrMetadataValue *)dValue);
        LOGI("OH_PixelmapNative_SetMetadata,%{public}d", returnValue);
        break;
    default:
        break;
    }
    if (pixelMap != nullptr) {
        OH_PixelmapNative_Release(pixelMap);
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHConvertPixelmapNativeFromNapiSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, OPTIONS_SET_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, OPTIONS_SET_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelMap = nullptr;
    napi_value pixelmapNapi = nullptr;
    Image_ErrorCode returnValue;
    Image_ErrorCode errCode = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelMap);
    OH_PixelmapNative_ConvertPixelmapNativeToNapi(env, pixelMap, &pixelmapNapi);
    OH_PixelmapNative *resPixelMap = nullptr;
    switch (index) {
    case CASE_INDEX_1:
        returnValue = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, pixelmapNapi, &resPixelMap);
        break;
    default:
        break;
    }
    OH_PixelmapNative_Release(pixelMap);
    OH_PixelmapInitializationOptions_Release(createOpts);
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value OHPictureNativeGetMetadataSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < 2) {
        return result;
    }
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, args[1], url, maxUrlLen, &urlSize);
    const std::string keyString = "aaa";
    Image_ErrorCode errCode;
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    LOGI("OH_ImageSourceNative_CreateFromUri:%{public}d", errCode);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *mainPixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &mainPixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(mainPixelMap, &picture);
    OH_PictureMetadata *metadata = nullptr;
    Image_String key;
    key.data = strdup(keyString.c_str());
    key.size = strlen(key.data);
    Image_String srcValue;
    char bufferValue[] = "666";
    srcValue.data = bufferValue;
    srcValue.size = strlen(bufferValue);
    Image_String outValue;
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_PictureMetadata_Create(FRAGMENT_METADATA, &metadata);
        LOGI("OH_PictureMetadata_Create:%{public}d", errCode);
        errCode = OH_PictureNative_SetMetadata(picture, FRAGMENT_METADATA, metadata);
        errCode = OH_PictureNative_GetMetadata(picture, FRAGMENT_METADATA, &metadata);
        break;
    default:
        break;
    }
    if (picture != nullptr) {
        OH_PictureNative_Release(picture);
    }
    napi_create_int32(env, errCode, &result);
    return result;
}
napi_value OHPictureNativeSetMetadataSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_value result = nullptr;
    napi_get_undefined(env, &result);
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < 2) {
        return result;
    }
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    const size_t maxUrlLen = MAX_BUFFER_SIZE;
    char url[maxUrlLen];
    size_t urlSize = 0;
    napi_get_value_string_utf8(env, args[1], url, maxUrlLen, &urlSize);
    const std::string keyString = "aaa";
    Image_ErrorCode errCode;
    OH_ImageSourceNative *tempImageSource = nullptr;
    errCode = OH_ImageSourceNative_CreateFromUri(url, urlSize, &tempImageSource);
    LOGI("OH_ImageSourceNative_CreateFromUri:%{public}d", errCode);
    OH_DecodingOptions *ops = nullptr;
    errCode = OH_DecodingOptions_Create(&ops);
    OH_PixelmapNative *mainPixelMap = nullptr;
    errCode = OH_ImageSourceNative_CreatePixelmap(tempImageSource, ops, &mainPixelMap);
    OH_PictureNative *picture = nullptr;
    errCode = OH_PictureNative_CreatePicture(mainPixelMap, &picture);
    OH_PictureMetadata *metadata = nullptr;
    Image_String key;
    key.data = strdup(keyString.c_str());
    key.size = strlen(key.data);
    Image_String srcValue;
    char bufferValue[] = "666";
    srcValue.data = bufferValue;
    srcValue.size = strlen(bufferValue);
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_PictureMetadata_Create(FRAGMENT_METADATA, &metadata);
        errCode = OH_PictureNative_SetMetadata(picture, FRAGMENT_METADATA, metadata);
        break;
    default:
        break;
    }
    if (picture != nullptr) {
        OH_PictureNative_Release(picture);
    }
    napi_create_int32(env, errCode, &result);
    return result;
}
const int32_t BUFFER_LENGTH = 255900;
const int32_t SIZE_WIDTH = 820;
const int32_t SIZE_HEIGHT = 312;

napi_value OHAuxiliaryPictureNativeSetMetadataSupp(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t index;
    napi_get_value_int32(env, args[0], &index);
    OH_AuxiliaryPictureNative *auxiliaryPicture = nullptr;
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    Image_ErrorCode errCode =
        OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength, &size,
                                         Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &auxiliaryPicture);
    OH_AuxiliaryPictureInfo *info2;
    errCode = OH_AuxiliaryPictureInfo_Create(&info2);
    OH_PictureMetadata *metadata = nullptr;
    errCode = OH_PictureMetadata_Create(EXIF_METADATA, &metadata);
    switch (index) {
    case CASE_INDEX_1:
        errCode = OH_AuxiliaryPictureNative_SetMetadata(auxiliaryPicture, FRAGMENT_METADATA, metadata);
        break;
    default:
        break;
    }
    if (auxiliaryPicture != nullptr) {
        OH_AuxiliaryPictureNative_Release(auxiliaryPicture);
    }
    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    return result;
}