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
import display from '@ohos.display';
import { image } from '@kit.ImageKit';
export const add: (a: number, b: number) => number;
export const getPrimaryDisplay: () => display.Display;
export const getAllDisplay: () => Array<display.Display>;
export const getDisplayById: (displayId: number) => display.Display;
export const destroyDisplayWithoutCreate: () => number;
export const getDisplayState_UNKNOWN: () => number;
export const getDisplayState_OFF: () => number;
export const getDisplayState_ON: () => number;
export const getDisplayState_DOZE_SUSPEND: () => number;
export const getDisplayState_ON_SUSPEND: () => number;
export const getDisplayState_DOZE: () => number;
export const getDisplayState_VR: () => number;
export const getDisplayCapture: (displayId:number) => image.PixelMap;
