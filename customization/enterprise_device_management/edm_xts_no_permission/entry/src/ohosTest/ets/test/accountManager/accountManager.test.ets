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

import { describe, beforeAll, afterAll, it, expect } from "@ohos/hypium";
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
     * @tc.number disallowOsAccountAddition_test_001
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with normal admin and without accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_001", 0, async (done: Function) => {
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
     * @tc.number disallowOsAccountAddition_test_002
     * @tc.name test disallowOsAccountAddition method
     * @tc.desc disallowOsAccountAddition with normal admin and with accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("disallowOsAccountAddition_test_002", 0, async (done: Function) => {
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
     * @tc.number isOsAccountAdditionDisallowed_test_001
     * @tc.name test isOsAccountAdditionDisallowed method
     * @tc.desc isOsAccountAdditionDisallowed with normal admin and without accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("isOsAccountAdditionDisallowed_test_001", 0, async (done: Function) => {
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
     * @tc.number isOsAccountAdditionDisallowed_test_002
     * @tc.name test isOsAccountAdditionDisallowed method
     * @tc.desc isOsAccountAdditionDisallowed with normal admin and with accountId
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("isOsAccountAdditionDisallowed_test_002", 0, async (done: Function) => {
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
     * @tc.number addOsAccountAsync_test_001
     * @tc.name test addOsAccountAsync method
     * @tc.desc addOsAccountAsync with normal admin
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it("addOsAccountAsync_test_001", 0, async (done: Function) => {
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
  })
}
