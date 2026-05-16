/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import account from '@ohos.account.appAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function ActsGetMultiple() {
  describe('ActsGetMultiple', function () {

    /**
     * @tc.name   ActsGetAllAccessibleAccounts_0101
     * @tc.number ActsGetAllAccessibleAccounts_0101
     * @tc.desc   add null user in current app, then getAllAccessibleAccounts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsGetAllAccessibleAccounts_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0101 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>getAllAccessibleAccounts 0101 start====");
      try {
        appAccountManager.getAllAccessibleAccounts(async (err, data) => {
          console.info("====>getAllAccessibleAccounts 0101 err:" + JSON.stringify(err));
          console.info("====>getAllAccessibleAccounts 0101 data:" + JSON.stringify(data));
          console.info("====>data.length:" + data.length);
          try {
            expect(err).assertEqual(null);
            expect(data.length).assertEqual(0);
            console.info("====>ActsGetAllAccessibleAccounts_0101 end====");
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 0100 err:" + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsGetAllAccessibleAccounts_0201
     * @tc.number ActsGetAllAccessibleAccounts_0201
     * @tc.desc   add null user in current app, then getAllAccessibleAccounts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ActsGetAllAccessibleAccounts_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
      console.info("====>ActsGetAllAccessibleAccounts_0201 start====");
      var appAccountManager = account.createAppAccountManager();
      console.info("====>getAllAccessibleAccounts 0201 start====");
      try {
        var data = await appAccountManager.getAllAccessibleAccounts();
        console.info("====>getAllAccessibleAccounts 0201 data:" + JSON.stringify(data));
        console.info("====>data.length:" + data.length);
        expect(data.length).assertEqual(0);
      } catch (err) {
        console.info("====>getAllAccessibleAccounts 0201 err:" + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0100
     * @tc.number ActsOnlyOnePermissionTest_0100
     * @tc.desc   check getAllAccounts interface meeting ohos.permission.GET_ALL_APP_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let tag = "====>ActsOnlyOnePermissionTest_0100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let bundle = "com.example.actsaccountaccessiblefirst";
      try {
        appAccountManager.getAllAccounts(bundle, (err, data) => {
          console.info("====>err: " + JSON.stringify(err));
          console.info("====>data: " + JSON.stringify(data));
          try {
            expect(data).not().assertUndefined();
          console.info("====>ActsOnlyOnePermissionTest_0100 end====");
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0200
     * @tc.number ActsOnlyOnePermissionTest_0200
     * @tc.desc   check getAllAccounts interface meeting ohos.permission.GET_ALL_APP_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done) => {
      let tag = "====>ActsOnlyOnePermissionTest_0200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let bundle = "com.example.actsaccountaccessiblefirst";
      try {
        let data = await appAccountManager.getAllAccounts(bundle);
        console.info(tag + "data: " + JSON.stringify(data));
        expect(data).not().assertUndefined();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  })
}
