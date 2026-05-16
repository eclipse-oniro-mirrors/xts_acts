/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import  resourceManager  from "@ohos.resourceManager";


export const registerCustomSchemes: () => void;
export const setSchemeHandler: () => number;
export const initResourceManager: (resmgr: resourceManager.ResourceManager) => void;
export const getNativeAPI: () => number;
export const releaseString: () => number;
export const releaseByteArray: () => number;
export const destroyHttpBodyStream: () => number;
export const setHeaderByName: () => number;

export const resourceHandler: () => number;
export const response: () => number;
export const resourceRequest: () => number;
export const requestHeaderList: () => number;
export const httpBodyStream: () => number;
export const httpBodyStreamInitCallback: () => number;
export const httpBodyStreamReadCallback: () => number;

export const getNativeApiFalse: () => number;
export const requestHeaderListFalse: () => number;
export const httpBodyStreamSetUserDataFalse: () => number;
export const httpBodyStreamSetReadCallbackFalse: () => number;
export const httpBodyStreamInitFalse: () => number;
export const httpBodyStreamIsChunkedFalse: () => number;
export const httpBodyStreamIsEofFalse: () => number;
export const httpBodyStreamIsInMemoryFalse: () => number;
export const resourceRequestIsRedirectFalse: () => number;
export const resourceRequestIsMainFrameFalse: () => number;
export const resourceRequestHasGestureFalse: () => number;
export const registerCustomSchemesTrue: () => number;
export const registerCustomSchemesInvalid: () => number;
export const registerCustomSchemesError: () => number;
export const serviceWorkerSetSchemeHandlerFalse: () => number;
export const setSchemeHandlerFalse: () => number;
export const clearSchemeHandlersFalse: () => number;
export const schemeHandlerSetUserDataFalse: () => number;
export const setOnRequestStartFalse: () => number;
export const setOnRequestStopFalse: () => number;
export const responseSetUrlFalse: () => number;
export const responseSetErrorFalse: () => number;
export const responseSetStatusFalse: () => number;
export const responseGetStatusFalse: () => number;
export const responseSetStatusTextFalse: () => number;
export const responseSetMimeTypeFalse: () => number;
export const responseSetCharsetFalse: () => number;
export const setHeaderByNameNameNull: () => number;
export const setHeaderByNameValueNull: () => number;
export const setHeaderByNameOverwriteNull: () => number;
export const resourceHandlerDestroyFalse: () => number;
export const didReceiveResponseFalse: () => number;
export const didReceiveDataFalse: () => number;
export const didFinishFalse: () => number;
export const didFailWithErrorFalse: () => number;