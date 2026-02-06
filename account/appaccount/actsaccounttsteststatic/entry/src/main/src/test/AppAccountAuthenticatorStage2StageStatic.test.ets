/**
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
import Want from '@ohos.app.ability.Want';
import account from '@ohos.account.appAccount'
import { describe, beforeAll, afterEach, it, expect, TestType, Hypium, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let name: string = 'zhangsan'
let fakeOwner: string = 'com.acts.notExist'
let owner_stage: string = 'com.acts.accountauthenticator.static'
let tag: string = 'testTag';

hilog.info(0x0000, tag, "====>in testPage====");
let gContext: common.UIAbilityContext;

export default function AppAccountAuthenticatorStage2StageStatic() {
  describe('AppAccountAuthenticatorStage2StageStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage beforeAll start====");
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.accounttstest.static");
      await Utils.msSleep(2000);
      let wantInfo: Want = {
        deviceId: '',
        bundleName: 'com.acts.accountauthenticator.static',
        abilityName: 'EntryAbility',
        action: "action1"
      }
      hilog.info(0x0000, tag, '====>AppStorage get');
      gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      if (gContext) {
        hilog.info(0x0000, tag, "====>startAbilityForResult start");
        gContext.startAbilityForResult(wantInfo,
          (err: BusinessError<void> | null, data: common.AbilityResult | undefined): void => {
            hilog.info(0x0000, tag, "====>startAbilityForResult err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>startAbilityForResult result: " + data);
            done();
          });
        await Utils.msSleep(2000);
        hilog.info(0x0000, tag, "====>AppAccountAuthenticatorStage2StageStatic start findComponent to click");
        await Utils.clickRequestPermission('允许');
        await Utils.clickRequestPermission('本次允许');
        await Utils.clickRequestPermission('打开');
        await Utils.clickRequestPermission('本次打开');
      } else {
        hilog.error(0x0000, tag, '====>context is undefined====');
      }
    });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_0100
    * @tc.name       AppAccountAuthenticatorStage2Stage_0100
    * @tc.desc       test createAccountImplicitly callback without options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0100 start====");
        hilog.info(0x0000, tag, "====>start createAccountImplicitly");
        accountManager.createAccountImplicitly(owner_stage, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0100 resultcode: " + code);
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0100 result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(0);
              if (result) {
                if (result.account) {
                  let a: string = result!.account!.name;
                  let b: string = result!.account!.owner;
                  expect(a).assertEqual("createNewAccountName")
                  expect(b).assertEqual("com.acts.accountauthenticator.static")
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0100 onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_0200
    * @tc.name       AppAccountAuthenticatorStage2Stage_0200
    * @tc.desc       test createAccountImplicitly callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0200 start====");
        let cData: Record<string, RecordData> =  {}
        cData['prop1'] = 'remove';
        cData['prop2'] = 'createNewAccountName';
        let setOptions: account.SetPropertiesOptions = {}
        setOptions.properties = cData;
        let dData: Record<string, RecordData> =  {}
        dData['age'] = '18';
        let options: account.CreateAccountImplicitlyOptions = {
          authType: "PIN", requiredLabels: ['male', '30-40']
        };
        options.parameters = dData;
        hilog.info(0x0000, tag, "====>start setAuthenticatorProperties");
        accountManager.setAuthenticatorProperties(owner_stage, setOptions, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, "====>resultcode: " + code);
            try {
              expect(code).assertEqual(0);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>start createAccountImplicitly");
            accountManager.createAccountImplicitly(owner_stage, options, {
              onResult: (code: int, result?: account.AuthResult): void => {
                hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0200 resultcode: " + code);
                hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0200 result: " + JSON.stringify(result));
                try {
                  expect(code).assertEqual(0);
                  if (result) {
                    if (result.account) {
                      let a: string = result!.account!.name;
                      let b: string = result!.account!.owner;
                      expect(a).assertEqual("createNewAccountName")
                      expect(b).assertEqual("com.acts.accountauthenticator.static")
                    }
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                }
                done();
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
        });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_0300
    * @tc.name       AppAccountAuthenticatorStage2Stage_0300
    * @tc.desc       test auth callback without options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0300 start====");
        hilog.info(0x0000, tag, "====>start auth");
        accountManager.auth("0300", owner_stage, "getSocialData", {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0300 resultcode: " + code);
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0300 result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(0);
              if (result) {
                if (result.account && result.tokenInfo) {
                  let a: string = result!.account!.name;
                  let b: string = result!.account!.owner;
                  let c: string = result!.tokenInfo!.authType;
                  let d: string = result!.tokenInfo!.token;
                  let e: string = result!.tokenInfo!.account!.name;
                  let f: string = result!.tokenInfo!.account!.owner;
                  expect(a).assertEqual("0300");
                  expect(b).assertEqual("com.acts.accountauthenticator.static");
                  expect(c).assertEqual("getSocialData");
                  expect(d).assertEqual("xxxxxxxxx");
                  expect(e).assertEqual("0300");
                  expect(f).assertEqual("com.acts.accountauthenticator.static");
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0300 onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_0400
    * @tc.name       AppAccountAuthenticatorStage2Stage_0400
    * @tc.desc       test auth callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0400 start====");
        let options: Record<string, RecordData> = {
          "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
        };
        hilog.info(0x0000, tag, "====>start auth");
        accountManager.auth("0400", owner_stage, "getSocialData", options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0400 resultcode: " + code);
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0400 result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(0);
              if (result) {
                if (result.account && result.tokenInfo) {
                  let a: string = result!.account!.name;
                  let b: string = result!.account!.owner;
                  let c: string = result!.tokenInfo!.authType;
                  let d: string = result!.tokenInfo!.token;
                  expect(a).assertEqual("0400");
                  expect(b).assertEqual("com.acts.accountauthenticator.static");
                  expect(c).assertEqual("getSocialData");
                  expect(d).assertEqual("xxxxxxxxx");
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0400 onRequestContinued");
          }
        });
      });


    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_0500
    * @tc.name       AppAccountAuthenticatorStage2Stage_0500
    * @tc.desc       verifyCredential test auth callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0500 start====");
        hilog.info(0x0000, tag, "====>start verifyCredential");
        accountManager.verifyCredential(name, owner_stage, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0500 resultcode: " + code);
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0500 result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(0);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0500 verifyCredential_onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_0600
    * @tc.name       AppAccountAuthenticatorStage2Stage_0600 
    * @tc.desc       verifyCredential test auth callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0600 start====");
        let options: account.VerifyCredentialOptions = {
          credentialType: "PIN", credential: "123456"
        };
        hilog.info(0x0000, tag, "====>start verifyCredential");
        accountManager.verifyCredential(name, owner_stage, options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0600 resultcode: " + code);
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0600 result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(0);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0600 verifyCredential_onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_0700
    * @tc.name       AppAccountAuthenticatorStage2Stage_0700
    * @tc.desc       test setAuthenticatorProperties callback without options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0700 start====");
        hilog.info(0x0000, tag, "====>start setAuthenticatorProperties");
        accountManager.setAuthenticatorProperties(owner_stage, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag,
              "====>AuthenticatorStage2Stage_0700 resultcode: " + code);
            hilog.info(0x0000, tag,
              "====>AuthenticatorStage2Stage_0700 result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(10016);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0700 verifyCredential_onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_0800
    * @tc.name       AppAccountAuthenticatorStage2Stage_0800
    * @tc.desc       test setAuthenticatorProperties callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0800 start====");
        let cData: Record<string, RecordData> =  {}
        cData['prop1'] = 'value1';
        cData['prop2'] = 'value2';
        let options: account.SetPropertiesOptions = {}
        options.properties = cData;
        hilog.info(0x0000, tag, "====>start setAuthenticatorProperties");
        accountManager.setAuthenticatorProperties(owner_stage, options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0800 resultcode: " + code);
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0800 result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(10016);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0800 verifyCredential_onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_0900
    * @tc.name       AppAccountAuthenticatorStage2Stage_0900
    * @tc.desc       test checkAccountLabels callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0900 start====");
        hilog.info(0x0000, tag, "====>start checkAccountLabels");
        accountManager.checkAccountLabels(name, owner_stage, ['level4'],
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0900 err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_0900 data: " + data);
            try {
              expect(err).assertEqual(null);
              expect(data).assertTrue();
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_1000
    * @tc.name       AppAccountAuthenticatorStage2Stage_1000
    * @tc.desc       test checkAccountLabels promise with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1000 start====");
        try {
          hilog.info(0x0000, tag, "====>start checkAccountLabels");
          let ret: boolean = await accountManager.checkAccountLabels(name, owner_stage, ['20-30'])
          hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1000 ret: " + JSON.stringify(ret));
          expect(ret).assertFalse();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1000 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_1100
    * @tc.name       AppAccountAuthenticatorStage2Stage_1100
    * @tc.desc       test selectAccountsByOptions callback with allowedOwners
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1100 start====");
        let select_options: account.SelectAccountsOptions = {
          allowedOwners: [owner_stage]
        };
        hilog.info(0x0000, tag, "====>start selectAccountsByOptions");
        accountManager.selectAccountsByOptions(select_options,
          (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1100 err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1100 data: " + data);
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  expect(data?.length).assertEqual(3);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_1200
    * @tc.name       AppAccountAuthenticatorStage2Stage_1200
    * @tc.desc       test selectAccountsByOptions promise with requiredLabels
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1200 start====");
        let select_options: account.SelectAccountsOptions = {
          requiredLabels: ["male", "30-40"]
        };
        try {
          hilog.info(0x0000, tag, "====>start selectAccountsByOptions");
          let ret: Array<account.AppAccountInfo> = await accountManager.selectAccountsByOptions(select_options);
          hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1200 ret: " + JSON.stringify(ret));
          expect(ret[0].name).assertEqual("zhangsan");
          expect(ret[0].owner).assertEqual("com.acts.accountauthenticator.static");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1200 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_1300
    * @tc.name       AppAccountAuthenticatorStage2Stage_1300
    * @tc.desc       test queryAuthenticatorInfo callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1300 start====");
        hilog.info(0x0000, tag, "====>start queryAuthenticatorInfo");
        accountManager.queryAuthenticatorInfo(owner_stage,
          (err: BusinessError<void> | null, data: account.AuthenticatorInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1300 err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1300 data: " + data);
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  expect(data?.owner).assertEqual("com.acts.accountauthenticator.static");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountAuthenticatorStage2Stage_1400
    * @tc.name       AppAccountAuthenticatorStage2Stage_1400
    * @tc.desc       test queryAuthenticatorInfo promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountAuthenticatorStage2Stage_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1400 start====");
        try {
          hilog.info(0x0000, tag, "====>start queryAuthenticatorInfo");
          let ret: account.AuthenticatorInfo = await accountManager.queryAuthenticatorInfo(owner_stage)
          hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1400 ret: " + JSON.stringify(ret));
          expect(ret.owner).assertEqual("com.acts.accountauthenticator.static");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>AuthenticatorStage2Stage_1400 err: " + JSON.stringify(err));
          expect(err).assertEqual(null);
          done();
        }
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_1100
    * @tc.name       AuthenticateErrCodeCheck_1100
    * @tc.desc       12300002 err code check test interface createAccountImplicitly callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_1100 "
        hilog.info(0x0000, tag, logTag + "start====");
        let ownerName: string = '';
        for (let i: int = 0; i < 1025; i++) {
          ownerName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start createAccountImplicitly");
        accountManager.createAccountImplicitly(ownerName, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300002);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_1200
    * @tc.name       AuthenticateErrCodeCheck_1200
    * @tc.desc       12300113 err code check test interface createAccountImplicitly callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_1200 "
        hilog.info(0x0000, tag, logTag + "start====");
        let ownerName: string = '';
        for (let i: int = 0; i < 1024; i++) {
          ownerName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start createAccountImplicitly");
        accountManager.createAccountImplicitly(ownerName, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300113);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_1300
    * @tc.name       AuthenticateErrCodeCheck_1300
    * @tc.desc       12300113 err code check test interface CreateAccountImplicitlyOptions callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_1300 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = 'i';
        let dData: Record<string, RecordData> =  {}
        dData['age'] = '18';
        let options: account.CreateAccountImplicitlyOptions = {
          authType: "PIN", requiredLabels: ['male', '30-40']
        };
        options.parameters = dData;
        hilog.info(0x0000, tag, logTag + "start createAccountImplicitly");
        accountManager.createAccountImplicitly(accountName, options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300113);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "====>onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_1400
    * @tc.name       AuthenticateErrCodeCheck_1400
    * @tc.desc       12300002 err code check test interface CreateAccountImplicitlyOptions callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_1400 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        let dData: Record<string, RecordData> =  {}
        dData['age'] = '18';
        let options: account.CreateAccountImplicitlyOptions = {
          authType: "PIN", requiredLabels: ['male', '30-40']
        };
        options.parameters = dData;
        hilog.info(0x0000, tag, logTag + "start createAccountImplicitly");
        accountManager.createAccountImplicitly(accountName, options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300002);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "====>onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_1500
    * @tc.name       AuthenticateErrCodeCheck_1500
    * @tc.desc       12300007 err code check test interface createAccountImplicitly callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_1500 "
        hilog.info(0x0000, tag, logTag + "start====");
        let cData: Record<string, RecordData> =  {}
        cData['prop1'] = 'remove';
        cData['prop2'] = 'createNewAccountName';
        let setOptions: account.SetPropertiesOptions = {}
        setOptions.properties = cData;
        hilog.info(0x0000, tag, logTag + "start setAuthenticatorProperties");
        accountManager.setAuthenticatorProperties(owner_stage, setOptions, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            try {
              expect(code).assertEqual(0);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, logTag + "start createAccountImplicitly");
            accountManager.createAccountImplicitly(owner_stage, {
              onResult: (code: int, result?: account.AuthResult): void => {
                hilog.info(0x0000, tag, logTag + "resultcode: " + code);
                try {
                  expect(code).assertEqual(0);
                } catch (err) {
                  hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, logTag + "start createAccountImplicitly again");
                accountManager.createAccountImplicitly(owner_stage, {
                  onResult: (code: int, result?: account.AuthResult): void => {
                    hilog.info(0x0000, tag, logTag + "resultcode: " + code);
                    try {
                      expect(code).assertEqual(12300007);
                    } catch (err) {
                      hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
                    }
                    done();
                  },
                  onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>onRequestRedirected")
            }
                });
              },
              onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>onRequestRedirected")
            }
            });
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_1600
    * @tc.name       AuthenticateErrCodeCheck_1600
    * @tc.desc       12300007 err code check test interface CreateAccountImplicitlyOptions callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_1600 "
        hilog.info(0x0000, tag, logTag + "start====");
        let cData: Record<string, RecordData> =  {}
        cData['prop1'] = 'remove';
        cData['prop2'] = 'createNewAccountName';
        let setOptions: account.SetPropertiesOptions = {}
        setOptions.properties = cData;
        let dData: Record<string, RecordData> =  {}
        dData['age'] = '18';
        let createOptions: account.CreateAccountImplicitlyOptions = {
          authType: "PIN", requiredLabels: ['male', '30-40']
        };
        createOptions.parameters = dData;
        hilog.info(0x0000, tag, logTag + "start setAuthenticatorProperties");
        accountManager.setAuthenticatorProperties(owner_stage, setOptions, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            try {
              expect(code).assertEqual(0);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, logTag + "start createAccountImplicitly");
            accountManager.createAccountImplicitly(owner_stage, createOptions, {
              onResult: (code: int, result?: account.AuthResult): void => {
                hilog.info(0x0000, tag, logTag + "resultcode: " + code);
                try {
                  expect(code).assertEqual(0);
                } catch (err) {
                  hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, logTag + "start createAccountImplicitly again");
                accountManager.createAccountImplicitly(owner_stage, createOptions, {
                  onResult: (code: int, result?: account.AuthResult): void => {
                    hilog.info(0x0000, tag, logTag + "resultcode: " + code);
                    try {
                      expect(code).assertEqual(12300007);
                    } catch (err) {
                      hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
                    }
                    done();
                  },
                  onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>onRequestRedirected")
            }
                });
              },
              onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>onRequestRedirected")
            }
            });
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
        });
      });


    /**
    * @tc.number     AuthenticateErrCodeCheck_1700
    * @tc.name       AuthenticateErrCodeCheck_1700
    * @tc.desc       12300002 err code check test interface auth callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_1700 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 513; i++) {
          name += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start auth");
        accountManager.auth(name, fakeOwner, "getSocialData", {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300002);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_1800
    * @tc.name       AuthenticateErrCodeCheck_1800
    * @tc.desc       12300113 err code check test interface auth callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_1800 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 512; i++) {
          name += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start auth");
        accountManager.auth(name, fakeOwner, "getSocialData", {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300113);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_1900
    * @tc.name       AuthenticateErrCodeCheck_1900
    * @tc.desc       12300113 err code check test interface auth callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_1900 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 512; i++) {
          name += 'i';
        }
        let options: Record<string, RecordData> = {
          "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
        };
        hilog.info(0x0000, tag, logTag + "start auth");
        accountManager.auth(name, fakeOwner, "getSocialData", options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300113);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2000
    * @tc.name       AuthenticateErrCodeCheck_2000
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2000 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        let options: Record<string, RecordData> = {
          "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
        };
        hilog.info(0x0000, tag, logTag + "start auth");
        accountManager.auth(name, fakeOwner, "getSocialData", options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300002);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "====>onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2100
    * @tc.name       AuthenticateErrCodeCheck_2100
    * @tc.desc       12300003 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2100 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name1: string = 'notExistAccount';
        hilog.info(0x0000, tag, logTag + "start auth");
        accountManager.auth(name1, owner_stage, "getSocialData", {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300003);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "====>onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2200
    * @tc.name       AuthenticateErrCodeCheck_2200
    * @tc.desc       12300003 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2200 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name1: string = 'notExistAccount';
        let options: Record<string, RecordData> = {
          "authType": "PIN", "requiredLabels": ['male', '30-40'], "parameters": ['sex', 'age']
        };
        hilog.info(0x0000, tag, logTag + "start auth");
        accountManager.auth(name1, owner_stage, "getSocialData", options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300003);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "====>onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2300
    * @tc.name       AuthenticateErrCodeCheck_2300
    * @tc.desc       12300002 err code check test interface queryAuthenticatorInfo callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2300 "
        hilog.info(0x0000, tag, logTag + "start====");
        let ownerName: string = '';
        for (let i: int = 0; i < 1025; i++) {
          ownerName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start queryAuthenticatorInfo");
        accountManager.queryAuthenticatorInfo(ownerName,
          (err: BusinessError<void> | null, data: account.AuthenticatorInfo | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + data);
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2400
    * @tc.name       AuthenticateErrCodeCheck_2400
    * @tc.desc       12300002 err code check test interface queryAuthenticatorInfo promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2400 "
        hilog.info(0x0000, tag, logTag + "start====");
        let ownerName: string = '';
        for (let i: int = 0; i < 1025; i++) {
          ownerName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start queryAuthenticatorInfo");
          let data: account.AuthenticatorInfo = await accountManager.queryAuthenticatorInfo(ownerName);
          hilog.info(0x0000, tag, logTag + "data: " + data);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2500
    * @tc.name       AuthenticateErrCodeCheck_2500
    * @tc.desc       12300113 err code check test interface queryAuthenticatorInfo callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2500 "
        hilog.info(0x0000, tag, logTag + "start====");
        let ownerName: string = '';
        for (let i: int = 0; i < 1024; i++) {
          ownerName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start queryAuthenticatorInfo");
        accountManager.queryAuthenticatorInfo(ownerName,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300113);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2600
    * @tc.name       AuthenticateErrCodeCheck_2600
    * @tc.desc       12300113 err code check test interface queryAuthenticatorInfo promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2600 "
        hilog.info(0x0000, tag, logTag + "start====");
        let ownerName: string = '';
        for (let i: int = 0; i < 1024; i++) {
          ownerName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start queryAuthenticatorInfo");
          let data: account.AuthenticatorInfo = await accountManager.queryAuthenticatorInfo(ownerName);
          hilog.info(0x0000, tag, logTag + "data: " + data);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300113);
          done();
        }
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2700
    * @tc.name       AuthenticateErrCodeCheck_2700
    * @tc.desc       12300002 err code check test interface verifyCredential callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2700 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 513; i++) {
          name += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start verifyCredential");
        accountManager.verifyCredential(name, fakeOwner, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300002);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2800
    * @tc.name       AuthenticateErrCodeCheck_2800
    * @tc.desc       12300002 err code check test interface verifyCredential callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2800 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        let options: account.VerifyCredentialOptions = {
          credentialType: "PIN", credential: "123456"
        };
        hilog.info(0x0000, tag, logTag + "start verifyCredential");
        accountManager.verifyCredential(name, fakeOwner, options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300002);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "====>onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_2900
    * @tc.name       AuthenticateErrCodeCheck_2900
    * @tc.desc       12300113 err code check test interface verifyCredential callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2900 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 512; i++) {
          name += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start verifyCredential");
        accountManager.verifyCredential(name, fakeOwner, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300113);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_3000
    * @tc.name       AuthenticateErrCodeCheck_3000
    * @tc.desc       12300113 err code check test interface verifyCredential callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_3000 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 512; i++) {
          name += 'i';
        }
        let options: account.VerifyCredentialOptions = {
          credentialType: "PIN", credential: "123456"
        };
        hilog.info(0x0000, tag, logTag + "start verifyCredential");
        accountManager.verifyCredential(name, fakeOwner, options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300113);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_3100
    * @tc.name       AuthenticateErrCodeCheck_3100
    * @tc.desc       12300003 err code check test interface verifyCredential callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_3100 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name1: string = 'notExistAccount';
        hilog.info(0x0000, tag, logTag + "start verifyCredential");
        accountManager.verifyCredential(name1, owner_stage, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300003);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "====>onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_3200
    * @tc.name       AuthenticateErrCodeCheck_3200
    * @tc.desc       12300003 err code check test interface verifyCredential callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_2200 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name1: string = 'notExistAccount';
        let options: account.VerifyCredentialOptions = {
          credentialType: "PIN", credential: "123456"
        };
        hilog.info(0x0000, tag, logTag + "start verifyCredential");
        accountManager.verifyCredential(name1, owner_stage, options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300003);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "====>onRequestContinued");
          }
        });
      });


    /**
    * @tc.number     AuthenticateErrCodeCheck_3300
    * @tc.name       AuthenticateErrCodeCheck_3300
    * @tc.desc       12300002 err code check test interface setAuthenticatorProperties callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_3300 "
        hilog.info(0x0000, tag, logTag + "start====");
        let owner: string = '';
        hilog.info(0x0000, tag, logTag + "start setAuthenticatorProperties");
        accountManager.setAuthenticatorProperties(owner, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300002);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_3400
    * @tc.name       AuthenticateErrCodeCheck_3400
    * @tc.desc       12300002 err code check test interface setAuthenticatorProperties callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_3400 "
        hilog.info(0x0000, tag, logTag + "start====");
        let owner: string = '';
        for (let i: int = 0; i < 1025; i++) {
          owner += 'i';
        }
        let cData: Record<string, RecordData> =  {}
        cData['prop1'] = 'value1';
        cData['prop2'] = 'value2';
        let options: account.SetPropertiesOptions = {}
        options.properties = cData;
        hilog.info(0x0000, tag, logTag + "start setAuthenticatorProperties");
        accountManager.setAuthenticatorProperties(owner, options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300002);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "====>onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_3500
    * @tc.name       AuthenticateErrCodeCheck_3500
    * @tc.desc       12300113 err code check test interface setAuthenticatorProperties callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_3500 "
        hilog.info(0x0000, tag, logTag + "start====");
        let owner: string = '';
        for (let i: int = 0; i < 1024; i++) {
          owner += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start setAuthenticatorProperties");
        accountManager.setAuthenticatorProperties(owner, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300113);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_3600
    * @tc.name       AuthenticateErrCodeCheck_3600
    * @tc.desc       12300113 err code check test interface setAuthenticatorProperties callback with options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_3600 "
        hilog.info(0x0000, tag, logTag + "start====");
        let owner: string = 'i';
        let cData: Record<string, RecordData> =  {}
        cData['prop1'] = 'value1';
        cData['prop2'] = 'value2';
        let options: account.SetPropertiesOptions = {}
        options.properties = cData;
        hilog.info(0x0000, tag, logTag + "start setAuthenticatorProperties");
        accountManager.setAuthenticatorProperties(owner, options, {
          onResult: (code: int, result?: account.AuthResult): void => {
            hilog.info(0x0000, tag, logTag + "resultcode: " + code);
            hilog.info(0x0000, tag, logTag + "result: " + JSON.stringify(result));
            try {
              expect(code).assertEqual(12300113);
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          },
          onRequestRedirected: (request: Want): void => {
            hilog.info(0x0000, tag, "====>run in onRequestRedirected")
          },
          onRequestContinued: (): void => {
            hilog.info(0x0000, tag, logTag + "onRequestContinued");
          }
        });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_3700
    * @tc.name       AuthenticateErrCodeCheck_3700
    * @tc.desc       12300002 err code check test interface checkAccountLabels callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_3700 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 513; i++) {
          name += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start checkAccountLabels");
        accountManager.checkAccountLabels(name, fakeOwner, ['level4'],
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + data);
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_3800
    * @tc.name       AuthenticateErrCodeCheck_3800
    * @tc.desc       12300002 err code check test interface checkAccountLabels promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_3800 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        try {
          hilog.info(0x0000, tag, logTag + "start checkAccountLabels");
          let ret: boolean = await accountManager.checkAccountLabels(name, fakeOwner, ['20-30']);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(ret));
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_3900
    * @tc.name       AuthenticateErrCodeCheck_3900
    * @tc.desc       12300113 err code check test interface checkAccountLabels callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_3900 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = '';
        for (let i: int = 0; i < 512; i++) {
          name += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start checkAccountLabels");
        accountManager.checkAccountLabels(name, fakeOwner, ['level4'],
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + data);
            try {
              if (err) {
                expect(err?.code).assertEqual(12300113);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_4000
    * @tc.name       AuthenticateErrCodeCheck_4000
    * @tc.desc       12300113 err code check test interface checkAccountLabels promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_4000 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name: string = 'i';
        try {
          hilog.info(0x0000, tag, logTag + "start checkAccountLabels");
          let ret: boolean = await accountManager.checkAccountLabels(name, fakeOwner, ['20-30']);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(ret));
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300113);
          done();
        }
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_4100
    * @tc.name       AuthenticateErrCodeCheck_4100
    * @tc.desc       12300003 err code check test interface checkAccountLabels callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_4100 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name1: string = "notExistAccount";
        hilog.info(0x0000, tag, logTag + "start checkAccountLabels");
        accountManager.checkAccountLabels(name1, owner_stage, ['level4'],
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + data);
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_4200
    * @tc.name       AuthenticateErrCodeCheck_4200
    * @tc.desc       12300003 err code check test interface checkAccountLabels promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_4200 "
        hilog.info(0x0000, tag, logTag + "start====");
        let name1: string = "notExistAccount";
        try {
          hilog.info(0x0000, tag, logTag + "start checkAccountLabels");
          let ret: boolean = await accountManager.checkAccountLabels(name1, owner_stage, ['20-30']);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(ret));
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300003);
          done();
        }
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_4300
    * @tc.name       AuthenticateErrCodeCheck_4300
    * @tc.desc       12300002 err code check test interface selectAccountsByOptions callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_4300 "
        hilog.info(0x0000, tag, logTag + "start====");
        let labelArray: Array<string> = [];
        for (let i: int = 0; i < 1025; i++) {
          labelArray.push('label' + i);
        }
        let select_options: account.SelectAccountsOptions = {
          requiredLabels: labelArray
        };
        hilog.info(0x0000, tag, logTag + "start selectAccountsByOptions");
        accountManager.selectAccountsByOptions(select_options,
          (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + data);
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, logTag + "Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AuthenticateErrCodeCheck_4400
    * @tc.name       AuthenticateErrCodeCheck_4400
    * @tc.desc       12300002 err code check test interface selectAccountsByOptions promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AuthenticateErrCodeCheck_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AuthenticateErrCodeCheck_4400 "
        hilog.info(0x0000, tag, logTag + "start====");
        let ownerArray: Array<string> = [];
        for (let i: int = 0; i < 1025; i++) {
          ownerArray.push('owner' + i);
        }
        let select_options: account.SelectAccountsOptions = {
          allowedOwners: ownerArray
        };
        try {
          hilog.info(0x0000, tag, logTag + "start selectAccountsByOptions");
          let ret: Array<account.AppAccountInfo> = await accountManager.selectAccountsByOptions(select_options);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(ret));
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300002);
          done();
        }
      });
  })
}