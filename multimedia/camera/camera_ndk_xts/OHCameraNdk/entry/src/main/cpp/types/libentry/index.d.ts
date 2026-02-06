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
//焦点坐标
interface Point {
  x: number;
  y: number;
}

interface cameraInfo {
  cameraId: string;//相机id。
  cameraPosition: number;//相机位置。
  cameraType: number;//相机类型。
  connectionType: number;//相机连接类型。
}
interface Capture_Setting {
  quality: number;
  rotation: number;
  mirror: boolean;
  latitude: number;
  longitude: number;
  altitude: number;
}

export const initCamera: (surfaceId: string,index:number) => number;
export const oHCameraManagerCreateVideoOutput: (videoId: string,index:number) => number;
export const oHCameraGetCameraManager: (index:number) => number;
export const oHCameraManagerRegisterCallback: (index:number) => number;
export const oHCameraDeleteCameraManager: (index:number) => number;
export const oHCameraManagerUnRegisterCallback: (index:number) => number;
export const oHCameraManagerCreatePreviewOutput: (index:number) => number;
export const oHCameraManagerCreateCameraInput: (index:number) => number;
export const oHCreateCameraInputWithPositionAndType: (position: number, type: number,index:number) => number;
export const oHCameraManagerCreateCaptureSession: (index:number) => number;
export const oHCameraManagerGetSupportedCameras: (index:number) => cameraInfo;
export const oHCameraManagerGetSupportedCameraInfos: (index:number) => Array<cameraInfo>;
export const oHCameraManagerDeleteSupportedCameras: (index:number) => number;
export const oHGetSupportedCameraOutputCapability: (index:number) => number;
export const oHCameraManagerDeleteSupportedCameraOutputCapability: (index:number) => number;
export const oHPreviewOutputRegisterCallback: (index:number) => number;
export const oHCameraManagerCreateMetadataOutput: (index:number) => number;
export const oHCameraManagerCreatePhotoOutput: (surfaceId: string,index:number) => number;
export const oHCameraInputOpen: (index:number) => number;
export const oHCameraInputClose: (index:number) => number;
export const oHCameraInputRelease: (index:number) => number;
export const oHCameraInputRegisterCallback: (index:number) => number;
export const oHCameraInputUnregisterCallback: (index:number) => number;
export const oHCameraInputRegisterOcclusionDetectionCallback: (index:number) => number;
export const oHCameraInputUnRegisterOcclusionDetectionCallback: (index:number) => number;
export const oHCaptureSessionBeginConfig: (index:number) => number;
export const oHCaptureSessionCommitConfig: (index:number) => number;
export const oHCaptureSessionStart: (index:number) => number;
export const oHCaptureSessionStop: (index:number) => number;
export const oHCaptureSessionRelease: (index:number) => number;
export const oHCaptureSessionRegisterCallback: (index:number) => number;
export const oHCaptureSessionUnregisterCallback: (index:number) => number;
export const oHCaptureSessionGetExposureBias: (index:number) => number;
export const oHCaptureSessionAddInput: (index:number) => number;
export const oHCaptureSessionRemoveInput: (index:number) => number;
export const oHCaptureSessionAddPreviewOutput: (index:number) => number;
export const oHCaptureSessionAddPhotoOutput: (index:number) => number;
export const oHCaptureSessionGetExposureBiasRange: (index:number) => number;
export const oHCameraManagerIsCameraMuted: (index:number) => number;
export const oHCaptureSessionGetExposureMode: (index:number) => number;
export const oHCaptureSessionIsExposureModeSupported: (a: number,index:number) => number;
export const oHCaptureSessionIsExposureModeSupportedForCheck: (a: number,index:number) => number;
export const oHCaptureSessionSetExposureBias: (a: number,index:number) => number;
export const oHCaptureSessionSetExposureMode: (a: number,index:number) => number;
export const oHCaptureSessionIsFlashModeSupported: (a: number,index:number) => number;
export const oHCaptureSessionIsFlashModeSupportedForCheck: (a: number,index:number) => number;
export const oHCaptureSessionSetFlashMode: (a: number,index:number) => number;
export const oHCaptureSessionIsFocusModeSupported: (a: number,index:number) => number;
export const oHCaptureSessionHasFlash: (index:number) => number;
export const oHCaptureSessionGetFlashMode: (index:number) => number;
export const oHCaptureSessionGetFocusMode: (index:number) => number;
export const oHCaptureSessionGetFocusPoint: (index:number) => number;
export const oHCaptureSessionGetMeteringPoint: (index:number) => number;
export const oHCaptureSessionSetFocusPoint: (point: Point,index:number) => number;
export const oHCaptureSessionSetMeteringPoint: (point: Point,index:number) => number;
export const oHCaptureSessionGetZoomRatio: (index:number) => number;
export const oHCaptureSessionGetZoomRatioRange: (index:number) => number;
export const oHCaptureSessionSetZoomRatio: (a: number,index:number) => number;
export const oHCaptureSessionIsVideoStabilizationModeSupported: (a: number,index:number) => number;
export const oHCaptureSessionIsVideoStabilizationModeSupportedForCheck: (a: number,index:number) => number;
export const oHCaptureSessionSetVideoStabilizationMode: (a: number,index:number) => number;
export const oHCaptureSessionGetVideoStabilizationMode: (index:number) => number;
export const oHCaptureSessionRemovePreviewOutput: (index:number) => number;
export const oHCaptureSessionRemovePhotoOutput: (index:number) => number;
export const oHCaptureSessionAddVideoOutput: (index:number) => number;
export const oHVideoOutputRegisterCallback: (index:number) => number;
export const oHVideoOutputUnregisterCallback: (index:number) => number;
export const oHVideoOutputStart: (index:number) => number;
export const oHVideoOutputStop: (index:number) => number;
export const oHCaptureSessionRemoveVideoOutput: (index:number) => number;
export const oHVideoOutputRelease: (index:number) => number;
export const oHPreviewOutputStart: (index:number) => number;
export const oHPreviewOutputStop: (index:number) => number;
export const oHPreviewOutputRelease: (index:number) => number;
export const oHPhotoOutputRegisterCallback: (index:number) => number;
export const oHPhotoOutputUnregisterCallback: (index:number) => number;
export const oHPhotoOutputIsMirrorSupported: (index:number) => number;
export const oHPhotoOutputEnableMirror: (index:number) => number;
export const oHPhotoOutputCapture: (index:number) => number;
export const oHPhotoOutputRelease: (index:number) => number;
export const oHPhotoOutputCaptureWithCaptureSetting: (setting: Capture_Setting,index:number) => number;
export const oHPhotoOutputRegisterCaptureReadyCallback: () => number;
export const oHPhotoOutputUnRegisterCaptureReadyCallback: () => number;
export const oHPhotoOutputgetMirrorSupported: (index:number) => boolean;