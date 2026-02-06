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

import { describe, beforeAll, afterAll, it, expect, Level } from "@ohos/hypium";
import { ENTINFO1, SELFWANT, SELFHAPNAME, DEFAULT_USER_ID, INVALID_USER_ID, appIdsInit } from "../commom.ets";

import accountManager from '@ohos.enterprise.accountManager';
import adminManager from '@ohos.enterprise.adminManager';
import osAccount from '@ohos.account.osAccount';

export default function accountManagerTest() {

  describe('accountManager_test', () => {

    let localIds: Array<number> = [];

    beforeAll((done: Function) => {
      appIdsInit();
      done();
    })

    afterAll((done: Function) => {
      let osAccountManager = osAccount.getAccountManager();
      localIds.forEach((localId) => {
        osAccountManager.removeOsAccount(localId);
      })
      done();
    })

    // ------------- accountManager --------------------

    /**
     * @tc.name   disallowOsAccountAddition_test_001
     * @tc.number disallowOsAccountAddition_test_001
     * @tc.desc   disallowOsAccountAddition with normal admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true);
        console.info(' --- disallowOsAccountAddition_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_001 error 201 is expected, actually catch: ' + error.code);
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_001  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_002
     * @tc.number disallowOsAccountAddition_test_002
     * @tc.desc   disallowOsAccountAddition with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_002  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        console.info(' --- disallowOsAccountAddition_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_002 error 201 is expected, actually catch: ' + error.code);
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_002  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_001
     * @tc.number isOsAccountAdditionDisallowed_test_001
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT);
        console.info(' --- isOsAccountAdditionDisallowed_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_001 error 201 is expected, actually catch: ' + error.code);
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_002  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_002
     * @tc.number isOsAccountAdditionDisallowed_test_002
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_002  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT, DEFAULT_USER_ID);
        console.info(' --- isOsAccountAdditionDisallowed_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_002 error 201 is expected, actually catch: ' + error.code);
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_002  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_001
     * @tc.number addOsAccountAsync_test_001
     * @tc.desc   addOsAccountAsync with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        await accountManager.addOsAccountAsync(SELFWANT, "test_name", osAccount.OsAccountType.ADMIN);
        console.info(' --- addOsAccountAsync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_001 error 201 is expected, actually catch: ' + error.code);
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- addOsAccountAsync_test_001  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_001
     * @tc.number setDomainAccountPolicy_test_001
     * @tc.desc   setDomainAccountPolicy with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let domainAccountInfo: osAccount.DomainAccountInfo = {
        domain: '',
        accountName: '',
        serverConfigId: '',
      };

      let policy: accountManager.DomainAccountPolicy = {
        authenticationValidityPeriod: 120,
        passwordValidityPeriod: 90,
        passwordExpirationNotification: 60,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, domainAccountInfo, policy);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_001 error 201 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 201) || (error.code == 801)).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_001  -------- END --------');
    })

    /**
     * @tc.name   getDomainAccountPolicy_test_001
     * @tc.number getDomainAccountPolicy_test_001
     * @tc.desc   getDomainAccountPolicy with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDomainAccountPolicy_test_001  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let domainAccountInfo: osAccount.DomainAccountInfo = {
        domain: '',
        accountName: '',
        serverConfigId: '',
      };
      try {
        await accountManager.getDomainAccountPolicy(SELFWANT, domainAccountInfo);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_001 error 201 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 201) || (error.code == 801)).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_001  -------- END --------');
    })
  })
}
