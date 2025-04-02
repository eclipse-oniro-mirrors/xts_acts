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
export const add: (a: number, b: number) => number;
export const getId: () => number;
export const getWidth: () => number;
export const getHeight: () => number;
export const getRotation: () => number;
export const getOrientation: () => number;
export const getVirtualPixelRatio: () => number;
export const getRefreshRate: () => number;
export const getDensityDpi: () => number;
export const getDensityPixels: () => number;
export const getScaledDensity: () => number;
export const getDensityXdpi: () => number;
export const getDensityYdpi: () => number;
export const getCutoutInfo: () => number;
export const checkIsFoldDevice: () => boolean;
export const getDisplayMode: () => number;
export const registerDisplayChange: (callback: Function) => number;
export const unregisterDisplayChange: (registerIndex: number) => number;
export const registerFoldDisplayModeChange: (callback: Function) => number;
export const unregisterFoldDisplayModeChange: (registerIndex: number) => number;