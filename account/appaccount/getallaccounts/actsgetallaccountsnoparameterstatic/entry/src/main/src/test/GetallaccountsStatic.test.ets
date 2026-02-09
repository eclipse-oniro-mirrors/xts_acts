/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, afterEach, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base'
import { AppStorage } from '@ohos.arkui.stateManagement'
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let tag: string = 'testTag';

export default function ActsGetAllAccountsNoParameterStatic() {
  describe('ActsGetAllAccountsNoParameterStatic', () => {
    let accountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>accountmanager create finish====");

    beforeAll(() => {
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.getallaccountsnoparameter.static");
      await Utils.msSleep(2000);
      hilog.info(0x0000, tag, '%{public}s', 'beforeAll end');
    });

    /**
    * @tc.number     ActsGetAllAccountsNoParameter_0100
    * @tc.name       ActsGetAllAccountsNoParameter_0100
    * @tc.desc       This application has not added an account and has not been authorized by other applications to
    *                 obtain authorization, getAllAccounts callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL1
    */
    it('ActsGetAllAccountsNoParameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0100 start====");
        accountManager.getAllAccounts((err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
          hilog.info(0x0000, tag, "====>getAllAccounts 0100 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>getAllAccounts 0100 data: " + data);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (data) {
                hilog.info(0x0000, tag, "====>getAllAccounts 0100 data.length: " + data?.length);
                expect(data?.length).assertEqual(0);
                hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0100 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });
    /**
    * @tc.number     ActsGetAllAccountsNoParameter_0200
    * @tc.name       ActsGetAllAccountsNoParameter_0200
    * @tc.desc       This application has not added an account and has not been authorized by other applications to
    *                 obtain authorization, getAllAccounts promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL1
    */
    it('ActsGetAllAccountsNoParameter_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0200 start====");
        hilog.info(0x0000, tag, "====>getAllAccounts 0200 start====");
        try {
          let data: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
          hilog.info(0x0000, tag, "====>getAllAccounts 0200 data: " + data);
          hilog.info(0x0000, tag, "====>getAllAccounts 0200 data.length: " + data.length);
          expect(data.length).assertEqual(0);
          hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAllAccounts 0200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsGetAllAccountsNoParameter_0300
    * @tc.name       ActsGetAllAccountsNoParameter_0300
    * @tc.desc       This application gets authorization after adding a single account, getAllAccounts callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsGetAllAccountsNoParameter_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0300 start====");
        accountManager.createAccount("accessibleAccount_callback_single", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====> add account ActsGetAllAccountsNoParameter_0300 err: " + JSON.stringify(err));
          accountManager.getAllAccounts((err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
            hilog.info(0x0000, tag, "====>getAllAccounts 0300 err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>getAllAccounts 0300 data: " + data);
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (data) {
                  hilog.info(0x0000, tag, "====>getAllAccounts 0300 data.length: " + data?.length);
                  expect(data?.length).assertEqual(1);
                  let a: string = data[0].name;
                  let b: string = data[0].owner;
                  expect(a).assertEqual("accessibleAccount_callback_single");
                  expect(b).assertEqual("com.example.getallaccountsnoparameter.static");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
            }
            accountManager.removeAccount("accessibleAccount_callback_single", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>remove Account 0300 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0300 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsGetAllAccountsNoParameter_0400
    * @tc.name       ActsGetAllAccountsNoParameter_0400
    * @tc.desc       This application gets authorization after adding a single account, getAllAccounts promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsGetAllAccountsNoParameter_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0400 start====");
        try {
          let acclist: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
          hilog.info(0x0000, tag, "====>account list length: " + acclist.length);
          if (acclist.length > 0) {
            for (let i = 0; i < acclist.length; i++) {
              await accountManager.removeAccount(acclist[i].name);
            }
          }
          hilog.info(0x0000, tag, "====>add account ActsGetAllAccountsNoParameter_0400 start====");
          await accountManager.createAccount("accessibleAccount_promise_single");
          hilog.info(0x0000, tag, "====>getAllAccounts 0400 start====");
          let data: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
          hilog.info(0x0000, tag, "====>getAllAccounts 0400 data: " + data);
          hilog.info(0x0000, tag, "====>getAllAccounts 0400 data.length: " + data.length);
          expect(data[0].name).assertEqual("accessibleAccount_promise_single");
          expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter.static");
          await accountManager.removeAccount("accessibleAccount_promise_single");
          hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0400 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAllAccounts check data 0400 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsGetAllAccountsNoParameter_0500
    * @tc.name       ActsGetAllAccountsNoParameter_0500
    * @tc.desc       This application is added to obtain authorization after adding multiple application accounts
    *                 getAllAccounts callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsGetAllAccountsNoParameter_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0500 start====");
        await accountManager.createAccount("accessibleAccount_callback_first");
        hilog.info(0x0000, tag, "====>add second account 0500 start");
        await accountManager.createAccount("accessibleAccount_callback_second");
        hilog.info(0x0000, tag, "====>add third account 0500 start");
        await accountManager.createAccount("accessibleAccount_callback_third");
        hilog.info(0x0000, tag, "====>0600 start getAllAccounts");
        accountManager.getAllAccounts((err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
          hilog.info(0x0000, tag, "====>getAllAccounts 0500 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>getAllAccounts 0500 data: " + data);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (data) {
                hilog.info(0x0000, tag, "====>getAllAccounts 0500 data.length: " + data?.length);
                expect(data?.length).assertEqual(3);
                let a: string = data[0].name;
                let b: string = data[0].owner;
                let c: string = data[1].name;
                let d: string = data[1].owner;
                let e: string = data[2].name;
                let f: string = data[2].owner;
                expect(a).assertEqual("accessibleAccount_callback_first");
                expect(b).assertEqual("com.example.getallaccountsnoparameter.static");
                expect(c).assertEqual("accessibleAccount_callback_second");
                expect(d).assertEqual("com.example.getallaccountsnoparameter.static");
                expect(e).assertEqual("accessibleAccount_callback_third");
                expect(f).assertEqual("com.example.getallaccountsnoparameter.static");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
          }
          hilog.info(0x0000, tag, "====>remove first account 0500 start====");
          accountManager.removeAccount("accessibleAccount_callback_first", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete Account first err: " + JSON.stringify(err));
            accountManager.removeAccount("accessibleAccount_callback_second", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account second err: " + JSON.stringify(err));
              accountManager.removeAccount("accessibleAccount_callback_third", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account third err: " + JSON.stringify(err));
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0600 end====");
                done();
              });
            });
          });
        });
      });

    /**
    * @tc.number     ActsGetAllAccountsNoParameter_0600
    * @tc.name       ActsGetAllAccountsNoParameter_0600
    * @tc.desc       This application is added to obtain authorization after adding multiple application accounts
    *                 getAllAccounts promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsGetAllAccountsNoParameter_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0600 start====");
        hilog.info(0x0000, tag, "====>getAllAccounts for clean====");
        try {
          let acclist: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
          hilog.info(0x0000, tag, "====>account list length: " + acclist.length);
          if (acclist.length > 0) {
            for (let i = 0; i < acclist.length; i++) {
              await accountManager.removeAccount(acclist[i].name);
            }
          }
          hilog.info(0x0000, tag, "====>add first account 0600 start====");
          await accountManager.createAccount("accessibleAccount_promise_first");
          hilog.info(0x0000, tag, "====>add second account 0600 start====");
          await accountManager.createAccount("accessibleAccount_promise_second");
          hilog.info(0x0000, tag, "====>add third account 0600 start====");
          await accountManager.createAccount("accessibleAccount_promise_third");
          let data: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
          hilog.info(0x0000, tag, "====>getAllAccounts 0600 data: " + data);
          expect(data.length).assertEqual(3);
          expect(data[0].name).assertEqual("accessibleAccount_promise_first");
          expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter.static");
          expect(data[1].name).assertEqual("accessibleAccount_promise_second");
          expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter.static");
          expect(data[2].name).assertEqual("accessibleAccount_promise_third");
          expect(data[2].owner).assertEqual("com.example.getallaccountsnoparameter.static");
          hilog.info(0x0000, tag, "====>remove first account 0600 start====");
          await accountManager.removeAccount("accessibleAccount_promise_first");
          hilog.info(0x0000, tag, "====>remove second account 0600 start====");
          await accountManager.removeAccount("accessibleAccount_promise_second");
          hilog.info(0x0000, tag, "====>remove third account 0600 start====");
          await accountManager.removeAccount("accessibleAccount_promise_third");
          hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAllAccounts err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsGetAllAccountsNoParameter_0700
    * @tc.name       ActsGetAllAccountsNoParameter_0700
    * @tc.desc       This application adds different application accounts three times in a row, and obtains
    *                 authorization after deleting the account added for the second time, getAllAccounts callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsGetAllAccountsNoParameter_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0700 start====");
        hilog.info(0x0000, tag, "====>add first account 0700 start====");
        await accountManager.createAccount("accessibleAccount_callback_delete_first");
        hilog.info(0x0000, tag, "====>add second account 0700 start====");
        await accountManager.createAccount("accessibleAccount_callback_delete_second");
        hilog.info(0x0000, tag, "====>add third account 0700 start====");
        await accountManager.createAccount("accessibleAccount_callback_delete_third");
        hilog.info(0x0000, tag, "====>remove second account 0700 start====");
        await accountManager.removeAccount("accessibleAccount_callback_delete_second");
        accountManager.getAllAccounts((err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
          hilog.info(0x0000, tag, "====>getAllAccounts 0700 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>getAllAccounts 0700 data: " + data);
          try {
            if (err) {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            } else {
              if (data) {
                hilog.info(0x0000, tag, "====>getAllAccounts 0700 data.length: " + data?.length);
                expect(data?.length).assertEqual(2);
                let a: string = data[0].name;
                let b: string = data[0].owner;
                let c: string = data[1].name;
                let d: string = data[1].owner;
                expect(a).assertEqual("accessibleAccount_callback_delete_first");
                expect(b).assertEqual("com.example.getallaccountsnoparameter.static");
                expect(c).assertEqual("accessibleAccount_callback_delete_third");
                expect(d).assertEqual("com.example.getallaccountsnoparameter.static");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
          }
          accountManager.removeAccount("accessibleAccount_callback_delete_first", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete Account first err: " + JSON.stringify(err));
            accountManager.removeAccount("accessibleAccount_callback_delete_third", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account third err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0700 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsGetAllAccountsNoParameter_0800
    * @tc.name       ActsGetAllAccountsNoParameter_0800
    * @tc.desc       This application adds different application accounts three times in a row, and obtains
    *                 authorization after deleting the account added for the second time, getAllAccounts promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsGetAllAccountsNoParameter_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0800 start====");
        hilog.info(0x0000, tag, "====>getAllAccounts for clean====");
        try {
          let acclist: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
          hilog.info(0x0000, tag, "====>account list length: " + acclist.length);
          if (acclist.length > 0) {
            for (let i = 0; i < acclist.length; i++) {
              await accountManager.removeAccount(acclist[i].name);
            }
          }
          hilog.info(0x0000, tag, "====>add first account 0800 start====");
          await accountManager.createAccount("accessibleAccount_promise_first");
          hilog.info(0x0000, tag, "====>add second account 0800 start====");
          await accountManager.createAccount("accessibleAccount_promise_second");
          hilog.info(0x0000, tag, "====>add third account 0800 start====");
          await accountManager.createAccount("accessibleAccount_promise_third");
          hilog.info(0x0000, tag, "====>remove second account 0800 start====");
          await accountManager.removeAccount("accessibleAccount_promise_second");
          let data: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
          hilog.info(0x0000, tag, "====>getAllAccounts 0800 data: " + data);
          expect(data.length).assertEqual(2);
          expect(data[0].name).assertEqual("accessibleAccount_promise_first");
          expect(data[0].owner).assertEqual("com.example.getallaccountsnoparameter.static");
          expect(data[1].name).assertEqual("accessibleAccount_promise_third");
          expect(data[1].owner).assertEqual("com.example.getallaccountsnoparameter.static");
          hilog.info(0x0000, tag, "====>remove first account 0800 start====");
          await accountManager.removeAccount("accessibleAccount_promise_first");
          hilog.info(0x0000, tag, "====>remove third account 0800 start====");
          await accountManager.removeAccount("accessibleAccount_promise_third");
          hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_0800 end====");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAllAccounts err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     ActsGetAllAccountsNoParameter_1100
    * @tc.name       ActsGetAllAccountsNoParameter_1100
    * @tc.desc       This application adds an account, other application authorizes an account to this application
    *                 and this application obtains authorization, getAllAccounts promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsGetAllAccountsNoParameter_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_1100 start====");
        let gContext: common.UIAbilityContext;
        gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        hilog.info(0x0000, tag, "====>add account 1100 start====");
        await accountManager.createAccount("accessibleAccount_this_application");
        let want: Want = {
          deviceId: "",
          bundleName: "com.example.actsaccountsceneaccessible",
          abilityName: "com.example.actsaccountsceneaccessible.MainAbility",
          action: "action1"
        }
        if (gContext) {
          hilog.info(0x0000, tag, "====>startAbilityForResult start====");
          gContext.startAbilityForResult(want, (err: BusinessError<void> | null, data: common.AbilityResult | undefined): void => {
            hilog.info(0x0000, tag, "====>startAbilityForResult callback err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>startAbilityForResult callback data: " + data);
            accountManager.getAllAccounts().then((info: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>getAllAccounts 1100 data: " + info);
              try {
                if (info) {
                  hilog.info(0x0000, tag, "====>getAllAccounts 1100 data.length: " + info?.length);
                  expect(info?.length).assertEqual(2);
                  let a: string = info[0].name;
                  let b: string = info[0].owner;
                  let c: string = info[1].name;
                  let d: string = info[1].owner;
                  expect(a).assertEqual("account_name_scene_single");
                  expect(b).assertEqual("com.example.actsaccountsceneaccessible");
                  expect(c).assertEqual("accessibleAccount_this_application");
                  expect(d).assertEqual("com.example.getallaccountsnoparameter.static");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>remove account 1100 start====");
              accountManager.removeAccount("accessibleAccount_this_application", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account third err: " + JSON.stringify(err));
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, "====>ActsGetAllAccountsNoParameter_1100 end====");
                done();
              });
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, "====>getAllAccounts err: " + err);
              hilog.info(0x0000, tag, "====>getAllAccounts err code: " + err.code);
              expect().assertFail()
              done();
            });
          });
        } else {
          hilog.error(0x0000, tag, '====>context is undefined====');
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail()
          done();
        }
      });
  })
}
