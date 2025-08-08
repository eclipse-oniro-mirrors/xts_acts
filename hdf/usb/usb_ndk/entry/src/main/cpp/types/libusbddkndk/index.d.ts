/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
export const usbGetDeviceDescriptorOne: (a: number) => number;
export const usbGetDeviceDescriptorTwo: (a: number) => number;
export const usbGetConfigDescriptorOne: (a: number) => number;
export const usbGetConfigDescriptorTwo: () => number;
export const usbGetConfigDescriptorThree: (a: number) => number;
export const usbFreeConfigDescriptor: (a: number) => number;
export const usbClaimInterfaceOne: (a: number) => number;
export const usbClaimInterfaceTwo: () => number;
export const usbClaimInterfaceThree: (a: number) => number;
export const usbReleaseInterface: (a: number) => number;
export const usbSelectInterfaceSettingOne: (a: number) => number;
export const usbSelectInterfaceSettingTwo: (a: number) => number;
export const usbGetCurrentInterfaceSettingOne: (a: number) => number;
export const usbGetCurrentInterfaceSettingTwo: (a: number) => number;
export const usbGetCurrentInterfaceSettingThree: (a: number) => string;
export const usbSendControlReadRequestOne: (a: number) => string;
export const usbSendControlReadRequestTwo: (a: number) => number;
export const usbSendControlReadRequestThree: (a: number) => string;
export const usbSendControlReadRequestFour: (a: number) => string;
export const usbSendControlReadRequestFive: (a: number) => number;

export const usbSendControlWriteRequestOne: (a: number) => number;
export const usbSendControlWriteRequestTwo: (a: number) => number;
export const usbSendControlWriteRequestThree: (a: number) => number;
export const usbSendControlWriteRequestFour: (a: number) => number;
export const usbSendControlWriteRequestFive: (a: number) => number;
export const usbSendPipeRequestOne: (a: number) => number;
export const usbSendPipeRequestTwo: (a: number) => number;
export const usbSendPipeRequestThree: (a: number) => number;
export const usbSendPipeRequestFour: (a: number) => number;
export const usbCreateDeviceMemMapOne: (a: number) => number;
export const usbCreateDeviceMemMapTwo: (a: number) => number;
export const usbDestroyDeviceMemMap: (a: number) => number;
export const usbSendPipeRequestWithAshmemOne: (a: number) => number;
export const usbSendPipeRequestWithAshmemTwo: (a: number) => number;
export const usbSendPipeRequestWithAshmemThree: (a: number) => number;
export const usbSendPipeRequestWithAshmemFour: (a: number) => number;
export const usbGetDevicesOne: (a: number) => number;
export const usbGetDevicesTwo: (a: number) => number;
export const usbGetDevicesThree: (a: number) => number;

export const isScsiDevice: () => number;
export const scsiPeripheralInitOne: () => number;
export const scsiPeripheralReleaseOne: () => number;
export const scsiPeripheralReleaseTwo: () => number;
export const scsiPeripheralOpenOne: (a: number) => number;
export const scsiPeripheralOpenTwo: (a: number) => number;
export const scsiPeripheralOpenThree: (a: number) => number;
export const scsiPeripheralOpenFour: (a: number) => number;
export const scsiPeripheralOpenFive: (a: number) => number;
export const scsiPeripheralOpenSix: (a: number) => number;
export const scsiPeripheralOpenSeven: (a: number) => number;
export const scsiPeripheralOpenEight: (a: number) => number;
export const scsiPeripheralOpenNine: (a: number) => number;
export const scsiPeripheralCloseOne: (a: number) => number;
export const scsiPeripheralCloseTwo: (a: number) => number;
export const scsiPeripheralCloseThree: (a: number) => number;
export const scsiPeripheralReadCapacityOne: (a: number) => number;
export const scsiPeripheralReadCapacityTwo: (a: number) => number;
export const scsiPeripheralReadCapacityThree: (a: number) => number;
export const scsiPeripheralReadCapacityFour: (a: number) => number;
export const scsiPeripheralReadCapacityFive: (a: number) => number;
export const scsiPeripheralReadCapacitySix: (a: number) => number;
export const scsiPeripheralReadCapacitySeven: (a: number) => number;
export const scsiPeripheralTestUnitReadyOne: (a: number) => number;
export const scsiPeripheralTestUnitReadyTwo: (a: number) => number;
export const scsiPeripheralTestUnitReadyThree: (a: number) => number;
export const scsiPeripheralTestUnitReadyFour: (a: number) => number;
export const scsiPeripheralTestUnitReadyFive: (a: number) => number;

