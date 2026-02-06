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
import account from '@ohos.account.appAccount'
import { describe, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function AppAccountParamLengthCheck() {
  describe('AppAccountParamLengthCheck', () => {

    let accountManager = account.createAppAccountManager();

    /**
     * @tc.name   AppAccountParamLengthCheck_0100
     * @tc.number AppAccountParamLengthCheck_0100
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_0100 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start createAccount");
      accountManager.createAccount(name, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_0200
     * @tc.number AppAccountParamLengthCheck_0200
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_0200 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start createAccount");
      try {
        await accountManager.createAccount(name);
        console.info(tag + "start removeAccount");
        await accountManager.removeAccount(name);
        console.info(tag + "end====");
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_0300
     * @tc.number AppAccountParamLengthCheck_0300
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_0300 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start createAccount");
      try {
        await accountManager.createAccount(name);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_0400
     * @tc.number AppAccountParamLengthCheck_0400
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_0400 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start removeAccount");
      accountManager.removeAccount(name, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_0500
     * @tc.number AppAccountParamLengthCheck_0500
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_0500 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start removeAccount");
      try {
        await accountManager.removeAccount(name);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_0600
     * @tc.number AppAccountParamLengthCheck_0600
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_0600 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start setAppAccess");
      accountManager.setAppAccess(name, "com.example.fake", true, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          if (err) {
            expect(err.code).assertEqual(12300003);
            console.info(tag + "end====");
          } else {
            expect().assertFail()
          }
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_0700
     * @tc.number AppAccountParamLengthCheck_0700
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_0700 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start setAppAccess");
      accountManager.setAppAccess(name, "com.example.fake", true, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          if (err) {
            expect(err.code).assertEqual(12300003);
            console.info(tag + "end====");
          } else {
            expect().assertFail()
          }
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_0800
     * @tc.number AppAccountParamLengthCheck_0800
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_0800 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start setAppAccess");
      accountManager.setAppAccess(name, "com.example.accounttstest", true, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_0900
     * @tc.number AppAccountParamLengthCheck_0900
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_0900 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start setAppAccess");
      accountManager.checkDataSyncEnabled(name, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1000
     * @tc.number AppAccountParamLengthCheck_1000
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1000 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start checkDataSyncEnabled");
      try {
        await accountManager.checkDataSyncEnabled(name);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1100
     * @tc.number AppAccountParamLengthCheck_1100
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1100 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start checkDataSyncEnabled");
      try {
        await accountManager.checkDataSyncEnabled(name);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1200
     * @tc.number AppAccountParamLengthCheck_1200
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1200 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start setCredential");
      accountManager.setCredential(name, "credentialType", "credential", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1300
     * @tc.number AppAccountParamLengthCheck_1300
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1300 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start setCredential");
      accountManager.setCredential(name, "credentialType", "credential", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1400
     * @tc.number AppAccountParamLengthCheck_1400
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1400 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start setCredential");
      try {
        await accountManager.setCredential(name, "credentialType", "credential");
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1500
     * @tc.number AppAccountParamLengthCheck_1500
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1500 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start setCredential");
      try {
        await accountManager.setCredential(name, "credentialType", "credential");
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1600
     * @tc.number AppAccountParamLengthCheck_1600
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1600 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start setDataSyncEnabled");
      accountManager.setDataSyncEnabled(name, true, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1700
     * @tc.number AppAccountParamLengthCheck_1700
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1700 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start setDataSyncEnabled");
      try {
        await accountManager.setDataSyncEnabled(name, true);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(201);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1800
     * @tc.number AppAccountParamLengthCheck_1800
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1800 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start setDataSyncEnabled");
      try {
        await accountManager.setDataSyncEnabled(name, true);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_1900
     * @tc.number AppAccountParamLengthCheck_1900
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_1900 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start setCustomData");
      accountManager.setCustomData(name, "key", "value", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2000
     * @tc.number AppAccountParamLengthCheck_2000
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2000 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start setCustomData");
      accountManager.setCustomData(name, "key", "value", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2100
     * @tc.number AppAccountParamLengthCheck_2100
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2100 "
      console.info(tag + "start====");
      let value = '';
      for (let i = 0; i < 1024; i++) {
        value += 'i';
      }
      console.info(tag + "start setCustomData");
      try {
        await accountManager.setCustomData("name", "key", value);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2200
     * @tc.number AppAccountParamLengthCheck_2200
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2200 "
      console.info(tag + "start====");
      let value = '';
      for (let i = 0; i < 1024 + 1; i++) {
        value += 'i';
      }
      console.info(tag + "start setCustomData");
      try {
        await accountManager.setCustomData("name", "key", value);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2300
     * @tc.number AppAccountParamLengthCheck_2300
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2300 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start getCredential");
      accountManager.getCredential(name, "credentialType", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2400
     * @tc.number AppAccountParamLengthCheck_2400
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2400 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start getCustomData");
      accountManager.getCustomData(name, "key", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2500
     * @tc.number AppAccountParamLengthCheck_2500
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2500 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start getCustomData");
      try {
        await accountManager.getCustomData(name, "key");
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2600
     * @tc.number AppAccountParamLengthCheck_2600
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2600 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start getCustomData");
      try {
        await accountManager.getCustomData(name, "key");
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2700
     * @tc.number AppAccountParamLengthCheck_2700
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2700 "
      console.info(tag + "start====");
      let key = 'i';
      console.info(tag + "start getCustomDataSync");
      try {
        accountManager.getCustomDataSync("name", key);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2800
     * @tc.number AppAccountParamLengthCheck_2800
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2800 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024; i++) {
        key += 'i';
      }
      console.info(tag + "start getCustomDataSync");
      try {
        accountManager.getCustomDataSync("name", key);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_2900
     * @tc.number AppAccountParamLengthCheck_2900
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_2900 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024 + 1; i++) {
        key += 'i';
      }
      console.info(tag + "start getCustomDataSync");
      try {
        accountManager.getCustomDataSync("name", key);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3000
     * @tc.number AppAccountParamLengthCheck_3000
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3000 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start auth");
      accountManager.auth(name, "com.example.accounttstest", "getSocialData", {
        onResult: (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300113);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info(tag + "onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3100
     * @tc.number AppAccountParamLengthCheck_3100
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3100 "
      console.info(tag + "start====");
      let name = 'i';
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info(tag + "start auth");
      accountManager.auth(name, "com.example.accounttstest", "getSocialData", options, {
        onResult: (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300113);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info(tag + "onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3200
     * @tc.number AppAccountParamLengthCheck_3200
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3200 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info(tag + "start auth");
      accountManager.auth(name, "com.example.accounttstest", "getSocialData", options, {
        onResult: (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300002);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info(tag + "onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3300
     * @tc.number AppAccountParamLengthCheck_3300
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3300 "
      console.info(tag + "start====");
      let name = '';
      console.info(tag + "start getAuthToken");
      accountManager.getAuthToken(name, "com.example.accounttstest", "authType", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3400
     * @tc.number AppAccountParamLengthCheck_3400
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3400 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start getAuthToken");
      accountManager.getAuthToken(name, "com.example.accounttstest", "authType", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3500
     * @tc.number AppAccountParamLengthCheck_3500
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3500 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start getAuthToken");
      accountManager.getAuthToken(name, "com.example.accounttstest", "authType", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3600
     * @tc.number AppAccountParamLengthCheck_3600
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3600 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start getAuthToken");
      accountManager.getAuthToken(name, "com.example.accounttstest", "authType", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3700
     * @tc.number AppAccountParamLengthCheck_3700
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3700 "
      console.info(tag + "start====");
      let authType = '';
      for (let i = 0; i < 1024; i++) {
        authType += 'i';
      }
      console.info(tag + "start getAuthToken");
      try {
        await accountManager.getAuthToken("name", "com.example.accounttstest", authType);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3800
     * @tc.number AppAccountParamLengthCheck_3800
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3800 "
      console.info(tag + "start====");
      let authType = '';
      for (let i = 0; i < 1024 + 1; i++) {
        authType += 'i';
      }
      console.info(tag + "start getAuthToken");
      try {
        await accountManager.getAuthToken("name", "com.example.accounttstest", authType);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_3900
     * @tc.number AppAccountParamLengthCheck_3900
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_3900 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start setAuthToken");
      accountManager.setAuthToken(name, "authType", "token", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4000
     * @tc.number AppAccountParamLengthCheck_4000
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4000 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start setAuthToken");
      accountManager.setAuthToken(name, "authType", "token", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4100
     * @tc.number AppAccountParamLengthCheck_4100
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4100 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start setAuthToken");
      accountManager.setAuthToken(name, "authType", "token", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4200
     * @tc.number AppAccountParamLengthCheck_4200
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4200 "
      console.info(tag + "start====");
      let token = '';
      for (let i = 0; i < 1024; i++) {
        token += 'i';
      }
      console.info(tag + "start setAuthToken");
      try {
        await accountManager.setAuthToken("name", "authType", token);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4300
     * @tc.number AppAccountParamLengthCheck_4300
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4300 "
      console.info(tag + "start====");
      let token = '';
      for (let i = 0; i < 1024 + 1; i++) {
        token += 'i';
      }
      console.info(tag + "start setAuthToken");
      try {
        await accountManager.setAuthToken("name", "authType", token);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4400
     * @tc.number AppAccountParamLengthCheck_4400
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4400 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start deleteAuthToken");
      accountManager.deleteAuthToken(name, "com.example.accounttstest","authType", "token", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4500
     * @tc.number AppAccountParamLengthCheck_4500
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4500 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start deleteAuthToken");
      accountManager.deleteAuthToken(name, "com.example.accounttstest","authType", "token", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4600
     * @tc.number AppAccountParamLengthCheck_4600
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4600 "
      console.info(tag + "start====");
      let token = 'i';
      console.info(tag + "start deleteAuthToken");
      try {
        await accountManager.deleteAuthToken("name", "com.example.accounttstest","authType", token);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4700
     * @tc.number AppAccountParamLengthCheck_4700
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4700 "
      console.info(tag + "start====");
      let token = '';
      for (let i = 0; i < 1024; i++) {
        token += 'i';
      }
      console.info(tag + "start deleteAuthToken");
      try {
        await accountManager.deleteAuthToken("name", "com.example.accounttstest","authType", token);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4800
     * @tc.number AppAccountParamLengthCheck_4800
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4800 "
      console.info(tag + "start====");
      let token = '';
      for (let i = 0; i < 1024 + 1; i++) {
        token += 'i';
      }
      console.info(tag + "start deleteAuthToken");
      try {
        await accountManager.deleteAuthToken("name", "com.example.accounttstest","authType", token);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_4900
     * @tc.number AppAccountParamLengthCheck_4900
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_4900 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start setAuthTokenVisibility");
      accountManager.setAuthTokenVisibility(name, "authType", "com.example.fake", true, (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          if (err) {
            expect(err.code).assertEqual(12300003);
            console.info(tag + "end====");
          } else {
            expect().assertFail();
          }
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_5000
     * @tc.number AppAccountParamLengthCheck_5000
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5000 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start checkAuthTokenVisibility");
      accountManager.checkAuthTokenVisibility(name, "authType", "com.example.accounttstest", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_5100
     * @tc.number AppAccountParamLengthCheck_5100
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5100 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start getAllAuthTokens");
      accountManager.getAllAuthTokens(name, "com.example.accounttstest", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_5200
     * @tc.number AppAccountParamLengthCheck_5200
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5200 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start getAllAuthTokens");
      accountManager.getAllAuthTokens(name, "com.example.accounttstest", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      });
    });
    /**
     * @tc.name   AppAccountParamLengthCheck_5300
     * @tc.number AppAccountParamLengthCheck_5300
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5300 "
      console.info(tag + "start====");
      let authType = '';
      for (let i = 0; i < 1024; i++) {
        authType += 'i';
      }
      console.info(tag + "start getAuthList");
      try {
        await accountManager.getAuthList("name", authType);
        console.info(tag + "run err");
        expect().assertFail();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        console.info(tag + "end====");
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_5400
     * @tc.number AppAccountParamLengthCheck_5400
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5400 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start checkAccountLabels");
      accountManager.checkAccountLabels(name, "com.example.accounttstest", [''], (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300113);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_5500
     * @tc.number AppAccountParamLengthCheck_5500
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5500 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start checkAccountLabels");
      accountManager.checkAccountLabels(name, "com.example.accounttstest", [''], (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300113);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_5600
     * @tc.number AppAccountParamLengthCheck_5600
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5600 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start checkAccountLabels");
      accountManager.checkAccountLabels(name, "com.example.accounttstest", [], (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_5700
     * @tc.number AppAccountParamLengthCheck_5700
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5700 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start deleteCredential");
      accountManager.deleteCredential(name, "credentialType", (err) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_5800
     * @tc.number AppAccountParamLengthCheck_5800
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5800 "
      console.info(tag + "start====");
      let name = 'i';
      console.info(tag + "start verifyCredential");
      accountManager.verifyCredential(name, "com.example.accounttstest", {
        onResult: (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300113);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info(tag + "onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_5900
     * @tc.number AppAccountParamLengthCheck_5900
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_5900 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512 + 1; i++) {
        name += 'i';
      }
      console.info(tag + "start verifyCredential");
      accountManager.verifyCredential(name, "com.example.accounttstest", {
        onResult: (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300002);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info(tag + "onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountParamLengthCheck_6000
     * @tc.number AppAccountParamLengthCheck_6000
     * @tc.desc   Parameter Length Check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamLengthCheck_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamLengthCheck_6000 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      console.info(tag + "start checkAppAccess");
      accountManager.checkAppAccess(name, "com.example.fake", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });
  });
}
