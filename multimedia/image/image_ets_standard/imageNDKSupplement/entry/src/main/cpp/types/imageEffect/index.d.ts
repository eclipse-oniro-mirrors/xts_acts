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
import { image } from '@kit.ImageKit';
import { resourceManager } from '@kit.LocalizationKit';
import { Callback } from '@kit.BasicServicesKit';

interface PackingOption_format {
  format: string;
}

interface PackingOption_quality {
  quality: number;
}

interface pixelMapPots {
  width: number,
  height: number,
  pixelFormat: number,
  editable: number,
  alphaType: number,
  scaleMode: number
}
export const packToData: (a: image.ImagePacker, b: image.ImageSource | image.PixelMap,
  c: image.PackingOption | PackingOption_format | PackingOption_quality) => number;
export const OHImageEffectCreateSupp: (a: number) => number;
export const OHImageEffectAddFilterSupp: (a: number) => number;
export const OHImageEffectInsertFilterSupp: (a: number) => number;
export const OHImageEffectRemoveFilterSupp: (a: number) => number;
export const OHImageEffectReplaceFilterSupp: (a: number) => number;
export const OHPixelMapGetBytesNumberPerRow: (a: number) => number;
export const OHPixelMapGetIsEditable: (a: number) => number;
export const OHPixelMapIsSupportAlpha: (a: number) => number;
export const OHPixelMapSetAlphaAble: (a: number) => number;
export const OHPixelMapSetDensity: (a: number) => number;
export const OHImageEffectSetOutputTextureId: (a: number) => number;
export const OHImageEffectStart: (a: number) => number;
export const PictureMetadataGetProperty: (a: number) => number;
export const PictureMetadataSetProperty: (a: number) => number;
export const ClonedMetadataGetProperty: (a: number) => number;
export const OHEffectBufferInfoSetTimestampTest: (a: number) => number;
export const OHEffectBufferInfoGetTimestampTest: (a: number) => number;
export const OHEffectBufferInfoSetTextureIdTest: (a: number) => number;
export const OHEffectBufferInfoGetTextureIdTest: (a: number) => number;
export const OHEffectFilterCreateSupp: (a: number) => number;
export const OHEffectFilterLookUpFiltersSupp: (a: number) => number;
export const OHEffectFilterLookUpFiltersNullptrSupp: () => undefined;
export const OHEffectFilterSetValueSupp: (a: number) => number;
export const OHEffectFilterGetValueSupp: (a: number) => number;
export const OHEffectFilterRegisterSupp: (a: number) => number;
export const OHEffectFilterLookupFilterInfoSupp: (a: number) => number;
export const OHEffectFilterReleaseSupp: (a: number) => number;
export const OHEffectFilterRenderSupp: (a: number) => number;
export const OHEffectFilterRenderWithTextureIdSupp: (a: number) => number;
export const OHPixelmapNativeCreateScaledPixelMapSupp: (a: number) => number;
export const OHPixelmapNativeCreateScaledPixelMapWithAntiAliasingSupp: (a: number) => number;
export const OHPixelmapNativeTranslateSupp: (a: number) => number;
export const OHImageSourceNativeCreateFromUriSupp: (a: number) => number;
export const OHImageSourceNativeCreateFromFdSupp: (a: number) => number;
export const OHImageAlphaTypeSupp: (a: number) => number;
export const OHImageErrorCodeSupp: (a: number) => number;
export const OHImageScaleModeSupp: (a: number) => number;
export const OHImageAuxiliaryPictureSupp: (a: number) => number;
export const add:(a: number, b: number) => image.PixelMap;
export const transform: (a: image.PixelMap) => image.PixelMap;
export const testGetImageInfo: (a: image.PixelMap) => image.PixelMap;
export const testAccessPixels: (a: image.PixelMap) => image.PixelMap;
export const testUnAccessPixels: (a: image.PixelMap) => image.PixelMap;
export const PixelMapGetIsEditableResult: (a: number) => number;
export const ImagePackerCreateTest: (a: number) => number;
export const ImagePackerInitNativeTest: (a: number) => number;
export const ImagePackerPackToDataTest: (a: number, b: number) => number;
export const ImagePackerPackToFileTest: (a: number, b: number) => number;
export const CreatePixelMapTest: (a: number) => number;
export const CreatePixelMapWithStrideTest: (a: number) => number;
export const CreateAlphaPixelMapTest: (a: number) => number;
export const PictureNativeGetMetadataTest: (a: number, b: number) => number;
export const PixelMapGetImageInfoTest: (a: number) => number;
export const PixelMapAccessPixelsTest: (a: number) => number;
export const PixelMapUnAccessPixelsTest: (a: number) => number;
export const OHEffectFilterInfoSetFilterNameSupplementTest: (a: number) => number;
export const OHEffectFilterInfoGetFilterNameSupplementTest: (a: number) => number;
export const OHEffectFilterInfoSetSupportedBufferTypesSuppTest: (a: number) => number;
export const OHEffectFilterInfoGetSupportedBufferTypesSuppTest: (a: number) => number;
export const OHEffectFilterInfoSetSupportedFormatsSuppTest: (a: number) => number;
export const OHEffectFilterInfoGetSupportedFormatsSuppTest: (a: number) => number;
export const OHEffectFilterInfoReleaseSupplementTest: (a: number) => number;
export const OHImageEffectReplaceFilterByFilterSupp: (a: number) => number;
export const OHImageEffectAddFilterByFilterSupp: (a: number) => number;
export const OHImageEffectInsertFilterByFilterSupp: (a: number) => number;
export const OHImageEffectRemoveFilterByIndexSupp: (a: number) => number;
export const OHImageEffectGetFilterSupp: (a: number) => number;
export const OHImageEffectSetInputPictureSupp: (a: number) => number;
export const OHImageEffectSetOutputPictureSupp: (a: number) => number;
export const OHImageEffectReleaseSupp:(a: number) => number;
export const OHImageInitImageNativeSupp: () => undefined;
export const OHPictureMetadataGetPropertyWithNullSupp: (a: number) => number;
export const OHPackingOptionsCreateSupp: (a: number) => number;
export const OHPixelmapNativeGetMetadataSupp: (a: number) => number;
export const OHPixelmapNativeSetMetadataSupp: (a: number) => number;
export const OHConvertPixelmapNativeFromNapiSupp: (a: number) => number;
export const OHPictureNativeGetMetadataSupp: (a: number,b: string) => number;
export const OHPictureNativeSetMetadataSupp: (a: number,b:string) => number;
export const OHAuxiliaryPictureNativeSetMetadataSupp: (a: number) => number;
export const ImageReceiverNativeReadLatestImageTest:(a: number) => number;
export const InitImageReceiverNativeTest:(a: number) => number;
export const OHImageClipRectTest:(a: number) => number;
export const CreatePixelmapUsingAllocatorTest:(a: number,b:number) => number;
export const PixelmapNativeSetMemoryNameTest:(a: number) => number;
export const ImageSourceNativeCreatePictureTest:(a: number,b:number) => number;
export const ImageSourceNativeCreatePictureAtIndexTest:(a: number,b:number) => number;
export const DecodingOptionsGetDesiredColorSpaceTest:(a: number) => number;
export const ClonePixelmapTest:(a: number) => number;
export const CreateCroppedAndScaledPixelMapTest:(a: number) => number;
export const CreatePixelmapFromSurfaceTest:(a: number, b:string) => number;
export const CreatePixelmapFromNativeBufferTest:(a: number) => number;
export const OHImageEffectConfigureSupp: (a: number) => number;
export const OHImageEffectSetOutputSurfaceSupp: (a: number) => number;
export const OHImageEffectGetInputSurfaceSupp: (a: number) => number;
export const OHImageEffectSetInputPixelmapSupp: (a: number) => number;
export const OHImageEffectSetOutputPixelmapSupp: (a: number) => number;
export const savePixelMapForPathSupp: (a: string) => number;
export const OHImageEffectSaveSupp: (a: number) => number;
export const OHImageEffectEmuSupp: (a: number) => number;
export const OHImageEffectSetInputUriSupp: (a: number) => number;
export const OHImageEffectSetOutputUriSupp: (a: number) => number;
export const CreatOutPixelMapForPathSupp: (a: string) => number;
export const CreatePixelMap: (a: ArrayBuffer, b:pixelMapPots) => image.PixelMap;
export const TestAccessPixels: (a: number) => number;
export const TestUnAccessPixels: (a: number) => number;
export const ImageSourceCreatTest: (a: number) => number;
export const ImageSourceGetSupportedFormatsTest: (a: number) => number;
export const ImageSourceCreateIncrementalTest: (a: number) => number;
export const ImageSourceInitNativeSuppTest: () => undefined;
export const PixelmapNativeGetNativeBuffer: (a: number) => number;
export const TestImageScale: (a: number) => number;
export const PixelmapNativeWritePixelsToArea: (a: number) => number;
export const OHImageEffectErrorCodeSupp: (a: number) => number;
export const OHIRNdkErrorCodeTestSupp: (a: number) => number;
export const MediaLibraryErrorCode: (a: number) => number;
export const OHPixelMapTranslateSupplementTest: (a: number) => number;
export const OHPixelMapRotateSupplementTest: (a: number) => number;
export const OHPixelmapNativeSetColorSpaceNativeSuppTest: (a: number) => number;
export const OHPixelmapNativeGetColorSpaceNativeSuppTest: (a: number) => number;
export const OHEffectBufferInfoSetAddrSupplementTest: (a: number) => number;
export const OHEffectBufferInfoGetAddrSupplementTest: (a: number) => number;
export const OHEffectBufferInfoCreateSupplementTest: (a: number) => number;
export const OHEffectFilterInfoCreateSupplementTest: (a: number) => number;
export const OHEffectFilterCreateSupplementTest: (a: number) => number;
export const OHPixelmapNativeUnaccessPixelsSuppTest: (a: number) => number;
export const CreateImageReceiverSupplementTest: (a: number) => number;
export const OHPixelmapNativeAccessPixelsSuppTest: (a: number) => number;
export const OHPixelmapNativeCreateAlphaPixelmapSuppTest: (a: number) => number;
export const OHPixelmapNativeGetUniqueIdSuppTest: (a: number) => number;
export const OHPixelmapNativeIsReleasedSuppTest: (a: number) => number;
export const OHPixelmapNativeReadPixelsFromAreaSuppTest: (a: number) => number;
export const OHPixelmapNativeWritePixelsToAreaSuppTest: (a: number) => number;
export const IRNdkErrCodeSupplementTest: (a: number) => number;

