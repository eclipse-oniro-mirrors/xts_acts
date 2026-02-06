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

import { describe, expect, it, beforeAll, Level } from '@ohos/hypium';
import { ENTINFO1, INVALID_WANT, SELFHAPNAME, SELFWANT, TEST_TOKEN_ID, TEST_CLIPBOARD_POLICY, CURRENT_USER_ID,
  WATERMARK_BUNDLE_NAME, DEFAULT_USER_ID, getPixelMap, getCurrentUserId, PIXEL_MAP,
  INVALID_BUNDLE_NAME, TEST_APP_INSTANCE, TEST_PERMISSION_MANAGED_STATE_GRANTED,
  TEST_PERMISSION_MANAGED_STATE_DENIED, TEST_PERMISSION_MANAGED_STATE_DEFAULT,
  TEST_PERMISSION_LIST_1, TEST_PERMISSION_1, TEST_INVALID_APP_INSTANCE } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import securityManager from '@ohos.enterprise.securityManager';
import sysDeviceInfo from '@ohos.deviceInfo';
import common from '@ohos.enterprise.common';
import fs from '@ohos.file.fs';
import { systemParameterEnhance } from '@kit.BasicServicesKit';

const PATCH = 'patch';
const ENCRYPTION = 'encryption';
const INT_VALID_ACCOUNTID = 100;
const INT_INVALID_ACCOUNTID = 0xFFFFFFFF;
const UNKNOWN = 99;
const STRING_VALID_CERTIFICATEALIAS = 'test_cert_0.cer';
const STRING_INVALID_CERTIFICATEALIAS = 'test.txt';
const STRING_EMPTY_CERTIFICATEALIAS = '';
const INT_INVALID_ACCOUNTID_RE_SIGNATURE = 101;
const MAX_FILE_SIZE = 10 * 1024 * 1024;
const OVER_SIZE = MAX_FILE_SIZE + 1;

const PASSWORD_POLICY: securityManager.PasswordPolicy = {
  complexityRegex: 'g',
  validityPeriod: 60 * 60 * 24 * 1000,
  additionalDescription: '123'
};

const MAX_PASSWORD_POLICY: securityManager.PasswordPolicy = {
  complexityRegex: 'g',
  validityPeriod: 60 * 60 * 24 * 365 * 1000 * 1000,
  additionalDescription: '123'
};

const OUT_OF_RANGE_PASSWORD_POLICY: securityManager.PasswordPolicy = {
  complexityRegex: 'g',
  validityPeriod: 60 * 60 * 24 * 365 * 1000 * 1000 + 1,
  additionalDescription: '123'
};

