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

export interface myObj {
  errcode: number;
  left: number;
  top: number;
  width: number;
  height: number;
}
export const createAvailableArea: () => myObj;
export const createAvailableArea_ErrCode140004: () => number;
export const destroyAvailableArea: () => number;
export const getDisplaySourceMode_1: () => number;
export const getDisplaySourceMode_2: (id: number) => number;
export const getDisplaySourceMode_4: (id: number) => number;
export const getDisplaySourceMode_ErrCode140004: () => number;
export const getDisplayPosition: () => number;
export const getDisplayPosition_ErrCode140004: () => number;
export const registerAvailableAreaChangeListener: () => number;
export const unregisterAvailableAreaChangeListener: () => number;
export const unregisterAvailableAreaChangeListener_ErrCode140004: () => number;
export const registerDisplayAddListener: () => number;
export const unregisterDisplayAddListener: () => number;
export const unregisterDisplayAddListener_ErrCode140004: () => number;
export const registerDisplayRemoveListener: () => number;
export const unregisterDisplayRemoveListener: () => number;
export const registerDisplayRemoveListener_ErrCode140004: () => number;

export const testNativeDisplayManager_ErrorCode_enum: () => number;
export const testNativeDisplayManager_FoldDisplayMode_enum: () => number;
export const testNativeDisplayManager_SourceMode_enum: () => number;
