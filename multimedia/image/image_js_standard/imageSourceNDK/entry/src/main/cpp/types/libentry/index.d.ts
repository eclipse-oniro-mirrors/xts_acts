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

interface resImageSource{
    code: number,
    result: image.ImageSource
}

interface resPixelMap{
    code: number,
    result: image.PixelMap
}

interface resPixelMapList{
    code: number,
    result: image.PixelMap[]
}

interface resPixelMapList{
    code: number,
    result: image.PixelMap[]
}

interface resFrameCount{
    code: number,
    result: number
}

interface resSupportedFormatList{
    code: number,
    result: string[]
}

interface imageSize {
    width: number;
    height: number;
}

interface imageInfo {
    pixelFormat: number;
    colorSpace: number;
    alphaType: number;
    density: number;
    size: imageSize;
}

interface resImageInfo{
    code: number,
    result: imageInfo
}

interface resImageProperty {
    code: number;
    result: string;
}

interface resValue {
    code: number;
    result: ESObject;
}

interface resDelayTimeList{
    code: number,
    result: number[]
}

export const create: (a: string | number | ArrayBufferLike, b: ESObject) => resImageSource;
export const createFromFd: (a: number, b: ESObject) => resImageSource;
export const createFromUri: (a: string, b: ESObject) => resImageSource;
export const createFromData: (a: ArrayBufferLike, b: ESObject) => resImageSource;
export const createFromRawFile: (a: ESObject, b: ESObject) => resImageSource;
export const createIncremental: (a: ESObject, b: ESObject) => resImageSource;
export const createIncrementalFromData: (a: ESObject, b: ESObject) => resImageSource;
export const initNative: (a: image.ImageSource) => resValue;
export const createPixelMap: (a: image.ImageSource, b: ESObject) => resPixelMap;
export const createPixelMapList: (a: image.ImageSource, b: ESObject) => resPixelMapList;
export const getDelayTime: (a: image.ImageSource) => resDelayTimeList;
export const getFrameCount: (a: ESObject) => resFrameCount;
export const getSupportedFormats: () => resSupportedFormatList;
export const getImageInfo: (a: ESObject, b: ESObject) => resImageInfo;
export const getImageProperty: (a: image.ImageSource, b: ESObject) => resImageProperty;
export const modifyImageProperty: (a: image.ImageSource, b: ESObject, c:ESObject) => resValue;
export const updateData: (a: ESObject, b: ESObject) => resValue;
export const release: (a: image.ImageSource) => resValue;