const RE_SIGNATURE_CERT_DATA_ARRAY: Uint8Array = new Uint8Array([
  0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x42, 0x45, 0x47, 0x49, 0x4E, 0x20, 0x43, 0x45, 0x52, 0x54, 0x49, 0x46, 0x49, 0x43,
  0x41, 0x54, 0x45, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x0D, 0x0A, 0x4D, 0x49, 0x49, 0x43, 0x4A, 0x54, 0x43, 0x43, 0x41,
  0x61, 0x75, 0x67, 0x41, 0x77, 0x49, 0x42, 0x41, 0x67, 0x49, 0x49, 0x62, 0x2F, 0x39, 0x4B, 0x6E, 0x56, 0x69, 0x65,
  0x56, 0x54, 0x67, 0x77, 0x43, 0x67, 0x59, 0x49, 0x4B, 0x6F, 0x5A, 0x49, 0x7A, 0x6A, 0x30, 0x45, 0x41, 0x77, 0x4D,
  0x77, 0x57, 0x44, 0x45, 0x4C, 0x4D, 0x41, 0x6B, 0x47, 0x41, 0x31, 0x55, 0x45, 0x42, 0x68, 0x4D, 0x43, 0x0D, 0x0A,
  0x51, 0x30, 0x34, 0x78, 0x44, 0x7A, 0x41, 0x4E, 0x42, 0x67, 0x4E, 0x56, 0x42, 0x41, 0x6F, 0x4D, 0x42, 0x6B, 0x68,
  0x31, 0x59, 0x58, 0x64, 0x6C, 0x61, 0x54, 0x45, 0x54, 0x4D, 0x42, 0x45, 0x47, 0x41, 0x31, 0x55, 0x45, 0x43, 0x77,
  0x77, 0x4B, 0x53, 0x48, 0x56, 0x68, 0x64, 0x32, 0x56, 0x70, 0x49, 0x45, 0x4E, 0x43, 0x52, 0x7A, 0x45, 0x6A, 0x4D,
  0x43, 0x45, 0x47, 0x41, 0x31, 0x55, 0x45, 0x0D, 0x0A, 0x41, 0x77, 0x77, 0x61, 0x53, 0x48, 0x56, 0x68, 0x64, 0x32,
  0x56, 0x70, 0x49, 0x45, 0x4E, 0x43, 0x52, 0x79, 0x42, 0x53, 0x62, 0x32, 0x39, 0x30, 0x49, 0x45, 0x4E, 0x42, 0x49,
  0x45, 0x63, 0x79, 0x49, 0x46, 0x52, 0x6C, 0x63, 0x33, 0x51, 0x77, 0x48, 0x68, 0x63, 0x4E, 0x4D, 0x6A, 0x41, 0x77,
  0x4D, 0x7A, 0x45, 0x79, 0x4D, 0x54, 0x49, 0x30, 0x4E, 0x44, 0x41, 0x77, 0x57, 0x68, 0x63, 0x4E, 0x0D, 0x0A, 0x4E,
  0x44, 0x6B, 0x77, 0x4D, 0x7A, 0x45, 0x79, 0x4D, 0x54, 0x49, 0x30, 0x4E, 0x44, 0x41, 0x77, 0x57, 0x6A, 0x42, 0x59,
  0x4D, 0x51, 0x73, 0x77, 0x43, 0x51, 0x59, 0x44, 0x56, 0x51, 0x51, 0x47, 0x45, 0x77, 0x4A, 0x44, 0x54, 0x6A, 0x45,
  0x50, 0x4D, 0x41, 0x30, 0x47, 0x41, 0x31, 0x55, 0x45, 0x43, 0x67, 0x77, 0x47, 0x53, 0x48, 0x56, 0x68, 0x64, 0x32,
  0x56, 0x70, 0x4D, 0x52, 0x4D, 0x77, 0x0D, 0x0A, 0x45, 0x51, 0x59, 0x44, 0x56, 0x51, 0x51, 0x4C, 0x44, 0x41, 0x70,
  0x49, 0x64, 0x57, 0x46, 0x33, 0x5A, 0x57, 0x6B, 0x67, 0x51, 0x30, 0x4A, 0x48, 0x4D, 0x53, 0x4D, 0x77, 0x49, 0x51,
  0x59, 0x44, 0x56, 0x51, 0x51, 0x44, 0x44, 0x42, 0x70, 0x49, 0x64, 0x57, 0x46, 0x33, 0x5A, 0x57, 0x6B, 0x67, 0x51,
  0x30, 0x4A, 0x48, 0x49, 0x46, 0x4A, 0x76, 0x62, 0x33, 0x51, 0x67, 0x51, 0x30, 0x45, 0x67, 0x0D, 0x0A, 0x52, 0x7A,
  0x49, 0x67, 0x56, 0x47, 0x56, 0x7A, 0x64, 0x44, 0x42, 0x32, 0x4D, 0x42, 0x41, 0x47, 0x42, 0x79, 0x71, 0x47, 0x53,
  0x4D, 0x34, 0x39, 0x41, 0x67, 0x45, 0x47, 0x42, 0x53, 0x75, 0x42, 0x42, 0x41, 0x41, 0x69, 0x41, 0x32, 0x49, 0x41,
  0x42, 0x4C, 0x53, 0x34, 0x66, 0x67, 0x76, 0x61, 0x59, 0x4B, 0x4B, 0x66, 0x79, 0x4D, 0x5A, 0x57, 0x2F, 0x34, 0x6E,
  0x4E, 0x54, 0x73, 0x53, 0x76, 0x0D, 0x0A, 0x78, 0x71, 0x56, 0x78, 0x71, 0x4F, 0x45, 0x44, 0x66, 0x4C, 0x79, 0x53,
  0x5A, 0x4B, 0x2F, 0x66, 0x53, 0x45, 0x4E, 0x30, 0x49, 0x44, 0x51, 0x6A, 0x30, 0x73, 0x4B, 0x2F, 0x71, 0x4B, 0x35,
  0x68, 0x76, 0x6E, 0x66, 0x30, 0x4F, 0x78, 0x57, 0x68, 0x77, 0x49, 0x34, 0x39, 0x50, 0x33, 0x64, 0x4B, 0x47, 0x6D,
  0x51, 0x2B, 0x63, 0x53, 0x75, 0x6A, 0x58, 0x76, 0x79, 0x30, 0x6D, 0x65, 0x32, 0x44, 0x0D, 0x0A, 0x4A, 0x54, 0x6A,
  0x59, 0x31, 0x32, 0x37, 0x58, 0x59, 0x5A, 0x4A, 0x72, 0x76, 0x4A, 0x77, 0x77, 0x4D, 0x6B, 0x72, 0x54, 0x2F, 0x76,
  0x4D, 0x72, 0x5A, 0x43, 0x35, 0x6B, 0x53, 0x4F, 0x45, 0x4A, 0x62, 0x74, 0x31, 0x71, 0x41, 0x67, 0x53, 0x6D, 0x69,
  0x61, 0x4E, 0x43, 0x4D, 0x45, 0x41, 0x77, 0x44, 0x67, 0x59, 0x44, 0x56, 0x52, 0x30, 0x50, 0x41, 0x51, 0x48, 0x2F,
  0x42, 0x41, 0x51, 0x44, 0x0D, 0x0A, 0x41, 0x67, 0x45, 0x47, 0x4D, 0x41, 0x38, 0x47, 0x41, 0x31, 0x55, 0x64, 0x45,
  0x77, 0x45, 0x42, 0x2F, 0x77, 0x51, 0x46, 0x4D, 0x41, 0x4D, 0x42, 0x41, 0x66, 0x38, 0x77, 0x48, 0x51, 0x59, 0x44,
  0x56, 0x52, 0x30, 0x4F, 0x42, 0x42, 0x59, 0x45, 0x46, 0x47, 0x6C, 0x64, 0x77, 0x46, 0x6A, 0x78, 0x39, 0x54, 0x7A,
  0x6D, 0x2F, 0x51, 0x70, 0x41, 0x38, 0x52, 0x31, 0x67, 0x63, 0x39, 0x77, 0x63, 0x0D, 0x0A, 0x65, 0x4D, 0x62, 0x46,
  0x4D, 0x41, 0x6F, 0x47, 0x43, 0x43, 0x71, 0x47, 0x53, 0x4D, 0x34, 0x39, 0x42, 0x41, 0x4D, 0x44, 0x41, 0x32, 0x67,
  0x41, 0x4D, 0x47, 0x55, 0x43, 0x4D, 0x51, 0x43, 0x43, 0x55, 0x44, 0x52, 0x61, 0x67, 0x6C, 0x6D, 0x79, 0x63, 0x55,
  0x47, 0x72, 0x48, 0x6D, 0x46, 0x2B, 0x4C, 0x38, 0x6F, 0x77, 0x4B, 0x4A, 0x68, 0x62, 0x71, 0x4F, 0x55, 0x71, 0x62,
  0x77, 0x75, 0x58, 0x0D, 0x0A, 0x37, 0x58, 0x4C, 0x2F, 0x76, 0x4A, 0x63, 0x70, 0x33, 0x48, 0x65, 0x48, 0x6A, 0x69,
  0x58, 0x75, 0x37, 0x58, 0x5A, 0x6D, 0x59, 0x51, 0x2B, 0x51, 0x41, 0x76, 0x48, 0x50, 0x68, 0x55, 0x30, 0x43, 0x4D,
  0x43, 0x69, 0x77, 0x57, 0x46, 0x62, 0x44, 0x6C, 0x38, 0x45, 0x54, 0x77, 0x34, 0x56, 0x4B, 0x32, 0x35, 0x51, 0x62,
  0x77, 0x68, 0x4C, 0x2F, 0x51, 0x69, 0x55, 0x66, 0x69, 0x52, 0x66, 0x43, 0x0D, 0x0A, 0x4A, 0x36, 0x4C, 0x7A, 0x74,
  0x65, 0x4F, 0x76, 0x6A, 0x4C, 0x54, 0x45, 0x56, 0x35, 0x69, 0x65, 0x62, 0x51, 0x4D, 0x7A, 0x2F, 0x6E, 0x53, 0x31,
  0x6A, 0x37, 0x2F, 0x6F, 0x6A, 0x33, 0x52, 0x73, 0x71, 0x67, 0x3D, 0x3D, 0x0D, 0x0A, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D,
  0x45, 0x4E, 0x44, 0x20, 0x43, 0x45, 0x52, 0x54, 0x49, 0x46, 0x49, 0x43, 0x41, 0x54, 0x45, 0x2D, 0x2D, 0x2D, 0x2D,
  0x2D, 0x0D, 0x0A, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x42, 0x45, 0x47, 0x49, 0x4E, 0x20, 0x43, 0x45, 0x52, 0x54, 0x49,
  0x46, 0x49, 0x43, 0x41, 0x54, 0x45, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x0D, 0x0A, 0x4D, 0x49, 0x49, 0x44, 0x44, 0x44,
  0x43, 0x43, 0x41, 0x70, 0x4B, 0x67, 0x41, 0x77, 0x49, 0x42, 0x41, 0x67, 0x49, 0x49, 0x4E, 0x34, 0x63, 0x4D, 0x78,
  0x4D, 0x32, 0x64, 0x73, 0x66, 0x38, 0x77, 0x43, 0x67, 0x59, 0x49, 0x4B, 0x6F, 0x5A, 0x49, 0x7A, 0x6A, 0x30, 0x45,
  0x41, 0x77, 0x4D, 0x77, 0x57, 0x44, 0x45, 0x4C, 0x4D, 0x41, 0x6B, 0x47, 0x41, 0x31, 0x55, 0x45, 0x42, 0x68, 0x4D,
  0x43, 0x0D, 0x0A, 0x51, 0x30, 0x34, 0x78, 0x44, 0x7A, 0x41, 0x4E, 0x42, 0x67, 0x4E, 0x56, 0x42, 0x41, 0x6F, 0x4D,
  0x42, 0x6B, 0x68, 0x31, 0x59, 0x58, 0x64, 0x6C, 0x61, 0x54, 0x45, 0x54, 0x4D, 0x42, 0x45, 0x47, 0x41, 0x31, 0x55,
  0x45, 0x43, 0x77, 0x77, 0x4B, 0x53, 0x48, 0x56, 0x68, 0x64, 0x32, 0x56, 0x70, 0x49, 0x45, 0x4E, 0x43, 0x52, 0x7A,
  0x45, 0x6A, 0x4D, 0x43, 0x45, 0x47, 0x41, 0x31, 0x55, 0x45, 0x0D, 0x0A, 0x41, 0x77, 0x77, 0x61, 0x53, 0x48, 0x56,
  0x68, 0x64, 0x32, 0x56, 0x70, 0x49, 0x45, 0x4E, 0x43, 0x52, 0x79, 0x42, 0x53, 0x62, 0x32, 0x39, 0x30, 0x49, 0x45,
  0x4E, 0x42, 0x49, 0x45, 0x63, 0x79, 0x49, 0x46, 0x52, 0x6C, 0x63, 0x33, 0x51, 0x77, 0x48, 0x68, 0x63, 0x4E, 0x4D,
  0x6A, 0x41, 0x77, 0x4F, 0x44, 0x45, 0x30, 0x4D, 0x44, 0x6B, 0x7A, 0x4E, 0x7A, 0x51, 0x33, 0x57, 0x68, 0x63, 0x4E,
  0x0D, 0x0A, 0x4D, 0x7A, 0x41, 0x77, 0x4F, 0x44, 0x45, 0x79, 0x4D, 0x44, 0x6B, 0x7A, 0x4E, 0x7A, 0x51, 0x33, 0x57,
  0x6A, 0x42, 0x6E, 0x4D, 0x51, 0x73, 0x77, 0x43, 0x51, 0x59, 0x44, 0x56, 0x51, 0x51, 0x47, 0x45, 0x77, 0x4A, 0x44,
  0x54, 0x6A, 0x45, 0x50, 0x4D, 0x41, 0x30, 0x47, 0x41, 0x31, 0x55, 0x45, 0x43, 0x68, 0x4D, 0x47, 0x53, 0x48, 0x56,
  0x68, 0x64, 0x32, 0x56, 0x70, 0x4D, 0x52, 0x4D, 0x77, 0x0D, 0x0A, 0x45, 0x51, 0x59, 0x44, 0x56, 0x51, 0x51, 0x4C,
  0x45, 0x77, 0x70, 0x49, 0x64, 0x57, 0x46, 0x33, 0x5A, 0x57, 0x6B, 0x67, 0x51, 0x30, 0x4A, 0x48, 0x4D, 0x54, 0x49,
  0x77, 0x4D, 0x41, 0x59, 0x44, 0x56, 0x51, 0x51, 0x44, 0x45, 0x79, 0x6C, 0x49, 0x64, 0x57, 0x46, 0x33, 0x5A, 0x57,
  0x6B, 0x67, 0x51, 0x30, 0x4A, 0x48, 0x49, 0x45, 0x52, 0x6C, 0x64, 0x6D, 0x56, 0x73, 0x62, 0x33, 0x42, 0x6C, 0x0D,
  0x0A, 0x63, 0x69, 0x42, 0x53, 0x5A, 0x57, 0x78, 0x68, 0x64, 0x47, 0x6C, 0x76, 0x62, 0x6E, 0x4D, 0x67, 0x51, 0x30,
  0x45, 0x67, 0x56, 0x47, 0x56, 0x7A, 0x64, 0x43, 0x42, 0x48, 0x4D, 0x6A, 0x42, 0x32, 0x4D, 0x42, 0x41, 0x47, 0x42,
  0x79, 0x71, 0x47, 0x53, 0x4D, 0x34, 0x39, 0x41, 0x67, 0x45, 0x47, 0x42, 0x53, 0x75, 0x42, 0x42, 0x41, 0x41, 0x69,
  0x41, 0x32, 0x49, 0x41, 0x42, 0x43, 0x52, 0x79, 0x0D, 0x0A, 0x77, 0x4A, 0x4B, 0x64, 0x4F, 0x32, 0x2F, 0x70, 0x4B,
  0x61, 0x33, 0x4D, 0x6A, 0x38, 0x69, 0x53, 0x49, 0x62, 0x2F, 0x7A, 0x74, 0x4C, 0x69, 0x44, 0x58, 0x32, 0x56, 0x48,
  0x4F, 0x37, 0x2F, 0x4D, 0x68, 0x36, 0x32, 0x7A, 0x52, 0x4E, 0x48, 0x73, 0x7A, 0x6D, 0x5A, 0x57, 0x33, 0x2F, 0x74,
  0x62, 0x33, 0x38, 0x6D, 0x2B, 0x47, 0x77, 0x57, 0x70, 0x46, 0x4A, 0x6E, 0x44, 0x54, 0x63, 0x73, 0x31, 0x0D, 0x0A,
  0x42, 0x49, 0x62, 0x7A, 0x53, 0x58, 0x4E, 0x62, 0x46, 0x39, 0x79, 0x6D, 0x62, 0x34, 0x53, 0x6C, 0x32, 0x79, 0x4E,
  0x6A, 0x30, 0x55, 0x42, 0x32, 0x66, 0x33, 0x64, 0x5A, 0x4F, 0x5A, 0x6C, 0x37, 0x50, 0x35, 0x33, 0x6C, 0x72, 0x68,
  0x6D, 0x58, 0x2F, 0x78, 0x6A, 0x6C, 0x54, 0x42, 0x64, 0x44, 0x33, 0x46, 0x45, 0x50, 0x39, 0x6B, 0x73, 0x34, 0x6B,
  0x42, 0x59, 0x62, 0x54, 0x36, 0x4F, 0x43, 0x0D, 0x0A, 0x41, 0x52, 0x67, 0x77, 0x67, 0x67, 0x45, 0x55, 0x4D, 0x42,
  0x38, 0x47, 0x41, 0x31, 0x55, 0x64, 0x49, 0x77, 0x51, 0x59, 0x4D, 0x42, 0x61, 0x41, 0x46, 0x47, 0x6C, 0x64, 0x77,
  0x46, 0x6A, 0x78, 0x39, 0x54, 0x7A, 0x6D, 0x2F, 0x51, 0x70, 0x41, 0x38, 0x52, 0x31, 0x67, 0x63, 0x39, 0x77, 0x63,
  0x65, 0x4D, 0x62, 0x46, 0x4D, 0x42, 0x30, 0x47, 0x41, 0x31, 0x55, 0x64, 0x44, 0x67, 0x51, 0x57, 0x0D, 0x0A, 0x42,
  0x42, 0x51, 0x31, 0x44, 0x65, 0x67, 0x74, 0x48, 0x31, 0x51, 0x35, 0x52, 0x36, 0x44, 0x6E, 0x4D, 0x64, 0x77, 0x50,
  0x42, 0x2F, 0x64, 0x62, 0x67, 0x58, 0x62, 0x50, 0x47, 0x6A, 0x41, 0x53, 0x42, 0x67, 0x4E, 0x56, 0x48, 0x52, 0x4D,
  0x42, 0x41, 0x66, 0x38, 0x45, 0x43, 0x44, 0x41, 0x47, 0x41, 0x51, 0x48, 0x2F, 0x41, 0x67, 0x45, 0x41, 0x4D, 0x45,
  0x59, 0x47, 0x41, 0x31, 0x55, 0x64, 0x0D, 0x0A, 0x49, 0x41, 0x51, 0x2F, 0x4D, 0x44, 0x30, 0x77, 0x4F, 0x77, 0x59,
  0x45, 0x56, 0x52, 0x30, 0x67, 0x41, 0x44, 0x41, 0x7A, 0x4D, 0x44, 0x45, 0x47, 0x43, 0x43, 0x73, 0x47, 0x41, 0x51,
  0x55, 0x46, 0x42, 0x77, 0x49, 0x42, 0x46, 0x69, 0x56, 0x6F, 0x64, 0x48, 0x52, 0x77, 0x4F, 0x69, 0x38, 0x76, 0x59,
  0x33, 0x42, 0x72, 0x61, 0x53, 0x31, 0x6A, 0x59, 0x58, 0x64, 0x6C, 0x59, 0x69, 0x35, 0x6F, 0x0D, 0x0A, 0x64, 0x57,
  0x46, 0x33, 0x5A, 0x57, 0x6B, 0x75, 0x59, 0x32, 0x39, 0x74, 0x4C, 0x32, 0x4E, 0x77, 0x61, 0x32, 0x6B, 0x76, 0x59,
  0x33, 0x42, 0x7A, 0x4D, 0x41, 0x34, 0x47, 0x41, 0x31, 0x55, 0x64, 0x44, 0x77, 0x45, 0x42, 0x2F, 0x77, 0x51, 0x45,
  0x41, 0x77, 0x49, 0x42, 0x42, 0x6A, 0x42, 0x6D, 0x42, 0x67, 0x4E, 0x56, 0x48, 0x52, 0x38, 0x45, 0x58, 0x7A, 0x42,
  0x64, 0x4D, 0x46, 0x75, 0x67, 0x0D, 0x0A, 0x57, 0x61, 0x42, 0x58, 0x68, 0x6C, 0x56, 0x6F, 0x64, 0x48, 0x52, 0x77,
  0x4F, 0x69, 0x38, 0x76, 0x59, 0x33, 0x42, 0x72, 0x61, 0x53, 0x31, 0x6A, 0x59, 0x58, 0x64, 0x6C, 0x59, 0x69, 0x35,
  0x6F, 0x64, 0x57, 0x46, 0x33, 0x5A, 0x57, 0x6B, 0x75, 0x59, 0x32, 0x39, 0x74, 0x4C, 0x32, 0x4E, 0x77, 0x61, 0x32,
  0x6B, 0x76, 0x63, 0x32, 0x56, 0x79, 0x64, 0x6D, 0x78, 0x6C, 0x64, 0x43, 0x39, 0x6A, 0x0D, 0x0A, 0x63, 0x6D, 0x78,
  0x47, 0x61, 0x57, 0x78, 0x6C, 0x52, 0x47, 0x39, 0x33, 0x62, 0x69, 0x35, 0x6A, 0x63, 0x6D, 0x77, 0x2F, 0x59, 0x32,
  0x56, 0x79, 0x64, 0x48, 0x6C, 0x77, 0x5A, 0x54, 0x30, 0x78, 0x4D, 0x43, 0x59, 0x76, 0x63, 0x6D, 0x39, 0x76, 0x64,
  0x46, 0x39, 0x6E, 0x4D, 0x6C, 0x39, 0x6A, 0x63, 0x6D, 0x77, 0x75, 0x59, 0x33, 0x4A, 0x73, 0x4D, 0x41, 0x6F, 0x47,
  0x43, 0x43, 0x71, 0x47, 0x0D, 0x0A, 0x53, 0x4D, 0x34, 0x39, 0x42, 0x41, 0x4D, 0x44, 0x41, 0x32, 0x67, 0x41, 0x4D,
  0x47, 0x55, 0x43, 0x4D, 0x51, 0x43, 0x63, 0x51, 0x4D, 0x2B, 0x54, 0x57, 0x43, 0x6C, 0x4F, 0x76, 0x62, 0x37, 0x71,
  0x2B, 0x42, 0x57, 0x77, 0x46, 0x61, 0x38, 0x56, 0x38, 0x61, 0x4F, 0x57, 0x51, 0x52, 0x47, 0x72, 0x59, 0x6D, 0x69,
  0x4B, 0x37, 0x58, 0x61, 0x43, 0x75, 0x4D, 0x4A, 0x4C, 0x30, 0x75, 0x58, 0x43, 0x0D, 0x0A, 0x53, 0x32, 0x58, 0x4B,
  0x71, 0x45, 0x55, 0x44, 0x2F, 0x69, 0x79, 0x72, 0x2F, 0x54, 0x34, 0x55, 0x43, 0x47, 0x51, 0x43, 0x4D, 0x48, 0x79,
  0x34, 0x6E, 0x34, 0x56, 0x6F, 0x37, 0x6E, 0x52, 0x32, 0x65, 0x62, 0x4C, 0x6A, 0x42, 0x38, 0x33, 0x34, 0x4D, 0x53,
  0x46, 0x70, 0x44, 0x65, 0x66, 0x31, 0x4E, 0x54, 0x5A, 0x5A, 0x4C, 0x6D, 0x43, 0x33, 0x6D, 0x35, 0x77, 0x77, 0x4F,
  0x59, 0x6A, 0x49, 0x0D, 0x0A, 0x54, 0x47, 0x4A, 0x34, 0x5A, 0x35, 0x4E, 0x72, 0x55, 0x4A, 0x77, 0x72, 0x67, 0x6D,
  0x4B, 0x63, 0x6D, 0x34, 0x6F, 0x4D, 0x6A, 0x77, 0x3D, 0x3D, 0x0D, 0x0A, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x45, 0x4E,
  0x44, 0x20, 0x43, 0x45, 0x52, 0x54, 0x49, 0x46, 0x49, 0x43, 0x41, 0x54, 0x45, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x0D,
  0x0A, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x42, 0x45, 0x47, 0x49, 0x4E, 0x20, 0x43, 0x45, 0x52, 0x54, 0x49, 0x46, 0x49,
  0x43, 0x41, 0x54, 0x45, 0x2D, 0x2D, 0x2D, 0x2D, 0x2D, 0x0D, 0x0A, 0x4D, 0x49, 0x49, 0x44, 0x48, 0x6A, 0x43, 0x43,
  0x41, 0x71, 0x53, 0x67, 0x41, 0x77, 0x49, 0x42, 0x41, 0x67, 0x49, 0x4F, 0x59, 0x39, 0x69, 0x62, 0x2B, 0x2B, 0x56,
  0x62, 0x6F, 0x45, 0x6C, 0x2F, 0x51, 0x79, 0x31, 0x4F, 0x4B, 0x4D, 0x38, 0x77, 0x43, 0x67, 0x59, 0x49, 0x4B, 0x6F,
  0x5A, 0x49, 0x7A, 0x6A, 0x30, 0x45, 0x41, 0x77, 0x4D, 0x77, 0x5A, 0x7A, 0x45, 0x4C, 0x4D, 0x41, 0x6B, 0x47, 0x0D,
  0x0A, 0x41, 0x31, 0x55, 0x45, 0x42, 0x68, 0x4D, 0x43, 0x51, 0x30, 0x34, 0x78, 0x44, 0x7A, 0x41, 0x4E, 0x42, 0x67,
  0x4E, 0x56, 0x42, 0x41, 0x6F, 0x54, 0x42, 0x6B, 0x68, 0x31, 0x59, 0x58, 0x64, 0x6C, 0x61, 0x54, 0x45, 0x54, 0x4D,
  0x42, 0x45, 0x47, 0x41, 0x31, 0x55, 0x45, 0x43, 0x78, 0x4D, 0x4B, 0x53, 0x48, 0x56, 0x68, 0x64, 0x32, 0x56, 0x70,
  0x49, 0x45, 0x4E, 0x43, 0x52, 0x7A, 0x45, 0x79, 0x0D, 0x0A, 0x4D, 0x44, 0x41, 0x47, 0x41, 0x31, 0x55, 0x45, 0x41,
  0x78, 0x4D, 0x70, 0x53, 0x48, 0x56, 0x68, 0x64, 0x32, 0x56, 0x70, 0x49, 0x45, 0x4E, 0x43, 0x52, 0x79, 0x42, 0x45,
  0x5A, 0x58, 0x5A, 0x6C, 0x62, 0x47, 0x39, 0x77, 0x5A, 0x58, 0x49, 0x67, 0x55, 0x6D, 0x56, 0x73, 0x59, 0x58, 0x52,
  0x70, 0x62, 0x32, 0x35, 0x7A, 0x49, 0x45, 0x4E, 0x42, 0x49, 0x46, 0x52, 0x6C, 0x63, 0x33, 0x51, 0x67, 0x0D, 0x0A,
  0x52, 0x7A, 0x49, 0x77, 0x48, 0x68, 0x63, 0x4E, 0x4D, 0x6A, 0x55, 0x78, 0x4D, 0x6A, 0x41, 0x78, 0x4D, 0x44, 0x67,
  0x31, 0x4E, 0x6A, 0x51, 0x32, 0x57, 0x68, 0x63, 0x4E, 0x4D, 0x6A, 0x67, 0x78, 0x4D, 0x54, 0x4D, 0x77, 0x4D, 0x44,
  0x67, 0x31, 0x4E, 0x6A, 0x51, 0x32, 0x57, 0x6A, 0x43, 0x42, 0x72, 0x54, 0x45, 0x4C, 0x4D, 0x41, 0x6B, 0x47, 0x41,
  0x31, 0x55, 0x45, 0x42, 0x68, 0x4D, 0x43, 0x0D, 0x0A, 0x51, 0x30, 0x34, 0x78, 0x4B, 0x6A, 0x41, 0x6F, 0x42, 0x67,
  0x4E, 0x56, 0x42, 0x41, 0x6F, 0x4D, 0x49, 0x65, 0x6D, 0x48, 0x6A, 0x65, 0x65, 0x74, 0x76, 0x75, 0x57, 0x51, 0x6A,
  0x65, 0x69, 0x76, 0x67, 0x65, 0x53, 0x35, 0x70, 0x75, 0x53, 0x34, 0x6B, 0x2B, 0x65, 0x55, 0x71, 0x4F, 0x61, 0x63,
  0x69, 0x65, 0x6D, 0x5A, 0x6B, 0x4F, 0x57, 0x46, 0x72, 0x4F, 0x57, 0x50, 0x75, 0x44, 0x45, 0x63, 0x0D, 0x0A, 0x4D,
  0x42, 0x6F, 0x47, 0x41, 0x31, 0x55, 0x45, 0x43, 0x77, 0x77, 0x54, 0x4D, 0x54, 0x67, 0x78, 0x4D, 0x7A, 0x59, 0x32,
  0x4E, 0x54, 0x51, 0x79, 0x4E, 0x54, 0x6B, 0x34, 0x4D, 0x54, 0x51, 0x31, 0x4D, 0x7A, 0x4D, 0x78, 0x4E, 0x44, 0x46,
  0x55, 0x4D, 0x46, 0x49, 0x47, 0x41, 0x31, 0x55, 0x45, 0x41, 0x77, 0x78, 0x4C, 0x36, 0x59, 0x65, 0x4E, 0x35, 0x36,
  0x32, 0x2B, 0x35, 0x5A, 0x43, 0x4E, 0x0D, 0x0A, 0x36, 0x4B, 0x2B, 0x42, 0x35, 0x4C, 0x6D, 0x6D, 0x35, 0x4C, 0x69,
  0x54, 0x35, 0x35, 0x53, 0x6F, 0x35, 0x70, 0x79, 0x4A, 0x36, 0x5A, 0x6D, 0x51, 0x35, 0x59, 0x57, 0x73, 0x35, 0x59,
  0x2B, 0x34, 0x4B, 0x44, 0x45, 0x34, 0x4D, 0x54, 0x4D, 0x32, 0x4E, 0x6A, 0x55, 0x30, 0x4D, 0x6A, 0x55, 0x35, 0x4F,
  0x44, 0x45, 0x30, 0x4E, 0x54, 0x4D, 0x7A, 0x4D, 0x54, 0x51, 0x70, 0x58, 0x43, 0x78, 0x46, 0x0D, 0x0A, 0x62, 0x6E,
  0x52, 0x6C, 0x63, 0x6E, 0x42, 0x79, 0x61, 0x58, 0x4E, 0x6C, 0x51, 0x58, 0x42, 0x77, 0x55, 0x6D, 0x56, 0x7A, 0x61,
  0x57, 0x64, 0x75, 0x4D, 0x46, 0x6B, 0x77, 0x45, 0x77, 0x59, 0x48, 0x4B, 0x6F, 0x5A, 0x49, 0x7A, 0x6A, 0x30, 0x43,
  0x41, 0x51, 0x59, 0x49, 0x4B, 0x6F, 0x5A, 0x49, 0x7A, 0x6A, 0x30, 0x44, 0x41, 0x51, 0x63, 0x44, 0x51, 0x67, 0x41,
  0x45, 0x39, 0x2F, 0x4E, 0x64, 0x0D, 0x0A, 0x2F, 0x38, 0x2F, 0x38, 0x67, 0x62, 0x46, 0x69, 0x5A, 0x6C, 0x34, 0x4C,
  0x4E, 0x43, 0x69, 0x59, 0x68, 0x4A, 0x77, 0x46, 0x6C, 0x55, 0x4C, 0x6A, 0x6B, 0x6A, 0x6C, 0x54, 0x69, 0x58, 0x39,
  0x4E, 0x67, 0x36, 0x6B, 0x6F, 0x37, 0x46, 0x43, 0x46, 0x36, 0x36, 0x70, 0x35, 0x44, 0x56, 0x31, 0x32, 0x43, 0x48,
  0x2F, 0x57, 0x56, 0x38, 0x48, 0x57, 0x59, 0x43, 0x67, 0x4E, 0x78, 0x31, 0x57, 0x51, 0x0D, 0x0A, 0x6D, 0x77, 0x75,
  0x66, 0x68, 0x64, 0x73, 0x33, 0x52, 0x4F, 0x34, 0x64, 0x6C, 0x41, 0x48, 0x59, 0x31, 0x71, 0x4F, 0x42, 0x37, 0x44,
  0x43, 0x42, 0x36, 0x54, 0x41, 0x64, 0x42, 0x67, 0x4E, 0x56, 0x48, 0x51, 0x34, 0x45, 0x46, 0x67, 0x51, 0x55, 0x75,
  0x58, 0x32, 0x77, 0x44, 0x30, 0x37, 0x61, 0x77, 0x4F, 0x61, 0x4A, 0x31, 0x32, 0x4D, 0x31, 0x64, 0x6B, 0x4D, 0x73,
  0x32, 0x49, 0x32, 0x63, 0x0D, 0x0A, 0x5A, 0x78, 0x63, 0x77, 0x44, 0x41, 0x59, 0x44, 0x56, 0x52, 0x30, 0x54, 0x41,
  0x51, 0x48, 0x2F, 0x42, 0x41, 0x49, 0x77, 0x41, 0x44, 0x41, 0x66, 0x42, 0x67, 0x4E, 0x56, 0x48, 0x53, 0x4D, 0x45,
  0x47, 0x44, 0x41, 0x57, 0x67, 0x42, 0x51, 0x31, 0x44, 0x65, 0x67, 0x74, 0x48, 0x31, 0x51, 0x35, 0x52, 0x36, 0x44,
  0x6E, 0x4D, 0x64, 0x77, 0x50, 0x42, 0x2F, 0x64, 0x62, 0x67, 0x58, 0x62, 0x50, 0x0D, 0x0A, 0x47, 0x6A, 0x42, 0x67,
  0x42, 0x67, 0x4E, 0x56, 0x48, 0x52, 0x38, 0x45, 0x57, 0x54, 0x42, 0x58, 0x4D, 0x46, 0x57, 0x67, 0x55, 0x36, 0x42,
  0x52, 0x68, 0x6B, 0x39, 0x6F, 0x64, 0x48, 0x52, 0x77, 0x4F, 0x69, 0x38, 0x76, 0x62, 0x47, 0x5A, 0x6A, 0x62, 0x32,
  0x35, 0x30, 0x5A, 0x57, 0x35, 0x30, 0x59, 0x32, 0x56, 0x75, 0x64, 0x47, 0x56, 0x79, 0x5A, 0x47, 0x56, 0x32, 0x4C,
  0x6D, 0x68, 0x33, 0x0D, 0x0A, 0x59, 0x32, 0x78, 0x76, 0x64, 0x57, 0x52, 0x30, 0x5A, 0x58, 0x4E, 0x30, 0x4C, 0x6D,
  0x4E, 0x75, 0x4C, 0x32, 0x4E, 0x6A, 0x61, 0x44, 0x55, 0x76, 0x59, 0x33, 0x4A, 0x73, 0x4C, 0x32, 0x68, 0x6B, 0x63,
  0x6D, 0x4E, 0x68, 0x5A, 0x7A, 0x49, 0x76, 0x53, 0x48, 0x56, 0x68, 0x64, 0x32, 0x56, 0x70, 0x51, 0x30, 0x4A, 0x48,
  0x53, 0x45, 0x52, 0x53, 0x52, 0x7A, 0x4A, 0x6A, 0x63, 0x6D, 0x77, 0x75, 0x0D, 0x0A, 0x59, 0x33, 0x4A, 0x73, 0x4D,
  0x41, 0x34, 0x47, 0x41, 0x31, 0x55, 0x64, 0x44, 0x77, 0x45, 0x42, 0x2F, 0x77, 0x51, 0x45, 0x41, 0x77, 0x49, 0x48,
  0x67, 0x44, 0x41, 0x54, 0x42, 0x67, 0x4E, 0x56, 0x48, 0x53, 0x55, 0x45, 0x44, 0x44, 0x41, 0x4B, 0x42, 0x67, 0x67,
  0x72, 0x42, 0x67, 0x45, 0x46, 0x42, 0x51, 0x63, 0x44, 0x41, 0x7A, 0x41, 0x53, 0x42, 0x67, 0x77, 0x72, 0x42, 0x67,
  0x45, 0x45, 0x0D, 0x0A, 0x41, 0x59, 0x39, 0x62, 0x41, 0x6F, 0x4A, 0x34, 0x41, 0x51, 0x6B, 0x45, 0x41, 0x67, 0x55,
  0x41, 0x4D, 0x41, 0x6F, 0x47, 0x43, 0x43, 0x71, 0x47, 0x53, 0x4D, 0x34, 0x39, 0x42, 0x41, 0x4D, 0x44, 0x41, 0x32,
  0x67, 0x41, 0x4D, 0x47, 0x55, 0x43, 0x4D, 0x51, 0x43, 0x39, 0x33, 0x39, 0x74, 0x37, 0x76, 0x79, 0x6C, 0x7A, 0x31,
  0x49, 0x79, 0x75, 0x64, 0x41, 0x47, 0x78, 0x5A, 0x63, 0x4D, 0x5A, 0x0D, 0x0A, 0x39, 0x77, 0x7A, 0x56, 0x50, 0x56,
  0x61, 0x76, 0x56, 0x79, 0x2F, 0x58, 0x4C, 0x6F, 0x63, 0x7A, 0x44, 0x69, 0x6B, 0x4A, 0x6F, 0x2F, 0x4A, 0x62, 0x6F,
  0x6B, 0x76, 0x33, 0x74, 0x58, 0x76, 0x72, 0x34, 0x71, 0x4D, 0x49, 0x4B, 0x2F, 0x62, 0x35, 0x64, 0x44, 0x51, 0x43,
  0x4D, 0x44, 0x75, 0x46, 0x31, 0x57, 0x31, 0x39, 0x44, 0x71, 0x39, 0x31, 0x57, 0x52, 0x31, 0x41, 0x2B, 0x43, 0x4C,
  0x62, 0x0D, 0x0A, 0x6E, 0x53, 0x42, 0x55, 0x57, 0x38, 0x39, 0x6B, 0x36, 0x4E, 0x32, 0x59, 0x34, 0x58, 0x49, 0x57,
  0x2F, 0x44, 0x56, 0x6E, 0x36, 0x6A, 0x37, 0x37, 0x6E, 0x41, 0x6E, 0x64, 0x31, 0x31, 0x33, 0x72, 0x75, 0x37, 0x61,
  0x4C, 0x71, 0x4A, 0x65, 0x32, 0x6B, 0x62, 0x48, 0x63, 0x31, 0x41, 0x3D, 0x3D, 0x0D, 0x0A, 0x2D, 0x2D, 0x2D, 0x2D,
  0x2D, 0x45, 0x4E, 0x44, 0x20, 0x43, 0x45, 0x52, 0x54, 0x49, 0x46, 0x49, 0x43, 0x41, 0x54, 0x45, 0x2D, 0x2D, 0x2D,
  0x2D, 0x2D, 0x0D, 0x0A
]);

