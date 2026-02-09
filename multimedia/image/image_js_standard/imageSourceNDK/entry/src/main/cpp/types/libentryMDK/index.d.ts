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

import image from "@ohos.multimedia.image";
import colorSpaceManager from "@ohos.graphics.colorSpaceManager";
export const JsGetImageProperty: (a: number, b: string) => number;
export const JsModifyImageProperty: (a: number, b: string, c: string) => number;
export const setDecodingOptColorSpace: (opts: image.DecodingOptions,
    colorSpace: colorSpaceManager.ColorSpace) => number;
export const setDecodingOptColorSpaceErr: (opts?: image.DecodingOptions,
    colorSpace?: colorSpaceManager.ColorSpace) => number;
export const getDecodingOptColorSpace: (opts: image.DecodingOptions) => number;
export const getDecodingOptColorSpaceErr: (opts?: image.DecodingOptions) => number;
export const getPixelMapForColorSpace: (pixelMap: image.PixelMap) => number;
export const SetDesiredDynamicRangeToDecodingOptions: (opts: image.DecodingOptions,
    desiredDynamicRange: image.DecodingDynamicRange) => number;
export const createImageSource: (fd: number) => image.ImageSource;
export const createDecodingOptions: () => image.DecodingOptions;
export const createPixelmap: (fd: number, opts: image.DecodingOptions) => image.PixelMap;
export const releaseImageSource: (imageSource: image.ImageSource) => number;
export const releaseDecodingOptions: (opts: image.DecodingOptions) => number;
export const releasePixelMap: (pixelMap: image.PixelMap) => number;
export const ModifyMakerNoteImageProperty: (imageSource: image.ImageSource, key: image.PropertyKey,
    value: string) => number;
export const GetMakerNoteImageProperty: (imageSource: image.ImageSource, key: image.PropertyKey) => string | number;
export const testPackPixelMapToFile: (pixelMap: image.PixelMap, packOpts: image.PackingOption,
    writeFd: number) => number;
export const SetMimeTypeToTestPackingOptions: (packing: image.PackingOption, format: string) => void;
export const SetQualityToTestPackingOptions: (packing: image.PackingOption, quality: number) => void;
export const SetNeedsPackPropertiesToTestPackingOptions: (packing: image.PackingOption, needpackExif: boolean) => void;
export const CreatePackingOptions: () => image.PackingOption;
export const TestGetImagePropertyShort: (fd: number, key: image.PropertyKey) => number;
export const TestGetImagePropertyLong: (fd: number, key: image.PropertyKey) => number;
export const TestGetImagePropertyDouble: (fd: number, key: image.PropertyKey) => number;
export const TestGetImagePropertyArraySize: (fd: number, key: image.PropertyKey) => number;
export const TestGetImagePropertyString: (fd: number, key: image.PropertyKey, size: number) => string | number;
export const TestGetImagePropertyIntArray: (fd: number, key: image.PropertyKey, size: number) => Array<number> | number;
export const TestGetImagePropertyDoubleArray: (fd: number, key: image.PropertyKey, size: number) => Array<number> | number;
export const TestGetImagePropertyBlob: (fd: number, key: image.PropertyKey, size: number) => ArrayBuffer | number;
export const TestGetImagePropertyError: (type: string) => number;
export const TestModifyImagePropertyShort: (fd: number, key: image.PropertyKey, value: number) => number;
export const TestModifyImagePropertyLong: (fd: number, key: image.PropertyKey, value: number) => number;
export const TestModifyImagePropertyDouble: (fd: number, key: image.PropertyKey, value: number) => number;
export const TestModifyImagePropertyIntArray: (fd: number, key: image.PropertyKey, arrayValue: Array<number>) => number;
export const TestModifyImagePropertyDoubleArray: (fd: number, key: image.PropertyKey, arrayValue: Array<number>) => number;
export const TestModifyImagePropertyBlob: (fd: number, key: image.PropertyKey, value: ArrayBuffer) => number;
export const TestModifyImagePropertyError: (type: string) => number;
