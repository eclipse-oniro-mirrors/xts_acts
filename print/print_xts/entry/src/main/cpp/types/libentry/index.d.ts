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

import { Context } from "@kit.AbilityKit"

export const oHPrintInit: () => Promise<number>;
export const oHPrintListener: () => Promise<number>;
export const oHPrintDiscovery: () => Promise<number>;
export const oHPrintConnect: () => Promise<number>;
export const oHPrintJob: () => Promise<number>;
export const oHPrintList: () => Promise<number>;
export const oHPrintInfo: () => Promise<number>;
export const oHPrintProperty: () => Promise<number>;

export const oHScanInit: () => Promise<number>;
export const oHScanStartScannerDiscovery: () => Promise<number>;
export const oHScanOpenScanner: () => Promise<number>;
export const oHScanCloseScanner: () => Promise<number>;
export const oHScanGetScannerParameter: () => Promise<number>;
export const oHScanSetScannerParameter: () => Promise<number>;
export const oHScanStartScan: () => Promise<number>;
export const oHScanCancelScan: () => Promise<number>;
export const oHScanGetPictureScanProgress: () => Promise<number>;
export const oHScanExit: () => Promise<number>;
export const oHPrintStartPrintByNative: (context: Context) => Promise<number>;