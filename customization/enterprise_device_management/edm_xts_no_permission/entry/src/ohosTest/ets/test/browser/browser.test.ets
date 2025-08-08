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

import { describe, expect, it } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE,
  INVALID_WANT} from '../commom.ets';
import { util } from '@kit.ArkTS';


import adminManager from '@ohos.enterprise.adminManager';
import browser from '@ohos.enterprise.browser';

export default function browserManagerTest() {
  describe('browserManager_test', () => {
    testSetPolicySync();
    testSetManagedBrowserPolicy();
  })
}

function testSetPolicySync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0100
   * @tc.name      : test_setpolicysync_0100
   * @tc.desc      : test setPolicySync method without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_setpolicysync_0100", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      browser.setPolicySync(SELFWANT, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  })
}

function testSetManagedBrowserPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0100
   * @tc.name      : test_setManagedBrowserPolicy_0100
   * @tc.desc      : test setManagedBrowserPolicy method without permission
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_setManagedBrowserPolicy_0100", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      browser.setManagedBrowserPolicy(SELFWANT, SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  })
}

function testGetManagedBrowserPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GETMANAGEDBROWSERPOLICY_0100
   * @tc.name      : test_getManagedBrowserPolicy_0100
   * @tc.desc      : test getManagedBrowserPolicy method without active administration
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_getManagedBrowserPolicy_0100", 0, async (done: Function) => {
    try {
      browser.getManagedBrowserPolicy(SELFWANT, SELFHAPNAME);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  })

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GETMANAGEDBROWSERPOLICY_0200
   * @tc.name      : test_getManagedBrowserPolicy_0200
   * @tc.desc      : test getManagedBrowserPolicy method with appid is empty
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_getManagedBrowserPolicy_0200", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.getManagedBrowserPolicy(SELFWANT, "");
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GETMANAGEDBROWSERPOLICY_0300
   * @tc.name      : test_getManagedBrowserPolicy_0300
   * @tc.desc      : test getManagedBrowserPolicy method with invalid want
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_getManagedBrowserPolicy_0300", 0, async (done: Function) => {
    try {
      browser.getManagedBrowserPolicy(INVALID_WANT, SELFHAPNAME);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  })
}

function testGetSelfManagedBrowserPolicyVersion() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GETSELFMANAGEDBROWSERPOLICYVERSION_0100
   * @tc.name      : test_getSelfManagedBrowserPolicyVersion_0100
   * @tc.desc      : test getSelfManagedBrowserPolicyVersion
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_getSelfManagedBrowserPolicyVersion_0100", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFWANT, SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      let version: string = browser.getSelfManagedBrowserPolicyVersion();
      expect(version === "1").assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })
}

function testGetSelfManagedBrowserPolicy() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GETSELFMANAGEDBROWSERPOLICY_0100
   * @tc.name      : test_getSelfManagedBrowserPolicy_0100
   * @tc.desc      : test getSelfManagedBrowserPolicy
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_getSelfManagedBrowserPolicy_0100", 0, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFWANT, SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      let buffer: ArrayBuffer = browser.getSelfManagedBrowserPolicy();
      let intBuffer = new Uint8Array(buffer);
      let decoder = util.TextDecoder.create('utf-8');
      let stringData = decoder.decodeWithStream(intBuffer);
      expect(JSON.parse(stringData)[TEST_POLICY_NAME] == JSON.parse(TEST_POLICY_VALUE)).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })
}