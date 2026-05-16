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

#ifndef CAMERA_NDK_XTS_SUPPLEMENT_CAMERASESSIONNDKTESTSUPPS_H
#define CAMERA_NDK_XTS_SUPPLEMENT_CAMERASESSIONNDKTESTSUPPS_H
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
napi_value initWithSurface(napi_env env, napi_callback_info info);
napi_value captureSessionStart(napi_env env, napi_callback_info info);
napi_value captureSessionIsVideoStabilizationModeSupported(napi_env env, napi_callback_info info);
napi_value captureSessionEnableControlCenter(napi_env env, napi_callback_info info);
napi_value captureSessionEnableAutoDeviceSwitch(napi_env env, napi_callback_info info);
napi_value captureSessionEnableMacro(napi_env env, napi_callback_info info);
napi_value captureSessionIsMacroSupported(napi_env env, napi_callback_info info);
napi_value captureSessionIsAutoDeviceSwitchSupported(napi_env env, napi_callback_info info);
napi_value captureSessionSetWhiteBalance(napi_env env, napi_callback_info info);
napi_value captureSessionGetWhiteBalanceRange(napi_env env, napi_callback_info info);
napi_value captureSessionAddPreviewOutput(napi_env env, napi_callback_info info);
napi_value captureSessionRemovePreviewOutput(napi_env env, napi_callback_info info);
napi_value captureSessionBeginConfig(napi_env env, napi_callback_info info);
napi_value captureSessionEnableMacroConfigAllow(napi_env env, napi_callback_info info);
napi_value captureSessionSetVideoStabilizationMode(napi_env env, napi_callback_info info);
napi_value captureSessionRelease(napi_env env, napi_callback_info info);
napi_value captureSessionEmu(napi_env env, napi_callback_info info);
napi_value OHCameraInputOpenConcurrentCameras(napi_env env, napi_callback_info info);
napi_value OHCameraInputOpenConcurrentCamerasErr(napi_env env, napi_callback_info info);
napi_value TestCreateDeferredPreviewOutputSucc(napi_env env, napi_callback_info info);
napi_value TestCreateDeferredPreviewOutputWithNullArgs(napi_env env, napi_callback_info info);
napi_value TestCreateDeferredPreviewOutputWithInvalidProfile(napi_env env, napi_callback_info info);
napi_value TestIsTorchLevelControlSupportedErr(napi_env env, napi_callback_info info);
napi_value TestIsTorchLevelControlSupportedSucc(napi_env env, napi_callback_info info);
napi_value TestSetTorchModeOnWithLevelErr(napi_env env, napi_callback_info info);
napi_value TestAddDeferredSurfaceSucc(napi_env env, napi_callback_info info);
napi_value TestAddDeferredSurfaceErr(napi_env env, napi_callback_info info);
napi_value TestAddDeferredSurfaceWithEmptyStr(napi_env env, napi_callback_info info);
napi_value TestGetPhysicalApertureSucc(napi_env env, napi_callback_info info);
napi_value TestGetPhysicalApertureWithNullSession(napi_env env, napi_callback_info info);
napi_value TestGetPhysicalApertureWithUnconfiguredSession(napi_env env, napi_callback_info info);
napi_value TestSetPhysicalApertureSucc(napi_env env, napi_callback_info info);
napi_value TestSetPhysicalApertureWithNullSession(napi_env env, napi_callback_info info);
napi_value TestSetPhysicalApertureWithUnconfiguredStream(napi_env env, napi_callback_info info);
napi_value TestGetSupportedExposureDurationRangeSucc(napi_env env, napi_callback_info info);
napi_value TestGetSupportedExposureDurationRangeWithNullSession(napi_env env, napi_callback_info info);
napi_value TestGetSupportedExposureDurationRangeWithUnconfiguredStream(napi_env env, napi_callback_info info);
napi_value TestSetExposureDurationSucc(napi_env env, napi_callback_info info);
napi_value TestSetExposureDurationWithInvalidValue(napi_env env, napi_callback_info info);
napi_value TestSetExposureDurationWithUnconfiguredStream(napi_env env, napi_callback_info info);
napi_value TestGetExposureDurationSucc(napi_env env, napi_callback_info info);
napi_value TestGetExposureDurationWithUnconfiguredStream(napi_env env, napi_callback_info info);
napi_value OHCaptureSessionDeleteSupportedEffectTypes(napi_env env, napi_callback_info info);
napi_value OHCaptureSessionGetSupportedEffectTypesSupp(napi_env env, napi_callback_info info);
napi_value captureSessionRegisterIsoChangeCallback(napi_env env, napi_callback_info info);
napi_value captureSessionUnregisterIsoChangeCallback(napi_env env, napi_callback_info info);
#ifdef __cplusplus
}
#endif
#endif