export const OHImageEffectCreateSupplement:() => undefined;
export const OHImageEffectAddFilterSupplement:() => undefined;
export const OHImageEffectInsertFilterSupplement:() => undefined;
export const OHImageEffectReplaceFilterSupplement:() => undefined;
export const OHImageEffectGetFilterSupplement:() => undefined;
export const OHImageEffectSetInputTextureSupp:(a: number) => number;
export const OHEffectBufferInfoSetWidthTest: (a: number) => number;
export const OHEffectBufferInfoGetWidthTest: (a: number) => number;
export const OHEffectBufferInfoGetHeightTest: (a: number) => number;
export const OHEffectBufferInfoSetHeightTest: (a: number) => number;
export const OHEffectBufferInfoSetRowSizeTest: (a: number) => number;
export const OHEffectBufferInfoGetRowSizeTest: (a: number) => number;
export const OHEffectBufferInfoReleaseTest: (a: number) => number;
export const OHImageSizeTest: (a: number,b: number) => number;
export const OHImageEffectRestoreTest: (a: number) => number;
export const OHPixelmapNativeCreatePixelmapNativeTest: (a: number) => number;
export const OHPixelmapNativeGetArgbPixelsTest: (a: number) => number;
export const OHPixelmapNativeToSdrTest: (a: number) => number;
export const PixelmapNativeCreateEmptyPixelmapUsingAllocator: (a: number) => number;
export const OHIRNdkErrCodeTestSupp:(a: number) => number;
export const IRNdkErrCodeSupplement:(a: number) => number;
export const OIRNdkErrCodeEmuSupp:(a: number) => number;
export const ImageReceiverNativeReadLatestImageSuccessTest:(a: number,b: Callback<image.ImageReceiver>) => number;
export const ImageResultIRNdkErrCodeTest:(a: number) => number;
export const ImagePackerNativeCreateTest:(a: number) => number;
export const OHDecodingOptionsCreateTest:(a: number) => number;
export const OH_PixelmapNative_GetImageInfoTest:(a: number) => number;
export const OH_PixelmapNative_ConvertAlphaFormatTest:(a: number) => number;
export const ImageSourceCreatSuccessTest:(a: number) => number;
export const PixelmapNativeGetNativeBufferNotExist:(a: number) => number;
export const ImageSourceCreate:(a: number, b:string) => number;
export const ImageSourceNativeGetImagePropertyLong:(a: number,b: number,c:string) => number;
export const ImageSourceNativeGetImagePropertyShort:(a: number,b: number,c:string) => number;
export const ImageSourceNativeGetImagePropertyDouble:(a: number,b: number,c:string) => number;
export const ImageSourceGetImagePropertyArraySize:(a: number,b: number,c:string) => number;
export const OHImageSourceNativeModifyImagePropertyDoubleSupp:(a: number,b:number,c:string) => number;
export const ImageModifyImagePropertyIntArraySupp:(a: number,b:number,c:string,d:number[]) => number;
export const ImageModifyImagePropertyDoubleArraySupp:(a: number,b:number,c:string,d:number[]) => number;
export const OHImageSourceNativeModifyImagePropertyBlobSupp:(a: number,b:number,c:string,d:ArrayBufferLike) => number;
export const PixelmapNativeCropTest:(a: number) => number;
export const ConvertAlphaFormatTest:(a: number) => number;
export const DecodingOptionsReleaseTest:(a: number) => number;
export const CreatePixelmapFromSurfaceWithTransformationTest:(a: number,b: string) => number;
export const ImageModifyImagePropertyShortSupp:(a: number,b:number,c:string,d:number) => number;
export const OHImageNativeGetColorSpaceSupp:(a: number,b:Callback<image.ImageReceiver>) => number;
export const OHImageSourceNativeGetImagePropertyBlobSupp:(a: number,b:number,c:string,d:ArrayBufferLike) => number;
export const OHImageSourceNativeGetImagePropertyStringSupp:(a: number,b:number,c:string,d:number) => number;
export const SetDesiredPixelFormatTest:(a: number) => number;
export const GetDesiredPixelFormatTest:(a: number) => number;
export const ComposeOptionsReleaseTest:(a: number) => number;
export const GetHdrComposedPixelmapWithOptionsTest:(a: number) => number;
export const ComposeOptionsCreateTest:(a: number) => number;
export const OHImageSourceNativeGetImagePropertyIntArraySupp:(a: number, b:number, c:string, d:number[]) => number;
export const OHImageSourceNativeModifyImagePropertyLongSupp:(a: number, b:number,c:string, d:number) => number;
export const ImageSourceNativeGetImagePropertyDoubleArraySupp:(a: number, b:number, c:string, d:number) => number;
export const ImageErrCodeSupp:(a: number) => number;
export const OHImageSourceInfoCreateTest:(a: number) => number;
export const OHImageNativeGetBufferDataTest:(a: number,b: Callback<image.ImageReceiver>) => number;
export const OHImageNativeGetFormatTest:(a: number,b: Callback<image.ImageReceiver>) => number;
export const OHPixelmapNativeWritePixelsTest:(a: number) => number;
export const OHPixelmapNativeReadPixelsTest:(a: number) => number;
export const OHImageNativeGetBufferDataValueTest:(a: number,b: Callback<image.ImageReceiver>) => number;
export const OHImageNativeGetColorSpaceTest:(a: number,b: Callback<image.ImageReceiver>) => number;