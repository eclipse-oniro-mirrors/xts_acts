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

import { resourceManager } from '@kit.LocalizationKit';

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
export const webArkWebNetError: (errName: string) => number;
export const webRegisterCustomSchemes: (shemName: string) => number;
export const NativeArkWebLoadDataInitError: () => number;
export const loadData: (webName: string, caseNum: number) => number;
export const GetBlanklessInfo: (webName: string, caseNum: number) => number;
export const SetBlanklessInfo: (webName: string, caseNum: number) => number;
export const JSBridgeData: (caseNum: number) => number;
export const JSBridgeProxyData: (caseNum: number) => number;
export const WebMsgType: (caseNum: number) => number;
export const WebMsgAPI: (caseNum: number) => number;
export const WebJSValueAPI: (caseNum: number) => number;
export const WebJSValueType: (caseNum: number) => number;
export const WebControllerAPI: (caseNum: number) => number;
export const WebJSObject: (caseNum: number) => number;
export const WebStructProxyMethod: (caseNum: number) => number;
export const WebStructProxyMethodWithResult: (caseNum: number) => number;
export const WebStructProxyObject: (caseNum: number) => number;
export const WebStructProxyObjectWithResult: (caseNum: number) => number;
export const WebStructComponentAPI: (caseNum: number) => number;
export const WebStructMessagePortAPI: (caseNum: number) => number;
export const WebStructCookieManagerAPI: (caseNum: number) => number;
export const WebStructJavaScriptValueAPI: (caseNum: number) => number;
export const WebRegisterJSProxy: (webName: string, caseNum: number) => number;
export const WebClearBlankCache: (caseNum: number) => number;
export const WebSetBlankCacheCap: (caseNum: number) => number;
export const WebSaveCookieAsync: (caseNum: number) => number;
export const WebSaveCookieSync: (caseNum: number) => number;
export const OH_ArkWeb_RegisterCustomSchemes0100: () => number;
export const OH_ArkWeb_RegisterCustomSchemes0101: () => number;
export const OH_ArkWebServiceWorker_ClearSchemeHandlers0100: () => number;
export const OH_ArkWeb_ClearSchemeHandlers0100: () => number;
export const OH_ArkWeb_ClearSchemeHandlers0101: () => number;
export const OH_ArkWebSchemeHandler_SetUserData0100: () => number;
export const OH_ArkWebSchemeHandler_SetUserData0101: () => number;
export const OH_ArkWebSchemeHandler_SetOnRequestStart0100: () => number;
export const OH_ArkWebSchemeHandler_SetOnRequestStart0101: () => number;
export const OH_ArkWebSchemeHandler_SetOnRequestStop0100: () => number;
export const OH_ArkWebSchemeHandler_SetOnRequestStop0101: () => number;
export const OH_ArkWebResponse_SetUrl0100: () => number;
export const OH_ArkWebResponse_SetUrl0101: () => number;
export const OH_ArkWebResponse_SetError0100: () => number;
export const OH_ArkWebResponse_SetStatus0100: () => number;
export const OH_ArkWebResponse_SetStatus0101: () => number;
export const OH_ArkWebResponse_SetStatusText0100: () => number;
export const OH_ArkWebResponse_SetStatusText0101: () => number;
export const OH_ArkWebResponse_SetMimeType0100: () => number;
export const OH_ArkWebResponse_SetMimeType0101: () => number;
export const OH_ArkWebResponse_SetCharset0100: () => number;
export const OH_ArkWebResponse_SetCharset0101: () => number;
export const OH_ArkWebResponse_SetHeaderByName0100: () => number;
export const OH_ArkWebResponse_SetHeaderByName0101: () => number;
export const OH_ArkWebResourceHandler_Destroy0100: () => number;
export const OH_ArkWebResourceHandler_DidReceiveResponse0100: () => number;
export const OH_ArkWebResourceHandler_DidReceiveData0100: () => number;
export const OH_ArkWebResourceHandler_DidFinish0100: () => number;
export const OH_ArkWebResourceHandler_DidFailWithError0100: () => number;
export const OH_ArkWebResourceHandler_DidFailWithErrorV20100: () => number;
export const webSchemeHandlerProcess: (funName: string, retVale: string) => number;
export const setSchemeHandler:() => number;
export const initResourceManager: (resmgr: resourceManager.ResourceManager) => void;
export const registerCustomSchemes:() => void;
export const requestStop: () => number;
export const setAsyncReadCallback: () => number;
export const SetActiveWebEngineVersionSystemDefault: () => number;
export const SetActiveWebEngineVersionArkwebM114: () => number;
export const SetActiveWebEngineVersionArkwebM132: () => number;