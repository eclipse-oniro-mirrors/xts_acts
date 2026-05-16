/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
import { NodeContent } from '@ohos.arkui.node'

export const bindNode: (id: string, node: object) => void;
export const unbindNode: (id: string) => void;
export const setNeedSoftKeyboard: (id: string, needSoftKeyborad: boolean) => void;
export const disposeProvider: (id: string) => void;
export const createProvider: (id: string) => void;
export const registerFrameCallback: (id: string) => void;
export const unregisterFrameCallback: (id: string) => void;
export const TestSetExpectedFrameRateRangeErrorCode_001: (id: string) => void;
export const TestSetExpectedFrameRateRangeErrorCode_002: (id: string) => void;
export const TestRegisterOnFrameCallbackErrorCode_001: (id: string) => void;
export const TestRegisterOnFrameCallbackErrorCode_002: (id: string) => void;
export const TestUnregisterOnFrameCallbackErrorCode_001: (id: string) => void;
export const TestUnregisterOnFrameCallbackErrorCode_002: (id: string) => void;
export const TestSetNeedSoftKeyboardErrorCode_001: (id: string) => void;
export const TestSetNeedSoftKeyboardErrorCode_002: (id: string) => void;

export const createNativeNode: (content: NodeContent) => void;
export const getKeyStr: () => string;
export const getIndicatorStr: () => string;
export const getMouseStr: () => string;
export const createCrossLanguageXComponentNativeNode: (content: NodeContent, tag: string) => void;
export const crossLanguageSetXComponentAttribute: (nodeId: string) => void;