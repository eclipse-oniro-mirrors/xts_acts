/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


#ifndef IMAGE_SOURCE_NATIVE_ERROR_CODE_TEST_H
#define IMAGE_SOURCE_NATIVE_ERROR_CODE_TEST_H

#include <memory>
#include <string>
#include "napi/native_api.h"

napi_value JSImageSoureNativeImageDynamicRangeAuto(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageDynamicRangeSDR(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageDynamicRangeHDR(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageAllocatorTypeAuto(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageAllocatorTypeDMA(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageAllocatorTypeShareMemory(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageCropAndScaleStrategyScaleFirst(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageCropAndScaleStrategyCropFirst(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageSourceInfoGetWidth(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageSourceInfoGetWidthBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageSourceInfoGetHeight(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageSourceInfoGetHeightBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageSourceInfoGetDynamicRange(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageSourceInfoGetDynamicRangeBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageSourceInfoGetMimeType(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageSourceInfoRelease(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeImageSourceInfoReleasBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetPixelFormat(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetPixelFormatBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetPixelFormatBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetIndex(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetIndexBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetIndex(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetIndexBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetRotate(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetRotateBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetRotate(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetRotateBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetDesiredSize(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetDesiredSizeBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetDesiredSizeBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetDesiredRegion(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetDesiredRegionBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetDesiredRegion(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetDesiredRegionBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetDesiredDynamicRange(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetDesiredDynamicRangeBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetDesiredDynamicRange(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetDesiredDynamicRangeBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetCropAndScaleStrategy(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetCropAndScaleStrategyBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetCropAndScaleStrategy(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetCropAndScaleStrategyBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeDecodingOptionsSetCropRegionInvaildParamter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeDecodingOptionsGetCropRegionInvaildParamter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeDecodingOptionsGetDesiredColorSpace(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsGetDesiredColorSpaceInvaildParamter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeDecodingOptionsSetDesiredColorSpace(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsSetDesiredColorSpaceInvaildParamter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeDecodingOptionsRelease(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsReleaseBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreateFromUri(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeCreateFromUriBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreateFromFdBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreateFromData(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeCreateFromDataBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreateFromDataWithUserBuffer(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeCreateFromDataWithUserBufferInvaildParamter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreateFromRawFile(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeCreateFromRawFileBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreatePixelmapBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreatePixelmapUsingAllocatorBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeCreatePixelmapUsingAllocatorUnsuportedAllocatorType(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreatePixelmapList(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeCreatePixelmapListBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreatePicture(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeCreatePictureBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeCreatePictureAtIndex(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeCreatePictureAtIndexBadSource(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeCreatePictureAtIndexUnsuportedOptions(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeGetDelayTimeList(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeGetDelayTimeListBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeGetImageInfo(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeGetImageInfoBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeGetImagePropertyBadParameter(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeGetImagePropertyAllocFailed(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeGetImagePropertyWithNullInvaildParamter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeModifyImageProperty(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeModifyImagePropertyBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeGetFrameCount(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeGetFrameCountBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeRelease(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeReleaseBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeDecodingOptionsForPictureCreateBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeDecodingOptionsForPictureGetDesiredAuxiliaryPictures(napi_env env,
                                                                                  napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsForPictureGetDesiredAuxiliaryPicturesBadParameter(napi_env env,
                                                                                              napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsForPictureSetDesiredAuxiliaryPictures(napi_env env,
                                                                                  napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsForPictureSetDesiredAuxiliaryPicturesBadParameter(napi_env env,
                                                                                              napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsForPictureRelease(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeDecodingOptionsForPictureReleaseBadParameter(napi_env env, napi_callback_info info);

napi_value JSImageSoureNativeGetSupportedFormats(napi_env env, napi_callback_info info);
napi_value JSImageSoureNativeGetSupportedFormatsInvalidParameter(napi_env env, napi_callback_info info);
napi_value Test_PictureNative_CreatePicture(napi_env env, napi_callback_info info);
napi_value Test_OH_PictureNative_GetMainPixelmap(napi_env env, napi_callback_info info);
napi_value Test_OH_PictureNative_GetHdrComposedPixelmap(napi_env env, napi_callback_info info);
napi_value Test_OH_PictureNative_GetGainmapPixelmap(napi_env env, napi_callback_info info);
napi_value Test_OH_PictureNative_SetAuxiliaryPicture(napi_env env, napi_callback_info info);
napi_value Test_OH_PictureNative_GetAuxiliaryPicture(napi_env env, napi_callback_info info);
napi_value Test_OH_PictureNative_GetMetadata(napi_env env, napi_callback_info info);
napi_value Test_OH_PictureNative_SetMetadata(napi_env env, napi_callback_info info);
napi_value Test_OH_PictureNative_Release(napi_env env, napi_callback_info info);
napi_value Test_OH_AuxiliaryPictureNativeWritePixelsImage(napi_env env, napi_callback_info info);
napi_value Test_OH_AuxiliaryPictureNative_ReadPixels(napi_env env, napi_callback_info info);
napi_value Test_OH_AuxiliaryPictureNative_GetType(napi_env env, napi_callback_info info);
napi_value Test_OH_AuxiliaryPictureNative_GetInfo(napi_env env, napi_callback_info info);
napi_value Test_OH_AuxiliaryPictureNative_SetInfo(napi_env env, napi_callback_info info);
napi_value Test_OH_AuxiliaryPictureNative_GetMetadata(napi_env env, napi_callback_info info);
napi_value Test_OH_AuxiliaryPictureNative_SetMetadata(napi_env env, napi_callback_info info);
#endif // IMAGE_SOURCE_NATIVE_ERROR_CODE_TEST_H