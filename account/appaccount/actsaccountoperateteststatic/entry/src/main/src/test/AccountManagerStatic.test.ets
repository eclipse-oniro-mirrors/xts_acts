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

let tag: string = 'testTag';

export default function ActsAccountManagerStatic() {
  describe('ActsAccountManagerStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");

    beforeEach(
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>beforeEach start====");
        let accounts: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
        for (let i: int = 0; i < accounts.length; i++) {
          let localName: string = accounts[i].name;
          await accountManager.removeAccount(localName);
        }
        done();
      });

    /**
    * @tc.number     ActsAccountManager_0100
    * @tc.name       ActsAccountManager_0100
    * @tc.desc       Create two application account module objects, one object adds an application account,
    *                 the other object deletes the application account
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountManager_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountManager_0100 start====");
        let appAccountManagerTwo: account.AppAccountManager = account.createAppAccountManager();
        hilog.info(0x0000, tag, "====>appAccountManagerTwo create finish");
        accountManager.createAccount("creatappaccount_name_first", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountManager_0100 err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          appAccountManagerTwo.removeAccount("creatappaccount_name_first", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete Account ActsAccountManager_0100 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>ActsAccountManager_0100 end====");
            done();
          });
        });
      });

    /**
    * @tc.number     ActsAccountManager_0200
    * @tc.name       ActsAccountManager_0200
    * @tc.desc       Create two application account module objects, one object adds application accounts and
    *                 sets additional information, and the other object can obtain additional information of
    *                 the application account
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountManager_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountManager_0200 start====");
        let appAccountManagerTwo: account.AppAccountManager = account.createAppAccountManager();
        hilog.info(0x0000, tag, "====>appAccountManagerTwo create finish");
        accountManager.createAccount("name_second", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountManager_0200 err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          appAccountManagerTwo.setCustomData("name_second", "key_extra", "value_extra", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setAccountExtraInfo err: " + JSON.stringify(err));
            accountManager.getCustomData("name_second", "key_extra", (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>getAccountExtraInfo err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>getAccountExtraInfo data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data).assertEqual("value_extra");
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              appAccountManagerTwo.removeAccount("name_second", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>ActsAccountManager_0200 end====");
                done();
              });
            });
          });
        });
      });
  })
}