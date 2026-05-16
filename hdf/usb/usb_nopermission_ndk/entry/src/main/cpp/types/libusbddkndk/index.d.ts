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
export const usbInit: () => number;
export const usbRelease: () => number;
export const usbReleaseResource: () => number;
export const usbGetDeviceDescriptor: (a: number) => number;
export const usbGetConfigDescriptor: (a: number) => number;
export const usbFreeConfigDescriptor: (a: number) => number;
export const usbClaimInterface: (a: number) => number;
export const usbReleaseInterface: (a: number) => number;
export const usbSelectInterfaceSetting: (a: number) => number;
export const usbGetCurrentInterfaceSetting: (a: number) => number;
export const usbSendControlReadRequest: (a: number) => string;
export const usbSendControlWriteRequest: (a: number) => number;
export const usbSendPipeRequest: (a: number) => number;
export const usbCreateDeviceMemMap: (a: number) => number;
export const usbDestroyDeviceMemMap: (a: number) => number;
export const usbSendPipeRequestWithAshmem: (a: number) => number;
export const usbGetDevices: (a: number) => number;

export const scsiPeripheralInit: () => number;
export const scsiPeripheralRelease: () => number;
export const scsiPeripheralOpen: (a: number) => number;
export const scsiPeripheralClose: (a: number) => number;
export const scsiPeripheralTestUnitReady: (a: number) => number;
export const scsiPeripheralInquiry: (a: number) => number;
export const scsiPeripheralReadCapacity10: (a: number) => number;
export const scsiPeripheralRequestSense: (a: number) => number;
export const scsiPeripheralRead10: (a: number) => number;
export const scsiPeripheralWrite10: (a: number) => number;
export const scsiPeripheralVerify10: (a: number) => number;
export const scsiPeripheralSendRequestByCDB: (a: number) => number;

export const hidInit: () => number;
export const hidRelease: () => number;
export const hidOpen: (a: number) => number;
export const hidClose: (a: number) => number;
export const hidWrite: (a: number) => number;
export const hidReadTimeout: (a: number) => number;
export const hidRead: (a: number) => number;
export const hidSetNonBlocking: (a: number) => number;
export const hidGetRawInfo: (a: number) => number;
export const hidGetRawName: (a: number) => number;
export const hidGetPhysicalAddress: (a: number) => number;
export const hidGetRawUniqueId: (a: number) => number;
export const hidSendReport: (a: number) => number;
export const hidGetReport: (a: number) => number;
export const hidGetReportDescriptor: (a: number) => number;

export const usbSerialInit: () => number;
export const usbSerialRelease: () => number;
export const usbSerialOpen: () => number;
export const usbSerialClose: () => number;
export const usbSerialRead: () => number;
export const usbSerialWrite: () => number;
export const usbSerialSetBaudRate: () => number;
export const usbSerialSetParams: () => number;
export const usbSerialSetTimeout: () => number;
export const usbSerialSetFlowControl: () => number;
export const usbSerialFlush: () => number;
export const usbSerialFlushInput: () => number;
export const usbSerialFlushOutput: () => number;