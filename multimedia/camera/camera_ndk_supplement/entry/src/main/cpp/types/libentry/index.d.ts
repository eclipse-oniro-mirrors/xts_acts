/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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


export const initCamera: (surfaceId: string) => number;
export const cameraManagerGetSupportedCameras: () => number;
export const releaseCameraManger: () => number;
export const cameraErrorCode: (code: string) => number;
export const cameraStatusInfo: (code: string) => number;
export const cameraFormat: (format: number) => number;
export const cameraFlashMode: (format: number) => number;
export const getExposureMode: (format: number) => number;
export const getCameraFocusMode: (format: number) => number;
export const getCameraFocusState: (format: number) => number;
export const sessionIsVideoStabilizationModeSupported: (format: number) => number;
export const takePictureWithPhotoSettings: (ratation: number, qualitylevel: number) => number;
export const getCameraConcurrentInfo: (type: number) => number;
export const sessionCanPreconfig: (type: number) => number;
export const sessionCanPreconfigWithRatio: (ratio: number) => number;
export const photoOutputRegisterCallback: () => number;
export const metadataOutputRegisterCallback: () => number;
export const cameraManagerRegisterTorchStatusCallback: () => number;
export const captureSessionRegisterSmoothZoomInfoCallback: () => number;
export const photoOutputRegisterCaptureStartWithInfoCallback: () => number;
export const cameraManagerRegisterFoldStatusCallback: () => number;
export const registerAutoDeviceSwitchStatusCallback: () => number;
export const sessionSetQualityPrioritization: (quality: number) => number;
export const cameraOpenConcurrentCameras: (type: number) => number;
export const isWhiteBalanceSupported: (type: number) => number;
export const registerSystemPressureLevel: () => number;
export const sessionGetSupportedEffectTypes: (type: number) => number;
export const OHCameraFunctionHandle: (fun: string, caseCode: number) => number;
export const registerControlCenterEffectStatusChange: () => number;
