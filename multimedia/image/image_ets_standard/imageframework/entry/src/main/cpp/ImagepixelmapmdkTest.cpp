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
#include "imagepixelmapmdkTest.h"
#include <hilog/log.h>
#include <js_native_api_types.h>
#include <multimedia/image_framework/image/image_common.h>
#include <multimedia/image_framework/image/pixelmap_native.h> //
#include <multimedia/image_framework/image_packer_mdk.h>
#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <multimedia/image_framework/image_pixel_map_napi.h>
#include <multimedia/image_framework/image_receiver_mdk.h>
#undef LOG_TAG
#define LOG_TAG "testTag"
static constexpr size_t TEST_SIZE = 0;
constexpr int TEST_ARG_SUM = 1;
napi_value ImagePackerCreate1(napi_env env, napi_callback_info info)
{
    napi_value imagePacker = nullptr;
    int32_t returnValue = OH_ImagePacker_Create(env, &imagePacker);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ImagePackerRelease(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_ImagePacker_Release(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureMetadataCreate1(napi_env env, napi_callback_info info)
{
    Image_MetadataType metadataType = EXIF_METADATA;
    OH_PictureMetadata *metadataPtr = nullptr;
    Image_ErrorCode errCode = OH_PictureMetadata_Create(metadataType, &metadataPtr);
    int ret = -1;
    if (errCode == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureMetadataCreate2(napi_env env, napi_callback_info info)
{
    Image_MetadataType metadataType = EXIF_METADATA;
    Image_ErrorCode errCode = OH_PictureMetadata_Create(metadataType, nullptr);
    int ret = -1;
    if (errCode == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureMetadataGetProperty1(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_PictureMetadata_GetProperty(nullptr, nullptr, nullptr);
    int ret = -1;
    if (errCode == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureMetadataSetProperty1(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_PictureMetadata_SetProperty(nullptr, nullptr, nullptr);
    int ret = -1;
    if (errCode == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureMetadataRelease1(napi_env env, napi_callback_info info)
{
    OH_PictureMetadata *metadataPtr = nullptr;
    Image_MetadataType metadataType = EXIF_METADATA;
    OH_PictureMetadata_Create(metadataType, &metadataPtr);
    Image_ErrorCode errCode = OH_PictureMetadata_Release(metadataPtr);

    int ret = -1;
    if (errCode == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, errCode, &result);
    return result;
}
napi_value PictureMetadataRelease2(napi_env env, napi_callback_info info)
{
    OH_PictureMetadata *metadataPtr = nullptr;
    Image_ErrorCode errCode = OH_PictureMetadata_Release(nullptr);

    int ret = -1;
    if (errCode == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureMetadataClone1(napi_env env, napi_callback_info info)
{
    Image_ErrorCode errCode = OH_PictureMetadata_Clone(nullptr, nullptr);

    int ret = -1;
    if (errCode == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value CreatePixelMapWithStride(napi_env env, napi_callback_info info)
{
    void *buffer = nullptr;
    size_t bufferSize = 0;
    struct OhosPixelMapCreateOps createOps;
    napi_value pixelmap = nullptr;
    size_t rowStride = -1;
    int returnValue = OH_PixelMap_CreatePixelMapWithStride(env, createOps, buffer, bufferSize, rowStride, &pixelmap);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_GET_DATA_ABNORMAL) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value CreateAlphaPixelMap(napi_env env, napi_callback_info info)
{
    napi_value source = nullptr;
    napi_value *alpha = nullptr;
    int32_t returnValue = OH_PixelMap_CreateAlphaPixelMap(env, source, alpha);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_INVALID_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value GetBytesNumberPerRow(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int *num = nullptr;
    int32_t returnValue = OH_PixelMap_GetBytesNumberPerRow(p, num);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value GetIsEditable(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int *num = nullptr;
    int32_t returnValue = OH_PixelMap_GetIsEditable(p, num);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value IsSupportAlpha(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int *num = nullptr;
    int32_t returnValue = OH_PixelMap_IsSupportAlpha(p, num);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value SetAlphaAble(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int num = 0;
    int32_t returnValue = OH_PixelMap_SetAlphaAble(p, num);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value GetDensity(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int *num = nullptr;
    int32_t returnValue = OH_PixelMap_GetDensity(p, num);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value SetDensity(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int num = 0;
    int32_t returnValue = OH_PixelMap_SetDensity(p, num);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value SetOpacity(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    float num = 0.5;
    int32_t returnValue = OH_PixelMap_SetOpacity(p, num);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapScale(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    float x = 0.5;
    float y = 0.5;
    int32_t returnValue = OH_PixelMap_Scale(p, x, y);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ScaleWithAntiAliasing(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    float x = 0.5;
    float y = 0.5;
    int32_t returnValue =
        OH_PixelMap_ScaleWithAntiAliasing(p, x, y, OH_PixelMap_AntiAliasingLevel::OH_PixelMap_AntiAliasing_NONE);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapTranslate(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    float x = 0.5;
    float y = 0.5;
    int32_t returnValue = OH_PixelMap_Translate(p, x, y);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapRotate(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    float x = 0.5;
    int32_t returnValue = OH_PixelMap_Rotate(p, x);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapFlip(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int32_t x = 0;
    int32_t y = 0;
    int32_t returnValue = OH_PixelMap_Flip(p, x, y);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapCrop(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int32_t x = 0;
    int32_t y = 0;
    int32_t width = 0;
    int32_t height = 0;
    int32_t returnValue = OH_PixelMap_Crop(p, x, y, width, height);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapGetImageInfo(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_PixelMap_GetImageInfo(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapAccessPixels(napi_env env, napi_callback_info info)
{
    int32_t returnValue = OH_PixelMap_AccessPixels(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelMapUnAccessPixels(napi_env env, napi_callback_info info)
{
    const NativePixelMap *p = nullptr;
    int32_t returnValue = OH_PixelMap_UnAccessPixels(p);
    int ret = -1;
    if (returnValue == IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value UnAccessPixels(napi_env env, napi_callback_info info)
{
    napi_env env1 = nullptr;
    napi_value value = nullptr;
    int32_t returnValue = OHOS::Media::OH_UnAccessPixels(env1, value);
    int ret = -1;
    if (returnValue == OHOS::Media::OHOS_IMAGE_RESULT_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value GetImageInfoParameter(napi_env env, napi_callback_info info)
{
    napi_value result1 = nullptr;
    napi_get_undefined(env, &result1);
    napi_value thisVar = nullptr;
    napi_value argValue[TEST_ARG_SUM] = {0};
    size_t argCount = TEST_ARG_SUM;
    napi_get_cb_info(env, info, &argCount, argValue, &thisVar, nullptr);
    OHOS::Media::OhosPixelMapInfo pixelMapInfo;
    int32_t returnValue = OHOS::Media::OH_GetImageInfo(env, argValue[0], &pixelMapInfo);
    uint32_t returnValue1 = pixelMapInfo.width;
    uint32_t returnValue2 = pixelMapInfo.height;
    uint32_t returnValue3 = pixelMapInfo.rowSize;
    int32_t returnValue4 = pixelMapInfo.pixelFormat;
    napi_value result = nullptr;
    napi_create_int32(env, 0, &result);
    return result;
}
