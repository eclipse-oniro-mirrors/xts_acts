/*
 * Copyright (C) 2024-2026 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image';

export const testInitializationOptionsSetRowStrideNormal: (rowStride: number) => number;
export const testCreatePixelMapWithStrideAbnormal: () => number;
export const testNativeScaleWithAntiAliasingAbnormal: () => number;
export const testScaleWithAntiAliasingAbnormal: (x: number, y: number) => number;
export const testNativeGetNativeBufferAbnormal: () => number;
export const testNativeSetMetaDataNull: () => number;
export const testNativeGetMetaDataNull: () => number;
export const testNativeSetMemoryName: () => number;
export const testNativeGetArgbPixels: () => number;
export const testNativeGetColorSpaceNative: () => number;
export const testNativeSetColorSpaceNative: () => number;
export const testNativeSetGetSrcPixelFormat: () => number;
export const testNativeCreateEmptyPixelmap: () => number;
export const testNativeConvertAlphaFormat: () => number;
export const testNativeReadPixelsFromArea: (pixelMap: image.PixelMap, x: number, y: number, width: number,
  height: number, useNull: boolean) => number;
export const testNativeWritePixelsToArea: (pixelMap: image.PixelMap, x: number, y: number, width: number,
  height: number, pixels: ArrayBuffer, useNull: boolean) => number;
export const testNativeCreateAlphaPixelmap: (pixelMap: image.PixelMap, useNull: boolean) => number;
export const testNativeClone: (pixelMap: image.PixelMap, useNull: boolean) => number;
export const testNativeCreateCroppedAndScaledPixelMap: (pixelMap: image.PixelMap, x: number, y: number, width: number,
  height: number, scaleX: number, scaleY: number, level: number, useNull: boolean) => number;
export const testNativeCreatePixelmapFromNativeBuffer: (pixelMap: image.PixelMap, useNull: boolean) => number;
export const testNativeCreatePixelmapFromSurface: (surfaceId: string, useNull: boolean) => number;
export const testNativeGetUniqueId: (pixelMap: image.PixelMap, useNull: boolean) => number;
export const testNativeIsReleased: (pixelMap: image.PixelMap, callAfterRelease: boolean, useNull: boolean) => number;
export const createPixelmapFromSurfaceWithTransformation001: (
  surfaceId: string, transformEnabled: boolean) => number;
export const createPixelmapFromSurfaceWithTransformation002: (
  surfaceId: string, transformEnabled: boolean) => number;
export const createPixelmapFromSurfaceWithTransformation003: (
  surfaceId: string, transformEnabled: boolean) => number;
export const createPixelmapFromSurfaceWithTransformation004: (
  surfaceId: string, transformEnabled: boolean) => number;
export const createPixelmapFromSurfaceWithTransformation005: (
  surfaceId: string, transformEnabled: boolean) => number;
export const createPixelmapFromSurfaceWithTransformation006: (
  surfaceId: string, transformEnabled: boolean) => number;
  