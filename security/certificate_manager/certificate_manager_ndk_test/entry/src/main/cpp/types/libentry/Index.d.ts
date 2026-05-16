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

export interface CredentialResult {
  resultCode: number;
  isExist: number;
  type: string;
  alias: string;
  keyUri: string;
  certNum: number;
  keyNum: number;
  credDataSize: number;
  certPurpose: number;
}

export interface EnumValues {
  OH_CM_SUCCESS: number;
  OH_CM_HAS_NO_PERMISSION: number;
  OH_CM_CAPABILITY_NOT_SUPPORTED: number;
  OH_CM_INNER_FAILURE: number;
  OH_CM_NOT_FOUND: number;
  OH_CM_INVALID_CERT_FORMAT: number;
  OH_CM_MAX_CERT_COUNT_REACHED: number;
  OH_CM_NO_AUTHORIZATION: number;
  OH_CM_DEVICE_ENTER_ADVSECMODE: number;
  OH_CM_STORE_PATH_NOT_SUPPORTED: number;
  OH_CM_ACCESS_UKEY_SERVICE_FAILED: number;
  OH_CM_PARAMETER_VALIDATION_FAILED: number;
  OH_CM_CERT_PURPOSE_DEFAULT: number;
  OH_CM_CERT_PURPOSE_ALL: number;
  OH_CM_CERT_PURPOSE_SIGN: number;
  OH_CM_CERT_PURPOSE_ENCRYPT: number;
}

export const add: (a: number, b: number) => number;

export const OHCertManagerNativeApiUkeyErr0100: (keyUri: string) => number;

export const OHCertManagerNativeApiUkeyErr0200: (keyUri: string) => number;

export const OHCertManagerNativeApiPrivateFunc0100: (keyUri: string) => number;

export const OHCertManagerNativeApiPrivateErr0100: (keyUri: string) => number;

export const OHCertManagerNativeApiPrivateErr0200: (keyUri: string) => number;

export const OHCertManagerNativeApiPublicErr0100: (keyUri: string) => number;

export const OHCertManagerNativeApiPublicErr0200: (keyUri: string) => number;

export const OHCertManagerNativeApiPublicErr0300: (keyUri: string) => number;

export const OHCertValidateEnumTest0100: (param: string) => EnumValues;

export const OHCertNativeCredTest0100: (keyUri: string) => CredentialResult;