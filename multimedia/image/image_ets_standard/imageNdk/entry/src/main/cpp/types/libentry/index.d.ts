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

interface IImageInfo {
  width: number;
  height: number;
  rowStride: number;
  pixelFormat: number;
  alphaType: number
}

export const testInitializationOptions: (width: number, height: number, pixelFormat: number, alphaType: number) => number;
export const testCreatePixelmap: (width: number, height: number, pixelFormat: number, alphaType: number) => number;
export const testReadPixels: (buffer: ArrayBuffer) => number;
export const testWritePixels: (buffer: ArrayBuffer) => number;
export const testGetImageInfo: () => IImageInfo;
export const testOpacity: (rate: number) => number;
export const testScale: (x: number, y: number) => number;
export const testTranslate: (x: number, y: number) => number;
export const testRotate: (angle: number) => number;
export const testFlip: (horizontal: boolean, vertical: boolean) => number;
export const testCrop: (x: number, y: number,width : number,height : number) => number;
export const testSavePixelmap: (fileName: string) => number;
export const testCreatePixelmapWithData: (data: ArrayBuffer, width: number, height: number, pixelFormat: number, alphaType: number) => number;
export const testReleasePixelmap: () => number;

export const CreateImageInfo: () => image.ImageInfo;
export const ImageInfoGetWidth: (imageInfo:image.ImageInfo) => Number;
export const ImageInfoGetHeight: (imageInfo:image.ImageInfo) => Number;
export const ReleaseImageInfo: (imageInfo:image.ImageInfo) => Number;
export const CreateDecodingOptions: () => image.DecodingOptions;
export const DecodingOptionsGetPixelFormat: (options: image.DecodingOptions) => Number;
export const DecodingOptionsSetPixelFormat: (options: image.DecodingOptions, pixelFormat:number) => Number;
export const DecodingOptionsGetIndex: (options: image.DecodingOptions) => number;
export const DecodingOptionsSetIndex: (options: image.DecodingOptions, index:number) => Number;
export const DecodingOptionsGetRotate: (options: image.DecodingOptions) => number;
export const DecodingOptionsSetRotate: (options: image.DecodingOptions, rotate:number) => Number;
export const DecodingOptionsGetDesiredSize: (options: image.DecodingOptions) => image.Size;
export const DecodingOptionsSetDesiredSize: (options: image.DecodingOptions, width:number, height:number) => Number;
export const DecodingOptionsGetDesiredRegion: (options: image.DecodingOptions) => image.Region;
export const DecodingOptionsSetDesiredRegion: (options: image.DecodingOptions, x:number, y:number, wihth:number,
                                               height:number) => Number;
export const ReleaseDecodingOptions: (options: image.DecodingOptions) => Number;
export const CreateFromUri: (uri: string) => image.ImageSource;
export const CreateFromFd: (fd: number) => image.ImageSource;
export const CreateFromData: (buf: ArrayBufferLike) => image.ImageSource;
export const CreateFromRawFile: (fd: number, offset: number, length: number) => image.ImageSource;
export const CreatePixelMap: (source: image.ImageSource, options?: image.DecodingOptions) => image.PixelMap | number;
export const CreatePixelMapList: (source: image.ImageSource, options: image.DecodingOptions) => Array<image.PixelMap> |
number;
export const GetDelayTime: (source: image.ImageSource) => Array<number> |number;
export const GetImageInfo: (source: image.ImageSource, index:number) => image.ImageInfo | number;
export const GetImageProperty: (source: image.ImageSource,key:string) => String | number;
export const ModifyImageProperty: (source: image.ImageSource,key: string, value: string)=> Number;
export const GetFrameCount: (source: image.ImageSource) => Array<number>;
export const SourceRelease: (source: image.ImageSource) => Number;
export const PixelMapRelease: (source: image.PixelMap) => Number;

export const CreatePackingOptions: () => image.PackingOption;
export const PackingOptionsGetMimeType: (packing:image.PackingOption) => String;
export const PackingOptionsSetMimeType: (packing:image.PackingOption, mimeType:String) => number;
export const PackingOptionsGetQuality: (packing:image.PackingOption) => String;
export const PackingOptionsSetQuality: (packing:image.PackingOption, mimeType:number) => number;
export const ReleasePackingOptions: (packing:image.PackingOption) => number;
export const PackerCreate: () => image.ImagePacker;
export const PackToDataFromImageSource: (packer:image.ImagePacker, packing:image.PackingOption,
                                         source: image.ImageSource, buffer:ArrayBuffer) => number;
export const PackToDataFromPixelMap: (packer:image.ImagePacker, packing:image.PackingOption,
                                      source: image.PixelMap | number, buffer:ArrayBuffer) => number;
export const PackToFileFromImageSource: (packer:image.ImagePacker, packing:image.PackingOption,
                                         source: image.ImageSource, fd:number) => number;
export const PackToFileFromPixelMap: (packer:image.ImagePacker, packing:image.PackingOption,
                                      source: image.PixelMap | number, fd:number) => number;
export const PackerRelease: (Packer:image.ImagePacker) => number;
export const CheckHasHdr: () => number;
export const DecodingOptionsSetDesiredDynamicRange: (options: image.DecodingOptions, desiredDynamicRange:number) => number;
export const DecodingOptionsGetDesiredDynamicRange: (options: image.DecodingOptions) => number;
export const GetImageSourceDynamicRange: (source: image.ImageSource) => number;
export const GetPixelMapDynamicRange: (source: image.PixelMap) => number;
export const PixelMapToSdr: (source: image.PixelMap) => number;
export const PackingOptionsGetDesiredDynamicRange: (packing:image.PackingOption) => number;
export const PackingOptionsSetDesiredDynamicRange: (packing:image.PackingOption, dynamicRange:number) => number;
export const PackingOptionsGetNeedsPackProperties: (packing:image.PackingOption) => number;
export const PackingOptionsSetNeedsPackProperties: (packing:image.PackingOption, needsPackProperties:number) => number;