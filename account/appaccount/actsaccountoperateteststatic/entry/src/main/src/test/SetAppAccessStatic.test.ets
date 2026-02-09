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
let STRCOUNT: int = 513;

export default function ActsAccountSetAppAccessStatic() {
  describe('ActsAccountSetAppAccessStatic', () => {
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
    * @tc.number     ActsAccountSetAppAccess_0100
    * @tc.name       ActsAccountSetAppAccess_0100
    * @tc.desc       Enable the app to access the app itself
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountSetAppAccess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0100 start====");
        accountManager.createAccount("AppAccess_callback_itself", createAccountOptions,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>add account SetAppAccess_0100 err: " + JSON.stringify(err));
            accountManager.setAppAccess("AppAccess_callback_itself", "com.example.actsaccountappaccess", true,
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>enableAppAccess err: " + JSON.stringify(err));
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("AppAccess_callback_itself", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account SetAppAccess_0100 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0100 end====");
                  done();
                });
              })
          })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_0200
    * @tc.name       ActsAccountSetAppAccess_0200
    * @tc.desc       Enable the app to access the app itself
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountSetAppAccess_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0200 start====");
        hilog.info(0x0000, tag, "====>add account SetAppAccess_0200 start====");
        await accountManager.createAccount("AppAccess_promise_itself", createAccountOptions);
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountSetAppAccess_0200 start====");
        try {
          await accountManager.setAppAccess("AppAccess_promise_itself", "com.example.actsaccountappaccess", true);
          hilog.info(0x0000, tag, "====>delete account SetAppAccess_0200 start====");
          await accountManager.removeAccount("AppAccess_promise_itself");
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>enableAppAccess 0200 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>delete account SetAppAccess_0200 start====");
          await accountManager.removeAccount("AppAccess_promise_itself");
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0200 end====");
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_0300
    * @tc.name       ActsAccountSetAppAccess_0300
    * @tc.desc       The enabled bundleName does not exist
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountSetAppAccess_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0300 start====");
        let nonExistBundle = "com.example.NonExistentBundleCallback";
        accountManager.createAccount("AppAccess_callback_NotExistBundle", createAccountOptions,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>add account SetAppAccess_0300 err: " + JSON.stringify(err));
            accountManager.setAppAccess("AppAccess_callback_NotExistBundle", nonExistBundle, true,
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>enableAppAccess 0300 err: " + JSON.stringify(err));
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("AppAccess_callback_NotExistBundle",
                  (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>delete Account SetAppAccess_0300 err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0300 end====");
                    done();
                  });
              })
          })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_0400
    * @tc.name       ActsAccountSetAppAccess_0400
    * @tc.desc       The enabled bundleName does not exist
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountSetAppAccess_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0400 start====");
        let nonExistBundle = "com.example.NonExistentBundlePromise";
        hilog.info(0x0000, tag, "====>add account SetAppAccess_0400 start====");
        await accountManager.createAccount("AppAccess_promise_NotExistBundle", createAccountOptions);
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountSetAppAccess_0400 start====");
        try {
          await accountManager.setAppAccess("AppAccess_promise_NotExistBundle", nonExistBundle, true);
          hilog.info(0x0000, tag, "====>delete account SetAppAccess_0400 start====");
          await accountManager.removeAccount("AppAccess_promise_NotExistBundle");
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0400 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>enableAppAccess ActsAccountSetAppAccess_0400 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>delete account SetAppAccess_0400 start====");
          await accountManager.removeAccount("AppAccess_promise_NotExistBundle");
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0400 end====");
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_0500
    * @tc.name       ActsAccountSetAppAccess_0500
    * @tc.desc       The enabled account name does not exist
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountSetAppAccess_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0500 start====");
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        let nonExistAccount = "NonExistentAccountCallback";
        accountManager.setAppAccess(nonExistAccount, enableBundle, true, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>enableAppAccess 0500 err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300003);
              hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0500 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_0600
    * @tc.name       ActsAccountSetAppAccess_0600
    * @tc.desc       The enabled account name does not exist
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountSetAppAccess_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0600 start====");
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        let nonExistAccount: string = "NonExistentAccountPromise";
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountSetAppAccess_0600 start====");
        try {
          await accountManager.setAppAccess(nonExistAccount, enableBundle, true);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>enableAppAccess 0600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0600 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_0700
    * @tc.name       ActsAccountSetAppAccess_0700
    * @tc.desc       Cancel the authorization after authorizing the account to another app
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountSetAppAccess_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0700 start====");
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        accountManager.createAccount("AppAccess_callback_account", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account SetAppAccess_0700 err: " + JSON.stringify(err));
          accountManager.setAppAccess("AppAccess_callback_account", enableBundle, true,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>enableAppAccess 0700 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              accountManager.setAppAccess("AppAccess_callback_account", enableBundle, false,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>disableAppAccess 0700 err: " + JSON.stringify(err));
                  try {
                    expect(err).assertEqual(null);
                  } catch (err) {
                    hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("AppAccess_callback_account",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>delete Account SetAppAccess_0700 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0700 end====");
                      done();
                    });
                })
            })
        })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_0800
    * @tc.name       ActsAccountSetAppAccess_0800
    * @tc.desc       Cancel the authorization after authorizing the account to another account
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountSetAppAccess_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0800 start====");
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        hilog.info(0x0000, tag, "====>add account SetAppAccess_0800 start====");
        try {
          await accountManager.createAccount("AppAccess_promise_account");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>createAccount SetAppAccess_0800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountSetAppAccess_0800 start====");
        try {
          await accountManager.setAppAccess("AppAccess_promise_account", enableBundle, true);
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>enableAppAccess ActsAccountSetAppAccess_0800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>disableAppAccess ActsAccountSetAppAccess_0800 start====");
        await accountManager.setAppAccess("AppAccess_promise_account", enableBundle, false);
        hilog.info(0x0000, tag, "====>delete account SetAppAccess_0800 start====");
        await accountManager.removeAccount("AppAccess_promise_account");
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0800 end====");
        done();
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_0900
    * @tc.name       ActsAccountSetAppAccess_0900
    * @tc.desc       The authorized account name is a long string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountSetAppAccess_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0900 start====");
        let bigAccountName: string = '';
        for (let i: int = 0; i < STRCOUNT; i++) {
          bigAccountName += 't';
        }
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        accountManager.setAppAccess(bigAccountName, enableBundle, true, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>enableAppAccess 0900 err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
              hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_0900 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1000
    * @tc.name       ActsAccountSetAppAccess_1000
    * @tc.desc       The authorized account name is a long string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountSetAppAccess_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1000 start====");
        let bigAccountName: string = '';
        for (let i: int = 0; i < STRCOUNT; i++) {
          bigAccountName += 't';
        }
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountSetAppAccess_1000 start====");
        try {
          await accountManager.setAppAccess(bigAccountName, enableBundle, true);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>enableAppAccess 1000 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1000 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1100
    * @tc.name       ActsAccountSetAppAccess_1100
    * @tc.desc       The authorized bundle name is a long string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountSetAppAccess_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1100 start====");
        let bigBundleName: string = '';
        for (let i: int = 0; i < STRCOUNT; i++) {
          bigBundleName += 't';
        }
        accountManager.createAccount("AppAccess_callback_bigBundleName", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account SetAppAccess_1100 err: " + JSON.stringify(err));
          accountManager.setAppAccess("AppAccess_callback_bigBundleName", bigBundleName, true,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>enableAppAccess 1100 err: " + JSON.stringify(err));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300002);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("AppAccess_callback_bigBundleName",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account SetAppAccess_1100 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1100 end====");
                  done();
                });
            })
        })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1200
    * @tc.name       ActsAccountSetAppAccess_1200
    * @tc.desc       The authorized bundle name is a long string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountSetAppAccess_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1200 start====");
        let bigBundleName: string = '';
        for (let i: int = 0; i < STRCOUNT; i++) {
          bigBundleName += 't';
        }
        hilog.info(0x0000, tag, "====>add account SetAppAccess_1200 start====");
        await accountManager.createAccount("AppAccess_promise_bigBundleName");
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountSetAppAccess_1200 start====");
        try {
          await accountManager.setAppAccess("AppAccess_promise_bigBundleName", bigBundleName, true);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>enableAppAccess 1200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account SetAppAccess_1200 start====");
          await accountManager.removeAccount("AppAccess_promise_bigBundleName");
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1200 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1300
    * @tc.name       ActsAccountSetAppAccess_1300
    * @tc.desc       The authorized account name is an empty string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountSetAppAccess_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1300 start====");
        let emptyBundleName: string = '';
        accountManager.createAccount("AppAccess_callback_emptyBundleName", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account SetAppAccess_1300 err: " + JSON.stringify(err));
          accountManager.setAppAccess("AppAccess_callback_emptyBundleName", emptyBundleName, true,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>enableAppAccess 1300 err: " + JSON.stringify(err));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300002);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("AppAccess_callback_emptyBundleName",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account SetAppAccess_1300 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1300 end====");
                  done();
                });
            })
        })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1400
    * @tc.name       ActsAccountSetAppAccess_1400
    * @tc.desc       The authorized account name is an empty string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountSetAppAccess_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1400 start====");
        let emptyBundleName: string = '';
        hilog.info(0x0000, tag, "====>add account SetAppAccess_1400 start====");
        await accountManager.createAccount("AppAccess_promise_emptyBundleName");
        hilog.info(0x0000, tag, "====>enableAppAccess ActsAccountSetAppAccess_1400 start====");
        try {
          await accountManager.setAppAccess("AppAccess_promise_emptyBundleName", emptyBundleName, true);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>enableAppAccess 1400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account SetAppAccess_1400 start====");
          await accountManager.removeAccount("AppAccess_promise_emptyBundleName");
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1400 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1500
    * @tc.name       ActsAccountSetAppAccess_1500
    * @tc.desc       Cancel authorization Accounts that have not authorized other applications
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountSetAppAccess_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1500 start====");
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        accountManager.createAccount("AppAccess_callback_account", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account SetAppAccess_1500 err: " + JSON.stringify(err));
          accountManager.setAppAccess("AppAccess_callback_account", enableBundle, false,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setAppAccess ActsAccountSetAppAccess_1500 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("AppAccess_callback_account", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account SetAppAccess_1500 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1500 end====");
                done();
              });
            })
        })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1600
    * @tc.name       ActsAccountSetAppAccess_1600
    * @tc.desc       Cancel authorization Accounts that have not authorized other applications
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountSetAppAccess_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1600 start====");
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        hilog.info(0x0000, tag, "====>add account SetAppAccess_1600 start====");
        try {
          await accountManager.createAccount("AppAccess_promise_account");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>createAccount SetAppAccess_1600 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>disableAppAccess ActsAccountSetAppAccess_1600 start====");
        try {
          await accountManager.setAppAccess("AppAccess_promise_account", enableBundle, false);
          await accountManager.removeAccount("AppAccess_promise_account");
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>disableAppAccess ActsAccountSetAppAccess_1800 err: " + JSON.stringify(err));
          await accountManager.removeAccount("AppAccess_promise_account");
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1700
    * @tc.name       ActsAccountSetAppAccess_1700
    * @tc.desc       The disableAppAccess parameter bundleName does not exist
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountSetAppAccess_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1700 start====");
        let notExistBundle: string = "com.example.actsaccountnotexistbundle";
        accountManager.createAccount("AppAccess_callback_notExistBundle", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account SetAppAccess_1700 err: " + JSON.stringify(err));
          accountManager.setAppAccess("AppAccess_callback_notExistBundle", notExistBundle, false,
            (err: BusinessError<void> | null): void => {
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("AppAccess_callback_notExistBundle",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account SetAppAccess_1700 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1700 end====");
                  done();
                });
            })
        })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1800
    * @tc.name       ActsAccountSetAppAccess_1800
    * @tc.desc       The disableAppAccess parameter bundleName does not exist
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountSetAppAccess_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1800 start====");
        let notExistBundle: string = "com.example.actsaccountnotexistbundle";
        hilog.info(0x0000, tag, "====>add account SetAppAccess_1800 start====");
        await accountManager.createAccount("AppAccess_promise_notExistBundle");
        hilog.info(0x0000, tag, "====>disableAppAccess ActsAccountSetAppAccess_1800 start====");
        try {
          await accountManager.setAppAccess("AppAccess_promise_notExistBundle", notExistBundle, false);
          hilog.info(0x0000, tag, "====>delete account SetAppAccess_1800 start====");
          await accountManager.removeAccount("AppAccess_promise_notExistBundle");
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>disableAppAccess ActsAccountSetAppAccess_1800 err: " + JSON.stringify(err));
          await accountManager.removeAccount("AppAccess_promise_account");
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_1900
    * @tc.name       ActsAccountSetAppAccess_1900
    * @tc.desc       The disableAppAccess parameter accountName does not exist
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountSetAppAccess_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1900 start====");
        let notExistAccount: string = "AppAccess_callback_notExistAccount";
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        hilog.info(0x0000, tag, "====>disableAppAccess ActsAccountSetAppAccess_1900====");
        accountManager.setAppAccess(notExistAccount, enableBundle, false, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>disableAppAccess ActsAccountSetAppAccess_1900 err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300003);
              hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_1900 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
          }
          done();
        })
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_2000
    * @tc.name       ActsAccountSetAppAccess_2000
    * @tc.desc       The disableAppAccess parameter accountName does not exist
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountSetAppAccess_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_2000 start====");
        let notExistAccount: string = "AppAccess_promise_notExistAccount";
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        hilog.info(0x0000, tag, "====>disableAppAccess ActsAccountSetAppAccess_2000====");
        try {
          await accountManager.setAppAccess(notExistAccount, enableBundle, false);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>disableAppAccess ActsAccountSetAppAccess_2000 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_2000 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAccountSetAppAccess_2100
    * @tc.name       ActsAccountSetAppAccess_2100
    * @tc.desc       Test errcode 12400005
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountSetAppAccess_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_2100 start====");
        hilog.info(0x0000, tag, "====>createAppAccountManager finish====");
        let appName: string = "setAppAccess2100";
        hilog.info(0x0000, tag, "====>createAccount SetAppAccess_2100 start====");
        await accountManager.createAccount(appName, createAccountOptions);
        let enableBundle: string = "com.example.actsaccountsceneappaccess";
        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_2100 start loop");
        for (let i: int = 1; i < 1025 - 1; i++) {
          await accountManager.setAppAccess(appName, enableBundle + String(i), true);
          hilog.info(0x0000, tag, "====>setAppAccess i: " + JSON.stringify(i));
        }
        hilog.info(0x0000, tag, "====>start setAppAccess callback 1024");
        accountManager.setAppAccess(appName, enableBundle + '1024', true,
          (err: BusinessError<void> | null, data: undefined): void => {
            hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_2100 setAppAccess err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.setAppAccess(appName, enableBundle + '1024', false,
              (err: BusinessError<void> | null, data: undefined): void => {
                hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_2100 setAppAccess err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>start setAppAccess promise 1024");
                accountManager.setAppAccess(appName, enableBundle + '1024', true).then(() => {
                  hilog.info(0x0000, tag, "====>start setAppAccess callback 1025");
                  accountManager.setAppAccess(appName, enableBundle + '1025', true,
                    (err: BusinessError<void> | null, data: undefined): void => {
                      hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_2100 setAppAccess err: " + JSON.stringify(err));
                      try {
                        if (err) {
                          expect(err?.code).assertEqual(12400005);
                        } else {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        }
                      } catch (err) {
                        hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                      }
                      hilog.info(0x0000, tag, "====>start setAppAccess promsie 1025");
                      accountManager.setAppAccess(appName, enableBundle + '1025', true).then(() => {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                        done();
                      }).catch((e: Error) => {
                        let err = e as BusinessError;
                        hilog.info(0x0000, tag, "====>setAppAccess promise 1025 true err: " + err);
                        hilog.info(0x0000, tag, "====>setAppAccess promise 1025 true err code: " + err.code);
                        expect(err.code).assertEqual(12400005);
                        hilog.info(0x0000, tag, "====>ActsAccountSetAppAccess_2100 end====");
                        done();
                      });
                    });
                }).catch((e: Error) => {
                  let err = e as BusinessError;
                  hilog.info(0x0000, tag, "====>setAppAccess failed, error: " + err);
                  hilog.info(0x0000, tag, "====>setAppAccess failed, error code: " + err.code);
                  expect().assertFail()
                  done()
                });
            });
          });
      });
  })
}