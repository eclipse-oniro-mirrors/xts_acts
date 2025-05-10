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
export const oHGetDeviceType: () => string;
export const oHGetManufacture: () => string;
export const oHGetBrand: () => string;
export const oHGetMarketName: () => string;
export const oHGetProductSeries: () => string;
export const oHGetProductModel: () => string;
export const oHGetSoftwareModel: () => string;
export const oHGetHardwareModel: () => string;
export const oHGetBootloaderVersion: () => string;
export const oHGetAbiList: () => string;
export const oHGetSecurityPatchTag: () => string;
export const oHGetDisplayVersion: () => string;
export const oHGetIncrementalVersion: () => string;
export const oHGetOsReleaseType: () => string;
export const oHGetOSFullName: () => string;
export const oHGetSdkApiVersion: () => number;
export const oHGetFirstApiVersion: () => number;
export const oHGetVersionId: () => string;
export const oHGetBuildType: () => string;
export const oHGetBuildUser: () => string;
export const oHGetBuildHost: () => string;
export const oHGetBuildTime: () => string;
export const oHGetBuildRootHash: () => string;
export const oHGetDistributionOSName: () => string;
export const oHGetDistributionOSVersion: () => string;
export const oHGetDistributionOSApiVersion: () => number;
export const oHGetDistributionOSReleaseType: () => string;
export const canIUse: () => number;
export const canIUseOther: () => number;