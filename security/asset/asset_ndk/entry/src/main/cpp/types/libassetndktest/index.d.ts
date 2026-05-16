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
export const asset_removeAll: () => number;
export const asset_add: (alias:string,secret:string) => number;
export const asset_queryAll: (alias:string,secret:string) => number;
export const asset_queryNum: (a:number) => number;
export const asset_queryLabel: (alias:string,ret:number) => number;
export const asset_queryOption: (a:number,b:number,c:number,d:number) => number;
export const asset_queryError: (alias:string,secret:string) => number;
export const asset_updateEasy: (alias:string,secret:string) => number;
export const asset_updateLabel: (alias:string,secret:string,labelNew:string) => number;
export const asset_updateError: (alias:string,secret:string) => number;
export const asset_remove: (alias:string) => number;
export const asset_removeLabel: (alias:string) => number;
export const asset_removeError: (alias:string,secret:string) => number;
export const asset_preAndPostQueryNormal: (alias:string,secret:string) => number;
export const asset_preAndPostQueryError: (alias:string,secret:string) => number;
export const asset_addCE: (alias:string,secret:string) => number;
export const asset_querySyncResult: () => number;