const CERT_DATA_ARRAY: Uint8Array = new Uint8Array([0x30, 0x82, 0x04, 0x31, 0x30, 0x82, 0x03, 0x19, 0xa0, 0x03, 0x02, 0x01, 0x02, 0x02,
  0x01, 0x00, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x05, 0x05, 0x00, 0x30, 0x81,
  0x95, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x47, 0x52, 0x31, 0x44, 0x30, 0x42, 0x06,
  0x03, 0x55, 0x04, 0x0a, 0x13, 0x3b, 0x48, 0x65, 0x6c, 0x6c, 0x65, 0x6e, 0x69, 0x63, 0x20, 0x41, 0x63, 0x61, 0x64,
  0x65, 0x6d, 0x69, 0x63, 0x20, 0x61, 0x6e, 0x64, 0x20, 0x52, 0x65, 0x73, 0x65, 0x61, 0x72, 0x63, 0x68, 0x20, 0x49,
  0x6e, 0x73, 0x74, 0x69, 0x74, 0x75, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x20, 0x43, 0x65, 0x72, 0x74, 0x2e, 0x20, 0x41,
  0x75, 0x74, 0x68, 0x6f, 0x72, 0x69, 0x74, 0x79, 0x31, 0x40, 0x30, 0x3e, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x37,
  0x48, 0x65, 0x6c, 0x6c, 0x65, 0x6e, 0x69, 0x63, 0x20, 0x41, 0x63, 0x61, 0x64, 0x65, 0x6d, 0x69, 0x63, 0x20, 0x61,
  0x6e, 0x64, 0x20, 0x52, 0x65, 0x73, 0x65, 0x61, 0x72, 0x63, 0x68, 0x20, 0x49, 0x6e, 0x73, 0x74, 0x69, 0x74, 0x75,
  0x74, 0x69, 0x6f, 0x6e, 0x73, 0x20, 0x52, 0x6f, 0x6f, 0x74, 0x43, 0x41, 0x20, 0x32, 0x30, 0x31, 0x31, 0x30, 0x1e,
  0x17, 0x0d, 0x31, 0x31, 0x31, 0x32, 0x30, 0x36, 0x31, 0x33, 0x34, 0x39, 0x35, 0x32, 0x5a, 0x17, 0x0d, 0x33, 0x31,
  0x31, 0x32, 0x30, 0x31, 0x31, 0x33, 0x34, 0x39, 0x35, 0x32, 0x5a, 0x30, 0x81, 0x95, 0x31, 0x0b, 0x30, 0x09, 0x06,
  0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x47, 0x52, 0x31, 0x44, 0x30, 0x42, 0x06, 0x03, 0x55, 0x04, 0x0a, 0x13, 0x3b,
  0x48, 0x65, 0x6c, 0x6c, 0x65, 0x6e, 0x69, 0x63, 0x20, 0x41, 0x63, 0x61, 0x64, 0x65, 0x6d, 0x69, 0x63, 0x20, 0x61,
  0x6e, 0x64, 0x20, 0x52, 0x65, 0x73, 0x65, 0x61, 0x72, 0x63, 0x68, 0x20, 0x49, 0x6e, 0x73, 0x74, 0x69, 0x74, 0x75,
  0x74, 0x69, 0x6f, 0x6e, 0x73, 0x20, 0x43, 0x65, 0x72, 0x74, 0x2e, 0x20, 0x41, 0x75, 0x74, 0x68, 0x6f, 0x72, 0x69,
  0x74, 0x79, 0x31, 0x40, 0x30, 0x3e, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x37, 0x48, 0x65, 0x6c, 0x6c, 0x65, 0x6e,
  0x69, 0x63, 0x20, 0x41, 0x63, 0x61, 0x64, 0x65, 0x6d, 0x69, 0x63, 0x20, 0x61, 0x6e, 0x64, 0x20, 0x52, 0x65, 0x73,
  0x65, 0x61, 0x72, 0x63, 0x68, 0x20, 0x49, 0x6e, 0x73, 0x74, 0x69, 0x74, 0x75, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x20,
  0x52, 0x6f, 0x6f, 0x74, 0x43, 0x41, 0x20, 0x32, 0x30, 0x31, 0x31, 0x30, 0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09,
  0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00, 0x30, 0x82, 0x01,
  0x0a, 0x02, 0x82, 0x01, 0x01, 0x00, 0xa9, 0x53, 0x00, 0xe3, 0x2e, 0xa6, 0xf6, 0x8e, 0xfa, 0x60, 0xd8, 0x2d, 0x95,
  0x3e, 0xf8, 0x2c, 0x2a, 0x54, 0x4e, 0xcd, 0xb9, 0x84, 0x61, 0x94, 0x58, 0x4f, 0x8f, 0x3d, 0x8b, 0xe4, 0x43, 0xf3,
  0x75, 0x89, 0x8d, 0x51, 0xe4, 0xc3, 0x37, 0xd2, 0x8a, 0x88, 0x4d, 0x79, 0x1e, 0xb7, 0x12, 0xdd, 0x43, 0x78, 0x4a,
  0x8a, 0x92, 0xe6, 0xd7, 0x48, 0xd5, 0x0f, 0xa4, 0x3a, 0x29, 0x44, 0x35, 0xb8, 0x07, 0xf6, 0x68, 0x1d, 0x55, 0xcd,
  0x38, 0x51, 0xf0, 0x8c, 0x24, 0x31, 0x85, 0xaf, 0x83, 0xc9, 0x7d, 0xe9, 0x77, 0xaf, 0xed, 0x1a, 0x7b, 0x9d, 0x17,
  0xf9, 0xb3, 0x9d, 0x38, 0x50, 0x0f, 0xa6, 0x5a, 0x79, 0x91, 0x80, 0xaf, 0x37, 0xae, 0xa6, 0xd3, 0x31, 0xfb, 0xb5,
  0x26, 0x09, 0x9d, 0x3c, 0x5a, 0xef, 0x51, 0xc5, 0x2b, 0xdf, 0x96, 0x5d, 0xeb, 0x32, 0x1e, 0x02, 0xda, 0x70, 0x49,
  0xec, 0x6e, 0x0c, 0xc8, 0x9a, 0x37, 0x8d, 0xf7, 0xf1, 0x36, 0x60, 0x4b, 0x26, 0x2c, 0x82, 0x9e, 0xd0, 0x78, 0xf3,
  0x0d, 0x0f, 0x63, 0xa4, 0x51, 0x30, 0xe1, 0xf9, 0x2b, 0x27, 0x12, 0x07, 0xd8, 0xea, 0xbd, 0x18, 0x62, 0x98, 0xb0,
  0x59, 0x37, 0x7d, 0xbe, 0xee, 0xf3, 0x20, 0x51, 0x42, 0x5a, 0x83, 0xef, 0x93, 0xba, 0x69, 0x15, 0xf1, 0x62, 0x9d,
  0x9f, 0x99, 0x39, 0x82, 0xa1, 0xb7, 0x74, 0x2e, 0x8b, 0xd4, 0xc5, 0x0b, 0x7b, 0x2f, 0xf0, 0xc8, 0x0a, 0xda, 0x3d,
  0x79, 0x0a, 0x9a, 0x93, 0x1c, 0xa5, 0x28, 0x72, 0x73, 0x91, 0x43, 0x9a, 0xa7, 0xd1, 0x4d, 0x85, 0x84, 0xb9, 0xa9,
  0x74, 0x8f, 0x14, 0x40, 0xc7, 0xdc, 0xde, 0xac, 0x41, 0x64, 0x6c, 0xb4, 0x19, 0x9b, 0x02, 0x63, 0x6d, 0x24, 0x64,
  0x8f, 0x44, 0xb2, 0x25, 0xea, 0xce, 0x5d, 0x74, 0x0c, 0x63, 0x32, 0x5c, 0x8d, 0x87, 0xe5, 0x02, 0x03, 0x01, 0x00,
  0x01, 0xa3, 0x81, 0x89, 0x30, 0x81, 0x86, 0x30, 0x0f, 0x06, 0x03, 0x55, 0x1d, 0x13, 0x01, 0x01, 0xff, 0x04, 0x05,
  0x30, 0x03, 0x01, 0x01, 0xff, 0x30, 0x0b, 0x06, 0x03, 0x55, 0x1d, 0x0f, 0x04, 0x04, 0x03, 0x02, 0x01, 0x06, 0x30,
  0x1d, 0x06, 0x03, 0x55, 0x1d, 0x0e, 0x04, 0x16, 0x04, 0x14, 0xa6, 0x91, 0x42, 0xfd, 0x13, 0x61, 0x4a, 0x23, 0x9e,
  0x08, 0xa4, 0x29, 0xe5, 0xd8, 0x13, 0x04, 0x23, 0xee, 0x41, 0x25, 0x30, 0x47, 0x06, 0x03, 0x55, 0x1d, 0x1e, 0x04,
  0x40, 0x30, 0x3e, 0xa0, 0x3c, 0x30, 0x05, 0x82, 0x03, 0x2e, 0x67, 0x72, 0x30, 0x05, 0x82, 0x03, 0x2e, 0x65, 0x75,
  0x30, 0x06, 0x82, 0x04, 0x2e, 0x65, 0x64, 0x75, 0x30, 0x06, 0x82, 0x04, 0x2e, 0x6f, 0x72, 0x67, 0x30, 0x05, 0x81,
  0x03, 0x2e, 0x67, 0x72, 0x30, 0x05, 0x81, 0x03, 0x2e, 0x65, 0x75, 0x30, 0x06, 0x81, 0x04, 0x2e, 0x65, 0x64, 0x75,
  0x30, 0x06, 0x81, 0x04, 0x2e, 0x6f, 0x72, 0x67, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01,
  0x01, 0x05, 0x05, 0x00, 0x03, 0x82, 0x01, 0x01, 0x00, 0x1f, 0xef, 0x79, 0x41, 0xe1, 0x7b, 0x6e, 0x3f, 0xb2, 0x8c,
  0x86, 0x37, 0x42, 0x4a, 0x4e, 0x1c, 0x37, 0x1e, 0x8d, 0x66, 0xba, 0x24, 0x81, 0xc9, 0x4f, 0x12, 0x0f, 0x21, 0xc0,
  0x03, 0x97, 0x86, 0x25, 0x6d, 0x5d, 0xd3, 0x22, 0x29, 0xa8, 0x6c, 0xa2, 0x0d, 0xa9, 0xeb, 0x3d, 0x06, 0x5b, 0x99,
  0x3a, 0xc7, 0xcc, 0xc3, 0x9a, 0x34, 0x7f, 0xab, 0x0e, 0xc8, 0x4e, 0x1c, 0xe1, 0xfa, 0xe4, 0xdc, 0xcd, 0x0d, 0xbe,
  0xbf, 0x24, 0xfe, 0x6c, 0xe7, 0x6b, 0xc2, 0x0d, 0xc8, 0x06, 0x9e, 0x4e, 0x8d, 0x61, 0x28, 0xa6, 0x6a, 0xfd, 0xe5,
  0xf6, 0x62, 0xea, 0x18, 0x3c, 0x4e, 0xa0, 0x53, 0x9d, 0xb2, 0x3a, 0x9c, 0xeb, 0xa5, 0x9c, 0x91, 0x16, 0xb6, 0x4d,
  0x82, 0xe0, 0x0c, 0x05, 0x48, 0xa9, 0x6c, 0xf5, 0xcc, 0xf8, 0xcb, 0x9d, 0x49, 0xb4, 0xf0, 0x02, 0xa5, 0xfd, 0x70,
  0x03, 0xed, 0x8a, 0x21, 0xa5, 0xae, 0x13, 0x86, 0x49, 0xc3, 0x33, 0x73, 0xbe, 0x87, 0x3b, 0x74, 0x8b, 0x17, 0x45,
  0x26, 0x4c, 0x16, 0x91, 0x83, 0xfe, 0x67, 0x7d, 0xcd, 0x4d, 0x63, 0x67, 0xfa, 0xf3, 0x03, 0x12, 0x96, 0x78, 0x06,
  0x8d, 0xb1, 0x67, 0xed, 0x8e, 0x3f, 0xbe, 0x9f, 0x4f, 0x02, 0xf5, 0xb3, 0x09, 0x2f, 0xf3, 0x4c, 0x87, 0xdf, 0x2a,
  0xcb, 0x95, 0x7c, 0x01, 0xcc, 0xac, 0x36, 0x7a, 0xbf, 0xa2, 0x73, 0x7a, 0xf7, 0x8f, 0xc1, 0xb5, 0x9a, 0xa1, 0x14,
  0xb2, 0x8f, 0x33, 0x9f, 0x0d, 0xef, 0x22, 0xdc, 0x66, 0x7b, 0x84, 0xbd, 0x45, 0x17, 0x06, 0x3d, 0x3c, 0xca, 0xb9,
  0x77, 0x34, 0x8f, 0xca, 0xea, 0xcf, 0x3f, 0x31, 0x3e, 0xe3, 0x88, 0xe3, 0x80, 0x49, 0x25, 0xc8, 0x97, 0xb5, 0x9d,
  0x9a, 0x99, 0x4d, 0xb0, 0x3c, 0xf8, 0x4a, 0x00, 0x9b, 0x64, 0xdd, 0x9f, 0x39, 0x4b, 0xd1, 0x27, 0xd7, 0xb8]);

