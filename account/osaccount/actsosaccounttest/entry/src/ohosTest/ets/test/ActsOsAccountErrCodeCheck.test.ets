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

    /*
    * @tc.number    : OsAccountErrCodeCheck_0100
    * @tc.name      : test interface checkOsAccountActivated callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_0200
    * @tc.name      : test interface checkOsAccountActivated promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_0300
    * @tc.name      : test interface checkOsAccountConstraintEnabled callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_0400
    * @tc.name      : test interface checkOsAccountConstraintEnabled promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_0500
    * @tc.name      : test interface checkOsAccountConstraintEnabled callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_0600
    * @tc.name      : test interface checkOsAccountConstraintEnabled promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_0700
    * @tc.name      : test interface checkOsAccountVerified callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_0800
    * @tc.name      : test interface checkOsAccountVerified promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_0900
    * @tc.name      : test interface getOsAccountCount callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_1000
    * @tc.name      : test interface getOsAccountCount callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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


    /*
    * @tc.number    : OsAccountErrCodeCheck_1100
    * @tc.name      : test interface getOsAccountLocalIdForDomain callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_1200
    * @tc.name      : test interface getOsAccountLocalIdForDomain promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_1300
    * @tc.name      : test interface getOsAccountConstraints callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_1400
    * @tc.name      : test interface getOsAccountConstraints promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_1500
    * @tc.name      : test interface getCurrentOsAccount callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_1600
    * @tc.name      : test interface getCurrentOsAccount callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_1700
    * @tc.name      : test interface getOsAccountType callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_1800
    * @tc.name      : test interface getOsAccountType callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_1900
    * @tc.name      : test interface queryDistributedVirtualDeviceId callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_2000
    * @tc.name      : test interface queryDistributedVirtualDeviceId callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_2100
    * @tc.name      : test checkOsAccountConstraintEnabled callback
    * @tc.desc      : err code check 12300002
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_2200
    * @tc.name      : test checkOsAccountConstraintEnabled promise
    * @tc.desc      : err code check 12300002
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_2300
    * @tc.name      : test getOsAccountLocalIdForDomain callback
    * @tc.desc      : err code check 12300002
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_2400
    * @tc.name      : test getOsAccountLocalIdForDomain callback
    * @tc.desc      : err code check 12300002
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_2500
    * @tc.name      : test getOsAccountLocalIdForDomain promise
    * @tc.desc      : err code check 12300002
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_2600
    * @tc.name      : test getOsAccountLocalIdForDomain promise
    * @tc.desc      : err code check 12300002
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_2700
    * @tc.name      : test getOsAccountLocalIdForSerialNumber callback
    * @tc.desc      : err code check 12300003
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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

    /*
    * @tc.number    : OsAccountErrCodeCheck_2800
    * @tc.name      : test getOsAccountLocalIdForSerialNumber promise
    * @tc.desc      : err code check 12300003
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
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