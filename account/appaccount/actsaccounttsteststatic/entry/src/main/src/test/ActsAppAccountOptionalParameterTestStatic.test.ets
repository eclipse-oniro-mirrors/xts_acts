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
import { BusinessError, RecordData } from '@ohos.base'
import Utils from './Util.test';
import Want from '@ohos.app.ability.Want';

let tag: string = 'testTag';

export default function ActsAppAccountOptionalParameterTestStatic() {
  describe('ActsAppAccountOptionalParameterTestStatic', () => {

    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");
    let name: string = 'zhangsan'
    let owner: string = 'com.example.accounttstest.static'

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
    * @tc.number     ActsAccountOptionalParameter_0100
    * @tc.name       ActsAccountOptionalParameter_0100
    * @tc.desc       createAccount in callback form without optional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_0100 start====");
        hilog.info(0x0000, tag, "====>create finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount Parameter_0100 err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          accountManager.removeAccount(name, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>delete Account Parameter_0100 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            hilog.info(0x0000, tag, "====>Parameter_0100 end====");
            done();
          });
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_0200
    * @tc.name       ActsAccountOptionalParameter_0200
    * @tc.desc       createAccount in promise form without optional information
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_0200 start====");
        try {
          await accountManager.createAccount(name);
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>createAccount fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        hilog.info(0x0000, tag, "====>delete account start====");
        await accountManager.removeAccount(name);
        hilog.info(0x0000, tag, "====>Parameter_0200 end====");
        done();
      });


    /**
    * @tc.number     ActsAccountOptionalParameter_0700
    * @tc.name       ActsAccountOptionalParameter_0700
    * @tc.desc       no customData callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_0700 start====");
        let createAccountOptions: account.CreateAccountOptions = {}
        accountManager.createAccount("account_name_callback_second", createAccountOptions,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>createAccount Parameter_0700 err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.removeAccount("account_name_callback_second",
              (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account Parameter_0700 err: " + JSON.stringify(err));
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, "====>Parameter_0700 end====");
                done();
              });
          });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_0800
    * @tc.name       ActsAccountOptionalParameter_0800
    * @tc.desc       no customData promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_0800 start====");
        let createAccountOptions: account.CreateAccountOptions = {}
        try {
          await accountManager.createAccount("account_name_promise_second", createAccountOptions);
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>createAccount fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        hilog.info(0x0000, tag, "====>delete account start====");
        await accountManager.removeAccount("account_name_promise_second");
        hilog.info(0x0000, tag, "====>Parameter_0800 end====");
        done();
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_1300
    * @tc.name       ActsAccountOptionalParameter_1300
    * @tc.desc       no option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_1300 start====");
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccountImplicitly("com.example.accounttstest.static", {
            onResult: (code: int): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_1300 resultcode: " + code);
                expect(code).assertEqual(12300113)
                hilog.info(0x0000, tag, "====>Parameter_1300 end====");
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_1300 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_1300 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_1300 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_1300 end====");
          expect().assertFail()
          done();
        }
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_1400
    * @tc.name       ActsAccountOptionalParameter_1400
    * @tc.desc       with option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_1400 start====");
        let cData: Record<string, RecordData> =  {}
        cData['sex'] = 'male'
        let options: account.CreateAccountImplicitlyOptions = {
          authType: "PIN", requiredLabels: ['male', '30-40']
        }
        options.parameters = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccountImplicitly("com.example.accounttstest.static", options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_1400 resultcode: " + code);
                expect(code).assertEqual(12300113);
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_1400 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_1400 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>Parameter_1400 onRequestContinued")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_1400 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_1400 end====");
          expect().assertFail()
          done();
        }
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_1700
    * @tc.name       ActsAccountOptionalParameter_1700
    * @tc.desc       empty option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_1700 start====");
        let options: account.CreateAccountImplicitlyOptions = {}
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccountImplicitly("com.example.accounttstest.static", options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_1700 resultcode: " + code);
                expect(code).assertEqual(12300113)
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_1700 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_1700 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>Parameter_1700 onRequestContinued")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_1700 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_1700 end====");
          expect().assertFail()
          done();
        }
      });


    /**
    * @tc.number     ActsAccountOptionalParameter_2000
    * @tc.name       ActsAccountOptionalParameter_2000
    * @tc.desc       authType options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_2000 start====");
        let options: account.CreateAccountImplicitlyOptions = {
          authType: "PIN"
        }
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccountImplicitly("com.example.accounttstest.static", options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_2000 resultcode: " + code);
                expect(code).assertEqual(12300113)
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_2000 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_2000 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>Parameter_2000 onRequestContinued")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_2000 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_2000 end====");
          expect().assertFail()
          done();
        }
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_2300
    * @tc.name       ActsAccountOptionalParameter_2300
    * @tc.desc       requiredLabels options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_2300 start====");
        let options: account.CreateAccountImplicitlyOptions = {
          requiredLabels: ['male', '30-40']
        }
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccountImplicitly("com.example.accounttstest.static", options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_2300 resultcode: " + code);
                expect(code).assertEqual(12300113)
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_2300 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_2300 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>Parameter_2300 onRequestContinued")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_2300 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_2300 end====");
          expect().assertFail()
          done();
        }
      });


    /**
    * @tc.number     ActsAccountOptionalParameter_2600
    * @tc.name       ActsAccountOptionalParameter_2600
    * @tc.desc       parameters options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_2600 start====");
        let cData: Record<string, RecordData> =  {}
        cData['sex'] = 'male'
        let options: account.CreateAccountImplicitlyOptions = {}
        options.parameters = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccountImplicitly("com.example.accounttstest.static", options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_2600 resultcode: " + code);
                expect(code).assertEqual(12300113)
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_2600 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_2600 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>Parameter_2600 onRequestContinued")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_2600 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_2600 end====");
          expect(null).assertFail()
          done();
        }
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_2900
    * @tc.name       ActsAccountOptionalParameter_2900
    * @tc.desc       authType&requiredLabels options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_2900 start====");
        let options: account.CreateAccountImplicitlyOptions = {
          requiredLabels: ['male', '30-40'], authType: "PIN"
        }
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccountImplicitly("com.example.accounttstest.static", options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_2900 resultcode: " + code);
                expect(code).assertEqual(12300113);
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_2900 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_2900 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>Parameter_2900 onRequestContinued")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_2900 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_2900 end====");
          expect().assertFail()
          done();
        }
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_3200
    * @tc.name       ActsAccountOptionalParameter_3200
    * @tc.desc       authType&parameters options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_3200 start====");
        let cData: Record<string, RecordData> =  {}
        cData['sex'] = 'male'
        let options: account.CreateAccountImplicitlyOptions = {
          authType: "PIN"
        }
        options.parameters = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccountImplicitly("com.example.accounttstest.static", options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_3200 resultcode: " + code);
                expect(code).assertEqual(12300113);
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_3200 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_3200 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>Parameter_3200 onRequestContinued")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_3200 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_3200 end====");
          expect().assertFail()
          done();
        }
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_3500
    * @tc.name       ActsAccountOptionalParameter_3500
    * @tc.desc       requiredLabels&parameters options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_3500 start====");
        let cData: Record<string, RecordData> =  {}
        cData['sex'] = 'male'
        let options: account.CreateAccountImplicitlyOptions = {
          requiredLabels: ['male', '30-40']
        }
        options.parameters = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccountImplicitly("com.example.accounttstest.static", options, {
            onResult: (code: int, result?: account.AuthResult): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_3500 resultcode: " + code);
                expect(code).assertEqual(12300113)
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_3500 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_3500 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>run in onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>Parameter_3500 onRequestContinued")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_3500 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_3500 end====");
          expect().assertFail()
          done();
        }
      });


    /**
    * @tc.number     ActsAccountOptionalParameter_3800
    * @tc.name       ActsAccountOptionalParameter_3800
    * @tc.desc       no option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_3800 start====");
        try {
          accountManager.auth("authenticate_test_account", "com.acts.accountauthenticator.static", "authType", {
            onResult: (code: int) => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_3800 auth code: " + code);
                expect(code).assertEqual(0);
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_3800 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_3800 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>onRequestRedirected")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_3800 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_3800 end====");
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_3900
    * @tc.name       ActsAccountOptionalParameter_3900
    * @tc.desc       empty option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_3900 start====");
        try {
          accountManager.auth("authenticate_test_account", "com.acts.accountauthenticator.static", "authType", {}, {
            onResult: (code: int, result?: account.AuthResult): void => {
              try {
                hilog.info(0x0000, tag, "====>Parameter_3900 authenticate code: " + code);
                hilog.info(0x0000, tag, "====>Parameter_3900 authenticate result: " + JSON.stringify(result));
                done();
              } catch (err) {
                hilog.info(0x0000, tag, "====>Parameter_3900 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>Parameter_3900 end====");
                done();
              }
            },
            onRequestRedirected: (request: Want): void => {
              hilog.info(0x0000, tag, "====>onRequestRedirected")
            },
            onRequestContinued: (): void => {
              hilog.info(0x0000, tag, "====>_onRequestContinued")
            }
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_3900 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>Parameter_3900 end====");
          expect().assertFail()
          done();
        }
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_4200
    * @tc.name       ActsAccountOptionalParameter_4200
    * @tc.desc       no option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_4200 start====");
        hilog.info(0x0000, tag, "====>start finish====");
        try {
          accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>Parameter_4200 add_account_err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.verifyCredential(name, owner, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_4200 verifyCredential_code: " + code);
                  expect(code).assertEqual(12300113)
                  hilog.info(0x0000, tag, "====>Parameter_4200 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_4200 err: " + JSON.stringify(err));
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>Parameter_4200 err: " + JSON.stringify(err));
          expect().assertFail()
          done()
        }
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_4300
    * @tc.name       ActsAccountOptionalParameter_4300
    * @tc.desc       with full option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_4300 start====");
        let cData: Record<string, RecordData> =  {}
        cData['sex'] = 'male'
        let options: account.VerifyCredentialOptions = {
          credentialType: "PIN", credential: "123456"
        }
        options.parameters = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_4300 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.verifyCredential(name, owner, options, {
              onResult: (code: int, result?: account.AuthResult): void => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_4300 verifyCredential_code: " + code);
                  hilog.info(0x0000, tag, "====>Parameter_4300 verifyCredential_Data: " + JSON.stringify(result));
                  expect(code).assertEqual(12300113)
                  hilog.info(0x0000, tag, "====>Parameter_4300 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_4300 err: " + JSON.stringify(err));
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>run in onRequestRedirected")
              },
              onRequestContinued: (): void => {
                hilog.info(0x0000, tag, "====>_onRequestContinued")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_4300 err: " + JSON.stringify(err));
            expect().assertFail()
            done()
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_4600
    * @tc.name       ActsAccountOptionalParameter_4600
    * @tc.desc       empty option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_4600 start====");
        let options: account.VerifyCredentialOptions = {}
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_4600 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.verifyCredential(name, 'com.acts.accountauthenticator.static', options, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_4600 verifyCredential_code: " + code);
                  expect(code).assertEqual(0)
                  hilog.info(0x0000, tag, "====>Parameter_4600 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_4600 err: " + JSON.stringify(err));
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_4600 err: " + JSON.stringify(err));
            expect().assertFail()
            done()
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_4900
    * @tc.name       ActsAccountOptionalParameter_4900
    * @tc.desc       credentialType options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_4900 start====");
        let options: account.VerifyCredentialOptions = {
          credentialType: "PIN"
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_4900 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.verifyCredential(name, 'com.acts.accountauthenticator.static', options, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_4900 verifyCredential_code: " + code);
                  expect(code).assertEqual(0)
                  hilog.info(0x0000, tag, "====>Parameter_4900 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_4900 err: " + JSON.stringify(err));
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_4900 err: " + JSON.stringify(err));
            expect().assertFail()
            done()
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_5200
    * @tc.name       ActsAccountOptionalParameter_5200
    * @tc.desc       credential options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_5200 start====");
        let options: account.VerifyCredentialOptions = {
          credential: "123456"
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_5200 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.verifyCredential(name, 'com.acts.accountauthenticator.static', options, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_5200 verifyCredential_code: " + code);
                  expect(code).assertEqual(0)
                  hilog.info(0x0000, tag, "====>Parameter_5200 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_5200 err: " + JSON.stringify(err));
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_5200 err: " + JSON.stringify(err));
            expect().assertFail()
            done()
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_5500
    * @tc.name       ActsAccountOptionalParameter_5500
    * @tc.desc       parameters options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_5500 start====");
        let cData: Record<string, RecordData> =  {}
        cData['sex'] = 'male'
        let options: account.VerifyCredentialOptions = {}
        options.parameters = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_5500 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.verifyCredential(name, 'com.acts.accountauthenticator.static', options, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_5500 verifyCredential_code: " + code);
                  expect(code).assertEqual(0)
                  hilog.info(0x0000, tag, "====>Parameter_5500 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_5500 err: " + JSON.stringify(err));
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_5500 err: " + JSON.stringify(err));
            expect().assertFail()
            done()
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_5800
    * @tc.name       ActsAccountOptionalParameter_5800
    * @tc.desc       credentialType&credential options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_5800 start====");
        let options: account.VerifyCredentialOptions = {
          credentialType: "PIN", credential: "123456"
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_5800 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.verifyCredential(name, 'com.acts.accountauthenticator.static', options, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_5800 verifyCredential_code: " + code);
                  expect(code).assertEqual(0)
                  hilog.info(0x0000, tag, "====>Parameter_5800 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_5800 err: " + JSON.stringify(err));
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_5800 err: " + JSON.stringify(err));
            expect().assertFail()
            done()
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_6100
    * @tc.name       ActsAccountOptionalParameter_6100
    * @tc.desc       credentialType&parameters options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_6100 start====");
        let cData: Record<string, RecordData> =  {}
        cData['sex'] = 'male'
        let options: account.VerifyCredentialOptions = {
          credentialType: "PIN"
        }
        options.parameters = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_6100 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.verifyCredential(name, 'com.acts.accountauthenticator.static', options, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_6100 verifyCredential_code: " + code);
                  expect(code).assertEqual(0)
                  hilog.info(0x0000, tag, "====>Parameter_6100 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_6100 err: " + JSON.stringify(err));
                  expect().assertFail()
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_6100 err: " + JSON.stringify(err));
            done()
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_6400
    * @tc.name       ActsAccountOptionalParameter_6400
    * @tc.desc       credential&parameters options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_6400 start====");
        let cData: Record<string, RecordData> =  {}
        cData['sex'] = 'male'
        let options: account.VerifyCredentialOptions = {
          credential: "123456"
        }
        options.parameters = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_6400 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.verifyCredential(name, 'com.acts.accountauthenticator.static', options, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_6400 verifyCredential_code: " + code);
                  expect(code).assertEqual(0)
                  hilog.info(0x0000, tag, "====>Parameter_6400 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_6400 err: " + JSON.stringify(err));
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_6400 err: " + JSON.stringify(err));
            expect().assertFail()
            done()
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_6700
    * @tc.name       ActsAccountOptionalParameter_6700
    * @tc.desc       credentialType&credential options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_6700 start====");
        let cData: Record<string, RecordData> =  {}
        cData['sex'] = 'male'
        let options: account.VerifyCredentialOptions = {
          credentialType: "PIN", credential: "123456"
        }
        options.parameters = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_6700 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.verifyCredential(name, 'com.acts.accountauthenticator.static', options, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_6700 verifyCredential_code: " + code);
                  expect(code).assertEqual(0)
                  hilog.info(0x0000, tag, "====>Parameter_6700 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_6700 err: " + JSON.stringify(err));
                  done()
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_6700 err: " + JSON.stringify(err));
            expect().assertFail()
            done()
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_6800
    * @tc.name       ActsAccountOptionalParameter_6800
    * @tc.desc       no option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_6800 start====");
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_6800 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.setAuthenticatorProperties(owner, {
              onResult: (code: int) => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_6800 setProperties_code: " + code);
                  expect(code).assertEqual(12300113)
                  hilog.info(0x0000, tag, "====>Parameter_6800 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_6800 err: " + JSON.stringify(err));
                  done();
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>onRequestRedirected")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_6800 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_6900
    * @tc.name       ActsAccountOptionalParameter_6900
    * @tc.desc       with option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_6900 start====");
        let cData: Record<string, RecordData> =  {}
        let dData: Record<string, RecordData> =  {}
        cData['prop1'] = 'value1'
        dData['sex'] = 'male'
        let options: account.SetPropertiesOptions = {}
        options.properties = cData;
        options.parameters = dData;
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_6900 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.setAuthenticatorProperties(owner, options, {
              onResult: (code: int, result?: account.AuthResult): void => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_6900 setProperties_code: " + code);
                  expect(code).assertEqual(12300113)
                  hilog.info(0x0000, tag, "====>Parameter_6900 setProperties_Data: " + JSON.stringify(result));
                  hilog.info(0x0000, tag, "====>Parameter_6900 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_6900 err: " + JSON.stringify(err));
                  done();
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>run in onRequestRedirected")
              },
              onRequestContinued: (): void => {
                hilog.info(0x0000, tag, "====>Parameter_6900 verifyCredential_onRequestContinued")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_6900 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_7200
    * @tc.name       ActsAccountOptionalParameter_7200
    * @tc.desc       empty option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_7200 start====");
        let options: account.SetPropertiesOptions = {}
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_7200 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.setAuthenticatorProperties(owner, options, {
              onResult: (code: int, result?: account.AuthResult): void => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_7200 setProperties_code: " + code);
                  expect(code).assertEqual(12300113)
                  hilog.info(0x0000, tag, "====>Parameter_7200 setProperties_Data: " + JSON.stringify(result));
                  hilog.info(0x0000, tag, "====>Parameter_7200 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_7200 err: " + JSON.stringify(err));
                  done();
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>run in onRequestRedirected")
              },
              onRequestContinued: (): void => {
                hilog.info(0x0000, tag, "====>Parameter_7200 verifyCredential_onRequestContinued")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_7200 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
     * @tc.number     ActsAccountOptionalParameter_7500
     * @tc.name       ActsAccountOptionalParameter_7500
     * @tc.desc       properties options
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('ActsAccountOptionalParameter_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_7500 start====");
        let cData: Record<string, RecordData> =  {}
        cData['prop1'] = 'value1'
        let options: account.SetPropertiesOptions = {}
        options.properties = cData;
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_7500 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.setAuthenticatorProperties(owner, options, {
              onResult: (code: int, result?: account.AuthResult): void => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_7500 setProperties_code: " + code);
                  expect(code).assertEqual(12300113)
                  hilog.info(0x0000, tag, "====>Parameter_7500 setProperties_Data: " + JSON.stringify(result));
                  hilog.info(0x0000, tag, "====>Parameter_7500 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_7500 err: " + JSON.stringify(err));
                  done();
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>run in onRequestRedirected")
              },
              onRequestContinued: (): void => {
                hilog.info(0x0000, tag, "====>Parameter_7500 verifyCredential_onRequestContinued")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_7500 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_7800
    * @tc.name       ActsAccountOptionalParameter_7800
    * @tc.desc       parameters options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_7800 start====");
        let dData: Record<string, RecordData> =  {}
        dData['sex'] = 'male'
        let options: account.SetPropertiesOptions = {}
        options.parameters = dData;
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_7800 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.setAuthenticatorProperties(owner, options, {
              onResult: (code: int, result?: account.AuthResult): void => {
                try {
                  hilog.info(0x0000, tag, "====>Parameter_7800 setProperties_code: " + code);
                  expect(code).assertEqual(12300113)
                  hilog.info(0x0000, tag, "====>Parameter_7800 setProperties_Data: " + JSON.stringify(result));
                  hilog.info(0x0000, tag, "====>Parameter_7800 success")
                  done();
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Parameter_7800 err: " + JSON.stringify(err));
                  done();
                }
              },
              onRequestRedirected: (request: Want): void => {
                hilog.info(0x0000, tag, "====>run in onRequestRedirected")
              },
              onRequestContinued: (): void => {
                hilog.info(0x0000, tag, "====>Parameter_7800 verifyCredential_onRequestContinued")
              }
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>Parameter_7800 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
     * @tc.number     ActsAccountOptionalParameter_8100
     * @tc.name       ActsAccountOptionalParameter_8100
     * @tc.desc       empty option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
     */
    it('ActsAccountOptionalParameter_8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_8100 start====");
        let options: account.SelectAccountsOptions = {}
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          try {
            hilog.info(0x0000, tag, "====>Parameter_8100 add_account_err: " + JSON.stringify(err));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.selectAccountsByOptions(options, (err: BusinessError<void> | null,
              data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>Parameter_8100 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(0);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>Parameter_8100 success")
              done();
            })
          } catch (err) {
            hilog.info(0x0000, tag, "====>Parameter_8100 err: " + JSON.stringify(err));
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_8200
    * @tc.name       ActsAccountOptionalParameter_8200
    * @tc.desc       empty option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_8200 start====");
        let options: account.SelectAccountsOptions = {}
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_8200 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options).then((data: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>selectAccountsByOptions successfully, data: " + data);
              expect(data.length).assertEqual(0)
              hilog.info(0x0000, tag, "====>Parameter_8200 success")
              done()
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error: " + err);
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error code: " + err.code);
              expect().assertFail()
              done()
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>selectAccountsByOptions exception: " + JSON.stringify(err));
            done();
          }
        });
      });

    /**
     * @tc.number     ActsAccountOptionalParameter_8300
     * @tc.name       ActsAccountOptionalParameter_8300
     * @tc.desc       with option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
     */
    it('ActsAccountOptionalParameter_8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_8300 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{
            "name": name, "owner": owner
          }], allowedOwners: ["com.example.accounttstest.static"], requiredLabels: ["student"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_8300 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options, (err: BusinessError<void> | null,
              data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>Parameter_8300 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(0);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>Parameter_8300 success")
              done();
            })
          } catch (err) {
            hilog.info(0x0000, tag, "====>Parameter_8300 err: " + JSON.stringify(err));
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_8400
    * @tc.name       ActsAccountOptionalParameter_8400
    * @tc.desc       with option
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_8400 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{
            "name": name, "owner": owner
          }], allowedOwners: ["com.example.accounttstest.static"], requiredLabels: ["student"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_8400 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options).then((data: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>selectAccountsByOptions successfully, data: " + data);
              expect(data.length).assertEqual(0)
              hilog.info(0x0000, tag, "====>Parameter_8400 success")
              done()
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error: " + err);
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error code: " + err.code);
              expect().assertFail()
              done()
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>selectAccountsByOptions exception: " + JSON.stringify(err));
            done();
          }
        });
      });

    /**
     * @tc.number     ActsAccountOptionalParameter_8900
     * @tc.name       ActsAccountOptionalParameter_8900
     * @tc.desc       allowedAccounts options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
     */
    it('ActsAccountOptionalParameter_8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_8900 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{
            "name": name, "owner": owner
          }]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_8900 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options, (err: BusinessError<void> | null,
              data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>Parameter_8900 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(1);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>Parameter_8900 success")
              done();
            })
          } catch (err) {
            hilog.info(0x0000, tag, "====>Parameter_8900 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_9000
    * @tc.name       ActsAccountOptionalParameter_9000
    * @tc.desc       allowedAccounts options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_9000 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{
            "name": name, "owner": owner
          }]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_9000 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options).then((data: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>selectAccountsByOptions successfully, data: " + data);
              expect(data.length).assertEqual(1)
              hilog.info(0x0000, tag, "====>Parameter_9000 success")
              done()
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error: " + err);
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error code: " + err.code);
              expect().assertFail()
              done()
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>selectAccountsByOptions exception: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });


    /**
     * @tc.number     ActsAccountOptionalParameter_9500
     * @tc.name       ActsAccountOptionalParameter_9500
     * @tc.desc       allowedOwners options test selectAccountsByOptions callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
     */
    it('ActsAccountOptionalParameter_9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_9500 start====");
        let options: account.SelectAccountsOptions = {
          allowedOwners: ["com.example.accounttstest.static"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_9500 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options, (err: BusinessError<void> | null,
              data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>Parameter_9500 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(1);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>Parameter_9500 success")
              done();
            })
          } catch (err) {
            hilog.info(0x0000, tag, "====>Parameter_9500 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_9600
    * @tc.name       ActsAccountOptionalParameter_9600
    * @tc.desc       allowedOwners options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_9600 start====");
        let options: account.SelectAccountsOptions = {
          allowedOwners: ["com.example.accounttstest.static"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_9600 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options).then((data: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>selectAccountsByOptions successfully, data: " + data);
              expect(data.length).assertEqual(1)
              hilog.info(0x0000, tag, "====>Parameter_9600 success")
              done()
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error: " + err);
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error code: " + err.code);
              expect().assertFail()
              done()
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>selectAccountsByOptions exception: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
     * @tc.number     ActsAccountOptionalParameter_10100
     * @tc.name       ActsAccountOptionalParameter_10100
     * @tc.desc       requiredLabels options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
     */
    it('ActsAccountOptionalParameter_10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_10100 start====");
        let options: account.SelectAccountsOptions = {
          requiredLabels: ["student"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_10100 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options, (err: BusinessError<void> | null,
              data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>Parameter_10100 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(0);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>Parameter_10100 success")
              done();
            })
          } catch (err) {
            hilog.info(0x0000, tag, "====>Parameter_10100 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_10200
    * @tc.name       ActsAccountOptionalParameter_10200
    * @tc.desc       requiredLabels options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_10200 start====");
        let options: account.SelectAccountsOptions = {
          requiredLabels: ["student"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_10200 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options).then((data: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>selectAccountsByOptions successfully, data: " + data);
              expect(data.length).assertEqual(0)
              hilog.info(0x0000, tag, "====>Parameter_10200 success")
              done()
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error: " + err);
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error code: " + err.code);
              expect().assertFail()
              done()
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>selectAccountsByOptions exception: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
     * @tc.number     ActsAccountOptionalParameter_10700
     * @tc.name       ActsAccountOptionalParameter_10700
     * @tc.desc       allowedAccounts&allowedOwners options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
     */
    it('ActsAccountOptionalParameter_10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_10700 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{
            "name": name, "owner": owner
          }], allowedOwners: ["com.example.accounttstest.static"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_10700 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options, (err: BusinessError<void> | null,
              data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>Parameter_10700 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(1);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>Parameter_10700 success")
              done();
            })
          } catch (err) {
            hilog.info(0x0000, tag, "====>Parameter_10700 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_10800
    * @tc.name       ActsAccountOptionalParameter_10800
    * @tc.desc       allowedAccounts&allowedOwners options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_10800 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{
            "name": name, "owner": owner
          }], allowedOwners: ["com.example.accounttstest.static"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_10800 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options).then((data: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>selectAccountsByOptions successfully, data: " + data);
              expect(data.length).assertEqual(1)
              hilog.info(0x0000, tag, "====>Parameter_10800 success")
              done()
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error: " + err);
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error code: " + err.code);
              expect().assertFail()
              done()
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>selectAccountsByOptions exception: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
     * @tc.number     ActsAccountOptionalParameter_11300
     * @tc.name       ActsAccountOptionalParameter_11300
     * @tc.desc       allowedAccounts&requiredLabels options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
     */
    it('ActsAccountOptionalParameter_11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_11300 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{
            "name": name, "owner": owner
          }], requiredLabels: ["student"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_11300 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options, (err: BusinessError<void> | null,
              data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>Parameter_11300 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(0);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>Parameter_11300 success")
              done();
            })
          } catch (err) {
            hilog.info(0x0000, tag, "====>Parameter_11300 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_11400
    * @tc.name       ActsAccountOptionalParameter_11400
    * @tc.desc       allowedAccounts&requiredLabels options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_11400 start====");
        let options: account.SelectAccountsOptions = {
          allowedAccounts: [{
            "name": name, "owner": owner
          }], requiredLabels: ["student"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_11400 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options).then((data: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>selectAccountsByOptions successfully, data: " + data);
              expect(data.length).assertEqual(0)
              hilog.info(0x0000, tag, "====>Parameter_11400 success")
              done()
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error: " + err);
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error code: " + err.code);
              expect().assertFail()
              done()
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>selectAccountsByOptions exception: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
     * @tc.number     ActsAccountOptionalParameter_11900
     * @tc.name       ActsAccountOptionalParameter_11900
     * @tc.desc       allowedOwners&requiredLabels options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
     */
    it('ActsAccountOptionalParameter_11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_11900 start====");
        let options: account.SelectAccountsOptions = {
          allowedOwners: ["com.example.accounttstest.static"], requiredLabels: ["student"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_11900 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options, (err: BusinessError<void> | null,
              data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>Parameter_11900 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(0);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>Parameter_11900 success")
              done();
            })
          } catch (err) {
            hilog.info(0x0000, tag, "====>Parameter_11900 err: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });

    /**
    * @tc.number     ActsAccountOptionalParameter_12000
    * @tc.name       ActsAccountOptionalParameter_12000
    * @tc.desc       allowedOwners&requiredLabels options
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountOptionalParameter_12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>Parameter_12000 start====");
        let options: account.SelectAccountsOptions = {
          allowedOwners: ["com.example.accounttstest.static"], requiredLabels: ["student"]
        }
        hilog.info(0x0000, tag, "====>start finish====");
        accountManager.createAccount(name, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>Parameter_12000 add_account_err: " + JSON.stringify(err));
          try {
            expect(err).assertEqual(null);
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          try {
            accountManager.selectAccountsByOptions(options).then((data: Array<account.AppAccountInfo>) => {
              hilog.info(0x0000, tag, "====>selectAccountsByOptions successfully, data: " + data);
              expect(data.length).assertEqual(0)
              hilog.info(0x0000, tag, "====>Parameter_12000 success")
              done()
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error: " + err);
              hilog.info(0x0000, tag, "====>selectAccountsByOptions failed, error code: " + err.code);
              expect().assertFail()
              done()
            });
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, "====>selectAccountsByOptions exception: " + JSON.stringify(err));
            expect().assertFail()
            done();
          }
        });
      });
  })
}
