/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import image from "@ohos.multimedia.image";
import resourceManager from "@ohos.resourceManager";

interface IAuxInfo {
  auxiliaryPictureType: image.AuxiliaryPictureType;
  width: number;
  height: number;
  rowStride: number;
  pixelFormat: image.PixelMapFormat;
}

interface InfoSize {
  width: number;
  height: number;
}

interface IImageInfo {
  width: number;
  height: number;
  pixelFormat: image.PixelMapFormat;
  isHdr: boolean;
}

// For test
export const releaseTestContext: () => void;
export const createTestImagePacker: () => void;
export const createTestPackingOptions: () => void;
export const setMimeTypeToTestPackingOptions: (format: string) => void;
export const setDynamicRangeToTestPackingOptions: (dynamicRange: number) => void;
export const createTestImageSource: (uri: string) => void;
export const createTestPixelmapByImageSource: (pixelFormat: image.PixelMapFormat) => number;
export const clonedMetadataGetProperty: (key: string) => string;
export const clonedMetadataRelease: () => number;
export const pictureMetadataGetProperty: (metadataType: image.MetadataType, key: string) => string;
export const auxiliaryMetadataGetProperty: (metadataType: image.MetadataType, key: string) => string;
export const GetPixelmapBuffer: (src: ArrayBuffer) => ArrayBuffer;
export const setNeedsPackPropertiesToTestPackingOptions: (needpackExif: boolean) => void;
export const compareArrayBuffer: (arrayBuffer1: ArrayBuffer, arrayBuffer2: ArrayBuffer) => boolean;
export const getTempAuxiliaryPicture: (uri: string, auxType: image.AuxiliaryPictureType) => image.AuxiliaryPicture;
export const PictureMetadataGetPropertyWithNull: (metadataType: image.MetadataType, key: string) => string;

// Metadata
export const MetadataCreate: (metadataType: image.MetadataType) => image.Metadata;
export const MetadataGetProperty: (key: string) => string;
export const MetadataSetProperty: (key: string, value: string) => number;
export const MetadataRelease: () => number;
export const MetadataClone: () => image.Metadata;

// Image packer
export const PackToDataFromPicture: (dst: ArrayBuffer) => number;
export const PackToFileFromPicture: (fd: number) => number;

// Image source
export const CreatePictureByImageSource: () => number;
export const CreatePictureDecodingOptions: () => number;
export const GetDesiredAuxiliaryPictures: () => Array<image.AuxiliaryPictureType>;
export const SetDesiredAuxiliaryPictures: (arraySize: number, auxTypes: Array<image.AuxiliaryPictureType>) => number;
export const ReleasePictureDecodingOptions: () => number;
export const CreateSinglePictureByImageSource: () => number;
export const GetImageSourceInfoSize: () => image.Size;
export const CreateImageSourceFromFd: (fd: number) => void;
export const CreateImageSourceFromData: (buf: ArrayBufferLike) => void;
export const GetImageSourceDynamicRange: () => number;

// Picture
export const CreatePictureByPixelmap: () => number;
export const GetMainPixelmap: () => image.PixelMap;
export const GetHdrComposedPixelmap: () => image.PixelMap;
export const GetGainmapPixelmap: () => image.PixelMap;
export const SetAuxiliaryPicture: (auxType: image.AuxiliaryPictureType, auxPicture: image.AuxiliaryPicture) => number;
export const GetAuxiliaryPicture: (auxType: image.AuxiliaryPictureType) => image.AuxiliaryPicture;
export const PictureGetMetadata: (metadataType: image.MetadataType) => image.Metadata;
export const PictureSetMetadata: (metadataType: image.MetadataType, metadata: image.Metadata) => number;
export const ReleasePicture: () => number;
export const GetMainPixelmapInfo: () => IAuxInfo;
export const GetGainmapPixelmapInfo: () => IAuxInfo;

// Auxiliary picture
export const CreateAuxiliaryPicture: (src: ArrayBuffer, size: image.Size,
                                      auxType: image.AuxiliaryPictureType) => image.AuxiliaryPicture;
export const AuxiliaryPictureWritePixels: (src: ArrayBuffer) => number;
export const AuxiliaryPictureReadPixels: (dst: ArrayBuffer) => number;
export const AuxiliaryPictureGetType: () => image.AuxiliaryPictureType;
export const AuxiliaryPictureGetInfo: () => IAuxInfo;
export const AuxiliaryPictureSetInfo: (auxInfo: IAuxInfo) => number;
export const AuxiliaryPictureSetInfoToCtx: () => number;
export const AuxiliaryPictureGetMetadata: (metadataType: image.MetadataType) => image.Metadata;
export const AuxiliaryPictureSetMetadata: (metadataType: image.MetadataType, metadata: image.Metadata) => number;
export const ReleaseAuxiliaryPicture: () => number;