export const scsiPeripheralInquiryOne: (a: number) => number;
export const scsiPeripheralInquiryTwo: (a: number) => number;
export const scsiPeripheralInquiryThree: (a: number) => number;
export const scsiPeripheralInquiryFour: (a: number) => number;
export const scsiPeripheralInquiryFive: (a: number) => number;
export const scsiPeripheralInquirySix: (a: number) => number;
export const scsiPeripheralInquirySeven: (a: number) => number;
export const scsiPeripheralInquiryEight: (a: number) => number;
export const scsiPeripheralRequestSenseOne: (a: number) => number;
export const scsiPeripheralRequestSenseTwo: (a: number) => number;
export const scsiPeripheralRequestSenseThree: (a: number) => number;
export const scsiPeripheralRequestSenseFour: (a: number) => number;
export const scsiPeripheralRequestSenseFive: (a: number) => number;
export const scsiPeripheralRequestSenseSix: (a: number) => number;
export const scsiPeripheralReadOne: (a: number) => number;
export const scsiPeripheralReadTwo: (a: number) => number;
export const scsiPeripheralReadThree: (a: number) => number;
export const scsiPeripheralReadFour: (a: number) => number;
export const scsiPeripheralReadFive: (a: number) => number;
export const scsiPeripheralReadSix: (a: number) => number;
export const scsiPeripheralReadSeven: (a: number) => number;
export const scsiPeripheralReadEight: (a: number) => number;
export const scsiPeripheralReadNine: (a: number) => number;

export const scsiPeripheralWriteOne: (a: number) => number;
export const scsiPeripheralWriteTwo: (a: number) => number;
export const scsiPeripheralWriteThree: (a: number) => number;
export const scsiPeripheralWriteFour: (a: number) => number;
export const scsiPeripheralWriteFour1: (a: number) => number;
export const scsiPeripheralWriteFive: (a: number) => number;
export const scsiPeripheralVerifyOne: (a: number) => number;
export const scsiPeripheralVerifyTwo: (a: number) => number;
export const scsiPeripheralVerifyThree: (a: number) => number;
export const scsiPeripheralSendRequestByCDBOne: (a: number) => number;
export const scsiPeripheralSendRequestByCDBTwo: () => number;
export const scsiPeripheralSendRequestByCDBThree: (a: number) => number;
export const scsiPeripheralSendRequestByCDBFour: (a: number) => number;
export const scsiPeripheralCreateDeviceMemMapOne: (a: number) => number;
export const scsiPeripheralCreateDeviceMemMapTwo: (a: number) => number;
export const scsiPeripheralCreateDeviceMemMapThree: (a: number) => number;
export const scsiPeripheralDestroyDeviceMemMapOne: (a: number) => number;
export const scsiPeripheralDestroyDeviceMemMapTwo: (a: number) => number;
export const scsiPeripheralParseBasicSenseInfoOne: () => number;
export const scsiPeripheralParseBasicSenseInfoTwo: () => number;

export const isUsbSerialDevice: (a: number) => number;
export const usbSerialOpenOne: (a: number) => number;
export const usbSerialOpenTwo: (a: number) => number;
export const usbSerialOpenThree: (a: number) => number;
export const usbSerialOpenFour: (a: number) => number;
export const usbSerialOpenFive: (a: number) => number;
export const usbSerialCloseThree: (a: number) => number;
export const usbSerialCloseFour: (a: number) => number;
export const usbSerialWriteOne: (a: number) => number;
export const usbSerialWriteTwo: (a: number) => number;
export const usbSerialWriteThree: (a: number) => number; 
export const usbSerialWriteFour: (a: number) => number;
export const usbSerialReadOne: (a: number) => number;
export const usbSerialReadTwo: (a: number) => number;
export const usbSerialReadThree: (a: number) => number;
export const usbSerialReadFour: (a: number) => number;
export const usbSerialSetBaudRateOne: (a: number) => number;
export const usbSerialSetBaudRateTwo: (a: number) => number;
export const usbSerialSetBaudRateThree: (a: number) => number; 
export const usbSerialSetBaudRateFour: (a: number) => number;
export const usbSerialSetParamsOne: (a: number) => number;  
export const usbSerialSetParamsTwo: (a: number) => number;  
export const usbSerialSetParamsThree: (a: number) => number;
export const usbSerialSetParamsFour: (a: number) => number; 
export const usbSerialSetTimeoutOne: (a: number) => number;
export const usbSerialSetTimeoutTwo: (a: number) => number; 
export const usbSerialSetTimeoutThree: (a: number) => number;
export const usbSerialSetTimeoutFour: (a: number) => number;
export const usbSerialSetTimeoutFive: (a: number) => number;
export const usbSerialSetFlowControlOne: (a: number) => number;
export const usbSerialSetFlowControlTwo: (a: number) => number;
export const usbSerialSetFlowControlThree: (a: number) => number;
export const usbSerialSetFlowControlFour: (a: number) => number;
export const usbSerialFlushOne: (a: number) => number;
export const usbSerialFlushTwo: (a: number) => number;
export const usbSerialFlushThree: (a: number) => number;
export const usbSerialFlushFour: (a: number) => number;
export const usbSerialFlushInputOne: (a: number) => number;
export const usbSerialFlushInputTwo: (a: number) => number;
export const usbSerialFlushInputThree: (a: number) => number;
export const usbSerialFlushInputFour: (a: number) => number;
export const usbSerialFlushOutputOne: (a: number) => number;
export const usbSerialFlushOutputTwo: (a: number) => number;
export const usbSerialFlushOutputThree: (a: number) => number;
export const usbSerialFlushOutputFour: (a: number) => number;