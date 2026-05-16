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

export default function ActsAppAccountCredentialStatic() {
  describe('ActsAppAccountCredentialStatic', () => {
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
    * @tc.number     ActsAppAccountCredential_0100
    * @tc.name       ActsAppAccountCredential_0100
    * @tc.desc       The setCredential setting credential is called when the forwarding parameters
    *                 are correct, and then getCredential is called for the credential(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAppAccountCredential_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0100 start====");
        accountManager.createAccount("account_name_0100", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_0100 err: " + JSON.stringify(err));
          accountManager.setCredential("account_name_0100", "credentialType1", "credential1", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0100 setCredential: " + JSON.stringify(err));
            accountManager.getCredential("account_name_0100", "credentialType1", (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>getCredential 0100 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>getCredential 0100 data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data).assertEqual("credential1");
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
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0100 end====");
                done();
              });
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_0200
    * @tc.name       ActsAppAccountCredential_0200
    * @tc.desc       The setAssociatedData setting credential is called when the forwarding parameters
    *                 are correct, and then getCredential is called for the credential(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsAppAccountCredential_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0200 start====");
        hilog.info(0x0000, tag, "====>add accountActsAppAccountCredential_0200 start====");
        await accountManager.createAccount("account_name_0200");
        hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_0200 start====");
        try {
          await accountManager.setCredential("account_name_0200", "credentialType2", "credential2");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "setCredential ActsAppAccountCredential_0200 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_0200 start====");
        try {
          let data: string = await accountManager.getCredential("account_name_0200", "credentialType2");
          hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_0200 data: " + JSON.stringify(data));
          expect(data).assertEqual("credential2");
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_0200 start====");
          accountManager.removeAccount("account_name_0200")
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "getCredential ActsAppAccountCredential_0200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAppAccountCredential_0300
    * @tc.name       ActsAppAccountCredential_0300
    * @tc.desc       When the first setCredential is called and the second setCredential
    *                 is called,the setting of the credential is different if the call getCredential
    *                 can get the second credential(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0300 start====");
        accountManager.createAccount("account_name_0300", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_0300 err: " + JSON.stringify(err));
          accountManager.setCredential("account_name_0300", "credentialType3", "credential3", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCredential first time 0300 err: " + JSON.stringify(err));
            accountManager.setCredential("account_name_0300", "credentialType3", "newcredential3", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setCredential second time 0300 err: " + JSON.stringify(err));
              accountManager.getCredential("account_name_0300", "credentialType3", (err: BusinessError<void> | null, data: string | undefined): void => {
                hilog.info(0x0000, tag, "====>getCredential 0300 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>getCredential 0300 data: " + JSON.stringify(data));
                try {
                  if (err) {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  } else {
                    if (data) {
                      expect(data).assertEqual("newcredential3");
                    } else {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    }
                  }
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                accountManager.removeAccount("account_name_0300", (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account 0300 err: " + JSON.stringify(err));
                  try {
                    expect(err).assertEqual(null);
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0300 end====");
                  done();
                });
              });
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_0400
    * @tc.name       ActsAppAccountCredential_0400
    * @tc.desc       When the first setCredential is called and the second setCredential
    *                 is called,the setting of the credential is different if the call getCredential
    *                 can get the second credential(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAppAccountCredential_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0400 start====");
        hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_0400 start====");
        await accountManager.createAccount("account_name_0400");
        try {
          await accountManager.setCredential("account_name_0400", "credentialType4", "credential4");
          await accountManager.setCredential("account_name_0400", "credentialType4", "newcredential4")
        } catch (err) {
          hilog.error(0x0000, tag, "setCredential ActsAppAccountCredential_0400 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        try {
          let data: string = await accountManager.getCredential("account_name_0400", "credentialType4");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0400 getCredential data: " + JSON.stringify(data));
          expect(data).assertEqual("newcredential4");
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_0400 start====");
          accountManager.removeAccount("account_name_0400")
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0400 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "getCredential ActsAppAccountCredential_0400 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAppAccountCredential_0500
    * @tc.name       ActsAppAccountCredential_0500
    * @tc.desc       Call setAssociatedData and then getAssociatedData when the incoming credential is null(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0500 start====");
        accountManager.createAccount("account_name_0500", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_0500 err: " + JSON.stringify(err));
          accountManager.setCredential("account_name_0500", "credentialType5", "", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_0500 err: " + JSON.stringify(err));
            accountManager.getCredential("account_name_0500", "credentialType5", (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_0500 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_0500 data: " + JSON.stringify(data));
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
              accountManager.removeAccount("account_name_0500", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account ActsAppAccountCredential_0500 err: " + JSON.stringify(err));
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0500 end====");
                done();
              });
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_0600
    * @tc.name       ActsAppAccountCredential_0600
    * @tc.desc       Call setAssociatedData and then getAssociatedData when the incoming credential is null(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAppAccountCredential_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0600 start====");
        hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_0600 start====");
        await accountManager.createAccount("account_name_0600");
        try {
          hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_0600 start====");
          await accountManager.setCredential("account_name_0600", "credentialType6", "");
          hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_0600 start====");
          let data: string = await accountManager.getCredential("account_name_0600", "credentialType6");
          hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_0600 data" + JSON.stringify(data));
          expect(data).assertEqual("");
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_0600 start====");
          await accountManager.removeAccount("account_name_0600");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "getCredential ActsAppAccountCredential_0400 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAppAccountCredential_0700
    * @tc.name       ActsAppAccountCredential_0700
    * @tc.desc       Call setAssociatedData setting credential when the incoming parameter type is null(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0700 start====");
        accountManager.createAccount("account_name_0700", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_0700 err: " + JSON.stringify(err));
          accountManager.setCredential("account_name_0700", "", "credential7", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_0700 err: " + JSON.stringify(err));
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
            hilog.info(0x0000, tag, "removeAccount start");
            accountManager.removeAccount("account_name_0700", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account ActsAppAccountCredential_0700 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0700 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_0800
    * @tc.name       ActsAppAccountCredential_0800
    * @tc.desc       Call setAssociatedData setting credential when the incoming parameter type is null(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAppAccountCredential_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0800 start====");
        hilog.info(0x0000, tag, "====>add account ccountActsAppAccountCredential_0800 start====");
        await accountManager.createAccount("account_name_0800");
        try {
          await accountManager.setCredential("account_name_0800", "", "credential8");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_0800 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_0800 start====");
          await accountManager.removeAccount("account_name_0800");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0800 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAppAccountCredential_0900
    * @tc.name       ActsAppAccountCredential_0900
    * @tc.desc       Call getCredential getting credential when the incoming parameter type is wrong(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0900 start====");
        accountManager.createAccount("account_name_0900", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_0900 err: " + JSON.stringify(err));
          accountManager.getCredential("account_name_0900", "", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_0900 err: " + JSON.stringify(err));
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
            accountManager.removeAccount("account_name_0900", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account ActsAppAccountCredential_0900 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsAppAccountCredential_0900 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_1000
    * @tc.name       ActsAppAccountCredential_1000
    * @tc.desc       Call getCredential getting credential when the incoming parameter type is wrong(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAppAccountCredential_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1000 start====");
        hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1000 start====");
        await accountManager.createAccount("account_name_1000");
        try {
          await accountManager.getCredential("account_name_1000", "");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_1000 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_1000 start====");
          await accountManager.removeAccount("account_name_1000");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1000 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAppAccountCredential_1100
    * @tc.name       ActsAppAccountCredential_1100
    * @tc.desc       Call setAssociatedData setting credential when the incoming parameter type is space
    *                 then use getCredential getting the credential(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1100 start====");
        accountManager.createAccount("account_name_1100", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1100 err: " + JSON.stringify(err));
          accountManager.setCredential("account_name_1100", " ", "credential11", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_1100 err: " + JSON.stringify(err));
            accountManager.getCredential("account_name_1100", " ", (err: BusinessError<void> | null, data: string | undefined): void => {
              hilog.info(0x0000, tag, "====>getCredential 1100 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>getCredential 1100 data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data).assertEqual("credential11");
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
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1100 end====");
                done();
              });
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_1200
    * @tc.name       ActsAppAccountCredential_1200
    * @tc.desc       Call setAssociatedData setting credential when the incoming parameter type is space
    *                 then use getCredential getting the credential(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAppAccountCredential_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1200 start====");
        hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1200 start====");
        try {
          await accountManager.createAccount("account_name_1200");
          hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_1200 start====");
          await accountManager.setCredential("account_name_1200", " ", "credential12");
          hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_1200 start====");
          let data: string = await accountManager.getCredential("account_name_1200", " ");
          hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_1200 data" + JSON.stringify(data));
          expect(data).assertEqual("credential12");
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_1200 start====");
          await accountManager.removeAccount("account_name_1200");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1200 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAppAccountCredential_1300
    * @tc.name       ActsAppAccountCredential_1300
    * @tc.desc       Call setAssociatedData setting credential when the incoming parameter name is null(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1300 start====");
        accountManager.createAccount("account_name_1300", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1300 err: " + JSON.stringify(err));
          accountManager.setCredential("", "credentialType13", "credential13", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_1300 err: " + JSON.stringify(err));
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
              hilog.info(0x0000, tag, "====>delete Account ActsAppAccountCredential_1300 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1300 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_1400
    * @tc.name       ActsAppAccountCredential_1400
    * @tc.desc       Call setAssociatedData setting credential when the incoming parameter name is null(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAppAccountCredential_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1400 start====");
        hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1400 start====");
        await accountManager.createAccount("account_name_1400");
        try {
          await accountManager.setCredential("", "credentialType14", "credential14");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_1400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_1400 start====");
          await accountManager.removeAccount("account_name_1400");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1400 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAppAccountCredential_1500
    * @tc.name       ActsAppAccountCredential_1500
    * @tc.desc       Call getCredential directly to get credential without calling setCredential
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1500 start====");
        accountManager.createAccount("account_name_1500", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1500 err: " + JSON.stringify(err));
          accountManager.getCredential("account_name_1500", "credentialType15", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_1500 err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300102);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
            }
            accountManager.removeAccount("account_name_1500", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account ActsAppAccountCredential_1500 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1500 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_1600
    * @tc.name       ActsAppAccountCredential_1600
    * @tc.desc       Call getCredential directly to get credential without calling setCredential
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "cActsAppAccountCredential_1600 start====");
        hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1600 start====");
        await accountManager.createAccount("account_name_1600");
        try {
          await accountManager.getCredential("account_name_1600", "credentialType16");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getCredential ActsAppAccountCredential_1600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300102);
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_1600 start====");
          await accountManager.removeAccount("account_name_1600");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1600 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAppAccountCredential_1700
    * @tc.name       ActsAppAccountCredential_1700
    * @tc.desc       Call setCredential setting credential when the incoming parameter credential is wrong
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1700 start====");
        let CREDENTIALOVERSIZE: string = "K"
        for (let i: int = 0; i < 256; i++) {
          CREDENTIALOVERSIZE = CREDENTIALOVERSIZE + "K!@#";
        }
        accountManager.createAccount("account_name_1700", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1700 err: " + JSON.stringify(err));
          accountManager.setCredential("account_name_1700", "credentialType17", CREDENTIALOVERSIZE, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>CREDENTIALOVERSIZE.length: " + JSON.stringify(CREDENTIALOVERSIZE.length));
            expect(CREDENTIALOVERSIZE.length).assertEqual(1025);
            hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_1700 err: " + JSON.stringify(err));
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
            accountManager.removeAccount("account_name_1700", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account ActsAppAccountCredential_1700 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1700 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_1800
    * @tc.name       ActsAppAccountCredential_1800
    * @tc.desc       Call setCredential setting credential when the incoming parameter credential is wrong
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1800 start====");
        let bigStr: string = "K"
        for (let i: int = 0; i < 256; i++) {
          bigStr = bigStr + "K!@#";
        }
        hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1800 start====");
        await accountManager.createAccount("account_name_1800");
        try {
          await accountManager.setCredential("account_name_1800", "credentialType18", bigStr);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>bigStr.length: " + JSON.stringify(bigStr.length));
          expect(bigStr.length).assertEqual(1025);
          hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_1800 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_1800 start====");
          await accountManager.removeAccount("account_name_1800");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1800 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAppAccountCredential_1900
    * @tc.name       ActsAppAccountCredential_1900
    * @tc.desc       Call setCredential setting type when the incoming parameter credential is wrong(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAppAccountCredential_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1900 start====");
        let CREDENTIALTYPEOVERSIZE: string = "K"
        for (let i: int = 0; i < 256; i++) {
          CREDENTIALTYPEOVERSIZE = CREDENTIALTYPEOVERSIZE + "K!@#";
        }
        accountManager.createAccount("account_name_1900", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_1900 err: " + JSON.stringify(err));
          accountManager.setCredential("account_name_1900", CREDENTIALTYPEOVERSIZE, "credential19", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>CREDENTIALTYPEOVERSIZE.length: " + JSON.stringify(CREDENTIALTYPEOVERSIZE.length));
            expect(CREDENTIALTYPEOVERSIZE.length).assertEqual(1025);
            hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_1900 err: " + JSON.stringify(err));
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
            accountManager.removeAccount("account_name_1900", (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>delete Account ActsAppAccountCredential_1900 err: " + JSON.stringify(err));
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              hilog.info(0x0000, tag, "====>ActsAppAccountCredential_1900 end====");
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_2000
    * @tc.name       ActsAppAccountCredential_2000
    * @tc.desc       Call setCredential setting type when the incoming parameter credential is wrong(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAppAccountCredential_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_2000 start====");
        let CREDENTIALTYPEOVERSIZE: string = "K"
        for (let i: int = 0; i < 256; i++) {
          CREDENTIALTYPEOVERSIZE = CREDENTIALTYPEOVERSIZE + "K!@#";
        }
        hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_2000 start====");
        await accountManager.createAccount("account_name_2000");
        try {
          await accountManager.setCredential("account_name_2000", CREDENTIALTYPEOVERSIZE, "credential20");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>CREDENTIALTYPEOVERSIZE.length: " + JSON.stringify(CREDENTIALTYPEOVERSIZE.length));
          expect(CREDENTIALTYPEOVERSIZE.length).assertEqual(1025);
          hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_2000 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_2000 start====");
          await accountManager.removeAccount("account_name_2000");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_2000 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsAppAccountCredential_2100
    * @tc.name       ActsAppAccountCredential_2100
    * @tc.desc       Call setCredential setting name when the incoming parameter name is wrong(callback)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAppAccountCredential_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_2100 start====");
        let NAMEOVERSIZE: string = "n"
        for (let i: int = 0; i < 256; i++) {
          NAMEOVERSIZE = NAMEOVERSIZE + "name";
        }
        accountManager.createAccount("account_name_2100", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_2100 err: " + JSON.stringify(err));
          accountManager.setCredential(NAMEOVERSIZE, "credentialType21", "credential21", (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_2100 err: " + JSON.stringify(err));
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
              hilog.info(0x0000, tag, "====>delete Account ActsAppAccountCredential_2100 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>ActsAppAccountCredential_2100 end====");
              try {
                expect(err).assertEqual(null);
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              done();
            });
          });
        });
      });

    /**
    * @tc.number     ActsAppAccountCredential_2200
    * @tc.name       ActsAppAccountCredential_2200
    * @tc.desc       Call setCredential setting name when the incoming parameter name is wrong(promise)
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL4
    */
    it('ActsAppAccountCredential_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAppAccountCredential_2200 start====");
        let NAMEOVERSIZE: string = "n"
        for (let i: int = 0; i < 256; i++) {
          NAMEOVERSIZE = NAMEOVERSIZE + "name";
        }
        hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_2200 start====");
        try {
          await accountManager.createAccount("account_name_2200");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>add account ActsAppAccountCredential_2200 err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_2200 start====");
        try {
          await accountManager.setCredential(NAMEOVERSIZE, "credentialType22", "credential22");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setCredential ActsAppAccountCredential_2200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, "====>delete account ActsAppAccountCredential_2200 start====");
          await accountManager.removeAccount("account_name_2200");
          hilog.info(0x0000, tag, "====>ActsAppAccountCredential_2200 end====");
          done();
        }
      });
  })
}