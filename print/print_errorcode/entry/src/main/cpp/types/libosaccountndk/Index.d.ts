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
export const OHPrintNoError: () => Promise<number>;
export const OHPrintInvalidParameter: () => Promise<number>;
export const OHPrintGenericFailure: () => Promise<number>;
export const OHPrintInvalidPrintJob: () => Promise<number>;
export const OHPrintInvalidPrinter: () => Promise<number>;
export const OHScanNoError: () => Promise<number>;
export const OHScanInvalidParameter: () => Promise<number>;
export const OHScanUnSupported: () => Promise<number>;
export const OHPrintINVALID: () => Promise<number>;
export const OH_Print_Init1: () => number;
export const OH_Print_StartPrinterDiscovery1: () => number;
export const OH_Print_StopPrinterDiscovery1: () => number;
export const OH_Print_ConnectPrinter1: () => number;
export const OH_Print_StartPrintJob1: () => number;
export const OH_Print_StartPrintJob2: () => number;
export const OH_Print_RegisterPrinterChangeListener1: () => number;
export const OH_Print_QueryPrinterList1: () => number;
export const OH_Print_QueryPrinterList2: () => number;
export const OH_Print_QueryPrinterInfo1: () => number;
export const OH_Print_QueryPrinterInfo2: () => number;
export const OH_Print_LaunchPrinterManager1: () => number;
export const OH_Print_QueryPrinterProperties1: () => number;
export const OH_Print_RestorePrinterProperties1: () => number;
export const OHScanInit1: () => number;
export const OH_Scan_StartScannerDiscovery1: () => number;
export const OH_Scan_OpenScanner1: () => number;
export const OH_Scan_CloseScanner1: () => number;
export const OH_Scan_SetScannerParameter1: () => number;
export const OH_Scan_StartScan1: () => number;
export const OH_Scan_CancelScan1: () => number;
export const OH_Scan_GetPictureScanProgress1: () => number;