// Auxiliary picture info
export const CreateAuxiliaryPictureInfo: () => IAuxInfo;
export const AuxiliaryPictureInfoGetType: () => image.AuxiliaryPictureType;
export const AuxiliaryPictureInfoSetType: (auxType: image.AuxiliaryPictureType) => number;
export const AuxiliaryPictureInfoGetSize: () => image.Size;
export const AuxiliaryPictureInfoSetSize: (size: image.Size) => number;
export const AuxiliaryPictureInfoGetRowStride: () => number;
export const AuxiliaryPictureInfoSetRowStride: (rowStride: number) => number;
export const AuxiliaryPictureInfoGetPixelFormat: () => image.PixelMapFormat;
export const AuxiliaryPictureInfoSetPixelFormat: (pixelFormat: image.PixelMapFormat) => number;
export const ReleaseAuxiliaryPictureInfo: () => number;
export const SetAuxiliarySinglePicture: (auxType: image.AuxiliaryPictureType,
  auxPicture: image.AuxiliaryPicture) => number;
export const AuxiliarySinglePictureSetInfo: (auxInfo: IAuxInfo, auxPicture: image.AuxiliaryPicture) => number;

// Pixelmap info
export const GetSingleMainPixelmapInfo: () => IAuxInfo;
export const GetHdrPixelmapInfo: () => IAuxInfo;

// Error Code
export const AuxiliaryPictureInfoSetTypeErrorCode: (auxType: image.AuxiliaryPictureType | number) => number;
export const MetadataGetPropertyErrorCode: (key: string) => number;
export const CreateAuxiliaryPictureErrorCode: (src: ArrayBuffer, size: image.Size,
  auxType: image.AuxiliaryPictureType) => number;
export const AuxiliaryPictureGetMetadataErrorCode: (metadataType: image.MetadataType) => number;
export const PackToDataFromPictureErrorCode: (dst: ArrayBuffer) => number;
export const AuxiliaryPictureReadPixelsErrorCode: (dst: ArrayBuffer) => number;
export const SetAuxiliaryPictureErrorCode: (auxType: image.AuxiliaryPictureType,
  auxPicture: image.AuxiliaryPicture) => number;
export const MetadataSetPropertyErrorCode: (key: string, value: string) => number;
export const PictureGetMetadataErrorCode: (metadataType: image.MetadataType) => number;
export const PictureSetMetadataErrorCode: (metadataType: image.MetadataType, metadata: image.Metadata) => number;
export const GetAuxiliaryPictureErrorCode: (auxType: image.AuxiliaryPictureType) => number;
export const AuxiliaryPictureWritePixelsErrorCode: (src: ArrayBuffer) => number;
export const GetHdrComposedPixelmapErrorCode: () => number;
export const CreatePictureByImageSourceWithDecodingOptionIsNull: () => number;
export const CreatePictureByImageSourceErrorCode: () => number;
export const testPackPictureToFile: (uri: string, arraySize: number, auxTypes: Array<image.AuxiliaryPictureType>,
  dynamicRange: number, needpackExif: boolean, fd: number, format: string, mode: number) => number;
export const testPackPictureToData: (uri: string, arraySize: number, auxTypes: Array<image.AuxiliaryPictureType>,
    dynamicRange: number, needpackExif: boolean, src: ArrayBuffer, format: string, mode: number) => number;
export const setAllExifKey: (keySize: number, keys: Array<string>) => number;

// test gif incomplete
export const CreateFromUri: (uri: string) => image.ImageSource;
export const GetImageInfo: (source: image.ImageSource, index:number) => InfoSize;
export const CreatePictureAtIndexByImageSource: (imageSource: image.ImageSource, index: number) => image.Picture;
export const GetAllFrameCount: (imageSource: image.ImageSource) => number;
export const GifMetadataGetProperty: (picture: image.Picture, gifPropertyKey: image.GifPropertyKey) => string;
export const GifMetadataSetProperty: (picture: image.Picture, gifPropertyKey: image.GifPropertyKey, value: string) => number;
export const HeifsMetadataGetMimetype: (imageSource: image.ImageSource) => string;
export const testCreatePixelMapGetImageInfo: (imageSource: image.ImageSource) => InfoSize;
export const GifGetMainPixelmapInfo: (picture: image.Picture) => InfoSize;
export const CreatePictureAtIndexByImageSourceError: (imageSource: image.ImageSource, flag: boolean) => number;
export const ImageSourceRelease: (imageSource: image.ImageSource) => number;
export const PictureRelease: (pciture: image.Picture) => number;

// test hdr compose with options
export const CreatePictureByImageSourceWithOptions: (imageSource: image.ImageSource) => image.Picture;
export const GetHdrComposedPixelmapWithOptions: (picture: image.Picture, pixelFormat: image.PixelMapFormat) => IImageInfo;
export const GetHdrComposedPixelmapWithOptionsError: (picture: image.Picture, pixelFormat: image.PixelMapFormat) => number;
export const GetHdrComposedPixelmapAndPixelMapTest: (picture: image.Picture) => number | string;