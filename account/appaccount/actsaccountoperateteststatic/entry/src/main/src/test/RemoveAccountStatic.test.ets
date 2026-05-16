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
let NAMELIMIT: int = 512;

export default function ActsAccountRemoveAccountStatic() {
  describe('ActsAccountRemoveAccountStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");

    let cData: Record<string, string> =  {}
    cData['age'] = '12'
    let createAccountOptions: account.CreateAccountOptions = {}
    createAccountOptions.customData = cData;

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
    * @tc.number     ActsAccountRemoveAccount_0100
    * @tc.name       ActsAccountRemoveAccount_0100
    * @tc.desc       Remove the added account in callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountRemoveAccount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0100 start====");
        accountManager.createAccount("removeAccount_name_callback_first", createAccountOptions,
          (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountRemoveAccount_0100 err: " + JSON.stringify(err));
          accountManager.removeAccount("removeAccount_name_callback_first", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete Account ActsAccountRemoveAccount_0100 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0100 end====");
            done();
          });
        });
      });

    /**
    * @tc.number     ActsAccountRemoveAccount_0200
    * @tc.name       ActsAccountRemoveAccount_0200
    * @tc.desc       Remove the added account in promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountRemoveAccount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0200 start====");
      hilog.info(0x0000, tag, "====>add account ActsAccountcreateAccount_0200 start====");
      await accountManager.createAccount("removeAccount_name_promise_first", createAccountOptions);
      try {
        await accountManager.removeAccount("removeAccount_name_promise_first");
        hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0200 end====");
      } catch (err) {
        err = err as BusinessError;
        hilog.error(0x0000, tag, "====>delete account ActsAccountRemoveAccount_0200 err: " + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

    /**
    * @tc.number     ActsAccountRemoveAccount_0300
    * @tc.name       ActsAccountRemoveAccount_0300
    * @tc.desc       Remove unadded account in callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountRemoveAccount_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0300 start====");
        accountManager.removeAccount("removeAccount_name_callback_second", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>delete Account ActsAccountRemoveAccount_0300 err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300003);
              hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0300 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number     ActsAccountRemoveAccount_0400
    * @tc.name       ActsAccountRemoveAccount_0400
    * @tc.desc       Remove unadded account in promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountRemoveAccount_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0400 start====");
      try {
        await accountManager.removeAccount("removeAccount_name_promise_second");
        hilog.info(0x0000, tag, "====>run err");
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(0x0000, tag, "====>delete account ActsAccountRemoveAccount_0400 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0400 end====");
      }
      done();
    });

    /**
    * @tc.number     ActsAccountRemoveAccount_0500
    * @tc.name       ActsAccountRemoveAccount_0500
    * @tc.desc       Remove the added account, the first time it can be deleted, the second time the deletion fails
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountRemoveAccount_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0500 start====");
        accountManager.createAccount("removeAccount_name_callback_third", createAccountOptions, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountRemoveAccount_0500 err: " + JSON.stringify(err));
          accountManager.removeAccount("removeAccount_name_callback_third", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete account first time  err: " + JSON.stringify(err));
            accountManager.removeAccount("removeAccount_name_callback_third", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account second time err: " + JSON.stringify(err));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300003);
                  hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0500 end====");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAccountRemoveAccount_0600
    * @tc.name       ActsAccountRemoveAccount_0600
    * @tc.desc       Remove the added account, the first time it can be deleted, the second time the deletion fails
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountRemoveAccount_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0600 start====");
      hilog.info(0x0000, tag, "====>add account ActsAccountcreateAccount_0600 start====");
      await accountManager.createAccount("removeAccount_name_promise_third", createAccountOptions);
      hilog.info(0x0000, tag, "====>delete Account first time ActsAccountRemoveAccount_0600 start====");
      await accountManager.removeAccount("removeAccount_name_promise_third");
      hilog.info(0x0000, tag, "====>delete Account second time ActsAccountRemoveAccount_0600 start====");
      try {
        await accountManager.removeAccount("removeAccount_name_promise_third");
        hilog.info(0x0000, tag, "====>run err");
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(0x0000, tag, "====>delete account ActsAccountRemoveAccount_0600 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300003);
        hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0600 end====");
      }
      done();
    });

    /**
    * @tc.number     ActsAccountRemoveAccount_0700
    * @tc.name       ActsAccountRemoveAccount_0700
    * @tc.desc       Remove the account name exceeds the length limit of 512 characters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountRemoveAccount_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0700 start====");
      let nameLimit: string = '';
      for (let i: int = 0; i < NAMELIMIT + 1; i++) {
        nameLimit += 't';
      }
      accountManager.removeAccount(nameLimit, (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, tag, "====>delete Account ActsAccountRemoveAccount_0700 err: " + JSON.stringify(err));
        try {
          if (err) {
            expect(err?.code).assertEqual(12300002);
            hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0700 end====");
          } else {
            hilog.info(0x0000, tag, "====>run err");
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
    * @tc.number     ActsAccountRemoveAccount_0800
    * @tc.name       ActsAccountRemoveAccount_0800
    * @tc.desc       Remove the account name exceeds the length limit of 512 characters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountRemoveAccount_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0800 start====");
      let nameLimit: string = '';
      for (let i: int = 0; i < NAMELIMIT + 1; i++) {
        nameLimit += 'n';
      }
      hilog.info(0x0000, tag, "====>delete Account ActsAccountRemoveAccount_0800 start====");
      try {
        await accountManager.removeAccount(nameLimit);
        hilog.info(0x0000, tag, "====>run err");
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(0x0000, tag, "====>delete account ActsAccountRemoveAccount_0800 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0800 end====");
      }
      done();
    })

    /**
    * @tc.number     ActsAccountRemoveAccount_0900
    * @tc.name       ActsAccountRemoveAccount_0900
    * @tc.desc       Remove the account name is an empty string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountRemoveAccount_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0900 start====");
      accountManager.removeAccount("", (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, tag, "====>delete Account ActsAccountRemoveAccount_0900 err: " + JSON.stringify(err));
        try {
          if (err) {
            expect(err?.code).assertEqual(12300002);
            hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_0900 end====");
          } else {
            hilog.info(0x0000, tag, "====>run err");
            expect().assertFail();
          }
        } catch (err) {
          hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
        }
        done();
      });
    });

    /**
    * @tc.number     ActsAccountRemoveAccount_1000
    * @tc.name       ActsAccountRemoveAccount_1000
    * @tc.desc       Remove the account name is an empty string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountRemoveAccount_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_1000 start====");
      hilog.info(0x0000, tag, "====>delete Account ActsAccountRemoveAccount_1000 start====");
      try {
        await accountManager.removeAccount("");
        hilog.info(0x0000, tag, "====>run err");
        expect().assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.info(0x0000, tag, "====>delete account ActsAccountRemoveAccount_1000 err: " + JSON.stringify(err));
        expect(err.code).assertEqual(12300002);
        hilog.info(0x0000, tag, "====>ActsAccountRemoveAccount_1000 end====");
      }
      done();
    })
  })
}
