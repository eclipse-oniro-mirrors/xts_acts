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
import Want from '@ohos.app.ability.Want';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

const name = 'zhangsan'
const fakeOwner = 'com.acts.notExist'
const owner_stage = 'com.acts.accountauthenticator'

let driver = Driver.create();

export default function AppAccountAuthenticatorStage2Stage() {
  describe('AppAccountAuthenticatorStage2Stage', () => {

    beforeAll(async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage beforeAll start====");
      let wantInfo: Want = {
        deviceId: "",
        bundleName: "com.acts.accountauthenticator",
        abilityName: "com.acts.accountauthenticator.MainAbility",
        action: "action1",
        parameters: {},
      }
      globalThis.abilityContext.startAbilityForResult(wantInfo, (err: BusinessError, result: common.AbilityResult) => {
        console.info("====>startAbilityForResult err: " + JSON.stringify(err));
        console.info("====>startAbilityForResult result: " + JSON.stringify(result));
        done();
      });
      await driver.delayMs(2000);
      try {
        console.info("====>start to findComponent");
        let allowed = await driver.findComponent(ON.text("允许"));
        let allowed1 = await driver.findComponent(ON.text("本次允许"));
        let allowed2 = await driver.findComponent(ON.text("打开"));
        let allowed3 = await driver.findComponent(ON.text("本次打开"));
        if (allowed != undefined && allowed != null) {
          await allowed.click();
          console.info("====>beforeAll click allowed");
        } else if (allowed1 != undefined && allowed1 != null) {
          await allowed1.click();
          console.info("====>beforeAll click allowed1");
        } else if (allowed2 != undefined && allowed2 != null) {
          await allowed2.click();
          console.info("====>beforeAll click allowed2");
        } else if (allowed3 != undefined && allowed3 != null) {
          await allowed3.click();
          console.info("====>beforeAll click allowed3");
        }
      } catch (err) {
        console.info("====>click button err:" + JSON.stringify(err));
      }
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_0100
     * @tc.number AppAccountAuthenticatorStage2Stage_0100
     * @tc.desc   createAccountImplicitly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0100 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start createAccountImplicitly");
      appAccountManager.createAccountImplicitly(owner_stage, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0100 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0100 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData.account != undefined) {
              expect(resultData.account.name).assertEqual("createNewAccountName");
              expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator");
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0100 onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_0200
     * @tc.number AppAccountAuthenticatorStage2Stage_0200
     * @tc.desc   createAccountImplicitly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0200 start====");
      let appAccountManager = account.createAppAccountManager();
      let setOptions: account.SetPropertiesOptions = {
        properties : { prop1 : "remove", prop2 : "createNewAccountName"}
      };
      let options: account.CreateAccountImplicitlyOptions = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          "age": "18"
        }
      };
      console.info("====>start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner_stage, setOptions, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>resultcode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).assertEqual(0);
          } catch (err) {
            console.info("====>Assert Fail: " + JSON.stringify(err));
          }
          console.info("====>start createAccountImplicitly");
          appAccountManager.createAccountImplicitly(owner_stage, options, {
            onResult: async (resultCode, resultData: account.AuthResult) => {
              console.info("====>AppAccountAuthenticatorStage2Stage_0200 resultcode:" + JSON.stringify(resultCode));
              console.info("====>AppAccountAuthenticatorStage2Stage_0200 resultData:" + JSON.stringify(resultData));
              try {
                expect(resultCode).assertEqual(0);
                if (resultData.account != undefined) {
                  expect(resultData.account.name).assertEqual("createNewAccountName");
                  expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator");
                }
              } catch (err) {
                console.info("====>Assert Fail:" + JSON.stringify(err));
              }
              done();
            },
            onRequestRedirected: null
          });
        },
        onRequestRedirected: null,
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_0300
     * @tc.number AppAccountAuthenticatorStage2Stage_0300
     * @tc.desc   auth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0300 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start auth");
      appAccountManager.auth("0300", owner_stage, "getSocialData", {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0300 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0300 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData.account && resultData.tokenInfo) {
              expect(resultData.account.name).assertEqual("0300");
              expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator");
              expect(resultData.tokenInfo.authType).assertEqual("getSocialData");
              expect(resultData.tokenInfo.token).assertEqual("xxxxxxxxx");
              expect(resultData.tokenInfo.account?.name).assertEqual("0300");
              expect(resultData.tokenInfo.account?.owner).assertEqual("com.acts.accountauthenticator");
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0300 onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_0400
     * @tc.number AppAccountAuthenticatorStage2Stage_0400
     * @tc.desc   auth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0400 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info("====>start auth");
      appAccountManager.auth("0400", owner_stage, "getSocialData", options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0400 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0400 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData.account && resultData.tokenInfo) {
              expect(resultData.account.name).assertEqual("0400");
              expect(resultData.account.owner).assertEqual("com.acts.accountauthenticator");
              expect(resultData.tokenInfo.authType).assertEqual("getSocialData");
              expect(resultData.tokenInfo.token).assertEqual("xxxxxxxxx");
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0400 onRequestContinued");
        }
      });
    });


    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_0500
     * @tc.number AppAccountAuthenticatorStage2Stage_0500
     * @tc.desc   ActsAccountCheckAccountLabels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0500 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start verifyCredential");
      appAccountManager.verifyCredential(name, owner_stage, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0500 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0500 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData != undefined) {
              expect(resultData["booleanResult"]).assertEqual(false)
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0500 verifyCredential_onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_0600
     * @tc.number AppAccountAuthenticatorStage2Stage_0600
     * @tc.desc   ActsAccountCheckAccountLabels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0600 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.VerifyCredentialOptions = {
        credentialType: "PIN", credential: "123456"
      };
      console.info("====>start verifyCredential");
      appAccountManager.verifyCredential(name, owner_stage, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0600 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0600 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(0);
            if (resultData != undefined) {
              expect(resultData["booleanResult"]).assertEqual(true)
            }
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0600 verifyCredential_onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_0700
     * @tc.number AppAccountAuthenticatorStage2Stage_0700
     * @tc.desc   setAuthenticatorProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0700 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner_stage, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0700 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0700 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(10016);
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0700 verifyCredential_onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_0800
     * @tc.number AppAccountAuthenticatorStage2Stage_0800
     * @tc.desc   setAuthenticatorProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0800 start====");
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties : { prop1 : "value1", prop2 : "value2"}
      };
      console.info("====>start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner_stage, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0800 resultcode:" + JSON.stringify(resultCode));
          console.info("====>AppAccountAuthenticatorStage2Stage_0800 resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(10016);
          } catch (err) {
            console.info("====>Assert Fail:" + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info("====>AppAccountAuthenticatorStage2Stage_0800 verifyCredential_onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_0900
     * @tc.number AppAccountAuthenticatorStage2Stage_0900
     * @tc.desc   checkAccountLabels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_0900 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start checkAccountLabels");
      appAccountManager.checkAccountLabels(name, owner_stage, ['level4'], (err, data) => {
        console.info("====>AppAccountAuthenticatorStage2Stage_0900 err:" + JSON.stringify(err));
        console.info("====>AppAccountAuthenticatorStage2Stage_0900 data:" + JSON.stringify(data));
        try {
          expect(err).assertEqual(null);
          expect(data).assertTrue();
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_1000
     * @tc.number AppAccountAuthenticatorStage2Stage_1000
     * @tc.desc   checkAccountLabels
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1000 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        console.info("====>start checkAccountLabels");
        let ret = await appAccountManager.checkAccountLabels(name, owner_stage, ['20-30'])
        console.info("====>AppAccountAuthenticatorStage2Stage_1000 ret:" + JSON.stringify(ret));
        expect(ret).assertFalse();
        done();
      } catch (err) {
        console.info("====>AppAccountAuthenticatorStage2Stage_1000 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        done();
      }
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_1100
     * @tc.number AppAccountAuthenticatorStage2Stage_1100
     * @tc.desc   selectAccountsByOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1100 start====");
      let select_options: account.SelectAccountsOptions = {
        allowedOwners:[owner_stage]
      };
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start selectAccountsByOptions");
      appAccountManager.selectAccountsByOptions(select_options, (err, data) => {
        console.info("====>AppAccountAuthenticatorStage2Stage_1100 err:" + JSON.stringify(err));
        console.info("====>AppAccountAuthenticatorStage2Stage_1100 data:" + JSON.stringify(data));
        try {
          expect(err).assertEqual(null);
          expect(data.length).assertEqual(3);
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_1200
     * @tc.number AppAccountAuthenticatorStage2Stage_1200
     * @tc.desc   selectAccountsByOptions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1200 start====");
      let select_options: account.SelectAccountsOptions = {
        requiredLabels: ["male", "30-40"]
      };
      let appAccountManager = account.createAppAccountManager();
      try {
        console.info("====>start selectAccountsByOptions");
        let ret = await appAccountManager.selectAccountsByOptions(select_options)
        console.info("====>AppAccountAuthenticatorStage2Stage_1200 ret:" + JSON.stringify(ret));
        expect(ret[0].name).assertEqual("zhangsan");
        expect(ret[0].owner).assertEqual("com.acts.accountauthenticator");
        done();
      } catch (err) {
        console.info("====>AppAccountAuthenticatorStage2Stage_1200 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        done();
      }
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_1300
     * @tc.number AppAccountAuthenticatorStage2Stage_1300
     * @tc.desc   queryAuthenticatorInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1300 start====");
      let appAccountManager = account.createAppAccountManager();
      console.info("====>start queryAuthenticatorInfo");
      appAccountManager.queryAuthenticatorInfo(owner_stage, (err, data) => {
        console.info("====>AppAccountAuthenticatorStage2Stage_1300 err:" + JSON.stringify(err));
        console.info("====>AppAccountAuthenticatorStage2Stage_1300 data:" + JSON.stringify(data));
        try {
          expect(err).assertEqual(null);
          expect(data.owner).assertEqual("com.acts.accountauthenticator");
        } catch (err) {
          console.info("====>Assert Fail:" + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AppAccountAuthenticatorStage2Stage_1400
     * @tc.number AppAccountAuthenticatorStage2Stage_1400
     * @tc.desc   queryAuthenticatorInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AppAccountAuthenticatorStage2Stage_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("====>AppAccountAuthenticatorStage2Stage_1400 start====");
      let appAccountManager = account.createAppAccountManager();
      try {
        console.info("====>start queryAuthenticatorInfo");
        let ret = await appAccountManager.queryAuthenticatorInfo(owner_stage)
        console.info("====>AppAccountAuthenticatorStage2Stage_1400 ret:" + JSON.stringify(ret));
        expect(ret.owner).assertEqual("com.acts.accountauthenticator");
        done();
      } catch (err) {
        console.info("====>AppAccountAuthenticatorStage2Stage_1400 err:" + JSON.stringify(err));
        expect(err).assertEqual(null);
        done();
      }
    });
    
    /**
     * @tc.name   AuthenticateErrCodeCheck_0100
     * @tc.number AuthenticateErrCodeCheck_0100
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_0100 "
      console.info(tag + "start====");
      let labels = ['student'];
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAccountLabels");
      try {
        appAccountManager.checkAccountLabels(null, fakeOwner, labels, (err, data) => {
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
     * @tc.name   AuthenticateErrCodeCheck_0200
     * @tc.number AuthenticateErrCodeCheck_0200
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_0200 "
      console.info(tag + "start====");
      let labels = ['student'];
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAccountLabels");
      try {
        let data = await appAccountManager.checkAccountLabels(undefined, fakeOwner, labels);
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
     * @tc.name   AuthenticateErrCodeCheck_0300
     * @tc.number AuthenticateErrCodeCheck_0300
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_0300 "
      console.info(tag + "start====");
      let labels = ['student'];
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAccountLabels");
      try {
        appAccountManager.checkAccountLabels(name, undefined, labels, (err, data) => {
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
     * @tc.name   AuthenticateErrCodeCheck_0400
     * @tc.number AuthenticateErrCodeCheck_0400
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_0400 "
      console.info(tag + "start====");
      let labels = ['student'];
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAccountLabels");
      try {
        let data = await appAccountManager.checkAccountLabels(name, null, labels);
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
     * @tc.name   AuthenticateErrCodeCheck_0500
     * @tc.number AuthenticateErrCodeCheck_0500
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_0500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAccountLabels");
      try {
        appAccountManager.checkAccountLabels(name, fakeOwner, null, (err, data) => {
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
     * @tc.name   AuthenticateErrCodeCheck_0600
     * @tc.number AuthenticateErrCodeCheck_0600
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_0600 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAccountLabels");
      try {
        let data = await appAccountManager.checkAccountLabels(name, fakeOwner, undefined);
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
     * @tc.name   AuthenticateErrCodeCheck_0700
     * @tc.number AuthenticateErrCodeCheck_0700
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_0700 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start selectAccountsByOptions");
      try {
        appAccountManager.selectAccountsByOptions(null, (err, data) => {
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
     * @tc.name   AuthenticateErrCodeCheck_0800
     * @tc.number AuthenticateErrCodeCheck_0800
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_0800 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start selectAccountsByOptions");
      try {
        let data = await appAccountManager.selectAccountsByOptions(null);
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
     * @tc.name   AuthenticateErrCodeCheck_0900
     * @tc.number AuthenticateErrCodeCheck_0900
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_0900 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start selectAccountsByOptions");
      try {
        appAccountManager.selectAccountsByOptions(undefined, (err, data) => {
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
     * @tc.name   AuthenticateErrCodeCheck_1000
     * @tc.number AuthenticateErrCodeCheck_1000
     * @tc.desc   401 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1000 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start selectAccountsByOptions");
      try {
        let data = await appAccountManager.selectAccountsByOptions(undefined);
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
     * @tc.name   AuthenticateErrCodeCheck_1100
     * @tc.number AuthenticateErrCodeCheck_1100
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1100 "
      console.info(tag + "start====");
      let ownerName = '';
      for (let i = 0; i < 1025; i++) {
        ownerName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start createAccountImplicitly");
      appAccountManager.createAccountImplicitly(ownerName, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_1200
     * @tc.number AuthenticateErrCodeCheck_1200
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1200 "
      console.info(tag + "start====");
      let ownerName = '';
      for (let i = 0; i < 1024; i++) {
        ownerName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start createAccountImplicitly");
      appAccountManager.createAccountImplicitly(ownerName, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_1300
     * @tc.number AuthenticateErrCodeCheck_1300
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1300 "
      console.info(tag + "start====");
      let accountName = 'i';
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          "age": "18"
        }
      };
      console.info(tag + "start createAccountImplicitly");
      appAccountManager.createAccountImplicitly(accountName, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
          console.info(tag + "====>onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_1400
     * @tc.number AuthenticateErrCodeCheck_1400
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1400 "
      console.info(tag + "start====");
      let accountName = '';
      let appAccountManager = account.createAppAccountManager();
      let options: account.CreateAccountImplicitlyOptions = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          "age": "18"
        }
      };
      console.info(tag + "start createAccountImplicitly");
      appAccountManager.createAccountImplicitly(accountName, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
          console.info(tag + "====>onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_1500
     * @tc.number AuthenticateErrCodeCheck_1500
     * @tc.desc   12300007 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1500 "
      console.info(tag + "start====");
      let appAccountManager = account.createAppAccountManager();
      let setOptions: account.SetPropertiesOptions = {
        properties : { prop1 : "remove", prop2 : "createNewAccountName"}
      };
      console.info(tag + "start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner_stage, setOptions, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).assertEqual(0);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "start createAccountImplicitly");
          appAccountManager.createAccountImplicitly(owner_stage, {
            onResult: async (resultCode, resultData: account.AuthResult) => {
              console.info(tag + "resultcode:" + JSON.stringify(resultCode));
              try {
                expect(resultCode).assertEqual(0);
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
              console.info(tag + "start createAccountImplicitly again");
              appAccountManager.createAccountImplicitly(owner_stage, {
                onResult: async (resultCode, resultData: account.AuthResult) => {
                  console.info(tag + "resultcode:" + JSON.stringify(resultCode));
                  try {
                    expect(resultCode).assertEqual(12300007);
                  } catch (err) {
                    console.info(tag + "Assert Fail: " + JSON.stringify(err));
                  }
                  done();
                },
                onRequestRedirected: null
              });
            },
            onRequestRedirected: null
          });
        },
        onRequestRedirected: null,
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_1600
     * @tc.number AuthenticateErrCodeCheck_1600
     * @tc.desc   12300007 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1600 "
      console.info(tag + "start====");

      let appAccountManager = account.createAppAccountManager();
      let setOptions: account.SetPropertiesOptions = {
        properties : { prop1 : "remove", prop2 : "createNewAccountName"}
      };
      let createOptions: account.CreateAccountImplicitlyOptions = {
        authType: "PIN", requiredLabels: ['male', '30-40'], parameters: {
          "age": "18"
        }
      };
      console.info(tag + "start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner_stage, setOptions, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          try {
            expect(resultCode).assertEqual(0);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          console.info(tag + "start createAccountImplicitly");
          appAccountManager.createAccountImplicitly(owner_stage, createOptions, {
            onResult: async (resultCode, resultData: account.AuthResult) => {
              console.info(tag + "resultcode:" + JSON.stringify(resultCode));
              try {
                expect(resultCode).assertEqual(0);
              } catch (err) {
                console.info(tag + "Assert Fail: " + JSON.stringify(err));
              }
              console.info(tag + "start createAccountImplicitly again");
              appAccountManager.createAccountImplicitly(owner_stage, createOptions, {
                onResult: async (resultCode, resultData: account.AuthResult) => {
                  console.info(tag + "resultcode:" + JSON.stringify(resultCode));
                  try {
                    expect(resultCode).assertEqual(12300007);
                  } catch (err) {
                    console.info(tag + "Assert Fail: " + JSON.stringify(err));
                  }
                  done();
                },
                onRequestRedirected: null
              });
            },
            onRequestRedirected: null
          });
        },
        onRequestRedirected: null,
      });
    });


    /**
     * @tc.name   AuthenticateErrCodeCheck_1700
     * @tc.number AuthenticateErrCodeCheck_1700
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1700 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 513; i++) {
        name += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start auth");
      appAccountManager.auth(name, fakeOwner, "getSocialData", {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_1800
     * @tc.number AuthenticateErrCodeCheck_1800
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1800 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start auth");
      appAccountManager.auth(name, fakeOwner, "getSocialData", {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_1900
     * @tc.number AuthenticateErrCodeCheck_1900
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_1900 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info(tag + "start auth");
      appAccountManager.auth(name, fakeOwner, "getSocialData", options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_2000
     * @tc.number AuthenticateErrCodeCheck_2000
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2000 "
      console.info(tag + "start====");
      let name = '';
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info(tag + "start auth");
      appAccountManager.auth(name, fakeOwner, "getSocialData", options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
          console.info(tag + "====>onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_2100
     * @tc.number AuthenticateErrCodeCheck_2100
     * @tc.desc   12300003 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2100 "
      console.info(tag + "start====");
      let name = 'notExistAccount';
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start auth");
      appAccountManager.auth(name, owner_stage, "getSocialData", {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300003);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info(tag + "====>onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_2200
     * @tc.number AuthenticateErrCodeCheck_2200
     * @tc.desc   12300003 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2200 "
      console.info(tag + "start====");
      let name = 'notExistAccount';
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info(tag + "start auth");
      appAccountManager.auth(name, owner_stage, "getSocialData", options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300003);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info(tag + "====>onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_2300
     * @tc.number AuthenticateErrCodeCheck_2300
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2300 "
      console.info(tag + "start====");
      let ownerName = '';
      for (let i = 0; i < 1025; i++) {
        ownerName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start queryAuthenticatorInfo");
      appAccountManager.queryAuthenticatorInfo(ownerName, (err, data) => {
        console.info(tag + "err:" + JSON.stringify(err));
        console.info(tag + "data:" + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_2400
     * @tc.number AuthenticateErrCodeCheck_2400
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2400 "
      console.info(tag + "start====");
      let ownerName = '';
      for (let i = 0; i < 1025; i++) {
        ownerName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start queryAuthenticatorInfo");
        let data = await appAccountManager.queryAuthenticatorInfo(ownerName);
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
     * @tc.name   AuthenticateErrCodeCheck_2500
     * @tc.number AuthenticateErrCodeCheck_2500
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2500 "
      console.info(tag + "start====");
      let ownerName = '';
      for (let i = 0; i < 1024; i++) {
        ownerName += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start queryAuthenticatorInfo");
      appAccountManager.queryAuthenticatorInfo(ownerName, (err, data) => {
        console.info(tag + "err:" + JSON.stringify(err));
        console.info(tag + "data:" + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300113);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_2600
     * @tc.number AuthenticateErrCodeCheck_2600
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2600 "
      console.info(tag + "start====");
      let ownerName = '';
      for (let i = 0; i < 1024; i++) {
        ownerName += 'i';
      }
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start queryAuthenticatorInfo");
        let data = await appAccountManager.queryAuthenticatorInfo(ownerName);
        console.info(tag + "data: " + JSON.stringify(data));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300113);
        done();
      }
    });



    ///////


    /**
     * @tc.name   AuthenticateErrCodeCheck_2700
     * @tc.number AuthenticateErrCodeCheck_2700
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2700 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 513; i++) {
        name += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start verifyCredential");
      appAccountManager.verifyCredential(name, fakeOwner, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_2800
     * @tc.number AuthenticateErrCodeCheck_2800
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2800 "
      console.info(tag + "start====");
      let name = '';
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info(tag + "start verifyCredential");
      appAccountManager.verifyCredential(name, fakeOwner, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
          console.info(tag + "====>onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_2900
     * @tc.number AuthenticateErrCodeCheck_2900
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2900 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start verifyCredential");
      appAccountManager.verifyCredential(name, fakeOwner, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_3000
     * @tc.number AuthenticateErrCodeCheck_3000
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_3000 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info(tag + "start verifyCredential");
      appAccountManager.verifyCredential(name, fakeOwner, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_3100
     * @tc.number AuthenticateErrCodeCheck_3100
     * @tc.desc   12300003 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_3100 "
      console.info(tag + "start====");
      let name = 'notExistAccount';
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start verifyCredential");
      appAccountManager.verifyCredential(name, owner_stage, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300003);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info(tag + "====>onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_3200
     * @tc.number AuthenticateErrCodeCheck_3200
     * @tc.desc   12300003 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_2200 "
      console.info(tag + "start====");
      let name = 'notExistAccount';
      let appAccountManager = account.createAppAccountManager();
      let options: Record<string, Object> = {
        "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
      };
      console.info(tag + "start verifyCredential");
      appAccountManager.verifyCredential(name, owner_stage, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
          console.info(tag + "resultcode:" + JSON.stringify(resultCode));
          console.info(tag + "resultData:" + JSON.stringify(resultData));
          try {
            expect(resultCode).assertEqual(12300003);
          } catch (err) {
            console.info(tag + "Assert Fail: " + JSON.stringify(err));
          }
          done();
        },
        onRequestRedirected: null,
        onRequestContinued: () => {
          console.info(tag + "====>onRequestContinued");
        }
      });
    });


    /**
     * @tc.name   AuthenticateErrCodeCheck_3300
     * @tc.number AuthenticateErrCodeCheck_3300
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_3300 "
      console.info(tag + "start====");
      let owner = '';
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_3400
     * @tc.number AuthenticateErrCodeCheck_3400
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_3400 "
      console.info(tag + "start====");
      let owner = '';
      for (let i = 0; i < 1025; i++) {
        owner += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties : { prop1 : "value1", prop2 : "value2"}
      };
      console.info(tag + "start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
          console.info(tag + "====>onRequestContinued");
        }
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_3500
     * @tc.number AuthenticateErrCodeCheck_3500
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_3500 "
      console.info(tag + "start====");
      let owner = '';
      for (let i = 0; i < 1024; i++) {
        owner += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_3600
     * @tc.number AuthenticateErrCodeCheck_3600
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_3600 "
      console.info(tag + "start====");
      let owner = 'i';
      let appAccountManager = account.createAppAccountManager();
      let options: account.SetPropertiesOptions = {
        properties : { prop1 : "value1", prop2 : "value2"}
      };
      console.info(tag + "start setAuthenticatorProperties");
      appAccountManager.setAuthenticatorProperties(owner, options, {
        onResult: async (resultCode, resultData: account.AuthResult) => {
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
     * @tc.name   AuthenticateErrCodeCheck_3700
     * @tc.number AuthenticateErrCodeCheck_3700
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_3700 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 513; i++) {
        name += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAccountLabels");
      appAccountManager.checkAccountLabels(name, fakeOwner, ['level4'], (err, data) => {
        console.info(tag + "err:" + JSON.stringify(err));
        console.info(tag + "data:" + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_3800
     * @tc.number AuthenticateErrCodeCheck_3800
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_3800 "
      console.info(tag + "start====");
      let name = '';
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start checkAccountLabels");
        let ret = await appAccountManager.checkAccountLabels(name, fakeOwner, ['20-30']);
        console.info(tag + "data: " + JSON.stringify(ret));
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
     * @tc.name   AuthenticateErrCodeCheck_3900
     * @tc.number AuthenticateErrCodeCheck_3900
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_3900 "
      console.info(tag + "start====");
      let name = '';
      for (let i = 0; i < 512; i++) {
        name += 'i';
      }
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAccountLabels");
      appAccountManager.checkAccountLabels(name, fakeOwner, ['level4'], (err, data) => {
        console.info(tag + "err:" + JSON.stringify(err));
        console.info(tag + "data:" + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300113);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_4000
     * @tc.number AuthenticateErrCodeCheck_4000
     * @tc.desc   12300113 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_4000 "
      console.info(tag + "start====");
      let name = 'i';
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start checkAccountLabels");
        let ret = await appAccountManager.checkAccountLabels(name, fakeOwner, ['20-30']);
        console.info(tag + "data: " + JSON.stringify(ret));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300113);
        done();
      }
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_4100
     * @tc.number AuthenticateErrCodeCheck_4100
     * @tc.desc   12300003 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_4100 "
      console.info(tag + "start====");
      let name = "notExistAccount";
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start checkAccountLabels");
      appAccountManager.checkAccountLabels(name, owner_stage, ['level4'], (err, data) => {
        console.info(tag + "err:" + JSON.stringify(err));
        console.info(tag + "data:" + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300003);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_4200
     * @tc.number AuthenticateErrCodeCheck_4200
     * @tc.desc   12300003 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_4200 "
      console.info(tag + "start====");
      let name = "notExistAccount";
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start checkAccountLabels");
        let ret = await appAccountManager.checkAccountLabels(name, owner_stage, ['20-30']);
        console.info(tag + "data: " + JSON.stringify(ret));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300003);
        done();
      }
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_4300
     * @tc.number AuthenticateErrCodeCheck_4300
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_4300 "
      console.info(tag + "start====");
      let labelArray: Array<string> = [];
      for (let i = 0; i < 1025; i++) {
        labelArray.push('label'+i);
      }
      let select_options: account.SelectAccountsOptions = {
        requiredLabels: labelArray
      };
      let appAccountManager = account.createAppAccountManager();
      console.info(tag + "start selectAccountsByOptions");
      appAccountManager.selectAccountsByOptions(select_options, (err, data) => {
        console.info(tag + "err:" + JSON.stringify(err));
        console.info(tag + "data:" + JSON.stringify(data));
        try {
          expect(err.code).assertEqual(12300002);
        } catch (err) {
          console.info(tag + "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
     * @tc.name   AuthenticateErrCodeCheck_4400
     * @tc.number AuthenticateErrCodeCheck_4400
     * @tc.desc   12300002 err code check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('AuthenticateErrCodeCheck_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let tag = "====>AuthenticateErrCodeCheck_4400 "
      console.info(tag + "start====");
      let ownerArray: Array<string> = [];
      for (let i = 0; i < 1025; i++) {
        ownerArray.push('owner'+i);
      }
      let select_options: account.SelectAccountsOptions = {
        allowedOwners:ownerArray
      };
      try {
        let appAccountManager = account.createAppAccountManager();
        console.info(tag + "start selectAccountsByOptions");
        let ret = await appAccountManager.selectAccountsByOptions(select_options);
        console.info(tag + "data: " + JSON.stringify(ret));
        expect().assertFail();
        done();
      } catch (err) {
        console.info(tag + "catch err: " + JSON.stringify(err));
        console.info(tag + "end====");
        expect(err.code).assertEqual(12300002);
        done();
      }
    });
  })
}
