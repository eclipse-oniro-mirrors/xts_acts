/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import osaccount from '@ohos.account.osAccount'
import account from '@ohos.account.appAccount'
import daccount from '@ohos.account.distributedAccount'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function ActsOnlyOnePermissionTest() {
  describe('ActsOnlyOnePermissionTest', () => {


    /**
     * @tc.name   ActsOnlyOnePermissionTest_0100
     * @tc.number ActsOnlyOnePermissionTest_0100
     * @tc.desc   check getCurrentOsAccount interface meeting ohos.permission.GET_LOCAL_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_0100 "
      console.info(tag + "start====");
      let accountAbility = osaccount.getAccountManager();
      try {
        let data = await accountAbility.getCurrentOsAccount();
        console.info('====>ActsOnlyOnePermissionTest_0100 data:' + JSON.stringify(data));
        expect(data).not().assertUndefined();
        done();
      } catch (err){
        console.info('====>ActsOnlyOnePermissionTest_0100 err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0200
     * @tc.number ActsOnlyOnePermissionTest_0200
     * @tc.desc   check getCurrentOsAccount interface meeting ohos.permission.GET_LOCAL_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_0200 "
      console.info(tag + "start====");
      let accountAbility = osaccount.getAccountManager();
      try {
        accountAbility.getCurrentOsAccount((err, data) => {
          console.info('====>err: ' + JSON.stringify(err));
          console.info('====>data: ' + JSON.stringify(data));
          expect(err).assertNull();
          done();
        });
      } catch (err) {
        console.info('====>ActsOnlyOnePermissionTest_0200 err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0300
     * @tc.number ActsOnlyOnePermissionTest_0300
     * @tc.desc   check getOsAccountDistributedInfo interface meeting ohos.permission.GET_DISTRIBUTED_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_0300 "
      console.info(tag + "start====");
      try {
        let accountAbility = daccount.getDistributedAccountAbility();
        let data = await accountAbility.getOsAccountDistributedInfo();
        console.info('====>ActsOnlyOnePermissionTest_0300 data:' + JSON.stringify(data));
        expect(data).not().assertUndefined();
        done();
      } catch (err){
        console.info('====>ActsOnlyOnePermissionTest_0300 err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0400
     * @tc.number ActsOnlyOnePermissionTest_0400
     * @tc.desc   check getOsAccountDistributedInfo interface meeting ohos.permission.GET_DISTRIBUTED_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_0400 "
      console.info(tag + "start====");
      let accountAbility = daccount.getDistributedAccountAbility();
      try {
        accountAbility.getOsAccountDistributedInfo((err, data) => {
          console.info('====>err: ' + JSON.stringify(err));
          console.info('====>data: ' + JSON.stringify(data));
          expect(err).assertNull();
          done();
        });
      } catch (err) {
        console.info('====>ActsOnlyOnePermissionTest_0400 err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0500
     * @tc.number ActsOnlyOnePermissionTest_0500
     * @tc.desc   check isOsAccountActived interface meeting ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_0500 "
      console.info(tag + "start====");
      let accountAbility = osaccount.getAccountManager();
      try {
        accountAbility.isOsAccountActived(0, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect(err).assertNull();
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
     * @tc.name   ActsOnlyOnePermissionTest_0600
     * @tc.number ActsOnlyOnePermissionTest_0600
     * @tc.desc   check isOsAccountActived interface meeting ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_0600 "
      console.info(tag + "start====");
      let accountAbility = osaccount.getAccountManager();
      try {
        let data = await accountAbility.isOsAccountActived(0);
        console.info(tag + "data: " + JSON.stringify(data));
        expect(data).not().assertUndefined();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0700
     * @tc.number ActsOnlyOnePermissionTest_0700
     * @tc.desc   check no param isOsAccountVerified interface meeting ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_0700 "
      console.info(tag + "start====");
      let accountAbility = osaccount.getAccountManager();
      try {
        accountAbility.isOsAccountVerified((err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect(err).assertNull();
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
     * @tc.name   ActsOnlyOnePermissionTest_0800
     * @tc.number ActsOnlyOnePermissionTest_0800
     * @tc.desc   check no param isOsAccountVerified interface meeting ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_0800 "
      console.info(tag + "start====");
      let accountAbility = osaccount.getAccountManager();
      try {
        let data = await accountAbility.isOsAccountVerified();
        console.info(tag + "data: " + JSON.stringify(data));
        expect(data).not().assertUndefined();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0900
     * @tc.number ActsOnlyOnePermissionTest_0900
     * @tc.desc   check isOsAccountVerified interface meeting ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_0900 "
      console.info(tag + "start====");
      let accountAbility = osaccount.getAccountManager();
      try {
        accountAbility.isOsAccountVerified(0, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect(err).assertNull();
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
     * @tc.name   ActsOnlyOnePermissionTest_1000
     * @tc.number ActsOnlyOnePermissionTest_1000
     * @tc.desc   check isOsAccountVerified interface meeting ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let tag = "====>ActsOnlyOnePermissionTest_1000 "
      console.info(tag + "start====");
      let accountAbility = osaccount.getAccountManager();
      try {
        let data = await accountAbility.isOsAccountVerified(0);
        console.info(tag + "data: " + JSON.stringify(data));
        expect(data).not().assertUndefined();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  });
}
