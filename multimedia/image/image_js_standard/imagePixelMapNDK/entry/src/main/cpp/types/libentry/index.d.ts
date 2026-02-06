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

interface pixelMapPots {
  width: number,
  height: number,
  pixelFormat: number,
  editable: number,
  alphaType: number,
  scaleMode: number
}

interface pixelMapProperty {
  width: number;
  height: number;
  pixelFormat: number
}

type CallbackFunctionWithNumber = (param: number) => boolean;
export const JsNativeToNapi: (a: number, b: number) => image.PixelMap;
export const JsNapiToNative_ReturnProperty: (a: image.PixelMap) => pixelMapProperty;
export const createPixelMap: (a: ArrayBuffer, b:pixelMapPots) => image.PixelMap;
export const initNativePixelMap: (a: image.PixelMap, ...params: any[]) => number;
export const createAlphaPixelMap: (a: image.PixelMap, ...params: any[]) => number;
export const getBytesNumberPerRow: (a: image.PixelMap, ...params: any[]) => number;
export const getIsEditable: (a: image.PixelMap, ...params: any[]) => number;
export const isSupportAlpha: (a: image.PixelMap, ...params: any[]) => number;
export const setAlphaAble: (a: image.PixelMap, ...params: any[]) => number;
export const setDensity: (a: image.PixelMap, ...params: any[]) => number;
export const getDensity: (a: image.PixelMap, ...params: any[]) => number;
export const setOpacity: (a: image.PixelMap, ...params: any[]) => number;
export const scale: (a: image.PixelMap, ...params: any[]) => number;
export const translate: (a: image.PixelMap, ...params: any[]) => number;
export const rotate: (a: image.PixelMap, ...params: any[]) => number;
export const flip: (a: image.PixelMap, ...params: any[]) => number;
export const crop: (a: image.PixelMap, ...params: any[]) => number;
export const getImageInfo: (a: image.PixelMap, ...params: any[]) => number;
export const accessPixels: (a: image.PixelMap, ...params: any[]) => number;
export const unAccessPixels: (a: image.PixelMap, ...params: any[]) => number;