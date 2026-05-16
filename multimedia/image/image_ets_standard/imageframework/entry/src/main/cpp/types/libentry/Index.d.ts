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

import { image } from '@kit.ImageKit';
import { Callback } from '@kit.BasicServicesKit';

interface pixelMapPots {
  width: number,
  height: number,
  pixelFormat: number,
  editable: number,
  alphaType: number,
  scaleMode: number
}

interface imagePacker {
  code: number;
  result: image.ImagePacker;
}

interface packConfig_options {
  delayTimes: number[];
  disposalTypes: number[];
}

interface PackingOption_format {
  format: string;
}

interface PackingOption_quality {
  quality: number;
}

interface imageClipRectSize {
  x: number,
  y: number,
  width: number,
  height: number
}

interface imageSize {
  width: number,
  height: number
}

export const ImagePackerCreate1: () => number;

export const ImagePackerRelease: () => number;

export const PictureMetadataCreate1: () => number;

export const PictureMetadataCreate2: () => number;

export const PictureMetadataGetProperty1: () => number;

export const PictureMetadataSetProperty1: () => number;

export const PictureMetadataRelease1: () => number;

export const PictureMetadataRelease2: () => number;

export const PictureMetadataClone1: () => number;

export const CreatePixelMapWithStride: () => number;

export const CreateAlphaPixelMap: () => number;

export const GetBytesNumberPerRow: () => number;

export const GetIsEditable: () => number;

export const IsSupportAlpha: () => number;

export const SetAlphaAble: () => number;

export const GetDensity: () => number;

export const SetDensity: () => number;

export const SetOpacity: () => number;

export const PixelMapScale: () => number;

export const ScaleWithAntiAliasing: () => number;

export const PixelMapTranslate: () => number;

export const PixelMapRotate: () => number;

export const PixelMapFlip: () => number;

export const PixelMapCrop: () => number;

export const PixelMapGetImageInfo: () => number;

export const PixelMapAccessPixels: () => number;

export const PixelMapUnAccessPixels: () => number;

export const UnAccessPixels: () => number;

export const GetImageInfoParameter: () => number;

export const CreateImageReceiver: () => number;

export const GetReceivingSurfaceId: () => number;

export const ReadLatestImage: () => number;

export const ReadNextImage: () => number;

export const ReceiverOn: () => number;

export const ReceiverGetSize: () => number;

export const ReceiverGetCapacity: () => number;

export const ReceiverGetFormat: () => number;

export const ReceiverRelease: () => number;

export const ImageSourceCreate: () => number;

export const ImageSourceCreateFromUri: () => number;

export const ImageSourceCreateFromFd: () => number;

export const ImageSourceCreateFromData: () => number;

export const ImageSourceCreateFromRawFile: () => number;

export const ImageSourceCreateIncremental: () => number;

export const ImageSourceCreateIncrementalFromData: () => number;

export const ImageSourceGetSupportedFormats: () => number;

export const ImageSourceCreatePixelMap: () => number;

export const ImageSourceCreatePixelMapList: () => number;

export const ImageSource_GetDelayTime: () => number;

export const ImageSourceGetFrameCount: () => number;

export const ImageSourceGetImageInfo: () => number;

export const ImageSourceGetImageProperty: () => number;

export const ImageSourceModifyImageProperty: () => number;

export const ImageSourceUpdateData: () => number;

export const PictureNativeCreatePicture: () => number;

export const ImageSourceRelease: () => number;

export const PictureNativeGetMainPixelmap: () => number;

export const PictureNativeGetHdrComposedPixelmap: () => number;

export const PictureNativeGetGainmapPixelmap: () => number;

export const PictureNativeSetAuxiliaryPicture: () => number;

export const PictureNativeGetMetadata: () => number;

export const PictureNativeSetMetadata: () => number;

export const PictureNativeRelease: () => number;

export const AuxiliaryPictureNativeCreate: () => number;

export const AuxiliaryPictureNativeWritePixels: () => number;

export const AuxiliaryPictureNativeReadPixels: () => number;

export const AuxiliaryPictureNativeGetType: () => number;

export const AuxiliaryPictureNativeGetInfo: () => number;

export const AuxiliaryPictureNativeSetInfo: () => number;

export const AuxiliaryPictureNativeGetMetadata: () => number;

export const AuxiliaryPictureNativeSetMetadata: () => number;

export const AuxiliaryPictureNativeRelease: () => number;

export const AuxiliaryPictureInfoCreate: () => number;

export const AuxiliaryPictureInfoGetType: () => number;

export const AuxiliaryPictureInfoSetType: () => number;

export const AuxiliaryPictureInfoGetSize: () => number;

export const AuxiliaryPictureInfoSetSize: () => number;

export const AuxiliaryPictureInfoGetRowStride: () => number;

export const AuxiliaryPictureInfoSetRowStride: () => number;

export const AuxiliaryPictureInfoGetPixelFormat: () => number;

export const AuxiliaryPictureInfoSetPixelFormat: () => number;

