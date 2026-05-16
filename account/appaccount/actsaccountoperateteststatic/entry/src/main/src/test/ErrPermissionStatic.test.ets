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
let ERR_PERMISSION_DENIED: int = 201;

export default function ActsAccountErrPermissionStatic() {
  describe('ActsAccountErrPermissionStatic', () => {
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
    * @tc.number     ActsAccountErrPermission_0100
    * @tc.name       ActsAccountErrPermission_0100
    * @tc.desc       Set the added account to allow synchronization without permission
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountErrPermission_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0100 start====");
        accountManager.createAccount("syncenable_callback_setnopermission", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account ActsAccountErrPermission_0100 err: " + JSON.stringify(err));
          accountManager.setDataSyncEnabled("syncenable_callback_setnopermission", true,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setDataSyncEnabled 0100 err: " + JSON.stringify(err));
              try {
                if (err) {
                  expect(err?.code).assertEqual(ERR_PERMISSION_DENIED);
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
              }
              accountManager.removeAccount("syncenable_callback_setnopermission",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag,
                    "====>delete Account ActsAccountErrPermission_0100 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0100 end====");
                  done();
                });
            })
        });
      });

    /**
    * @tc.number     ActsAccountErrPermission_0200
    * @tc.name       ActsAccountErrPermission_0200
    * @tc.desc       Set the added account to allow synchronization without permission
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountErrPermission_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0200 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountErrPermission_0200 start====");
        await accountManager.createAccount("syncenable_promise_setnopermission");
        hilog.info(0x0000, tag, "====>setDataSyncEnabled ActsAccountErrPermission_0200 start====");
        try {
          await accountManager.setDataSyncEnabled("syncenable_promise_setnopermission", true);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setDataSyncEnabled 0200 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(ERR_PERMISSION_DENIED);
          hilog.info(0x0000, tag, "====>delete account ActsAccountErrPermission_0200 start====");
          await accountManager.removeAccount("syncenable_promise_setnopermission");
          hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0200 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountErrPermission_0300
    * @tc.name       ActsAccountErrPermission_0300
    * @tc.desc       Check the added account synchronization without permission
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountErrPermission_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0300 start====");
        accountManager.createAccount("syncenable_callback_checknopermission",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>add account ActsAccountErrPermission_0300 err: " + JSON.stringify(err));
            accountManager.checkDataSyncEnabled("syncenable_callback_checknopermission",
              (err: BusinessError<void> | null, data: boolean | undefined): void => {
                hilog.info(0x0000, tag, "====>checkDataSyncEnable 0300 err: " + JSON.stringify(err));
                try {
                  if (err) {
                    expect(err?.code).assertEqual(ERR_PERMISSION_DENIED);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                } catch (err) {
                  hilog.info(0x0000, tag, "Assert Fail: " + JSON.stringify(err));
                }
                accountManager.removeAccount("syncenable_callback_checknopermission",
                  (err: BusinessError<void> | null): void => {
                    hilog.info(0x0000, tag, "====>delete Account 0300 err: " + JSON.stringify(err));
                    hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0300 end====");
                    done();
                  });
              })
          });
      });

    /**
    * @tc.number     ActsAccountErrPermission_0400
    * @tc.name       ActsAccountErrPermission_0400
    * @tc.desc       Check the added account synchronization without permission
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsAccountErrPermission_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0400 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountErrPermission_0400 start====");
        await accountManager.createAccount("syncenable_promise_checknopermission");
        hilog.info(0x0000, tag, "====>checkDataSyncEnable ActsAccountErrPermission_0400 start====");
        try {
          await accountManager.checkDataSyncEnabled("syncenable_promise_checknopermission");
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>checkDataSyncEnable 0400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(ERR_PERMISSION_DENIED);
          await accountManager.removeAccount("syncenable_promise_checknopermission");
          hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0400 end====");
        }
        done();
      });

    /**
    * @tc.number     ActsAccountErrPermission_0500
    * @tc.name       ActsAccountErrPermission_0500
    * @tc.desc       This application gets authorization after adding a single account without permission
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountErrPermission_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0500 start====");
        accountManager.createAccount("accessibleAccount_callback_nopermission",
          (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, "====>add account ActsAccountErrPermission_0500 err: " + JSON.stringify(err));
            accountManager.getAllAccounts((err: BusinessError<void> | null,
              data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>getAllAccounts 0500 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>getAllAccounts 0500 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertEqual(1);
                    let a: string = data[0].name;
                    let b: string = data[0].owner;
                    expect(a).assertEqual("accessibleAccount_callback_nopermission");
                    expect(b).assertEqual("com.example.actsaccountoperatetest.static");
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              accountManager.removeAccount("accessibleAccount_callback_nopermission",
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>delete Account 0500 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0500 end====");
                  done();
                })
            });
          });
      });

    /**
    * @tc.number     ActsAccountErrPermission_0600
    * @tc.name       ActsAccountErrPermission_0600
    * @tc.desc       This application gets authorization after adding a single account without permission
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountErrPermission_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0600 start====");
        hilog.info(0x0000, tag, "====>add account ActsAccountErrPermission_0600 start====");
        await accountManager.createAccount("accessibleAccount_promise_nopermission");
        hilog.info(0x0000, tag, "====>getAllAccounts 0600 start====");
        try {
          let data: Array<account.AppAccountInfo> = await accountManager.getAllAccounts();
          hilog.info(0x0000, tag, "====>getAllAccounts 0500 data: " + data);
          expect(data.length).assertEqual(1);
          expect(data[0].name).assertEqual("accessibleAccount_promise_nopermission");
          expect(data[0].owner).assertEqual("com.example.actsaccountoperatetest.static");
          hilog.info(0x0000, tag, "====>getAllAccounts 0600 err: " + JSON.stringify(data));
          await accountManager.removeAccount("accessibleAccount_promise_nopermission");
          hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getAllAccounts 0600 err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsAccountErrPermission_0700
    * @tc.name       ActsAccountErrPermission_0700
    * @tc.desc       This application gets its own application information after adding an account without permission
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountErrPermission_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0700 start====");
        let selfBundle: string = "com.example.actsaccountoperatetest.static";
        accountManager.createAccount("getAll_callback_nopermission", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 0700 err: " + JSON.stringify(err));
          accountManager.getAccountsByOwner(selfBundle,
            (err: BusinessError<void> | null, data: Array<account.AppAccountInfo> | undefined): void => {
              hilog.info(0x0000, tag, "====>getAccountsByOwner 0700 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>getAccountsByOwner 0700 data: " + data);
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  if (data) {
                    expect(data?.length).assertLarger(0);
                  } else {
                    hilog.info(0x0000, tag, "====>run err");
                    expect().assertFail();
                  }
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              accountManager.removeAccount("getAll_callback_nopermission", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete account 0700 err: " + JSON.stringify(err));
                hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0700 end====");
                done();
              });
            })
        });
      });

    /**
    * @tc.number     ActsAccountErrPermission_0800
    * @tc.name       ActsAccountErrPermission_0800
    * @tc.desc       This application gets its own application information after adding an account without permission
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsAccountErrPermission_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0800 start====");
        let selfBundle: string = "com.example.actsaccountoperatetest.static";
        hilog.info(0x0000, tag, "====>add account 0800 start====");
        await accountManager.createAccount("getAll_promise_nopermission");
        hilog.info(0x0000, tag, "====>getAccountsByOwner 0800 start====");
        try {
          let data: Array<account.AppAccountInfo> = await accountManager.getAccountsByOwner(selfBundle);
          hilog.info(0x0000, tag, "====>getAll_promise_nopermission data: " + data);
          expect(data.length).assertLarger(0);
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>getAccountsByOwner 0800 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(ERR_PERMISSION_DENIED);
          await accountManager.removeAccount("getAll_promise_nopermission");
          hilog.info(0x0000, tag, "====>ActsAccountErrPermission_0800 end====");
        }
        done();
      });
  })
}