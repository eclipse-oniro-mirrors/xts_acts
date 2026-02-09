/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
export const GetDefaultDisplayId: () => number;
export const GetDefaultDisplayWidth: () => number;
export const GetDefaultDisplayHeight: () => number;
export const GetDefaultDisplayRotation: () => number;
export const GetDefaultDisplayOrientation: () => number;
export const GetDefaultDisplayVirtualPixelRatio: () => number;
export const GetDefaultDisplayRefreshRate: () => number;
export const GetDefaultDisplayDensityDpi: () => number;
export const GetDefaultDisplayDensityPixels: () => number;
export const GetDefaultDisplayScaledDensity: () => number;
export const GetDefaultDisplayDensityXdpi: () => number;
export const GetDefaultDisplayDensityYdpi: () => number;
export const CreateDefaultDisplayCutoutInfo: () => number;
export const DestroyDefaultDisplayCutoutInfo: () => number;
export const DestroyDefaultDisplayCutoutInfoSuccess: () => number;
export const DestroyDefaultDisplayCutoutInfoError: () => number;
export const GetFoldDisplayMode: () => number;
export const RegisterDisplayChangeListener: () => number;
export const UnRegisterDisplayChangeListener: () => number;
export const RegisterFoldDisplayModeChangeListenerNoSupport: () => number;
export const RegisterFoldDisplayModeChangeListenerInvalidParam: () => number;
export const GetAllDisplay: () => number;
export const GetDisplayById: () => number;
export const CreatePrimaryDisplay: () => number;
export const RegisterAvailableAreaChangeListener: () => number;
export const DestroyAvailableArea: () => number;
export const RegisterDisplayAddListener: () => number;
export const RegisterDisplayRemoveListener: () => number;
export const ArkuiAiAnalysisFinish: () => number;
export const ArkuiAiAnalysisDisabled: () => number;
export const ArkuiAiAnalysisUnsupported: () => number;
export const ArkuiAiAnalysisOngoing: () => number;
export const ArkuiAiAnalysisStopped: () => number;
export const ArkuiNodeUndefined: () => number;