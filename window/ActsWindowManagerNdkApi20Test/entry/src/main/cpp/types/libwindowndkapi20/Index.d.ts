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

export const GetWindowId: (windowId: number) => void;
export const GetMainWindowId: (windowId: number) => void;
export const GetDisplayId: (displayId: number) => void;
export const SetWindowStatusBarEnabledInvalidParam: () => number;
export const SetWindowStatusBarEnabledSystemAbnormal: () => number;
export const GetWindowAvoidAreaInvalidParam: () => number;
export const IsWindowShownInvalidParam: () => number;
export const GetWindowPropertiesInvalidParam: () => number;
export const SnapshotOk: () => number;
export const SnapshotInvalidParam: () => number;
export const SnapshotStateAbnormal: () => number;
export const GetAllWindowLayoutInfoListParameterOverride: () => number;
export const GetAllWindowLayoutInfoListOkOrDeviceNotSupported: () => number;
export const InjectTouchEventParameterOverride: () => number;
export const InjectTouchEventSystemAbnormal: () => number;
export const InjectTouchEventStateAbnormal: () => number;
export const SetWindowPrivacyModeNoPermission: () => number;
export const WindowManagerErrorCodeOk: () => number;
export const WindowManagerErrorCodeNoPermission: () => number;
export const WindowManagerErrorCodeInvalidParam: () => number;
export const WindowManagerErrorCodeDeviceNotSupported: () => number;
export const WindowManagerErrorCodeInvalidWindowId: () => number;
export const WindowManagerErrorCodeStateAbnormal: () => number;
export const WindowManagerErrorCodeSystemAbnormal: () => number;
export const GetWindowAvoidAreaType: (index: numebr) => number;
export const GetWindowType: (index: numebr, windowId: number) => number;
export const RegisterMouseEventFilterOkOrServiceError: () => number;
export const RegisterMouseEventFilterInvaildWindowId: () => number;
export const UnregisterMouseEventFilterOkOrServiceError: () => number;
export const UnregisterMouseEventFilterInvaildWindowId: () => number;
export const RegisterTouchEventFilterOkOrServiceError: () => number;
export const RegisterTouchEventFilterInvaildWindowId: () => number;
export const UnregisterTouchEventFilterOkOrServiceError: () => number;
export const UnregisterTouchEventFilterInvaildWindowId: () => number;

