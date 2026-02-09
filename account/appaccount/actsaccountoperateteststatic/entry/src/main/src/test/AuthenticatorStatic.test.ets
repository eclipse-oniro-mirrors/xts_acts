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
import { describe, beforeAll, beforeEach, it, expect, TestType, Hypium, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let tag: string = 'testTag';
let gContext: common.UIAbilityContext;

let NAMELIMIT: int = 512;
let LENGTHLIMIT: int = 1024;
let name: string = 'zhangsan'
let owner: string = 'com.acts.accountauthenticator'
let self_owner: string = 'com.example.actsaccountoperatetest.static'

export default function ActsAccountAuthenticatorStatic() {
  describe('ActsAccountAuthenticatorStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");

    let cData: Record<string, string> =  {}
    cData['age'] = '12'
    let createAccountOptions: account.CreateAccountOptions = {}
    createAccountOptions.customData = cData;

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsAccountAuthenticator beforeAll start====");
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actsaccountoperatetest.static");
      await Utils.msSleep(2000);
      let want: Want = {
        deviceId: "",
        bundleName: "com.acts.accountauthenticator",
        abilityName: "com.acts.accountauthenticator.MainAbility",
        action: "action1"
      }
      gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
      if (gContext) {
        hilog.info(0x0000, tag, "====>startAbilityForResult start");
        gContext.startAbilityForResult(want,
          (err: BusinessError<void> | null, data: common.AbilityResult | undefined): void => {
            hilog.info(0x0000, tag, "====>accountauthenticator startAbilityForResult err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>accountauthenticator startAbilityForResult data: " + data);
            hilog.info(0x0000, tag, "====>accountauthenticator beforeAll end====");
            done();
          });
      } else {
        hilog.error(0x0000, tag, '====>context is undefined====');
      }
    });

    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>afterEach start====");
      let accounts = await accountManager.getAccountsByOwner(self_owner);
      for (let i: int = 0; i < accounts.length; i++) {
        let localName = accounts[i].name
        if (localName == 'zhangsan') {
          await accountManager.removeAccount(localName);
        }
      }
      done();
    });

    /**
    * @tc.number     ActsAccountCheckAppAccess_0100
    * @tc.name       ActsAccountCheckAppAccess_0100
    * @tc.desc       checkAppAccess test Check App Access callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCheckAppAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0100 start====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0100 create_account_err: " + JSON.stringify(err));
          accountManager.checkAppAccess(name, owner,
            (err: BusinessError<void> | null, data: boolean | undefined): void => {
              hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0100 first_err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0100 first_data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  expect(data).assertEqual(false);
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              accountManager.setAppAccess(name, owner, true, (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>0100 enableAppAccess_err: " + JSON.stringify(err));
                accountManager.checkAppAccess(name, owner,
                  (err: BusinessError<void> | null, data: boolean | undefined): void => {
                    hilog.info(0x0000, tag, "====>0100 second_err: " + JSON.stringify(err));
                    try {
                      if (err) {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      } else {
                        if (data) {
                          expect(data).assertEqual(true);
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      }
                    } catch (err) {
                      hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                    }
                    accountManager.setAppAccess(name, owner, false, (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>CheckAppAccess_0100 setAppAccess err: " + JSON.stringify(err));
                      accountManager.checkAppAccess(name, owner,
                        (err: BusinessError<void> | null, data: boolean | undefined): void => {
                          hilog.info(0x0000, tag, "====>CheckAppAccess_0100 third_err: " + JSON.stringify(err));
                          try {
                            if (err) {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            } else {
                              expect(data).assertEqual(false);
                            }
                          } catch (err) {
                            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                          }
                          accountManager.removeAccount(name, (err: BusinessError<void> | null): void => {
                            hilog.info(0x0000, tag, "====>CheckAppAccess_0100 err: " + JSON.stringify(err));
                            hilog.info(0x0000, tag, "====>CheckAppAccess_0100 end====");
                            done();
                          });
                        });
                    });
                  });
              });
            });
        });
      });

    /**
    * @tc.number     ActsAccountCheckAppAccess_0200
    * @tc.name       ActsAccountCheckAppAccess_0200
    * @tc.desc       setAppAccess test Check App Access promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCheckAppAccess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0200 start====");
        try {
          await accountManager.createAccount(name, createAccountOptions);
          hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0200 add_account_success: ");
          let data: boolean = await accountManager.checkAppAccess(name, owner);
          hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0200 first_data: " + JSON.stringify(data));
          expect(data).assertEqual(false);
          await accountManager.setAppAccess(name, owner, true);
          hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0200 enableAppAccess_success");
          data = await accountManager.checkAppAccess(name, owner);
          hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0200 second_data: " + JSON.stringify(data));
          expect(data).assertEqual(true);
          await accountManager.setAppAccess(name, owner, false);
          hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0200 disabAppAccess_data: " + JSON.stringify(data));
          data = await accountManager.checkAppAccess(name, owner);
          hilog.info(0x0000, tag, "====>ActsAccountCheckAppAccess_0200 third_data: " + JSON.stringify(data));
          expect(data).assertEqual(false);
          await accountManager.removeAccount(name);
          hilog.info(0x0000, tag, '====>ActsAccountCheckAppAccess_0200 removeAccount_success');
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>ActsAccountCheckAppAccess_0100 removeAccount_err');
          expect().assertFail();
        }
        done();
      });


    /**
    * @tc.number     ActsAccountDeleteCredential_0100
    * @tc.name       ActsAccountDeleteCredential_0100
    * @tc.desc       getCredential test Delete Account Credential callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountDeleteCredential_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountDeleteCredential_0100 start====");
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>ActsAccountDeleteCredential_0100 create_account_err: " + JSON.stringify(err));
          accountManager.setCredential(name, "PIN", "credential1", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>DeleteCredential_0100 setAccountCredential_err: " + JSON.stringify(err));
            accountManager.getCredential(name, "PIN",
              (err: BusinessError<void> | null, data: string | undefined): void => {
                hilog.info(0x0000, tag, "====>DeleteCredential_0100 getCredential_err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>getAccountCredential_success: " + JSON.stringify(data));
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                }
                accountManager.deleteCredential(name, "PIN",
                  (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>Credential_0100 deleteCredential_err: " + JSON.stringify(err));
                    try {
                      expect(err).assertEqual(null);
                    } catch (err) {
                      hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                    }
                    accountManager.removeAccount(name, (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>delete Account DeleteCredential_0100 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>Credential_0100 end====");
                      done();
                    });
                  });
              });
          });
        });
      });

    /**
    * @tc.number     ActsAccountDeleteCredential_0200
    * @tc.name       ActsAccountDeleteCredential_0200
    * @tc.desc       setCredential test Delete Account Credential promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountDeleteCredential_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountDeleteCredential_0200 start====");
        try {
          await accountManager.createAccount(name, createAccountOptions);
          hilog.info(0x0000, tag, "====>ActsAccountDeleteCredential_0200 add_account_success");
          await accountManager.setCredential(name, "PIN", "credential2");
          hilog.info(0x0000, tag, "====>ActsAccountDeleteCredential_0200 setAccountCredential_success");
          let data: string = await accountManager.getCredential(name, "PIN");
          hilog.info(0x0000, tag, "====>0200 getAccountCredential_data: " + JSON.stringify(data));
          await accountManager.deleteCredential(name, "PIN");
          await accountManager.removeAccount(name);
          hilog.info(0x0000, tag, '====>ActsAccountDeleteCredential_0200 removeAccount_success');
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>ActsAccountDeleteCredential_0200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
  });
}