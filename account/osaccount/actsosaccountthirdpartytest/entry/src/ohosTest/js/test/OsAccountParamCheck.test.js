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

export default function OsAccountParamCheck() {
  describe('OsAccountParamCheck', () => {

    /**
     * @tc.name   OsAccountParamCheck_0100
     * @tc.number OsAccountParamCheck_0100
     * @tc.desc   isOsAccountActived with null localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_0100 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.isOsAccountActived(null, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_0200
     * @tc.number OsAccountParamCheck_0200
     * @tc.desc   isOsAccountActived with undefined localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_0200 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.isOsAccountActived(undefined, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_0300
     * @tc.number OsAccountParamCheck_0300
     * @tc.desc   isOsAccountActived with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_0300 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountActived(null);
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
     * @tc.name   OsAccountParamCheck_0400
     * @tc.number OsAccountParamCheck_0400
     * @tc.desc   isOsAccountActived with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_0400 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountActived(undefined);
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
     * @tc.name   OsAccountParamCheck_0500
     * @tc.number OsAccountParamCheck_0500
     * @tc.desc   checkOsAccountActivated with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_0500 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.checkOsAccountActivated(null);
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
     * @tc.name   OsAccountParamCheck_0600
     * @tc.number OsAccountParamCheck_0600
     * @tc.desc   checkOsAccountActivated with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_0600 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.checkOsAccountActivated(undefined);
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
     * @tc.name   OsAccountParamCheck_0700
     * @tc.number OsAccountParamCheck_0700
     * @tc.desc   isOsAccountConstraintEnable with null localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_0700 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.isOsAccountConstraintEnable(null, "constraint.wifi.set", (err, data) => {
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
     * @tc.name   OsAccountParamCheck_0800
     * @tc.number OsAccountParamCheck_0800
     * @tc.desc   isOsAccountConstraintEnable with undefined localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_0800 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.isOsAccountConstraintEnable(undefined, "constraint.wifi.set", (err, data) => {
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
     * @tc.name   OsAccountParamCheck_0900
     * @tc.number OsAccountParamCheck_0900
     * @tc.desc   isOsAccountConstraintEnable with empty constraint callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_0900 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.isOsAccountConstraintEnable(100, "", (err, data) => {
          console.info(tag + "catch err: " + JSON.stringify(err));
          expect(err.code).not().assertUndefined();
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_1000
     * @tc.number OsAccountParamCheck_1000
     * @tc.desc   isOsAccountConstraintEnable with null constraint callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1000 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.isOsAccountConstraintEnable(100, null, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_1100
     * @tc.number OsAccountParamCheck_1100
     * @tc.desc   isOsAccountConstraintEnable with undefined constraint callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1100 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.isOsAccountConstraintEnable(100, undefined, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_1200
     * @tc.number OsAccountParamCheck_1200
     * @tc.desc   isOsAccountConstraintEnable with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1200 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountConstraintEnable(null, "constraint.wifi.set");
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
     * @tc.name   OsAccountParamCheck_1300
     * @tc.number OsAccountParamCheck_1300
     * @tc.desc   isOsAccountConstraintEnable with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1300 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountConstraintEnable(undefined, "constraint.wifi.set");
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
     * @tc.name   OsAccountParamCheck_1400
     * @tc.number OsAccountParamCheck_1400
     * @tc.desc   isOsAccountConstraintEnable with empty constraint promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1400 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountConstraintEnable(100, "");
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
     * @tc.name   OsAccountParamCheck_1500
     * @tc.number OsAccountParamCheck_1500
     * @tc.desc   isOsAccountConstraintEnable with null constraint promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1500 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountConstraintEnable(100, null);
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
     * @tc.name   OsAccountParamCheck_1600
     * @tc.number OsAccountParamCheck_1600
     * @tc.desc   isOsAccountConstraintEnable with undefined constraint promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1600 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountConstraintEnable(100, undefined);
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
     * @tc.name   OsAccountParamCheck_1700
     * @tc.number OsAccountParamCheck_1700
     * @tc.desc   checkOsAccountConstraintEnabled with null localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1700 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.checkOsAccountConstraintEnabled(null, "constraint.wifi.set", (err, data) => {
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
     * @tc.name   OsAccountParamCheck_1800
     * @tc.number OsAccountParamCheck_1800
     * @tc.desc   checkOsAccountConstraintEnabled with undefined localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1800 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.checkOsAccountConstraintEnabled(undefined, "constraint.wifi.set", (err, data) => {
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
     * @tc.name   OsAccountParamCheck_1900
     * @tc.number OsAccountParamCheck_1900
     * @tc.desc   checkOsAccountConstraintEnabled with empty constraint callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_1900 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.checkOsAccountConstraintEnabled(100, "", (err, data) => {
          console.info(tag + "catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2000
     * @tc.number OsAccountParamCheck_2000
     * @tc.desc   checkOsAccountConstraintEnabled with null constraint callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2000 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.checkOsAccountConstraintEnabled(100, null, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_2100
     * @tc.number OsAccountParamCheck_2100
     * @tc.desc   checkOsAccountConstraintEnabled with undefined constraint callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2100 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.checkOsAccountConstraintEnabled(100, undefined, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_2200
     * @tc.number OsAccountParamCheck_2200
     * @tc.desc   checkOsAccountConstraintEnabled with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2200 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.checkOsAccountConstraintEnabled(null, "constraint.wifi.set");
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
     * @tc.name   OsAccountParamCheck_2300
     * @tc.number OsAccountParamCheck_2300
     * @tc.desc   checkOsAccountConstraintEnabled with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2300 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.checkOsAccountConstraintEnabled(undefined, "constraint.wifi.set");
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
     * @tc.name   OsAccountParamCheck_2400
     * @tc.number OsAccountParamCheck_2400
     * @tc.desc   checkOsAccountConstraintEnabled with empty constraint promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2400 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.checkOsAccountConstraintEnabled(100, "");
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2500
     * @tc.number OsAccountParamCheck_2500
     * @tc.desc   checkOsAccountConstraintEnabled with null constraint promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2500 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.checkOsAccountConstraintEnabled(100, null);
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
     * @tc.name   OsAccountParamCheck_2600
     * @tc.number OsAccountParamCheck_2600
     * @tc.desc   checkOsAccountConstraintEnabled with undefined constraint promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2600 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.checkOsAccountConstraintEnabled(100, undefined);
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
     * @tc.name   OsAccountParamCheck_2700
     * @tc.number OsAccountParamCheck_2700
     * @tc.desc   isOsAccountConstraintEnabled with empty constraint promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2700 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountConstraintEnabled("");
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_2800
     * @tc.number OsAccountParamCheck_2800
     * @tc.desc   isOsAccountConstraintEnabled with null constraint promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2800 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountConstraintEnabled(null);
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
     * @tc.name   OsAccountParamCheck_2900
     * @tc.number OsAccountParamCheck_2900
     * @tc.desc   isOsAccountConstraintEnabled with undefined constraint promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_2900 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountConstraintEnabled(undefined);
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
     * @tc.name   OsAccountParamCheck_3000
     * @tc.number OsAccountParamCheck_3000
     * @tc.desc   isOsAccountVerified with null localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3000 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.isOsAccountVerified(null, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
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
     * @tc.name   OsAccountParamCheck_3100
     * @tc.number OsAccountParamCheck_3100
     * @tc.desc   isOsAccountVerified with undefined localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3100 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.isOsAccountVerified(undefined, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
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
     * @tc.name   OsAccountParamCheck_3200
     * @tc.number OsAccountParamCheck_3200
     * @tc.desc   isOsAccountVerified with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3200 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountVerified(null);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_3300
     * @tc.number OsAccountParamCheck_3300
     * @tc.desc   isOsAccountVerified with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3300 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.isOsAccountVerified(undefined);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_3400
     * @tc.number OsAccountParamCheck_3400
     * @tc.desc   checkOsAccountVerified with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3400 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.checkOsAccountVerified(null);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_3500
     * @tc.number OsAccountParamCheck_3500
     * @tc.desc   checkOsAccountVerified with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3500 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.checkOsAccountVerified(undefined);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_3600
     * @tc.number OsAccountParamCheck_3600
     * @tc.desc   getOsAccountLocalIdFromUid with null uid callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3600 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdFromUid(null, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_3700
     * @tc.number OsAccountParamCheck_3700
     * @tc.desc   getOsAccountLocalIdFromUid with undefined uid callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3700 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdFromUid(undefined, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_3800
     * @tc.number OsAccountParamCheck_3800
     * @tc.desc   getOsAccountLocalIdFromUid with null uid promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3800 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdFromUid(null);
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_3900
     * @tc.number OsAccountParamCheck_3900
     * @tc.desc   getOsAccountLocalIdFromUid with undefined uid promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_3900 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdFromUid(undefined);
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_4000
     * @tc.number OsAccountParamCheck_4000
     * @tc.desc   getOsAccountLocalIdForUid with null uid callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_4000 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdForUid(null, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_4100
     * @tc.number OsAccountParamCheck_4100
     * @tc.desc   getOsAccountLocalIdForUid with undefined uid callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_4100 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdForUid(undefined, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_4200
     * @tc.number OsAccountParamCheck_4200
     * @tc.desc   getOsAccountLocalIdForUid with null uid promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_4200 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdForUid(null);
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
     * @tc.name   OsAccountParamCheck_4300
     * @tc.number OsAccountParamCheck_4300
     * @tc.desc   getOsAccountLocalIdForUid with undefined uid promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_4300 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdForUid(undefined);
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
     * @tc.name   OsAccountParamCheck_4400
     * @tc.number OsAccountParamCheck_4400
     * @tc.desc   getOsAccountLocalIdForUidSync with null uid sync mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done) => {
      let tag = "====>OsAccountParamCheck_4400 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdForUidSync(null);
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
     * @tc.name   OsAccountParamCheck_4500
     * @tc.number OsAccountParamCheck_4500
     * @tc.desc   getOsAccountLocalIdForUidSync with undefined uid sync mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done) => {
      let tag = "====>OsAccountParamCheck_4500 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdForUidSync(undefined);
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
     * @tc.name   OsAccountParamCheck_4600
     * @tc.number OsAccountParamCheck_4600
     * @tc.desc   getOsAccountLocalIdFromDomain with null domainInfo callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_4600 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdFromDomain(null, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_4700
     * @tc.number OsAccountParamCheck_4700
     * @tc.desc   getOsAccountLocalIdFromDomain with undefined domainInfo callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_4700 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdFromDomain(undefined, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_4800
     * @tc.number OsAccountParamCheck_4800
     * @tc.desc   getOsAccountLocalIdFromDomain with empty serverConfigId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_4800 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      let domainInfo = {
        accountName: 'testAccountName', domain: "test.domain", accountId: "123", serverConfigId: "" };
      try {
        accountManager.getOsAccountLocalIdFromDomain(domainInfo, (err, data) => {
          console.info(tag + "catch err: " + JSON.stringify(err));
          expect(err.code).not().assertUndefined();
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_4900
     * @tc.number OsAccountParamCheck_4900
     * @tc.desc   getOsAccountLocalIdFromDomain with null domainInfo promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_4900 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdFromDomain(null);
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
     * @tc.name   OsAccountParamCheck_5000
     * @tc.number OsAccountParamCheck_5000
     * @tc.desc   getOsAccountLocalIdFromDomain with undefined domainInfo promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5000 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdFromDomain(undefined);
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
     * @tc.name   OsAccountParamCheck_5100
     * @tc.number OsAccountParamCheck_5100
     * @tc.desc   getOsAccountLocalIdFromDomain with empty serverConfigId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5100 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      let domainInfo = { accountName: 'testAccountName', domain: "test.domain", accountId: "123", serverConfigId: "" };
      try {
        await accountManager.getOsAccountLocalIdFromDomain(domainInfo);
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
     * @tc.name   OsAccountParamCheck_5200
     * @tc.number OsAccountParamCheck_5200
     * @tc.desc   getOsAccountLocalIdForDomain with null domainInfo callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5200 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdForDomain(null, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_5300
     * @tc.number OsAccountParamCheck_5300
     * @tc.desc   getOsAccountLocalIdForDomain with undefined domainInfo callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5300 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountLocalIdForDomain(undefined, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_5400
     * @tc.number OsAccountParamCheck_5400
     * @tc.desc   getOsAccountLocalIdForDomain with empty serverConfigId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5400 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      let domainInfo = { accountName: 'testAccountName', domain: "test.domain", accountId: "123", serverConfigId: "" };
      try {
        accountManager.getOsAccountLocalIdForDomain(domainInfo, (err, data) => {
          console.info(tag + "catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_5500
     * @tc.number OsAccountParamCheck_5500
     * @tc.desc   getOsAccountLocalIdForDomain with null domainInfo promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5500 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdForDomain(null);
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
     * @tc.name   OsAccountParamCheck_5600
     * @tc.number OsAccountParamCheck_5600
     * @tc.desc   getOsAccountLocalIdForDomain with undefined domainInfo promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5600 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountLocalIdForDomain(undefined);
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
     * @tc.name   OsAccountParamCheck_5700
     * @tc.number OsAccountParamCheck_5700
     * @tc.desc   getOsAccountLocalIdForDomain with empty serverConfigId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5700 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      let domainInfo = { accountName: 'testAccountName', domain: "test.domain", accountId: "123", serverConfigId: "" };
      try {
        await accountManager.getOsAccountLocalIdForDomain(domainInfo);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      }
    });

    /**
     * @tc.name   OsAccountParamCheck_5800
     * @tc.number OsAccountParamCheck_5800
     * @tc.desc   getOsAccountAllConstraints with null localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5800 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountAllConstraints(null, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_5900
     * @tc.number OsAccountParamCheck_5900
     * @tc.desc   getOsAccountAllConstraints with undefined localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_5900 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountAllConstraints(undefined, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_6000
     * @tc.number OsAccountParamCheck_6000
     * @tc.desc   getOsAccountAllConstraints with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_6000 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountAllConstraints(null);
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   OsAccountParamCheck_6100
     * @tc.number OsAccountParamCheck_6100
     * @tc.desc   getOsAccountAllConstraints with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_6100 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountAllConstraints(undefined);
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   OsAccountParamCheck_6200
     * @tc.number OsAccountParamCheck_6200
     * @tc.desc   getOsAccountConstraints with null localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_6200 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountConstraints(null, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_6300
     * @tc.number OsAccountParamCheck_6300
     * @tc.desc   getOsAccountConstraints with undefined localId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_6300 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        accountManager.getOsAccountConstraints(undefined, (err, data) => {
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
     * @tc.name   OsAccountParamCheck_6400
     * @tc.number OsAccountParamCheck_6400
     * @tc.desc   getOsAccountConstraints with null localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_6400 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountConstraints(null);
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
     * @tc.name   OsAccountParamCheck_6500
     * @tc.number OsAccountParamCheck_6500
     * @tc.desc   getOsAccountConstraints with undefined localId promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountParamCheck_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>OsAccountParamCheck_6500 "
      console.info(tag + "start====");
      let accountManager = osAccount.getAccountManager();
      try {
        await accountManager.getOsAccountConstraints(undefined);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });
  });
}
