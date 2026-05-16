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

import { resourceManager } from "@kit.LocalizationKit";

export const registerCustomSchemes: () => number;
export const setSchemeHandler: () => number;
export const clearSchemeHandlers: () => number;
export const serviceWorkerClearSchemeHandlers: () => number;
export const destroySchemeHandler: () => number;
export const getNativeAPI: () => number;
export const initResourceManager: (resmgr: resourceManager.ResourceManager) => void;
export const getUrl: () => number;
export const getMethod: () => number;
export const getRef: () => number;
export const getHttpBodyStream: () => number;
export const getHeaderListSize: () => number;
export const getHeader: () => number;
export const destroyHeaderList: () => number;
export const hasGesture: () => number;
export const isMainFrame: () => number;
export const isRedirect: () => number;
export const schemeHandlerGetUserData: () => number;
export const schemeHandlerSetUserData: () => number;
export const resourceRequestGetUserData: () => number;
export const resourceRequestSetUserData: () => number;
export const resourceRequestDestroy: () => number;
export const responseGetUrl: () => number;
export const responseGetError: () => number;
export const responseGetStatus: () => number;
export const responseGetStatusText: () => number;
export const responseGetMimeType: () => number;
export const responseGetCharset: () => number;
export const responseGetHeaderByName: () => number;
export const responseSetUrl: () => number;
export const responseSetError: () => number;
export const responseSetStatus: () => number;
export const responseSetStatusText: () => number;
export const responseSetMimeType: () => number;
export const responseSetCharset: () => number;
export const responseSetHeaderByName: () => number;
export const createResponse: () => number;
export const getResourceType: () => number;
export const getFrameUrl: () => number;
export const getRequestValue: () => number;