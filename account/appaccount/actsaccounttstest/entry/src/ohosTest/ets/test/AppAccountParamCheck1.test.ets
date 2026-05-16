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

export default function AppAccountParamCheck1() {
  describe('AppAccountParamCheck1', () => {

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
     * @tc.name   AppAccountParamCheck1_7600
     * @tc.number AppAccountParamCheck1_7600
     * @tc.desc   setAccountCredential with null name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_7600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountCredential(null, 'PIN', 'credential', (err) => {
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
     * @tc.name   AppAccountParamCheck1_7700
     * @tc.number AppAccountParamCheck1_7700
     * @tc.desc   setAccountCredential with undefined name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_7700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountCredential(undefined, 'PIN', 'credential', (err) => {
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
     * @tc.name   AppAccountParamCheck1_7800
     * @tc.number AppAccountParamCheck1_7800
     * @tc.desc   setAccountCredential with null credentialType callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_7800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountCredential(name, null, 'credential', (err) => {
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
     * @tc.name   AppAccountParamCheck1_7900
     * @tc.number AppAccountParamCheck1_7900
     * @tc.desc   setAccountCredential with undefined credentialType callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_7900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountCredential(name, undefined, 'credential', (err) => {
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
     * @tc.name   AppAccountParamCheck1_8000
     * @tc.number AppAccountParamCheck1_8000
     * @tc.desc   setAccountCredential with null credential callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountCredential(name, 'PIN', null, (err) => {
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
     * @tc.name   AppAccountParamCheck1_8100
     * @tc.number AppAccountParamCheck1_8100
     * @tc.desc   setAccountCredential with undefined credential callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountCredential(name, 'PIN', undefined, (err) => {
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
     * @tc.name   AppAccountParamCheck1_8200
     * @tc.number AppAccountParamCheck1_8200
     * @tc.desc   setAccountCredential promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountCredential(null, 'PIN', 'credential');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_8300
     * @tc.number AppAccountParamCheck1_8300
     * @tc.desc   setAccountCredential promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountCredential(undefined, 'PIN', 'credential');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_8400
     * @tc.number AppAccountParamCheck1_8400
     * @tc.desc   setAccountCredential promise with null credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountCredential(name, null, 'credential');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_8500
     * @tc.number AppAccountParamCheck1_8500
     * @tc.desc   setAccountCredential promise with undefined credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountCredential(name, undefined, 'credential');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_8600
     * @tc.number AppAccountParamCheck1_8600
     * @tc.desc   setAccountCredential promise with null credential.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountCredential(name, 'PIN', null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_8700
     * @tc.number AppAccountParamCheck1_8700
     * @tc.desc   setAccountCredential promise with undefined credential.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountCredential(name, 'PIN', undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_8800
     * @tc.number AppAccountParamCheck1_8800
     * @tc.desc   setAccountExtraInfo with null name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountExtraInfo(null, 'extraInfo', (err) => {
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
     * @tc.name   AppAccountParamCheck1_8900
     * @tc.number AppAccountParamCheck1_8900
     * @tc.desc   setAccountExtraInfo with undefined name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_8900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountExtraInfo(undefined, 'extraInfo', (err) => {
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
     * @tc.name   AppAccountParamCheck1_9000
     * @tc.number AppAccountParamCheck1_9000
     * @tc.desc   setAccountExtraInfo with null extraInfo callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountExtraInfo(name, null, (err) => {
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
     * @tc.name   AppAccountParamCheck1_9100
     * @tc.number AppAccountParamCheck1_9100
     * @tc.desc   setAccountExtraInfo with undefined extraInfo callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAccountExtraInfo(name, undefined, (err) => {
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
     * @tc.name   AppAccountParamCheck1_9200
     * @tc.number AppAccountParamCheck1_9200
     * @tc.desc   setAccountExtraInfo promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountExtraInfo(null, 'extraInfo');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_9300
     * @tc.number AppAccountParamCheck1_9300
     * @tc.desc   setAccountExtraInfo promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountExtraInfo(undefined, 'extraInfo');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_9400
     * @tc.number AppAccountParamCheck1_9400
     * @tc.desc   setAccountExtraInfo promise with null extraInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountExtraInfo(name, null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_9500
     * @tc.number AppAccountParamCheck1_9500
     * @tc.desc   setAccountExtraInfo promise with undefined extraInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAccountExtraInfo(name, undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_9600
     * @tc.number AppAccountParamCheck1_9600
     * @tc.desc   setAppAccountSyncEnable with null name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAppAccountSyncEnable(null, true, (err) => {
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
     * @tc.name   AppAccountParamCheck1_9700
     * @tc.number AppAccountParamCheck1_9700
     * @tc.desc   setAppAccountSyncEnable with undefined name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAppAccountSyncEnable(undefined, true, (err) => {
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
     * @tc.name   AppAccountParamCheck1_9800
     * @tc.number AppAccountParamCheck1_9800
     * @tc.desc   setAppAccountSyncEnable promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAppAccountSyncEnable(null, true);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_9900
     * @tc.number AppAccountParamCheck1_9900
     * @tc.desc   setAppAccountSyncEnable promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_9900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAppAccountSyncEnable(undefined, true);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_10000
     * @tc.number AppAccountParamCheck1_10000
     * @tc.desc   setAssociatedData with null name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAssociatedData(null, 'key', 'value', (err) => {
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
     * @tc.name   AppAccountParamCheck1_10100
     * @tc.number AppAccountParamCheck1_10100
     * @tc.desc   setAssociatedData with undefined name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAssociatedData(undefined, 'key', 'value', (err) => {
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
     * @tc.name   AppAccountParamCheck1_10200
     * @tc.number AppAccountParamCheck1_10200
     * @tc.desc   setAssociatedData with null key callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAssociatedData(name, null, 'value', (err) => {
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
     * @tc.name   AppAccountParamCheck1_10300
     * @tc.number AppAccountParamCheck1_10300
     * @tc.desc   setAssociatedData with undefined key callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAssociatedData(name, undefined, 'value', (err) => {
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
     * @tc.name   AppAccountParamCheck1_10400
     * @tc.number AppAccountParamCheck1_10400
     * @tc.desc   setAssociatedData with null value callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAssociatedData(name, 'key', null, (err) => {
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
     * @tc.name   AppAccountParamCheck1_10500
     * @tc.number AppAccountParamCheck1_10500
     * @tc.desc   setAssociatedData with undefined value callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAssociatedData(name, 'key', undefined, (err) => {
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
     * @tc.name   AppAccountParamCheck1_10600
     * @tc.number AppAccountParamCheck1_10600
     * @tc.desc   setAssociatedData promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAssociatedData(null, 'key', 'value');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_10700
     * @tc.number AppAccountParamCheck1_10700
     * @tc.desc   setAssociatedData promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAssociatedData(undefined, 'key', 'value');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_10800
     * @tc.number AppAccountParamCheck1_10800
     * @tc.desc   setAssociatedData promise with null key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAssociatedData(name, null, 'value');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_10900
     * @tc.number AppAccountParamCheck1_10900
     * @tc.desc   setAssociatedData promise with undefined key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_10900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAssociatedData(name, undefined, 'value');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_11000
     * @tc.number AppAccountParamCheck1_11000
     * @tc.desc   setAssociatedData promise with null value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAssociatedData(name, 'key', null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_11100
     * @tc.number AppAccountParamCheck1_11100
     * @tc.desc   setAssociatedData promise with undefined value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setAssociatedData(name, 'key', undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_11200
     * @tc.number AppAccountParamCheck1_11200
     * @tc.desc   getAccountCredential with empty string name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAccountCredential('', 'PIN', (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_11300
     * @tc.number AppAccountParamCheck1_11300
     * @tc.desc   getAccountCredential with null name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAccountCredential(null, 'PIN', (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_11400
     * @tc.number AppAccountParamCheck1_11400
     * @tc.desc   getAccountCredential with undefined name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAccountCredential(undefined, 'PIN', (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_11500
     * @tc.number AppAccountParamCheck1_11500
     * @tc.desc   getAccountCredential with empty string credentialType callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAccountCredential(name, '', (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_11600
     * @tc.number AppAccountParamCheck1_11600
     * @tc.desc   getAccountCredential with null credentialType callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAccountCredential(name, null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_11700
     * @tc.number AppAccountParamCheck1_11700
     * @tc.desc   getAccountCredential with undefined credentialType callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAccountCredential(name, undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_11800
     * @tc.number AppAccountParamCheck1_11800
     * @tc.desc   getAccountCredential promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountCredential('', 'PIN');
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
     * @tc.name   AppAccountParamCheck1_11900
     * @tc.number AppAccountParamCheck1_11900
     * @tc.desc   getAccountCredential promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_11900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountCredential(null, 'PIN');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_12000
     * @tc.number AppAccountParamCheck1_12000
     * @tc.desc   getAccountCredential promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountCredential(undefined, 'PIN');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_12100
     * @tc.number AppAccountParamCheck1_12100
     * @tc.desc   getAccountCredential promise with empty string credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountCredential(name, '');
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
     * @tc.name   AppAccountParamCheck1_12200
     * @tc.number AppAccountParamCheck1_12200
     * @tc.desc   getAccountCredential promise with null credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountCredential(name, null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_12300
     * @tc.number AppAccountParamCheck1_12300
     * @tc.desc   getAccountCredential promise with undefined credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountCredential(name, undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_12400
     * @tc.number AppAccountParamCheck1_12400
     * @tc.desc   getCredential promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getCredential('', 'PIN');
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
     * @tc.name   AppAccountParamCheck1_12500
     * @tc.number AppAccountParamCheck1_12500
     * @tc.desc   getCredential promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getCredential(null, 'PIN');
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
     * @tc.name   AppAccountParamCheck1_12600
     * @tc.number AppAccountParamCheck1_12600
     * @tc.desc   getCredential promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getCredential(undefined, 'PIN');
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
     * @tc.name   AppAccountParamCheck1_12700
     * @tc.number AppAccountParamCheck1_12700
     * @tc.desc   getCredential promise with empty string credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getCredential(name, '');
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
     * @tc.name   AppAccountParamCheck1_12800
     * @tc.number AppAccountParamCheck1_12800
     * @tc.desc   getCredential promise with null credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getCredential(name, null);
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
     * @tc.name   AppAccountParamCheck1_12900
     * @tc.number AppAccountParamCheck1_12900
     * @tc.desc   getCredential promise with undefined credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_12900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getCredential(name, undefined);
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
     * @tc.name   AppAccountParamCheck1_13000
     * @tc.number AppAccountParamCheck1_13000
     * @tc.desc   getAccountExtraInfo with empty string name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAccountExtraInfo('', (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_13100
     * @tc.number AppAccountParamCheck1_13100
     * @tc.desc   getAccountExtraInfo with null name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAccountExtraInfo(null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_13200
     * @tc.number AppAccountParamCheck1_13200
     * @tc.desc   getAccountExtraInfo with undefined name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAccountExtraInfo(undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_13300
     * @tc.number AppAccountParamCheck1_13300
     * @tc.desc   getAccountExtraInfo promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountExtraInfo('');
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
     * @tc.name   AppAccountParamCheck1_13400
     * @tc.number AppAccountParamCheck1_13400
     * @tc.desc   getAccountExtraInfo promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountExtraInfo(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_13500
     * @tc.number AppAccountParamCheck1_13500
     * @tc.desc   getAccountExtraInfo promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountExtraInfo(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_13600
     * @tc.number AppAccountParamCheck1_13600
     * @tc.desc   getAssociatedData with empty string name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAssociatedData('', 'key', (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_13700
     * @tc.number AppAccountParamCheck1_13700
     * @tc.desc   getAssociatedData with null name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAssociatedData(null, 'key', (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_13800
     * @tc.number AppAccountParamCheck1_13800
     * @tc.desc   getAssociatedData with undefined name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAssociatedData(undefined, 'key', (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_13900
     * @tc.number AppAccountParamCheck1_13900
     * @tc.desc   getAssociatedData with empty string key callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_13900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_13900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAssociatedData(name, '', (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_14000
     * @tc.number AppAccountParamCheck1_14000
     * @tc.desc   getAssociatedData with null key callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_14000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_14000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAssociatedData(name, null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_14100
     * @tc.number AppAccountParamCheck1_14100
     * @tc.desc   getAssociatedData with undefined key callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_14100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_14100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAssociatedData(name, undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck1_14200
     * @tc.number AppAccountParamCheck1_14200
     * @tc.desc   getAssociatedData promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_14200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_14200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAssociatedData('', 'key');
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
     * @tc.name   AppAccountParamCheck1_14300
     * @tc.number AppAccountParamCheck1_14300
     * @tc.desc   getAssociatedData promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_14300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_14300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAssociatedData(null, 'key');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_14400
     * @tc.number AppAccountParamCheck1_14400
     * @tc.desc   getAssociatedData promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_14400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_14400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAssociatedData(undefined, 'key');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_14500
     * @tc.number AppAccountParamCheck1_14500
     * @tc.desc   getAssociatedData promise with empty string key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_14500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_14500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAssociatedData(name, '');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_14600
     * @tc.number AppAccountParamCheck1_14600
     * @tc.desc   getAssociatedData promise with null key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_14600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_14600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAssociatedData(name, null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck1_14700
     * @tc.number AppAccountParamCheck1_14700
     * @tc.desc   getAssociatedData promise with undefined key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck1_14700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck1_14700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAssociatedData(name, undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });
  });
}