const CERTIFICATE: securityManager.CertBlob = {
  alias: 'test',
  inData: CERT_DATA_ARRAY
}

const CERTIFICATE_INVALID: securityManager.CertBlob = {
  inData: new Uint8Array([0]),
  alias: 'invalid cert'
}

const CERTIFICATE_MAX_ALIAS: securityManager.CertBlob = {
  inData: CERT_DATA_ARRAY,
  alias: '123456789123456789123456789123456789123'
}

const CERTIFICATE_INVALID_ALIAS: securityManager.CertBlob = {
  inData: CERT_DATA_ARRAY,
  alias: '1234567891234567891234567891234567891230'
}

export default function securityManagerTest() {
  describe('securityManager_test', () => {
    testGetSecurityStatus();

    testSetPasswordPolicy();
    testGetPasswordPolicy();

    testInstallUserCertificate();
    testGetUserCertificates();
    testUninstallUserCertificate();

    testSetClipboardPolicy();
    testGetClipboardPolicy();
    
    testSetClipboardPolicyByBundleName();
    testGetClipboardPolicyByBundleName();
    
    testSetWatermarkImage();
    testCancelWatermarkImage();
    
    testSetPermissionManagedState();
    testGetPermissionManagedState();

    testSetExternalSourceExtensionsPolicy();
    testGetExternalSourceExtensionsPolicy();

    testInstallEnterpriseReSignatureCertificate();
    testUninstallEnterpriseReSignatureCertificate();
  })
}