export const AuxiliaryPictureInfoRelease: () => number;

export const AuxiliaryPictureInfoSetTypeSuccess: () => number;

export const AuxiliaryPictureInfoCreateSuccess: () => number;

export const AuxiliaryPictureNativeCreateSuccess: () => number;

export const AuxiliaryPictureInfoGetSizeSucces: () => number;

export const AuxiliaryPictureInfoSetSizeSuccess: () => number;

export const AuxiliaryPictureInfoGetRowStrideSuccess: () => number;

export const AuxiliaryPictureInfoSetRowStrideSuccess: () => number;

export const AuxiliaryPictureInfoGetPixelFormatSuccess: () => number;

export const AuxiliaryPictureInfoSetPixelFormatSuccess: () => number;

export const AuxiliaryPictureInfoReleaseSuccess: () => number;

export const AuxiliaryPictureInfoGetTypeSucess: () => number;

export const AuxiliaryPictureNativeReleaseSuccess: () => number;

export const PixelmapInitializationOptionsCreate: () => number;

export const PixelmapInitializationOptionsGetWidthSuccess: () => number;

export const PixelmapInitializationOptionsGetWidth: () => number;

export const PixelmapInitializationOptionsSetWidth: () => number;

export const PixelmapInitializationOptionsGetHeight: () => number;

export const PixelmapInitializationOptionsSetHeight: () => number;

export const PixelmapInitializationOptionsSetWidthSuccess: () => number;

export const PixelmapInitializationOptionsGetHeightSuccess: () => number;

export const PixelmapInitializationOptionsSetHeightSuccess: () => number;

export const PixelmapInitializationOptionsCreateSuccess: () => number;

export const PixelmapInitializationOptionsGetPixelFormat: () => number;

export const PixelmapInitializationOptionsSetPixelFormat: () => number;

export const PixelmapInitializationOptionsGetSrcPixelFormat: () => number;

export const PixelmapInitializationOptionsSetSrcPixelFormat: () => number;

export const PixelmapInitializationOptionsGetPixelFormatSuccess: () => number;

export const PixelmapInitializationOptionsSetPixelFormatSuccess: () => number;

export const PixelmapInitializationOptionsGetSrcPixelFormatSuccess: () => number;

export const PixelmapInitializationOptionsSetSrcPixelFormatSuccess: () => number;

export const PixelmapInitializationOptionsGetRowStrideSuccess: () => number;

export const PixelmapInitializationOptionsGetRowStride: () => number;

export const PixelmapInitializationOptionsSetRowStride: () => number;

export const PixelmapInitializationOptionsGetAlphaType: () => number;

export const PixelmapInitializationOptionsSetAlphaType: () => number;

export const PixelmapInitializationOptionsGetEditable: () => number;

export const PixelmapInitializationOptionsSetEditable: () => number;

export const PixelmapInitializationOptionsRelease: () => number;

export const PixelmapImageInfoCreate: () => number;

export const PixelmapImageInfoGetWidth: () => number;

export const PixelmapImageInfoGetHeight: () => number;

export const PixelmapInitializationOptionsSetRowStrideSuccess: () => number;

export const PixelmapInitializationOptionsGetAlphaTypeSuccess: () => number;

export const PixelmapInitializationOptionsSetAlphaTypeSuccess: () => number;

export const PixelmapInitializationOptionsGetEditableSuccess: () => number;

export const PixelmapInitializationOptionsSetEditableSuccess: () => number;

export const PixelmapInitializationOptionsReleaseSuccess: () => number;

export const PixelmapImageInfoCreateSuccess: () => number;

export const PixelmapImageInfoGetWidthSuccess: () => number;

export const PixelmapImageInfoGetHeightSuccess: () => number;

export const PixelmapImageInfoGetAlphaModeSuccess: () => number;

export const PixelmapImageInfoGetAlphaMode: () => number;

export const PixelmapImageInfoGetRowStrideSuccess: () => number;

export const PixelmapImageInfoGetRowStride: () => number;

export const PixelmapImageInfoGetPixelFormatSuccess: () => number;

export const PixelmapImageInfoGetPixelFormat: () => number;

export const PixelmapImageInfoGetAlphaTypeSuccess: () => number;

export const PixelmapImageInfoGetAlphaType: () => number;

export const PixelmapImageInfoGetDynamicRangeSuccess: () => number;

export const PixelmapImageInfoGetDynamicRange: () => number;

export const PixelmapImageInfoReleaseSuccess: () => number;

export const PixelmapImageInfoRelease: () => number;

export const PixelmapNativeCreatePixelmapSuccess: () => number;

export const PixelmapNativeCreatePixelmap: () => number;

export const CreatePixelmapUsingAllocator: () => number;

export const ConvertPixelmapNativeToNapi: () => number;

export const ConvertPixelmapNativeToNapiSuccess: () => number;

export const ConvertPixelmapNativeFromNapi: () => number;

export const PixelmapNativeReadPixels: () => number;

