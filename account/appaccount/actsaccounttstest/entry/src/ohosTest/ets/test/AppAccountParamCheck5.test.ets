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
import Want from '@ohos.app.ability.Want'

const name = 'zhangSan'
const owner = 'com.acts.notExist'

export default function AppAccountParamCheck5() {
  describe('AppAccountParamCheck5', () => {

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
     * @tc.name   AppAccountParamCheck5_10500
     * @tc.number AppAccountParamCheck5_10500
     * @tc.desc   auth with empty string name AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_10500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.auth('', owner, 'getSocialData', {
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
     * @tc.name   AppAccountParamCheck5_10600
     * @tc.number AppAccountParamCheck5_10600
     * @tc.desc   auth with null name AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_10600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth(null, owner, 'getSocialData', {
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
     * @tc.name   AppAccountParamCheck5_10700
     * @tc.number AppAccountParamCheck5_10700
     * @tc.desc   auth with undefined name AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_10700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth(undefined, owner, 'getSocialData', {
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
     * @tc.name   AppAccountParamCheck5_10800
     * @tc.number AppAccountParamCheck5_10800
     * @tc.desc   auth with empty string owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_10800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.auth(name, '', 'getSocialData', {
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
     * @tc.name   AppAccountParamCheck5_10900
     * @tc.number AppAccountParamCheck5_10900
     * @tc.desc   auth with null owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_10900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth(name, null, 'getSocialData', {
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
     * @tc.name   AppAccountParamCheck5_11000
     * @tc.number AppAccountParamCheck5_11000
     * @tc.desc   auth with undefined owner AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth(name, undefined, 'getSocialData', {
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
     * @tc.name   AppAccountParamCheck5_11100
     * @tc.number AppAccountParamCheck5_11100
     * @tc.desc   auth with empty string authType AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.auth(name, owner, '', {
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
     * @tc.name   AppAccountParamCheck5_11200
     * @tc.number AppAccountParamCheck5_11200
     * @tc.desc   auth with null authType AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth(name, owner, null, {
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
     * @tc.name   AppAccountParamCheck5_11300
     * @tc.number AppAccountParamCheck5_11300
     * @tc.desc   auth with undefined authType AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth(name, owner, undefined, {
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
     * @tc.name   AppAccountParamCheck5_11400
     * @tc.number AppAccountParamCheck5_11400
     * @tc.desc   auth with options and empty string name AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      appAccountManager.auth('', owner, 'getSocialData', options, {
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
     * @tc.name   AppAccountParamCheck5_11500
     * @tc.number AppAccountParamCheck5_11500
     * @tc.desc   auth with options and null name AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.auth(null, owner, 'getSocialData', options, {
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
     * @tc.name   AppAccountParamCheck5_11600
     * @tc.number AppAccountParamCheck5_11600
     * @tc.desc   auth with options and undefined name AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.auth(undefined, owner, 'getSocialData', options, {
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
     * @tc.name   AppAccountParamCheck5_11700
     * @tc.number AppAccountParamCheck5_11700
     * @tc.desc   auth with options and null options AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth(name, owner, 'getSocialData', null, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            console.info(tag + "resultCode: " + JSON.stringify(resultCode));
            console.info(tag + "resultData: " + JSON.stringify(resultData));
            try {
              expect(resultCode).assertEqual(12300113);
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_11800
     * @tc.number AppAccountParamCheck5_11800
     * @tc.desc   auth with options and undefined options AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.auth(name, owner, 'getSocialData', undefined, {
          onResult: async (resultCode, resultData: account.AuthResult) => {
            console.info(tag + "resultCode: " + JSON.stringify(resultCode));
            console.info(tag + "resultData: " + JSON.stringify(resultData));
            try {
              expect(resultCode).assertEqual(12300113);
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_11900
     * @tc.number AppAccountParamCheck5_11900
     * @tc.desc   queryAuthenticatorInfo with empty string owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_11900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      appAccountManager.queryAuthenticatorInfo('', (err, data) => {
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
     * @tc.name   AppAccountParamCheck5_12000
     * @tc.number AppAccountParamCheck5_12000
     * @tc.desc   queryAuthenticatorInfo with null owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.queryAuthenticatorInfo(null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck5_12100
     * @tc.number AppAccountParamCheck5_12100
     * @tc.desc   queryAuthenticatorInfo with undefined owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.queryAuthenticatorInfo(undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck5_12200
     * @tc.number AppAccountParamCheck5_12200
     * @tc.desc   queryAuthenticatorInfo promise with empty string owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.queryAuthenticatorInfo('');
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
     * @tc.name   AppAccountParamCheck5_12300
     * @tc.number AppAccountParamCheck5_12300
     * @tc.desc   queryAuthenticatorInfo promise with null owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.queryAuthenticatorInfo(null);
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
     * @tc.name   AppAccountParamCheck5_12400
     * @tc.number AppAccountParamCheck5_12400
     * @tc.desc   queryAuthenticatorInfo promise with undefined owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.queryAuthenticatorInfo(undefined);
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
     * @tc.name   AppAccountParamCheck5_12500
     * @tc.number AppAccountParamCheck5_12500
     * @tc.desc   getAccountsByOwner with null owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAccountsByOwner(null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck5_12600
     * @tc.number AppAccountParamCheck5_12600
     * @tc.desc   getAccountsByOwner with undefined owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAccountsByOwner(undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck5_12700
     * @tc.number AppAccountParamCheck5_12700
     * @tc.desc   getAccountsByOwner promise with null owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountsByOwner(null);
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
     * @tc.name   AppAccountParamCheck5_12800
     * @tc.number AppAccountParamCheck5_12800
     * @tc.desc   getAccountsByOwner promise with undefined owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAccountsByOwner(undefined);
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
     * @tc.name   AppAccountParamCheck5_12900
     * @tc.number AppAccountParamCheck5_12900
     * @tc.desc   getAuthenticatorCallback with null sessionId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_12900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAuthenticatorCallback(null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck5_13000
     * @tc.number AppAccountParamCheck5_13000
     * @tc.desc   getAuthenticatorCallback with undefined sessionId callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAuthenticatorCallback(undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck5_13100
     * @tc.number AppAccountParamCheck5_13100
     * @tc.desc   getAuthenticatorCallback promise with null sessionId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAuthenticatorCallback(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_13200
     * @tc.number AppAccountParamCheck5_13200
     * @tc.desc   getAuthenticatorCallback promise with undefined sessionId.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAuthenticatorCallback(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_13300
     * @tc.number AppAccountParamCheck5_13300
     * @tc.desc   getAuthenticatorInfo with null owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAuthenticatorInfo(null, (err, data) => {
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
     * @tc.name   AppAccountParamCheck5_13400
     * @tc.number AppAccountParamCheck5_13400
     * @tc.desc   getAuthenticatorInfo with undefined owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.getAuthenticatorInfo(undefined, (err, data) => {
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
     * @tc.name   AppAccountParamCheck5_13500
     * @tc.number AppAccountParamCheck5_13500
     * @tc.desc   getAuthenticatorInfo promise with null owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAuthenticatorInfo(null);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_13600
     * @tc.number AppAccountParamCheck5_13600
     * @tc.desc   getAuthenticatorInfo promise with undefined owner.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        await appAccountManager.getAuthenticatorInfo(undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect(err.code).not().assertUndefined();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_13700
     * @tc.number AppAccountParamCheck5_13700
     * @tc.desc   addAccountImplicitly with empty string owner AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      appAccountManager.addAccountImplicitly('', 'PIN', options, {
        onResult: async (resultCode, resultData) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).not().assertUndefined();
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        },
        onRequestRedirected: null
      });
    });

    /**
     * @tc.name   AppAccountParamCheck5_13800
     * @tc.number AppAccountParamCheck5_13800
     * @tc.desc   addAccountImplicitly with null owner AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.addAccountImplicitly(null, 'PIN', options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_13900
     * @tc.number AppAccountParamCheck5_13900
     * @tc.desc   addAccountImplicitly with undefined owner AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_13900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_13900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.addAccountImplicitly(undefined, 'PIN', options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_14000
     * @tc.number AppAccountParamCheck5_14000
     * @tc.desc   addAccountImplicitly with empty string authType AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      appAccountManager.addAccountImplicitly(owner, '', options, {
        onResult: async (resultCode, resultData) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).not().assertUndefined();
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        },
        onRequestRedirected: null
      });
    });

    /**
     * @tc.name   AppAccountParamCheck5_14100
     * @tc.number AppAccountParamCheck5_14100
     * @tc.desc   addAccountImplicitly with null authType AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.addAccountImplicitly(owner, null, options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_14200
     * @tc.number AppAccountParamCheck5_14200
     * @tc.desc   addAccountImplicitly with undefined authType AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.addAccountImplicitly(owner, undefined, options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_14300
     * @tc.number AppAccountParamCheck5_14300
     * @tc.desc   addAccountImplicitly with null options AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.addAccountImplicitly(owner, 'PIN', null, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_14400
     * @tc.number AppAccountParamCheck5_14400
     * @tc.desc   addAccountImplicitly with undefined options AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.addAccountImplicitly(owner, 'PIN', undefined, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_14500
     * @tc.number AppAccountParamCheck5_14500
     * @tc.desc   authenticate with empty string name AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      appAccountManager.authenticate('', owner, 'PIN', options, {
        onResult: async (resultCode, resultData) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).not().assertUndefined();
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        },
        onRequestRedirected: null
      });
    });

    /**
     * @tc.name   AppAccountParamCheck5_14600
     * @tc.number AppAccountParamCheck5_14600
     * @tc.desc   authenticate with null name AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.authenticate(null, owner, 'PIN', options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_14700
     * @tc.number AppAccountParamCheck5_14700
     * @tc.desc   authenticate with undefined name AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.authenticate(undefined, owner, 'PIN', options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_14800
     * @tc.number AppAccountParamCheck5_14800
     * @tc.desc   authenticate with empty string owner AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      appAccountManager.authenticate(name, '', 'PIN', options, {
        onResult: async (resultCode, resultData) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).not().assertUndefined();
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        },
        onRequestRedirected: null
      });
    });

    /**
     * @tc.name   AppAccountParamCheck5_14900
     * @tc.number AppAccountParamCheck5_14900
     * @tc.desc   authenticate with null owner AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_14900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_14900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.authenticate(name, null, 'PIN', options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_15000
     * @tc.number AppAccountParamCheck5_15000
     * @tc.desc   authenticate with undefined owner AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_15000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_15000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.authenticate(name, undefined, 'PIN', options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_15100
     * @tc.number AppAccountParamCheck5_15100
     * @tc.desc   authenticate with empty string authType AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_15100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_15100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      appAccountManager.authenticate(name, owner, '', options, {
        onResult: async (resultCode, resultData) => {
          console.info(tag + "resultCode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).not().assertUndefined();
          } catch (e) {
            console.info("====>Assert Fail:" + JSON.stringify(e));
          }
          done();
        },
        onRequestRedirected: null
      });
    });

    /**
     * @tc.name   AppAccountParamCheck5_15200
     * @tc.number AppAccountParamCheck5_15200
     * @tc.desc   authenticate with null authType AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_15200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_15200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.authenticate(name, owner, null, options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_15300
     * @tc.number AppAccountParamCheck5_15300
     * @tc.desc   authenticate with undefined authType AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_15300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_15300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN"
      };
      try {
        appAccountManager.authenticate(name, owner, undefined, options, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_15400
     * @tc.number AppAccountParamCheck5_15400
     * @tc.desc   authenticate with null options AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_15400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_15400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.authenticate(name, owner, 'PIN', null, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_15500
     * @tc.number AppAccountParamCheck5_15500
     * @tc.desc   authenticate with undefined options AuthenticatorCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_15500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_15500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        appAccountManager.authenticate(name, owner, 'PIN', undefined, {
          onResult: async (resultCode, resultData) => {
            console.info(tag + "resultCode:" + JSON.stringify(resultCode));
            try {
              expect(resultCode).not().assertUndefined();
            } catch (e) {
              console.info("====>Assert Fail:" + JSON.stringify(e));
            }
            done();
          },
          onRequestRedirected: null
        });
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   AppAccountParamCheck5_15800
     * @tc.number AppAccountParamCheck5_15800
     * @tc.desc   createAccountImplicitly with requiredLabels empty string AuthCallback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_15800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_15800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        requiredLabels: ['']
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
        onRequestRedirected: null
      });
    });

    /**
     * @tc.name   AppAccountParamCheck5_16000
     * @tc.number AppAccountParamCheck5_16000
     * @tc.desc   selectAccountsByOptions with allowedAccounts empty owner callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_16000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_16000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{ owner: '', name: name }]
      };
      appAccountManager.selectAccountsByOptions(options, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err).assertNull();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck5_16100
     * @tc.number AppAccountParamCheck5_16100
     * @tc.desc   selectAccountsByOptions with allowedAccounts empty owner promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_16100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_16100 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedAccounts: [{ owner: '', name: name }]
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
     * @tc.name   AppAccountParamCheck5_16200
     * @tc.number AppAccountParamCheck5_16200
     * @tc.desc   selectAccountsByOptions with allowedOwners empty string callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_16200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_16200 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedOwners: ['']
      };
      appAccountManager.selectAccountsByOptions(options, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err).assertNull();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck5_16300
     * @tc.number AppAccountParamCheck5_16300
     * @tc.desc   selectAccountsByOptions with allowedOwners empty string promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_16300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_16300 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        allowedOwners: ['']
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
     * @tc.name   AppAccountParamCheck5_16400
     * @tc.number AppAccountParamCheck5_16400
     * @tc.desc   selectAccountsByOptions with requiredLabels empty string callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_16400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_16400 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        requiredLabels: ['']
      };
      appAccountManager.selectAccountsByOptions(options, (err, data) => {
        console.info(tag + "err: " + JSON.stringify(err));
        console.info(tag + "data: " + JSON.stringify(data));
        try {
          expect(err).assertNull();
        } catch (e) {
          console.info("====>Assert Fail:" + JSON.stringify(e));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountParamCheck5_16500
     * @tc.number AppAccountParamCheck5_16500
     * @tc.desc   selectAccountsByOptions with requiredLabels empty string promise mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_16500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_16500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SelectAccountsOptions = {
        requiredLabels: ['']
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
     * @tc.name   AppAccountParamCheck5_16600
     * @tc.number AppAccountParamCheck5_16600
     * @tc.desc   return of createAppAccountManager.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_16600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_16600 "
      console.info(tag + "start====");
      try {
        let appAccountManager: account.AppAccountManager = account.createAppAccountManager();
        console.info(tag + "appAccountManager is: " + JSON.stringify(appAccountManager));
        expect(appAccountManager).not().assertUndefined();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   AppAccountParamCheck5_16700
     * @tc.number AppAccountParamCheck5_16700
     * @tc.desc   return of getRemoteObject.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AppAccountParamCheck5_16700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AppAccountParamCheck5_16700 "
      console.info(tag + "start====");
      class MyAuthenticator extends account.Authenticator {
        verifyCredential(name: string,
          options: account.VerifyCredentialOptions, callback: account.AuthCallback) {
          let want: Want = {
            bundleName: 'com.example.accountjsdemo',
            abilityName: 'com.example.accountjsdemo.VerifyAbility',
            parameters: {
              name: name
            }
          };
          callback.onRequestRedirected(want);
        }
        setProperties(options: account.SetPropertiesOptions, callback: account.AuthCallback) {
          let want: Want = {
            bundleName: 'com.example.accountjsdemo',
            abilityName: 'com.example.accountjsdemo.SetPropertiesAbility',
            parameters: {
              options: options
            }
          };
          callback.onRequestRedirected(want);
        }
        checkAccountLabels(name: string, labels: string[], callback: account.AuthCallback) {
          callback.onResult(0);
        }
        checkAccountRemovable(name: string, callback: account.AuthCallback) {
          callback.onResult(0);
        }
      }
      try {
        let authenticator = new MyAuthenticator();
        let authenticatorObject =  authenticator.getRemoteObject();
        console.info(tag + "authenticatorObject is: " + JSON.stringify(authenticatorObject));
        expect(authenticatorObject).not().assertUndefined();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });
  });
}
