/*
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
import osAccount from '@ohos.account.osAccount'
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function ActsOsAccountErrCodeCheck() {
  describe('ActsOsAccountErrCodeCheck', () => {

    /**
     * @tc.name   OsAccountErrCodeCheck_0100
     * @tc.number OsAccountErrCodeCheck_0100
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_0100 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start checkOsAccountActivated");
      try {
        osAccountManager.checkOsAccountActivated(null, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_0200
     * @tc.number OsAccountErrCodeCheck_0200
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_0200 "
      console.info(tag + "start====");
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start checkOsAccountActivated");
        let data = await osAccountManager.checkOsAccountActivated(undefined);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_0300
     * @tc.number OsAccountErrCodeCheck_0300
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_0300 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start checkOsAccountConstraintEnabled");
      try {
        osAccountManager.checkOsAccountConstraintEnabled(null, "", (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_0400
     * @tc.number OsAccountErrCodeCheck_0400
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_0400 "
      console.info(tag + "start====");
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start checkOsAccountConstraintEnabled");
        let data = await osAccountManager.checkOsAccountConstraintEnabled(undefined, "");
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_0500
     * @tc.number OsAccountErrCodeCheck_0500
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_0500 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start checkOsAccountConstraintEnabled");
      try {
        osAccountManager.checkOsAccountConstraintEnabled(100, undefined, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_0600
     * @tc.number OsAccountErrCodeCheck_0600
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_0600 "
      console.info(tag + "start====");
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start checkOsAccountConstraintEnabled");
        let data = await osAccountManager.checkOsAccountConstraintEnabled(100, null);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_0700
     * @tc.number OsAccountErrCodeCheck_0700
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_0700 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start checkOsAccountVerified");
      try {
        osAccountManager.checkOsAccountVerified(null, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          console.info(tag + "end====");
          expect(err).assertEqual(null);
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_0800
     * @tc.number OsAccountErrCodeCheck_0800
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_0800 "
      console.info(tag + "start====");
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start checkOsAccountVerified");
        let data = await osAccountManager.checkOsAccountVerified(undefined);
        console.info(tag + "data: " + JSON.stringify(data));
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_0900
     * @tc.number OsAccountErrCodeCheck_0900
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_0900 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getOsAccountCount");
      try {
        osAccountManager.getOsAccountCount(null);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_1000
     * @tc.number OsAccountErrCodeCheck_1000
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1000 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getOsAccountCount");
      try {
        osAccountManager.getOsAccountCount(undefined);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });


    /**
     * @tc.name   OsAccountErrCodeCheck_1100
     * @tc.number OsAccountErrCodeCheck_1100
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1100 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getOsAccountLocalIdForDomain");
      try {
        osAccountManager.getOsAccountLocalIdForDomain(undefined, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_1200
     * @tc.number OsAccountErrCodeCheck_1200
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1200 "
      console.info(tag + "start====");
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start getOsAccountLocalIdForDomain");
        let data = await osAccountManager.getOsAccountLocalIdForDomain(null);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_1300
     * @tc.number OsAccountErrCodeCheck_1300
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1300 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getOsAccountConstraints");
      try {
        osAccountManager.getOsAccountConstraints(null, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_1400
     * @tc.number OsAccountErrCodeCheck_1400
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1400 "
      console.info(tag + "start====");
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start getOsAccountConstraints");
        let data = await osAccountManager.getOsAccountConstraints(undefined);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_1500
     * @tc.number OsAccountErrCodeCheck_1500
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1500 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getCurrentOsAccount");
      try {
        osAccountManager.getCurrentOsAccount(null);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_1600
     * @tc.number OsAccountErrCodeCheck_1600
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1600 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getCurrentOsAccount");
      try {
        osAccountManager.getCurrentOsAccount(undefined);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_1700
     * @tc.number OsAccountErrCodeCheck_1700
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1700 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getOsAccountType");
      try {
        osAccountManager.getOsAccountType(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_1800
     * @tc.number OsAccountErrCodeCheck_1800
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1800 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getOsAccountType");
      try {
        osAccountManager.getOsAccountType(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_1900
     * @tc.number OsAccountErrCodeCheck_1900
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_1900 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start queryDistributedVirtualDeviceId");
      try {
        osAccountManager.queryDistributedVirtualDeviceId(undefined);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_2000
     * @tc.number OsAccountErrCodeCheck_2000
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_2000 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start queryDistributedVirtualDeviceId");
      try {
        osAccountManager.queryDistributedVirtualDeviceId(null);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_2100
     * @tc.number OsAccountErrCodeCheck_2100
     * @tc.desc   err code check 12300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_2100 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start checkOsAccountConstraintEnabled");
      try {
        osAccountManager.checkOsAccountConstraintEnabled(101, "", (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect(err.code).assertEqual(12300002);
            console.info(tag + "end====");
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
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
     * @tc.name   OsAccountErrCodeCheck_2200
     * @tc.number OsAccountErrCodeCheck_2200
     * @tc.desc   err code check 12300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_2200 "
      console.info(tag + "start====");
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start checkOsAccountConstraintEnabled");
        let data = await osAccountManager.checkOsAccountConstraintEnabled(101, "");
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300002);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_2300
     * @tc.number OsAccountErrCodeCheck_2300
     * @tc.desc   err code check 12300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_2300 "
      console.info(tag + "start====");
      let name = '';
      let info: osAccount.DomainAccountInfo = {
        domain: "domain",
        accountName: name
      }
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getOsAccountLocalIdForDomain");
      try {
        osAccountManager.getOsAccountLocalIdForDomain(info, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect(err.code).assertEqual(12300002);
            console.info(tag + "end====");
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
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
     * @tc.name   OsAccountErrCodeCheck_2400
     * @tc.number OsAccountErrCodeCheck_2400
     * @tc.desc   err code check 12300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_2400 "
      console.info(tag + "start====");
      let name = '';
      let info: osAccount.DomainAccountInfo = {
        domain: name,
        accountName: "name"
      }
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getOsAccountLocalIdForDomain");
      try {
        osAccountManager.getOsAccountLocalIdForDomain(info, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect(err.code).assertEqual(12300002);
            console.info(tag + "end====");
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
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
     * @tc.name   OsAccountErrCodeCheck_2500
     * @tc.number OsAccountErrCodeCheck_2500
     * @tc.desc   err code check 12300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_2500 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 513; i++) {
        name += 'i';
      }
      let info: osAccount.DomainAccountInfo = {
        domain: name,
        accountName: "name"
      }
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start getOsAccountLocalIdForDomain");
        let data = await osAccountManager.getOsAccountLocalIdForDomain(info);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300002);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_2600
     * @tc.number OsAccountErrCodeCheck_2600
     * @tc.desc   err code check 12300002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_2600 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 513; i++) {
        name += 'i';
      }
      let info: osAccount.DomainAccountInfo = {
        domain: "domain",
        accountName: name
      }
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start getOsAccountLocalIdForDomain");
        let data = await osAccountManager.getOsAccountLocalIdForDomain(info);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300002);
        done();
      }
    });

    /**
     * @tc.name   OsAccountErrCodeCheck_2700
     * @tc.number OsAccountErrCodeCheck_2700
     * @tc.desc   err code check 12300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_2700 "
      console.info(tag + "start====");
      let osAccountManager = osAccount.getAccountManager();
      console.info(tag + "start getOsAccountLocalIdForSerialNumber");
      try {
        osAccountManager.getOsAccountLocalIdForSerialNumber(-1, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect(err.code).assertEqual(12300003);
            console.info(tag + "end====");
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
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
     * @tc.name   OsAccountErrCodeCheck_2800
     * @tc.number OsAccountErrCodeCheck_2800
     * @tc.desc   err code check 12300003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('OsAccountErrCodeCheck_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>OsAccountErrCodeCheck_2800 "
      console.info(tag + "start====");
      try {
        let osAccountManager = osAccount.getAccountManager();
        console.info(tag + "start getOsAccountLocalIdForSerialNumber");
        let data = await osAccountManager.getOsAccountLocalIdForSerialNumber(0.1);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300003);
        done();
      }
    });
  })
}
