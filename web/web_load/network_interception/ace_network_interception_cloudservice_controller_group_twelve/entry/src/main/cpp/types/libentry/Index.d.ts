/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { resourceManager } from "@kit.LocalizationKit";

export const registerCustomSchemes: () => number;
export const setSchemeHandler: (number) => number;
export const setUrl: () => number;
export const setError: () => number;
export const setStatus: () => number;
export const judgment_num: () => number;
export const judgment_num_2: () => number;
export const url_return: () => string ;
export const judgment1: () => number;
export const judgment2: () => number;
export const returnsMethod: () => string;
export const getRequestValue: () => string;

export const initResourceManager: (resmgr: resourceManager.ResourceManager) => void;