export const PixelmapNativeWritePixels: () => number;

export const PixelmapNativeGetArgbPixelsSuccess: () => number;

export const PixelmapNativeGetArgbPixels: () => number;

export const PixelmapNativeToSdr: () => number;

export const PixelmapNativeGetImageInfo: () => number;

export const PixelmapNativeOpacitySuccess: () => number;

export const PixelmapNativeOpacity: () => number;

export const packToData: (a: image.ImagePacker, b: image.ImageSource | image.PixelMap,
  c: image.PackingOption | PackingOption_format | PackingOption_quality) => number;

export const create: () => imagePacker;

export const packToFile: (a: image.ImagePacker, b: image.ImageSource | image.PixelMap, c: number,
  d: image.PackingOption | PackingOption_format | PackingOption_quality) => number;

export const release: (a: image.ImagePacker) => number;

export const JsCreateImageReceiver: (a: number) => image.ImageReceiver;

export const JsCreateImageReceiverOptions: (a: number, b: number, c: number) => number;

export const PixelmapNativeScaleSuccess: () => number;

export const PixelmapNativeScale: () => number;

export const PixelmapNativeScaleWithAntiAliasing: () => number;

export const CreateScaledPixelMap: () => number;

// export const TranslateSuccess: () => number;
export const Translate: () => number;

export const PixelmapNativeRotateSuccess: () => number;

export const PixelmapNativeRotate: () => number;

export const PixelmapNativeFlipSuccess: () => number;

export const PixelmapNativeFlip: () => number;

// export const PixelmapNativeCropSuccess: () => number;
export const PixelmapNativeCrop: () => number;

export const PixelmapNativeReleaseSuccess: () => number;

export const PixelmapNativeRelease: () => number;

export const CreateScaledPixelMapWithAntiAliasing: () => number;

export const PixelmapNativeDestroySuccess: () => number;

export const PixelmapNativeDestroy: () => number;

export const PixelmapNativeConvertAlphaFormat: () => number;

export const PixelmapNativeCreateEmptyPixelmapSuccess: () => number;

export const PixelmapNativeCreateEmptyPixelmap: () => number;

export const PixelmapNativeCreateEmptyPixelmapUsingAllocator: () => number;

export const PixelmapNativeGetMetadata: () => number;

export const PixelmapNativeSetMetadata: () => number;

export const PixelmapNativeGetNativeBuffer: () => number;

export const PixelmapNativeGetColorSpaceNative: () => number;

export const PixelmapNativeSetColorSpaceNative: () => number;

export const PixelmapNativeSetMemoryName: () => number;

export const PixelmapNativeGetByteCountSuccess: () => number;

export const PixelmapNativeGetByteCount: () => number;

export const PixelmapNativeGetAllocationByteCountSuccess: () => number;

export const PixelmapNativeGetAllocationByteCount: () => number;

export const PixelmapNativeAccessPixelsSuccess: () => number;

export const PixelmapNativeAccessPixels: () => number;

export const PixelmapNativeUnaccessPixelsSuccess: () => number;

export const PixelmapNativeUnaccessPixels: () => number;

export const ImageProcessingCreateSuccess: () => number;

export const ImageProcessingDestroySuccess: () => number;

export const ImageProcessingDestroy: () => number;

export const ImageProcessingSetParameterSuccess: () => number;

export const ImageProcessingSetParameter: () => number;

export const ImageProcessingGetParameterSuccess: () => number;

export const ImageProcessingGetParameter: () => number;

export const ImageProcessingConvertColorSpaceValue: () => number;

export const ImageProcessingConvertColorSpace: () => number;

export const ImageProcessingComposeValue: () => number;

export const ImageProcessingCompose: () => number;

export const ImageProcessingDecomposeValue: () => number;

export const ImageProcessingDecompose: () => number;

export const ImageProcessingGenerateMetadataValue: () => number;

export const ImageProcessingGenerateMetadata: () => number;

export const ImageProcessingEnhanceDetailValue: () => number;

export const ImageProcessingEnhanceDetail: () => number;

export const ImageProcessingCreateInstance: () => number;

export const ImageProcessingDeinitializeEnvironment: () => number;

export const PixelMapScaleWithAntiAliasingNone: () => number;

export const PixelMapScaleWithAntiAliasingLow: () => number;

export const PixelMapScaleWithAntiAliasingMedium: () => number;

export const OHImageEffectInsertFilterByFilterEffectSuccess: () => number;

export const OHImageEffectConfigureEffectParamError: () => number;

export const OHImageEffectSetInputNativeBufferErrorCode: () => number;

export const OHImageEffectSetOutputNativeBufferErrorCode: () => number;

export const OHImageEffectSetInputPictureErrorCode: (path: string) => number;

export const OHImageEffectSetOutputPictureErrorCode: () => number;

export const OHImageEffectStartErrorCode: () => number;

export const OHImageEffectStopErrorCode: () => number;

export const ImageEffectErrorCodeErrorParamInvalid: () => number;

