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

#ifndef CAMERA_NDK_XTS_SUPPLEMENT_CAMERASESSIONNDKSUPPTEST_H
#define CAMERA_NDK_XTS_SUPPLEMENT_CAMERASESSIONNDKSUPPTEST_H
#include "hilog/log.h"
#include "ohcamera/camera.h"
#include "ohcamera/camera_input.h"
#include "ohcamera/capture_session.h"
#include "ohcamera/photo_output.h"
#include "ohcamera/preview_output.h"
#include "ohcamera/video_output.h"
#include "ohcamera/camera_manager.h"

#ifdef __cplusplus
extern "C" {
#endif
napi_value initWithSurfaces(napi_env env, napi_callback_info info);
napi_value captureDeleteCameraDevices(napi_env env, napi_callback_info info);
napi_value captureIsBandwidthCompressionSupported(napi_env env, napi_callback_info info);
napi_value captureEnableBandwidthCompression(napi_env env, napi_callback_info info);
napi_value captureGetSupportedFullCameraOutputCapabilityWithSceneMode(napi_env env, napi_callback_info info);
napi_value captureRegisterOcclusionDetectionCallback(napi_env env, napi_callback_info info);
napi_value captureUnregisterOcclusionDetectionCallback(napi_env env, napi_callback_info info);
napi_value captureCameraPreconfigType(napi_env env, napi_callback_info info);
napi_value captureGetCameraDevices(napi_env env, napi_callback_info info);
napi_value captureGetCameraDevicesError(napi_env env, napi_callback_info info);
napi_value captureCameraDeviceQueryInfoCameraType(napi_env env, napi_callback_info info);
napi_value captureSessionIsBandwidthCompressionSupportedTest(napi_env env, napi_callback_info info);
napi_value captureCameraDeviceQueryInfoConnectionTypes(napi_env env, napi_callback_info info);
napi_value captureCameraDeviceQueryInfoConnectionType(napi_env env, napi_callback_info info);
napi_value captureCameraDeviceQueryInfoCameraPositions(napi_env env, napi_callback_info info);
napi_value captureCameraDeviceQueryInfoCameraTypeSize(napi_env env, napi_callback_info info);
napi_value captureCameraDeviceQueryInfoCameraTypeSizes(napi_env env, napi_callback_info info);
napi_value captureCameraDeviceQueryInfo(napi_env env, napi_callback_info info);
napi_value captureEnableBandwidthCompressionError(napi_env env, napi_callback_info info);
napi_value captureIsGetCameraDevices(napi_env env, napi_callback_info info);
napi_value getPreviewRotationWithoutDisplayRotation(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif