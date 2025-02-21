/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

interface Point {
  x: number;
  y: number;
}

interface exposureBias {
  minExposureBias: number;
  maxExposureBias: number;
}

interface zoomRatio {
  minZoom: number;
  maxZoom: number;
}

interface cameraInfo {
  cameraId: string;
  cameraPosition: number;
  cameraType: number;
  connectionType: number;
}

interface cameraOutputCapability {
  previewProfilesSize: number;
  photoProfilesSize: number;
  videoProfilesSize: number;
  metadataProfilesSize: number;
}

interface Capture_Setting {
  quality: number;
  rotation: number;
  mirror: boolean;
  latitude: number;
  longitude: number;
  altitude: number;
}

interface canPreconfig {
  errorCode: number;
  canPreconfig: boolean;
}

interface supportedSceneModes {
  errorCode:number;
  sceneModesSize: number;
  isNormalPhoto: boolean;
  isNormalVideo: boolean;
  isSecurePhoto: boolean;
}

interface canAddInput {
  errorCode:number;
  isAddInput:boolean;
}

interface canAddPreviewOutput {
  errorCode:number;
  isAddPreviewOutput:boolean;
}

interface canAddPhotoOutput {
  errorCode:number;
  isAddPhotoOutput:boolean;
}

interface canAddVideoOutput {
  errorCode:number;
  isAddVideoOutput:boolean;
}

interface secureCamera {
  errorCode: number;
  secureSeqId: BigInt;
}

interface movingPhoto {
  errorCode: number;
  isMovingPhotoSupported: boolean;
}

interface isTorchSupported {
  errorCode: number;
  isTorchSupported: boolean;
}

interface isTorchSupportedByTorchMode {
  errorCode: number;
  isTorchSupportedByTorchMode: boolean;
}

interface frameRatesSize {
  errorCode: number;
  frameRatesSize: number;
}

interface videoFrameRatesSize {
  errorCode: number;
  videoFrameRatesSize: number;
}

interface FrameRateRange {
  errorCode: number;
  min: number;
  max: number;
}

interface colorSpacesSize {
  errorCode: number;
  colorSpacesSize: number;
}

interface activeColorSpace {
  errorCode: number;
  activeColorSpace: number;
}

interface colorSpace {
  colorSpaceSupportSize: number;
  setcolorSpace: number;
  colorSpacesSize: number;
}

interface autoDeviceSwitchSupportInfo {
  errorCode: number;
  isSupported: boolean;
}

export const initCamera: (surfaceId: string) => number;

export const getSupportedCameras: () => cameraInfo;

export const getCameraOrientation: () => number;

export const createCameraInput: () => number;

export const createCameraInputWithPositionAndType: (position: number, type: number) => number;

export const getSupportedOutputCapability: () => cameraOutputCapability;

export const createPreviewOutput: () => number;

export const createPhotoOutput: (surfaceId: string) => number;

export const createVideoOutput: (surfaceId: string) => number;

export const createMetadataOutput: () => number;

export const createSession: () => number;

export const isCameraMuted: () => number;

export const cameraInputOpen: () => number;

export const cameraInputClose: () => number;

export const cameraInputRelease: () => number;

export const previewOutputStart: () => number;

export const previewOutputStop: () => number;

export const previewOutputRelease: () => number;

export const photoOutputCapture: () => number;

export const takePictureWithSettings: (setting: Capture_Setting) => number;

export const isMirrorSupported: () => boolean;

export const photoOutputRelease: () => number;

export const videoOutputStart: () => number;

export const videoOutputStop: () => number;

export const videoOutputRelease: () => number;

export const metadataOutputStart: () => number;

export const metadataOutputStop: () => number;

export const metadataOutputRelease: () => number;

export const sessionBegin: () => number;

export const sessionCommitConfig: () => number;

export const sessionStop: () => number;

export const sessionStart: () => number;

export const sessionAddInput: () => number;

export const sessionRemoveInput: () => number;

export const sessionAddPreviewOutput: () => number;

export const sessionAddPhotoOutput: () => number;

export const sessionAddVideoOutput: () => number;

export const sessionAddMetadataOutput: () => number;

export const sessionRemovePreviewOutput: () => number;

export const sessionRemovePhotoOutput: () => number;

export const sessionRemoveVideoOutput: () => number;

export const sessionRemoveMetadataOutput: () => number;

export const sessionRelease: () => number;

export const sessionHasFlash: () => boolean;

export const sessionIsFlashModeSupported: (a: number) => boolean;

export const sessionGetFlashMode: () => number; // return flashmode

export const sessionSetFlashMode: (a: number) => number;

export const sessionIsExposureModeSupported: (a: number) => boolean;

export const sessionGetExposureMode: () => number; // return exposureMode

export const sessionSetExposureMode: (a: number) => number;

export const sessionGetMeteringPoint: () => Point; // return meteringPoint

export const sessionSetMeteringPoint: (point: Point) => number;

export const sessionGetExposureBiasRange: () => exposureBias // return exposureBiasRange

export const sessionSetExposureBias: (a: number) => number;

export const sessionGetExposureBias: () => number; // return exposureBias

export const sessionIsFocusModeSupported: (a: number) => boolean;

export const sessionGetPhotoRotation: (a: number) => number;

export const sessionGetVideoRotation: (a: number) => number;

export const sessionGetPreviewRotation: (a: number) => number;

export const sessionSetPreviewRotation: (a: number, b: boolean) => number;

export const sessionGetFocusMode: () => number;

export const sessionSetFocusMode: (a: number) => number;

export const sessionSetFocusPoint: (point: Point) => number;

export const sessionGetFocusPoint: () => Point;

export const sessionGetZoomRatioRange: () => zoomRatio // return ZoomRatioRange

export const sessionGetZoomRatio: () => number; // return current ZoomRatio

export const sessionSetZoomRatio: (a: number) => number;

export const sessionIsVideoStabilizationModeSupported: (a: number) => boolean;

export const sessionGetVideoStabilizationMode: () => number; // return VideoStabilizationMode

export const sessionSetVideoStabilizationMode: (a: number) => number;

export const getCameraCallbackCode: () => number;

export const readyCreatePhotoOutputWithoutSurface: () => number;

export const oHCaptureSessionRegisterCallback: (index:number) => number;

export const oHCaptureSessionUnregisterCallback: (index:number) => number;

export const oHCameraManagerGetSupportedSceneModes: (index:number) => supportedSceneModes;

export const oHCameraManagerDeleteSceneModes: (index:number) => number;

export const oHCameraManagerGetSupportedCameraOutputCapabilityWithSceneMode: (index:number) => number;

export const oHCaptureSessionSetSessionMode: (index:number) => number;

export const oHCaptureSessionCanAddInput: (index:number) => canAddInput;

export const oHCaptureSessionCanAddPreviewOutput: (index:number) => canAddPreviewOutput;

export const oHCaptureSessionCanAddPhotoOutput: (index:number) => canAddPhotoOutput;

export const oHCaptureSessionCanAddVideoOutput: (index:number) => canAddVideoOutput;

export const oHCaptureSessionAddSecureOutput: (index:number) => number;

export const oHCameraInputOpenSecureCamera: (index:number) => secureCamera;

export const oHCameraManagerSetSceneMode: (index:number) => number;

export const oHCameraManagerGetSupportedCameraInfos: (index:number) => Array<cameraInfo>;

export const oHCaptureSessionRegisterCallbackOn: (index:number) => number;

export const oHCaptureSessionUnregisterCallbackOff: (index:number) => number;

export const oHCameraManagerCreateVideoOutputUsedInPreconfig: (videoId: string,index:number) => number;

export const oHCameraManagerCreatePreviewOutputUsedInPreconfig: (index:number) => number;

export const oHCameraManagerCreatePhotoOutputUsedInPreconfig: (surfaceId: string,index:number) => number;

export const oHCaptureSessionCanPreconfig: (a: number,index:number) => canPreconfig;

export const oHCaptureSessionCanPreconfigWithRatio: (a: number,b: number,index:number) => canPreconfig;

export const oHCaptureSessionPreconfig: (a: number,index:number) => number;

export const oHCaptureSessionPreconfigWithRatio: (a: number,b: number,index:number) => number;

export const oHVideoOutputGetActiveProfile: (index:number) => number;

export const oHVideoOutputDeleteProfile: (index:number) => number;

export const oHPreviewOutputGetActiveProfile: (index:number) => number;

export const oHPreviewOutputDeleteProfile: (index:number) => number;

export const oHPhotoOutputGetActiveProfile: (index:number) => number;

export const oHPhotoOutputDeleteProfile: (index:number) => number;

export const oHPhotoOutputRegisterPhotoAvailableCallback: (index:number) => number;

export const oHPhotoOutputUnregisterPhotoAvailableCallback: (index:number) => number;

export const oHPhotoOutputRegisterPhotoAssetAvailableCallback: (index:number) => number;

export const oHPhotoOutputUnregisterPhotoAssetAvailableCallback: (index:number) => number;

export const oHPhotoOutputIsMovingPhotoSupported: (index:number) => movingPhoto;

export const oHPhotoOutputEnableMovingPhoto: (index:number, enable:boolean) => number;

export const oHPhotoNativeGetMainImage: (index:number) => number;

export const oHPhotoNativeRelease: (index:number) => number;

export const oHCameraManagerCreatePhotoOutputWithoutSurface: (index:number) => number;

export const releaseCamera: () => number;

export const oHCameraManagerTorchMode: (index:number) => number;

export const oHCameraManagerIsTorchSupported: (index:number) => isTorchSupported;

export const oHCameraManagerIsTorchSupportedByTorchMode: (index:number) => isTorchSupportedByTorchMode;

export const oHCameraManagerSetTorchMode: (index:number) => number;

export const oHCaptureSessionGetExposureValue: (index:number) => number;

export const oHCaptureSessionGetFocalLength: (index:number) => number;

export const oHCaptureSessionSetSmoothZoom: (index:number) => number;

export const oHCaptureSessionGetSupportedColorSpaces: (index:number) => colorSpacesSize;

export const oHCaptureSessionDeleteColorSpaces: (index:number) => number;

export const oHCaptureSessionGetActiveColorSpace: (index:number) => activeColorSpace;

export const oHNativeBufferColorSpace: () => colorSpace;

export const oHCaptureSessionSetActiveColorSpace: (index:number) => number;

export const oHPreviewOutputGetSupportedFrameRates: (index:number) => frameRatesSize;

export const oHPreviewOutputSetFrameRate: (index:number) => number;

export const oHPreviewOutputGetActiveFrameRate: (index:number) => FrameRateRange;

export const oHPreviewOutputDeleteFrameRates: (index:number) => number;

export const oHVideoOutputGetSupportedFrameRates: (index:number) => videoFrameRatesSize;

export const oHVideoOutputSetFrameRate: (index:number) => number;

export const oHVideoOutputGetActiveFrameRate: (index:number) => FrameRateRange;

export const oHVideoOutputDeleteFrameRates: (index:number) => number;

export const oHCameraManagerRegisterTorchStatusCallback: (index:number) => number;

export const oHCameraManagerUnregisterTorchStatusCallback: (index:number) => number;

export const oHCaptureSessionRegisterSmoothZoomInfoCallback: (index:number) => number;

export const oHCaptureSessionUnregisterSmoothZoomInfoCallback: (index:number) => number;

export const oHPhotoOutputRegisterCaptureStartWithInfoCallback: (index:number) => number;

export const oHPhotoOutputUnregisterCaptureStartWithInfoCallback: (index:number) => number;

export const oHPhotoOutputRegisterCaptureEndCallback: (index:number) => number;

export const oHPhotoOutputUnregisterCaptureEndCallback: (index:number) => number;

export const oHPhotoOutputRegisterFrameShutterEndCallback: (index:number) => number;

export const oHPhotoOutputUnregisterFrameShutterEndCallback: (index:number) => number;

export const oHPhotoOutputRegisterCaptureReadyCallback: (index:number) => number;

export const oHPhotoOutputUnregisterCaptureReadyCallback: (index:number) => number;

export const oHPhotoOutputRegisterEstimatedCaptureDurationCallback: (index:number) => number;

export const oHPhotoOutputUnregisterEstimatedCaptureDurationCallback: (index:number) => number;
 
export const sessionIsAutoDeviceSwitchSupported: () => autoDeviceSwitchSupportInfo;
 
export const sessionEnableAutoDeviceSwitch: (enable:boolean) => number;
 
export const sessionRegisterAutoDeviceSwitchStatusChange: (index:number) => number;
 
export const sessionUnregisterAutoDeviceSwitchStatusChange: (index:number) => number;
 
export const cameraManagerRegisterFoldStatusChange: (index:number) => number;
 
export const cameraManagerUnregisterFoldStatusChange: (index:number) => number;

export const sessionSetQualityPrioritization: (index:number) => number;