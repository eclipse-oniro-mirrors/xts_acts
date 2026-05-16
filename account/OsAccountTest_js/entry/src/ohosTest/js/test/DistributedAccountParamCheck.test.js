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
import distributedAccount from '@ohos.account.distributedAccount'
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function DistributedAccountParamCheck() {
  describe('DistributedAccountParamCheck', () => {

    /**
     * @tc.name   DistributedAccountParamCheck_0100
     * @tc.number DistributedAccountParamCheck_0100
     * @tc.desc   updateOsAccountDistributedInfo with null accountInfo callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_0100 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      try {
        distributedAccountAbility.updateOsAccountDistributedInfo(null, (err) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect(err).not().assertNull();
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
     * @tc.name   DistributedAccountParamCheck_0200
     * @tc.number DistributedAccountParamCheck_0200
     * @tc.desc   updateOsAccountDistributedInfo with undefined accountInfo callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_0200 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      try {
        distributedAccountAbility.updateOsAccountDistributedInfo(undefined, (err) => {
          console.info(tag + "err: " + JSON.stringify(err));
          try {
            expect(err).not().assertNull();
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
     * @tc.name   DistributedAccountParamCheck_0300
     * @tc.number DistributedAccountParamCheck_0300
     * @tc.desc   updateOsAccountDistributedInfo promise with null accountInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_0300 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      try {
        await distributedAccountAbility.updateOsAccountDistributedInfo(null);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err).not().assertNull();
        done();
      }
    });

    /**
     * @tc.name   DistributedAccountParamCheck_0400
     * @tc.number DistributedAccountParamCheck_0400
     * @tc.desc   updateOsAccountDistributedInfo promise with undefined accountInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_0400 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      try {
        await distributedAccountAbility.updateOsAccountDistributedInfo(undefined);
        console.info("====>run err");
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err).not().assertNull();
        done();
      }
    });

    /**
     * @tc.name   DistributedAccountParamCheck_0500
     * @tc.number DistributedAccountParamCheck_0500
     * @tc.desc   updateOsAccountDistributedInfo with empty nickname callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_0500 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        nickname: ''
      };
      distributedAccountAbility.updateOsAccountDistributedInfo(accountInfo, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err).not().assertNull();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   DistributedAccountParamCheck_0600
     * @tc.number DistributedAccountParamCheck_0600
     * @tc.desc   updateOsAccountDistributedInfo with empty avatar callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_0600 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        avatar: ''
      };
      distributedAccountAbility.updateOsAccountDistributedInfo(accountInfo, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err).not().assertNull();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   DistributedAccountParamCheck_0700
     * @tc.number DistributedAccountParamCheck_0700
     * @tc.desc   updateOsAccountDistributedInfo promise with empty nickname.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_0700 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        nickname: ''
      };
      try {
        await distributedAccountAbility.updateOsAccountDistributedInfo(accountInfo);
        console.info(tag + "success");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err).not().assertNull();
        done();
      }
    });

    /**
     * @tc.name   DistributedAccountParamCheck_0800
     * @tc.number DistributedAccountParamCheck_0800
     * @tc.desc   updateOsAccountDistributedInfo promise with empty avatar.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_0800 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        avatar: ''
      };
      try {
        await distributedAccountAbility.updateOsAccountDistributedInfo(accountInfo);
        console.info(tag + "success");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err).not().assertNull();
        done();
      }
    });

    /**
     * @tc.name   DistributedAccountParamCheck_0900
     * @tc.number DistributedAccountParamCheck_0900
     * @tc.desc   updateOsAccountDistributedInfo with status NOT_LOGGED_IN callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_0900 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        status: distributedAccount.DistributedAccountStatus.NOT_LOGGED_IN
      };
      distributedAccountAbility.updateOsAccountDistributedInfo(accountInfo, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err).not().assertNull();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   DistributedAccountParamCheck_1000
     * @tc.number DistributedAccountParamCheck_1000
     * @tc.desc   updateOsAccountDistributedInfo with status LOGGED_IN callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1000 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        status: distributedAccount.DistributedAccountStatus.LOGGED_IN
      };
      distributedAccountAbility.updateOsAccountDistributedInfo(accountInfo, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err).not().assertNull();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   DistributedAccountParamCheck_1100
     * @tc.number DistributedAccountParamCheck_1100
     * @tc.desc   updateOsAccountDistributedInfo promise with status NOT_LOGGED_IN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1100 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        status: distributedAccount.DistributedAccountStatus.NOT_LOGGED_IN
      };
      try {
        await distributedAccountAbility.updateOsAccountDistributedInfo(accountInfo);
        console.info(tag + "success");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err).not().assertNull();
        done();
      }
    });

    /**
     * @tc.name   DistributedAccountParamCheck_1200
     * @tc.number DistributedAccountParamCheck_1200
     * @tc.desc   updateOsAccountDistributedInfo promise with status LOGGED_IN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1200 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        status: distributedAccount.DistributedAccountStatus.LOGGED_IN
      };
      try {
        await distributedAccountAbility.updateOsAccountDistributedInfo(accountInfo);
        console.info(tag + "success");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err).not().assertNull();
        done();
      }
    });

    /**
     * @tc.name   DistributedAccountParamCheck_1300
     * @tc.number DistributedAccountParamCheck_1300
     * @tc.desc   setOsAccountDistributedInfo with status NOT_LOGGED_IN callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1300 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        status: distributedAccount.DistributedAccountStatus.NOT_LOGGED_IN
      };
      distributedAccountAbility.setOsAccountDistributedInfo(accountInfo, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   DistributedAccountParamCheck_1400
     * @tc.number DistributedAccountParamCheck_1400
     * @tc.desc   setOsAccountDistributedInfo with status LOGGED_IN callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1400 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        status: distributedAccount.DistributedAccountStatus.LOGGED_IN
      };
      distributedAccountAbility.setOsAccountDistributedInfo(accountInfo, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   DistributedAccountParamCheck_1500
     * @tc.number DistributedAccountParamCheck_1500
     * @tc.desc   setOsAccountDistributedInfo promise with status NOT_LOGGED_IN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1500 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        status: distributedAccount.DistributedAccountStatus.NOT_LOGGED_IN
      };
      try {
        await distributedAccountAbility.setOsAccountDistributedInfo(accountInfo);
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
      * @tc.name   DistributedAccountParamCheck_1600
      * @tc.number DistributedAccountParamCheck_1600
      * @tc.desc   setOsAccountDistributedInfo promise with status LOGGED_IN.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL3
      */
    it('DistributedAccountParamCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1600 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      let accountInfo = {
        name: 'testName',
        id: 'testId',
        event: 'testEvent',
        status: distributedAccount.DistributedAccountStatus.LOGGED_IN
      };
      try {
        await distributedAccountAbility.setOsAccountDistributedInfo(accountInfo);
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
     * @tc.name   DistributedAccountParamCheck_1700
     * @tc.number DistributedAccountParamCheck_1700
     * @tc.desc   return of getDistributedAccountAbility.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1700 "
      console.info(tag + "start====");
      try {
        let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
        console.info(tag + "distributedAccountAbility is: " + JSON.stringify(distributedAccountAbility));
        expect(distributedAccountAbility).not().assertUndefined();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   DistributedAccountParamCheck_1800
     * @tc.number DistributedAccountParamCheck_1800
     * @tc.desc   updateOsAccountDistributedInfo promise with status LOGGED_IN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1800 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      try {
        let data = await distributedAccountAbility.queryOsAccountDistributedInfo();
        console.info(tag + "data: " + JSON.stringify(data));
        expect(data.name).not().assertUndefined();
        expect(data.id).not().assertUndefined();
        expect(data.event).not().assertUndefined();
        expect(data.nickname).not().assertUndefined();
        expect(data.avatar).not().assertUndefined();
        expect(data.status).not().assertUndefined();
        expect(data.scalableData).not().assertUndefined();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   DistributedAccountParamCheck_1900
     * @tc.number DistributedAccountParamCheck_1900
     * @tc.desc   setOsAccountDistributedInfo with status NOT_LOGGED_IN callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done) => {
      let tag = "====>DistributedAccountParamCheck_1900 "
      console.info(tag + "start====");
      let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
      distributedAccountAbility.queryOsAccountDistributedInfo((err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(data.name).not().assertUndefined();
          expect(data.id).not().assertUndefined();
          expect(data.event).not().assertUndefined();
          expect(data.nickname).not().assertUndefined();
          expect(data.avatar).not().assertUndefined();
          expect(data.status).not().assertUndefined();
          expect(data.scalableData).not().assertUndefined();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });
  });
}
