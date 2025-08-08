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

export const webErrCodeSuccess: () => number;
export const webInitError: () => number;
export const webErrorUnknow: () => number;
export const webErrorInvalidParam: () => number;
export const webErrorSchemeRegitsterFailed: () => number;
export const webErrorInvaledURL: () => number;
export const webErrorInvaledCookieValue: () => number;
export const webErrorLibraryOpenFailure: () => number;
export const webErrorLibraySymbolNotFound: () => number;
export const webErrorCookeManagerNotInitialized: () => number;
export const webBlanklessSuccess: () => number;
export const webBlanklessErrUnknown: () => number;
export const webBlanklessErrInvalidArgs: () => number;
export const webBlanklessErrControllerNotInited: () => number;
export const webBlanklessErrKeyNotMatch: () => number;
export const webBlanklessErrSignificantChange: () => number;
export const webBlanklessDeviceNotSupport: () => number;
export const webAnyNativeAPI: () => number;
export const webNativeComponent: () => number;
export const webNativeController: () => number;
export const webNativeWebMessagePort: () => number;
export const webNativeWebMessage: () => number;
export const webNativeCookieManger: () => number;
export const webNativeJavaScriptValue: () => number;
export const webNetErrorResponeseSetError: (errName: string) => number;
export const webArkWebResponseGetError: (errName: string) => number;
export const NativeArkWebLoadDataInitError: () => number;
export const loadData: (webName: string, caseNum: number) => number;
export const GetBlanklessInfo: (webName: string, key: string) => number;
export const SetBlanklessInfo: (webName: string, key: string) => number;
export const JSBridgeData: (caseNum: number) => number;
export const JSBridgeProxyData: (caseNum: number) => number;
export const webArkWebConnectError: (errName: string) => number;
export const webArkWebSSLError: (errName: string) => number;















