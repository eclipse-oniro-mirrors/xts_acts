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
interface imageInfo {
    width: number;
    height: number;
    stride: number;
}
//DMA TEST
import image from "@ohos.multimedia.image";
export const CreatePixelMapUsingAllocator: (path: string, alloType: image.AllocatorType,
    size?: image.Size, pixelMapFormat?: image.PixelMapFormat, desiredDynamicRange?: image.DecodingDynamicRange) =>  number;
export const GetPixelmapInfo: () => imageInfo;
export const CreatePixelMapUsingAllocatorError: (path: string, alloType: image.AllocatorType) => number;

//ARGB TEST
export const CreatePixelMapByImageSourceFromUri: (uri: string, pixelFormat: image.PixelMapFormat,
    alloType: boolean, DynamicRange: image.DecodingDynamicRange, allocatorType: image.AllocatorType) => image.PixelMap;
export const CreatePixelMapByImageSourceFromBuffer:(buffer: ArrayBuffer, pixelFormat: image.PixelMapFormat) => image.PixelMap;
export const GetPixelmapPixelFormat: (pixelMap: image.PixelMap) => image.PixelMapFormat;
export const PixelMapRelease: (pixelMap: image.PixelMap) => number;
export const PackPixelMapToData: (pixelMap: image.PixelMap, packing:image.PackingOption, dst: ArrayBuffer) => number;
export const PackPixelMapToFile: (pixelMap: image.PixelMap, packing:image.PackingOption, fd: number) => number;
export const CreatePackingOptions: () => image.PackingOption;
export const SetMimeTypeToTestPackingOptions: (packing:image.PackingOption, format: string) => void;
export const SetDynamicRangeToTestPackingOptions: (packing:image.PackingOption, dynamicRange: number) => void;
export const SetQualityToTestPackingOptions: (packing:image.PackingOption, quality: number) => void;
export const SetNeedsPackPropertiesToTestPackingOptions: (packing:image.PackingOption, needpackExif: boolean) => void;
export const PackingOptionsRelease: (packingOption: image.PackingOption) => number;