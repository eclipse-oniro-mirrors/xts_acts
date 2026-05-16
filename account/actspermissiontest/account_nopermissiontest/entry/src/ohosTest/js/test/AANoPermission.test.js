/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

import account from '@ohos.account.appAccount'

export default function ActsAANoPermissionTest() {
  describe('ActsAANoPermissionTest', function () {

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_0100
     * @tc.number SUB_Account_AppAccount_NoPermission_0100
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_0100 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.checkDataSyncEnabled('ZhangSan', (err, isEnabled) => {
          console.info('====>checkDataSyncEnabled failed, err: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(201);
          } catch (err) {
            console.info('====>Assert err: ' + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info('====>checkDataSyncEnabled err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_0200
     * @tc.number SUB_Account_AppAccount_NoPermission_0200
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_0200 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkDataSyncEnabled('ZhangSan');
        expect(true).assertFalse()
        done()
      } catch (err) {
        console.info('====>checkDataSyncEnabled err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_0300
     * @tc.number SUB_Account_AppAccount_NoPermission_0300
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_0300 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setDataSyncEnabled('ZhangSan', true, (err) => {
          console.info('====>setDataSyncEnabled err: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(201);
          } catch (err) {
            console.info('====>Assert err: ' + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info('====>setDataSyncEnabled err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_0400
     * @tc.number SUB_Account_AppAccount_NoPermission_0400
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_0400 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setDataSyncEnabled('ZhangSan', true);
        expect(true).assertFalse()
        done()
      } catch (err) {
        console.info('====>checkDataSyncEnabled err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_0500
     * @tc.number SUB_Account_AppAccount_NoPermission_0500
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_0500 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.checkAppAccountSyncEnable('ZhangSan', (err) => {
          console.info('====>err: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(10018);
          } catch (err) {
            console.info('====>Assert err: ' + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info('====>checkAppAccountSyncEnable err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_0600
     * @tc.number SUB_Account_AppAccount_NoPermission_0600
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_0600 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAppAccountSyncEnable('ZhangSan');
        expect().assertFail();
        done()
      } catch (err) {
        console.info('====>checkAppAccountSyncEnable err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(10018);
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_0700
     * @tc.number SUB_Account_AppAccount_NoPermission_0700
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_0700 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAppAccountSyncEnable('ZhangSan', true, (err) => {
          console.info('====>err: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(10018);
          } catch (err) {
            console.info('====>Assert err: ' + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info('====>setAppAccountSyncEnable err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_0800
     * @tc.number SUB_Account_AppAccount_NoPermission_0800
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_0800 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAppAccountSyncEnable('ZhangSan', true);
        expect().assertFail();
        done()
      } catch (err) {
        console.info('====>setAppAccountSyncEnable err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(10018);
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_0900
     * @tc.number SUB_Account_AppAccount_NoPermission_0900
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_0900 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAllAccessibleAccounts((err, data) => {
          console.info('====>err: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(10018);
          } catch (err) {
            console.info('====>Assert err: ' + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info('====>getAllAccessibleAccounts err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_1000
     * @tc.number SUB_Account_AppAccount_NoPermission_1000
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_1000 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllAccessibleAccounts();
        expect().assertFail();
        done()
      } catch (err) {
        console.info('====>getAllAccessibleAccounts err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(10018);
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_1100
     * @tc.number SUB_Account_AppAccount_NoPermission_1100
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_1100 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAllAccounts('ohos.acts.account.notexist', (err, data) => {
          console.info('====>err: ' + JSON.stringify(err));
          try {
            expect(err.code).assertEqual(10018);
          } catch (err) {
            console.info('====>Assert err: ' + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info('====>getAllAccounts err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Account_AppAccount_NoPermission_1200
     * @tc.number SUB_Account_AppAccount_NoPermission_1200
     * @tc.desc   no ohos.permission.DISTRIBUTED_DATASYNC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Account_AppAccount_NoPermission_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done) => {
      console.info("====>SUB_Account_AppAccount_NoPermission_1200 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllAccounts('ohos.acts.account.notexist');
        expect().assertFail();
        done()
      } catch (err) {
        console.info('====>getAllAccounts err: ' + JSON.stringify(err));
        expect(err.code).assertEqual(10018);
        done();
      }
    });
  });
}