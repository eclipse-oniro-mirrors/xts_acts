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

export const initCamera: (surfaceId: string) => number;

export const getSupportedCameras: () => cameraInfo;

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