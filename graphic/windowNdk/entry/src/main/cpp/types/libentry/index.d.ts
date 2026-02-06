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
import multimedia_image from '@ohos.multimedia.image';
import window from '@ohos.window';
export interface WindowNdkResult{
    isShow:number;
    resultCode:number
}
interface WindowManager_Rect{
    left:number;
    top:number;
    width:number;
    height:number;
}
interface AvoidArea{
    leftRect:WindowManager_Rect;
    topRect:WindowManager_Rect;
    rightRect:WindowManager_Rect;
    bottomRect:WindowManager_Rect;
}
export enum WindowManager_WindowType{
    TYPE_SYSTE = 0,
    TYPE_CUTOUT = 1,
    TYPE_SYSTEM_GESTURE = 2,
    TYPE_KEYBOARD = 3,
    TYPE_NAVIGATION_INDICATOR = 4
}


export const filterKeyCode: (a: number, b: number) => number;
export const unFilterKeyCode: (a: number) => number;
export const isWindowShown: (a: number) => WindowNdkResult;
export const showWindow: (a: number) => WindowNdkResult;
export const setWindowStatusBarEnabled: (windowId: number, enabled: boolean,enableAnimation: boolean) => number;
export const setWindowNavigationBarEnabled: (windowId: number, enabled: boolean,enableAnimation: boolean) => number;
export const setWindowStatusBarColor: (windowId: number, color: number) => string;
export const getAvoidAreaByType: (windowId: number, type: WindowManager_WindowType) => AvoidArea;
export const setBackgroundColor: (windowId: number, color: string) => number;
export const setBrightness: (windowId: number, brightness: number) => number;
export const setKeepScreenOn: (windowId: number, isKeepScreenOn: boolean) => number;
export const setWindowPrivacyMode: (windowId: number, isPrivacy: boolean) => number;
export const snapshot: (windowId: number) => multimedia_image.PixelMap;
export const setWindowFocusable: (windowId: number, isFocusable: boolean) => number;
export const setWindowTouchable: (windowId: number, isTouchable: boolean) => number;
export const getWindowPorperties: (windowId: number) => window.WindowProperties;
export const registerMouseFilter: (windowId: number) => number;
export const clearMouseFilter: (windowId: number) => number;
export const registerTouchFilter: (windowId: number) => number;
export const clearTouchFilter: (windowId: number) => number;
export const getAllWIndowLayOutInfo: (displayId:number) => WindowManager_Rect[];
export const testInjectTouchEventwithTouchEventNullptr: (windowId: number) => number;
export const testInjectTouchEventwithTouchEventActionOutofRange: (windowId: number) => number;
export const testInjectTouchEventwithWindowidNotloadcontent: (windowId: number) => number;
export const testInjectTouchEventwithDestoryedSubwindow: (windowId: number) => number;
export const testInjectTouchEventwithWindowXWindowYBeyondScreen: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithFloatWindowXWindowY: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithNonExistedWindowID: (windowId: number) => number;
export const testInjectTouchEventwithFloatWindowID: (windowId: number, width: number, height: numbe) => number;
export const testInjectTouchEventwithNegativeWindowID: () => number;
export const testInjectTouchEventwithTouchActionCancel: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithTouchActionDown: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithTouchActionMove: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithTouchActionUp: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithMainWindowClick: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithSubWindowClick: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithDialogWindowClick: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithSubWindowSlide: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithSubWindowEdgeSlide: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithSubWindowButtonDownCancle: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithSubWindowSlideDownCancle: (windowId: number, width: number, height: number) => number;
export const testInjectTouchEventwithHideSubWindowDown: (windowId: number, width: number, height: number) => number;

