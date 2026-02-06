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

const name = 'zhangSan'
const owner = 'com.acts.notExist'
const nameLimit = 512


export default function AppAccountErrCodeCheck() {
  describe('AppAccountErrCodeCheck', () => {

    afterEach(async (done: Function) => {
      try {
        let appAccountManager = account.createAppAccountManager();
        await appAccountManager.removeAccount("zhangSan");
        console.info("====>afterEach removeAccount done");
        done();
      } catch (err) {
        console.info("====>beforeEach catch err: " + JSON.stringify(err));
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_0100
    * @tc.name      : test interface checkAppAccess callbcak
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_0100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAppAccess");
      try {
        appAccountManager.checkAppAccess(null, owner, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
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
    * @tc.number    : AppAccountErrCodeCheck_0200
    * @tc.name      : test interface checkAppAccess promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_0200 "
      console.info(tag + "start====");
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start checkAppAccess");
        let data = await appAccountManager.checkAppAccess(null, owner);
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
    * @tc.number    : AppAccountErrCodeCheck_0300
    * @tc.name      : test interface checkAppAccess callbcak
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_0300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAppAccess");
      try {
        appAccountManager.checkAppAccess(undefined, owner, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
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
    * @tc.number    : AppAccountErrCodeCheck_0400
    * @tc.name      : test interface checkAppAccess promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_0400 "
      console.info(tag + "start====");
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start checkAppAccess");
        let data = await appAccountManager.checkAppAccess(undefined, owner);
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
    * @tc.number    : AppAccountErrCodeCheck_0500
    * @tc.name      : test interface checkAppAccess callbcak
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_0500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAppAccess");
      try {
        appAccountManager.checkAppAccess(name, undefined, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
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
    * @tc.number    : AppAccountErrCodeCheck_0600
    * @tc.name      : test interface checkAppAccess promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_0600 "
      console.info(tag + "start====");
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start checkAppAccess");
        let data = await appAccountManager.checkAppAccess(name, null);
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
    * @tc.number    : AppAccountErrCodeCheck_0700
    * @tc.name      : test interface checkAppAccess callbcak
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_0700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAppAccess");
      try {
        appAccountManager.checkAppAccess(name, undefined, (err, data) => {
          console.info(tag + "err: " + JSON.stringify(err));
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
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
    * @tc.number    : AppAccountErrCodeCheck_0800
    * @tc.name      : test interface checkAppAccess promise
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_0800 "
      console.info(tag + "start====");
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start checkAppAccess");
        let data = await appAccountManager.checkAppAccess(name, undefined);
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
    * @tc.number    : AppAccountErrCodeCheck_0900
    * @tc.name      : test interface getAllAccounts callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_0900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getAllAccounts");
      try {
        appAccountManager.getAllAccounts(null);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_1000
    * @tc.name      : test interface getAllAccounts callback
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getAllAccounts");
      try {
        appAccountManager.getAllAccounts(undefined);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_1100
    * @tc.name      : test interface off
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start off");
      try {
        appAccountManager.off(null, (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
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
    * @tc.number    : AppAccountErrCodeCheck_1200
    * @tc.name      : test interface off
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start off");
      try {
        appAccountManager.off(undefined, (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
          try {
            expect().assertFail();
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
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
    * @tc.number    : AppAccountErrCodeCheck_1300
    * @tc.name      : test interface off
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start off");
      try {
        appAccountManager.off("accountChange", null);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_1400
    * @tc.name      : test interface off
    * @tc.desc      : 401 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start off");
      try {
        appAccountManager.off("accountChange", undefined);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code == 401 || err.code != null).assertFalse();
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_1500
    * @tc.name      : test interface createAccount
    * @tc.desc      : 12300007 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1500 "
      let options:account.CreateAccountOptions  = {
        customData: {
          age: '10'
        }
      }
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      for (let i = 0; i < 1000; i++) {
        console.info(tag + "start createAccount");
        await appAccountManager.createAccount("tempA" + i);
        console.info(tag + "createAccount tempA", + i);
      }
      console.info(tag + "start createAccount 1000 callback");
      appAccountManager.createAccount("zhangSan1000", async (err) => {
        console.info(tag + "createAccount callback err: " + JSON.stringify(err));
        try {
          expect(err != null).assertTrue();
          expect(err.code).assertEqual(12300007);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        console.info(tag + "start createAccount 1000 with options callback");
        appAccountManager.createAccount("zhangSan1000", options, async (err) => {
          console.info(tag + "createAccount callback with options err: " + JSON.stringify(err));
          try {
            expect(err != null).assertTrue();
            expect(err.code).assertEqual(12300007);
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          try {
            console.info(tag + "start createAccount 1000 promise");
            await appAccountManager.createAccount("zhangSan1000");
          } catch (err) {
            console.info(tag + "createAccount promise err: " + JSON.stringify(err));
            expect(err.code).assertEqual(12300007);
          }
          try {
            console.info(tag + "start createAccount 1000 with options promise");
            await appAccountManager.createAccount("zhangSan1000", options);
          } catch (err) {
            console.info(tag + "createAccount promise with options err: " + JSON.stringify(err));
            expect(err.code).assertEqual(12300007);
          }
          await appAccountManager.removeAccount("tempA0");
          console.info(tag + "removeAccount all done");
          done();
        });
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_1600
    * @tc.name      : test interface setCustomData
    * @tc.desc      : 12400003 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start createAccount");
      await appAccountManager.createAccount(name);
      for (let i = 0; i < 1024; i++) {
        await appAccountManager.setCustomData(name, "key" + i, "value" + i);
        console.info(tag + "setCustomData ", + i);
      }
      console.info(tag + "start setCustomData");
      appAccountManager.setCustomData(name, "key1025", "value1025", async (err) => {
        console.info(tag + "setCustomData callback err: " + JSON.stringify(err));
        try {
          expect(err != null).assertTrue();
          expect(err.code).assertEqual(12400003);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        try {
          await appAccountManager.setCustomData(name, "key1025", "value1025");
        } catch (err) {
          console.info(tag + "setCustomData promise err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12400003);
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_1700
    * @tc.name      : test interface setAuthToken
    * @tc.desc      : 12400004 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start createAccount");
      await appAccountManager.createAccount(name);
      for (let i = 0; i < 128; i++) {
        try {
          await appAccountManager.setAuthToken(name, "getSocialData" + i, "value" + i);
          console.info(tag + "setAuthToken ", + i);
        } catch (err) {
          console.info(tag + "setAuthToken err: " + JSON.stringify(err));
          break
        }
      }
      console.info(tag + "start setAuthToken");
      appAccountManager.setAuthToken(name, "getSocialData", "value", async (err) => {
        console.info(tag + "setAuthToken callback err: " + JSON.stringify(err));
        try {
          expect(err != null).assertTrue();
          expect(err.code).assertEqual(12400004);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        try {
          await appAccountManager.setAuthToken(name, "getSocialData", "value");
        } catch (err) {
          console.info(tag + "setAuthToken promise err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12400004);
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_1800
    * @tc.name      : test interface setAuthTokenVisibility promise
    * @tc.desc      : 12400005 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start createAccount");
      await appAccountManager.createAccount(name);
      await appAccountManager.setAuthToken(name, "getSocialData", "value");
      for (let i = 0; i < 512; i++) {
        try {
          await appAccountManager.setAuthTokenVisibility(name, "getSocialData", owner + i, true);
          console.info(tag + "setAuthTokenVisibility ", + i);
        } catch (err) {
          console.info(tag + "setAuthTokenVisibility err: " + JSON.stringify(err));
          break
        }
      }
      console.info(tag + "start setAuthTokenVisibility");
      appAccountManager.setAuthTokenVisibility(name, "getSocialData", owner, true, async (err) => {
        console.info(tag + "setAuthTokenVisibility callback err: " + JSON.stringify(err));
        try {
          expect(err != null).assertTrue();
          expect(err.code).assertEqual(12400005);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        try {
          await appAccountManager.setAuthTokenVisibility(name, "getSocialData", owner, true);
        } catch (err) {
          console.info(tag + "setAuthTokenVisibility promise err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12400005);
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_1900
    * @tc.name      : test interface deleteCredential callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_1900 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        accountName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start deleteCredential");
      appAccountManager.deleteCredential(accountName, "PIN", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_2000
    * @tc.name      : test interface deleteCredential promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2000 "
      console.info(tag + "start====");
      let accountName = '';
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start deleteCredential");
        let data = await appAccountManager.deleteCredential(accountName, "PIN");
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
    * @tc.number    : AppAccountErrCodeCheck_2100
    * @tc.name      : test interface deleteCredential callback
    * @tc.desc      : 12300003 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2100 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit; i++) {
        accountName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start deleteCredential");
      appAccountManager.deleteCredential(accountName, "PIN", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_2200
    * @tc.name      : test interface deleteCredential promise
    * @tc.desc      : 12300003 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2200 "
      console.info(tag + "start====");
      let accountName = 'name';
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start deleteCredential");
        let data = await appAccountManager.deleteCredential(accountName, "PIN");
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

    /*
    * @tc.number    : AppAccountErrCodeCheck_2300
    * @tc.name      : test interface deleteCredential callback
    * @tc.desc      : 12300102 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start createAccount");
      await appAccountManager.createAccount(name);
      console.info(tag + "start deleteCredential");
      appAccountManager.deleteCredential(name, "PIN", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300102);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_2400
    * @tc.name      : test interface deleteCredential promise
    * @tc.desc      : 12300102 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2400 "
      console.info(tag + "start====");
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start createAccount");
        await appAccountManager.createAccount(name);
        console.info(tag + "start deleteCredential");
        let data = await appAccountManager.deleteCredential(name, "PIN");
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300102);
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_2500
    * @tc.name      : test interface checkAppAccess callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2500 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        accountName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAppAccess");
      appAccountManager.checkAppAccess(accountName, owner, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_2600
    * @tc.name      : test interface checkAppAccess callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2600 "
      console.info(tag + "start====");
      let accountName = 'i';
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAppAccess");
      appAccountManager.checkAppAccess(accountName, owner, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_2700
    * @tc.name      : test interface checkAppAccess promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2700 "
      console.info(tag + "start====");
      let accountName = '';
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start checkAppAccess");
        let data = await appAccountManager.checkAppAccess(accountName, owner);
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
    * @tc.number    : AppAccountErrCodeCheck_2800
    * @tc.name      : test interface checkAppAccess promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2800 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit; i++) {
        accountName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start checkAppAccess");
        let data = await appAccountManager.checkAppAccess(accountName, owner);
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

    /*
    * @tc.number    : AppAccountErrCodeCheck_2900
    * @tc.name      : test interface checkAppAccess promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_2900 "
      console.info(tag + "start====");
      let bundleName = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        bundleName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.createAccount(name);
        console.info(tag + "start checkAppAccess");
        let data = await appAccountManager.checkAppAccess(name, bundleName);
        console.info(tag + "data: " + JSON.stringify(data));
        await appAccountManager.removeAccount(name);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        await appAccountManager.removeAccount(name);
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300002);
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_3000
    * @tc.name      : test interface checkAppAccess callback
    * @tc.desc      : 12300003 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3000 "
      let bundleName = '';
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start createAccount");
      await appAccountManager.createAccount(name);
      console.info(tag + "start checkAppAccess");
      appAccountManager.checkAppAccess(name, bundleName, async (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        await appAccountManager.removeAccount(name);
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_3100
    * @tc.name      : test interface checkAppAccess promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3100 "
      console.info(tag + "start====");
      let bundleName = 'i';
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.createAccount(name);
        console.info(tag + "start checkAppAccess");
        let data = await appAccountManager.checkAppAccess(name, bundleName);
        console.info(tag + "data: " + JSON.stringify(data));
        await appAccountManager.removeAccount(name);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        await appAccountManager.removeAccount(name);
        expect().assertFail();
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_3200
    * @tc.name      : test interface checkAppAccess callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3200 "
      let bundleName = '';
      for (let i = 0; i < nameLimit; i++) {
        bundleName += 'i';
      }
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start createAccount");
      await appAccountManager.createAccount(name);
      console.info(tag + "start checkAppAccess");
      appAccountManager.checkAppAccess(name, bundleName, async (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        await appAccountManager.removeAccount(name);
        try {
          expect(err).assertEqual(null);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_3300
    * @tc.name      : test interface getCustomDataSync
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3300 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024; i++) {
        key += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start createAccount");
        await appAccountManager.createAccount(name);
        console.info(tag + "start getCustomDataSync");
        let data = appAccountManager.getCustomDataSync(name, key);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12400002);
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_3400
    * @tc.name      : test interface getCustomDataSync
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3400 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit; i++) {
        accountName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getCustomDataSync");
        let data = appAccountManager.getCustomDataSync(accountName, "credentialType");
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

    /*
    * @tc.number    : AppAccountErrCodeCheck_3500
    * @tc.name      : test interface getCustomDataSync
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3500 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        accountName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getCustomDataSync");
        let data = appAccountManager.getCustomDataSync(accountName, "credentialType");
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
    * @tc.number    : AppAccountErrCodeCheck_3600
    * @tc.name      : test interface getCustomDataSync
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3600 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024 + 1; i++) {
        key += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start createAccount");
        await appAccountManager.createAccount(name);
        console.info(tag + "start getCustomDataSync");
        let data = appAccountManager.getCustomDataSync(name, key);
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
    * @tc.number    : AppAccountErrCodeCheck_3700
    * @tc.name      : test interface setCredential promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3700 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit; i++) {
        accountName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start setCredential");
        let data = await appAccountManager.setCredential(accountName, "owner", "a");
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


    /*
    * @tc.number    : AppAccountErrCodeCheck_3800
    * @tc.name      : test interface setCredential callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3800 "
      console.info(tag + "start====");
      let credentialType = '';
      for (let i = 0; i < 1024 + 1; i++) {
        credentialType += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start setCredential");
      appAccountManager.setCredential("accountName", credentialType, "a", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_3900
    * @tc.name      : test interface setCredential promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_3900 "
      console.info(tag + "start====");
      let credentialType = '';
      for (let i = 0; i < 1024; i++) {
        credentialType += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start setCredential");
        let data = await appAccountManager.setCredential("accountName", credentialType, "a");
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


    /*
    * @tc.number    : AppAccountErrCodeCheck_4000
    * @tc.name      : test interface setCredential callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4000 "
      console.info(tag + "start====");
      let credential = '';
      for (let i = 0; i < 1024; i++) {
        credential += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start setCredential");
      appAccountManager.setCredential("accountName", "credentialType", credential, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_4100
    * @tc.name      : test interface setCredential promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4100 "
      console.info(tag + "start====");
      let credential = '';
      for (let i = 0; i < 1024 + 1; i++) {
        credential += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start setCredential");
        let data = await appAccountManager.setCredential("accountName", "credentialType", credential);
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
    * @tc.number    : AppAccountErrCodeCheck_4200
    * @tc.name      : test interface setCredential callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4200 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        accountName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start setCredential");
      appAccountManager.setCredential(accountName, "owner", "a", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_4300
    * @tc.name      : test interface setCustomData promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4300 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit; i++) {
        accountName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start setCustomData");
        let data = await appAccountManager.setCustomData(accountName, "owner", "a");
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

    /*
    * @tc.number    : AppAccountErrCodeCheck_4400
    * @tc.name      : test interface setCustomData callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4400 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024; i++) {
        key += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start setCustomData");
      appAccountManager.setCustomData("accountName", key, "a", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_4500
    * @tc.name      : test interface setCustomData promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4500 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024 + 1; i++) {
        key += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start setCustomData");
        let data = await appAccountManager.setCustomData("accountName", key, "a");
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
    * @tc.number    : AppAccountErrCodeCheck_4600
    * @tc.name      : test interface setCustomData callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4600 "
      console.info(tag + "start====");
      let value = '';
      for (let i = 0; i < 1024; i++) {
        value += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start setCustomData");
      appAccountManager.setCustomData("accountName", "credentialType", value, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_4700
    * @tc.name      : test interface setCustomData promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4700 "
      console.info(tag + "start====");
      let value = '';
      for (let i = 0; i < 1024 + 1; i++) {
        value += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start setCustomData");
        let data = await appAccountManager.setCustomData("accountName", "credentialType", value);
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
    * @tc.number    : AppAccountErrCodeCheck_4800
    * @tc.name      : test interface setCustomData callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4800 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        accountName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start setCustomData");
      appAccountManager.setCustomData(accountName, "owner", "a", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_4900
    * @tc.name      : test interface getCredential promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_4900 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit; i++) {
        accountName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getCredential");
        let data = await appAccountManager.getCredential(accountName, "credentialType");
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

    /*
    * @tc.number    : AppAccountErrCodeCheck_5000
    * @tc.name      : test interface getCredential callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5000 "
      console.info(tag + "start====");
      let credentialType = '';
      for (let i = 0; i < 1024 + 1; i++) {
        credentialType += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getCredential");
      appAccountManager.getCredential("accountName", credentialType, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_5100
    * @tc.name      : test interface getCredential promise
    * @tc.desc      : 13200003 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5100 "
      console.info(tag + "start====");
      let credentialType = '';
      for (let i = 0; i < 1024; i++) {
        credentialType += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getCredential");
        let data = await appAccountManager.getCredential("accountName", credentialType);
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

    /*
    * @tc.number    : AppAccountErrCodeCheck_5200
    * @tc.name      : test interface getCredential callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5200 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        accountName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getCredential");
      appAccountManager.getCredential(accountName, "credentialType", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_5201
    * @tc.name      : test interface getCredential promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5201 "
      console.info(tag + "start====");
      let credentialType = '';
      for (let i = 0; i < 1024 + 1; i++) {
        credentialType += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getCredential");
        let data = await appAccountManager.getCredential("accountName", credentialType);
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
    * @tc.number    : AppAccountErrCodeCheck_5202
    * @tc.name      : test interface getCredential callback
    * @tc.desc      : 12300003 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5202 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit; i++) {
        accountName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getCredential");
      appAccountManager.getCredential(accountName, "credentialType", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_5300
    * @tc.name      : test interface getCustomData promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5300 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        accountName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getCustomData");
        let data = await appAccountManager.getCustomData(accountName, "key");
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
    * @tc.number    : AppAccountErrCodeCheck_5400
    * @tc.name      : test interface getCustomData callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5400 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit + 1; i++) {
        accountName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getCustomData");
      appAccountManager.getCustomData(accountName, "key", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_5500
    * @tc.name      : test interface getCustomData callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5500 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024; i++) {
        key += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getCustomData");
      appAccountManager.getCustomData("accountName", key, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_5600
    * @tc.name      : test interface getCustomData promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5600 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024; i++) {
        key += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getCustomData");
        let data = await appAccountManager.getCustomData("accountName", key);
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

    /*
    * @tc.number    : AppAccountErrCodeCheck_6600
    * @tc.name      : test interface getCustomData callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5700 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024; i++) {
        key += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start createAccount");
      await appAccountManager.createAccount(name);
      console.info(tag + "start getCustomData");
      appAccountManager.getCustomData(name, key, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12400002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_5800
    * @tc.name      : test interface getCustomData promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5800 "
      console.info(tag + "start====");
      let key = '';
      for (let i = 0; i < 1024; i++) {
        key += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start createAccount");
        await appAccountManager.createAccount(name);
        console.info(tag + "start getCustomData");
        let data = await appAccountManager.getCustomData(name, key);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12400002);
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_5900
    * @tc.name      : test interface on accountChange
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_5900 "
      console.info(tag + "start====");
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start on accountChange");
        appAccountManager.on("accountChange", [], (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
          expect().assertFail();
          done();
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300002);
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_6000
    * @tc.name      : test interface getAuthList promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_6000 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit; i++) {
        accountName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getAuthList");
        let data = await appAccountManager.getAuthList(accountName, "authType");
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

    /*
    * @tc.number    : AppAccountErrCodeCheck_6100
    * @tc.name      : test interface getAuthList callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_6100 "
      console.info(tag + "start====");
      let getAuthList = '';
      for (let i = 0; i < 1024 + 1; i++) {
        getAuthList += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getAuthList");
      appAccountManager.getAuthList("accountName", getAuthList, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_6200
    * @tc.name      : test interface getAuthList promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_6200 "
      console.info(tag + "start====");
      let getAuthList = '';
      for (let i = 0; i < 1024 + 1; i++) {
        getAuthList += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getAuthList");
        let data = await appAccountManager.getAuthList("accountName", getAuthList);
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
    * @tc.number    : AppAccountErrCodeCheck_6300
    * @tc.name      : test interface getAuthList callback
    * @tc.desc      : 12300002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_6300 "
      console.info(tag + "start====");
      let accountName = '';
      for (let i = 0; i < nameLimit; i++) {
        accountName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getAuthList");
      appAccountManager.getAuthList(accountName, "authType", (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_6400
    * @tc.name      : test interface getAuthCallback promise
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_6400 "
      console.info(tag + "start====");
      let sessionId = '';
      for (let i = 0; i < 1024 + 1; i++) {
        sessionId += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getAuthCallback");
        let data = await appAccountManager.getAuthCallback(sessionId);
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
    * @tc.number    : AppAccountErrCodeCheck_6500
    * @tc.name      : test interface getAuthCallback callback
    * @tc.desc      : 13200108 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_6500 "
      console.info(tag + "start====");
      let sessionId = 'i';
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getAuthCallback");
      appAccountManager.getAuthCallback(sessionId, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300108);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_6600
    * @tc.name      : test interface getAuthCallback promise
    * @tc.desc      : 13200108 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_6600 "
      console.info(tag + "start====");
      let sessionId = '';
      for (let i = 0; i < 1024; i++) {
        sessionId += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start getAuthCallback");
        let data = await appAccountManager.getAuthCallback(sessionId);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300108);
        done();
      }
    });

    /*
    * @tc.number    : AppAccountErrCodeCheck_6700
    * @tc.name      : test interface getAuthCallback callback
    * @tc.desc      : 13200002 err code check
    * @tc.level     : Level3
    * @tc.size      : MediumTest
    * @tc.type      : Function
    */
    it('AppAccountErrCodeCheck_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountErrCodeCheck_6700 "
      console.info(tag + "start====");
      let sessionId = '';
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start getAuthCallback");
      appAccountManager.getAuthCallback(sessionId, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });
  });
}