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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE } from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import browser from '@ohos.enterprise.browser';

export default function browserManagerTest() {
  describe('browserManager_test', function () {
    /**
    * @tc.number    : SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0100
    * @tc.name      : test_setpolicysync_0100
    * @tc.desc      : test setPolicySync method without active administration
    * @tc.level     : Level 2
    * @tc.type      : Function
    * @tc.size      : MediumTest
    */ 
    it("test_setpolicysync_0100", 0, async function (done) {
      try {
        browser.setPolicySync(SELFWANT, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0200
     * @tc.name      : test_setpolicysync_0200
     * @tc.desc      : test setPolicySync method without permission
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setpolicysync_0200", 0, async function (done) {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0300
     * @tc.name      : test_setpolicysync_0300
     * @tc.desc      : test setPolicySync method with admin is empty
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setpolicysync_0300", 0, async function (done) {
      try {
        browser.setPolicySync(null, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0400
     * @tc.name      : test_setpolicysync_0400
     * @tc.desc      : test setPolicySync method with appid is empty
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setpolicysync_0400", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0500
     * @tc.name      : test_setpolicysync_0500
     * @tc.desc      : test setPolicySync method
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setpolicysync_0500", 0, async function (done) {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        browser.setPolicySync(SELFWANT, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE);
        let data: string = browser.getPoliciesSync(SELFWANT, TEST_APP_ID_1);
        let policy: any = JSON.parse(data);
        expect(policy[TEST_POLICY_NAME] == TEST_POLICY_VALUE).assertTrue;

        browser.setPolicySync(SELFWANT, TEST_APP_ID_1, TEST_POLICY_NAME, "");
        let data2: string = browser.getPoliciesSync(SELFWANT, TEST_APP_ID_1);
        let policy2: any = JSON.parse(data2);
        expect(policy2[TEST_POLICY_NAME] == "").assertTrue;
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_SETPOLICYSYNC_0600
     * @tc.name      : test_setpolicysync_0600
     * @tc.desc      : test setPolicySync method with empty policyName
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_setpolicysync_0600", 0, async function (done) {
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

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETPOLICIESSYNC_0100
     * @tc.name      : test_getpolicysync_0100
     * @tc.desc      : test getPoliciesSync method without active administration
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getpolicysync_0100", 0, async function (done) {
      try {
        browser.getPoliciesSync(SELFWANT, TEST_APP_ID_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETPOLICIESSYNC_0200
     * @tc.name      : test_getpolicysync_0200
     * @tc.desc      : test getPoliciesSync method without permission
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getpolicysync_0200", 0, async function (done) {
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
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETPOLICIESSYNC_0300
     * @tc.name      : test_getpolicysync_0300
     * @tc.desc      : test getPoliciesSync method with admin is empty
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getpolicysync_0300", 0, async function (done) {
      try {
        browser.getPoliciesSync(null, TEST_APP_ID_1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GETPOLICIESSYNC_0400
     * @tc.name      : test_getpolicysync_0400
     * @tc.desc      : test getPoliciesSync method with appid is empty
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_getpolicysync_0400", 0, async function (done) {
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
  })
}