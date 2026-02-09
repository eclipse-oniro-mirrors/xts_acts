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

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE,
  INVALID_WANT} from '../commom.ets';
import { util } from '@kit.ArkTS';


import adminManager from '@ohos.enterprise.adminManager';
import browser from '@ohos.enterprise.browser';

export default function browserManagerTest() {
  describe('browserManager_test', () => {
    testSetPolicySync();
    testGetpolicySync();
    testSetManagedBrowserPolicy();
    testGetManagedBrowserPolicy();
    testGetSelfManagedBrowserPolicyVersion();
    testGetSelfManagedBrowserPolicy();
  })
}

function testSetPolicySync() {
  /**
   * @tc.name   test_setpolicysync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0100
   * @tc.desc   test setPolicySync method without active administration
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setpolicysync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      browser.setPolicySync(SELFWANT, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  })

  /**
   * @tc.name   test_setpolicysync_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0200
   * @tc.desc   test setPolicySync method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setpolicysync_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      browser.setPolicySync(SELFWANT, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  })

  /**
   * @tc.name   test_setpolicysync_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0300
   * @tc.desc   test setPolicySync method with admin is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setpolicysync_0300", Level.LEVEL2, async (done: Function) => {
    try {
      browser.setPolicySync(null, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  })

  /**
   * @tc.name   test_setpolicysync_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0400
   * @tc.desc   test setPolicySync method with appid is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setpolicysync_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setPolicySync(SELFWANT, "", TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setpolicysync_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0500
   * @tc.desc   test setPolicySync method
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setpolicysync_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setPolicySync(SELFWANT, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      let data: string = browser.getPoliciesSync(SELFWANT, TEST_APP_ID_1);
      let policy: Array<string> = JSON.parse(data);
      expect(policy[TEST_POLICY_NAME] == TEST_POLICY_VALUE).assertTrue;

      browser.setPolicySync(SELFWANT, TEST_APP_ID_1, TEST_POLICY_NAME, "");
      let data2: string = browser.getPoliciesSync(SELFWANT, TEST_APP_ID_1);
      let policy2: Array<string> = JSON.parse(data2);
      expect(policy2[TEST_POLICY_NAME] == "").assertTrue;
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setpolicysync_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0600
   * @tc.desc   test setPolicySync method with empty policyName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setpolicysync_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setPolicySync(SELFWANT, TEST_APP_ID_1, "", TEST_POLICY_VALUE);
      expect(browser.getPoliciesSync(SELFWANT, TEST_APP_ID_1) == TEST_POLICY_VALUE).assertTrue;

      browser.setPolicySync(SELFWANT, TEST_APP_ID_1, "", "");
      expect(browser.getPoliciesSync(SELFWANT, TEST_APP_ID_1) == "").assertTrue;
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })
}

function testGetpolicySync() {
  /**
   * @tc.name   test_getpolicysync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETPOLICIESSYNC_0100
   * @tc.desc   test getPoliciesSync method without active administration
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getpolicysync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      browser.getPoliciesSync(SELFWANT, TEST_APP_ID_1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  })

  /**
   * @tc.name   test_getpolicysync_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GETPOLICIESSYNC_0200
   * @tc.desc   test getPoliciesSync method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getpolicysync_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      browser.getPoliciesSync(SELFWANT, TEST_APP_ID_1);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  })

  /**
   * @tc.name   test_getpolicysync_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GETPOLICIESSYNC_0300
   * @tc.desc   test getPoliciesSync method with admin is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getpolicysync_0300", Level.LEVEL2, async (done: Function) => {
    try {
      browser.getPoliciesSync(null, TEST_APP_ID_1);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  })

  /**
   * @tc.name   test_getpolicysync_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GETPOLICIESSYNC_0400
   * @tc.desc   test getPoliciesSync method with appid is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getpolicysync_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.getPoliciesSync(SELFWANT, "");
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })
}

function testSetManagedBrowserPolicy() {
  /**
   * @tc.name   test_setManagedBrowserPolicy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0100
   * @tc.desc   test setManagedBrowserPolicy method without active administration
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      browser.setManagedBrowserPolicy(SELFWANT, SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0200
   * @tc.desc   test setManagedBrowserPolicy method without permission
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      browser.setManagedBrowserPolicy(SELFWANT, SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0300
   * @tc.desc   test setManagedBrowserPolicy method with appid is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFWANT, "", TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0400
   * @tc.desc   test setManagedBrowserPolicy method with policy name is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFWANT, SELFHAPNAME, "", TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0500
   * @tc.desc   test setManagedBrowserPolicy method with invalid want
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0500", Level.LEVEL2, async (done: Function) => {
    try {
      browser.setManagedBrowserPolicy(INVALID_WANT, SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  })

  /**
   * @tc.name   test_setManagedBrowserPolicy_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SETMANAGEDBROWSERPOLICY_0600
   * @tc.desc   test setManagedBrowserPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_setManagedBrowserPolicy_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      browser.setManagedBrowserPolicy(SELFWANT, SELFHAPNAME, TEST_POLICY_NAME, TEST_POLICY_VALUE);
      let buffer: ArrayBuffer = browser.getManagedBrowserPolicy(SELFWANT, SELFHAPNAME);
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

function testGetManagedBrowserPolicy() {
  /**
   * @tc.name   test_getManagedBrowserPolicy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETMANAGEDBROWSERPOLICY_0100
   * @tc.desc   test getManagedBrowserPolicy method without active administration
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getManagedBrowserPolicy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      browser.getManagedBrowserPolicy(SELFWANT, SELFHAPNAME);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  })

  /**
   * @tc.name   test_getManagedBrowserPolicy_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GETMANAGEDBROWSERPOLICY_0200
   * @tc.desc   test getManagedBrowserPolicy method with appid is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getManagedBrowserPolicy_0200", Level.LEVEL2, async (done: Function) => {
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
   * @tc.name   test_getManagedBrowserPolicy_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GETMANAGEDBROWSERPOLICY_0300
   * @tc.desc   test getManagedBrowserPolicy method with invalid want
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getManagedBrowserPolicy_0300", Level.LEVEL2, async (done: Function) => {
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
   * @tc.name   test_getSelfManagedBrowserPolicyVersion_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETSELFMANAGEDBROWSERPOLICYVERSION_0100
   * @tc.desc   test getSelfManagedBrowserPolicyVersion
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getSelfManagedBrowserPolicyVersion_0100", Level.LEVEL2, async (done: Function) => {
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
   * @tc.name   test_getSelfManagedBrowserPolicy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GETSELFMANAGEDBROWSERPOLICY_0100
   * @tc.desc   test getSelfManagedBrowserPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_getSelfManagedBrowserPolicy_0100", Level.LEVEL2, async (done: Function) => {
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