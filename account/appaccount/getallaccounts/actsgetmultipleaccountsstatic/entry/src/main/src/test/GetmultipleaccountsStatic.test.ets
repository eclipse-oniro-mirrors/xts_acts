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
import { describe, beforeAll, afterEach, it, expect, TestType, Hypium, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let tag: string = 'testTag';
let gContext: common.UIAbilityContext;

export default function ActsGetMultipleAccountsStatic() {
  describe('ActsGetMultipleAccountsStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");
    
    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, '====>beforeAll start====');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.getmultipleaccountstest.static");
      await Utils.msSleep(2000);
      let want: Want = {
        deviceId: "",
        bundleName: "com.example.actsaccountaccessiblefirst",
        abilityName: "com.example.actsaccountaccessiblefirst.MainAbility",
        action: "action1"
      }
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
     * @tc.number     ActsgetAllAccounts_0100
     * @tc.name       ActsgetAllAccounts_0100
     * @tc.desc       This application adds multiple account, other applications authorizes multiple accounts to this
     *                 application and this application obtains authorization, getAllAccounts promise
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL0
     */
    it('ActsgetAllAccounts_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsGetMultipleAccounts_0100 start====");
        let dataMap: Map<string, string> = new Map<string, string>();
        hilog.info(0x0000, tag, "====>add first account 0100 start====");
        await accountManager.createAccount("accessibleAccount_this_application_first");
        hilog.info(0x0000, tag, "====>add second account 0100 start====");
        await accountManager.createAccount("accessibleAccount_this_application_second");
        hilog.info(0x0000, tag, "====>add third account 0100 start====");
        await accountManager.createAccount("accessibleAccount_this_application_third");
        hilog.info(0x0000, tag, "====>getAllAccounts 0100 start====");
        let data: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
        hilog.info(0x0000, tag, "====>getAllAccounts 0100 data: " + JSON.stringify(data));
        hilog.info(0x0000, tag, "====>data.length: " + data.length);
        for (let i: int = 0; i < data.length; i++) {
          if (data[i]) {
            dataMap.set(data[i]!.name, data[i]!.owner);
          }
        }
        expect(dataMap.has("account_name_scene_first_first")).assertTrue();
        if (dataMap.has("account_name_scene_first_first")) {
          let data: string | undefined = dataMap.get("account_name_scene_first_first");
          hilog.info(0x0000, tag, "====>first account owner is: " + data);
          expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
        }
        expect(dataMap.has("account_name_scene_first_second")).assertTrue();
        if (dataMap.has("account_name_scene_first_second")) {
          let data: string | undefined = dataMap.get("account_name_scene_first_second");
          hilog.info(0x0000, tag, "====>second account owner is: " + data);
          expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
        }
        expect(dataMap.has("account_name_scene_second_first")).assertTrue();
        if (dataMap.has("account_name_scene_second_first")) {
          let data: string | undefined = dataMap.get("account_name_scene_second_first");
          hilog.info(0x0000, tag, "====>third account owner is: " + data);
          expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
        }
        expect(dataMap.has("account_name_scene_second_second")).assertTrue();
        if (dataMap.has("account_name_scene_second_second")) {
          let data: string | undefined = dataMap.get("account_name_scene_second_second");
          hilog.info(0x0000, tag, "====>fourth account owner is: " + data);
          expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
        }
        expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
        if (dataMap.has("accessibleAccount_this_application_first")) {
          let data: string | undefined = dataMap.get("accessibleAccount_this_application_first");
          hilog.info(0x0000, tag, "====>fifth account owner is: " + data);
          expect(data).assertEqual("com.example.getmultipleaccountstest.static");
        }
        expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
        if (dataMap.has("accessibleAccount_this_application_second")) {
          let data: string | undefined = dataMap.get("accessibleAccount_this_application_second");
          hilog.info(0x0000, tag, "====>sixth account owner is: " + data);
          expect(data).assertEqual("com.example.getmultipleaccountstest.static");
        }
        expect(dataMap.has("accessibleAccount_this_application_third")).assertTrue();
        if (dataMap.has("accessibleAccount_this_application_third")) {
          let data: string | undefined = dataMap.get("accessibleAccount_this_application_third");
          hilog.info(0x0000, tag, "====>seventh account owner is: " + data);
          expect(data).assertEqual("com.example.getmultipleaccountstest.static");
        }
        hilog.info(0x0000, tag, "====>remove account start====");
        await accountManager.removeAccount("accessibleAccount_this_application_first");
        await accountManager.removeAccount("accessibleAccount_this_application_second");
        await accountManager.removeAccount("accessibleAccount_this_application_third");
        hilog.info(0x0000, tag, "====>ActsgetAllAccounts_0100 end====");
        done();
      });

    /**
     * @tc.number     ActsgetAllAccounts_0200
     * @tc.name       ActsgetAllAccounts_0200
     * @tc.desc       This application adds multiple account, other applications authorizes multiple accounts to this
     *                 application and this application obtains authorization, getAllAccounts callback
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL0
     */
    it('ActsgetAllAccounts_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsgetAllAccounts_0200 start====");
        let dataMap: Map<string, string> = new Map<string, string>();
        hilog.info(0x0000, tag, "====>add first account 0200 start====");
        await accountManager.createAccount("accessibleAccount_this_application_first");
        hilog.info(0x0000, tag, "====>add second account 0200 start====");
        await accountManager.createAccount("accessibleAccount_this_application_second");
        hilog.info(0x0000, tag, "====>add third account 0200 start====");
        await accountManager.createAccount("accessibleAccount_this_application_third");
        hilog.info(0x0000, tag, "====>getAllAccounts 0200 start====");
        try {
          accountManager.getAllAccounts((err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
            hilog.info(0x0000, tag, "====>getAllAccounts 0200 err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>getAllAccounts 0200 data: " + data);
            try {
              if (data) {
                hilog.info(0x0000, tag, "====>data.length: " + data.length);
                for (let i: int = 0; i < data.length; i++) {
                  if (data[i]) {
                    dataMap.set(data[i]!.name, data[i]!.owner);
                  }
                }
                expect(dataMap.has("account_name_scene_first_first")).assertTrue();
                if (dataMap.has("account_name_scene_first_first")) {
                  let data: string | undefined = dataMap.get("account_name_scene_first_first");
                  hilog.info(0x0000, tag, "====>first account owner is: " + data);
                  expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
                }
                expect(dataMap.has("account_name_scene_first_second")).assertTrue();
                if (dataMap.has("account_name_scene_first_second")) {
                  let data: string | undefined = dataMap.get("account_name_scene_first_second");
                  hilog.info(0x0000, tag, "====>second account owner is: " + data);
                  expect(data).assertEqual("com.example.actsaccountaccessiblefirst");
                }
                expect(dataMap.has("account_name_scene_second_first")).assertTrue();
                if (dataMap.has("account_name_scene_second_first")) {
                  let data: string | undefined = dataMap.get("account_name_scene_second_first");
                  hilog.info(0x0000, tag, "====>third account owner is: " + data);
                  expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
                }
                expect(dataMap.has("account_name_scene_second_second")).assertTrue();
                if (dataMap.has("account_name_scene_second_second")) {
                  let data: string | undefined = dataMap.get("account_name_scene_second_second");
                  hilog.info(0x0000, tag, "====>fourth account owner is: " + data);
                  expect(data).assertEqual("com.example.actsaccountaccessiblesecond");
                }
                expect(dataMap.has("accessibleAccount_this_application_first")).assertTrue();
                if (dataMap.has("accessibleAccount_this_application_first")) {
                  let data: string | undefined = dataMap.get("accessibleAccount_this_application_first");
                  hilog.info(0x0000, tag, "====>fifth account owner is: " + data);
                  expect(data).assertEqual("com.example.getmultipleaccountstest.static");
                }
                expect(dataMap.has("accessibleAccount_this_application_second")).assertTrue();
                if (dataMap.has("accessibleAccount_this_application_second")) {
                  let data: string | undefined = dataMap.get("accessibleAccount_this_application_second");
                  hilog.info(0x0000, tag, "====>sixth account owner is: " + data);
                  expect(data).assertEqual("com.example.getmultipleaccountstest.static");
                }
                expect(dataMap.has("accessibleAccount_this_application_third")).assertTrue();
                if (dataMap.has("accessibleAccount_this_application_third")) {
                  let data: string | undefined = dataMap.get("accessibleAccount_this_application_third");
                  hilog.info(0x0000, tag, "====>seventh account owner is: " + data);
                  expect(data).assertEqual("com.example.getmultipleaccountstest.static");
                }
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err:' + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>remove account start====");
            accountManager.removeAccount("accessibleAccount_this_application_first", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account Create_0100 err: " + JSON.stringify(err));
              accountManager.removeAccount("accessibleAccount_this_application_second", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account Create_0100 err: " + JSON.stringify(err));
                accountManager.removeAccount("accessibleAccount_this_application_third", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account Create_0100 err: " + JSON.stringify(err));
                  try {
                    expect(err).assertEqual(null);
                  } catch (err) {
                    hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                  }
                  hilog.info(0x0000, tag, "====>ActsgetAllAccounts_0200 end====");
                  done();
                });
              });
            });
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAllAccounts 0200 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  })
}
