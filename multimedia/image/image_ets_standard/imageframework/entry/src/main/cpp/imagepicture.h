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
#ifndef MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGEPICTURE_H
#define MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGEPICTURE_H
#include "node_api.h"

napi_value PictureNativeCreatePicture(napi_env env, napi_callback_info info);
napi_value PictureNativeGetMainPixelmap(napi_env env, napi_callback_info info);
napi_value PictureNativeGetHdrComposedPixelmap(napi_env env, napi_callback_info info);
napi_value PictureNativeGetGainmapPixelmap(napi_env env, napi_callback_info info);
napi_value PictureNativeSetAuxiliaryPicture(napi_env env, napi_callback_info info);
napi_value PictureNativeGetMetadata(napi_env env, napi_callback_info info);
napi_value PictureNativeSetMetadata(napi_env env, napi_callback_info info);
napi_value PictureNativeRelease(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeCreate(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeWritePixels(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeReadPixels(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeGetType(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeGetInfo(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeSetInfo(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeGetMetadata(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeSetMetadata(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeRelease(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoCreate(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoGetType(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoSetType(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoGetSize(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoSetSize(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoGetRowStride(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoSetRowStride(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoGetPixelFormat(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoSetPixelFormat(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoRelease(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoSetTypeSuccess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoCreateSuccess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeCreateSuccess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoGetSizeSucces(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoSetSizeSuccess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoGetRowStrideSuccess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoSetRowStrideSuccess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoGetPixelFormatSuccess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoSetPixelFormatSuccess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoReleaseSuccess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureInfoGetTypeSucess(napi_env env, napi_callback_info info);
napi_value AuxiliaryPictureNativeReleaseSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsCreate(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsCreateSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetWidth(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetWidthSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetWidthSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetHeightSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetHeightSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetWidth(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetHeight(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetHeight(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetPixelFormat(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetPixelFormat(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetSrcPixelFormat(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetSrcPixelFormat(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetPixelFormatSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetPixelFormatSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetSrcPixelFormatSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetSrcPixelFormatSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetRowStrideSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetRowStride(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetRowStride(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetAlphaType(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetAlphaType(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetEditable(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetEditable(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsRelease(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoCreate(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetWidth(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetHeight(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetRowStrideSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetAlphaTypeSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetAlphaTypeSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsGetEditableSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsSetEditableSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapInitializationOptionsReleaseSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoCreateSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetWidthSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetHeightSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetAlphaModeSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetAlphaMode(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetRowStrideSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetRowStride(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetPixelFormatSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetPixelFormat(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetAlphaTypeSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetAlphaType(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetDynamicRangeSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoGetDynamicRange(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoReleaseSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapImageInfoRelease(napi_env env, napi_callback_info info);
napi_value PixelmapNativeCreatePixelmapSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeCreatePixelmap(napi_env env, napi_callback_info info);
napi_value CreatePixelmapUsingAllocator(napi_env env, napi_callback_info info);
napi_value ConvertPixelmapNativeToNapi(napi_env env, napi_callback_info info);
napi_value ConvertPixelmapNativeToNapiSuccess(napi_env env, napi_callback_info info);
napi_value ConvertPixelmapNativeFromNapi(napi_env env, napi_callback_info info);
napi_value PixelmapNativeReadPixels(napi_env env, napi_callback_info info);
napi_value PixelmapNativeWritePixels(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetArgbPixelsSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetArgbPixels(napi_env env, napi_callback_info info);
napi_value PixelmapNativeToSdr(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetImageInfo(napi_env env, napi_callback_info info);
#endif // MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGEPICTURE_H
