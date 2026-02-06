/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

interface PipTemplateType {
  VIDEO_PLAY: number,
  VIDEO_CALL: number,
  VIDEO_MEETING: number,
  VIDEO_LIVE: number,
}
export const testPipTemplateTypeEnum: () => PipTemplateType;
export const testPipControlGroupEnum: () => number;
export const testPipControlTypeEnum: () => number;
export const testPipControlStatusEnum: () => number;
export const testCreatePip: (mainWindowId: number) => number;
export const testCreatePip_ControllerId_Nullptr: (mainWindowId: number) => number;
export const testCreatePip_SetPipMainWindowId_Zero: (mainWindowId: number) => number;
export const testCreatePip_SetErrPipTemplateType: (mainWindowId: number) => number;
export const testStartStopPip: (mainWindowId: number) => number;
export const testStartPipRepeat: (mainWindowId: number) => number;
export const testStopPipRepeat: (mainWindowId: number) => number;
export const testDeletePipWithStopPip: (mainWindowId: number) => number;
export const testDeletePipWithoutStopPip: (mainWindowId: number) => number;
export const testUpdatePipContentSize: (mainWindowId: number) => number;
export const testUpdatePipContentStatus: (mainWindowId: number) => number;
export const testUpdatePipContentEnabled: (mainWindowId: number) => number;
export const testRegisterStartPipCallback: (mainWindowId: number) => number;
export const testTwoRegisterStartPipCallback: (mainWindowId: number) => number;
export const testUnregisterStartPipCallback: (mainWindowId: number) => number;
export const testUnregisterAllStartPipCallbacks: (mainWindowId: number) => number;
export const testRegisterResizeListener: (mainWindowId: number) => number;
export const testTwoRegisterResizeListener: (mainWindowId: number) => number;
export const testUnregisterResizeListener: (mainWindowId: number) => number;
export const testUnregisterAllResizeListeners: (mainWindowId: number) => number;
export const testRegisterControlEventListener: (mainWindowId: number) => number;
export const testUnregisterControlEventListener: (mainWindowId: number) => number;
export const testUnregisterAllControlEventListeners: (mainWindowId: number) => number;
export const testRegisterLifeCycleListener: (mainWindowId: number) => number;
export const testTwoRegisterLifeCycleListener: (mainWindowId: number) => number;
export const testUnregisterLifeCycleListener: (mainWindowId: number) => number;
export const testUnregisterAllLifeCycleListeners: (mainWindowId: number) => number;
export const testSetPipInitialSurfaceRect: (mainWindowId: number) => number;
export const testSetPipInitialSurfaceRectwithInvalidWidth: (mainWindowId: number) => number;
export const testUnsetPipInitialSurfaceRect: (mainWindowId: number) => number;
