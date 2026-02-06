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
export const setSchemeHandler: () => void;
export const initResourceManager: (resmgr: resourceManager.ResourceManager) => void;
export const getResourceType_MAIN_FRAME: () => number;
export const getResourceType_SUB_FRAME: () => number;
export const getResourceType_STYLE_SHEET: () => number;
export const getResourceType_SCRIPT: () => number;
export const getResourceType_IMAGE: () => number;
export const getResourceType_FONT_RESOURCE: () => number;
export const getResourceType_SUB_RESOURCE: () => number;
export const getResourceType_OBJECT: () => number;
export const getResourceType_MEDIA: () => number;
export const getResourceType_WORKER: () => number;
export const getResourceType_SHARED_WORKER: () => number;
export const getResourceType_PREFETCH: () => number;
export const getResourceType_FAVICON: () => number;
export const getResourceType_XHR: () => number;
export const getResourceType_PING: () => number;
export const getResourceType_SERVICE_WORKER: () => number;
export const getResourceType_CSP_REPORT: () => number;
export const getResourceType_PLUGIN_RESOURCE: () => number;
export const getResourceType_PRELOAD_MAIN: () => number;
export const getResourceType_PRELOAD_SUB: () => number;

export const getFrameUrl: () => number;
export const getServiceWorkerFrameUrl: () => number;
export const getLoadUrlFrameUrl: () => number;
export const getSubFrameUrl: () => number;
export const getRequestValue: () => number;