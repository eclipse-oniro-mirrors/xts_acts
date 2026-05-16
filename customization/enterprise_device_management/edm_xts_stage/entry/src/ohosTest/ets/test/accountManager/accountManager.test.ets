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
import { ENTINFO1, SELFWANT, SELFHAPNAME, DEFAULT_USER_ID, INVALID_USER_ID, appIdsInit,
  INVALID_WANT, DOMAIN_ACCOUNT_INFO1, DOMAIN_ACCOUNT_POLICY1 } from "../commom.ets";

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

    afterAll(async (done: Function) => {
      let osAccountManager = osAccount.getAccountManager();
      localIds.forEach((localId) => {
        osAccountManager.removeOsAccount(localId);
      })

      console.info(' --- resetDomainAccountPolicy  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy: accountManager.DomainAccountPolicy = {};
      try {
        accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy);
      } catch (error) {
        console.info(' --- resetDomainAccountPolicy error 801 is expected, actually catch: ' + error.code);
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      console.info(' --- resetDomainAccountPolicy  -------- END --------');
      done();
    })

    // ------------- accountManager --------------------

    /**
     * @tc.name   disallowOsAccountAddition_test_001
     * @tc.number disallowOsAccountAddition_test_001
     * @tc.desc   disallowOsAccountAddition with inactive admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_001", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- disallowOsAccountAddition_test_001  -------- START --------');
        accountManager.disallowOsAccountAddition(SELFWANT, true);
        console.info(' --- disallowOsAccountAddition_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_001 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_001  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_002
     * @tc.number disallowOsAccountAddition_test_002
     * @tc.desc   disallowOsAccountAddition with inactive admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_002", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- disallowOsAccountAddition_test_002  -------- START --------');
        accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        console.info(' --- disallowOsAccountAddition_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_002 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_002  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_003
     * @tc.number disallowOsAccountAddition_test_003
     * @tc.desc   disallowOsAccountAddition with normal admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_003  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true);
        console.info(' --- disallowOsAccountAddition_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_003 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_003  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_004
     * @tc.number disallowOsAccountAddition_test_004
     * @tc.desc   disallowOsAccountAddition with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_004  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        console.info(' --- disallowOsAccountAddition_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_004 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_004  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_005
     * @tc.number disallowOsAccountAddition_test_005
     * @tc.desc   disallowOsAccountAddition without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_005  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        accountManager.disallowOsAccountAddition(null, true);
        console.info(' --- disallowOsAccountAddition_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_005  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_006
     * @tc.number disallowOsAccountAddition_test_006
     * @tc.desc   disallowOsAccountAddition with super admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_006  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true);
        expect(true).assertTrue();
        let queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT);
        expect(queryResult).assertTrue();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null);
        expect(queryResult).assertTrue();
        accountManager.disallowOsAccountAddition(SELFWANT, false);
        queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT);
        expect(queryResult).assertFalse();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null);
        expect(queryResult).assertFalse();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_006 error is unexpected, actually catch: ' + error.code);

        expect(false).assertTrue();
      } finally {
        accountManager.disallowOsAccountAddition(SELFWANT, false);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_006  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_007
     * @tc.number disallowOsAccountAddition_test_007
     * @tc.desc   disallowOsAccountAddition with super admin and with current accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_007", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_007  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        expect(true).assertTrue();
        let queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT, DEFAULT_USER_ID);
        expect(queryResult).assertTrue();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null, DEFAULT_USER_ID);
        expect(queryResult).assertTrue();
        accountManager.disallowOsAccountAddition(SELFWANT, false, DEFAULT_USER_ID);
        queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT, DEFAULT_USER_ID);
        expect(queryResult).assertFalse();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null, DEFAULT_USER_ID);
        expect(queryResult).assertFalse();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_007 error is unexpected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        accountManager.disallowOsAccountAddition(SELFWANT, false, DEFAULT_USER_ID);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_007  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_008
     * @tc.number disallowOsAccountAddition_test_008
     * @tc.desc   disallowOsAccountAddition with super admin and with another accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_008", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_008  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- disallowOsAccountAddition_test_008 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.ADMIN);
        localId = newAccount.localId;
        localIds.push(localId);
        console.info(' --- disallowOsAccountAddition_test_008 newAccount.localId: ' + localId);
        accountManager.disallowOsAccountAddition(SELFWANT, true, localId);
        expect(true).assertTrue();
        let queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT, localId);
        expect(queryResult).assertTrue();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null, localId);
        expect(queryResult).assertTrue();
        accountManager.disallowOsAccountAddition(SELFWANT, false, localId);
        queryResult = accountManager.isOsAccountAdditionDisallowed(SELFWANT, localId);
        expect(queryResult).assertFalse();
        queryResult = accountManager.isOsAccountAdditionDisallowed(null, localId);
        expect(queryResult).assertFalse();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_008 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        if (isMultiAccountEnabled) {
          accountManager.disallowOsAccountAddition(SELFWANT, false, localId);
        }
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_008  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_009
     * @tc.number disallowOsAccountAddition_test_009
     * @tc.desc   disallowOsAccountAddition with super admin and with non-exist accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_009", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_009  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, INVALID_USER_ID);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_009 error 401 is expected, actually catch: ' + error.code);
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_009  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0010
     * @tc.number disallowOsAccountAddition_test_0010
     * @tc.desc   repeat call disallowOsAccountAddition with super admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0010", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_0010  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true);
        expect(true).assertTrue();
        accountManager.disallowOsAccountAddition(SELFWANT, true);
        expect(true).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0010 error is unexpected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        accountManager.disallowOsAccountAddition(SELFWANT, false);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0010  -------- END --------');
    })

    /**
     * @tc.name   disallowOsAccountAddition_test_0011
     * @tc.number disallowOsAccountAddition_test_0011
     * @tc.desc   repeat call disallowOsAccountAddition with super admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("disallowOsAccountAddition_test_0011", Level.LEVEL2, async (done: Function) => {
      console.info(' --- disallowOsAccountAddition_test_0011  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        expect(true).assertTrue();
        accountManager.disallowOsAccountAddition(SELFWANT, true, DEFAULT_USER_ID);
        expect(true).assertTrue();
      } catch (error) {
        console.info(' --- disallowOsAccountAddition_test_0011 error is unexpected, actually catch: ' + error.code);
        expect(false).assertTrue();
      } finally {
        accountManager.disallowOsAccountAddition(SELFWANT, false, DEFAULT_USER_ID);
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0011  -------- END --------');
    })


    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_001
     * @tc.number isOsAccountAdditionDisallowed_test_001
     * @tc.desc   isOsAccountAdditionDisallowed with inactive admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_001", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- isOsAccountAdditionDisallowed_test_001  -------- START --------');
        accountManager.isOsAccountAdditionDisallowed(SELFWANT);
        console.info(' --- isOsAccountAdditionDisallowed_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_001 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_001  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_002
     * @tc.number isOsAccountAdditionDisallowed_test_002
     * @tc.desc   isOsAccountAdditionDisallowed with inactive admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_002", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- isOsAccountAdditionDisallowed_test_002  -------- START --------');
        accountManager.isOsAccountAdditionDisallowed(SELFWANT, DEFAULT_USER_ID);
        console.info(' --- isOsAccountAdditionDisallowed_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_002 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_002  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_003
     * @tc.number isOsAccountAdditionDisallowed_test_003
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and without accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_003  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT);
        console.info(' --- isOsAccountAdditionDisallowed_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_003 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_003  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_004
     * @tc.number isOsAccountAdditionDisallowed_test_004
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_004  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        accountManager.isOsAccountAdditionDisallowed(SELFWANT, DEFAULT_USER_ID);
        console.info(' --- isOsAccountAdditionDisallowed_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_004 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_004  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_005
     * @tc.number isOsAccountAdditionDisallowed_test_005
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_005  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(INVALID_WANT, DEFAULT_USER_ID);
        console.info(' --- isOsAccountAdditionDisallowed_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_005 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_005  -------- END --------');
    })

    /**
     * @tc.name   isOsAccountAdditionDisallowed_test_006
     * @tc.number isOsAccountAdditionDisallowed_test_006
     * @tc.desc   isOsAccountAdditionDisallowed with normal admin and with accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("isOsAccountAdditionDisallowed_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- isOsAccountAdditionDisallowed_test_006  -------- START --------');
      try {
        accountManager.isOsAccountAdditionDisallowed(INVALID_WANT);
        console.info(' --- isOsAccountAdditionDisallowed_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- isOsAccountAdditionDisallowed_test_006 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 401).assertTrue();
      }
      done();
      console.info(' --- isOsAccountAdditionDisallowed_test_006  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_001
     * @tc.number addOsAccountAsync_test_001
     * @tc.desc   addOsAccountAsync with inactive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_001", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- addOsAccountAsync_test_001  -------- START --------');
        await accountManager.addOsAccountAsync(SELFWANT, "test_name", osAccount.OsAccountType.ADMIN);
        console.info(' --- addOsAccountAsync_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_001 error 9200001 is expected, actually catch: ' + error.code);
        expect(error.code == 9200001).assertTrue();
      }
      done();
      console.info(' --- addOsAccountAsync_test_001  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_002
     * @tc.number addOsAccountAsync_test_002
     * @tc.desc   addOsAccountAsync with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_002  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        await accountManager.addOsAccountAsync(SELFWANT, "test_name", osAccount.OsAccountType.ADMIN);
        console.info(' --- addOsAccountAsync_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_002 error 9200002 is expected, actually catch: ' + error.code);
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- addOsAccountAsync_test_002  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_003
     * @tc.number addOsAccountAsync_test_003
     * @tc.desc   addOsAccountAsync without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_003  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        await accountManager.addOsAccountAsync(null, "test_name", osAccount.OsAccountType.ADMIN);
        console.info(' --- addOsAccountAsync_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- addOsAccountAsync_test_003  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_004
     * @tc.number addOsAccountAsync_test_004
     * @tc.desc   addOsAccountAsync with super admin to create admin account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_004  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name2";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- addOsAccountAsync_test_004 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.ADMIN);
        localId = newAccount.localId;
        localIds.push(localId);
        console.info(' --- addOsAccountAsync_test_004 newAccount.localId: ' + localId);
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_004 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_004  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_005
     * @tc.number addOsAccountAsync_test_005
     * @tc.desc   addOsAccountAsync with super admin to create normal account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_005  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name3";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- addOsAccountAsync_test_005 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.NORMAL);
        localId = newAccount.localId;
        localIds.push(localId);
        console.info(' --- addOsAccountAsync_test_005 newAccount.localId: ' + localId);
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_005 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_005  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_006
     * @tc.number addOsAccountAsync_test_006
     * @tc.desc   addOsAccountAsync with super admin to create guest account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_006  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name4";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- addOsAccountAsync_test_006 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.GUEST);
        localId = newAccount.localId;
        localIds.push(localId);
        console.info(' --- addOsAccountAsync_test_006 newAccount.localId: ' + localId);
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_006 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_006  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_007
     * @tc.number addOsAccountAsync_test_007
     * @tc.desc   addOsAccountAsync with invalid account name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_007", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_007  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "err_name";
      for (let i = 0; i < 1024; i++) {
        accountName = accountName.concat('a');
      }
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.ADMIN);
        console.info(' --- addOsAccountAsync_test_007 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_007 error 9201003 is expected, actually catch: ' + error.code);
        expect(error.code == 9201003).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_007  -------- END --------');
    })

    /**
     * @tc.name   addOsAccountAsync_test_008
     * @tc.number addOsAccountAsync_test_008
     * @tc.desc   addOsAccountAsync with invalid account type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addOsAccountAsync_test_008", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addOsAccountAsync_test_008  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name";
      let wrongType = 99999;
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT, accountName, wrongType);
        console.info(' --- addOsAccountAsync_test_008 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_008 error 401 is expected, actually catch: ' + error.code);
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_008  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_001
     * @tc.number setDomainAccountPolicy_test_001
     * @tc.desc   setDomainAccountPolicy with inactive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_001", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- setDomainAccountPolicy_test_001  -------- START --------');
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, DOMAIN_ACCOUNT_POLICY1);
        console.info(' --- setDomainAccountPolicy_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_001 error 9200001 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 9200001) || (error.code == 801)).assertTrue();
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_001  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_002
     * @tc.number setDomainAccountPolicy_test_002
     * @tc.desc   setDomainAccountPolicy with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_002", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- setDomainAccountPolicy_test_002  -------- START --------');
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, DOMAIN_ACCOUNT_POLICY1);
        console.info(' --- setDomainAccountPolicy_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_002 error 9200002 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 9200002) || (error.code == 801)).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_002  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_003
     * @tc.number setDomainAccountPolicy_test_003
     * @tc.desc   setDomainAccountPolicy without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_003  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.setDomainAccountPolicy(null, DOMAIN_ACCOUNT_INFO1, DOMAIN_ACCOUNT_POLICY1);
        console.info(' --- setDomainAccountPolicy_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_003 error 401 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 401) || (error.code == 801)).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_003  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_004
     * @tc.number setDomainAccountPolicy_test_004
     * @tc.desc   setDomainAccountPolicy with super admin to set empty domain account policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_004  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy: accountManager.DomainAccountPolicy = {};
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy);
        let getPolicy: accountManager.DomainAccountPolicy = accountManager.getDomainAccountPolicy(SELFWANT,
          DOMAIN_ACCOUNT_INFO1);
        expect(getPolicy.authenticationValidityPeriod == -1).assertTrue();
        expect(getPolicy.passwordValidityPeriod == -1).assertTrue();
        expect(getPolicy.passwordExpirationNotification == 0).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_004 error 801 is expected, actually catch: ' + error.code);
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_004  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_005
     * @tc.number setDomainAccountPolicy_test_005
     * @tc.desc   setDomainAccountPolicy with error domain admin info to set domain account
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_005  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let errorDomainAccount: osAccount.DomainAccountInfo = {
        domain: 'XXX',
        accountName: 'XXX',
        accountId: 'XXX',
        serverConfigId: 'XXX',
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, errorDomainAccount, DOMAIN_ACCOUNT_POLICY1);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_005 error 9200007 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 9200007) || (error.code == 801)).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_005  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_006
     * @tc.number setDomainAccountPolicy_test_006
     * @tc.desc   setDomainAccountPolicy with super admin to set domain account policy by decimals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_006  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy1: accountManager.DomainAccountPolicy = {
        authenticationValidityPeriod: 6.9,
        passwordValidityPeriod: -0.1,
        passwordExpirationNotification: 3.3,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy1);
        let policy2: accountManager.DomainAccountPolicy = accountManager.getDomainAccountPolicy(SELFWANT,
          DOMAIN_ACCOUNT_INFO1);
        expect(policy2.authenticationValidityPeriod == 6).assertTrue();
        expect(policy2.passwordValidityPeriod == 0).assertTrue();
        expect(policy2.passwordExpirationNotification == 3).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_006 error 801 is expected, actually catch: ' + error.code);
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_006  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_007
     * @tc.number setDomainAccountPolicy_test_007
     * @tc.desc   setDomainAccountPolicy with super admin to set domain account policy below lower limit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_007", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_007  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy1: accountManager.DomainAccountPolicy = {
        authenticationValidityPeriod: -5,
        passwordValidityPeriod: -5,
        passwordExpirationNotification: -5,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy1);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_007 error 401 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 401) || (error.code == 801)).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_007  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_008
     * @tc.number setDomainAccountPolicy_test_008
     * @tc.desc   setDomainAccountPolicy with super admin to set domain account policy exceeds the int32_t validity range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_008", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_008  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let int32_t_min: number = -2147483648;
      let int32_t_max: number = 2147483647;
      let policy1: accountManager.DomainAccountPolicy = {
        authenticationValidityPeriod: int32_t_min - 1,
        passwordValidityPeriod: int32_t_min - 1,
        passwordExpirationNotification: int32_t_min - 1,
      };
      let policy2: accountManager.DomainAccountPolicy = {
        authenticationValidityPeriod: int32_t_max + 1,
        passwordValidityPeriod: int32_t_max + 1,
        passwordExpirationNotification: int32_t_max + 1,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy1);
        let getPolicy1: accountManager.DomainAccountPolicy = accountManager.getDomainAccountPolicy(SELFWANT,
          DOMAIN_ACCOUNT_INFO1);
        expect(getPolicy1.authenticationValidityPeriod == int32_t_max).assertTrue();
        expect(getPolicy1.passwordValidityPeriod == int32_t_max).assertTrue();
        expect(getPolicy1.passwordExpirationNotification == int32_t_max).assertTrue();
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy2);
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_008 error 401 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 401) || (error.code == 801)).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_008  -------- END --------');
    })

    /**
     * @tc.name   setDomainAccountPolicy_test_009
     * @tc.number setDomainAccountPolicy_test_009
     * @tc.desc   setDomainAccountPolicy with super admin to set domain account policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDomainAccountPolicy_test_009", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDomainAccountPolicy_test_009  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let policy: accountManager.DomainAccountPolicy = {
        passwordValidityPeriod: 300,
        passwordExpirationNotification: 360,
      };
      try {
        await accountManager.setDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1, policy);
        let getPolicy: accountManager.DomainAccountPolicy = accountManager.getDomainAccountPolicy(SELFWANT,
          DOMAIN_ACCOUNT_INFO1);
        expect(getPolicy.authenticationValidityPeriod == - 1).assertTrue();
        expect(getPolicy.passwordValidityPeriod == 300).assertTrue();
        expect(getPolicy.passwordExpirationNotification == 360).assertTrue();
      } catch (error) {
        console.info(' --- setDomainAccountPolicy_test_009 error 801 is expected, actually catch: ' + error.code);
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- setDomainAccountPolicy_test_009  -------- END --------');
    })

    /**
     * @tc.name   getDomainAccountPolicy_test_001
     * @tc.number getDomainAccountPolicy_test_001
     * @tc.desc   getDomainAccountPolicy with inactive admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_001", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- getDomainAccountPolicy_test_001  -------- START --------');
        await accountManager.getDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1);
        console.info(' --- getDomainAccountPolicy_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_001 error 9200001 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 9200001) || (error.code == 801)).assertTrue();
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_001  -------- END --------');
    })

    /**
     * @tc.name   getDomainAccountPolicy_test_002
     * @tc.number getDomainAccountPolicy_test_002
     * @tc.desc   getDomainAccountPolicy with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_002", Level.LEVEL2, async (done: Function) => {
      try {
        console.info(' --- getDomainAccountPolicy_test_002  -------- START --------');
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
        await accountManager.getDomainAccountPolicy(SELFWANT, DOMAIN_ACCOUNT_INFO1);
        console.info(' --- getDomainAccountPolicy_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_002 error 9200002 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 9200002) || (error.code == 801)).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_002  -------- END --------');
    })

    /**
     * @tc.name   getDomainAccountPolicy_test_003
     * @tc.number getDomainAccountPolicy_test_003
     * @tc.desc   getDomainAccountPolicy without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDomainAccountPolicy_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDomainAccountPolicy_test_003  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        await accountManager.getDomainAccountPolicy(null, DOMAIN_ACCOUNT_INFO1);
        console.info(' --- getDomainAccountPolicy_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDomainAccountPolicy_test_003 error 401 and 801 is expected, actually catch: '
          + error.code);
        expect((error.code == 401) || (error.code == 801)).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- getDomainAccountPolicy_test_003  -------- END --------');
    })
  })
}
