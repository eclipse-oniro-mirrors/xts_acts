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
#ifndef MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGEFRAMEWORKTEST_H
#define MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGEFRAMEWORKTEST_H
#include "node_api.h"
napi_value PixelmapNativeOpacitySuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeOpacity(napi_env env, napi_callback_info info);
napi_value PixelmapNativeScaleSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeScale(napi_env env, napi_callback_info info);
napi_value PixelmapNativeScaleWithAntiAliasing(napi_env env, napi_callback_info info);
napi_value CreateScaledPixelMap(napi_env env, napi_callback_info info);
napi_value Translate(napi_env env, napi_callback_info info);
napi_value PixelmapNativeRotateSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeRotate(napi_env env, napi_callback_info info);
napi_value PixelmapNativeFlipSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeFlip(napi_env env, napi_callback_info info);
napi_value PixelmapNativeCrop(napi_env env, napi_callback_info info);
napi_value PixelmapNativeReleaseSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeRelease(napi_env env, napi_callback_info info);
napi_value CreateScaledPixelMapWithAntiAliasing(napi_env env, napi_callback_info info);
napi_value PixelmapNativeDestroySuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeDestroy(napi_env env, napi_callback_info info);
napi_value PixelmapNativeConvertAlphaFormat(napi_env env, napi_callback_info info);
napi_value PixelmapNativeCreateEmptyPixelmapSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeCreateEmptyPixelmap(napi_env env, napi_callback_info info);
napi_value PixelmapNativeCreateEmptyPixelmapUsingAllocator(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetMetadata(napi_env env, napi_callback_info info);
napi_value PixelmapNativeSetMetadata(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetNativeBuffer(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetColorSpaceNative(napi_env env, napi_callback_info info);
napi_value PixelmapNativeSetColorSpaceNative(napi_env env, napi_callback_info info);
napi_value PixelmapNativeSetMemoryName(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetByteCountSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetByteCount(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetAllocationByteCountSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeGetAllocationByteCount(napi_env env, napi_callback_info info);
napi_value PixelmapNativeAccessPixelsSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeAccessPixels(napi_env env, napi_callback_info info);
napi_value PixelmapNativeUnaccessPixelsSuccess(napi_env env, napi_callback_info info);
napi_value PixelmapNativeUnaccessPixels(napi_env env, napi_callback_info info);
napi_value ImageProcessingCreateSuccess(napi_env env, napi_callback_info info);
napi_value ImageProcessingDestroySuccess(napi_env env, napi_callback_info info);
napi_value ImageProcessingDestroy(napi_env env, napi_callback_info info);
napi_value ImageProcessingSetParameterSuccess(napi_env env, napi_callback_info info);
napi_value ImageProcessingSetParameter(napi_env env, napi_callback_info info);
napi_value ImageProcessingGetParameterSuccess(napi_env env, napi_callback_info info);
napi_value ImageProcessingGetParameter(napi_env env, napi_callback_info info);
napi_value ImageProcessingConvertColorSpaceValue(napi_env env, napi_callback_info info);
napi_value ImageProcessingConvertColorSpace(napi_env env, napi_callback_info info);
napi_value ImageProcessingComposeValue(napi_env env, napi_callback_info info);
napi_value ImageProcessingCompose(napi_env env, napi_callback_info info);
napi_value ImageProcessingDecomposeValue(napi_env env, napi_callback_info info);
napi_value ImageProcessingDecompose(napi_env env, napi_callback_info info);
napi_value ImageProcessingGenerateMetadataValue(napi_env env, napi_callback_info info);
napi_value ImageProcessingGenerateMetadata(napi_env env, napi_callback_info info);
napi_value ImageProcessingEnhanceDetailValue(napi_env env, napi_callback_info info);
napi_value ImageProcessingEnhanceDetail(napi_env env, napi_callback_info info);
napi_value ImageProcessingCreateInstance(napi_env env, napi_callback_info info);
napi_value ImageProcessingDeinitializeEnvironment(napi_env env, napi_callback_info info);
napi_value PixelMapScaleWithAntiAliasingNone(napi_env env, napi_callback_info info);
napi_value PixelMapScaleWithAntiAliasingLow(napi_env env, napi_callback_info info);
napi_value PixelMapScaleWithAntiAliasingMedium(napi_env env, napi_callback_info info);
#endif // MULTIMEDIAIMAGEFRAMEWORKTEST_IMAGEFRAMEWORKTEST_H
