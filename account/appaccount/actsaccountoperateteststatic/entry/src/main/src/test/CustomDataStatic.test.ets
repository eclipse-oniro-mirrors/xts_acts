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

export default function ActsAccountCustomDataStatic() {
  describe('ActsAccountCustomDataStatic', () => {
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
    * @tc.number     ActsAccountCustomData_0100
    * @tc.name       ActsAccountCustomData_0100
    * @tc.desc       The setCustomData setting valueis called when the forwarding parameters
    *                 are correct, and then getCustomData is called for the value(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountCustomData_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0100 start====");
        accountManager.createAccount("account_name_0100", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add accountActsAccountCustomData_0100 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_0100", "key1", "value1",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_0100 err: " + JSON.stringify(err));
              accountManager.getCustomData("account_name_0100", "key1",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>getCustomData 0100 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>getCustomData 0100 data: " + JSON.stringify(data));
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual("value1");
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_name_0100", (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>delete Account 0100 err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>ActsAccountCustomData_0100 end====");
                    done();
                  });
                });
            });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_0200
    * @tc.name       ActsAccountCustomData_0200
    * @tc.desc       The setCustomData setting value is called when the forwarding parameters
    *                 are correct, and then getCustomData is called for the value(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAccountCustomData_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0200 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_0200 start====");
        try {
          await accountManager.createAccount("account_name_0200");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add Account ActsAccountCustomData_0200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_0200 start====");
        try {
          await accountManager.setCustomData("account_name_0200", "key2", "value2");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData ActsAccountCustomData_0200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>getCustomData ActsAccountCustomData_0200 start====");
        try {
          let data: string = await accountManager.getCustomData("account_name_0200", "key2");
          hilog.info(0x0000, tag, "====>getCustomData ActsAccountCustomData_0200 data: " + JSON.stringify(data));
          expect(data).assertEqual("value2");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getCustomData ActsAccountCustomData_0200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_0200 start====");
        try {
          await accountManager.removeAccount("account_name_0200");
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_0200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>delete account 0200 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAccountCustomData_0300
    * @tc.name       ActsAccountCustomData_0300
    * @tc.desc       Call getCustomData directly to get value without calling setCustomData(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0300 start====");
        accountManager.createAccount("account_name_0300", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_0300 err: " + JSON.stringify(err));
          accountManager.getCustomData("account_name_0300", "key3",
            (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>getCustomData 0300 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>getCustomData 0300 data: " + JSON.stringify(data));
              try {
                if (err) {
                  expect(err?.code).assertEqual(12400002);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_name_0300", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account 0300 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>ActsAccountCustomData_0300 end====");
                done();
              });
            });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_0400
    * @tc.name       ActsAccountCustomData_0400
    * @tc.desc       Call getCustomData directly to get value without calling setCustomData(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0400 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_0400 start====");
        try {
          await accountManager.createAccount("account_name_0400");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add Account ActsAccountCustomData_0400 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await accountManager.getCustomData("account_name_0400", "key4");
          hilog.info(0x0000, tag, "====>getCustomData fail ActsAccountCustomData_0400====");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getCustomData ActsAccountCustomData_0400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12400002);
          hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_0400 start====");
          try {
            await accountManager.removeAccount("account_name_0400");
          } catch (err) {
            err = err as BusinessError;
            hilog.error(0x0000, tag, "====>delete account 0400 fail err: " + JSON.stringify(err));
            expect().assertFail();
          }
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_0400 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAccountCustomData_0500
    * @tc.name       ActsAccountCustomData_0500
    * @tc.desc       After calling setCustomData setting value correctly,
    *                 call the getCustomData of the pass error to check if you get the value(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0500 start====");
        accountManager.createAccount("account_name_0500", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_0500 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_0500", "key5", "value5",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_0500 err: " + JSON.stringify(err));
              accountManager.getCustomData("account_name_0500", "keyerr",
                (err: BusinessError<void> | null, data: string | undefined): void => {
                  hilog.info(0x0000, tag, "====>getCustomData 0500 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>getCustomData 0500 data: " + JSON.stringify(data));
                  try {
                    if (err) {
                      expect(err?.code).assertEqual(12400002);
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  } catch (err) {
                    hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("account_name_0500", (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>delete Account 0500 err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>ActsAccountCustomData_0500 end====");
                    done();
                  });
                });
            });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_0600
    * @tc.name       ActsAccountCustomData_0600
    * @tc.desc       After calling setCustomData setting value correctly,
    *                 call the getCustomData of the pass error to check if you get the value(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0600 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_0600 start====");
        try {
          await accountManager.createAccount("account_name_0600");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add Account ActsAccountCustomData_0600 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        await accountManager.setCustomData("account_name_0600", "key6", "value6");
        try {
          await accountManager.getCustomData("account_name_0600", "keyerr");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getCustomData 0600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12400002);
          hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_0600 start====");
          try {
            await accountManager.removeAccount("account_name_0600");
          } catch (err) {
            err = err as BusinessError;
            hilog.error(0x0000, tag, "====>delete account 0600 fail err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_0600 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAccountCustomData_0700
    * @tc.name       ActsAccountCustomData_0700
    * @tc.desc       When the first setCustomData is called and the second setCustomData
    *                 is called,the setting of the value is different if the call getCustomData
    *                 can get the second value(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0700 start====");
        accountManager.createAccount("account_name_0700", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_0700 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_0700", "key7", "value7",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setCustomDatafir first time 0700 err: " + JSON.stringify(err));
              accountManager.setCustomData("account_name_0700", "key7", "newvalue7",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>setCustomDatafir second time 0700 err: " + JSON.stringify(err));
                  accountManager.getCustomData("account_name_0700", "key7",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>getCustomData 0700 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>getCustomData 0700 data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual("newvalue7");
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_name_0700", (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>delete Account 0700 err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0700 end====");
                        done();
                      });
                    });
                });
            });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_0800
    * @tc.name       ActsAccountCustomData_0800
    * @tc.desc       When the first setCustomData is called and the second setCustomData
    *                 is called,the setting of the value is different if the call getCustomData
    *                 can get the second value(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0800 start====");
        try {
          await accountManager.createAccount("account_name_0800");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_0800 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await accountManager.setCustomData("account_name_0800", "key8", "value8");
          await accountManager.setCustomData("account_name_0800", "key8", "newvalue8");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData ActsAccountCustomData_0800 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let data: string = await accountManager.getCustomData("account_name_0800", "key8");
          hilog.info(0x0000, tag, "====>getCustomData ActsAccountCustomData_0800 data: " + JSON.stringify(data));
          expect(data).assertEqual("newvalue8");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getCustomData ActsAccountCustomData_0800 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_0800 start====");
        try {
          await accountManager.removeAccount("account_name_0800");
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_0800 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>delete account 0800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAccountCustomData_0900
    * @tc.name       ActsAccountCustomData_0900
    * @tc.desc       When the first setCustomData is called and the second setCustomData
    *                 is called,the setting of the value is same if the call getCustomData
    *                 can get the second value(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0900 start====");
        accountManager.createAccount("account_name_0900", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_0900 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_0900", "key9", "value9",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setCustomData first time 0900 err: " + JSON.stringify(err));
              accountManager.setCustomData("account_name_0900", "key9", "value9",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>setCustomData second time 0900 err: " + JSON.stringify(err));
                  accountManager.getCustomData("account_name_0900", "key9",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>getCustomData 0900 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>getCustomData 0900 data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual("value9");
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("account_name_0900", (err: BusinessError<void> | null): void => {
                        hilog.info(0x0000, tag, "====>delete Account 0900 err: " + JSON.stringify(err));
                        hilog.info(0x0000, tag, "====>ActsAccountCustomData_0900 end====");
                        done();
                      });
                    });
                });
            });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_1000
    * @tc.name       ActsAccountCustomData_1000
    * @tc.desc       When the first setCustomData is called and the second setCustomData
    *                 is called,the setting of the value is same if the call getCustomData
    *                 can get the second value(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1000 start====");
        hilog.info(0x0000, tag, "====>createAccount ActsAccountCustomData_1000 start====");
        try {
          await accountManager.createAccount("account_name_1000");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_1000 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await accountManager.setCustomData("account_name_1000", "key10", "value10");
          await accountManager.setCustomData("account_name_1000", "key10", "value10");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData ActsAccountCustomData_1000 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let data: string = await accountManager.getCustomData("account_name_1000", "key10");
          hilog.info(0x0000, tag, "====>getCustomData 1000 data: " + JSON.stringify(data));
          expect(data).assertEqual("value10");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getCustomData ActsAccountCustomData_1000 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_1000 start====");
        try {
          await accountManager.removeAccount("account_name_1000");
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_1000 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>delete account 1000 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAccountCustomData_1100
    * @tc.name       ActsAccountCustomData_1100
    * @tc.desc       Call setCustomData setting value again after calling setCustomData setting
    *                 different value, and then call getCustomData twice to get the set value(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1100 start====");
        accountManager.createAccount("account_name_1100", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_1100 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_1100", "key11_first", "value11_first",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setCustomData first time 1100 err: " + JSON.stringify(err));
              accountManager.setCustomData("account_name_1100", "key11_second", "value11_second",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>setCustomData second time 1100 err: " + JSON.stringify(err));
                  accountManager.getCustomData("account_name_1100", "key11_first",
                    (err: BusinessError<void> | null, data: string | undefined): void => {
                      hilog.info(0x0000, tag, "====>getCustomData key11_first 1100 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>getCustomData key11_first 1100 data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual("value11_first");
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.getCustomData("account_name_1100", "key11_second",
                        (err: BusinessError<void> | null, data: string | undefined): void => {
                          hilog.info(0x0000, tag, "====>getCustomData key11_second 1100 err: " + JSON.stringify(err));
                          hilog.info(0x0000, tag, "====>getCustomData key11_second 1100 data: " + JSON.stringify(data));
                          try {
                            if (err) {
                              hilog.info(0x0000, tag, "====>run err");
                              expect().assertFail();
                            } else {
                              if (data) {
                                expect(data).assertEqual("value11_second");
                              } else {
                                hilog.info(0x0000, tag, "====>run err");
                                expect().assertFail();
                              }
                            }
                          } catch (err) {
                            hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                          }
                          accountManager.removeAccount("account_name_1100", (err: BusinessError<void> | null): void => {
                            hilog.info(0x0000, tag, "====>delete Account 1100 err: " + JSON.stringify(err));
                            hilog.info(0x0000, tag, "====>ActsAccountCustomData_1100 end====");
                            done();
                          });
                        });
                    });
                });
            });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_1200
    * @tc.name       ActsAccountCustomData_1200
    * @tc.desc       Call setCustomData setting value again after calling setCustomData setting
    *                 different value, and then call getCustomData twice to get the set value(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1200 start====");
        hilog.info(0x0000, tag, "====>createAccount ActsAccountCustomData_1200 start====");
        try {
          await accountManager.createAccount("account_name_1200");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_1200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await accountManager.setCustomData("account_name_1200", "key12_first", "value12_first");
          await accountManager.setCustomData("account_name_1200", "key12_second", "value12_second");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData ActsAccountCustomData_1200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let dataFir = await accountManager.getCustomData("account_name_1200", "key12_first");
          let dataSec = await accountManager.getCustomData("account_name_1200", "key12_second");
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_1200 getCustomData dataFir: " + JSON.stringify(dataFir));
          expect(dataFir).assertEqual("value12_first");
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_1200 getCustomData dataSec: " + JSON.stringify(dataSec));
          expect(dataSec).assertEqual("value12_second");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getCustomData ActsAccountCustomData_1200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_1200 start====");
        try {
          await accountManager.removeAccount("account_name_1200");
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_1200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>delete account 1200 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAccountCustomData_1300
    * @tc.name       ActsAccountCustomData_1300
    * @tc.desc       Call setCustomData setting value when the incoming parameter KEY is wrong(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1300 start====");
        accountManager.createAccount("account_name_1300", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_1300 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_1300", "", "value13", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_1300 err: " + JSON.stringify(err));
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
            accountManager.removeAccount("account_name_1300", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_1300 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>ActsAccountCustomData_1300 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_1400
    * @tc.name       ActsAccountCustomData_1400
    * @tc.desc       Call setCustomData setting value when the incoming parameter KEY is wrong(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1400 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_1400 start====");
        try {
          await accountManager.createAccount("account_name_1400");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_1400 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await accountManager.setCustomData("account_name_1400", "", "value14");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_1400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_1400 start====");
          try {
            await accountManager.removeAccount("account_name_1400");
          } catch (err) {
            err = err as BusinessError;
            hilog.error(0x0000, tag, "====>delete account 1400 fail err: " + JSON.stringify(err));
            expect().assertFail();
          }
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_1400 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAccountCustomData_1500
    * @tc.name       ActsAccountCustomData_1500
    * @tc.desc       Call setCustomData setting key when the incoming parameter KEY is wrong(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1500 start====");
        let keyOverSize: string = "K"
        for (let i: int = 0; i < 256; i++) {
          keyOverSize = keyOverSize + "K!@#";
        }
        accountManager.createAccount("account_name_1500", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_1500 err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>1500 keyOverSize.length: " + JSON.stringify(keyOverSize.length));
          accountManager.setCustomData("account_name_1500", keyOverSize, "value15",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_1500 err: " + JSON.stringify(err));
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
              accountManager.removeAccount("account_name_1500", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_1500 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>ActsAccountCustomData_1500 end====");
                done();
              });
            });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_1600
    * @tc.name       ActsAccountCustomData_1600
    * @tc.desc       Call setCustomData setting key when the incoming parameter KEY is wrong(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1600 start====");
        let keyOverSize: string = "K"
        for (let i: int = 0; i < 256; i++) {
          keyOverSize = keyOverSize + "K!@#";
        }
        hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_1600 start====");
        try {
          await accountManager.createAccount("account_name_1600");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_1600 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await accountManager.setCustomData("account_name_1600", keyOverSize, "value16");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_1600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_1600 start====");
          try {
            await accountManager.removeAccount("account_name_1600");
          } catch (err) {
            err = err as BusinessError;
            hilog.error(0x0000, tag, "====>delete account 1600 fail err: " + JSON.stringify(err));
            expect().assertFail();
          }
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_1600 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAccountCustomData_1700
    * @tc.name       ActsAccountCustomData_1700
    * @tc.desc       Call setCustomData and then getCustomData when the incoming key is a space(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1700 start====");
        accountManager.createAccount("account_name_1700", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_1700 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_1700", " ", "value17", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>ActsAccountCustomData_1700 setCustomData: " + JSON.stringify(err));
            accountManager.getCustomData("account_name_1700", " ",
              (err: BusinessError<void> | null, data: string | undefined): void => {
                hilog.info(0x0000, tag, "====>getCustomData 1700 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>getCustomData 1700 data: " + JSON.stringify(data));
                try {
                  if (err) {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  } else {
                    if (data) {
                      expect(data).assertEqual("value17");
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  }
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_name_1700", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account 1700 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>ActsAccountCustomData_1700 end====");
                  done();
                });
              });
          });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_1800
    * @tc.name       ActsAccountCustomData_1800
    * @tc.desc       Call setCustomData and then getCustomData when the incoming key is a space(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1800 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_1800 start====");
        try {
          await accountManager.createAccount("account_name_1800");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_1800 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        await accountManager.setCustomData("account_name_1800", " ", "value18");
        try {
          let data: string = await accountManager.getCustomData("account_name_1800", " ");
          hilog.info(0x0000, tag, "====>getCustomData ActsAccountCustomData_1800 data: " + JSON.stringify(data));
          expect(data).assertEqual("value18");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData ActsAccountCustomData_1800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_1800 start====");
        try {
          await accountManager.removeAccount("account_name_1800");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>delete account 1800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1800 end====");
        done();
      });

    /**
    * @tc.number     ActsAccountCustomData_1900
    * @tc.name       ActsAccountCustomData_1900
    * @tc.desc       Call setCustomData and then getCustomData when the incoming value is null(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_1900 start====");
        accountManager.createAccount("account_name_1900", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_1900 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_1900", "key19", "", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_1900 err: " + JSON.stringify(err));
            accountManager.getCustomData("account_name_1900", "key19",
              (err: BusinessError<void> | null, data: string | undefined): void => {
                hilog.info(0x0000, tag, "====>getCustomData 1900 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>getCustomData 1900 data: " + JSON.stringify(data));
                try {
                  if (err) {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  } else {
                    expect(data).assertEqual("");
                  }
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_name_1900", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account 1900 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>ActsAccountCustomData_1900 end====");
                  done();
                });
              });
          });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_2000
    * @tc.name       ActsAccountCustomData_2000
    * @tc.desc       Call setCustomData and then getCustomData when the incoming value is null(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2000 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_2000 start====");
        try {
          await accountManager.createAccount("account_name_2000");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_2000 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await accountManager.setCustomData("account_name_2000", "key20", "");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>setCustomData ActsAccountCustomData_2000 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          let data: string = await accountManager.getCustomData("account_name_2000", "key20");
          hilog.info(0x0000, tag, "====>getCustomData ActsAccountCustomData_2000 data: " + JSON.stringify(data));
          expect(data).assertEqual("");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getCustomData 2000 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_2000 start====");
        try {
          await accountManager.removeAccount("account_name_2000");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>delete account 2000 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2000 end====");
        done();
      });

    /**
    * @tc.number     ActsAccountCustomData_2100
    * @tc.name       ActsAccountCustomData_2100
    * @tc.desc       Call setCustomData setting value when the incoming parameter value is wrong(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2100 start====");
        let valueOverSize: string = "K"
        for (let i: int = 0; i < 256; i++) {
          valueOverSize = valueOverSize + "K!@#";
        }
        accountManager.createAccount("account_name_2100", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_2100 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_2100", "key21", valueOverSize,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_2100 err: " + JSON.stringify(err));
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
              accountManager.removeAccount("account_name_2100", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account ActsAccountCustomData_2100 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>ActsAccountCustomData_2100 end====");
                done();
              });
            });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_2200
    * @tc.name       ActsAccountCustomData_2200
    * @tc.desc       Call setCustomData setting value when the incoming parameter value is wrong(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2200 start====");
        let valueOverSize: string = "K"
        for (let i: int = 0; i < 256; i++) {
          valueOverSize = valueOverSize + "K!@#";
        }
        try {
          await accountManager.createAccount("account_name_2200");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_2200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await accountManager.setCustomData("account_name_2200", "key22", valueOverSize);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_2200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_2200 start====");
          try {
            await accountManager.removeAccount("account_name_2200");
          } catch (err) {
            err = err as BusinessError;
            hilog.error(0x0000, tag, "====>delete account 2200 fail err: " + JSON.stringify(err));
            expect().assertFail();
          }
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_2200 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAccountCustomData_2300
    * @tc.name       ActsAccountCustomData_2300
    * @tc.desc       Call setCustomData and then getCustomData when the incoming value is a space(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2300 start====");
        accountManager.createAccount("account_name_2300", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_2300 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_2300", "key23", " ", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_2300 err: " + JSON.stringify(err));
            accountManager.getCustomData("account_name_2300", "key23",
              (err: BusinessError<void> | null, data: string | undefined): void => {
                hilog.info(0x0000, tag, "====>getCustomData 2300 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>getCustomData 2300 data: " + JSON.stringify(data));
                try {
                  if (err) {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  } else {
                    if (data) {
                      expect(data).assertEqual(" ");
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  }
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_name_2300", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account 2300 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>ActsAccountCustomData_2300 end====");
                  done();
                });
              });
          });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_2400
    * @tc.name       ActsAccountCustomData_2400
    * @tc.desc       Call setCustomData and then getCustomData when the incoming value is a space(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2400 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_2400 start====");
        try {
          await accountManager.createAccount("account_name_2400");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_2400 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        await accountManager.setCustomData("account_name_2400", "key24", " ");
        try {
          let data: string = await accountManager.getCustomData("account_name_2400", "key24");
          hilog.info(0x0000, tag, "====>getCustomData 2400 err: " + JSON.stringify(data));
          expect(data).assertEqual(" ");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getCustomData 2400 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_2400 start====");
        try {
          await accountManager.removeAccount("account_name_2400");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>delete account 2400 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2400 end====");
        done();
      });

    /**
    * @tc.number     ActsAccountCustomData_2500
    * @tc.name       ActsAccountCustomData_2500
    * @tc.desc       Call setCustomData and then getCustomData when the incoming name is null(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2500 start====");
        accountManager.createAccount("account_name_2500", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_2500 err: " + JSON.stringify(err));
          accountManager.setCustomData("", "key25", "value25", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_2500 err: " + JSON.stringify(err));
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
            accountManager.removeAccount("account_name_2500", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account ActsAccountCustomData_2500 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>ActsAccountCustomData_2500 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_2600
    * @tc.name       ActsAccountCustomData_2600
    * @tc.desc       Call setCustomData and then getCustomData when the incoming name is null(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2600 start====");
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2600 createAccount start====");
        try {
          await accountManager.createAccount("account_name_2600");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_2600 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        try {
          await accountManager.setCustomData("", "key26", "value26");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_2600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_2600 start====");
          try {
            await accountManager.removeAccount("account_name_2600");
          } catch (err) {
            err = err as BusinessError;
            hilog.error(0x0000, tag, "====>delete account 2600 fail err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_2600 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAccountCustomData_2700
    * @tc.name       ActsAccountCustomData_2700
    * @tc.desc       Call setCustomData setting name when the incoming parameter name is wrong(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2700 start====");
        let nameOverSize: string = "n"
        for (let i: int = 0; i < 256; i++) {
          nameOverSize = nameOverSize + "name";
        }
        accountManager.createAccount("account_name_2700", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_2700 err: " + JSON.stringify(err));
          accountManager.setCustomData(nameOverSize, "key27", "value27", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>ActsAccountCustomData_2700 setCustomData: " + JSON.stringify(err));
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
            accountManager.removeAccount("account_name_2700", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account ActsAccountCustomData_2700 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>ActsAccountCustomData_2700 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_2800
    * @tc.name       ActsAccountCustomData_2800
    * @tc.desc       Call setCustomData setting name when the incoming parameter name is wrong(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2800 start====");
        let nameOverSize: string = "n"
        for (let i: int = 0; i < 256; i++) {
          nameOverSize = nameOverSize + "name";
        }
        hilog.info(0x0000, tag, "====>add account ActsAccountCustomData_2800 start====");
        try {
          await accountManager.createAccount("account_name_2800");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>add account ActsAccountCustomData_2800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        try {
          await accountManager.setCustomData(nameOverSize, "key28", "value28");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_2800 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAccountCustomData_2800 start====");
          try {
            await accountManager.removeAccount("account_name_2800");
          } catch (err) {
            err = err as BusinessError;
            hilog.error(0x0000, tag, "====>delete account 2800 fail err: " + JSON.stringify(err));
            expect().assertFail();
          }
          hilog.info(0x0000, tag, "====>ActsAccountCustomData_2800 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAccountCustomData_2900
    * @tc.name       ActsAccountCustomData_2900
    * @tc.desc       Call setCustomData and then getCustomData when the incoming name is a space(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_2900 start====");
        accountManager.createAccount(" ", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>createAccount ActsAccountCustomData_2900 err: " + JSON.stringify(err));
          accountManager.setCustomData(" ", "key29", "value29", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_2900 err: " + JSON.stringify(err));
            accountManager.getCustomData(" ", "key29",
              (err: BusinessError<void> | null, data: string | undefined): void => {
                hilog.info(0x0000, tag, "====>getCustomData 2900 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>getCustomData 2900 data: " + JSON.stringify(data));
                try {
                  if (err) {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  } else {
                    if (data) {
                      expect(data).assertEqual("value29");
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  }
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                accountManager.removeAccount(" ", (err: BusinessError<void> | null): void => {
                  hilog.error(0x0000, tag, "====>removeAccount ActsAccountCustomData_2900 err: " + JSON.stringify(err));
                  done();
                });
              });
          });
        });
      });

    /**
    * @tc.number     ActsAccountCustomData_3000
    * @tc.name       ActsAccountCustomData_3000
    * @tc.desc       Call setCustomData and then getCustomData when the incoming name is a space(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_3000 start====");
        try {
          await accountManager.createAccount(" ");
          await accountManager.setCustomData(" ", "key30", "value30");
          let data: string = await accountManager.getCustomData(" ", "key30");
          hilog.info(0x0000, tag, "====>getCustomData ActsAccountCustomData_3000 data: " + JSON.stringify(data));
          expect(data).assertEqual("value30");
          await accountManager.removeAccount(" ");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>ActsAccountCustomData_3000 fail err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      })


    /**
    * @tc.number     ActsAccountCustomData_3100
    * @tc.name       ActsAccountCustomData_3100
    * @tc.desc       The setCustomData setting valueis called when the forwarding parameters
    *                 are correct, and then getCustomData is called for the value(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountCustomData_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountCustomData_3100 start====");
        accountManager.createAccount("account_name_3100", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add ActsAccountCustomData_3100 err: " + JSON.stringify(err));
          accountManager.setCustomData("account_name_3100", "key31", "value31",
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setCustomData ActsAccountCustomData_3100 err: " + JSON.stringify(err));
              let data: string = accountManager.getCustomDataSync("account_name_3100", "key31")
              hilog.info(0x0000, tag, "====>getCustomData ActsAccountCustomData_3100 result: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data).assertEqual("value31");
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              accountManager.removeAccount("account_name_3100", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account 0100 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>ActsAccountCustomData_3100 end====");
                done();
              });
            });
        });
      });
  })
}