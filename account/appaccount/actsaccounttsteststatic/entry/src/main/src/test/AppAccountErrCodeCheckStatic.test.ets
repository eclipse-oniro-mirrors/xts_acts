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
import { describe, beforeEach, afterEach, it, expect, TestType, Hypium, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'
import Utils from './Util.test';

let name: string = 'zhangSan'
let owner: string = 'com.acts.notExist'
let nameLimit: int = 512

let tag: string = 'testTag';

export default function AppAccountErrCodeCheckStatic() {
  describe('AppAccountErrCodeCheckStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>AppAccountManager create finish====");

    beforeEach(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>beforeEach start====");
      let accounts: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner("com.example.accounttstest.static");
      hilog.info(0x0000, tag, "====>getAccountsByOwner accounts length: " + JSON.stringify(accounts.length));
      for (let i: int = 0; i < accounts.length; i++) {
        let localName: string = accounts[i].name;
        try {
          await accountManager.removeAccount(localName);
        } catch (err: BusinessError<void>) {
          hilog.info(0x0000, tag, "====>removeAccount err: " + JSON.stringify(err));
        }
      }
      done();
    })

    /**
    * @tc.number     AppAccountErrCodeCheck_1500
    * @tc.name       AppAccountErrCodeCheck_1500
    * @tc.desc       12300007 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_1500 "
        let cData: Record<string, string> =  {}
        cData['age'] = '10'
        let options: account.CreateAccountOptions = {}
        options.customData = cData;
        hilog.info(0x0000, tag, logTag + "start====");
        for (let i: int = 0; i < 1000; i++) {
          hilog.info(0x0000, tag, logTag + "start createAccount");
          await accountManager.createAccount("tempA" + i);
          hilog.info(0x0000, tag, logTag + "createAccount tempA" + i);
        }
        hilog.info(0x0000, tag, logTag + "start createAccount 1000 callback");
        accountManager.createAccount("zhangSan1000", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, logTag + "createAccount callback err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300007);
            } else {
              hilog.info(0x0000, tag, logTag + '====>run err');
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, logTag + "====>Assert Fail: " + JSON.stringify(err));
          }
          hilog.info(0x0000, tag, logTag + "start createAccount 1000 with options callback");
          accountManager.createAccount("zhangSan1000", options,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, logTag + "createAccount callback with options err: " + JSON.stringify(err));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300007);
                } else {
                  hilog.info(0x0000, tag, logTag + '====>run err');
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, logTag + "start createAccount 1000 promise");
              accountManager.createAccount("zhangSan1000").then(() => {
                hilog.info(0x0000, tag, logTag + '====>promise run err');
                expect().assertFail();
              }).catch((e: Error) => {
                let err = e as BusinessError;
                hilog.info(0x0000, tag, logTag + "createAccount promise err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, logTag + "createAccount promise err code: " + JSON.stringify(err.code));
                try {
                  expect(err.code).assertEqual(12300007);
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, logTag + "start createAccount 1000 with options promise");
                accountManager.createAccount("zhangSan1000", options).then(() => {
                  hilog.info(0x0000, tag, logTag + '====>with options promise run err');
                  expect().assertFail();
                }).catch((e: Error) => {
                  let err = e as BusinessError;
                  hilog.info(0x0000, tag, logTag + "createAccount promise with options err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, logTag + "createAccount promise with options err code: " + JSON.stringify(err.code));
                  try {
                    expect(err.code).assertEqual(12300007);
                  } catch (err) {
                    hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("tempA0", (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, logTag + "removeAccount all done");
                    done()
                  });
                });
              });
            });
        });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_1600
    * @tc.name       AppAccountErrCodeCheck_1600
    * @tc.desc       12400003 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_1600 "
        hilog.info(0x0000, tag, logTag + "start====");
        hilog.info(0x0000, tag, logTag + "start createAccount");
        await accountManager.createAccount(name);
        for (let i: int = 0; i < 1024; i++) {
          await accountManager.setCustomData(name, "key" + i, "value" + i);
          hilog.info(0x0000, tag, logTag + "setCustomData " + i);
        }
        hilog.info(0x0000, tag, logTag + "start setCustomData");
        accountManager.setCustomData(name, "key1025", "value1025",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "setCustomData callback err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12400003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.setCustomData(name, "key1025", "value1025").then(() => {
              hilog.info(0x0000, tag, logTag + '====>run err');
              expect().assertFail();
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, logTag + "setCustomData promise err: " + err);
              hilog.info(0x0000, tag, logTag + "setCustomData promise err code: " + err.code);
              try {
                expect(err.code).assertEqual(12400003);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              done();
            });
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_1700
    * @tc.name       AppAccountErrCodeCheck_1700
    * @tc.desc       12400004 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_1700 "
        hilog.info(0x0000, tag, logTag + "start====");
        hilog.info(0x0000, tag, logTag + "start createAccount");
        await accountManager.createAccount(name);
        for (let i: int = 0; i < 128; i++) {
          try {
            await accountManager.setAuthToken(name, "getSocialData" + i, "value" + i);
            hilog.info(0x0000, tag, logTag + "setAuthToken " + i);
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, logTag + "setAuthToken err: " + JSON.stringify(err));
            break
          }
        }
        hilog.info(0x0000, tag, logTag + "start setAuthToken");
        accountManager.setAuthToken(name, "getSocialData", "value",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "setAuthToken callback err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12400004);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.setAuthToken(name, "getSocialData", "value").then(() => {
              hilog.info(0x0000, tag, logTag + '====>run err');
              expect().assertFail();
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, logTag + "setAuthToken promise err: " + err);
              hilog.info(0x0000, tag, logTag + "setAuthToken promise err code: " + err.code);
              try {
                expect(err.code).assertEqual(12400004);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              done();
            });
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_1800
    * @tc.name       AppAccountErrCodeCheck_1800
    * @tc.desc       12400005 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_1800 "
        hilog.info(0x0000, tag, logTag + "start====");
        hilog.info(0x0000, tag, logTag + "start createAccount");
        await accountManager.createAccount(name);
        await accountManager.setAuthToken(name, "getSocialData", "value");
        for (let i: int = 0; i < 512; i++) {
          try {
            await accountManager.setAuthTokenVisibility(name, "getSocialData", owner + i, true);
            hilog.info(0x0000, tag, logTag + "setAuthTokenVisibility " + i);
          } catch (err) {
            err = err as BusinessError;
            hilog.info(0x0000, tag, logTag + "setAuthTokenVisibility err: " + JSON.stringify(err));
            break
          }
        }
        hilog.info(0x0000, tag, logTag + "start setAuthTokenVisibility");
        accountManager.setAuthTokenVisibility(name, "getSocialData", owner, true,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "setAuthTokenVisibility callback err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12400005);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            accountManager.setAuthTokenVisibility(name, "getSocialData", owner, true).then(() => {
              hilog.info(0x0000, tag, logTag + '====>run err');
              expect().assertFail();
            }).catch((e: Error) => {
              let err = e as BusinessError;
              hilog.info(0x0000, tag, logTag + "setAuthTokenVisibility promise err: " + err);
              hilog.info(0x0000, tag, logTag + "setAuthTokenVisibility promise err code: " + err.code);
              try {
                expect(err.code).assertEqual(12400005);
              } catch (err) {
                hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
              }
              done();
            });
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_1900
    * @tc.name       AppAccountErrCodeCheck_1900
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_1900 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start deleteCredential");
        accountManager.deleteCredential(accountName, "PIN",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_2000
    * @tc.name       AppAccountErrCodeCheck_2000
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2000 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        try {
          hilog.info(0x0000, tag, logTag + "start deleteCredential");
          await accountManager.deleteCredential(accountName, "PIN");
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
    * @tc.number     AppAccountErrCodeCheck_2100
    * @tc.name       AppAccountErrCodeCheck_2100
    * @tc.desc       12300003 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2100 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start deleteCredential");
        accountManager.deleteCredential(accountName, "PIN",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_2200
    * @tc.name       AppAccountErrCodeCheck_2200
    * @tc.desc       12300003 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2200 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = 'name';
        try {
          hilog.info(0x0000, tag, logTag + "start deleteCredential");
          await accountManager.deleteCredential(accountName, "PIN");
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
    * @tc.number     AppAccountErrCodeCheck_2300
    * @tc.name       AppAccountErrCodeCheck_2300
    * @tc.desc       12300102 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2300 "
        hilog.info(0x0000, tag, logTag + "start====");
        hilog.info(0x0000, tag, logTag + "start createAccount");
        await accountManager.createAccount(name);
        hilog.info(0x0000, tag, logTag + "start deleteCredential");
        accountManager.deleteCredential(name, "PIN",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300102);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_2400
    * @tc.name       AppAccountErrCodeCheck_2400
    * @tc.desc       12300102 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2400 "
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          hilog.info(0x0000, tag, logTag + "start createAccount");
          await accountManager.createAccount(name);
          hilog.info(0x0000, tag, logTag + "start deleteCredential");
          await accountManager.deleteCredential(name, "PIN");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300102);
          done();
        }
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_2500
    * @tc.name       AppAccountErrCodeCheck_2500
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2500 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start checkAppAccess");
        accountManager.checkAppAccess(accountName, owner,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_2600
    * @tc.name       AppAccountErrCodeCheck_2600
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2600 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = 'i';
        hilog.info(0x0000, tag, logTag + "start checkAppAccess");
        accountManager.checkAppAccess(accountName, owner,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_2700
    * @tc.name       AppAccountErrCodeCheck_2700
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2700 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        try {
          hilog.info(0x0000, tag, logTag + "start checkAppAccess");
          let data: boolean = await accountManager.checkAppAccess(accountName, owner);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_2800
    * @tc.name       AppAccountErrCodeCheck_2800
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2800 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start checkAppAccess");
          let data: boolean = await accountManager.checkAppAccess(accountName, owner);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_2900
    * @tc.name       AppAccountErrCodeCheck_2900
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_2900 "
        hilog.info(0x0000, tag, logTag + "start====");
        let bundleName: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          bundleName += 'i';
        }
        try {
          await accountManager.createAccount(name);
          hilog.info(0x0000, tag, logTag + "start checkAppAccess");
          let data: boolean = await accountManager.checkAppAccess(name, bundleName);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
          await accountManager.removeAccount(name);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          await accountManager.removeAccount(name);
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_3000
    * @tc.name       AppAccountErrCodeCheck_3000
    * @tc.desc       12300003 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3000 "
        let bundleName: string = '';
        hilog.info(0x0000, tag, logTag + "start====");
        hilog.info(0x0000, tag, logTag + "start createAccount");
        await accountManager.createAccount(name);
        hilog.info(0x0000, tag, logTag + "start checkAppAccess");
        accountManager.checkAppAccess(name, bundleName,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_3100
    * @tc.name       AppAccountErrCodeCheck_3100
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3100 "
        hilog.info(0x0000, tag, logTag + "start====");
        let bundleName: string = 'i';
        try {
          await accountManager.createAccount(name);
          hilog.info(0x0000, tag, logTag + "start checkAppAccess");
          let data: boolean = await accountManager.checkAppAccess(name, bundleName);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
          await accountManager.removeAccount(name);
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          await accountManager.removeAccount(name);
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_3200
    * @tc.name       AppAccountErrCodeCheck_3200
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3200 "
        let bundleName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          bundleName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start====");
        hilog.info(0x0000, tag, logTag + "start createAccount");
        await accountManager.createAccount(name);
        hilog.info(0x0000, tag, logTag + "start checkAppAccess");
        accountManager.checkAppAccess(name, bundleName,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              expect(err).assertEqual(null);
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_3300
    * @tc.name       AppAccountErrCodeCheck_3300
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3300 "
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 1024; i++) {
          key += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start createAccount");
          await accountManager.createAccount(name);
          hilog.info(0x0000, tag, logTag + "start getCustomDataSync");
          let data: string = accountManager.getCustomDataSync(name, key);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12400002);
          done();
        }
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_3400
    * @tc.name       AppAccountErrCodeCheck_3400
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3400 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getCustomDataSync");
          let data: string = accountManager.getCustomDataSync(accountName, "credentialType");
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_3500
    * @tc.name       AppAccountErrCodeCheck_3500
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3500 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getCustomDataSync");
          let data: string = accountManager.getCustomDataSync(accountName, "credentialType");
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_3600
    * @tc.name       AppAccountErrCodeCheck_3600
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3600 "
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          key += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start createAccount");
          await accountManager.createAccount(name);
          hilog.info(0x0000, tag, logTag + "start getCustomDataSync");
          let data: string = accountManager.getCustomDataSync(name, key);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_3700
    * @tc.name       AppAccountErrCodeCheck_3700
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3700 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start setCredential");
          await accountManager.setCredential(accountName, "owner", "a");
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
    * @tc.number     AppAccountErrCodeCheck_3800
    * @tc.name       AppAccountErrCodeCheck_3800
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3800 "
        hilog.info(0x0000, tag, logTag + "start====");
        let credentialType: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          credentialType += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start setCredential");
        accountManager.setCredential("accountName", credentialType, "a",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_3900
    * @tc.name       AppAccountErrCodeCheck_3900
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_3900 "
        hilog.info(0x0000, tag, logTag + "start====");
        let credentialType: string = '';
        for (let i: int = 0; i < 1024; i++) {
          credentialType += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start setCredential");
          await accountManager.setCredential("accountName", credentialType, "a");
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
    * @tc.number     AppAccountErrCodeCheck_4000
    * @tc.name       AppAccountErrCodeCheck_4000
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4000 "
        hilog.info(0x0000, tag, logTag + "start====");
        let credential: string = '';
        for (let i: int = 0; i < 1024; i++) {
          credential += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start setCredential");
        accountManager.setCredential("accountName", "credentialType", credential,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_4100
    * @tc.name       AppAccountErrCodeCheck_4100
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4100 "
        hilog.info(0x0000, tag, logTag + "start====");
        let credential: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          credential += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start setCredential");
          await accountManager.setCredential("accountName", "credentialType", credential);
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
    * @tc.number     AppAccountErrCodeCheck_4200
    * @tc.name       AppAccountErrCodeCheck_4200
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4200 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start setCredential");
        accountManager.setCredential(accountName, "owner", "a",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_4300
    * @tc.name       AppAccountErrCodeCheck_4300
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4300 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start setCustomData");
          await accountManager.setCustomData(accountName, "owner", "a");
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
    * @tc.number     AppAccountErrCodeCheck_4400
    * @tc.name       AppAccountErrCodeCheck_4400
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4400 "
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 1024; i++) {
          key += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start setCustomData");
        accountManager.setCustomData("accountName", key, "a",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_4500
    * @tc.name       AppAccountErrCodeCheck_4500
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4500 "
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          key += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start setCustomData");
          await accountManager.setCustomData("accountName", key, "a");
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
    * @tc.number     AppAccountErrCodeCheck_4600
    * @tc.name       AppAccountErrCodeCheck_4600
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4600 "
        hilog.info(0x0000, tag, logTag + "start====");
        let value: string = '';
        for (let i: int = 0; i < 1024; i++) {
          value += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start setCustomData");
        accountManager.setCustomData("accountName", "credentialType", value,
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_4700
    * @tc.name       AppAccountErrCodeCheck_4700
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4700 "
        hilog.info(0x0000, tag, logTag + "start====");
        let value: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          value += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start setCustomData");
          await accountManager.setCustomData("accountName", "credentialType", value);
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
    * @tc.number     AppAccountErrCodeCheck_4800
    * @tc.name       AppAccountErrCodeCheck_4800
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4800 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start setCustomData");
        accountManager.setCustomData(accountName, "owner", "a",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_4900
    * @tc.name       AppAccountErrCodeCheck_4900
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_4900 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getCredential");
          let data: string = await accountManager.getCredential(accountName, "credentialType");
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_5000
    * @tc.name       AppAccountErrCodeCheck_5000
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5000 "
        hilog.info(0x0000, tag, logTag + "start====");
        let credentialType: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          credentialType += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start getCredential");
        accountManager.getCredential("accountName", credentialType,
          (err: BusinessError<void> | null, data: string | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_5100
    * @tc.name       AppAccountErrCodeCheck_5100
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5100 "
        hilog.info(0x0000, tag, logTag + "start====");
        let credentialType: string = '';
        for (let i: int = 0; i < 1024; i++) {
          credentialType += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getCredential");
          let data: string = await accountManager.getCredential("accountName", credentialType);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_5200
    * @tc.name       AppAccountErrCodeCheck_5200
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5200 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start getCredential");
        accountManager.getCredential(accountName, "credentialType",
          (err: BusinessError<void> | null, data: string | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_5201
    * @tc.name       AppAccountErrCodeCheck_5201
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5201 "
        hilog.info(0x0000, tag, logTag + "start====");
        let credentialType: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          credentialType += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getCredential");
          let data: string = await accountManager.getCredential("accountName", credentialType);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_5202
    * @tc.name       AppAccountErrCodeCheck_5202
    * @tc.desc       12300003 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5202 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start getCredential");
        accountManager.getCredential(accountName, "credentialType",
          (err: BusinessError<void> | null, data: string | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_5300
    * @tc.name       AppAccountErrCodeCheck_5300
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5300 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getCustomData");
          let data: string = await accountManager.getCustomData(accountName, "key");
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_5400
    * @tc.name       AppAccountErrCodeCheck_5400
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5400 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit + 1; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start getCustomData");
        accountManager.getCustomData(accountName, "key",
          (err: BusinessError<void> | null, data: string | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_5500
    * @tc.name       AppAccountErrCodeCheck_5500
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5500 "
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 1024; i++) {
          key += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start getCustomData");
        accountManager.getCustomData("accountName", key,
          (err: BusinessError<void> | null, data: string | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_5600
    * @tc.name       AppAccountErrCodeCheck_5600
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5600 "
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 1024; i++) {
          key += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getCustomData");
          let data: string = await accountManager.getCustomData("accountName", key);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_5700
    * @tc.name       AppAccountErrCodeCheck_5700
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5700 "
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 1024; i++) {
          key += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start createAccount");
        await accountManager.createAccount(name);
        hilog.info(0x0000, tag, logTag + "start getCustomData");
        accountManager.getCustomData(name, key,
          (err: BusinessError<void> | null, data: string | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12400002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_5800
    * @tc.name       AppAccountErrCodeCheck_5800
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5800 "
        hilog.info(0x0000, tag, logTag + "start====");
        let key: string = '';
        for (let i: int = 0; i < 1024; i++) {
          key += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start createAccount");
          await accountManager.createAccount(name);
          hilog.info(0x0000, tag, logTag + "start getCustomData");
          let data: string = await accountManager.getCustomData(name, key);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12400002);
          done();
        }
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_5900
    * @tc.name       AppAccountErrCodeCheck_5900
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_5900 "
        hilog.info(0x0000, tag, logTag + "start====");
        try {
          hilog.info(0x0000, tag, logTag + "start on accountChange");
          accountManager.onAccountChange([], (data) => {
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            expect().assertFail();
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300002);
          done();
        }
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_6000
    * @tc.name       AppAccountErrCodeCheck_6000
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_6000 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getAuthList");
          let data: Array<string> = await accountManager.getAuthList(accountName, "authType");
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_6100
    * @tc.name       AppAccountErrCodeCheck_6100
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_6100 "
        hilog.info(0x0000, tag, logTag + "start====");
        let getAuthList: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          getAuthList += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start getAuthList");
        accountManager.getAuthList("accountName", getAuthList,
          (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_6200
    * @tc.name       AppAccountErrCodeCheck_6200
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_6200 "
        hilog.info(0x0000, tag, logTag + "start====");
        let getAuthList: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          getAuthList += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getAuthList");
          let data: Array<string> = await accountManager.getAuthList("accountName", getAuthList);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_6300
    * @tc.name       AppAccountErrCodeCheck_6300
    * @tc.desc       12300002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_6300 "
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < nameLimit; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start getAuthList");
        accountManager.getAuthList(accountName, "authType",
          (err: BusinessError<void> | null, data: Array<string> | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_6400
    * @tc.name       AppAccountErrCodeCheck_6400
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_6400 "
        hilog.info(0x0000, tag, logTag + "start====");
        let sessionId: string = '';
        for (let i: int = 0; i < 1024 + 1; i++) {
          sessionId += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getAuthCallback");
          let data: account.AuthCallback = await accountManager.getAuthCallback(sessionId);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
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
    * @tc.number     AppAccountErrCodeCheck_6500
    * @tc.name       AppAccountErrCodeCheck_6500
    * @tc.desc       13200108 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_6500 "
        hilog.info(0x0000, tag, logTag + "start====");
        let sessionId: string = 'i';
        hilog.info(0x0000, tag, logTag + "start getAuthCallback");
        accountManager.getAuthCallback(sessionId,
          (err: BusinessError<void> | null, data: account.AuthCallback | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300108);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_6600
    * @tc.name       AppAccountErrCodeCheck_6600
    * @tc.desc       13200108 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_6600 "
        hilog.info(0x0000, tag, logTag + "start====");
        let sessionId: string = '';
        for (let i: int = 0; i < 1024; i++) {
          sessionId += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start getAuthCallback");
          let data: account.AuthCallback = await accountManager.getAuthCallback(sessionId);
          hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, logTag + "end====");
          expect(err.code).assertEqual(12300108);
          done();
        }
      });

    /**
    * @tc.number     AppAccountErrCodeCheck_6700
    * @tc.name       AppAccountErrCodeCheck_6700
    * @tc.desc       13200002 err code check
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('AppAccountErrCodeCheck_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>AppAccountErrCodeCheck_6700 "
        hilog.info(0x0000, tag, logTag + "start====");
        let sessionId: string = '';
        hilog.info(0x0000, tag, logTag + "start getAuthCallback");
        accountManager.getAuthCallback(sessionId,
          (err: BusinessError<void> | null, data: account.AuthCallback | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
              } else {
                hilog.info(0x0000, tag, logTag + '====>run err');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     ActsAccountErrCode_4900
    * @tc.name       ActsAccountErrCode_4900
    * @tc.desc       test service error
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountErrCode_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ErrCode_4900 start====");
        try {
          accountManager.getCustomDataSync("test_no_account", "test_key");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>ErrCode_4900 getCustomDataSync catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>ErrCode_4900 end====");
          done();
        }
      });
  });
}