export const ImageEffectErrorCodeParamError: () => number;

export const ImageEffectErrorCodeKeyError: () => number;

export const ImageEffectDataTypeUnknown: () => number;

export const ImageEffectBufferTypeUnknown: () => number;

export const OHEffectFilterSetValueErrorCode: () => number;

export const OHEffectFilterGetValueErrorCode: () => number;

export const OHImageEffectImageEffectRegion: () => number;

export const OHImageEffectImageEffectSize: () => number;

export const OHEffectFilterLookupFiltersFilterNames: () => number;

export const createImageReceiver: (...params: ESObject[]) => image.ImageReceiver;

export const readLatestImage: (a: image.ImageReceiver) => image.Image;

export const on: (a: image.ImageReceiver) => number;

export const jsReadLatestImageSuccess: (a: image.ImageReceiver) => number;

export const jsReadNextImageSuccess: (a: image.ImageReceiver) => number;

export const imageClipRect: (a: image.Image) => imageClipRectSize;

export const imageClipBadParameter: () => number;

export const imageClipJniEnvAbnormal: () => number;

export const imageSize: (a: image.Image) => imageSize;

export const imageFormatBadParameter: () => number;

export const imageFormatJniEnvAbnormal: () => number;

export const imageFormat: (a: image.Image) => number;

export const imageSizeJniEnvAbnormal: () => number;

export const imageGetComponent: (a: image.Image, b: image.ComponentType.JPEG) => number;

export const imageGetComponentBadParameter: () => number;

export const imageGetComponentJniEnvAbnormal: () => number;

export const receiverRelease: (a: image.ImageReceiver) => number;

export const imageRelease: (a: image.Image) => number;

export const imageFormatYcbcr422Sp: () => number;

export const imageFormatJPEG: () => number;

export const imageComponentFormatYUVY: (a: image.Image) => number;

export const imageComponentFormatYUVU: (a: image.Image) => number;

export const imageComponentFormatYUVV: (a: image.Image) => number;

export const imageComponentFormatJPEG: (a: image.Image) => number;

export const createPixelMapSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const createPixelMapThirdpartSkiaError: (a: ArrayBuffer, b: pixelMapPots) => number;

export const jsImageReceiverOptionsSetCapacity: (a: number, b: number | boolean) => number;

export const jsGetReceivingSurfaceId: (a: image.ImageReceiver) => string;

export const jsReadNextImage: (a: image.ImageReceiver) => image.Image;

export const jsImageReceiverOptionsGetCapacity: (a: number) => number;

export const jsCreateImageReceiverOptions: (a: number, b: number, c: number) => number;

export const jsCreateImageReceiver: (a: number) => image.ImageReceiver;

export const jsReadLatestImage: (a: image.ImageReceiver) => image.Image;

export const jsImageReceiverNativeOn: (a: image.ImageReceiver, b: Callback<image.ImageReceiver>) => number;

export const jsGetImageSize: (a: image.Image) => number;

export const jsGetImageSizeBadParameter: () => number;

export const jsGetImageComponentTypes: (a: image.Image) => number[];

export const jsGetImageByteBuffer: (a: image.Image, b: number[]) => number;

export const jsGetImageByteBufferBadParameter: () => number;

export const jsGetImageBufferSize: (a: image.Image, b: number[]) => number;

export const jsGetImageBufferSizeBadParameter: () => number;

export const jsGetImageRowStride: (a: image.Image, b: number[]) => number;

export const jsGetImageRowStrideBadParameter: () => number;

export const jsGetImagePixelStride: (a: image.Image, b: number[]) => number;

export const jsGetImagePixelStrideBadParameter: () => number;

export const jsGetImageTimestamp: (a: image.Image) => number;

export const jsGetImageTimestampBadParameter: () => number;

export const jsReleaseImage: (a: image.Image) => number;

export const jsReleaseImageBadParameter: () => number;

export const jSImagePackerDynamicRangeAuto: () => number;

export const jSImagePackerDynamicRangeSdr: () => number;

export const jsIOHPackingOptionsCreate: () => number;

export const createPackingOptions: () => image.PackingOption;

export const jsPackingOptionsSetMimeType: (packing: image.PackingOption, mimeType: String) => number;

export const jsPackingOptionsSetMimeTypeImageAllocFailed: (packing: image.PackingOption, mimeType: String) => number;

export const jsPackingOptionsSetMimeTypeImageBadParameter: () => number;

export const jsPackingOptionsGetMimeType: (packing: image.PackingOption) => number;

export const jsPackingOptionsGetMimeTypeImageAllocFailed: (packing: image.PackingOption) => number;

export const jsPackingOptionsGetMimeTypeImageBadParameter: () => number;

export const jsPackingOptionsGetMimeTypeNull: (packing: image.PackingOption) => number;

export const jsPackingOptionsGetMimeTypeNullInvalidParameter: () => number;

export const jsPackingOptionsGetQuality: (packing: image.PackingOption) => number;

export const jsPackingOptionsGetQualityBadParameter: () => number;

export const jsPackingOptionsSetQuality: (packing: image.PackingOption, mimeType: number) => number;

export const jsPackingOptionsSetQualityBadParameter: () => number;

export const jsPackingOptionsGetDesiredDynamicRange: (packing: image.PackingOption) => number;

export const jsPackingOptionsGetDesiredDynamicRangeBadParameter: () => number;

export const jsPackingOptionsSetDesiredDynamicRange: (packing: image.PackingOption, dynamicRange: number) => number;

export const jsPackingOptionsSetDesiredDynamicRangeBadParameter: () => number;

export const jsPackingOptionsGetNeedsPackProperties: (packing: image.PackingOption) => number;

export const jsPackingOptionsGetNeedsPackPropertiesBadParameter: () => number;

export const jsPackingOptionsSetNeedsPackProperties: (packing: image.PackingOption,
  needsPackProperties: number) => number;

export const jsPackingOptionsSetNeedsPackPropertiesBadParameter: () => number;

export const jsPackingOptionsRelease: (packing: image.PackingOption) => number;

export const jsPackingOptionsReleaseBadParameter: () => number;

export const jsPackingOptionsForSequenceCreate: () => number;

export const jsPackingOptionsForSequenceSetFrameCount: () => number;

export const jsPackingOptionsForSequenceSetFrameCountBadParameter: () => number;

export const jsPackingOptionsForSequenceGetFrameCount: () => number;

export const jsPackingOptionsForSequenceGetFrameCountBadParameter: () => number;

export const jsPackingOptionsForSequenceSetDelayTimeList: () => number;

export const jsPackingOptionsForSequenceSetDelayTimeListBadParameter: () => number;

export const jsPackingOptionsForSequenceGetDelayTimeList: () => number;

export const jsPackingOptionsForSequenceGetDelayTimeListBadParameter: () => number;

export const jsPackingOptionsForSequenceSetDisposalTypes: () => number;

export const jsPackingOptionsForSequenceSetDisposalTypesBadParameter: () => number;

export const jsPackingOptionsForSequenceGetDisposalTypes: () => number;

export const jsPackingOptionsForSequenceGetDisposalTypesBadParameter: () => number;

export const jsPackingOptionsForSequenceSetLoopCount: () => number;

export const jsPackingOptionsForSequenceSetLoopCountBadParameter: () => number;

export const jsPackingOptionsForSequenceGetLoopCount: () => number;

export const jsPackingOptionsForSequenceGetLoopCountBadParameter: () => number;

export const jsPackingOptionsForSequenceRelease: () => number;

export const jsPackingOptionsForSequenceReleaseBadParameter: () => number;

export const jsImagePackerNativeCreate: () => number;

export const packerCreate: () => image.ImagePacker;

export const createFromFd: (fd: number) => image.ImageSource;

export const createDecodingOptions: () => image.DecodingOptions;

export const createPixelMapWithImageSoure: (source: image.ImageSource,
  options?: image.DecodingOptions) => image.PixelMap | number;

export const jsPackToDataFromImageSource: (packer: image.ImagePacker, packing: image.PackingOption,
  source: image.ImageSource, buffer: ArrayBuffer) => number;

export const jsPackToDataFromImageSourceBadParamter: () => number;

export const jsPackToDataFromPixelmap: (packer: image.ImagePacker, packing: image.PackingOption,
  source: image.PixelMap | number, buffer: ArrayBuffer) => number;

export const jsPackToDataFromPixelmapBadParamter: () => number;

export const jsPackToDataFromPicture: (packer: image.ImagePacker, packing: image.PackingOption,
  source: image.PixelMap | number, buffer: ArrayBuffer) => number;

export const jsPackToDataFromPictureBadParamter: () => number;

export const jsPackToDataFromPixelmapSequence: (packer: image.ImagePacker, source: image.PixelMap | number,
  buffer: ArrayBuffer) => number;

export const jsPackToDataFromPixelmapSequenceBadParamter: () => number;

export const jsPackToFileFromImageSource: (packer: image.ImagePacker, packing: image.PackingOption,
  source: image.ImageSource, fd: number) => number;

export const jsPackToFileFromImageSourceBadParamter: () => number;

export const jsPackToFileFromPixelmap: (packer: image.ImagePacker, packing: image.PackingOption,
  source: image.PixelMap | number, fd: number) => number;

export const jsPackToFileFromPixelmapBadParamter: () => number;

export const jsPackToFileFromPicture: (packer: image.ImagePacker, packing: image.PackingOption,
  source: image.PixelMap | number, fd: number) => number;

export const jsPackToFileFromPictureBadParamter: () => number;

export const jsPackToFileFromPixelmapSequenceBadParamter: () => number;

export const jsImagePackerNativeRelease: () => number;

export const jsImagePackerNativeReleaseBadParamter: () => number;

export const jsGetSupportedFormats: () => number;

export const jsGetSupportedFormatsBadParamter: () => number;

export const jsImageReceiverOptionsCreate: () => number;

