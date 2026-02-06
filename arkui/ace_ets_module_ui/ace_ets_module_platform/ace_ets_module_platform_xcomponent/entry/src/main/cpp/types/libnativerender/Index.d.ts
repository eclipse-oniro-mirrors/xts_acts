/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
type XComponentContextStatus = {
  hasDraw: boolean,
  hasChangeColor: boolean,
};
export const SetSurfaceId: (id: BigInt) => any;
export const ChangeSurface: (id: BigInt, w: number, h: number) =>any;
export const DrawPattern: (id: BigInt) => any;
export const GetXComponentStatus: (id: BigInt) => XComponentContextStatus
export const ChangeColor: (id: BigInt) => any;
export const DestroySurface: (id: BigInt) => any;

export const bindNode: (id: string, node: object) => void;
export const unbindNode: (id: string) => void;
export const drawStar: (id: string) => void;

export const TestSetSurfaceConfigErrorCode001: (id: string) => void;
export const TestSetSurfaceConfigErrorCode002: (id: string) => void;
export const TestSurfaceConfigCreateReturnNoNullptr: () => void;

export const CreateKeyMouseEventNativeRoot: (content: NodeContent, tag: string) => void;
export const getKeyStr: () => string;
export const getIndicatorStr: () => string;
export const getMouseStr: () => string;
export const TestGetExtraMouseEventInfoErrorCode_01: () => void;
export const TestGetExtraMouseEventInfoErrorCode_02: () => void;
export const TestGetMouseEventModifierKeyStatesErrorCode_01: () => void;
export const TestGetMouseEventModifierKeyStatesErrorCode_02: () => void;
export const TestGetKeyEventModifierKeyStatesErrorCode_01: () => void;
export const TestGetKeyEventModifierKeyStatesErrorCode_02: () => void;
export const TestGetKeyEventNumLockStateErrorCode_01: () => void;
export const TestGetKeyEventNumLockStateErrorCode_02: () => void;
export const TestGetKeyEventCapsLockStateErrorCode_01: () => void;
export const TestGetKeyEventCapsLockStateErrorCode_02: () => void;
export const TestGetKeyEventScrollLockStateErrorCode_01: () => void;
export const TestGetKeyEventScrollLockStateErrorCode_02: () => void;
export const TestRegisterKeyEventCallbackWithResult_01: () => void;
export const TestRegisterKeyEventCallbackWithResult_02: () => void;
export const TestGetTouchPointErrorCode_01: () => void;
export const TestGetTouchPointErrorCode_02: () => void;
export const TestRegisterUIInputEventCallbackErrorCode_01: () => void;
export const TestRegisterUIInputEventCallbackErrorCode_02: () => void;
export const TestRegisterOnTouchInterceptCallbackErrorCode_01: () => void;
export const TestRegisterOnTouchInterceptCallbackErrorCode_02: () => void;
export const TestGetNativeAccessibilityProviderErrorCode_01: () => void;
export const TestGetNativeAccessibilityProviderErrorCode_02: () => void;

export const TestAttachNativeRootNodeErrorCode001: (id: string) => void;
export const TestAttachNativeRootNodeErrorCode002: (id: string) => void;
export const TestGetNativeXComponentReturnNull: (id: string) => void;
export const TestSurfaceHolderCreateReturnNull: (id: string) => void;
export const TestSurfaceHolderGetUserDataReturnNull: (id: string) => void;
export const TestSurfaceCallbackCreateReturnNull: (id: string) => void;
export const TestXComponentGetNativeWindowReturnNull: (id: string) => void;

export const CreateNodeContentTestNativeRoot: (content: NodeContent) => void;
export const NodeContentEventGetEventType: () => void;