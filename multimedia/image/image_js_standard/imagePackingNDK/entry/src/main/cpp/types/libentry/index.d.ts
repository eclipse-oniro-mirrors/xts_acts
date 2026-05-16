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
import { image } from "@kit.ImageKit"

interface imagePacker {
  code: number;
  result: image.imagePacker;
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

export const JsPackToFileMultiFrames: (a: packConfig_options, b: number, c: number, d: number) => imagePacker;

export const JsPackToDataMultiFrames: (a: number, b: packConfig_options, c: number) => imagePacker;

export const JsPackToFileMultiFramesError: (a: packConfig_options, b: number, c: number, d: number,
  e: number) => imagePacker;

export const JsPackToDataMultiFramesError: (a: number, b: packConfig_options, c: number, d: number) => imagePacker;

export const create: () => imagePacker;

export const packToFile: (a: image.imagePacker, b: image.ImageSource | image.PixelMap, c: number,
  d: image.PackingOption | PackingOption_format | PackingOption_quality) => imagePacker;

export const packToData: (a: image.imagePacker, b: image.ImageSource | image.PixelMap,
  c: image.PackingOption | PackingOption_format | PackingOption_quality) => imagePacker;

export const release: (a: image.imagePacker) => imagePacker;

export const initNative: (a: image.ImagePacker) => imagePacker;