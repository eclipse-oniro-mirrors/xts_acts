/*
   * Copyright (c) 2024 Huawei Device Co., Ltd.
   * * Licensed under the Apache License, Version 2.0 (the "License");
   * * you may not use this file except in compliance with the License.
   * * You may obtain a copy of the License at
   * *
   * *
   * http://www.apache.org/licenses/LICENSE-2.0
   * *
   * * Unless required by applicable law or agreed to in writing, software
   * * distributed under the License is distributed on an "AS IS" BASIS,
   * * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   * * See the License for the specific language governing permissions and
   * * limitations under the License.
   *
 */

import { resourceManager } from '@kit.LocalizationKit';
export const registerCustomSchemes: () => void;
export const setSchemeHandler: () => void;
export const initResourceManager: (resmgr: resourceManager.ResourceManager) => void;
export const setAsyncReadCallback: () => number;
export const asyncRead: () => number;
export const asyncReadMore: () => number;
export const asyncReadCallback: () => number;
export const readBufferValue: () => string;
export const threadIdEqual: () => number;
export const requestStop: () => number;
