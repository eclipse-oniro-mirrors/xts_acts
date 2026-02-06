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
export const IsHidDevice: (a: number) => number;
export const CreateTestDeviceDdkNOPERM: () => number;
export const HidEmitEventNOPERM: () => number;
export const HidDestroyDeviceNOPERM: () => number;
export const HidInitNOPERM: () => number;
export const HidReleaseNOPERM: () => number;
export const HidOpenNOPERM: () => number;
export const HidCloseNOPERM: () => number;
export const HidWriteNOPERM: () => number;
export const HidReadTimeoutNOPERM: () => number;
export const HidReadNOPERM: () => number;
export const HidDdkErrCodeNOPERM: () => number;
export const HidSetNonBlockingNOPERM: () => number;
export const HidGetRawInfoNOPERM: () => number;
export const HidGetRawNameNOPERM: () => number;
export const HidGetPhysicalAddressNOPERM: () => number;
export const HidGetRawUniqueIdNOPERM: () => number;
export const HidSendReportNOPERM: () => number;
export const HidGetReportNOPERM: () => number;
export const HidGetReportDescriptorNOPERM: () => number;
export const UsbSerialReleaseNOPERM: () => number;
export const UsbSerialCloseNOPERM: () => number;

export const ReleaseTest_001: () => number;
export const ReleaseResourceTest_001: () => number;
export const ReleaseResourceTest_002: () => number;
export const GetDeviceDescriptorTest_001: () => number;
export const GetConfigDescriptorTest_001: () => number;
export const FreeConfigDescriptorTest_001: () => number;
export const ClaimInterfaceTest_001: () => number;
export const ReleaseInterfaceTest_001: () => number;
export const SelectInterfaceSettingTest_001: () => number;
export const GetCurrentInterfaceSettingTest_001: () => number;
export const SendControlReadRequestTest_001: () => number;
export const SendControlWriteRequestTest_001: () => number;
export const CreateDeviceMemMapTest_001: () => number;
export const DestroyDeviceMemMapTest_001: () => number;
export const GetDevicesTest_001: () => number;
export const UsbDdkErrCodeTest_001: () => number;
