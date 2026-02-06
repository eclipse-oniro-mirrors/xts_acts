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
import { AccountErrCode } from './AccountErrCode.test'
import account from '@ohos.account.appAccount'
import { describe, beforeAll, beforeEach, it, expect, TestType, Hypium, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'

let tag: string = 'testTag';
let NAMELIMIT: int = 512;
let LENGTHLIMIT: int = 1024;

export default function ActsAccountCreateAccountStatic() {
  describe('ActsAccountCreateAccountStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");

    let cData: Record<string, string> =  {}
    cData['age'] = '12'
    let createAccountOptions: account.CreateAccountOptions = {}
    createAccountOptions.customData = cData;

    let dData: Record<string, string> =  {}
    dData['sex'] = 'male'
    let createAccountOptionsDiff: account.CreateAccountOptions = {}
    createAccountOptionsDiff.customData = dData;

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
    * @tc.number     ActsAccountCreateAccount_0100
    * @tc.name       ActsAccountCreateAccount_0100
    * @tc.desc       Add account in callback form without additional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountCreateAccount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0100 start====");
        accountManager.createAccount("account_name_callback_first", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account Create_0100 err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          accountManager.removeAccount("account_name_callback_first", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete Account Create_0100 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0100 end====");
            done();
          });
        });
      });

    /**
    * @tc.number     ActsAccountCreateAccount_0200
    * @tc.name       ActsAccountCreateAccount_0200
    * @tc.desc       Add account in promise form without additional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountCreateAccount_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0200 start====");
        hilog.info(0x0000, tag, "====>add account start====");
        try {
          await accountManager.createAccount("account_name_promise_first");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          hilog.info(0x0000, tag, "====>delete account Create_0200 start====");
          await accountManager.removeAccount("account_name_promise_first");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>delete account err: " + JSON.stringify(err));
        }
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0200 end====");
        done();
      });

    /**
    * @tc.number     ActsAccountCreateAccount_0300
    * @tc.name       ActsAccountCreateAccount_0300
    * @tc.desc       Add account in callback form with additional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountCreateAccount_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0300 start====");
        accountManager.createAccount("account_name_callback_second", createAccountOptions,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>add account Create_0300 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.removeAccount("account_name_callback_second", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account Create_0300 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0300 end====");
              done();
            });
          });
      });

    /**
    * @tc.number     ActsAccountCreateAccount_0400
    * @tc.name       ActsAccountCreateAccount_0400
    * @tc.desc       Add account in promise form with additional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountCreateAccount_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0400 start====");
        hilog.info(0x0000, tag, "====>add account start====");
        try {
          await accountManager.createAccount("account_name_promise_second", createAccountOptions);
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          hilog.info(0x0000, tag, "====>delete account Create_0400 start====");
          await accountManager.removeAccount("account_name_promise_second");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>delete account err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0400 end====");
        done();
      });


    /**
    * @tc.number     ActsAccountCreateAccount_0500
    * @tc.name       ActsAccountCreateAccount_0500
    * @tc.desc       Repeatedly add the same name account and the same additional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountCreateAccount_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0500 start====");
        accountManager.createAccount("account_name_callback_third", createAccountOptions,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>add account first time Create_0500 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.createAccount("account_name_callback_third", createAccountOptions,
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>add account second time Create_0500 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0500 AccountErrCode.JsErrCode: " +
                12300004);
                try {
                  if (err) {
                    expect(err?.code).assertEqual(12300004);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_name_callback_third", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account Create_0500 err: " + JSON.stringify(err));
                  try {
                    expect(err).assertEqual(null);
                  } catch (err) {
                    hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                  }
                  hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0500 end====");
                  done();
                });
              });
          });
      });

    /**
    * @tc.number     ActsAccountCreateAccount_0600
    * @tc.name       ActsAccountCreateAccount_0600
    * @tc.desc       Repeatedly add the same name account and the same additional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountCreateAccount_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0600 start====");
        hilog.info(0x0000, tag, "====>add account for the first time Create_0600====");
        await accountManager.createAccount("account_name_promise_third", createAccountOptions);
        hilog.info(0x0000, tag, "====>add account for the second time Create_0600 start====");
        try {
          await accountManager.createAccount("account_name_promise_third", createAccountOptions);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>add account for the second time 0600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300004);
          await accountManager.removeAccount("account_name_promise_third");
          hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0600 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountCreateAccount_0700
    * @tc.name       ActsAccountCreateAccount_0700
    * @tc.desc       The account name exceeds the length limit of 512 characters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0700 start====");
        let limitAccountName: string = '';
        for (let i: int = 0; i < NAMELIMIT + 1; i++) {
          limitAccountName += 't';
        }
        accountManager.createAccount(limitAccountName, createAccountOptions,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>add account Create_0700 err: " + JSON.stringify(err));
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
            hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0700 end====");
            done();
          });
      });

    /**
    * @tc.number     ActsAccountCreateAccount_0800
    * @tc.name       ActsAccountCreateAccount_0800
    * @tc.desc       The account name exceeds the length limit of 512 characters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0800 start====");
        let limitAccountName: string = '';
        for (let i: int = 0; i < NAMELIMIT + 1; i++) {
          limitAccountName += 'n';
        }
        try {
          await accountManager.createAccount(limitAccountName, createAccountOptions);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>add account Create_0800 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0800 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountCreateAccount_0900
    * @tc.name       ActsAccountCreateAccount_0900
    * @tc.desc       Additional information exceeds the length limit of 1024 characters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0900 start====");
        let limitAccountExtra: string = '';
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          limitAccountExtra += 't';
        }
        let cData: Record<string, string> =  {}
        cData['age'] = limitAccountExtra
        let option: account.CreateAccountOptions = {}
        option.customData = cData;
        accountManager.createAccount("account_name_callback_fifth", option, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account Create_0900 err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
              hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_0900 end====");
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
    * @tc.number     ActsAccountCreateAccount_1000
    * @tc.name       ActsAccountCreateAccount_1000
    * @tc.desc       Additional information exceeds the length limit of 1024 characters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1000 start====");
        let limitAccountExtra: string = ''
        for (let i: int = 0; i < LENGTHLIMIT + 1; i++) {
          limitAccountExtra += 'e';
        }
        let cData: Record<string, string> =  {}
        cData[limitAccountExtra] = '12'
        let option: account.CreateAccountOptions = {}
        option.customData = cData;
        try {
          await accountManager.createAccount("account_name_promise_fifth", option);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>add account Create_1000 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1000 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountCreateAccount_1100
    * @tc.name       ActsAccountCreateAccount_1100
    * @tc.desc       The account name is an empty string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1100 start====");
        accountManager.createAccount("", createAccountOptions, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account Create_1100 err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
              hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1100 end====");
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
    * @tc.number     ActsAccountCreateAccount_1200
    * @tc.name       ActsAccountCreateAccount_1200
    * @tc.desc       The account name is an empty string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1200 start====");
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1200 add account start====");
        try {
          await accountManager.createAccount("", createAccountOptions);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>add account Create_1200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1200 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountCreateAccount_1500
    * @tc.name       ActsAccountCreateAccount_1500
    * @tc.desc       The account name is a special character such as a space
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1500 start====");
        let specialStr = " ";
        try {
          accountManager.createAccount(specialStr, createAccountOptions, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>createAccount Create_1500 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1500 end====");
            accountManager.removeAccount(" ", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>removeAccount Create_1500 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              done();
            });
          });
        } catch (err) {
          err = err as BusinessError;
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     ActsAccountCreateAccount_1600
    * @tc.name       ActsAccountCreateAccount_1600
    * @tc.desc       The account name is a special character such as a space
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1600 start====");
        let specialStr = " ";
        try {
          await accountManager.createAccount(specialStr, createAccountOptions);
          await accountManager.removeAccount(specialStr);
          hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>createAccount Create_1600 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });


    /**
    * @tc.number     ActsAccountCreateAccount_1700
    * @tc.name       ActsAccountCreateAccount_1700
    * @tc.desc       The account name is a special string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1700 start====");
        let specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
        accountManager.createAccount(specialStr, createAccountOptions, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account Create_1700 err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          accountManager.removeAccount(specialStr, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete Account Create_1700 err" + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1700 end====");
            done();
          });
        });
      });

    /**
    * @tc.number     ActsAccountCreateAccount_1800
    * @tc.name       ActsAccountCreateAccount_1800
    * @tc.desc       The account name is a special string
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1800 start====");
        let specialStr = "#@$%^&*()_+!<>~?,./[]abcdefgABCDEFG1234567890";
        hilog.info(0x0000, tag, "====>add account Create_1800====");
        try {
          await accountManager.createAccount(specialStr, createAccountOptions);
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add Account Create_1800 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          hilog.info(0x0000, tag, "====>delete account Create_1800====");
          await accountManager.removeAccount(specialStr);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>delete account err: " + JSON.stringify(err));
        }
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_1800 end====");
        done();
      });

    /**
    * @tc.number     ActsAccountCreateAccount_2300
    * @tc.name       ActsAccountCreateAccount_2300
    * @tc.desc       Repeatedly add accounts with the same name and different additional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_2300 start====");
        accountManager.createAccount("account_name_callback_same", createAccountOptions,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>add account first time Create_2300 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.createAccount("account_name_callback_same", createAccountOptionsDiff,
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>add account second time Create_2300 err: " + JSON.stringify(err));
                try {
                  if (err) {
                    expect(err?.code).assertEqual(12300004);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_name_callback_same", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account Create_2300 err: " + JSON.stringify(err));
                  try {
                    expect(err).assertEqual(null);
                  } catch (err) {
                    hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                  }
                  hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_2300 end====");
                  done();
                });
              });
          });
      });

    /**
    * @tc.number     ActsAccountCreateAccount_2400
    * @tc.name       ActsAccountCreateAccount_2400
    * @tc.desc       Repeatedly add accounts with the same name and different additional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCreateAccount_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_2400 start====");
        hilog.info(0x0000, tag, "====>add account for the first time Create_2400====");
        await accountManager.createAccount("account_name_promise_same", createAccountOptions);
        hilog.info(0x0000, tag, "====>add account for the second time Create_2400====");
        try {
          await accountManager.createAccount("account_name_promise_same", createAccountOptionsDiff);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>add account for the second time err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300004);
          await accountManager.removeAccount("account_name_promise_same");
          hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_2400 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountCreateAccount_2500
    * @tc.name       ActsAccountCreateAccount_2500
    * @tc.desc       The account name reaches the limit of 512 characters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountCreateAccount_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_2500 start====");
        let limitName: string = '';
        for (let i: int = 0; i < NAMELIMIT; i++) {
          limitName += 't';
        }
        accountManager.createAccount(limitName, createAccountOptions, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account Create_2500 err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          accountManager.removeAccount(limitName, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete Account Create_2500 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_2500 end====");
            done();
          });
        });
      });

    /**
    * @tc.number     ActsAccountCreateAccount_2600
    * @tc.name       ActsAccountCreateAccount_2600
    * @tc.desc       The account name reaches the limit of 512 characters
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAccountCreateAccount_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_2600 start====");
        let nameLimit: string = '';
        for (let i: int = 0; i < NAMELIMIT; i++) {
          nameLimit += 't';
        }
        hilog.info(0x0000, tag, "====>add account Create_2600 start====");
        try {
          await accountManager.createAccount(nameLimit, createAccountOptions);
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account Create_2600 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          hilog.info(0x0000, tag, "====>delete account Create_2600 start====");
          await accountManager.removeAccount(nameLimit);
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>delete account err: " + JSON.stringify(err));
        }
        hilog.info(0x0000, tag, "====>ActsAccountCreateAccount_2600 end====");
        done();
      });
  })
}