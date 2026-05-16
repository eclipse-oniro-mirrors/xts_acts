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


#ifndef IMAGE_PACKER_NATIVE_ERROR1_TEST_H
#define IMAGE_PACKER_NATIVE_ERROR1_TEST_H

#include <memory>
#include <string>
#include "napi/native_api.h"

napi_value PackerCreate(napi_env env, napi_callback_info info);
napi_value CreateFromFd(napi_env env, napi_callback_info info);
napi_value CreateDecodingOptions(napi_env env, napi_callback_info info);
napi_value CreatePixelMapWithImageSoure(napi_env env, napi_callback_info info);
napi_value JSPackToDataFromImageSource(napi_env env, napi_callback_info info);
napi_value JSPackToDataFromImageSourceBadParamter(napi_env env, napi_callback_info info);
napi_value JSPackToDataFromPixelmap(napi_env env, napi_callback_info info);
napi_value JSPackToDataFromPixelmapBadParamter(napi_env env, napi_callback_info info);
napi_value JSPackToDataFromPicture(napi_env env, napi_callback_info info);
napi_value JSPackToDataFromPictureBadParamter(napi_env env, napi_callback_info info);
napi_value JSPackToDataFromPixelmapSequence(napi_env env, napi_callback_info info);
napi_value JSPackToDataFromPixelmapSequenceBadParamter(napi_env env, napi_callback_info info);
napi_value JSPackToFileFromImageSource(napi_env env, napi_callback_info info);
napi_value JSPackToFileFromImageSourceBadParamter(napi_env env, napi_callback_info info);
napi_value JSPackToFileFromPixelmap(napi_env env, napi_callback_info info);
napi_value JSPackToFileFromPixelmapBadParamter(napi_env env, napi_callback_info info);
napi_value JSPackToFileFromPicture(napi_env env, napi_callback_info info);
napi_value JSPackToFileFromPictureBadParamter(napi_env env, napi_callback_info info);
napi_value JSPackToFileFromPixelmapSequenceBadParamter(napi_env env, napi_callback_info info);
napi_value JSImagePackerNativeRelease(napi_env env, napi_callback_info info);
napi_value JSImagePackerNativeReleaseBadParamter(napi_env env, napi_callback_info info);
napi_value JSGetSupportedFormats(napi_env env, napi_callback_info info);
napi_value JSGetSupportedFormatsBadParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverOptionsCreate(napi_env env, napi_callback_info info);
napi_value JSImageReceiverOptionsCreateBadParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverOptionsGetSize(napi_env env, napi_callback_info info);
napi_value JSImageReceiverOptionsSetSize(napi_env env, napi_callback_info info);
napi_value JSImageReceiverOptionsSetSizeBadParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverOptionsGetCapacitySuccess(napi_env env, napi_callback_info info);
napi_value JSImageReceiverOptionsSetCapacitySuccess(napi_env env, napi_callback_info info);
napi_value JSImageReceiverOptionsSetCapacityBadParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverOptionsRelease(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeCreate(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeCreateBadParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeGetReceivingSurfaceId(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeReadLatestImageBadParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeReadLatestImageUnknownError(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeReadNextImageBadParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeReadNextImageUnknownError(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeOnSuccess(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeOnBadParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeOff(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeOffBadParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeOnImageArrive(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeOnImageArriveInvaildParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeOffImageArrive(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeOffImageArriveInvaildParamter(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeGetSize(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeGetCapacity(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeRelease(napi_env env, napi_callback_info info);
napi_value JSImageReceiverNativeReleaseBadParamter(napi_env env, napi_callback_info info);

#endif // IMAGE_PACKER_NATIVE_ERROR1_TEST_H