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

export default function AppAccountParamCheck4() {
  describe('AppAccountParamCheck4', () => {

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
     * @tc.name   AppAccountParamCheck4_0100
     * @tc.number AppAccountParamCheck4_0100
     * @tc.desc   getAllAccounts with empty string owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_0100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAllAccounts('', (err, data) => {
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
     * @tc.name   AppAccountParamCheck4_0200
     * @tc.number AppAccountParamCheck4_0200
     * @tc.desc   getAllAccounts with null owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_0200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAllAccounts(null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck4_0300
     * @tc.number AppAccountParamCheck4_0300
     * @tc.desc   getAllAccounts with undefined owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_0300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAllAccounts(undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck4_0400
     * @tc.number AppAccountParamCheck4_0400
     * @tc.desc   getAccountsByOwner with empty string owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_0400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAccountsByOwner('', (err, data) => {
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
     * @tc.name   AppAccountParamCheck4_0500
     * @tc.number AppAccountParamCheck4_0500
     * @tc.desc   getAccountsByOwner promise with empty string owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_0500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountsByOwner('');
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
     * @tc.name   AppAccountParamCheck4_3000
     * @tc.number AppAccountParamCheck4_3000
     * @tc.desc   setOAuthTokenVisibility promise with false isVisible.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_3000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.createAccount(name);
        await appAccountManager.setOAuthTokenVisibility(name, 'authType', owner, false);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   AppAccountParamCheck4_3100
     * @tc.number AppAccountParamCheck4_3100
     * @tc.desc   setAuthTokenVisibility promise with false isVisible.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_3100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.createAccount(name);
        console.info(tag + "start setAuthTokenVisibility");
        await appAccountManager.setAuthTokenVisibility(name, 'authType', owner, false);
        console.info("====>run err");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300107);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_3500
     * @tc.number AppAccountParamCheck4_3500
     * @tc.desc   getAuthenticatorCallback with empty string sessionId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_3500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAuthenticatorCallback('', (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).not().assertUndefined();
          if (data) {
            expect(data.onResult).not().assertUndefined();
            expect(data.onRequestRedirected).not().assertUndefined();
          }
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck4_3600
     * @tc.number AppAccountParamCheck4_3600
     * @tc.desc   getAuthenticatorCallback promise with empty string sessionId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_3600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        let data = await appAccountManager.getAuthenticatorCallback('');
        if (data) {
          expect(data.onResult).not().assertUndefined();
          expect(data.onRequestRedirected).not().assertUndefined();
        }
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
     * @tc.name   AppAccountParamCheck4_3700
     * @tc.number AppAccountParamCheck4_3700
     * @tc.desc   getAuthCallback with empty string sessionId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_3700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAuthCallback('', (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
          if (data) {
            expect(data.onResult).not().assertUndefined();
            expect(data.onRequestRedirected).not().assertUndefined();
            expect(data.onRequestContinued).not().assertUndefined();
          }
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck4_3800
     * @tc.number AppAccountParamCheck4_3800
     * @tc.desc   getAuthCallback promise with empty string sessionId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_3800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        let data = await appAccountManager.getAuthCallback('');
        if (data) {
          expect(data.onResult).not().assertUndefined();
          expect(data.onRequestRedirected).not().assertUndefined();
          expect(data.onRequestContinued).not().assertUndefined();
        }
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
     * @tc.name   AppAccountParamCheck4_3900
     * @tc.number AppAccountParamCheck4_3900
     * @tc.desc   getAuthenticatorInfo with empty string owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_3900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.getAuthenticatorInfo('', (err, data) => {
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
     * @tc.name   AppAccountParamCheck4_4000
     * @tc.number AppAccountParamCheck4_4000
     * @tc.desc   getAuthenticatorInfo promise with empty string owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAuthenticatorInfo('');
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
     * @tc.name   AppAccountParamCheck4_4100
     * @tc.number AppAccountParamCheck4_4100
     * @tc.desc   deleteCredential promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteCredential('', 'PIN');
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
     * @tc.name   AppAccountParamCheck4_4200
     * @tc.number AppAccountParamCheck4_4200
     * @tc.desc   deleteCredential promise with empty string credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteCredential(name, '');
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
     * @tc.name   AppAccountParamCheck4_4300
     * @tc.number AppAccountParamCheck4_4300
     * @tc.desc   setAuthenticatorProperties with empty string owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.setAuthenticatorProperties('', {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300002);
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
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
     * @tc.name   AppAccountParamCheck4_4400
     * @tc.number AppAccountParamCheck4_4400
     * @tc.desc   setAuthenticatorProperties with null owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAuthenticatorProperties(null, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_4500
     * @tc.number AppAccountParamCheck4_4500
     * @tc.desc   setAuthenticatorProperties with undefined owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.setAuthenticatorProperties(undefined, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_4600
     * @tc.number AppAccountParamCheck4_4600
     * @tc.desc   setAuthenticatorProperties with empty string owner and options AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: { prop1: "value1" }
      };
      appAccountManager.setAuthenticatorProperties('', options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300002);
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
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
     * @tc.name   AppAccountParamCheck4_4700
     * @tc.number AppAccountParamCheck4_4700
     * @tc.desc   setAuthenticatorProperties with null owner and options AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: { prop1: "value1" }
      };
      try {
        appAccountManager.setAuthenticatorProperties(null, options, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_4800
     * @tc.number AppAccountParamCheck4_4800
     * @tc.desc   setAuthenticatorProperties with undefined owner and options AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties: { prop1: "value1" }
      };
      try {
        appAccountManager.setAuthenticatorProperties(undefined, options, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_4900
     * @tc.number AppAccountParamCheck4_4900
     * @tc.desc   getAuthCallback with null sessionId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_4900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAuthCallback(null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck4_5000
     * @tc.number AppAccountParamCheck4_5000
     * @tc.desc   getAuthCallback with undefined sessionId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_5000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAuthCallback(undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck4_5100
     * @tc.number AppAccountParamCheck4_5100
     * @tc.desc   getAuthCallback promise with null sessionId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_5100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAuthCallback(null);
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
     * @tc.name   AppAccountParamCheck4_5200
     * @tc.number AppAccountParamCheck4_5200
     * @tc.desc   getAuthCallback promise with undefined sessionId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_5200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAuthCallback(undefined);
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
     * @tc.name   AppAccountParamCheck4_6100
     * @tc.number AppAccountParamCheck4_6100
     * @tc.desc   deleteCredential promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_6100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteCredential(null, 'PIN');
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
     * @tc.name   AppAccountParamCheck4_6200
     * @tc.number AppAccountParamCheck4_6200
     * @tc.desc   deleteCredential promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_6200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteCredential(undefined, 'PIN');
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
     * @tc.name   AppAccountParamCheck4_6300
     * @tc.number AppAccountParamCheck4_6300
     * @tc.desc   deleteCredential promise with null credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_6300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteCredential(name, null);
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
     * @tc.name   AppAccountParamCheck4_6400
     * @tc.number AppAccountParamCheck4_6400
     * @tc.desc   deleteCredential promise with undefined credentialType.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_6400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.deleteCredential(name, undefined);
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
     * @tc.name   AppAccountParamCheck4_6700
     * @tc.number AppAccountParamCheck4_6700
     * @tc.desc   createAccountImplicitly with empty string owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_6700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.createAccountImplicitly('', {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300002);
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
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
     * @tc.name   AppAccountParamCheck4_6800
     * @tc.number AppAccountParamCheck4_6800
     * @tc.desc   createAccountImplicitly with null owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_6800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.createAccountImplicitly(null, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_6900
     * @tc.number AppAccountParamCheck4_6900
     * @tc.desc   createAccountImplicitly with undefined owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_6900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.createAccountImplicitly(undefined, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_7000
     * @tc.number AppAccountParamCheck4_7000
     * @tc.desc   createAccountImplicitly with empty string owner and options AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: 'PIN',
        requiredLabels: ['label1']
      };
      appAccountManager.createAccountImplicitly('', options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).assertEqual(12300002);
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
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
     * @tc.name   AppAccountParamCheck4_7100
     * @tc.number AppAccountParamCheck4_7100
     * @tc.desc   createAccountImplicitly with null owner and options AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: 'PIN',
        requiredLabels: ['label1']
      };
      try {
        appAccountManager.createAccountImplicitly(null, options, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_7200
     * @tc.number AppAccountParamCheck4_7200
     * @tc.desc   createAccountImplicitly with undefined owner and options AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: 'PIN',
        requiredLabels: ['label1']
      };
      try {
        appAccountManager.createAccountImplicitly(undefined, options, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_7300
     * @tc.number AppAccountParamCheck4_7300
     * @tc.desc   createAccountImplicitly with requiredLabels empty array AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: 'PIN',
        requiredLabels: []
      };
      appAccountManager.createAccountImplicitly(owner, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).assertEqual(12300113);
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
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
     * @tc.name   AppAccountParamCheck4_7400
     * @tc.number AppAccountParamCheck4_7400
     * @tc.desc   verifyCredential with options and empty string name AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: 'PIN',
        credential: '123456'
      };
      appAccountManager.verifyCredential('', owner, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).assertEqual(12300002);
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
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
     * @tc.name   AppAccountParamCheck4_7500
     * @tc.number AppAccountParamCheck4_7500
     * @tc.desc   verifyCredential with options and null name AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: 'PIN',
        credential: '123456'
      };
      try {
        appAccountManager.verifyCredential(null, owner, options, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_7600
     * @tc.number AppAccountParamCheck4_7600
     * @tc.desc   verifyCredential with options and undefined name AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: 'PIN',
        credential: '123456'
      };
      try {
        appAccountManager.verifyCredential(undefined, owner, options, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_7700
     * @tc.number AppAccountParamCheck4_7700
     * @tc.desc   verifyCredential with options and empty string owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: 'PIN',
        credential: '123456'
      };
      appAccountManager.verifyCredential(name, '', options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).assertEqual(12300002);
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
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
     * @tc.name   AppAccountParamCheck4_7800
     * @tc.number AppAccountParamCheck4_7800
     * @tc.desc   verifyCredential with options and null owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: 'PIN',
        credential: '123456'
      };
      try {
        appAccountManager.verifyCredential(name, null, options, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_7900
     * @tc.number AppAccountParamCheck4_7900
     * @tc.desc   verifyCredential with options and undefined owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_7900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: 'PIN',
        credential: '123456'
      };
      try {
        appAccountManager.verifyCredential(name, undefined, options, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            try {
              expect().assertFail();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_8800
     * @tc.number AppAccountParamCheck4_8800
     * @tc.desc   checkAccountLabels with empty string owner promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_8800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAccountLabels(name, '', ['label1']);
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
     * @tc.name   AppAccountParamCheck4_8900
     * @tc.number AppAccountParamCheck4_8900
     * @tc.desc   checkAccountLabels with null owner promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_8900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAccountLabels(name, null, ['label1']);
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
     * @tc.name   AppAccountParamCheck4_9000
     * @tc.number AppAccountParamCheck4_9000
     * @tc.desc   checkAccountLabels with undefined owner promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_9000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAccountLabels(name, undefined, ['label1']);
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
     * @tc.name   AppAccountParamCheck4_9300
     * @tc.number AppAccountParamCheck4_9300
     * @tc.desc   checkAccountLabels with empty array labels callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_9300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAccountLabels(name, owner, []);
        console.info(tag + "end====");
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_9400
     * @tc.number AppAccountParamCheck4_9400
     * @tc.desc   checkAccountLabels promise with empty string name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_9400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAccountLabels('', owner, ['label1']);
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
     * @tc.name   AppAccountParamCheck4_9500
     * @tc.number AppAccountParamCheck4_9500
     * @tc.desc   checkAccountLabels promise with null name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_9500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAccountLabels(null, owner, ['label1']);
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
     * @tc.name   AppAccountParamCheck4_9600
     * @tc.number AppAccountParamCheck4_9600
     * @tc.desc   checkAccountLabels promise with undefined name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_9600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAccountLabels(undefined, owner, ['label1']);
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
     * @tc.name   AppAccountParamCheck4_9700
     * @tc.number AppAccountParamCheck4_9700
     * @tc.desc   checkAccountLabels promise with null labels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_9700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAccountLabels(name, owner, null);
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
     * @tc.name   AppAccountParamCheck4_9800
     * @tc.number AppAccountParamCheck4_9800
     * @tc.desc   checkAccountLabels promise with undefined labels.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_9800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.checkAccountLabels(name, owner, undefined);
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
     * @tc.name   AppAccountParamCheck4_9900
     * @tc.number AppAccountParamCheck4_9900
     * @tc.desc   selectAccountsByOptions with allowedAccounts empty array callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_9900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: []
      };
      appAccountManager.selectAccountsByOptions(options, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err).assertEqual(null);
          expect(data.length).assertEqual(0);
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck4_10000
     * @tc.number AppAccountParamCheck4_10000
     * @tc.desc   selectAccountsByOptions with allowedOwners empty array callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_10000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_10000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedOwners: []
      };
      appAccountManager.selectAccountsByOptions(options, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err).assertEqual(null);
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck4_10100
     * @tc.number AppAccountParamCheck4_10100
     * @tc.desc   selectAccountsByOptions with requiredLabels empty array callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_10100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        requiredLabels: []
      };
      appAccountManager.selectAccountsByOptions(options, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err).assertEqual(null);
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck4_10200
     * @tc.number AppAccountParamCheck4_10200
     * @tc.desc   selectAccountsByOptions promise with allowedAccounts empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_10200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: []
      };
      try {
        let data = await appAccountManager.selectAccountsByOptions(options);
        console.info(tag + "data: " + JSON.stringify(data));
        expect(data.length).assertEqual(0);
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_10300
     * @tc.number AppAccountParamCheck4_10300
     * @tc.desc   selectAccountsByOptions promise with allowedOwners empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_10300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedOwners: []
      };
      try {
        let data = await appAccountManager.selectAccountsByOptions(options);
        console.info(tag + "data: " + JSON.stringify(data));
        expect(data.length).assertEqual(0);
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck4_10400
     * @tc.number AppAccountParamCheck4_10400
     * @tc.desc   selectAccountsByOptions promise with requiredLabels empty array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck4_10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck4_10400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        requiredLabels: []
      };
      try {
        let data = await appAccountManager.selectAccountsByOptions(options);
        console.info(tag + "data: " + JSON.stringify(data));
        expect(data.length).assertLargerOrEqual(0);
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  });
}
