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
import { image } from "@kit.ImageKit";
import { Callback } from "@kit.BasicServicesKit";

interface cameraInfo {
  cameraPosition: number,
  cameraType: number,
  connectionType: number,
  cameraId: string
}

interface imageSize {
  width: number,
  height: number
}

interface imageClipRectSize {
  x: number,
  y: number,
  width: number,
  height: number
}

interface imageComponent {
  byteBuffer: Uint8Array,
  componentType: number,
  rowStride: number,
  pixelStride: number
}

export const initCamera: (a: number) => number;
export const getSupportedCameras: () => cameraInfo;
export const createCameraInput: () => number;
export const createCameraInputWithPositionAndType: () => number;
export const getSupportedOutputCapability: () => number;
export const createPreviewOutput: () => number;
export const createPhotoOutput: (a: number, b: number,c :number) => number;
export const createVideoOutput: () => number;
export const createMetadataOutput: () => number;
export const createSession: () => number;
export const isCameraMuted: () => number;
export const cameraInputOpen: () => number;
export const cameraInputClose: () => number;
export const cameraInputRelease: () => number;
export const previewOutputStart: () => number;
export const previewOutputRelease: () => number;
export const photoOutputCapture: () => number;
export const photoOutputRelease: () => number;
export const isMirrorSupported: () => number;
export const videoOutputStart: () => number;
export const videoOutputStop: () => number;
export const videoOutputRelease: () => number;
export const metadataOutputStart: () => number;
export const metadataOutputStop: () => number;
export const metadataOutputRelease: () => number;
export const previewOutputStop: () => number;
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
export const sessionStart: () => number;
export const sessionStop: () => number;
export const sessionBegin: () => number;
export const sessionCommitConfig: () => number;
export const sessionRelease: () => number;
export const sessionHasFlash: () => number;
export const sessionIsFlashModeSupported: () => number;
export const sessionGetFlashMode: () => number;
export const sessionSetFlashMode: () => number;
export const sessionIsExposureModeSupported: () => number;
export const sessionGetExposureMode: () => number;
export const sessionSetExposureMode: () => number;
export const sessionGetMeteringPoint: () => number;
export const sessionSetMeteringPoint: () => number;
export const sessionGetExposureBiasRange: () => number;
export const sessionSetExposureBias: () => number;
export const sessionGetExposureBias: () => number;
export const sessionIsFocusModeSupported: () => number;
export const sessionGetFocusMode: () => number;
export const sessionSetFocusMode: () => number;
export const sessionSetFocusPoint: () => number;
export const sessionGetFocusPoint: () => number;
export const sessionGetZoomRatioRange: () => number;
export const sessionGetZoomRatio: () => number;
export const sessionSetZoomRatio: () => number;
export const sessionIsVideoStabilizationModeSupported: () => number;
export const sessionGetVideoStabilizationMode: () => number;
export const sessionSetVideoStabilizationMode: () => number;
export const getCameraCallbackCode: () => number;
export const takePictureWithSettings: () => number;
export const createImageReceiver: (...params: ESObject[]) => image.ImageReceiver
export const getReceivingSurfaceId: (a: image.ImageReceiver) => string
export const readLatestImage: (a: image.ImageReceiver) => image.Image
export const readNextImage: (a: image.ImageReceiver) => image.Image
export const on: (a: image.ImageReceiver) => number
export const getSize: (a: image.ImageReceiver) => imageSize
export const getCapacity: (a: image.ImageReceiver) => number
export const getFormat: (a: image.ImageReceiver) => number
export const getOnEventCount: (a: image.ImageReceiver) => number
export const imageClipRect: (a: image.Image) => imageClipRectSize
export const imageSize: (a: image.Image) => imageSize
export const imageFormat: (a: image.Image) => number
export const imageGetComponent: (a: image.Image, b: image.ComponentType.JPEG) => imageComponent
export const receiverRelease: (a: image.ImageReceiver) => number
export const imageRelease: (a: image.Image) => number
export const JsCreateImageReceiverOptions: (a: number, b: number, c:number) => number
export const JsImageReceiverOptionsGetSize: (a: number) => imageSize
export const JsImageReceiverOptionsSetSize: (a: number, b: number | string, c:number | string) => number
export const JsImageReceiverOptionsGetCapacity: (a: number) => number
export const JsImageReceiverOptionsSetCapacity: (a: number, b: number | boolean) => number
export const JsReleaseImageReceiverOptions: (a: number) => number
export const JsCreateImageReceiver: (a: number) => image.ImageReceiver
export const JsGetReceivingSurfaceId: (a: image.ImageReceiver) => string;
export const JsReadLatestImage: (a: image.ImageReceiver) => image.Image
export const JsReadNextImage: (a: image.ImageReceiver) => image.Image
export const JsOn: (a: image.ImageReceiver, b: Callback<image.ImageReceiver>) => number
export const JsOff: (a: image.ImageReceiver) => number
export const JsGetSize: (a: image.ImageReceiver) => imageSize
export const JsGetCapacity: (a: image.ImageReceiver) => number
export const JsReleaseImageReceiver: (a: image.ImageReceiver) => number
export const JsGetImageSize: (a: image.Image) => imageSize
export const JsGetImageComponentTypes: (a: image.Image) => number[]
export const JsGetImageByteBuffer: (a: image.Image, b: number[]) => number
export const JsGetImageBufferSize: (a: image.Image, b: number[]) => number
export const JsGetImageRowStride: (a: image.Image, b: number[]) => number
export const JsGetImagePixelStride: (a: image.Image, b: number[]) => number
export const JsReleaseImage: (a: image.Image) => number