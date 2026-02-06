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

export const RegisterCallbackInvalidParm: () => number;
export const UnregisterCallbackInvalidParm: () => number;
export const VideoOutputStart: (index: number, args: string) => number;
export const VideoOutputStopInvalidParm: () => number;
export const VideoOutputReleaseInvalidParm: () => number;
export const VideoOutputIsMirrorSupportedInvalidParm: () => number;
export const VideoOutputEnableMirrorInvalidParm: () => number;
export const VideoOutputGetVideoRotationInvalidParm: () => number;
export const PreviewOutputRegisterCallbackInvalidParm: () => number;
export const PreviewOutputUnregisterCallback: (index: number, args: string) => number;
export const PreviewOutputStart: (index: number, args: string) => number;
export const PreviewOutputStopInvalidParm: () => number;
export const PreviewOutputReleaseInvalidParm: () => number;
export const PreviewOutputGetPreviewRotationInvalidParm: () => number;
export const PreviewOutputSetPreviewRotationInvalidParm: () => number;

export const MetadataOutputRegisterCallback: (index: number) => number;
export const MetadataOutputUnregisterCallback: (index: number) => number;
export const MetadataOutputStart: (index: number) => number;
export const MetadataOutputStop: (index: number) => number;
export const MetadataOutputRelease: (index: number) => number;
export const PhotoNativeGetMainImage: (index: number) => number;
export const PhotoNativeRelease: () => number;
export const PhotoOutputRegisterCallback: (index: number, args: string) => number;
export const PhotoOutputUnregisterCallback: (index: number, args: string) => number;
export const PhotoOutputRegisterCaptureStartWithInfoCallback: (index: number, args: string) => number;
export const PhotoOutputUnregisterCaptureStartWithInfoCallback: () => number;
export const PhotoOutputRegisterCaptureEndCallback: () => number;
export const PhotoOutputUnregisterCaptureEndCallback: () => number;
export const PhotoOutputRegisterFrameShutterEndCallback: () => number;
export const PhotoOutputGetPhotoRotation: () => number;
export const PhotoOutputRegisterEstimatedCaptureDurationCallback: () => number;
export const PhotoOutputUnregisterEstimatedCaptureDurationCallback: () => number;
export const PhotoOutputRelease: () => number;
export const PhotoOutputIsMirrorSupported: () => number;
export const PhotoOutputEnableMirror: () => number;
export const CaptureSessionRegisterMacroStatusChangeCallback: (index: number) => number;
export const CaptureSessionUnregisterMacroStatusChangeCallback: (index: number) => number;

export const PhotoOutputRegisterPhotoAvailableCallback: () => number;
export const PhotoOutputUnregisterPhotoAvailableCallback: () => number;
export const PhotoOutputRegisterPhotoAssetAvailableCallback: () => number;
export const PhotoOutputUnregisterPhotoAssetAvailableCallback: () => number;
export const PreviewOutputGetActiveProfile: () => number;
export const PreviewOutputDeleteProfile: () => number;
export const VideoOutputGetActiveProfile: (index: number, args: string) => number;
export const VideoOutputGetSupportedFrameRates: (index: number, args: string) => number;
export const VideoOutputGetActiveFrameRate: (index: number, args: string) => number;

export const PhotoOutputCapture: (index: number, args: string) => number;
export const PhotoOutputCaptureWithCaptureSetting: (index: number, args: string) => number;
export const PhotoOutputGetActiveProfile: (index: number, args: string) => number;
export const PhotoOutputIsMovingPhotoSupported: (index: number, args: string) => number;
export const PhotoOutputEnableMovingPhoto: (index: number, args: string) => number;
export const PreviewOutputGetSupportedFrameRates: (index: number, args: string) => number;
export const PreviewOutputGetActiveFrameRate: (index: number, args: string) => number;
export const CaptureSessionRegisterAutoDeviceSwitchStatusCallback: () => number;
export const CaptureSessionUnregisterAutoDeviceSwitchStatusCallback: (index: number) => number;
export const CaptureSessionIsAutoDeviceSwitchSupported: (index: number) => number;
export const CaptureSessionEnableAutoDeviceSwitch: (index: number) => number;
export const CaptureSessionEnableAutoDeviceSwch: (index: number) => number;
export const CaptureSessionSetQualityPrioritization: (index: number) => number;
export const CaptureSessionIsMacroSupported: (index: number) => number;
export const CaptureSessionEnableMacro: (index: number) => number;
export const CaptureSessionIsWhiteBalanceModeSupported: (index: number, args: string) => number;
export const CaptureSessionGetWhiteBalanceMode: (index: number) => number;
export const CaptureSessionGetWhiteBalanceRange: (index: number) => number;
export const CaptureSessionGetWhiteBalance: (index: number) => number;
export const CaptureSessionSetWhiteBalance: (index: number) => number;
export const CaptureSessionSetWhiteBalanceMode: (index: number) => number;
export const CaptureSessionRegisterSystem: (index: number) => number;
export const CaptureSessionUnregisterSystem: (index: number) => number;
export const CaptureSessionIsControlCenterSupported: (index: number) => number;
export const CaptureSessionGetSupportedEffectTypes: (index: number) => number;
export const CaptureSessionDeleteSupportedEffectTypes: (index: number) => number;
export const CaptureSessionEnableControlCenter: (index: number) => number;
export const CaptureSessionRegisterControl: (index: number) => number;
export const CaptureSessionUnregisterControl: (index: number) => number;


