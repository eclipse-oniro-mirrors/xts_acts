/**
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
import osAccount from '@ohos.account.osAccount'
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function OsAccountParamCheck1() {
  describe('OsAccountParamCheck1', () => {

    /**
     * @tc.name   OsAccountParamCheck1_6600
     * @tc.number OsAccountParamCheck1_6600
     * @tc.desc   getOsAccountLocalIdBySerialNumber with null serialNumber callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_6600 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdBySerialNumber(null, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect(err.code).not().assertUndefined();
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
     * @tc.name   OsAccountParamCheck1_6700
     * @tc.number OsAccountParamCheck1_6700
     * @tc.desc   getOsAccountLocalIdBySerialNumber with undefined serialNumber callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_6700 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdBySerialNumber(undefined, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect(err.code).not().assertUndefined();
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
     * @tc.name   OsAccountParamCheck1_6800
     * @tc.number OsAccountParamCheck1_6800
     * @tc.desc   getOsAccountLocalIdBySerialNumber with null serialNumber promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_6800 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdBySerialNumber(null);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_6900
     * @tc.number OsAccountParamCheck1_6900
     * @tc.desc   getOsAccountLocalIdBySerialNumber with undefined serialNumber promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_6900 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdBySerialNumber(undefined);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_7000
     * @tc.number OsAccountParamCheck1_7000
     * @tc.desc   getOsAccountLocalIdForSerialNumber with null serialNumber callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7000 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdForSerialNumber(null, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_7100
     * @tc.number OsAccountParamCheck1_7100
     * @tc.desc   getOsAccountLocalIdForSerialNumber with undefined serialNumber callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7100 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdForSerialNumber(undefined, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_7200
     * @tc.number OsAccountParamCheck1_7200
     * @tc.desc   getOsAccountLocalIdForSerialNumber with null serialNumber promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7200 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdForSerialNumber(null);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_7300
     * @tc.number OsAccountParamCheck1_7300
     * @tc.desc   getOsAccountLocalIdForSerialNumber with undefined serialNumber promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7300 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdForSerialNumber(undefined);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_7400
     * @tc.number OsAccountParamCheck1_7400
     * @tc.desc   getSerialNumberByOsAccountLocalId with null localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7400 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getSerialNumberByOsAccountLocalId(null, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect(err.code).not().assertUndefined();
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
     * @tc.name   OsAccountParamCheck1_7500
     * @tc.number OsAccountParamCheck1_7500
     * @tc.desc   getSerialNumberByOsAccountLocalId with undefined localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7500 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getSerialNumberByOsAccountLocalId(undefined, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect(err.code).not().assertUndefined();
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
     * @tc.name   OsAccountParamCheck1_7600
     * @tc.number OsAccountParamCheck1_7600
     * @tc.desc   getSerialNumberByOsAccountLocalId with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7600 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getSerialNumberByOsAccountLocalId(null);
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   OsAccountParamCheck1_7700
     * @tc.number OsAccountParamCheck1_7700
     * @tc.desc   getSerialNumberByOsAccountLocalId with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7700 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getSerialNumberByOsAccountLocalId(undefined);
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   OsAccountParamCheck1_7800
     * @tc.number OsAccountParamCheck1_7800
     * @tc.desc   getSerialNumberForOsAccountLocalId with null localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7800 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getSerialNumberForOsAccountLocalId(null, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_7900
     * @tc.number OsAccountParamCheck1_7900
     * @tc.desc   getSerialNumberForOsAccountLocalId with undefined localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_7900 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getSerialNumberForOsAccountLocalId(undefined, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_8000
     * @tc.number OsAccountParamCheck1_8000
     * @tc.desc   getSerialNumberForOsAccountLocalId with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_8000 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getSerialNumberForOsAccountLocalId(null);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_8100
     * @tc.number OsAccountParamCheck1_8100
     * @tc.desc   getSerialNumberForOsAccountLocalId with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_8100 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getSerialNumberForOsAccountLocalId(undefined);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck1_8200
     * @tc.number OsAccountParamCheck1_8200
     * @tc.desc   updateAccountInfo with empty serverConfigId oldAccountInfo promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_8200 "
      console.info(tag + "start====");
      let oldAccountInfo = { accountName: 'testAccountName', domain: "test.domain", accountId: "123", serverConfigId: "" };
      let newAccountInfo = { accountName: 'testAccountName', domain: "test.domain", accountId: "456", serverConfigId: "config" };
      try {
        await osAccount.DomainAccountManager.updateAccountInfo(oldAccountInfo, newAccountInfo);
        expect().assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(tag + "Current device not support API: updateAccountInfo");
        } else {
          expect(err.code).assertEqual(12300003);
        }
      }
      done();
    });

    /**
     * @tc.name   OsAccountParamCheck1_8300
     * @tc.number OsAccountParamCheck1_8300
     * @tc.desc   updateAccountInfo with empty serverConfigId newAccountInfo promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_8300 "
      console.info(tag + "start====");
      let oldAccountInfo = { accountName: 'testAccountName', domain: "test.domain", accountId: "123", serverConfigId: "config" };
      let newAccountInfo = { accountName: 'testAccountName', domain: "test.domain", accountId: "456", serverConfigId: "" };
      try {
        await osAccount.DomainAccountManager.updateAccountInfo(oldAccountInfo, newAccountInfo);
        expect().assertFail();
      } catch (err) {
        if (err.code === 801) {
          console.info(tag + "Current device not support API: updateAccountInfo");
        } else {
          expect(err.code).assertEqual(12300003);
        }
      }
      done();
    });

    /**
     * @tc.name   OsAccountParamCheck1_8400
     * @tc.number OsAccountParamCheck1_8400
     * @tc.desc   return of getAccountManager.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_8400 "
      console.info(tag + "start====");
      try {
        let accountManager = osAccount.getAccountManager();
        console.info(tag + "accountManager is: " + JSON.stringify(accountManager));
        expect(accountManager).not().assertUndefined();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   OsAccountParamCheck1_8500
     * @tc.number OsAccountParamCheck1_8500
     * @tc.desc   queryCurrentOsAccount promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_8500 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        let data = await accountManager.queryCurrentOsAccount();
        console.info(tag + "queryCurrentOsAccount data: " + JSON.stringify(data));
        expect(data.localId).not().assertUndefined();
        expect(data.localName).not().assertUndefined();
        expect(data.type).not().assertUndefined();
        expect(data.constraints).not().assertUndefined();
        expect(data.isVerified).not().assertUndefined();
        expect(data.isUnlocked).not().assertUndefined();
        expect(data.photo).not().assertUndefined();
        expect(data.createTime).not().assertUndefined();
        expect(data.lastLoginTime).not().assertUndefined();
        expect(data.serialNumber).not().assertUndefined();
        expect(data.isActived).not().assertUndefined();
        expect(data.isActivated).not().assertUndefined();
        expect(data.isCreateCompleted).not().assertUndefined();
        expect(data.distributedInfo).not().assertUndefined();
        expect(data.domainInfo).not().assertUndefined();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   OsAccountParamCheck1_8600
     * @tc.number OsAccountParamCheck1_8600
     * @tc.desc   queryCurrentOsAccount callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_8600 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.queryCurrentOsAccount((err, data) => {
          console.info(tag + "queryCurrentOsAccount data: " + JSON.stringify(data));
          try {
            expect(data.localId).not().assertUndefined();
            expect(data.localName).not().assertUndefined();
            expect(data.type).not().assertUndefined();
            expect(data.constraints).not().assertUndefined();
            expect(data.isVerified).not().assertUndefined();
            expect(data.isUnlocked).not().assertUndefined();
            expect(data.photo).not().assertUndefined();
            expect(data.createTime).not().assertUndefined();
            expect(data.lastLoginTime).not().assertUndefined();
            expect(data.serialNumber).not().assertUndefined();
            expect(data.isActived).not().assertUndefined();
            expect(data.isActivated).not().assertUndefined();
            expect(data.isCreateCompleted).not().assertUndefined();
            expect(data.distributedInfo).not().assertUndefined();
            expect(data.domainInfo).not().assertUndefined();
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
     * @tc.name   OsAccountParamCheck1_8700
     * @tc.number OsAccountParamCheck1_8700
     * @tc.desc   getCurrentOsAccount promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_8700 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        let data = await accountManager.getCurrentOsAccount();
        console.info(tag + "getCurrentOsAccount data: " + JSON.stringify(data));
        expect(data.localId).not().assertUndefined();
        expect(data.localName).not().assertUndefined();
        expect(data.type).not().assertUndefined();
        expect(data.constraints).not().assertUndefined();
        expect(data.isVerified).not().assertUndefined();
        expect(data.isUnlocked).not().assertUndefined();
        expect(data.photo).not().assertUndefined();
        expect(data.createTime).not().assertUndefined();
        expect(data.lastLoginTime).not().assertUndefined();
        expect(data.serialNumber).not().assertUndefined();
        expect(data.isActived).not().assertUndefined();
        expect(data.isActivated).not().assertUndefined();
        expect(data.isCreateCompleted).not().assertUndefined();
        expect(data.distributedInfo).not().assertUndefined();
        expect(data.domainInfo).not().assertUndefined();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   OsAccountParamCheck1_8800
     * @tc.number OsAccountParamCheck1_8800
     * @tc.desc   getCurrentOsAccount callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck1_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck1_8800 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getCurrentOsAccount((err, data) => {
          console.info(tag + "getCurrentOsAccount data: " + JSON.stringify(data));
          try {
            expect(data.localId).not().assertUndefined();
            expect(data.localName).not().assertUndefined();
            expect(data.type).not().assertUndefined();
            expect(data.constraints).not().assertUndefined();
            expect(data.isVerified).not().assertUndefined();
            expect(data.isUnlocked).not().assertUndefined();
            expect(data.photo).not().assertUndefined();
            expect(data.createTime).not().assertUndefined();
            expect(data.lastLoginTime).not().assertUndefined();
            expect(data.serialNumber).not().assertUndefined();
            expect(data.isActived).not().assertUndefined();
            expect(data.isActivated).not().assertUndefined();
            expect(data.isCreateCompleted).not().assertUndefined();
            expect(data.distributedInfo).not().assertUndefined();
            expect(data.domainInfo).not().assertUndefined();
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
  });
}
