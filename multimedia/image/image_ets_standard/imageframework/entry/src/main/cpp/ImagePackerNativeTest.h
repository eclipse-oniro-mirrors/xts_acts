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


#ifndef IMAGE_PACKER_NATIVE_ERROR_TEST_H
#define IMAGE_PACKER_NATIVE_ERROR_TEST_H

#include <memory>
#include <string>
#include "napi/native_api.h"

napi_value JsImagePackerCreateImageReceiverOptions(napi_env env, napi_callback_info info);
napi_value JsImageReceiverOptionsGetCapacity(napi_env env, napi_callback_info info);
napi_value JsImageReceiverOptionsSetCapacity(napi_env env, napi_callback_info info);
napi_value JsImageReceiverNativeCreateImageReceiver(napi_env env, napi_callback_info info);
napi_value JsGetReceivingSurfaceId(napi_env env, napi_callback_info info);
napi_value JsImageReceiverNativeReadLatestImage(napi_env env, napi_callback_info info);
napi_value JsImageReceiverNativeReadNextImage(napi_env env, napi_callback_info info);
napi_value JsImageReceiverNativeOn(napi_env env, napi_callback_info info);
napi_value JsGetImageSize(napi_env env, napi_callback_info info);
napi_value JsGetImageSizeBadParameter(napi_env env, napi_callback_info info);
napi_value JsGetImageComponentTypes(napi_env env, napi_callback_info info);
napi_value JsGetImageByteBuffer(napi_env env, napi_callback_info info);
napi_value JsGetImageByteBufferBadParameter(napi_env env, napi_callback_info info);
napi_value JsGetImageBufferSize(napi_env env, napi_callback_info info);
napi_value JsGetImageBufferSizeBadParameter(napi_env env, napi_callback_info info);
napi_value JsGetImageRowStride(napi_env env, napi_callback_info info);
napi_value JsGetImageRowStrideBadParameter(napi_env env, napi_callback_info info);
napi_value JsGetImagePixelStride(napi_env env, napi_callback_info info);
napi_value JsGetImagePixelStrideBadParameter(napi_env env, napi_callback_info info);
napi_value JsGetImageTimestamp(napi_env env, napi_callback_info info);
napi_value JsGetImageTimestampBadParameter(napi_env env, napi_callback_info info);
napi_value JsReleaseImage(napi_env env, napi_callback_info info);
napi_value JsReleaseImageBadParameter(napi_env env, napi_callback_info info);
napi_value JSImagePackerDynamicRangeAuto(napi_env env, napi_callback_info info);
napi_value JSImagePackerDynamicRangeSdr(napi_env env, napi_callback_info info);
napi_value JSIOHPackingOptionsCreate(napi_env env, napi_callback_info info);
napi_value CreatePackingOptions(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsSetMimeType(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsSetMimeTypeImageAllocFailed(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsSetMimeTypeImageBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetMimeType(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetMimeTypeImageAllocFailed(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetMimeTypeImageBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetMimeTypeNull(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetMimeTypeNullInvalidParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetQuality(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetQualityBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsSetQuality(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsSetQualityBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsSetNeedsPackProperties(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsSetNeedsPackPropertiesBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetNeedsPackProperties(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetNeedsPackPropertiesBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsSetDesiredDynamicRange(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsSetDesiredDynamicRangeBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetDesiredDynamicRange(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsGetDesiredDynamicRangeBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsRelease(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsReleaseBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceCreate(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceSetFrameCount(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceSetFrameCountBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceGetFrameCount(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceGetFrameCountBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceSetDelayTimeList(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceSetDelayTimeListBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceGetDelayTimeList(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceGetDelayTimeListBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceSetDisposalTypes(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceSetDisposalTypesBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceGetDisposalTypes(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceGetDisposalTypesBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceSetLoopCount(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceSetLoopCountBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceGetLoopCount(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceGetLoopCountBadParameter(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceRelease(napi_env env, napi_callback_info info);
napi_value JSPackingOptionsForSequenceReleaseBadParameter(napi_env env, napi_callback_info info);
napi_value JSImagePackerNativeCreate(napi_env env, napi_callback_info info);

#endif // IMAGE_PACKER_NATIVE_ERROR_TEST_H