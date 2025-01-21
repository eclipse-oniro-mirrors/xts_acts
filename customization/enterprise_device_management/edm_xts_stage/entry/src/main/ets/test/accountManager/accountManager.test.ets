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

import { describe, beforeAll, it, expect } from "@ohos/hypium";
import { WANT1, ENTINFO1, SELFWANT, SELFHAPNAME, DEFAULT_USER_ID, ERR_USER_ID, appIdsInit } from "../commom.ets";

import accountManager from '@ohos.enterprise.accountManager';
import adminManager from '@ohos.enterprise.adminManager';
import osAccount from '@ohos.account.osAccount';

export default function accountManagerTest() {

  describe('accountManager_test', function () {

    beforeAll(function (done) {
      appIdsInit();
      done();
    })

    // ------------- accountManager --------------------

    /**
     * @tc.number disallowOsAccountAddition_test_001
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with inactive admin and without accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_001", 0, async function (done) {
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
     * @tc.number disallowOsAccountAddition_test_002
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with inactive admin and with accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_002", 0, async function (done) {
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
     * @tc.number disallowOsAccountAddition_test_003
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with normal admin and without accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_003", 0, async function (done) {
      console.info(' --- disallowOsAccountAddition_test_003  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number disallowOsAccountAddition_test_003
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with normal admin and with accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_004", 0, async function (done) {
      console.info(' --- disallowOsAccountAddition_test_004  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number disallowOsAccountAddition_test_005
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition without admin
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_005", 0, async function (done) {
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
     * @tc.number disallowOsAccountAddition_test_006
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with super admin and without accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_006", 0, async function (done) {
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
     * @tc.number disallowOsAccountAddition_test_007
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with super admin and with current accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_007", 0, async function (done) {
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
     * @tc.number disallowOsAccountAddition_test_008
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with super admin and with another accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size LargeTest
     */
    it("disallowOsAccountAddition_test_008", 0, async function (done) {
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
          await osAccountManager.removeOsAccount(localId);
        }
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_008  -------- END --------');
    })

    /**
     * @tc.number disallowOsAccountAddition_test_009
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with super admin and with non-exist accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_009", 0, async function (done) {
      console.info(' --- disallowOsAccountAddition_test_009  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        accountManager.disallowOsAccountAddition(SELFWANT, true, ERR_USER_ID);
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
     * @tc.number disallowOsAccountAddition_test_0010
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc repeat call disallowOsAccountAddition with super admin and without accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_0010", 0, async function (done) {
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
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0010  -------- END --------');
    })

    /**
     * @tc.number disallowOsAccountAddition_test_0011
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc repeat call disallowOsAccountAddition with super admin and with accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_0011", 0, async function (done) {
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
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- disallowOsAccountAddition_test_0011  -------- END --------');
    })


    /**
     * @tc.number isOsAccountAdditionDisallowed_test_001
     * @tc.name test isOsAccountAdditionDisallowed method
     * @tc.desc isOsAccountAdditionDisallowed with inactive admin and without accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("isOsAccountAdditionDisallowed_test_001", 0, async function (done) {
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
     * @tc.number isOsAccountAdditionDisallowed_test_002
     * @tc.name test isOsAccountAdditionDisallowed method
     * @tc.desc isOsAccountAdditionDisallowed with inactive admin and with accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("isOsAccountAdditionDisallowed_test_002", 0, async function (done) {
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
     * @tc.number isOsAccountAdditionDisallowed_test_003
     * @tc.name test isOsAccountAdditionDisallowed method
     * @tc.desc isOsAccountAdditionDisallowed with normal admin and without accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("isOsAccountAdditionDisallowed_test_003", 0, async function (done) {
      console.info(' --- isOsAccountAdditionDisallowed_test_003  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number isOsAccountAdditionDisallowed_test_004
     * @tc.name test isOsAccountAdditionDisallowed method
     * @tc.desc isOsAccountAdditionDisallowed with normal admin and with accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("isOsAccountAdditionDisallowed_test_004", 0, async function (done) {
      console.info(' --- isOsAccountAdditionDisallowed_test_004  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number addOsAccountAsync_test_001
     * @tc.name test addOsAccountAsync method
     * @tc.desc addOsAccountAsync with inactive admin
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("addOsAccountAsync_test_001", 0, async function (done) {
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
     * @tc.number addOsAccountAsync_test_002
     * @tc.name test addOsAccountAsync method
     * @tc.desc addOsAccountAsync with normal admin
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("addOsAccountAsync_test_002", 0, async function (done) {
      console.info(' --- addOsAccountAsync_test_002  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
     * @tc.number addOsAccountAsync_test_003
     * @tc.name test addOsAccountAsync method
     * @tc.desc addOsAccountAsync without admin
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("addOsAccountAsync_test_003", 0, async function (done) {
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
     * @tc.number addOsAccountAsync_test_004
     * @tc.name test addOsAccountAsync method
     * @tc.desc addOsAccountAsync with super admin to create admin account
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size LargeTest
     */
    it("addOsAccountAsync_test_004", 0, async function (done) {
      console.info(' --- addOsAccountAsync_test_004  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- addOsAccountAsync_test_004 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.ADMIN);
        localId = newAccount.localId;
        console.info(' --- addOsAccountAsync_test_004 newAccount.localId: ' + localId);
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_004 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        if (isMultiAccountEnabled) {
          await osAccountManager.removeOsAccount(localId);
        }
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_004  -------- END --------');
    })

    /**
     * @tc.number addOsAccountAsync_test_005
     * @tc.name test addOsAccountAsync method
     * @tc.desc addOsAccountAsync with super admin to create normal account
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size LargeTest
     */
    it("addOsAccountAsync_test_005", 0, async function (done) {
      console.info(' --- addOsAccountAsync_test_005  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- addOsAccountAsync_test_005 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.NORMAL);
        localId = newAccount.localId;
        console.info(' --- addOsAccountAsync_test_005 newAccount.localId: ' + localId);
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_005 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        if (isMultiAccountEnabled) {
          await osAccountManager.removeOsAccount(localId);
        }
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_005  -------- END --------');
    })

    /**
     * @tc.number addOsAccountAsync_test_006
     * @tc.name test addOsAccountAsync method
     * @tc.desc addOsAccountAsync with super admin to create guest account
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size LargeTest
     */
    it("addOsAccountAsync_test_006", 0, async function (done) {
      console.info(' --- addOsAccountAsync_test_006  -------- START --------');
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let accountName: string = "test_name";
      let localId: number = 0;
      let osAccountManager = osAccount.getAccountManager();
      let isMultiAccountEnabled: boolean = await osAccountManager.checkMultiOsAccountEnabled();
      console.info(' --- addOsAccountAsync_test_006 isMultiAccountEnabled: ' + isMultiAccountEnabled);
      try {
        let newAccount: osAccount.OsAccountInfo = await accountManager.addOsAccountAsync(SELFWANT,
          accountName, osAccount.OsAccountType.GUEST);
        localId = newAccount.localId;
        console.info(' --- addOsAccountAsync_test_006 newAccount.localId: ' + localId);
        expect(newAccount.localName == accountName).assertTrue();
      } catch (error) {
        console.info(' --- addOsAccountAsync_test_006 error is unexpected when multi account is enabled, actually catch: ' + error.code);
        expect(isMultiAccountEnabled).assertFalse();
      } finally {
        if (isMultiAccountEnabled) {
          await osAccountManager.removeOsAccount(localId);
        }
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
      console.info(' --- addOsAccountAsync_test_006  -------- END --------');
    })

    /**
     * @tc.number addOsAccountAsync_test_007
     * @tc.name test addOsAccountAsync method
     * @tc.desc addOsAccountAsync with invalid account name
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("addOsAccountAsync_test_007", 0, async function (done) {
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
     * @tc.number addOsAccountAsync_test_008
     * @tc.name test addOsAccountAsync method
     * @tc.desc addOsAccountAsync with invalid account type
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("addOsAccountAsync_test_008", 0, async function (done) {
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
  })
}
