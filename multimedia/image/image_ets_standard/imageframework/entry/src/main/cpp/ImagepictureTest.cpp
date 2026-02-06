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
#include "imagepicture.h"
#include <memory>
#include <multimedia/image_framework/image/picture_native.h>
const int32_t SIZE_WIDTH = 820;
const int32_t SIZE_HEIGHT = 312;
const int32_t BUFFER_LENGTH = 255900;
const int8_t NUM_0 = 0;
const int SET_WIDTH = 6;
const int SET_HEIGHT = 4;
const int32_t ERRER_AUXILIARY_PICTURE_TYPE = 20;
const uint32_t ROW_STRIDE = 10;
constexpr int8_t ARGB_8888_BYTES = 4;
#define NUM_1 1
#define NUM_0 0
OH_PixelmapNative *TEST_PIXELMAP = nullptr;
napi_value PictureNativeCreatePicture(napi_env env, napi_callback_info info)
{
    OH_PictureNative *picture = nullptr;
    Image_ErrorCode returnValue = OH_PictureNative_CreatePicture(nullptr, &picture);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureNativeGetMainPixelmap(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *mainPixelmap = nullptr;
    Image_ErrorCode returnValue = OH_PictureNative_GetMainPixelmap(nullptr, &mainPixelmap);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureNativeGetHdrComposedPixelmap(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PictureNative_GetHdrComposedPixelmap(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureNativeGetGainmapPixelmap(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *gainmapPixelmap = nullptr;
    Image_ErrorCode returnValue = OH_PictureNative_GetGainmapPixelmap(nullptr, &gainmapPixelmap);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureNativeSetAuxiliaryPicture(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PictureNative_SetAuxiliaryPicture(
        nullptr, Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureNativeGetMetadata(napi_env env, napi_callback_info info)
{
    Image_MetadataType metadataType = EXIF_METADATA;
    Image_ErrorCode returnValue = OH_PictureNative_GetMetadata(nullptr, metadataType, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureNativeSetMetadata(napi_env env, napi_callback_info info)
{
    Image_MetadataType metadataType = EXIF_METADATA;
    Image_ErrorCode returnValue = OH_PictureNative_SetMetadata(nullptr, metadataType, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PictureNativeRelease(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PictureNative_Release(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeCreate(napi_env env, napi_callback_info info)
{
    uint8_t *color = nullptr;
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    OH_AuxiliaryPictureNative *picture = nullptr;
    Image_AuxiliaryPictureType type = Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureNative_Create(color, dataLength, &size, type, &picture);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeCreateSuccess(napi_env env, napi_callback_info info)
{
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    size.width = SIZE_WIDTH;
    size.height = SIZE_HEIGHT;
    OH_AuxiliaryPictureNative *picture = nullptr;
    Image_ErrorCode returnValue =
        OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength, &size,
                                         Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP, &picture);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeWritePixels(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative *picture = nullptr;
    uint8_t *source = nullptr;
    const size_t bufferSize = 0;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureNative_WritePixels(picture, source, bufferSize);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeReadPixels(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative *picture = nullptr;
    uint8_t *destination = nullptr;
    size_t *bufferSize = nullptr;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureNative_ReadPixels(picture, destination, bufferSize);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeGetType(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative *picture = nullptr;
    Image_AuxiliaryPictureType *typeptr = nullptr;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureNative_GetType(picture, typeptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeGetInfo(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative *picture = nullptr;
    OH_AuxiliaryPictureInfo *infoptr = nullptr;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureNative_GetInfo(picture, &infoptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeSetInfo(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative *picture = nullptr;
    OH_AuxiliaryPictureInfo *infoptr = nullptr;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureNative_SetInfo(picture, infoptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeGetMetadata(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative *picture = nullptr;
    OH_PictureMetadata *metadataptr = nullptr;
    Image_MetadataType metadataType = EXIF_METADATA;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureNative_GetMetadata(picture, metadataType, &metadataptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeSetMetadata(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureNative *picture = nullptr;
    OH_PictureMetadata *metadata = nullptr;
    Image_ErrorCode returnValue =
        OH_AuxiliaryPictureNative_SetMetadata(picture, Image_MetadataType::FRAGMENT_METADATA, metadata);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeRelease(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_AuxiliaryPictureNative_Release(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureNativeReleaseSuccess(napi_env env, napi_callback_info info)
{
    std::unique_ptr<uint32_t[]> color = std::make_unique<uint32_t[]>(BUFFER_LENGTH);
    OH_AuxiliaryPictureNative *auxiliaryPictureNative = nullptr;
    size_t dataLength = BUFFER_LENGTH;
    Image_Size size;
    OH_AuxiliaryPictureNative_Create(reinterpret_cast<uint8_t *>(color.get()), dataLength, &size,
                                     Image_AuxiliaryPictureType::AUXILIARY_PICTURE_TYPE_GAINMAP,
                                     &auxiliaryPictureNative);
    Image_ErrorCode returnValue = OH_AuxiliaryPictureNative_Release(auxiliaryPictureNative);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoCreate(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_Create(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoCreateSuccess(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoGetType(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    Image_AuxiliaryPictureType type;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_GetType(auxiliaryPictureInfo, &type);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoGetTypeSucess(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    Image_AuxiliaryPictureType retType;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_GetType(auxiliaryPictureInfo, &retType);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoSetType(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    Image_AuxiliaryPictureType type = (Image_AuxiliaryPictureType)ERRER_AUXILIARY_PICTURE_TYPE;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_SetType(auxiliaryPictureInfo, type);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoSetTypeSuccess(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    Image_AuxiliaryPictureType type = AUXILIARY_PICTURE_TYPE_GAINMAP;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_SetType(auxiliaryPictureInfo, type);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoGetSize(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    Image_Size retSize;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_GetSize(auxiliaryPictureInfo, &retSize);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoGetSizeSucces(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    Image_Size retSize;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_GetSize(auxiliaryPictureInfo, &retSize);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoSetSize(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    Image_Size *size = nullptr;

    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_SetSize(auxiliaryPictureInfo, size);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoSetSizeSuccess(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    Image_Size size;
    size.height = SIZE_HEIGHT;
    size.width = SIZE_WIDTH;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_SetSize(auxiliaryPictureInfo, &size);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoGetRowStride(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    uint32_t retRowStride;

    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_GetRowStride(auxiliaryPictureInfo, &retRowStride);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoGetRowStrideSuccess(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    OH_AuxiliaryPictureInfo_SetRowStride(auxiliaryPictureInfo, ROW_STRIDE);
    uint32_t retRowStride;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_GetRowStride(auxiliaryPictureInfo, &retRowStride);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoSetRowStride(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_SetRowStride(auxiliaryPictureInfo, ROW_STRIDE);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoSetRowStrideSuccess(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_SetRowStride(auxiliaryPictureInfo, ROW_STRIDE);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoGetPixelFormat(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    PIXEL_FORMAT retPixelFormat;

    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_GetPixelFormat(auxiliaryPictureInfo, &retPixelFormat);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoGetPixelFormatSuccess(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    PIXEL_FORMAT pixelFormat = PIXEL_FORMAT_NV21;
    OH_AuxiliaryPictureInfo_SetPixelFormat(auxiliaryPictureInfo, pixelFormat);
    PIXEL_FORMAT retPixelFormat;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_GetPixelFormat(auxiliaryPictureInfo, &retPixelFormat);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoSetPixelFormat(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    PIXEL_FORMAT pixelFormat = PIXEL_FORMAT_NV21;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_SetPixelFormat(auxiliaryPictureInfo, pixelFormat);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoSetPixelFormatSuccess(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    PIXEL_FORMAT pixelFormat = PIXEL_FORMAT_NV21;
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_SetPixelFormat(auxiliaryPictureInfo, pixelFormat);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoRelease(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_Release(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value AuxiliaryPictureInfoReleaseSuccess(napi_env env, napi_callback_info info)
{
    OH_AuxiliaryPictureInfo *auxiliaryPictureInfo = nullptr;
    OH_AuxiliaryPictureInfo_Create(&auxiliaryPictureInfo);
    Image_ErrorCode returnValue = OH_AuxiliaryPictureInfo_Release(auxiliaryPictureInfo);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsCreate(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_Create(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsCreateSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_Create(&ops);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetWidthSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    uint32_t width = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetWidth(ops, &width);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetWidth(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetWidth(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetWidthSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetWidth(ops, 1);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetWidth(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetWidth(nullptr, 1);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetHeightSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    uint32_t height = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetHeight(ops, &height);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetHeight(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetHeight(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetHeightSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    uint32_t height = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetHeight(ops, 1);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetHeight(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetHeight(nullptr, 1);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetPixelFormatSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    int32_t pixelFormat = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetPixelFormat(ops, &pixelFormat);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetPixelFormat(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetPixelFormat(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetPixelFormatSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    int32_t pixelFormat = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetPixelFormat(ops, 1);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetPixelFormat(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetPixelFormat(nullptr, 1);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetSrcPixelFormatSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    int32_t srcpixelFormat = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetSrcPixelFormat(ops, &srcpixelFormat);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetSrcPixelFormat(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetSrcPixelFormat(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetSrcPixelFormatSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    int32_t srcpixelFormat = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetSrcPixelFormat(ops, 1);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetSrcPixelFormat(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetSrcPixelFormat(nullptr, 1);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetRowStrideSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    OH_PixelmapInitializationOptions_Create(&opts);
    int32_t getStride = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetRowStride(opts, &getStride);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetRowStride(napi_env env, napi_callback_info info)
{
    int32_t getStride = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetRowStride(nullptr, &getStride);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetRowStrideSuccess(napi_env env, napi_callback_info info)
{
    int32_t rowStride = 0;
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    OH_PixelmapInitializationOptions_Create(&opts);
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetRowStride(opts, rowStride);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetRowStride(napi_env env, napi_callback_info info)
{
    int32_t rowStride = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetRowStride(nullptr, rowStride);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetAlphaTypeSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    int32_t alphaType = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetAlphaType(ops, &alphaType);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetAlphaType(napi_env env, napi_callback_info info)
{
    int32_t alphaType = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetAlphaType(nullptr, &alphaType);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetAlphaTypeSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    int32_t alphaType = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetAlphaType(ops, 1);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetAlphaType(napi_env env, napi_callback_info info)
{
    int32_t alphaType = 0;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetAlphaType(nullptr, 1);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetEditableSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    bool editable = false;
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetEditable(ops, &editable);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsGetEditable(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_GetEditable(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetEditableSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetEditable(ops, false);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsSetEditable(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_SetEditable(nullptr, false);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsReleaseSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapInitializationOptions_Create(&ops);
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_Release(ops);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapInitializationOptionsRelease(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapInitializationOptions_Release(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoCreateSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *ImageInfo = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_Create(&ImageInfo);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoCreate(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_Create(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetWidthSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    uint32_t dstWidth = 0;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetWidth(imageInfo, &dstWidth);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetWidth(napi_env env, napi_callback_info info)
{
    uint32_t dstWidth = 0;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetWidth(nullptr, &dstWidth);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetHeightSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    uint32_t dstHeight = 0;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetHeight(imageInfo, &dstHeight);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetHeight(napi_env env, napi_callback_info info)
{
    uint32_t dstHeight = 0;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetHeight(nullptr, &dstHeight);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetAlphaModeSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    int32_t alphaMode;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetAlphaMode(imageInfo, &alphaMode);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetAlphaMode(napi_env env, napi_callback_info info)
{
    uint32_t dstHeight = 0;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetAlphaMode(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetRowStrideSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    uint32_t dstRowStride = 0;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetRowStride(imageInfo, &dstRowStride);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetRowStride(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetRowStride(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetPixelFormatSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    int32_t dstFormat;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetPixelFormat(imageInfo, &dstFormat);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetPixelFormat(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetPixelFormat(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetAlphaTypeSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    int32_t dstAlphaType = 0;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetAlphaType(imageInfo, &dstAlphaType);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetAlphaType(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetAlphaType(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetDynamicRangeSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *pixelmapInfo = nullptr;
    OH_PixelmapImageInfo_Create(&pixelmapInfo);
    bool pixelmapIsHdr;
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetDynamicRange(pixelmapInfo, &pixelmapIsHdr);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoGetDynamicRange(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_GetDynamicRange(nullptr, nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoReleaseSuccess(napi_env env, napi_callback_info info)
{
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    OH_PixelmapImageInfo_Create(&imageInfo);
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_Release(imageInfo);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapImageInfoRelease(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapImageInfo_Release(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeCreatePixelmapSuccess(napi_env env, napi_callback_info info)
{
    uint8_t data[96];
    size_t dataSize = 96;
    for (int i = 0; i < dataSize; i++) {
        data[i] = i + 1;
    }
    int32_t setWidth = 6;
    int32_t setHeight = 4;
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, SET_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, SET_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelMap);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value PixelmapNativeCreatePixelmap(napi_env env, napi_callback_info info)
{
    uint8_t *colors = nullptr;
    size_t colorLength = 0;
    OH_Pixelmap_InitializationOptions *opts = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_CreatePixelmap(colors, colorLength, opts, &pixelMap);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}

napi_value CreatePixelmapUsingAllocator(napi_env env, napi_callback_info info)
{
    uint8_t *data = nullptr;
    size_t dataLength = 0;
    OH_Pixelmap_InitializationOptions *ops = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode returnValue =
        OH_PixelmapNative_CreatePixelmapUsingAllocator(data, dataLength, ops, IMAGE_ALLOCATOR_MODE_AUTO, &pixelMap);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ConvertPixelmapNativeToNapiSuccess(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap;
    napi_value pixelValue;
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, SET_WIDTH);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, SET_HEIGHT);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_RGBA_8888);
    OH_PixelmapInitializationOptions_SetAlphaType(createOpts, PIXELMAP_ALPHA_TYPE_UNKNOWN);
    OH_PixelmapNative_CreateEmptyPixelmap(createOpts, &pixelMap);
    Image_ErrorCode returnValue = OH_PixelmapNative_ConvertPixelmapNativeToNapi(env, pixelMap, &pixelValue);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, returnValue, &result);
    return result;
}
napi_value ConvertPixelmapNativeToNapi(napi_env env, napi_callback_info info)
{
    napi_env env1 = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    napi_value res = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_ConvertPixelmapNativeToNapi(env1, pixelMap, &res);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value ConvertPixelmapNativeFromNapi(napi_env env, napi_callback_info info)
{
    napi_value source = nullptr;
    OH_PixelmapNative *pixelMap = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_ConvertPixelmapNativeFromNapi(env, source, &pixelMap);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeReadPixels(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    uint8_t *buffer = nullptr;
    size_t *bufferSize = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_ReadPixels(pixelMap, buffer, bufferSize);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeWritePixels(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    uint8_t *source = nullptr;
    size_t bufferSize = 0;
    Image_ErrorCode returnValue = OH_PixelmapNative_WritePixels(pixelMap, source, bufferSize);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetArgbPixelsSuccess(napi_env env, napi_callback_info info)
{
    size_t dataSize = ARGB_8888_BYTES;
    uint8_t data[] = {0x01, 0x02, 0x03, 0xFF};
    OH_Pixelmap_InitializationOptions *createOpts;
    OH_PixelmapInitializationOptions_Create(&createOpts);
    OH_PixelmapInitializationOptions_SetWidth(createOpts, 1);
    OH_PixelmapInitializationOptions_SetHeight(createOpts, 1);
    OH_PixelmapInitializationOptions_SetPixelFormat(createOpts, PIXEL_FORMAT_BGRA_8888);
    OH_PixelmapNative *pixelMap = nullptr;
    OH_PixelmapNative_CreatePixelmap(data, dataSize, createOpts, &pixelMap);
    uint8_t result1[ARGB_8888_BYTES];
    Image_ErrorCode returnValue = OH_PixelmapNative_GetArgbPixels(pixelMap, result1, &dataSize);
    int ret = -1;
    if (returnValue == IMAGE_SUCCESS) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetArgbPixels(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    uint8_t *buffer = nullptr;
    size_t *bufferSize = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_GetArgbPixels(pixelMap, buffer, bufferSize);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeToSdr(napi_env env, napi_callback_info info)
{
    Image_ErrorCode returnValue = OH_PixelmapNative_ToSdr(nullptr);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}
napi_value PixelmapNativeGetImageInfo(napi_env env, napi_callback_info info)
{
    OH_PixelmapNative *pixelMap = nullptr;
    OH_Pixelmap_ImageInfo *imageInfo = nullptr;
    Image_ErrorCode returnValue = OH_PixelmapNative_GetImageInfo(pixelMap, imageInfo);
    int ret = -1;
    if (returnValue == IMAGE_BAD_PARAMETER) {
        ret = 0;
    }
    napi_value result = nullptr;
    napi_create_int32(env, ret, &result);
    return result;
}