export const jsImageReceiverOptionsCreateBadParamter: () => number;

export const jsImageReceiverOptionsGetSize: () => number;

export const jsImageReceiverOptionsSetSize: () => number;

export const jsImageReceiverOptionsSetSizeBadParamter: () => number;

export const jsImageReceiverOptionsGetCapacitySuccess: () => number;

export const jsImageReceiverOptionsSetCapacitySuccess: () => number;

export const jsImageReceiverOptionsSetCapacityBadParamter: () => number;

export const jsImageReceiverOptionsRelease: () => number;

export const jsImageReceiverNativeCreate: () => number;

export const jsImageReceiverNativeCreateBadParamter: () => number;

export const jsImageReceiverNativeGetReceivingSurfaceId: () => number;

export const jsImageReceiverNativeReadLatestImage: () => number;

export const jsImageReceiverNativeReadLatestImageBadParamter: () => number;

export const jsImageReceiverNativeReadLatestImageUnknownError: () => number;

export const jsImageReceiverNativeReadNextImage: () => number;

export const jsImageReceiverNativeReadNextImageBadParamter: () => number;

export const jsImageReceiverNativeReadNextImageUnknownError: () => number;

export const jsImageReceiverNativeOnSuccess: () => number;

export const jsImageReceiverNativeOnBadParamter: () => number;

export const jsImageReceiverNativeOff: () => number;

export const jsImageReceiverNativeOffBadParamter: () => number;

export const jsImageReceiverNativeOnImageArrive: () => number;

export const jsImageReceiverNativeOnImageArriveInvaildParamter: () => number;

export const jsImageReceiverNativeOffImageArrive: () => number;

export const jsImageReceiverNativeOffImageArriveInvaildParamter: () => number;

export const jsImageReceiverNativeGetSize: () => number;

export const jsImageReceiverNativeGetCapacity: () => number;

export const jsImageReceiverNativeRelease: () => number;

export const jsImageReceiverNativeReleaseBadParamter: () => number;

export const jsImageSoureNativeImageDynamicRangeAuto: () => number;

export const jsImageSoureNativeImageDynamicRangeSDR: () => number;

export const jsImageSoureNativeImageDynamicRangeHDR: () => number;

export const jsImageSoureNativeImageAllocatorTypeAuto: (uri: string) => number;

export const jsImageSoureNativeImageAllocatorTypeDMA: (uri: string) => number;

export const jsImageSoureNativeImageAllocatorTypeShareMemory: (uri: string) => number;

export const jsImageSoureNativeImageCropAndScaleStrategyScaleFirst: () => number;

export const jsImageSoureNativeImageCropAndScaleStrategyCropFirst: () => number;

export const jsImageSoureNativeImageSourceInfoGetWidth: () => number;

export const jsImageSoureNativeImageSourceInfoGetWidthBadParameter: () => number;

export const jsImageSoureNativeImageSourceInfoGetHeight: () => number;

export const jsImageSoureNativeImageSourceInfoGetHeightBadParameter: () => number;

export const jsImageSoureNativeImageSourceInfoGetDynamicRange: () => number;

export const jsImageSoureNativeImageSourceInfoGetDynamicRangeBadParameter: () => number;

export const jsImageSoureNativeImageSourceInfoGetMimeType: () => number;

export const jsImageSoureNativeImageSourceInfoRelease: () => number;

export const jsImageSoureNativeImageSourceInfoReleasBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsGetPixelFormat: () => number;

export const jsImageSoureNativeDecodingOptionsGetPixelFormatBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsSetPixelFormatBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsGetIndex: () => number;

export const jsImageSoureNativeDecodingOptionsGetIndexBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsSetIndex: () => number;

export const jsImageSoureNativeDecodingOptionsSetIndexBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsGetRotate: () => number;

export const jsImageSoureNativeDecodingOptionsGetRotateBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsSetRotate: () => number;

export const jsImageSoureNativeDecodingOptionsSetRotateBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsGetDesiredSize: () => number;

export const jsImageSoureNativeDecodingOptionsGetDesiredSizeBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsSetDesiredSizeBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsGetDesiredRegion: () => number;

export const jsImageSoureNativeDecodingOptionsGetDesiredRegionBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsSetDesiredRegion: () => number;

export const jsImageSoureNativeDecodingOptionsSetDesiredRegionBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsGetDesiredDynamicRange: () => number;

export const jsImageSoureNativeDecodingOptionsGetDesiredDynamicRangeBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsSetDesiredDynamicRange: () => number;

export const jsImageSoureNativeDecodingOptionsSetDesiredDynamicRangeBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsSetCropAndScaleStrategy: () => number;

export const jsImageSoureNativeDecodingOptionsSetCropAndScaleStrategyBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsGetCropAndScaleStrategy: () => number;

export const jsImageSoureNativeDecodingOptionsGetCropAndScaleStrategyBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsSetCropRegionInvaildParamter: () => number;

export const jsImageSoureNativeDecodingOptionsGetCropRegionInvaildParamter: () => number;

export const jsImageSoureNativeDecodingOptionsGetDesiredColorSpace: () => number;

export const jsImageSoureNativeDecodingOptionsGetDesiredColorSpaceInvaildParamter: () => number;

export const jsImageSoureNativeDecodingOptionsSetDesiredColorSpace: () => number;

export const jsImageSoureNativeDecodingOptionsSetDesiredColorSpaceInvaildParamter: () => number;

export const jsImageSoureNativeDecodingOptionsRelease: () => number;

export const jsImageSoureNativeDecodingOptionsReleaseBadParameter: () => number;

export const jsImageSoureNativeCreateFromUri: (uri: string) => number;

export const jsImageSoureNativeCreateFromUriBadParameter: () => number;

export const jsImageSoureNativeCreateFromFdBadParameter: () => number;

export const jsImageSoureNativeCreateFromData: (buf: ArrayBufferLike) => number;

export const jsImageSoureNativeCreateFromDataBadParameter: () => number;

export const jsImageSoureNativeCreateFromDataWithUserBuffer: (buf: ArrayBufferLike) => number;

export const jsImageSoureNativeCreateFromDataWithUserBufferInvaildParamter: () => number;

export const jsImageSoureNativeCreateFromRawFile: (fd: number, offset: number, length: number) => number;

export const jsImageSoureNativeCreateFromRawFileBadParameter: () => number;

export const jsImageSoureNativeCreatePixelmapBadParameter: () => number;

export const jsImageSoureNativeCreatePixelmapUsingAllocatorBadParameter: () => number;

export const jsImageSoureNativeCreatePixelmapUsingAllocatorUnsuportedAllocatorType: (uri: string) => number;

export const jsImageSoureNativeCreatePixelmapList: (uri: string) => number;

export const jsImageSoureNativeCreatePixelmapListBadParameter: () => number;

export const jsImageSoureNativeCreatePicture: (uri: string) => number;

export const jsImageSoureNativeCreatePictureBadParameter: () => number;

export const jsImageSoureNativeCreatePictureAtIndex: (uri: string) => number;

export const jsImageSoureNativeCreatePictureAtIndexBadSource: () => number;

export const jsImageSoureNativeCreatePictureAtIndexUnsuportedOptions: (uri: string) => number;


export const jsImageSoureNativeGetDelayTimeList: (uri: string) => number;

export const jsImageSoureNativeGetDelayTimeListBadParameter: () => number;

export const jsImageSoureNativeGetImageInfo: (uri: string) => number;

export const jsImageSoureNativeGetImageInfoBadParameter: () => number;

export const jsImageSoureNativeGetImagePropertyBadParameter: () => number;

export const jsImageSoureNativeGetImagePropertyAllocFailed: (uri: string, key: string) => number;

export const jsImageSoureNativeGetImagePropertyWithNullInvaildParamter: () => number;

export const jsImageSoureNativeModifyImageProperty: (uri: string) => number;

export const jsImageSoureNativeModifyImagePropertyBadParameter: () => number;

export const jsImageSoureNativeGetFrameCount: (uri: string) => number;

export const jsImageSoureNativeGetFrameCountBadParameter: () => number;

export const jsImageSoureNativeRelease: (uri: string) => number;

export const jsImageSoureNativeReleaseBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsForPictureCreateBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsForPictureGetDesiredAuxiliaryPictures: (arraySize: number,
  auxTypes: Array<image.AuxiliaryPictureType>) => number;

export const jsImageSoureNativeDecodingOptionsForPictureGetDesiredAuxiliaryPicturesBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsForPictureSetDesiredAuxiliaryPictures: (arraySize: number,
  auxTypes: Array<image.AuxiliaryPictureType>) => number;

export const jsImageSoureNativeDecodingOptionsForPictureSetDesiredAuxiliaryPicturesBadParameter: () => number;

export const jsImageSoureNativeDecodingOptionsForPictureRelease: () => number;

export const jsImageSoureNativeDecodingOptionsForPictureReleaseBadParameter: () => number;

export const jsImageSoureNativeGetSupportedFormats: (uri: string) => number;

export const jsImageSoureNativeGetSupportedFormatsInvalidParameter: () => number;

export const testPictureNative_CreatePicture: (uri: string) => number;
export const testPictureNative_GetMainPixelmap: (uri: string) => number;
export const testPictureNative_GetHdrComposedPixelmap: (uri: string) => number;
export const testPictureNative_GetGainmapPixelmap: (uri: string) => number;
export const testPictureNative_SetAuxiliaryPicture: (uri: string) => number;
export const testPictureNative_GetAuxiliaryPicture: (uri: string) => number;
export const testPictureNative_GetMetadata: (uri: string) => number;
export const testPictureNative_SetMetadata: (uri: string) => number;
export const testPictureNative_Release: (uri: string) => number;
export const testAuxiliaryPictureNativeWritePixelsImage: (uri: string) => number;
export const testAuxiliaryPictureNative_ReadPixels: (uri: string) => number;
export const testAuxiliaryPictureNative_GetType: (uri: string) => number;
export const testAuxiliaryPictureNative_GetInfo: (uri: string) => number;
export const testAuxiliaryPictureNative_SetInfo: (uri: string) => number;
export const testAuxiliaryPictureNative_GetMetadata: (uri: string) => number;
export const testAuxiliaryPictureNative_SetMetadata: (uri: string) => number;