export const CreatePipConfigOk: () => number;
export const CreatePipConfigIncorrectParam: () => number;
export const SetPipMainWindowIdOkOrDeviceNotSupported: () => number;
export const SetPipMainWindowIdIncorrectParam: () => number;
export const SetPipTemplateTypeOkOrDeviceNotSupported: () => number;
export const SetPipTemplateTypeIncorrectParam: () => number;
export const SetPipRectOkOrDeviceNotSupported: () => number;
export const SetPipRectIncorrectParam: () => number;
export const SetPipControlGroupOkOrDeviceNotSupported: () => number;
export const SetPipControlGroupIncorrectParam: () => number;
export const SetPipNapiEnvOkOrDeviceNotSupported: () => number;
export const SetPipNapiEnvIncorrectParam: () => number;
export const CreatePipOkOrDeviceNotSupported: () => number;
export const CreatePipPipInternalError: () => number;
export const StartPipPipCreateFailed: () => number;
export const StartPipIncorrectParam: () => number;
export const StartPipPipStateAbnormal: () => number;
export const StartPipPipInternalError: () => number;
export const StopPipIncorrectParam: () => number;
export const StopPipPipDestroyFailed: () => number;
export const StopPipInternalError: () => number;
export const UpdatePipContentSizeIncorrectParam: () => number;
export const UpdatePipContentSizeInternalError: () => number;
export const UpdatePipControlStatusIncorrectParam: () => number;
export const UpdatePipControlStatusInternalError: () => number;
export const SetPipControlEnabledIncorrectParam: () => number;
export const SetPipControlEnabledInternalError: () => number;
export const SetPipInitialSurfaceRectParameterOverride: () => number;
export const SetPipInitialSurfaceRectOk: () => number;
export const SetPipInitialSurfaceRectIncorrectParam: () => number;
export const SetPipInitialSurfaceRectPipInternalError: () => number;
export const UnsetPipInitialSurfaceRectParameterOverride: () => number;
export const UnsetPipInitialSurfaceRectOk: () => number;
export const UnsetPipInitialSurfaceRectIncorrectParam: () => number;
export const UnsetPipInitialSurfaceRectPipInternalError: () => number;
export const RegisterStartPipCallbackOkOrDeviceNotSupported: () => number;
export const RegisterStartPipCallbackIncorrectParam: () => number;
export const RegisterStartPipCallbackInternalError: () => number;
export const UnregisterStartPipCallbackOkOrDeviceNotSupported: () => number;
export const UnregisterStartPipCallbackIncorrectParam: () => number;
export const UnregisterStartPipCallbackInternalError: () => number;
export const UnregisterAllStartPipCallbacksOkOrDeviceNotSupported: () => number;
export const UnregisterAllStartPipCallbacksIncorrectParam: () => number;
export const UnregisterAllStartPipCallbacksInternalError: () => number;
export const RegisterLifecycleListenerOkOrDeviceNotSupported: () => number;
export const RegisterLifecycleListenerIncorrectParam: () => number;
export const RegisterLifecycleListenerInternalError: () => number;
export const UnregisterLifecycleListenerOkOrDeviceNotSupported: () => number;
export const UnregisterLifecycleListenerIncorrectParam: () => number;
export const UnregisterLifecycleListenerInternalError: () => number;
export const UnregisterAllLifecycleListenersOkOrDeviceNotSupported: () => number;
export const UnregisterAllLifecycleListenersIncorrectParam: () => number;
export const UnregisterAllLifecycleListenersInternalError: () => number;
export const RegisterControlEventListenerOkOrDeviceNotSupported: () => number;
export const RegisterControlEventListenerIncorrectParam: () => number;
export const RegisterControlEventListenerInternalError: () => number;
export const UnregisterControlEventListenerOkOrDeviceNotSupported: () => number;
export const UnregisterControlEventListenerIncorrectParam: () => number;
export const UnregisterControlEventListenerInternalError: () => number;
export const UnregisterAllControlEventListenersOkOrDeviceNotSupported: () => number;
export const UnregisterAllControlEventListenersIncorrectParam: () => number;
export const UnregisterAllControlEventListenersInternalError: () => number;
export const RegisterResizeListenerOkOrDeviceNotSupported: () => number;
export const RegisterResizeListenerIncorrectParam: () => number;
export const RegisterResizeListenerInternalError: () => number;
export const UnregisterResizeListenerOkOrDeviceNotSupported: () => number;
export const UnregisterResizeListenerIncorrectParam: () => number;
export const UnregisterResizeListenerInternalError: () => number;
export const UnregisterAllResizeListenersOkOrDeviceNotSupported: () => number;
export const UnregisterAllResizeListenersIncorrectParam: () => number;
export const UnregisterAllResizeListenersInternalError: () => number;
export const WindowManagerErrorCodeCreateFailed: () => number;
export const WindowManagerErrorCodePipStateAbnormal: () => number;
export const WindowManagerErrorCodePipRepeatedOperation: () => number;
export const WindowManagerErrorCodeIncorrectParam: () => number;
export const PictureInPicturePipStatePart1: () => number;
export const PictureInPicturePipStatePart2: () => number[];

export const CaptureScreenPixelmapInvalidParamOrDeviceNotSupported: () => number;
export const CaptureScreenPixelmapNoPermission: () => number;

export const GetDisplaySourceMode: (id: number) => number;
export const GetDisplaySourceMode001: (id: number) => number;
export const GetDisplaySourceMode002: () => number;
export const GetDisplaySourceMode003: (id: number) => number;
export const GetFoldDisplayMode: (id: number) => number;
export const DisplayManagerErrorCode401: () => number;
export const DisplayManagerErrorCode801: (id: number) => number;
export const DisplayManagerErrorCode1400001: (id: number) => number;
export const DisplayManagerErrorCode1400003: () => number;
export const DisplayManagerErrorCode1400004: () => number;