function testGetSecurityStatus() {
  /**
   * @tc.name   test_get_security_status_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0100
   * @tc.desc   test securityManager without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_security_status_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getSecurityStatus(SELFWANT, PATCH);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_security_status_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0101
   * @tc.desc   test securityManager with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_security_status_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getSecurityStatus(SELFWANT, PATCH);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_security_status_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0103
   * @tc.desc   test securityManager unsupported item
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_security_status_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getSecurityStatus(SELFWANT, '123');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_security_status_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0104
   * @tc.desc   test securityManager get patch tag
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_security_status_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: string = securityManager.getSecurityStatus(SELFWANT, PATCH);
      expect(result).not().assertUndefined();
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_security_status_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0105
   * @tc.desc   test securityManager get encryption status
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_security_status_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: string = securityManager.getSecurityStatus(SELFWANT, ENCRYPTION);
      expect(JSON.parse(result)).not().assertUndefined();
    } catch (error) {
      expect().assertFail();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_security_status_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0106
   * @tc.desc   test securityManager get root status
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_security_status_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret:string = securityManager.getSecurityStatus(SELFWANT, 'root');
      expect(ret.length > 0).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_security_status_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0107
   * @tc.desc   test securityManager with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_security_status_0107", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getSecurityStatus(INVALID_WANT, 'patch');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_security_status_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0108
   * @tc.desc   test securityManager get fastboot status
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_security_status_0108", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret:string = securityManager.getSecurityStatus(SELFWANT, 'fastboot');
      expect(ret.length > 0).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetPasswordPolicy() {
  /**
   * @tc.name   test_set_password_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0100
   * @tc.desc   test securityManager setPasswordPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_password_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setPasswordPolicy(SELFWANT, PASSWORD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_password_policy_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0101
   * @tc.desc   test securityManager setPasswordPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_password_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setPasswordPolicy(SELFWANT, PASSWORD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_password_policy_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0102
   * @tc.desc   test securityManager setPasswordPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_password_policy_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPasswordPolicy(INVALID_WANT, PASSWORD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_password_policy_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0104
   * @tc.desc   test securityManager setPasswordPolicy no policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_password_policy_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPasswordPolicy(SELFWANT, undefined);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_password_policy_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0105
   * @tc.desc   test securityManager setPasswordPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_password_policy_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPasswordPolicy(SELFWANT, PASSWORD_POLICY);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_password_policy_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0106
   * @tc.desc   test securityManager setPasswordPolicy with max validityPeriod
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_password_policy_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPasswordPolicy(SELFWANT, MAX_PASSWORD_POLICY);
      let res = securityManager.getPasswordPolicy(SELFWANT);
      console.log('res.validityPeriod:' + res.validityPeriod);
      expect(res.validityPeriod === MAX_PASSWORD_POLICY.validityPeriod).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_password_policy_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0107
   * @tc.desc   test securityManager setPasswordPolicy with out of range validityPeriod
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_password_policy_0107", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPasswordPolicy(SELFWANT, OUT_OF_RANGE_PASSWORD_POLICY);
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetPasswordPolicy() {
  /**
   * @tc.name   test_get_password_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_POLICY_JS_0100
   * @tc.desc   test securityManager getPasswordPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getPasswordPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_password_policy_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_POLICY_JS_0101
   * @tc.desc   test securityManager getPasswordPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getPasswordPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_password_policy_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_POLICY_JS_0102
   * @tc.desc   test securityManager getPasswordPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_policy_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getPasswordPolicy(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_password_policy_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PASSWORD_POLICY_JS_0103
   * @tc.desc   test securityManager getPasswordPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_password_policy_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPasswordPolicy(SELFWANT, PASSWORD_POLICY);
      let result: securityManager.PasswordPolicy = securityManager.getPasswordPolicy(SELFWANT);
      expect(result !== undefined).assertTrue();
      expect(result.complexityRegex === PASSWORD_POLICY.complexityRegex);
      expect(result.validityPeriod === PASSWORD_POLICY.validityPeriod);
      expect(result.additionalDescription === PASSWORD_POLICY.additionalDescription);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testInstallUserCertificate() {
  /**
   * @tc.name   test_install_user_certificate_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0100
   * @tc.desc   test securityManager installUserCertificate without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0100", Level.LEVEL2, async (done: Function) => {
    try {
      await securityManager.installUserCertificate(SELFWANT, CERTIFICATE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0101
   * @tc.desc   test securityManager installUserCertificate with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      await securityManager.installUserCertificate(SELFWANT, CERTIFICATE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0102
   * @tc.desc   test securityManager installUserCertificate with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.installUserCertificate(INVALID_WANT, CERTIFICATE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0103
   * @tc.desc   test securityManager installUserCertificate invalid cert
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.installUserCertificate(SELFWANT, CERTIFICATE_INVALID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9201001).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0104
   * @tc.desc   test securityManager installUserCertificate
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let path: string = await securityManager.installUserCertificate(SELFWANT, CERTIFICATE);
      expect(path !== undefined).assertTrue();
      await securityManager.uninstallUserCertificate(SELFWANT, path);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0105
   * @tc.desc   test securityManager installUserCertificate with max alias
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let path: string = await securityManager.installUserCertificate(SELFWANT, CERTIFICATE_MAX_ALIAS);
      expect(path !== undefined).assertTrue();
      await securityManager.uninstallUserCertificate(SELFWANT, path);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0106
   * @tc.desc   test securityManager installUserCertificate with invalid alias
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.installUserCertificate(SELFWANT, CERTIFICATE_INVALID_ALIAS);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0201
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0201
   * @tc.desc   test securityManager installUserCertificate  with normal admin and specific valid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0201", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.installUserCertificate(SELFWANT, CERTIFICATE, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0202
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0202
   * @tc.desc   test securityManager installUserCertificate with invalid admin and specific valid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0202", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.installUserCertificate(INVALID_WANT, CERTIFICATE, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0203
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0203
   * @tc.desc   test securityManager installUserCertificate invalid cert with specific valid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0203", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.installUserCertificate(SELFWANT, CERTIFICATE_INVALID, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9201001).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0204
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0204
   * @tc.desc   test securityManager installUserCertificate with specific valid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0204", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let path: string = securityManager.installUserCertificate(SELFWANT, CERTIFICATE, INT_VALID_ACCOUNTID);
      expect(path !== undefined).assertTrue();
      await securityManager.uninstallUserCertificate(SELFWANT, path);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0205
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0205
   * @tc.desc   test securityManager installUserCertificate with specific invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0205", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let path: string = securityManager.installUserCertificate(SELFWANT, CERTIFICATE, INT_INVALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0206
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0206
   * @tc.desc   test securityManager installUserCertificate with max alias and specific valid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0206", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let path: string = securityManager.installUserCertificate(SELFWANT, CERTIFICATE_MAX_ALIAS, INT_VALID_ACCOUNTID);
      expect(path !== undefined).assertTrue();
      let res = securityManager.getUserCertificates(SELFWANT, INT_VALID_ACCOUNTID);
      expect(res.length > 0).assertTrue();
      await securityManager.uninstallUserCertificate(SELFWANT, path);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0207
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0207
   * @tc.desc   test securityManager installUserCertificate with invalid alias
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0207", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.installUserCertificate(SELFWANT, CERTIFICATE_INVALID_ALIAS, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_user_certificate_0208
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0208
   * @tc.desc   test securityManager installUserCertificate  without active admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_user_certificate_0208", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.installUserCertificate(SELFWANT, CERTIFICATE, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testGetUserCertificates() {
  /**
   * @tc.name   test_get_user_certificates_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_CERTIFICATES_SYNC_JS_0101
   * @tc.desc   test securityManager getUserCertificatesSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_certificates_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getUserCertificates(SELFWANT, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_certificates_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_CERTIFICATES_SYNC_JS_0102
   * @tc.desc   test securityManager getUserCertificatesSync with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_certificates_sync_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getUserCertificates(INVALID_WANT, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_certificates_sync_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_CERTIFICATES_SYNC_JS_0103
   * @tc.desc   test securityManager getUserCertificatesSync success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_certificates_sync_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: Array<string> = securityManager.getUserCertificates(SELFWANT, INT_VALID_ACCOUNTID);
      expect(result).not().assertUndefined();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_security_status_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_CERTIFICATES_SYNC_JS_0104
   * @tc.desc   test securityManager getUserCertificatesSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_security_status_0104", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getUserCertificates(SELFWANT, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });
}

function testUninstallUserCertificate() {
  /**
   * @tc.name   test_uninstall_user_certificate_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0100
   * @tc.desc   test securityManager uninstallUserCertificate without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_user_certificate_0100", Level.LEVEL2, async (done: Function) => {
    try {
      await securityManager.uninstallUserCertificate(SELFWANT, 'test');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_user_certificate_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0101
   * @tc.desc   test securityManager uninstallUserCertificate with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_user_certificate_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      await securityManager.uninstallUserCertificate(SELFWANT, 'test');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_user_certificate_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0102
   * @tc.desc   test securityManager uninstallUserCertificate with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_user_certificate_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.uninstallUserCertificate(INVALID_WANT, 'test');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_user_certificate_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0103
   * @tc.desc   test securityManager uninstallUserCertificate with invalid path
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_user_certificate_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.uninstallUserCertificate(SELFWANT, '');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_user_certificate_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0104
   * @tc.desc   test securityManager uninstallUserCertificate
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_user_certificate_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      await securityManager.uninstallUserCertificate(SELFWANT, 'test');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9201001).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetClipboardPolicy() {
  /**
   * @tc.name   test_set_clipboard_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0100
   * @tc.desc   test securityManager setAppClipboardPolicy without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0200
   * @tc.desc   test securityManager setAppClipboardPolicy without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0300
   * @tc.desc   test securityManager setAppClipboardPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setAppClipboardPolicy(null, TEST_TOKEN_ID, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0400
   * @tc.desc   test securityManager setAppClipboardPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, null, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0500
   * @tc.desc   test securityManager setAppClipboardPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0600
   * @tc.desc   test securityManager setAppClipboardPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID, TEST_CLIPBOARD_POLICY);
      let data: string = securityManager.getAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID);
      let policy: Array<string> = JSON.parse(data);
      expect(policy[0]["tokenId"] == TEST_TOKEN_ID).assertTrue();
      expect(policy[0]["clipboardPolicy"] == 1).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0700
   * @tc.desc   test securityManager setAppClipboardPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID, securityManager.ClipboardPolicy.DEFAULT);
      let data: string = securityManager.getAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID);
      let policy: Array<string> = JSON.parse(data);
      expect(policy[0]["tokenId"] == TEST_TOKEN_ID).assertTrue();
      expect(policy[0]["clipboardPolicy"] == 0).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0800
   * @tc.desc   test securityManager setAppClipboardPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID, securityManager.ClipboardPolicy.LOCAL_DEVICE);
      let data: string = securityManager.getAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID);
      let policy: Array<string> = JSON.parse(data);
      expect(policy[0]["tokenId"] == TEST_TOKEN_ID).assertTrue();
      expect(policy[0]["clipboardPolicy"] == 2).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0900
   * @tc.desc   test securityManager setAppClipboardPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID, securityManager.ClipboardPolicy.CROSS_DEVICE);
      let data: string = securityManager.getAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID);
      let policy: Array<string> = JSON.parse(data);
      expect(policy[0]["tokenId"] == TEST_TOKEN_ID).assertTrue();
      expect(policy[0]["clipboardPolicy"] == 3).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetClipboardPolicy() {
  /**
   * @tc.name   test_get_clipboard_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CLIPBOARD_POLICY_JS_0100
   * @tc.desc   test securityManager getAppClipboardPolicy without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_clipboard_policy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0200
   * @tc.desc   test securityManager getAppClipboardPolicy without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getAppClipboardPolicy(SELFWANT, TEST_TOKEN_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
  
  /**
   * @tc.name   test_get_clipboard_policy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0300
   * @tc.desc   test securityManager getAppClipboardPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAppClipboardPolicy(null, TEST_TOKEN_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_clipboard_policy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CLIPBOARD_POLICY_JS_0400
   * @tc.desc   test securityManager getAppClipboardPolicy without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAppClipboardPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_clipboard_policy_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0500
   * @tc.desc   test securityManager getAppClipboardPolicy without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getAppClipboardPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
  
  /**
   * @tc.name   test_get_clipboard_policy_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0600
   * @tc.desc   test securityManager getAppClipboardPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getAppClipboardPolicy(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetClipboardPolicyByBundleName() {
  beforeAll((done: Function) => {
    getCurrentUserId();
    done();
  })
  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0100
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0200
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0300
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setAppClipboardPolicy(null, SELFHAPNAME, CURRENT_USER_ID, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0400
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName without  bundleName and userId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, null, null, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0500
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName without userId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, SELFHAPNAME, null, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0600
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName without bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, null, CURRENT_USER_ID, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0700
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName without policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0800
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName policy is IN_APP
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID, TEST_CLIPBOARD_POLICY);
      let data: string = securityManager.getAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID);
      let policy: Array<string> = JSON.parse(data);
      expect(policy[0]["userId"] == CURRENT_USER_ID).assertTrue();
      expect(policy[0]["bundleName"] == SELFHAPNAME).assertTrue();
      expect(policy[0]["clipboardPolicy"] == 1).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0900
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName with invalid bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, INVALID_BUNDLE_NAME, CURRENT_USER_ID, TEST_CLIPBOARD_POLICY);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_1000
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName policy is DEFAULT
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID,
        securityManager.ClipboardPolicy.DEFAULT);
      let data: string = securityManager.getAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID);
      let policy: Array<string> = JSON.parse(data);
      expect(policy[0]["userId"] == CURRENT_USER_ID).assertTrue();
      expect(policy[0]["bundleName"] == SELFHAPNAME).assertTrue();
      expect(policy[0]["clipboardPolicy"] == 0).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_1100
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName policy is LOCAL_DEVICE
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID,
        securityManager.ClipboardPolicy.LOCAL_DEVICE);
      let data: string = securityManager.getAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID);
      let policy: Array<string> = JSON.parse(data);
      expect(policy[0]["userId"] == CURRENT_USER_ID).assertTrue();
      expect(policy[0]["bundleName"] == SELFHAPNAME).assertTrue();
      expect(policy[0]["clipboardPolicy"] == 2).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_1200
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName policy is CROSS_DEVICE
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID,
        securityManager.ClipboardPolicy.CROSS_DEVICE);
      let data: string = securityManager.getAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID);
      let policy: Array<string> = JSON.parse(data);
      expect(policy[0]["userId"] == CURRENT_USER_ID).assertTrue();
      expect(policy[0]["bundleName"] == SELFHAPNAME).assertTrue();
      expect(policy[0]["clipboardPolicy"] == 3).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_clipboard_policy_by_bundle_name_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_1300
   * @tc.desc   test securityManager setAppClipboardPolicyByBundleName policy is UNKNOWN
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_clipboard_policy_by_bundle_name_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID, UNKNOWN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}


function testGetClipboardPolicyByBundleName() {
  beforeAll((done: Function) => {
    getCurrentUserId();
    done();
  })
  /**
   * @tc.name   test_get_clipboard_policy_by_bundle_name_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0100
   * @tc.desc   test securityManager getAppClipboardPolicyByBundleName without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_by_bundle_name_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_clipboard_policy_by_bundle_name_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0200
   * @tc.desc   test securityManager getAppClipboardPolicyByBundleName without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_by_bundle_name_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getAppClipboardPolicy(SELFWANT, SELFHAPNAME, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_clipboard_policy_by_bundle_name_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0300
   * @tc.desc   test securityManager getAppClipboolicyByBundleName without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_by_bundle_name_0300", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAppClipboardPolicy(null, SELFHAPNAME, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_clipboard_policy_by_bundle_name_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0400
   * @tc.desc   test securityManager getAppClipboolicyByBundleName without bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_by_bundle_name_0400", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAppClipboardPolicy(SELFWANT, null, CURRENT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_clipboard_policy_by_bundle_name_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0500
   * @tc.desc   test securityManager getAppClipboolicyByBundleName without userId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_clipboard_policy_by_bundle_name_0500", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getAppClipboardPolicy(SELFWANT, SELFHAPNAME, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });
}

function testSetWatermarkImage() {

  beforeAll((done: Function) => {
    getPixelMap();
    done();
  })

  /**
   * @tc.name   test_set_watermark_image_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0100
   * @tc.desc   test securityManager setWatermarkImage without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_watermark_image_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_watermark_image_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0101
   * @tc.desc   test securityManager setWatermarkImage with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_watermark_image_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_watermark_image_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0102
   * @tc.desc   test securityManager setWatermarkImage with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_watermark_image_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(INVALID_WANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_watermark_image_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0103
   * @tc.desc   test securityManager setWatermarkImage with bundleName empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_watermark_image_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, null, PIXEL_MAP, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_watermark_image_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0104
   * @tc.desc   test securityManager setWatermarkImage with source empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_watermark_image_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_watermark_image_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0105
   * @tc.desc   test securityManager setWatermarkImage with accountId empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_watermark_image_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_watermark_image_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0106
   * @tc.desc   test securityManager setWatermarkImage
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_watermark_image_0106", Level.LEVEL2, async (done: Function) => {
    if (sysDeviceInfo.deviceType != '2in1') {
      done();
      return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, PIXEL_MAP, DEFAULT_USER_ID);
      securityManager.cancelWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, DEFAULT_USER_ID);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testCancelWatermarkImage() {
  /**
   * @tc.name   test_cancel_watermark_image_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0100
   * @tc.desc   test securityManager cancelWatermarkImage without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancel_watermark_image_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.cancelWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_cancel_watermark_image_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0101
   * @tc.desc   test securityManager cancelWatermarkImage with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancel_watermark_image_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.cancelWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_cancel_watermark_image_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0102
   * @tc.desc   test securityManager cancelWatermarkImage with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancel_watermark_image_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.cancelWatermarkImage(INVALID_WANT, WATERMARK_BUNDLE_NAME, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_cancel_watermark_image_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0103
   * @tc.desc   test securityManager cancelWatermarkImage with bundleName empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancel_watermark_image_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.cancelWatermarkImage(SELFWANT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_cancel_watermark_image_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0104
   * @tc.desc   test securityManager cancelWatermarkImage with accountId empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_cancel_watermark_image_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.cancelWatermarkImage(SELFWANT, WATERMARK_BUNDLE_NAME, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetPermissionManagedState() {
  /**
   * @tc.name   test_set_permission_managed_state_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0100
   * @tc.desc   test securityManager setPermissionManagedState without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, TEST_PERMISSION_MANAGED_STATE_GRANTED);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_permission_managed_state_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0200
   * @tc.desc   test securityManager setPermissionManagedState without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, TEST_PERMISSION_MANAGED_STATE_GRANTED);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_permission_managed_state_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0300
   * @tc.desc   test securityManager setPermissionManagedState without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(null, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, TEST_PERMISSION_MANAGED_STATE_GRANTED);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_permission_managed_state_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0400
   * @tc.desc   test securityManager setPermissionManagedState without appInstance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, null, TEST_PERMISSION_LIST_1, TEST_PERMISSION_MANAGED_STATE_GRANTED);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_permission_managed_state_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0500
   * @tc.desc   test securityManager setPermissionManagedState without managed state
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_permission_managed_state_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0600
   * @tc.desc   test securityManager setPermissionManagedState with invalid appInstance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_INVALID_APP_INSTANCE, TEST_PERMISSION_LIST_1, securityManager.PermissionManagedState.GRANTED);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_permission_managed_state_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0700
   * @tc.desc   test securityManager setPermissionManagedState with default permission state
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, securityManager.PermissionManagedState.DEFAULT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.name   test_set_permission_managed_state_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0800
   * @tc.desc   test securityManager setPermissionManagedState set granted state
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, securityManager.PermissionManagedState.DENIED)
      let managedState: securityManager.PermissionManagedState = securityManager.getPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_1);
      expect(managedState == securityManager.PermissionManagedState.DENIED).assertTrue();
    } catch(error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_permission_managed_state_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0900
   * @tc.desc   test securityManager setPermissionManagedState set granted state
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, securityManager.PermissionManagedState.DENIED)
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, securityManager.PermissionManagedState.DEFAULT)
      let managedState: securityManager.PermissionManagedState = securityManager.getPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_1);
      expect(managedState == securityManager.PermissionManagedState.DEFAULT).assertTrue();
    } catch(error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_permission_managed_state_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_1000
   * @tc.desc   test securityManager setPermissionManagedState set granted state
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_permission_managed_state_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, securityManager.PermissionManagedState.GRANTED)
      let managedState: securityManager.PermissionManagedState = securityManager.getPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_1);
      expect(managedState == securityManager.PermissionManagedState.GRANTED).assertTrue();
    } catch(error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetPermissionManagedState() {
  /**
   * @tc.name   test_get_permission_managed_state_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0100
   * @tc.desc   test securityManager getPermissionManagedState without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_permission_managed_state_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_permission_managed_state_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0200
   * @tc.desc   test securityManager getPermissionManagedState without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_permission_managed_state_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_permission_managed_state_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0300
   * @tc.desc   test securityManager getPermissionManagedState without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_permission_managed_state_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getPermissionManagedState(null, TEST_APP_INSTANCE, TEST_PERMISSION_1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_permission_managed_state_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0400
   * @tc.desc   test securityManager getPermissionManagedState without appInstance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_permission_managed_state_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getPermissionManagedState(SELFWANT, null, TEST_PERMISSION_1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_permission_managed_state_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0500
   * @tc.desc   test securityManager getPermissionManagedState without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_permission_managed_state_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_permission_managed_state_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0600
   * @tc.desc   test securityManager getPermissionManagedState with invalid appInstance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_permission_managed_state_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getPermissionManagedState(SELFWANT, TEST_INVALID_APP_INSTANCE, TEST_PERMISSION_1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetExternalSourceExtensionsPolicy() {
  /**
   * @tc.name   test_set_external_source_extensions_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_SOURCE_EXTENSIONS_POLICY_JS_0100
   * @tc.desc   test securityManager setExternalSourceExtensionsPolicy without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_external_source_extensions_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.setExternalSourceExtensionsPolicy(SELFWANT, common.ManagedPolicy.FORCE_OPEN);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_set_external_source_extensions_policy_0100 error.code = ' + error.code);
      expect(error.code == 9200001 || error.code == 801).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_external_source_extensions_policy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_SOURCE_EXTENSIONS_POLICY_JS_0200
   * @tc.desc   test securityManager setExternalSourceExtensionsPolicy with not super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_external_source_extensions_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.setExternalSourceExtensionsPolicy(SELFWANT, common.ManagedPolicy.FORCE_OPEN);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_set_external_source_extensions_policy_0200 error.code = ' + error.code);
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_external_source_extensions_policy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_SOURCE_EXTENSIONS_POLICY_JS_0300
   * @tc.desc   test securityManager setExternalSourceExtensionsPolicy with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_external_source_extensions_policy_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setExternalSourceExtensionsPolicy(INVALID_WANT, common.ManagedPolicy.FORCE_OPEN);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_set_external_source_extensions_policy_0300 error.code = ' + error.code);
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_external_source_extensions_policy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_SOURCE_EXTENSIONS_POLICY_JS_0400
   * @tc.desc   test securityManager setExternalSourceExtensionsPolicy with parameter verification failed
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_external_source_extensions_policy_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setExternalSourceExtensionsPolicy(SELFWANT, 3);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_set_external_source_extensions_policy_0400 error.code = ' + error.code);
      expect(error.code == 9200012 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_external_source_extensions_policy_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_EXTERNAL_SOURCE_EXTENSIONS_POLICY_JS_0500
   * @tc.desc   test securityManager setExternalSourceExtensionsPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_external_source_extensions_policy_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setExternalSourceExtensionsPolicy(SELFWANT, common.ManagedPolicy.DEFAULT);
      let managedPolicy: common.ManagedPolicy = securityManager.getExternalSourceExtensionsPolicy(SELFWANT);
      expect(managedPolicy == common.ManagedPolicy.DEFAULT).assertTrue();
    } catch (error) {
      console.info('test_set_external_source_extensions_policy_0500 error.code = ' + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetExternalSourceExtensionsPolicy() {
  /**
   * @tc.name   test_get_external_source_extensions_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_EXTERNAL_SOURCE_EXTENSIONS_POLICY_JS_0100
   * @tc.desc   test securityManager getExternalSourceExtensionsPolicy without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_external_source_extensions_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.getExternalSourceExtensionsPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_external_source_extensions_policy_0100 error.code = ' + error.code);
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_external_source_extensions_policy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_EXTERNAL_SOURCE_EXTENSIONS_POLICY_JS_0200
   * @tc.desc   test securityManager getExternalSourceExtensionsPolicy with not super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_external_source_extensions_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.getExternalSourceExtensionsPolicy(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_external_source_extensions_policy_0200 error.code = ' + error.code);
      expect(error.code == 9200002 || error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_external_source_extensions_policy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_EXTERNAL_SOURCE_EXTENSIONS_POLICY_JS_0300
   * @tc.desc   test securityManager getExternalSourceExtensionsPolicy with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_external_source_extensions_policy_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.getExternalSourceExtensionsPolicy(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_external_source_extensions_policy_0300 error.code = ' + error.code);
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_external_source_extensions_policy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_EXTERNAL_SOURCE_EXTENSIONS_POLICY_JS_0400
   * @tc.desc   test securityManager getExternalSourceExtensionsPolicy with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_external_source_extensions_policy_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setExternalSourceExtensionsPolicy(SELFWANT, common.ManagedPolicy.DEFAULT);
      let managedPolicy: common.ManagedPolicy = securityManager.getExternalSourceExtensionsPolicy(SELFWANT);
      expect(managedPolicy == common.ManagedPolicy.DEFAULT).assertTrue();

      securityManager.setExternalSourceExtensionsPolicy(SELFWANT, common.ManagedPolicy.DISALLOW);
      managedPolicy = securityManager.getExternalSourceExtensionsPolicy(SELFWANT);
      expect(managedPolicy == common.ManagedPolicy.DISALLOW).assertTrue();

      securityManager.setExternalSourceExtensionsPolicy(SELFWANT, common.ManagedPolicy.FORCE_OPEN);
      managedPolicy = securityManager.getExternalSourceExtensionsPolicy(SELFWANT);
      expect(managedPolicy == common.ManagedPolicy.FORCE_OPEN).assertTrue();
    } catch (error) {
      console.info('test_get_external_source_extensions_policy_0400 error.code = ' + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function withCertificateFile<T>(callback: (fd: number) => T, fileSetup?: (fd: number) => void): T {
  let file: fs.File | undefined = undefined;
  let path = getContext().filesDir + '/test.cer';
  try {
    file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
    if (fileSetup) {
      fileSetup(file.fd);
    } else {
      fs.writeSync(file.fd, RE_SIGNATURE_CERT_DATA_ARRAY.buffer);
    }
    return callback(file.fd);
  } finally {
    if (file) {
      try {
        fs.closeSync(file);
      } catch (closeErr) {
        console.error('EDM_TEST_LOG: Failed to close file.');
      }
    }
  }
}

function checkEnterpriseDevice(done: Function): boolean {
  let isEnterprise: string = systemParameterEnhance.getSync('const.edm.is_enterprise_device', 'false');
  if (isEnterprise != 'true') {
    console.log('the device is not enterprise');
    done();
    return false;
  }
  return true;
}

function testInstallEnterpriseReSignatureCertificate() {
  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0100
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0100", Level.LEVEL2, async (done: Function) => {
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0101
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0102
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          INVALID_WANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0103
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate with invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_INVALID_ACCOUNTID_RE_SIGNATURE);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0104
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate with empty certificateAlias
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_EMPTY_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0105
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate with invalid certificateAlias
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_INVALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
        expect(false).assertTrue();
      });
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0106
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate with too large fd
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
        expect(false).assertTrue();
      }, (fd: number) => {
        fs.truncateSync(fd, OVER_SIZE);
      });
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0107
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate certificate alias riched limit
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0107", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        for (let i = 0; i < 11; i++) {
          const certName = `test_cert_${i}.cer`;
          try {
            securityManager.installEnterpriseReSignatureCertificate(
              SELFWANT, certName, fd, INT_VALID_ACCOUNTID);
          } catch (err) {
            continue;
          }
        }
      });
    } catch (error) {
      expect(error.code == 9201006).assertTrue();
    } finally {
      for (let i = 0; i < 11; i++) {
        const certName = `test_cert_${i}.cer`;
        try {
          securityManager.uninstallEnterpriseReSignatureCertificate(
            SELFWANT, certName, INT_VALID_ACCOUNTID);
        } catch (err) {
          continue;
        }
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0108
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate certificate alias already exists
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0108", Level.LEVEL2, async (done: Function) => {
    if (!checkEnterpriseDevice(done)) {
      return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
      });
    } catch (error) {
      expect(error.code == 9201007).assertTrue();
    } finally {
      try {
        securityManager.uninstallEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, INT_VALID_ACCOUNTID);
      } catch (err) {
        console.error(`EDM_TEST_LOG: Uninstall certificate failed, code: ${err.code}`);
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0109
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0109
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate with invalid certificate file
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0109", Level.LEVEL2, async (done: Function) => {
    if (!checkEnterpriseDevice(done)) {
      return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
      }, (fd: number) => {
        fs.writeSync(fd, 'test_info');
      });
    } catch (error) {
      expect(error.code == 9201007).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_install_enterprise_re_signature_certificate_0110
   * @tc.number SUB_CUSTOMIZATION_EDM_INSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0110
   * @tc.desc   test securityManager installEnterpriseReSignatureCertificate
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_install_enterprise_re_signature_certificate_0110", Level.LEVEL2, async (done: Function) => {
    if (!checkEnterpriseDevice(done)) {
      return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
      });
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      try {
        securityManager.uninstallEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, INT_VALID_ACCOUNTID);
      } catch (err) {
        console.error(`EDM_TEST_LOG: Uninstall certificate failed, code: ${err.code}`);
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testUninstallEnterpriseReSignatureCertificate() {
  /**
   * @tc.name   test_uninstall_enterprise_re_signature_certificate_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0100
   * @tc.desc   test securityManager uninstallEnterpriseReSignatureCertificate without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_enterprise_re_signature_certificate_0100", Level.LEVEL2, async (done: Function) => {
    try {
      securityManager.uninstallEnterpriseReSignatureCertificate(
        SELFWANT, STRING_VALID_CERTIFICATEALIAS, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_enterprise_re_signature_certificate_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0101
   * @tc.desc   test securityManager uninstallEnterpriseReSignatureCertificate with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_enterprise_re_signature_certificate_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      securityManager.uninstallEnterpriseReSignatureCertificate(
        SELFWANT, STRING_VALID_CERTIFICATEALIAS, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_enterprise_re_signature_certificate_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0102
   * @tc.desc   test securityManager uninstallEnterpriseReSignatureCertificate with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_enterprise_re_signature_certificate_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.uninstallEnterpriseReSignatureCertificate(
        INVALID_WANT, STRING_VALID_CERTIFICATEALIAS, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_enterprise_re_signature_certificate_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0103
   * @tc.desc   test securityManager uninstallEnterpriseReSignatureCertificate with invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_enterprise_re_signature_certificate_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.uninstallEnterpriseReSignatureCertificate(
        SELFWANT, STRING_VALID_CERTIFICATEALIAS, INT_INVALID_ACCOUNTID_RE_SIGNATURE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_enterprise_re_signature_certificate_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0104
   * @tc.desc   test securityManager uninstallEnterpriseReSignatureCertificate with empty certificateAlias
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_enterprise_re_signature_certificate_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.uninstallEnterpriseReSignatureCertificate(
        SELFWANT, STRING_EMPTY_CERTIFICATEALIAS, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_enterprise_re_signature_certificate_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0105
   * @tc.desc   test securityManager uninstallEnterpriseReSignatureCertificate with invalid certificate
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_enterprise_re_signature_certificate_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.uninstallEnterpriseReSignatureCertificate(
        SELFWANT, STRING_INVALID_CERTIFICATEALIAS, INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_enterprise_re_signature_certificate_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0106
   * @tc.desc   test securityManager uninstallEnterpriseReSignatureCertificate with not exist certificate
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_enterprise_re_signature_certificate_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.uninstallEnterpriseReSignatureCertificate(
        SELFWANT, 'test_cert_99.cer', INT_VALID_ACCOUNTID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9201008).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_uninstall_enterprise_re_signature_certificate_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_UNINSTALL_ENTERPRISE_RE_SIGNATURE_CERTIFICATE_JS_0107
   * @tc.desc   test securityManager uninstallEnterpriseReSignatureCertificate
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_uninstall_enterprise_re_signature_certificate_0107", Level.LEVEL2, async (done: Function) => {
    if (!checkEnterpriseDevice(done)) {
      return;
    }
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      withCertificateFile((fd: number) => {
        securityManager.installEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, fd, INT_VALID_ACCOUNTID);
        securityManager.uninstallEnterpriseReSignatureCertificate(
          SELFWANT, STRING_VALID_CERTIFICATEALIAS, INT_VALID_ACCOUNTID);
      });
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}