export const pixelmapNative_AntiAliasingLevel_NONE: () => number;

export const pixelmapNative_AntiAliasingLevel_LOW: () => number;

export const pixelmapNative_AntiAliasingLevel_MEDIUM: () => number;

export const pixelmap_HdrMetadataKey_HDR_STATIC_METADATA: () => number;

export const pixelmap_HdrMetadataKey_HDR_DYNAMIC_METADATA: () => number;

export const pixelmap_HdrMetadataKey_HDR_GAINMAP_METADATA: () => number;

export const imageErrorCode_IMAGE_DMA_NOT_EXIST: () => number;

export const pixelmap_HdrMetadataType_NONE: () => number;

export const pixelmap_HdrMetadataType_BASE: () => number;

export const pixelmap_HdrMetadataType_GAINMAP: () => number;

export const pixelmap_HdrMetadataType_ALTERNATE: () => number;

export const pixelmap_HdrStaticMetadata_displayPrimariesX: () => number;

export const pixelmap_HdrStaticMetadata_displayPrimariesY: () => number;

export const pixelmap_HdrStaticMetadata_whitePointX: () => number;

export const pixelmap_HdrStaticMetadata_whitePointY: () => number;

export const pixelmap_HdrStaticMetadata_maxLuminance: () => number;

export const pixelmap_HdrStaticMetadata_minLuminance: () => number;

export const pixelmap_HdrStaticMetadata_maxContentLightLevel: () => number;

export const pixelmap_HdrStaticMetadata_maxFrameAverageLightLevel: () => number;

export const pixelmap_HdrDynamicMetadata_data: () => number;

export const pixelmap_HdrDynamicMetadata_length: () => number;

export const pixelmap_HdrGainmapMetadata_writerVersion: () => number;

export const pixelmap_HdrGainmapMetadata_miniVersion: () => number;

export const pixelmap_HdrGainmapMetadata_gainmapChannelNum: () => number;

export const pixelmap_HdrGainmapMetadata_useBaseColorFlag: () => number;

export const pixelmap_HdrGainmapMetadata_baseHeadroom: () => number;

export const pixelmap_HdrGainmapMetadata_alternateHeadroom: () => number;

export const pixelmap_HdrGainmapMetadata_gainmapMax: () => number;

export const pixelmap_HdrGainmapMetadata_gainmapMin: () => number;

export const pixelmap_HdrGainmapMetadata_gamma: () => number;

export const pixelmap_HdrGainmapMetadata_baselineOffset: () => number;

export const pixelmap_HdrGainmapMetadata_alternateOffset: () => number;

export const pixelFormat_RGB_565: () => number;

export const pixelFormat_RGB_888: () => number;

export const pixelFormat_ALPHA_8: () => number;

export const pixelFormat_RGBA_F16: () => number;

export const pixelFormat_NV21: () => number;

export const pixelFormat_NV12: () => number;

export const pixelFormat_RGBA_1010102: () => number;

export const pixelFormat_YCBCR_P010: () => number;

export const pixelFormat_YCRCB_P010: () => number;

export const JSImageImageAllocatorModeDmaCode: () => number;

export const JSImageImageAllocatorModeSharedMemoryCode: () => number;

export const JSImagePixelmapAlphaTypeOpaqueCode: () => number;

export const JSImagePixelmapAlphaTypeUnpremultipliedCode: () => number;

export const JSImagePixelmapHdrMetadataValueTypeCode: () => number;

export const JSImagePixelmapHdrMetadataValueStaticMetadataCode: () => number;

export const JSImagePixelmapHdrMetadataValueDynamicMetadataCode: () => number;

export const JSImagePixelmapHdrMetadataValueGainmapMetadataCode: () => number;

export const PixelMapCreatePixelMapResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapGetBytesNumberPerRowResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapGetIsEditableResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapIsSupportAlphaResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapSetAlphaAbleResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapGetDensityResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapSetOpacityResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapScaleResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapScaleWithAntiAliasingResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapTranslateResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapRotateResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapFlipResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapCropResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapGetImageInfoResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapAccessPixelsResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapUnAccessPixelsResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;

export const PixelMapSetDensityResultSuccess: (a: ArrayBuffer, b: pixelMapPots) => number;
export const test_COLOR_SPACE_CONVERSION: () => number;
export const test_DETAIL_ENHANCER: () => number;
export const test_COMPOSITION: () => number;
export const test_DECOMPOSITION: () => number;
export const test_METADATA_GENERATION: () => number;


