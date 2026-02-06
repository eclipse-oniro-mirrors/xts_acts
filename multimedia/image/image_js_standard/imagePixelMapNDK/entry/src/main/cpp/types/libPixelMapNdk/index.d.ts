/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
interface imageInfo {
    width: number;
    height: number;
    stride: number;
}

interface myRegion {
    x: number,
    y: number,
    width: number,
    height: number
}
interface decodeOptions {
  width?: number,
  height?: number,
  pixelFormat?: image.PixelMapFormat,
  desiredRegion?: myRegion,
  cropAndScaleStrategy?: image.CropAndScaleStrategy,
  dynamicRange?: image.DecodingDynamicRange,
  mimeType?: string
}

//DMA TEST
export const CreatePixelMapUsingAllocator: (path: string, alloType: image.AllocatorType,
    size?: image.Size, pixelMapFormat?: image.PixelMapFormat, desiredDynamicRange?: image.DecodingDynamicRange) => number;
export const GetPixelmapInfo: () => imageInfo;
export const CreatePixelMapUsingAllocatorError: (path: string, alloType: image.AllocatorType) => number;

// Test decoding large images
export const CreatePixelMapAndGetInfo: (filePath: string, decodeOptions?: decodeOptions) => decodeOptions | number;
export const CreatePixelMapForDMAAndGetInfo: (filePath: string, allocatorType: image.AllocatorType, decodeOptions?: decodeOptions) => decodeOptions | number;