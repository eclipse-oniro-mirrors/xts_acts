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
import account from '@ohos.account.appAccount'
import { describe, afterEach, it, expect, TestType, Size, Level } from '@ohos/hypium'

const name = 'zhangSan'
const owner = 'com.acts.notExist'

export default function AppAccountParamCheck3() {
  describe('AppAccountParamCheck3', () => {

    afterEach(async (done: Function) => {
      try {
        let appAccountManager = account.createAppAccountManager();
        let list = await appAccountManager.getAllAccounts();
        if (list.length !== 0) {
          await appAccountManager.removeAccount(name);
          console.info("====>afterEach removeAccount done");
        }
      } catch (err) {
        console.info("====>afterEach catch err: " + JSON.stringify(err));
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamCheck3_22600
     * @tc.number AppAccountParamCheck3_22600
     * @tc.desc   setAuthTokenVisibility promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_22600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_22600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAuthTokenVisibility('', 'authType', owner, true);
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
     * @tc.name   AppAccountParamCheck3_22700
     * @tc.number AppAccountParamCheck3_22700
     * @tc.desc   setAuthTokenVisibility promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_22700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_22700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAuthTokenVisibility(null, 'authType', owner, true);
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
     * @tc.name   AppAccountParamCheck3_22800
     * @tc.number AppAccountParamCheck3_22800
     * @tc.desc   setAuthTokenVisibility promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_22800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_22800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAuthTokenVisibility(undefined, 'authType', owner, true);
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
     * @tc.name   AppAccountParamCheck3_22900
     * @tc.number AppAccountParamCheck3_22900
     * @tc.desc   setAuthTokenVisibility promise with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_22900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_22900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAuthTokenVisibility(name, '', owner, true);
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
     * @tc.name   AppAccountParamCheck3_23000
     * @tc.number AppAccountParamCheck3_23000
     * @tc.desc   setAuthTokenVisibility promise with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAuthTokenVisibility(name, null, owner, true);
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
     * @tc.name   AppAccountParamCheck3_23100
     * @tc.number AppAccountParamCheck3_23100
     * @tc.desc   setAuthTokenVisibility promise with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAuthTokenVisibility(name, undefined, owner, true);
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
     * @tc.name   AppAccountParamCheck3_23200
     * @tc.number AppAccountParamCheck3_23200
     * @tc.desc   setAuthTokenVisibility promise with empty string bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAuthTokenVisibility(name, 'authType', '', true);
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
     * @tc.name   AppAccountParamCheck3_23300
     * @tc.number AppAccountParamCheck3_23300
     * @tc.desc   setAuthTokenVisibility promise with null bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAuthTokenVisibility(name, 'authType', null, true);
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
     * @tc.name   AppAccountParamCheck3_23400
     * @tc.number AppAccountParamCheck3_23400
     * @tc.desc   setAuthTokenVisibility promise with undefined bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAuthTokenVisibility(name, 'authType', undefined, true);
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
     * @tc.name   AppAccountParamCheck3_23500
     * @tc.number AppAccountParamCheck3_23500
     * @tc.desc   checkOAuthTokenVisibility callback with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.checkOAuthTokenVisibility('', 'authType', owner, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).not().assertUndefined();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck3_23600
     * @tc.number AppAccountParamCheck3_23600
     * @tc.desc   checkOAuthTokenVisibility callback with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.checkOAuthTokenVisibility(null, 'authType', owner, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_23700
     * @tc.number AppAccountParamCheck3_23700
     * @tc.desc   checkOAuthTokenVisibility callback with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.checkOAuthTokenVisibility(undefined, 'authType', owner, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_23800
     * @tc.number AppAccountParamCheck3_23800
     * @tc.desc   checkOAuthTokenVisibility callback with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.checkOAuthTokenVisibility(name, '', owner, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).not().assertUndefined();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck3_23900
     * @tc.number AppAccountParamCheck3_23900
     * @tc.desc   checkOAuthTokenVisibility callback with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_23900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_23900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.checkOAuthTokenVisibility(name, null, owner, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_24000
     * @tc.number AppAccountParamCheck3_24000
     * @tc.desc   checkOAuthTokenVisibility callback with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.checkOAuthTokenVisibility(name, undefined, owner, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_24100
     * @tc.number AppAccountParamCheck3_24100
     * @tc.desc   checkOAuthTokenVisibility callback with empty string bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.checkOAuthTokenVisibility(name, 'authType', '', (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).not().assertUndefined();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck3_24200
     * @tc.number AppAccountParamCheck3_24200
     * @tc.desc   checkOAuthTokenVisibility callback with null bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.checkOAuthTokenVisibility(name, 'authType', null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_24300
     * @tc.number AppAccountParamCheck3_24300
     * @tc.desc   checkOAuthTokenVisibility callback with undefined bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.checkOAuthTokenVisibility(name, 'authType', undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_24400
     * @tc.number AppAccountParamCheck3_24400
     * @tc.desc   checkOAuthTokenVisibility promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkOAuthTokenVisibility('', 'authType', owner);
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
     * @tc.name   AppAccountParamCheck3_24500
     * @tc.number AppAccountParamCheck3_24500
     * @tc.desc   checkOAuthTokenVisibility promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkOAuthTokenVisibility(null, 'authType', owner);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_24600
     * @tc.number AppAccountParamCheck3_24600
     * @tc.desc   checkOAuthTokenVisibility promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkOAuthTokenVisibility(undefined, 'authType', owner);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_24700
     * @tc.number AppAccountParamCheck3_24700
     * @tc.desc   checkOAuthTokenVisibility promise with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkOAuthTokenVisibility(name, '', owner);
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
     * @tc.name   AppAccountParamCheck3_24800
     * @tc.number AppAccountParamCheck3_24800
     * @tc.desc   checkOAuthTokenVisibility promise with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkOAuthTokenVisibility(name, null, owner);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_24900
     * @tc.number AppAccountParamCheck3_24900
     * @tc.desc   checkOAuthTokenVisibility promise with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_24900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_24900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkOAuthTokenVisibility(name, undefined, owner);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_25000
     * @tc.number AppAccountParamCheck3_25000
     * @tc.desc   checkOAuthTokenVisibility promise with empty string bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkOAuthTokenVisibility(name, 'authType', '');
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
     * @tc.name   AppAccountParamCheck3_25100
     * @tc.number AppAccountParamCheck3_25100
     * @tc.desc   checkOAuthTokenVisibility promise with null bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkOAuthTokenVisibility(name, 'authType', null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_25200
     * @tc.number AppAccountParamCheck3_25200
     * @tc.desc   checkOAuthTokenVisibility promise with undefined bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkOAuthTokenVisibility(name, 'authType', undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_25300
     * @tc.number AppAccountParamCheck3_25300
     * @tc.desc   checkAuthTokenVisibility promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAuthTokenVisibility('', 'authType', owner);
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
     * @tc.name   AppAccountParamCheck3_25400
     * @tc.number AppAccountParamCheck3_25400
     * @tc.desc   checkAuthTokenVisibility promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAuthTokenVisibility(null, 'authType', owner);
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
     * @tc.name   AppAccountParamCheck3_25500
     * @tc.number AppAccountParamCheck3_25500
     * @tc.desc   checkAuthTokenVisibility promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAuthTokenVisibility(undefined, 'authType', owner);
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
     * @tc.name   AppAccountParamCheck3_25600
     * @tc.number AppAccountParamCheck3_25600
     * @tc.desc   checkAuthTokenVisibility promise with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAuthTokenVisibility(name, '', owner);
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
     * @tc.name   AppAccountParamCheck3_25700
     * @tc.number AppAccountParamCheck3_25700
     * @tc.desc   checkAuthTokenVisibility promise with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAuthTokenVisibility(name, null, owner);
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
     * @tc.name   AppAccountParamCheck3_25800
     * @tc.number AppAccountParamCheck3_25800
     * @tc.desc   checkAuthTokenVisibility promise with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAuthTokenVisibility(name, undefined, owner);
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
     * @tc.name   AppAccountParamCheck3_25900
     * @tc.number AppAccountParamCheck3_25900
     * @tc.desc   checkAuthTokenVisibility promise with empty string bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_25900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_25900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAuthTokenVisibility(name, 'authType', '');
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
     * @tc.name   AppAccountParamCheck3_26000
     * @tc.number AppAccountParamCheck3_26000
     * @tc.desc   checkAuthTokenVisibility promise with null bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAuthTokenVisibility(name, 'authType', null);
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
     * @tc.name   AppAccountParamCheck3_26100
     * @tc.number AppAccountParamCheck3_26100
     * @tc.desc   checkAuthTokenVisibility promise with undefined bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAuthTokenVisibility(name, 'authType', undefined);
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
     * @tc.name   AppAccountParamCheck3_26200
     * @tc.number AppAccountParamCheck3_26200
     * @tc.desc   getAllOAuthTokens callback with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAllOAuthTokens('', owner, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).not().assertUndefined();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck3_26300
     * @tc.number AppAccountParamCheck3_26300
     * @tc.desc   getAllOAuthTokens callback with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAllOAuthTokens(null, owner, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_26400
     * @tc.number AppAccountParamCheck3_26400
     * @tc.desc   getAllOAuthTokens callback with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAllOAuthTokens(undefined, owner, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_26500
     * @tc.number AppAccountParamCheck3_26500
     * @tc.desc   getAllOAuthTokens callback with empty string owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAllOAuthTokens(name, '', (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).not().assertUndefined();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck3_26600
     * @tc.number AppAccountParamCheck3_26600
     * @tc.desc   getAllOAuthTokens callback with null owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAllOAuthTokens(name, null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_26700
     * @tc.number AppAccountParamCheck3_26700
     * @tc.desc   getAllOAuthTokens callback with undefined owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAllOAuthTokens(name, undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_26800
     * @tc.number AppAccountParamCheck3_26800
     * @tc.desc   getAllOAuthTokens promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllOAuthTokens('', owner);
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
     * @tc.name   AppAccountParamCheck3_26900
     * @tc.number AppAccountParamCheck3_26900
     * @tc.desc   getAllOAuthTokens promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_26900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_26900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllOAuthTokens(null, owner);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_27000
     * @tc.number AppAccountParamCheck3_27000
     * @tc.desc   getAllOAuthTokens promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllOAuthTokens(undefined, owner);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_27100
     * @tc.number AppAccountParamCheck3_27100
     * @tc.desc   getAllOAuthTokens promise with empty string owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllOAuthTokens(name, '');
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
     * @tc.name   AppAccountParamCheck3_27200
     * @tc.number AppAccountParamCheck3_27200
     * @tc.desc   getAllOAuthTokens promise with null owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllOAuthTokens(name, null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_27300
     * @tc.number AppAccountParamCheck3_27300
     * @tc.desc   getAllOAuthTokens promise with undefined owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllOAuthTokens(name, undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_27400
     * @tc.number AppAccountParamCheck3_27400
     * @tc.desc   getAllAuthTokens promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllAuthTokens('', owner);
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
     * @tc.name   AppAccountParamCheck3_27500
     * @tc.number AppAccountParamCheck3_27500
     * @tc.desc   getAllAuthTokens promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllAuthTokens(null, owner);
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
     * @tc.name   AppAccountParamCheck3_27600
     * @tc.number AppAccountParamCheck3_27600
     * @tc.desc   getAllAuthTokens promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllAuthTokens(undefined, owner);
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
     * @tc.name   AppAccountParamCheck3_27700
     * @tc.number AppAccountParamCheck3_27700
     * @tc.desc   getAllAuthTokens promise with empty string owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllAuthTokens(name, '');
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
     * @tc.name   AppAccountParamCheck3_27800
     * @tc.number AppAccountParamCheck3_27800
     * @tc.desc   getAllAuthTokens promise with null owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllAuthTokens(name, null);
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
     * @tc.name   AppAccountParamCheck3_27900
     * @tc.number AppAccountParamCheck3_27900
     * @tc.desc   getAllAuthTokens promise with undefined owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_27900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_27900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAllAuthTokens(name, undefined);
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
     * @tc.name   AppAccountParamCheck3_28000
     * @tc.number AppAccountParamCheck3_28000
     * @tc.desc   getOAuthList callback with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getOAuthList('', 'authType', (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).not().assertUndefined();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck3_28100
     * @tc.number AppAccountParamCheck3_28100
     * @tc.desc   getOAuthList callback with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthList(null, 'authType', (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_28200
     * @tc.number AppAccountParamCheck3_28200
     * @tc.desc   getOAuthList callback with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthList(undefined, 'authType', (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_28300
     * @tc.number AppAccountParamCheck3_28300
     * @tc.desc   getOAuthList callback with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getOAuthList(name, '', (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        try {
          expect(err.code).not().assertUndefined();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck3_28400
     * @tc.number AppAccountParamCheck3_28400
     * @tc.desc   getOAuthList callback with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthList(name, null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_28500
     * @tc.number AppAccountParamCheck3_28500
     * @tc.desc   getOAuthList callback with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthList(name, undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck3_28600
     * @tc.number AppAccountParamCheck3_28600
     * @tc.desc   getOAuthList promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthList('', 'authType');
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
     * @tc.name   AppAccountParamCheck3_28700
     * @tc.number AppAccountParamCheck3_28700
     * @tc.desc   getOAuthList promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthList(null, 'authType');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_28800
     * @tc.number AppAccountParamCheck3_28800
     * @tc.desc   getOAuthList promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthList(undefined, 'authType');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_28900
     * @tc.number AppAccountParamCheck3_28900
     * @tc.desc   getOAuthList promise with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_28900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_28900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthList(name, '');
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
     * @tc.name   AppAccountParamCheck3_29000
     * @tc.number AppAccountParamCheck3_29000
     * @tc.desc   getOAuthList promise with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthList(name, null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_29100
     * @tc.number AppAccountParamCheck3_29100
     * @tc.desc   getOAuthList promise with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthList(name, undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_29200
     * @tc.number AppAccountParamCheck3_29200
     * @tc.desc   on with null type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.on(null, [owner], (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
        });
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
     * @tc.name   AppAccountParamCheck3_29300
     * @tc.number AppAccountParamCheck3_29300
     * @tc.desc   on with undefined type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.on(undefined, [owner], (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
        });
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
     * @tc.name   AppAccountParamCheck3_29400
     * @tc.number AppAccountParamCheck3_29400
     * @tc.desc   on with null owners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.on('change', null, (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
        });
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_29500
     * @tc.number AppAccountParamCheck3_29500
     * @tc.desc   on with undefined owners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.on('change', undefined, (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
        });
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_29600
     * @tc.number AppAccountParamCheck3_29600
     * @tc.desc   on with empty array owners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.on('change', [], (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
        });
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck3_29700
     * @tc.number AppAccountParamCheck3_29700
     * @tc.desc   on accountChange with null owners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.on('accountChange', null, (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
        });
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
     * @tc.name   AppAccountParamCheck3_29800
     * @tc.number AppAccountParamCheck3_29800
     * @tc.desc   on accountChange with undefined owners.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.on('accountChange', undefined, (data) => {
          console.info(tag + "data: " + JSON.stringify(data));
        });
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
     * @tc.name   AppAccountParamCheck3_29900
     * @tc.number AppAccountParamCheck3_29900
     * @tc.desc   off change with null type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_29900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_29900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.off(null);
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
     * @tc.name   AppAccountParamCheck3_30000
     * @tc.number AppAccountParamCheck3_30000
     * @tc.desc   off change with undefined type.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck3_30000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck3_30000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.off(undefined);
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
