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

const PATCH = 'patch';
const ENCRYPTION = 'encryption';
const INT_VALID_ACCOUNTID = 100;
const INT_INVALID_ACCOUNTID = 0xFFFFFFFF;
const UNKNOWN = 99;

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
  })
}

function testGetSecurityStatus() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0100
   * @tc.name      : test_get_security_status_0100
   * @tc.desc      : test securityManager without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0101
   * @tc.name      : test_get_security_status_0101
   * @tc.desc      : test securityManager with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_security_status_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0103
   * @tc.name      : test_get_security_status_0103
   * @tc.desc      : test securityManager unsupported item
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0104
   * @tc.name      : test_get_security_status_0104
   * @tc.desc      : test securityManager get patch tag
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0105
   * @tc.name      : test_get_security_status_0105
   * @tc.desc      : test securityManager get encryption status
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0106
   * @tc.name      : test_get_security_status_0106
   * @tc.desc      : test securityManager get root status
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_SECURITY_STATUS_JS_0107
   * @tc.name      : test_get_security_status_0107
   * @tc.desc      : test securityManager with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
}

function testSetPasswordPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0100
   * @tc.name      : test_set_password_policy_0100
   * @tc.desc      : test securityManager setPasswordPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0101
   * @tc.name      : test_set_password_policy_0101
   * @tc.desc      : test securityManager setPasswordPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_password_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0102
   * @tc.name      : test_set_password_policy_0102
   * @tc.desc      : test securityManager setPasswordPolicy with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0104
   * @tc.name      : test_set_password_policy_0104
   * @tc.desc      : test securityManager setPasswordPolicy no policy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0105
   * @tc.name      : test_set_password_policy_0105
   * @tc.desc      : test securityManager setPasswordPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0106
   * @tc.name      : test_set_password_policy_0106
   * @tc.desc      : test securityManager setPasswordPolicy with max validityPeriod
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PASSWORD_POLICY_JS_0107
   * @tc.name      : test_set_password_policy_0107
   * @tc.desc      : test securityManager setPasswordPolicy with out of range validityPeriod
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PASSWORD_POLICY_JS_0100
   * @tc.name      : test_get_password_policy_0100
   * @tc.desc      : test securityManager getPasswordPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PASSWORD_POLICY_JS_0101
   * @tc.name      : test_get_password_policy_0101
   * @tc.desc      : test securityManager getPasswordPolicy with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_password_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PASSWORD_POLICY_JS_0102
   * @tc.name      : test_get_password_policy_0102
   * @tc.desc      : test securityManager getPasswordPolicy with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PASSWORD_POLICY_JS_0103
   * @tc.name      : test_get_password_policy_0103
   * @tc.desc      : test securityManager getPasswordPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0100
   * @tc.name      : test_install_user_certificate_0100
   * @tc.desc      : test securityManager installUserCertificate without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0101
   * @tc.name      : test_install_user_certificate_0101
   * @tc.desc      : test securityManager installUserCertificate with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_install_user_certificate_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0102
   * @tc.name      : test_install_user_certificate_0102
   * @tc.desc      : test securityManager installUserCertificate with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0103
   * @tc.name      : test_install_user_certificate_0103
   * @tc.desc      : test securityManager installUserCertificate invalid cert
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0104
   * @tc.name      : test_install_user_certificate_0104
   * @tc.desc      : test securityManager installUserCertificate
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0105
   * @tc.name      : test_install_user_certificate_0105
   * @tc.desc      : test securityManager installUserCertificate with max alias
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0106
   * @tc.name      : test_install_user_certificate_0106
   * @tc.desc      : test securityManager installUserCertificate with invalid alias
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0201
   * @tc.name      : test_install_user_certificate_0201
   * @tc.desc      : test securityManager installUserCertificate  with normal admin and specific valid accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_install_user_certificate_0201", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0202
   * @tc.name      : test_install_user_certificate_0202
   * @tc.desc      : test securityManager installUserCertificate with invalid admin and specific valid accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0203
   * @tc.name      : test_install_user_certificate_0203
   * @tc.desc      : test securityManager installUserCertificate invalid cert with specific valid accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0204
   * @tc.name      : test_install_user_certificate_0204
   * @tc.desc      : test securityManager installUserCertificate with specific valid accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0205
   * @tc.name      : test_install_user_certificate_0205
   * @tc.desc      : test securityManager installUserCertificate with specific invalid accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0206
   * @tc.name      : test_install_user_certificate_0206
   * @tc.desc      : test securityManager installUserCertificate with max alias and specific valid accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_install_user_certificate_0206", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let path: string = securityManager.installUserCertificate(SELFWANT, CERTIFICATE_MAX_ALIAS, INT_VALID_ACCOUNTID);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0207
   * @tc.name      : test_install_user_certificate_0207
   * @tc.desc      : test securityManager installUserCertificate with invalid alias
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_INSTALL_USER_CERTIFICATE_JS_0208
   * @tc.name      : test_install_user_certificate_0208
   * @tc.desc      : test securityManager installUserCertificate  without active admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_USER_CERTIFICATES_SYNC_JS_0101
   * @tc.name      : test_get_user_certificates_sync_0101
   * @tc.desc      : test securityManager getUserCertificatesSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_user_certificates_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_USER_CERTIFICATES_SYNC_JS_0102
   * @tc.name      : test_get_user_certificates_sync_0102
   * @tc.desc      : test securityManager getUserCertificatesSync with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_USER_CERTIFICATES_SYNC_JS_0103
   * @tc.name      : test_get_user_certificates_sync_0103
   * @tc.desc      : test securityManager getUserCertificatesSync success
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_USER_CERTIFICATES_SYNC_JS_0104
   * @tc.name      : test_get_user_certificates_sync_0104
   * @tc.desc      : test securityManager getUserCertificatesSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0100
   * @tc.name      : test_uninstall_user_certificate_0100
   * @tc.desc      : test securityManager uninstallUserCertificate without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0101
   * @tc.name      : test_uninstall_user_certificate_0101
   * @tc.desc      : test securityManager uninstallUserCertificate with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_uninstall_user_certificate_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0102
   * @tc.name      : test_uninstall_user_certificate_0102
   * @tc.desc      : test securityManager uninstallUserCertificate with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0103
   * @tc.name      : test_uninstall_user_certificate_0103
   * @tc.desc      : test securityManager uninstallUserCertificate with invalid path
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_UNINSTALL_USER_CERTIFICATE_JS_0104
   * @tc.name      : test_uninstall_user_certificate_0104
   * @tc.desc      : test securityManager uninstallUserCertificate
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0100
   * @tc.name      : test_set_clipboard_policy_0100
   * @tc.desc      : test securityManager setAppClipboardPolicy without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0200
   * @tc.name      : test_set_clipboard_policy_0200
   * @tc.desc      : test securityManager setAppClipboardPolicy without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_clipboard_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0300
   * @tc.name      : test_set_clipboard_policy_0300
   * @tc.desc      : test securityManager setAppClipboardPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0400
   * @tc.name      : test_set_clipboard_policy_0400
   * @tc.desc      : test securityManager setAppClipboardPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0500
   * @tc.name      : test_set_clipboard_policy_0500
   * @tc.desc      : test securityManager setAppClipboardPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0600
   * @tc.name      : test_set_clipboard_policy_0600
   * @tc.desc      : test securityManager setAppClipboardPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0700
   * @tc.name      : test_set_clipboard_policy_0700
   * @tc.desc      : test securityManager setAppClipboardPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0800
   * @tc.name      : test_set_clipboard_policy_0800
   * @tc.desc      : test securityManager setAppClipboardPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0900
   * @tc.name      : test_set_clipboard_policy_0900
   * @tc.desc      : test securityManager setAppClipboardPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_CLIPBOARD_POLICY_JS_0100
   * @tc.name      : test_get_clipboard_policy_0100
   * @tc.desc      : test securityManager getAppClipboardPolicy without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0200
   * @tc.name      : test_get_clipboard_policy_0200
   * @tc.desc      : test securityManager getAppClipboardPolicy without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_clipboard_policy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0300
   * @tc.name      : test_get_clipboard_policy_0300
   * @tc.desc      : test securityManager getAppClipboardPolicy without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_CLIPBOARD_POLICY_JS_0400
   * @tc.name      : test_get_clipboard_policy_0400
   * @tc.desc      : test securityManager getAppClipboardPolicy without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0500
   * @tc.name      : test_get_clipboard_policy_0500
   * @tc.desc      : test securityManager getAppClipboardPolicy without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_clipboard_policy_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_JS_0600
   * @tc.name      : test_get_clipboard_policy_0600
   * @tc.desc      : test securityManager getAppClipboardPolicy with super admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0100
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_0100
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0200
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_0200
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_clipboard_policy_by_bundle_name_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0300
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_0300
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0400
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_0400
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName without  bundleName and userId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0500
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_0500
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName without userId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0600
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_0600
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName without bundleName
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0700
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_0700
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName without policy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0800
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_0800
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName policy is IN_APP
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0900
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_0900
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName with invalid bundleName
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_1000
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_1000
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName policy is DEFAULT
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_1100
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_1100
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName policy is LOCAL_DEVICE
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_1200
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_1200
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName policy is CROSS_DEVICE
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_1300
   * @tc.name      : test_set_clipboard_policy_by_bundle_name_1300
   * @tc.desc      : test securityManager setAppClipboardPolicyByBundleName policy is UNKNOWN
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0100
   * @tc.name      : test_get_clipboard_policy_by_bundle_name_0100
   * @tc.desc      : test securityManager getAppClipboardPolicyByBundleName without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0200
   * @tc.name      : test_get_clipboard_policy_by_bundle_name_0200
   * @tc.desc      : test securityManager getAppClipboardPolicyByBundleName without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_clipboard_policy_by_bundle_name_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0300
   * @tc.name      : test_get_clipboard_policy_by_bundle_name_0300
   * @tc.desc      : test securityManager getAppClipboolicyByBundleName without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0400
   * @tc.name      : test_get_clipboard_policy_by_bundle_name_0400
   * @tc.desc      : test securityManager getAppClipboolicyByBundleName without bundleName
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_CLIPBOARD_POLICY_BY_BUNDLE_NAME_JS_0500
   * @tc.name      : test_get_clipboard_policy_by_bundle_name_0500
   * @tc.desc      : test securityManager getAppClipboolicyByBundleName without userId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0100
   * @tc.name      : test_set_watermark_image_0100
   * @tc.desc      : test securityManager setWatermarkImage without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0101
   * @tc.name      : test_set_watermark_image_0101
   * @tc.desc      : test securityManager setWatermarkImage with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_watermark_image_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0102
   * @tc.name      : test_set_watermark_image_0102
   * @tc.desc      : test securityManager setWatermarkImage with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0103
   * @tc.name      : test_set_watermark_image_0103
   * @tc.desc      : test securityManager setWatermarkImage with bundleName empty
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0104
   * @tc.name      : test_set_watermark_image_0104
   * @tc.desc      : test securityManager setWatermarkImage with source empty
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0105
   * @tc.name      : test_set_watermark_image_0105
   * @tc.desc      : test securityManager setWatermarkImage with accountId empty
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WATERMARK_IMAGE_JS_0106
   * @tc.name      : test_set_watermark_image_0106
   * @tc.desc      : test securityManager setWatermarkImage
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0100
   * @tc.name      : test_cancel_watermark_image_0100
   * @tc.desc      : test securityManager cancelWatermarkImage without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0101
   * @tc.name      : test_cancel_watermark_image_0101
   * @tc.desc      : test securityManager cancelWatermarkImage with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_cancel_watermark_image_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0102
   * @tc.name      : test_cancel_watermark_image_0102
   * @tc.desc      : test securityManager cancelWatermarkImage with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0103
   * @tc.name      : test_cancel_watermark_image_0103
   * @tc.desc      : test securityManager cancelWatermarkImage with bundleName empty
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_CANCEL_WATERMARK_IMAGE_JS_0104
   * @tc.name      : test_cancel_watermark_image_0104
   * @tc.desc      : test securityManager cancelWatermarkImage with accountId empty
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0100
   * @tc.name      : test_set_permission_managed_state_0100
   * @tc.desc      : test securityManager setPermissionManagedState without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0200
   * @tc.name      : test_set_permission_managed_state_0200
   * @tc.desc      : test securityManager setPermissionManagedState without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_permission_managed_state_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0300
   * @tc.name      : test_set_permission_managed_state_0300
   * @tc.desc      : test securityManager setPermissionManagedState without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0400
   * @tc.name      : test_set_permission_managed_state_0400
   * @tc.desc      : test securityManager setPermissionManagedState without appInstance
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0500
   * @tc.name      : test_set_permission_managed_state_0500
   * @tc.desc      : test securityManager setPermissionManagedState without managed state
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0600
   * @tc.name      : test_set_permission_managed_state_0600
   * @tc.desc      : test securityManager setPermissionManagedState with invalid appInstance
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_permission_managed_state_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_INVALID_APP_INSTANCE, TEST_PERMISSION_LIST_1, TEST_PERMISSION_MANAGED_STATE_GRANTED);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

    /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0700
   * @tc.name      : test_set_permission_managed_state_0700
   * @tc.desc      : test securityManager setPermissionManagedState with default permission state
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_permission_managed_state_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, TEST_PERMISSION_MANAGED_STATE_DEFAULT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200012).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_PERMISSION_MANAGED_STATE_JS_0800
   * @tc.name      : test_set_permission_managed_state_0800
   * @tc.desc      : test securityManager setPermissionManagedState set granted state
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_permission_managed_state_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      securityManager.setPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_LIST_1, TEST_PERMISSION_MANAGED_STATE_GRANTED)
      let managedState: securityManager.PermissionManagedState = securityManager.getPermissionManagedState(SELFWANT, TEST_APP_INSTANCE, TEST_PERMISSION_1);
      expect(managedState == TEST_PERMISSION_MANAGED_STATE_GRANTED).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetPermissionManagedState() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0100
   * @tc.name      : test_get_permission_managed_state_0100
   * @tc.desc      : test securityManager getPermissionManagedState without activated admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0200
   * @tc.name      : test_get_permission_managed_state_0200
   * @tc.desc      : test securityManager getPermissionManagedState without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_permission_managed_state_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0300
   * @tc.name      : test_get_permission_managed_state_0300
   * @tc.desc      : test securityManager getPermissionManagedState without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0400
   * @tc.name      : test_get_permission_managed_state_0400
   * @tc.desc      : test securityManager getPermissionManagedState without appInstance
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0500
   * @tc.name      : test_get_permission_managed_state_0500
   * @tc.desc      : test securityManager getPermissionManagedState without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_PERMISSION_MANAGED_STATE_JS_0600
   * @tc.name      : test_get_permission_managed_state_0600
   * @tc.desc      : test securityManager getPermissionManagedState with invalid appInstance
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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