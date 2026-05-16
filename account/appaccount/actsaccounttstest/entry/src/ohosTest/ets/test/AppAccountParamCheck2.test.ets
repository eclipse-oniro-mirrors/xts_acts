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

export default function AppAccountParamCheck2() {
  describe('AppAccountParamCheck2', () => {

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
     * @tc.name   AppAccountParamCheck2_14800
     * @tc.number AppAccountParamCheck2_14800
     * @tc.desc   getOAuthToken with empty string name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_14800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_14800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getOAuthToken('', owner, 'getSocialData', (err, data) => {
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
     * @tc.name   AppAccountParamCheck2_14900
     * @tc.number AppAccountParamCheck2_14900
     * @tc.desc   getOAuthToken with null name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_14900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_14900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthToken(null, owner, 'getSocialData', (err, data) => {
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
     * @tc.name   AppAccountParamCheck2_15000
     * @tc.number AppAccountParamCheck2_15000
     * @tc.desc   getOAuthToken with undefined name callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthToken(undefined, owner, 'getSocialData', (err, data) => {
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
     * @tc.name   AppAccountParamCheck2_15100
     * @tc.number AppAccountParamCheck2_15100
     * @tc.desc   getOAuthToken with empty string owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getOAuthToken(name, '', 'getSocialData', (err, data) => {
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
     * @tc.name   AppAccountParamCheck2_15200
     * @tc.number AppAccountParamCheck2_15200
     * @tc.desc   getOAuthToken with null owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthToken(name, null, 'getSocialData', (err, data) => {
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
     * @tc.name   AppAccountParamCheck2_15300
     * @tc.number AppAccountParamCheck2_15300
     * @tc.desc   getOAuthToken with undefined owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthToken(name, undefined, 'getSocialData', (err, data) => {
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
     * @tc.name   AppAccountParamCheck2_15400
     * @tc.number AppAccountParamCheck2_15400
     * @tc.desc   getOAuthToken with empty string authType callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getOAuthToken(name, owner, '', (err, data) => {
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
     * @tc.name   AppAccountParamCheck2_15500
     * @tc.number AppAccountParamCheck2_15500
     * @tc.desc   getOAuthToken with null authType callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthToken(name, owner, null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck2_15600
     * @tc.number AppAccountParamCheck2_15600
     * @tc.desc   getOAuthToken with undefined authType callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getOAuthToken(name, owner, undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck2_15700
     * @tc.number AppAccountParamCheck2_15700
     * @tc.desc   getOAuthToken promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthToken('', owner, 'getSocialData');
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
     * @tc.name   AppAccountParamCheck2_15800
     * @tc.number AppAccountParamCheck2_15800
     * @tc.desc   getOAuthToken promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthToken(null, owner, 'getSocialData');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_15900
     * @tc.number AppAccountParamCheck2_15900
     * @tc.desc   getOAuthToken promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_15900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_15900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthToken(undefined, owner, 'getSocialData');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_16000
     * @tc.number AppAccountParamCheck2_16000
     * @tc.desc   getOAuthToken promise with empty string owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthToken(name, '', 'getSocialData');
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
     * @tc.name   AppAccountParamCheck2_16100
     * @tc.number AppAccountParamCheck2_16100
     * @tc.desc   getOAuthToken promise with null owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthToken(name, null, 'getSocialData');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_16200
     * @tc.number AppAccountParamCheck2_16200
     * @tc.desc   getOAuthToken promise with undefined owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthToken(name, undefined, 'getSocialData');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_16300
     * @tc.number AppAccountParamCheck2_16300
     * @tc.desc   getOAuthToken promise with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthToken(name, owner, '');
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
     * @tc.name   AppAccountParamCheck2_16400
     * @tc.number AppAccountParamCheck2_16400
     * @tc.desc   getOAuthToken promise with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthToken(name, owner, null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_16500
     * @tc.number AppAccountParamCheck2_16500
     * @tc.desc   getOAuthToken promise with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getOAuthToken(name, owner, undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_16600
     * @tc.number AppAccountParamCheck2_16600
     * @tc.desc   setOAuthToken callback with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.setOAuthToken('', 'authType', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_16700
     * @tc.number AppAccountParamCheck2_16700
     * @tc.desc   setOAuthToken callback with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthToken(null, 'authType', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_16800
     * @tc.number AppAccountParamCheck2_16800
     * @tc.desc   setOAuthToken callback with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthToken(undefined, 'authType', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_16900
     * @tc.number AppAccountParamCheck2_16900
     * @tc.desc   setOAuthToken callback with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_16900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_16900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.setOAuthToken(name, '', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_17000
     * @tc.number AppAccountParamCheck2_17000
     * @tc.desc   setOAuthToken callback with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthToken(name, null, 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_17100
     * @tc.number AppAccountParamCheck2_17100
     * @tc.desc   setOAuthToken callback with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthToken(name, undefined, 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_17200
     * @tc.number AppAccountParamCheck2_17200
     * @tc.desc   setOAuthToken callback with empty string token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.setOAuthToken(name, 'authType', '', (err) => {
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
     * @tc.name   AppAccountParamCheck2_17300
     * @tc.number AppAccountParamCheck2_17300
     * @tc.desc   setOAuthToken callback with null token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthToken(name, 'authType', null, (err) => {
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
     * @tc.name   AppAccountParamCheck2_17400
     * @tc.number AppAccountParamCheck2_17400
     * @tc.desc   setOAuthToken callback with undefined token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthToken(name, 'authType', undefined, (err) => {
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
     * @tc.name   AppAccountParamCheck2_17500
     * @tc.number AppAccountParamCheck2_17500
     * @tc.desc   setOAuthToken promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthToken('', 'authType', 'token');
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
     * @tc.name   AppAccountParamCheck2_17600
     * @tc.number AppAccountParamCheck2_17600
     * @tc.desc   setOAuthToken promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthToken(null, 'authType', 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_17700
     * @tc.number AppAccountParamCheck2_17700
     * @tc.desc   setOAuthToken promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthToken(undefined, 'authType', 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_17800
     * @tc.number AppAccountParamCheck2_17800
     * @tc.desc   setOAuthToken promise with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthToken(name, '', 'token');
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
     * @tc.name   AppAccountParamCheck2_17900
     * @tc.number AppAccountParamCheck2_17900
     * @tc.desc   setOAuthToken promise with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_17900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_17900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthToken(name, null, 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_18000
     * @tc.number AppAccountParamCheck2_18000
     * @tc.desc   setOAuthToken promise with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthToken(name, undefined, 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_18100
     * @tc.number AppAccountParamCheck2_18100
     * @tc.desc   setOAuthToken promise with empty string token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthToken(name, 'authType', '');
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
     * @tc.name   AppAccountParamCheck2_18200
     * @tc.number AppAccountParamCheck2_18200
     * @tc.desc   setOAuthToken promise with null token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthToken(name, 'authType', null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_18300
     * @tc.number AppAccountParamCheck2_18300
     * @tc.desc   setOAuthToken promise with undefined token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthToken(name, 'authType', undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_18400
     * @tc.number AppAccountParamCheck2_18400
     * @tc.desc   deleteOAuthToken callback with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.deleteOAuthToken('', owner, 'authType', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_18500
     * @tc.number AppAccountParamCheck2_18500
     * @tc.desc   deleteOAuthToken callback with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.deleteOAuthToken(null, owner, 'authType', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_18600
     * @tc.number AppAccountParamCheck2_18600
     * @tc.desc   deleteOAuthToken callback with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.deleteOAuthToken(undefined, owner, 'authType', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_18700
     * @tc.number AppAccountParamCheck2_18700
     * @tc.desc   deleteOAuthToken callback with empty string owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.deleteOAuthToken(name, '', 'authType', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_18800
     * @tc.number AppAccountParamCheck2_18800
     * @tc.desc   deleteOAuthToken callback with null owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.deleteOAuthToken(name, null, 'authType', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_18900
     * @tc.number AppAccountParamCheck2_18900
     * @tc.desc   deleteOAuthToken callback with undefined owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_18900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_18900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.deleteOAuthToken(name, undefined, 'authType', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_19000
     * @tc.number AppAccountParamCheck2_19000
     * @tc.desc   deleteOAuthToken callback with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.deleteOAuthToken(name, owner, '', 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_19100
     * @tc.number AppAccountParamCheck2_19100
     * @tc.desc   deleteOAuthToken callback with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.deleteOAuthToken(name, owner, null, 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_19200
     * @tc.number AppAccountParamCheck2_19200
     * @tc.desc   deleteOAuthToken callback with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.deleteOAuthToken(name, owner, undefined, 'token', (err) => {
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
     * @tc.name   AppAccountParamCheck2_19300
     * @tc.number AppAccountParamCheck2_19300
     * @tc.desc   deleteOAuthToken callback with empty string token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.deleteOAuthToken(name, owner, 'authType', '', (err) => {
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
     * @tc.name   AppAccountParamCheck2_19400
     * @tc.number AppAccountParamCheck2_19400
     * @tc.desc   deleteOAuthToken callback with null token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.deleteOAuthToken(name, owner, 'authType', null, (err) => {
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
     * @tc.name   AppAccountParamCheck2_19500
     * @tc.number AppAccountParamCheck2_19500
     * @tc.desc   deleteOAuthToken callback with undefined token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.deleteOAuthToken(name, owner, 'authType', undefined, (err) => {
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
     * @tc.name   AppAccountParamCheck2_19600
     * @tc.number AppAccountParamCheck2_19600
     * @tc.desc   deleteOAuthToken promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken('', owner, 'authType', 'token');
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
     * @tc.name   AppAccountParamCheck2_19700
     * @tc.number AppAccountParamCheck2_19700
     * @tc.desc   deleteOAuthToken promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(null, owner, 'authType', 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_19800
     * @tc.number AppAccountParamCheck2_19800
     * @tc.desc   deleteOAuthToken promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(undefined, owner, 'authType', 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_19900
     * @tc.number AppAccountParamCheck2_19900
     * @tc.desc   deleteOAuthToken promise with empty string owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_19900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_19900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(name, '', 'authType', 'token');
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
     * @tc.name   AppAccountParamCheck2_20000
     * @tc.number AppAccountParamCheck2_20000
     * @tc.desc   deleteOAuthToken promise with null owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(name, null, 'authType', 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_20100
     * @tc.number AppAccountParamCheck2_20100
     * @tc.desc   deleteOAuthToken promise with undefined owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(name, undefined, 'authType', 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_20200
     * @tc.number AppAccountParamCheck2_20200
     * @tc.desc   deleteOAuthToken promise with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(name, owner, '', 'token');
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
     * @tc.name   AppAccountParamCheck2_20300
     * @tc.number AppAccountParamCheck2_20300
     * @tc.desc   deleteOAuthToken promise with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(name, owner, null, 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_20400
     * @tc.number AppAccountParamCheck2_20400
     * @tc.desc   deleteOAuthToken promise with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(name, owner, undefined, 'token');
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_20500
     * @tc.number AppAccountParamCheck2_20500
     * @tc.desc   deleteOAuthToken promise with empty string token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(name, owner, 'authType', '');
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
     * @tc.name   AppAccountParamCheck2_20600
     * @tc.number AppAccountParamCheck2_20600
     * @tc.desc   deleteOAuthToken promise with null token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(name, owner, 'authType', null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_20700
     * @tc.number AppAccountParamCheck2_20700
     * @tc.desc   deleteOAuthToken promise with undefined token.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteOAuthToken(name, owner, 'authType', undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_20800
     * @tc.number AppAccountParamCheck2_20800
     * @tc.desc   setOAuthTokenVisibility callback with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.setOAuthTokenVisibility('', 'authType', owner, true, (err) => {
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
     * @tc.name   AppAccountParamCheck2_20900
     * @tc.number AppAccountParamCheck2_20900
     * @tc.desc   setOAuthTokenVisibility callback with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_20900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_20900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthTokenVisibility(null, 'authType', owner, true, (err) => {
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
     * @tc.name   AppAccountParamCheck2_21000
     * @tc.number AppAccountParamCheck2_21000
     * @tc.desc   setOAuthTokenVisibility callback with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthTokenVisibility(undefined, 'authType', owner, true, (err) => {
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
     * @tc.name   AppAccountParamCheck2_21100
     * @tc.number AppAccountParamCheck2_21100
     * @tc.desc   setOAuthTokenVisibility callback with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.setOAuthTokenVisibility(name, '', owner, true, (err) => {
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
     * @tc.name   AppAccountParamCheck2_21200
     * @tc.number AppAccountParamCheck2_21200
     * @tc.desc   setOAuthTokenVisibility callback with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthTokenVisibility(name, null, owner, true, (err) => {
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
     * @tc.name   AppAccountParamCheck2_21300
     * @tc.number AppAccountParamCheck2_21300
     * @tc.desc   setOAuthTokenVisibility callback with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthTokenVisibility(name, undefined, owner, true, (err) => {
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
     * @tc.name   AppAccountParamCheck2_21400
     * @tc.number AppAccountParamCheck2_21400
     * @tc.desc   setOAuthTokenVisibility callback with empty string bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.setOAuthTokenVisibility(name, 'authType', '', true, (err) => {
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
     * @tc.name   AppAccountParamCheck2_21500
     * @tc.number AppAccountParamCheck2_21500
     * @tc.desc   setOAuthTokenVisibility callback with null bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthTokenVisibility(name, 'authType', null, true, (err) => {
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
     * @tc.name   AppAccountParamCheck2_21600
     * @tc.number AppAccountParamCheck2_21600
     * @tc.desc   setOAuthTokenVisibility callback with undefined bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setOAuthTokenVisibility(name, 'authType', undefined, true, (err) => {
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
     * @tc.name   AppAccountParamCheck2_21700
     * @tc.number AppAccountParamCheck2_21700
     * @tc.desc   setOAuthTokenVisibility promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthTokenVisibility('', 'authType', owner, true);
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
     * @tc.name   AppAccountParamCheck2_21800
     * @tc.number AppAccountParamCheck2_21800
     * @tc.desc   setOAuthTokenVisibility promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthTokenVisibility(null, 'authType', owner, true);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_21900
     * @tc.number AppAccountParamCheck2_21900
     * @tc.desc   setOAuthTokenVisibility promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_21900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_21900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthTokenVisibility(undefined, 'authType', owner, true);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_22000
     * @tc.number AppAccountParamCheck2_22000
     * @tc.desc   setOAuthTokenVisibility promise with empty string authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_22000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_22000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthTokenVisibility(name, '', owner, true);
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
     * @tc.name   AppAccountParamCheck2_22100
     * @tc.number AppAccountParamCheck2_22100
     * @tc.desc   setOAuthTokenVisibility promise with null authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_22100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_22100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthTokenVisibility(name, null, owner, true);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_22200
     * @tc.number AppAccountParamCheck2_22200
     * @tc.desc   setOAuthTokenVisibility promise with undefined authType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_22200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_22200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthTokenVisibility(name, undefined, owner, true);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_22300
     * @tc.number AppAccountParamCheck2_22300
     * @tc.desc   setOAuthTokenVisibility promise with empty string bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_22300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_22300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthTokenVisibility(name, 'authType', '', true);
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
     * @tc.name   AppAccountParamCheck2_22400
     * @tc.number AppAccountParamCheck2_22400
     * @tc.desc   setOAuthTokenVisibility promise with null bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_22400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_22400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthTokenVisibility(name, 'authType', null, true);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck2_22500
     * @tc.number AppAccountParamCheck2_22500
     * @tc.desc   setOAuthTokenVisibility promise with undefined bundleName.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck2_22500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck2_22500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.setOAuthTokenVisibility(name, 'authType', undefined, true);
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
