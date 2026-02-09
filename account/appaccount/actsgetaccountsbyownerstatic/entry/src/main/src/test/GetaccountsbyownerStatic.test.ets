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
import account from '@ohos.account.appAccount'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { describe, beforeAll, Hypium, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import { AppStorage } from '@ohos.arkui.stateManagement'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let LENGTHLIMIT: int = 1024;
let SELFBUNDLE: string = 'com.example.actsgetaccountsbyowner.static'
let tag: string = 'testTag';

let gContext: common.UIAbilityContext;

export default function GetAccountsByOwnerStatic() {
  describe('GetAccountsByOwnerStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");

    let cData: Record<string, string> =  {}
    cData['age'] = '12'
    let createAccountOptions: account.CreateAccountOptions = {}
    createAccountOptions.customData = cData;

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>GetAccountsByOwnerStatic beforeAll start====");
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actsgetaccountsbyowner.static");
      await Utils.msSleep(2000);
      let want: Want = {
        deviceId: "",
        bundleName: "com.example.actsscenegetallaccounts",
        abilityName: "com.example.actsscenegetallaccounts.MainAbility",
        action: "action1"
      }
      hilog.info(0x0000, tag, '====>GetAccountsByOwnerStatic beforeAll start====');
      gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      if (gContext) {
        hilog.info(0x0000, tag, "====>startAbilityForResult start");
        gContext.startAbilityForResult(want, (err: BusinessError<void> | null, data: common.AbilityResult | undefined): void => {
          hilog.info(0x0000, tag, "====>beforeAll startAbilityForResult err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>beforeAll startAbilityForResult data: " + data);
          done();
        });
      } else {
        hilog.error(0x0000, tag, '====>context is undefined====');
      }
    });

    /**
    * @tc.number     GetAccountsByOwner_0100
    * @tc.name       GetAccountsByOwner_0100
    * @tc.desc       This application gets its own application information after adding an account,
    *                 getAccountsByOwner callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('GetAccountsByOwner_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_0100 start====");
        accountManager.createAccount("Account_this_application_callback", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 0100 err: " + JSON.stringify(err));
          accountManager.getAccountsByOwner(SELFBUNDLE, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
            hilog.info(0x0000, tag, "====>getAccountsByOwner 0100 err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>getAccountsByOwner 0100 data: " + data);
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  hilog.info(0x0000, tag, "====>getAccountsByOwner 0100 data0: " + JSON.stringify(data[0]));
                  let a: string = data[0].name;
                  let b: string = data[0].owner;
                  expect(a).assertEqual("Account_this_application_callback");
                  expect(b).assertEqual("com.example.actsgetaccountsbyowner.static");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
            }
            accountManager.removeAccount("Account_this_application_callback", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete account 0100 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>GetAccountsByOwner_0100 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     GetAccountsByOwner_0200
    * @tc.name       GetAccountsByOwner_0200
    * @tc.desc       This application gets its own application information after adding an account
    *                 getAccountsByOwner promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('GetAccountsByOwner_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_0200 start====");
        let acclist: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
        hilog.info(0x0000, tag, "====>account list length: " + acclist.length);
        if (acclist.length > 0) {
          for (let i: int = 0; i < acclist.length; i++) {
            await accountManager.removeAccount(acclist[i].name);
          }
        }
        hilog.info(0x0000, tag, "====>add account 0200 start====");
        await accountManager.createAccount("Account_this_application_promise");
        hilog.info(0x0000, tag, "====>getAccountsByOwner 0200 start====");
        try {
          let data: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0200 data0: " + JSON.stringify(data[0]));
          expect(data[0].name).assertEqual("Account_this_application_promise");
          expect(data[0].owner).assertEqual("com.example.actsgetaccountsbyowner.static");
          hilog.info(0x0000, tag, "====>delete account 0200 start====");
          await accountManager.removeAccount("Account_this_application_promise");
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_0200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAccountsByOwner 0200 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     GetAccountsByOwner_0300
    * @tc.name       GetAccountsByOwner_0300
    * @tc.desc       No account has been added to this application and it is not authorized by other applications to
    *                 obtain account information for this application, getAccountsByOwner callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_0300 start====");
        accountManager.getAccountsByOwner(SELFBUNDLE, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0300 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0300 data: " + data);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (data) {
                expect(data?.length).assertEqual(0);
                hilog.info(0x0000, tag, "====>GetAccountsByOwner_0300 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
              }
            }
          } catch (err) {
            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number     GetAccountsByOwner_0400
    * @tc.name       GetAccountsByOwner_0400
    * @tc.desc       No account has been added to this application and it is not authorized by other applications to
    *                 obtain account information for this application, getAccountsByOwner promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_0400 start====");
        try {
          let acclist: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
          hilog.info(0x0000, tag, "====>account list length: " + acclist.length);
          if (acclist.length > 0) {
            for (let i: int = 0; i < acclist.length; i++) {
              await accountManager.removeAccount(acclist[i].name);
            }
          }
          let data: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0400 data: " + data);
          expect(data.length).assertEqual(0);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_0400 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAccountsByOwner err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     GetAccountsByOwner_0500
    * @tc.name       GetAccountsByOwner_0500
    * @tc.desc       The parameter owner is an empty string, getAccountsByOwner callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_0500 start====");
        let emptyBundle: string = "";
        accountManager.getAccountsByOwner(emptyBundle, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0500 err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
              hilog.info(0x0000, tag, "====>GetAccountsByOwner_0500 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number     GetAccountsByOwner_0600
    * @tc.name       GetAccountsByOwner_0600
    * @tc.desc       The parameter owner is an empty string, getAccountsByOwner promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_0600 start====");
        let emptyBundle: string = "";
        try {
          await accountManager.getAccountsByOwner(emptyBundle);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_0600 end====");
          done();
        }
      });

    /**
    * @tc.number     GetAccountsByOwner_0700
    * @tc.name       GetAccountsByOwner_0700
    * @tc.desc       The parameter owner is a string that exceeds the length limit, getAccountsByOwner callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_0700 start====");
        let limitBundle = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          limitBundle += 't';
        }
        accountManager.getAccountsByOwner(limitBundle, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0700 err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
              hilog.info(0x0000, tag, "====>GetAccountsByOwner_0700 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number     GetAccountsByOwner_0800
    * @tc.name       GetAccountsByOwner_0800
    * @tc.desc       The parameter owner is a string that exceeds the length limit, getAccountsByOwner promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_0800 start====");
        let limitBundle = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          limitBundle += 'n';
        }
        try {
          await accountManager.getAccountsByOwner(limitBundle);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0800 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_0800 end====");
          done();
        }
      });

    /**
    * @tc.number     GetAccountsByOwner_0900
    * @tc.name       GetAccountsByOwner_0900
    * @tc.desc       After other applications authorize accounts to this application, this application obtains
    *                 information about its own application, getAccountsByOwner callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_0900 start====");
        await accountManager.createAccount("Account_application_callback");
        hilog.info(0x0000, tag, "====>getAccountsByOwner 0900 start====");
        accountManager.getAccountsByOwner(SELFBUNDLE, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0900 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>getAccountsByOwner 0900 data: " + data);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (data) {
                hilog.info(0x0000, tag, "====>GetAccountsByOwner_0900 data0: " + JSON.stringify(data[0]));
                let a: string = data[0].name;
                let b: string = data[0].owner;
                expect(a).assertEqual("Account_application_callback");
                expect(b).assertEqual("com.example.actsgetaccountsbyowner.static");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
          }
          accountManager.removeAccount("Account_application_callback", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete account 0900 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>GetAccountsByOwner_0900 end====");
            done();
          });
        });
      });

    /**
    * @tc.number     GetAccountsByOwner_1000
    * @tc.name       GetAccountsByOwner_1000
    * @tc.desc       After other applications authorize accounts to this application, this application obtains
    *                 information about its own application, getAccountsByOwner, getAccountsByOwner promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_1000 start====");
        hilog.info(0x0000, tag, "====>add account 1000 start====");
        await accountManager.createAccount("Account_application_promise");
        hilog.info(0x0000, tag, "====>getAccountsByOwner 1000 start====");
        try {
          let data: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
          hilog.info(0x0000, tag, "====>getAccountsByOwner 1000 data0: " + JSON.stringify(data[0]));
          expect(data[0].name).assertEqual("Account_application_promise");
          expect(data[0].owner).assertEqual("com.example.actsgetaccountsbyowner.static");
          hilog.info(0x0000, tag, "====>delete account 1000 start====");
          await accountManager.removeAccount("Account_application_promise");
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_1000 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAccountsByOwner 1000 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     GetAccountsByOwner_1100
    * @tc.name       GetAccountsByOwner_1100
    * @tc.desc       This application adds an account, and after other applications authorize an account to this
    *                 application, this application obtains the information of its own application, callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_1100 start====");
        let specifiedBundle = "com.example.actsscenegetallaccounts";
        hilog.info(0x0000, tag, "====>getAccountsByOwner 1100 start====");
        accountManager.getAccountsByOwner(specifiedBundle, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
          hilog.info(0x0000, tag, "====>getAccountsByOwner 1100 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>getAccountsByOwner 1100 data: " + data);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (data) {
                hilog.info(0x0000, tag, "====>GetAccountsByOwner_1100 data0: " + JSON.stringify(data[0]));
                let a: string = data[0].name;
                let b: string = data[0].owner;
                expect(a).assertEqual("account_name_scene_single");
                expect(b).assertEqual("com.example.actsscenegetallaccounts");
                hilog.info(0x0000, tag, "====>GetAccountsByOwner_1100 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number     GetAccountsByOwner_1200
    * @tc.name       GetAccountsByOwner_1200
    * @tc.desc       This application adds an account, and after other applications authorize an account to this
    *                 application, this application obtains the information of its own application, promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_1200 start====");
        let specifiedBundle = "com.example.actsscenegetallaccounts";
        hilog.info(0x0000, tag, "====>getAccountsByOwner 1200 start====");
        try {
          let data: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(specifiedBundle);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_1200 data0: " + JSON.stringify(data[0]));
          expect(data[0].name).assertEqual("account_name_scene_single");
          expect(data[0].owner).assertEqual("com.example.actsscenegetallaccounts");
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_1200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAccountsByOwner 1200 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     GetAccountsByOwner_1300
    * @tc.name       GetAccountsByOwner_1300
    * @tc.desc       The parameter owner is a bundlename that does not exist, callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_1300 start====");
        let nonexistentBundle: string = "com.example.actsgetallaccountsnonexistent";
        accountManager.getAccountsByOwner(nonexistentBundle, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
          hilog.info(0x0000, tag, "====>getAccountsByOwner 1300 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>getAccountsByOwner 1300 data: " + data);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (data) {
                expect(data?.length).assertEqual(0);
                hilog.info(0x0000, tag, "====>GetAccountsByOwner_1300 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number     GetAccountsByOwner_1400
    * @tc.name       GetAccountsByOwner_1400
    * @tc.desc       The parameter owner is a bundlename that does not exist, promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_1400 start====");
        let nonexistentBundle: string = "com.example.actsgetallaccountsnonexistent";
        try {
          let data: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(nonexistentBundle);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_1400 data: " + data);
          expect(data.length).assertEqual(0);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_1400 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAccountsByOwner 1400 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     GetAccountsByOwner_1500
    * @tc.name       GetAccountsByOwner_1500
    * @tc.desc       Get account information after adding and deleting account, callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_1500 start====");
        accountManager.createAccount("account_callback_delete", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 1500 err: " + JSON.stringify(err));
          accountManager.getAccountsByOwner(SELFBUNDLE, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
            hilog.info(0x0000, tag, "====>getAccountsByOwner 1500 err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>getAccountsByOwner 1500 data: " + data);
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  hilog.info(0x0000, tag, "====>GetAccountsByOwner_1500 data0: " + JSON.stringify(data[0]));
                  let a: string = data[0].name;
                  let b: string = data[0].owner;
                  expect(a).assertEqual("account_callback_delete");
                  expect(b).assertEqual("com.example.actsgetaccountsbyowner.static");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
            }
            accountManager.removeAccount("account_callback_delete", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete account 1500 err: " + JSON.stringify(err));
              accountManager.getAccountsByOwner(SELFBUNDLE, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
                hilog.info(0x0000, tag, "====>getAccountsByOwner 1500 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>getAccountsByOwner 1500 data: " + data);
                try {
                  if (err) {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  } else {
                    if (data) {
                      expect(data?.length).assertEqual(0);
                      hilog.info(0x0000, tag, "====>GetAccountsByOwner_1500 end====");
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  }
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                done();
              });
            });
          });
        });
      });

    /**
    * @tc.number     GetAccountsByOwner_1600
    * @tc.name       GetAccountsByOwner_1600
    * @tc.desc       Get account information after adding and deleting account, promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_1600 start====");
        let acclist: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
        hilog.info(0x0000, tag, "====>account list length: " + acclist.length);
        if (acclist.length > 0) {
          for (let i: int = 0; i < acclist.length; i++) {
            await accountManager.removeAccount(acclist[i].name);
          }
        }
        hilog.info(0x0000, tag, "====>add account 1600 start====");
        await accountManager.createAccount("account_promise_delete");
        hilog.info(0x0000, tag, "====>first getAccountsByOwner 1600 start====");
        try {
          let data: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_1600 data0: " + JSON.stringify(data[0]));
          expect(data[0].name).assertEqual("account_promise_delete");
          expect(data[0].owner).assertEqual("com.example.actsgetaccountsbyowner.static");
          hilog.info(0x0000, tag, "====>delete account 1600 start====");
          await accountManager.removeAccount("account_promise_delete");
          hilog.info(0x0000, tag, "====>second getAccountsByOwner 1600 start====");
          let dataDelete = await accountManager.getAccountsByOwner(SELFBUNDLE);
          expect(dataDelete.length).assertEqual(0);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_1600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAccountsByOwner 1600 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     GetAccountsByOwner_1700
    * @tc.name       GetAccountsByOwner_1700
    * @tc.desc       Get account information after adding an account with additional information and deleting an
    *                 account, callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_1700 start====");
        accountManager.createAccount("account_callback_additional", createAccountOptions, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 1700 err: " + JSON.stringify(err));
          accountManager.getAccountsByOwner(SELFBUNDLE, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
            hilog.info(0x0000, tag, "====>getAccountsByOwner 1700 err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>getAccountsByOwner 1700 data: " + data);
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  hilog.info(0x0000, tag, "====>GetAccountsByOwner_1700 data0: " + JSON.stringify(data[0]));
                  let a: string = data[0].name;
                  let b: string = data[0].owner;
                  expect(a).assertEqual("account_callback_additional");
                  expect(b).assertEqual("com.example.actsgetaccountsbyowner.static");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
            }
            accountManager.removeAccount("account_callback_additional", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete account 1700 err: " + JSON.stringify(err));
              accountManager.getAccountsByOwner(SELFBUNDLE, (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
                hilog.info(0x0000, tag, "====>getAccountsByOwner 1700 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>getAccountsByOwner 1700 data: " + data);
                try {
                  if (err) {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  } else {
                    if (data) {
                      expect(data?.length).assertEqual(0);
                      hilog.info(0x0000, tag, "====>GetAccountsByOwner_1700 end====");
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  }
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                done();
              });
            });
          });
        });
      });

    /**
    * @tc.number     GetAccountsByOwner_1800
    * @tc.name       GetAccountsByOwner_1800
    * @tc.desc       Get account information after adding an account with additional information and deleting an
    *                 account, promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('GetAccountsByOwner_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>GetAccountsByOwner_1800 start====");
        let acclist: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
        hilog.info(0x0000, tag, "====>account list length: " + acclist.length);
        if (acclist.length > 0) {
          for (let i: int = 0; i < acclist.length; i++) {
            await accountManager.removeAccount(acclist[i].name);
          }
        }
        hilog.info(0x0000, tag, "====>add account 1800 start====");
        await accountManager.createAccount("account_promise_additional", createAccountOptions);
        hilog.info(0x0000, tag, "====>first getAccountsByOwner 1800 start====");
        try {
          let data: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_1800 data0: " + JSON.stringify(data[0]));
          expect(data[0].name).assertEqual("account_promise_additional");
          expect(data[0].owner).assertEqual("com.example.actsgetaccountsbyowner.static");
          hilog.info(0x0000, tag, "====>delete account 1800 start====");
          await accountManager.removeAccount("account_promise_additional");
          hilog.info(0x0000, tag, "====>second getAccountsByOwner 1800 start====");
          let dataDelete: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(SELFBUNDLE);
          hilog.info(0x0000, tag, "====>second getAccountsByOwner 1800 data: " + data);
          expect(dataDelete.length).assertEqual(0);
          hilog.info(0x0000, tag, "====>GetAccountsByOwner_1800 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAccountsByOwner 1800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
  })
}
