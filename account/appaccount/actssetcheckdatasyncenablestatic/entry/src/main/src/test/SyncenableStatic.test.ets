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
import { describe, beforeAll, Hypium, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base'
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { Permissions } from 'permissions';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { AppStorage } from '@ohos.arkui.stateManagement'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let tag: string = 'testTag';
let gContext: common.UIAbilityContext;

export default function ActsSetCheckDataSyncEnabledStatic() {
  describe('ActsSetCheckDataSyncEnabledStatic', () => {
    let accountManager: account.AppAccountManager = account.createAppAccountManager();
    hilog.info(0x0000, tag, "====>create finish====");

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabledStatic beforeAll start====");
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actssetcheckdatasyncenable.static");
      await Utils.msSleep(2000);
      try {
        gContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext;
        if (gContext) {
          let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
          let permissions: Array<Permissions> = ['ohos.permission.DISTRIBUTED_DATASYNC'];
          hilog.info(0x0000, tag, "====>start requestPermissionsFromUser");
          atManager.requestPermissionsFromUser(gContext, permissions,
            (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
              hilog.info(0x0000, tag, "====>request success permissions" + JSON.stringify(data));
              hilog.info(0x0000, tag, "====>getPermissionRequestResult err" + JSON.stringify(err));
              done();
            });
          await Utils.msSleep(2000);
          await Utils.clickRequestPermission('允许');
        } else {
          hilog.error(0x0000, tag, '====>context is undefined====');
        }
      } catch (err) {
        err = err as BusinessError;
        hilog.info(0x0000, tag, "====>beforeAll failed, err: " + JSON.stringify(err));
      }
    });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_0100
    * @tc.name       ActsSetCheckDataSyncEnabled_0100
    * @tc.desc       Get the synchronization flag of the account that has not set the synchronization flag
    *                 Check sync flag callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0100 start====");
        accountManager.createAccount("syncenable_callback_notset", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 0100 err: " + JSON.stringify(err));
          accountManager.checkDataSyncEnabled("syncenable_callback_notset",
            (err: BusinessError<void> | null, data: boolean | undefined): void => {
              hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0100 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0100 data: " + JSON.stringify(data));
              try {
                if (err) {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                } else {
                  expect(data).assertEqual(false);
                }
              } catch (err) {
                hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
              }
              accountManager.removeAccount("syncenable_callback_notset", (err: BusinessError<void> | null): void => {
                hilog.info(0x0000, tag, "====>delete Account 0100 err: " + JSON.stringify(err));
                try {
                  expect(err).assertEqual(null);
                } catch (err) {
                  hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                }
                hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0100 end====");
                done();
              });
            });
        });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_0200
    * @tc.name       ActsSetCheckDataSyncEnabled_0200
    * @tc.desc       Get the synchronization flag of the account that has not set the synchronization flag
    *                 Check sync flag promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0200 start====");
        await accountManager.createAccount("syncenable_promise_notset");
        hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0200 start====");
        try {
          let data: boolean = await accountManager.checkDataSyncEnabled("syncenable_promise_notset");
          hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0200 data: " + JSON.stringify(data));
          expect(data).assertEqual(false);
          hilog.info(0x0000, tag, "====>delete account 0200 start====");
          await accountManager.removeAccount("syncenable_promise_notset");
          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>checkDataSyncEnabled 0200 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_0300
    * @tc.name       ActsSetCheckDataSyncEnabled_0300
    * @tc.desc       Check the synchronization flag after setting the synchronization flag to true for the account
    *                 Check the set synchronization flag callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsSetCheckDataSyncEnabled_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0300 start====");
        accountManager.createAccount("syncenable_callback_settrue", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 0300 err: " + JSON.stringify(err));
          accountManager.setDataSyncEnabled("syncenable_callback_settrue", true,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setDataSyncEnabled 0300 err: " + JSON.stringify(err));
              accountManager.checkDataSyncEnabled("syncenable_callback_settrue",
                (err: BusinessError<void> | null, data: boolean | undefined): void => {
                  hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0300 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0300 data: " + JSON.stringify(data));
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      if (data) {
                        expect(data).assertEqual(true);
                      } else {
                        hilog.info(0x0000, tag, "====>run err");
                        expect().assertFail();
                      }
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("syncenable_callback_settrue",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>delete Account 0300 err: " + JSON.stringify(err));
                      try {
                        expect(err).assertEqual(null);
                      } catch (err) {
                        hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                      }
                      hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0300 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_0400
    * @tc.name       ActsSetCheckDataSyncEnabled_0400
    * @tc.desc       Check the synchronization flag after setting the synchronization flag to true for the account
    *                 Check the set synchronization flag promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL0
    */
    it('ActsSetCheckDataSyncEnabled_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0400 start====");
        await accountManager.createAccount("syncenable_promise_settrue");
        hilog.info(0x0000, tag, "====>setDataSyncEnabled 0400 start====");
        await accountManager.setDataSyncEnabled("syncenable_promise_settrue", true);
        hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0400 start====");
        try {
          let data: boolean = await accountManager.checkDataSyncEnabled("syncenable_promise_settrue");
          hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0400 data: " + JSON.stringify(data));
          expect(data).assertEqual(true);
          hilog.info(0x0000, tag, "====>delete account 0400 start====");
          await accountManager.removeAccount("syncenable_promise_settrue");
          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0400 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>checkDataSyncEnabled 0400 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_0500
    * @tc.name       ActsSetCheckDataSyncEnabled_0500
    * @tc.desc       Check the synchronization flag after setting the synchronization flag to false for the account
    *                 Check the set synchronization flag callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0500 start====");
        accountManager.createAccount("syncenable_callback_setfalse", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 0500 err: " + JSON.stringify(err));
          accountManager.setDataSyncEnabled("syncenable_callback_setfalse", false,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setDataSyncEnabled 0500 err: " + JSON.stringify(err));
              accountManager.checkDataSyncEnabled("syncenable_callback_setfalse",
                (err: BusinessError<void> | null, data: boolean | undefined): void => {
                  hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0500 err: " + JSON.stringify(err));
                  hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0500 data: " + JSON.stringify(data));
                  try {
                    if (err) {
                      hilog.info(0x0000, tag, "====>run err");
                      expect().assertFail();
                    } else {
                      expect(data).assertEqual(false);
                    }
                  } catch (err) {
                    hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                  }
                  accountManager.removeAccount("syncenable_callback_setfalse",
                    (err: BusinessError<void> | null): void => {
                      hilog.info(0x0000, tag, "====>delete Account 0500 err: " + JSON.stringify(err));
                      try {
                        expect(err).assertEqual(null);
                      } catch (err) {
                        hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                      }
                      hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0500 end====");
                      done();
                    });
                });
            });
        });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_0600
    * @tc.name       ActsSetCheckDataSyncEnabled_0600
    * @tc.desc       Check the synchronization flag after setting the synchronization flag to false for the account
    *                 Check the set synchronization flag promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0600 start====");
        hilog.info(0x0000, tag, "====>add account 0600 start====");
        await accountManager.createAccount("syncenable_promise_setfalse");
        hilog.info(0x0000, tag, "====>setDataSyncEnabled 0600 start====");
        await accountManager.setDataSyncEnabled("syncenable_promise_setfalse", false);
        hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0600 start====");
        try {
          let data: boolean = await accountManager.checkDataSyncEnabled("syncenable_promise_setfalse");
          hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0600 data: " + JSON.stringify(data));
          expect(data).assertEqual(false);
          hilog.info(0x0000, tag, "====>delete account 0600 start====");
          await accountManager.removeAccount("syncenable_promise_setfalse");
          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0600 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>checkDataSyncEnabled 0600 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_0700
    * @tc.name       ActsSetCheckDataSyncEnabled_0700
    * @tc.desc       Check the synchronization flag after setting the synchronization flag for the account to false
    *                 for the first time and true for the second time, Check the set synchronization flag callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0700 start====");
        accountManager.createAccount("syncenable_callback_falsetrue", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 0700 err: " + JSON.stringify(err));
          accountManager.setDataSyncEnabled("syncenable_callback_falsetrue", false,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setDataSyncEnabled first time 0700 err: " + JSON.stringify(err));
              accountManager.setDataSyncEnabled("syncenable_callback_falsetrue", true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>setDataSyncEnabled second time 0700 err: " + JSON.stringify(err));
                  accountManager.checkDataSyncEnabled("syncenable_callback_falsetrue",
                    (err: BusinessError<void> | null, data: boolean | undefined): void => {
                      hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0700 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0700 data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual(true);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("syncenable_callback_falsetrue",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>delete Account 0700 err: " + JSON.stringify(err));
                          try {
                            expect(err).assertEqual(null);
                          } catch (err) {
                            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                          }
                          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0700 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_0800
    * @tc.name       ActsSetCheckDataSyncEnabled_0800
    * @tc.desc       Check the synchronization flag after setting the synchronization flag for the account to false
    *                 for the first time and true for the second time, Check the set synchronization flag promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0800 start====");
        hilog.info(0x0000, tag, "====>add account 0800 start====");
        await accountManager.createAccount("syncenable_promise_truefalse");
        hilog.info(0x0000, tag, "====>setDataSyncEnabled first time 0800 start====");
        await accountManager.setDataSyncEnabled("syncenable_promise_truefalse", false);
        hilog.info(0x0000, tag, "====>setDataSyncEnabled second time 0800 start====");
        await accountManager.setDataSyncEnabled("syncenable_promise_truefalse", true);
        hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0800 start====");
        try {
          let data: boolean = await accountManager.checkDataSyncEnabled("syncenable_promise_truefalse");
          hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0800 data: " + JSON.stringify(data));
          expect(data).assertEqual(true);
          hilog.info(0x0000, tag, "====>delete account 0800 start====");
          await accountManager.removeAccount("syncenable_promise_truefalse");
          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0800 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>checkDataSyncEnabled 0800 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_0900
    * @tc.name       ActsSetCheckDataSyncEnabled_0900
    * @tc.desc       Check the synchronization flag after setting the synchronization flag for the account to true
    *                 for the first time and false for the second time, Check the set synchronization flag callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0900 start====");
        accountManager.createAccount("syncenable_callback_falsetrue", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 0900 err: " + JSON.stringify(err));
          accountManager.setDataSyncEnabled("syncenable_callback_falsetrue", true,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setDataSyncEnabled first time 0900 err: " + JSON.stringify(err));
              accountManager.setDataSyncEnabled("syncenable_callback_falsetrue", false,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>setDataSyncEnabled second time 0900 err: " + JSON.stringify(err));
                  accountManager.checkDataSyncEnabled("syncenable_callback_falsetrue",
                    (err: BusinessError<void> | null, data: boolean | undefined): void => {
                      hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0900 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>checkDataSyncEnabled 0900 data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          expect(data).assertEqual(false);
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("syncenable_callback_falsetrue",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>delete Account 0900 err: " + JSON.stringify(err));
                          try {
                            expect(err).assertEqual(null);
                          } catch (err) {
                            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                          }
                          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_0900 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_1000
    * @tc.name       ActsSetCheckDataSyncEnabled_1000
    * @tc.desc       Check the synchronization flag after setting the synchronization flag for the account to true
    *                 for the first time and false for the second time, Check the set synchronization flag promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1000 start====");
        hilog.info(0x0000, tag, "====>add account 1000 start====");
        await accountManager.createAccount("syncenable_promise_truefalse");
        hilog.info(0x0000, tag, "====>setDataSyncEnabled first time 1000 start====");
        await accountManager.setDataSyncEnabled("syncenable_promise_truefalse", true);
        hilog.info(0x0000, tag, "====>setDataSyncEnabled second time 1000 start====");
        await accountManager.setDataSyncEnabled("syncenable_promise_truefalse", false);
        hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1000 start====");
        try {
          let data: boolean = await accountManager.checkDataSyncEnabled("syncenable_promise_truefalse");
          hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1000 data: " + JSON.stringify(data));
          expect(data).assertEqual(false);
          hilog.info(0x0000, tag, "====>delete account 1000 start====");
          await accountManager.removeAccount("syncenable_promise_truefalse");
          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1000 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>checkDataSyncEnabled 1000 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_1100
    * @tc.name       ActsSetCheckDataSyncEnabled_1100
    * @tc.desc       Check the synchronization flag after setting the synchronization flag for the account to true
    *                 for the first time and true for the second time, Check the set synchronization flag callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1100 start====");
        accountManager.createAccount("syncenable_callback_truetrue", (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>add account 1100 err: " + JSON.stringify(err));
          accountManager.setDataSyncEnabled("syncenable_callback_truetrue", true,
            (err: BusinessError<void> | null): void => {
              hilog.info(0x0000, tag, "====>setDataSyncEnabled first time 1100 err: " + JSON.stringify(err));
              accountManager.setDataSyncEnabled("syncenable_callback_truetrue", true,
                (err: BusinessError<void> | null): void => {
                  hilog.info(0x0000, tag, "====>setDataSyncEnabled second time 1100 err: " + JSON.stringify(err));
                  accountManager.checkDataSyncEnabled("syncenable_callback_truetrue",
                    (err: BusinessError<void> | null, data: boolean | undefined): void => {
                      hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1100 err: " + JSON.stringify(err));
                      hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1100 data: " + JSON.stringify(data));
                      try {
                        if (err) {
                          hilog.info(0x0000, tag, "====>run err");
                          expect().assertFail();
                        } else {
                          if (data) {
                            expect(data).assertEqual(true);
                          } else {
                            hilog.info(0x0000, tag, "====>run err");
                            expect().assertFail();
                          }
                        }
                      } catch (err) {
                        hilog.error(0x0000, tag, "====>Assert Fail, err: " + JSON.stringify(err));
                      }
                      accountManager.removeAccount("syncenable_callback_truetrue",
                        (err: BusinessError<void> | null): void => {
                          hilog.info(0x0000, tag, "====>delete Account 1100 err: " + JSON.stringify(err));
                          try {
                            expect(err).assertEqual(null);
                          } catch (err) {
                            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
                          }
                          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1100 end====");
                          done();
                        });
                    });
                });
            });
        });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_1200
    * @tc.name       ActsSetCheckDataSyncEnabled_1200
    * @tc.desc       Check the synchronization flag after setting the synchronization flag for the account to true
    *                 for the true time and true for the second time, Check the set synchronization flag promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1200 start====");
        hilog.info(0x0000, tag, "====>add account 1200 start====");
        await accountManager.createAccount("syncenable_promise_truetrue");
        hilog.info(0x0000, tag, "====>setDataSyncEnabled first time 1200 start====");
        await accountManager.setDataSyncEnabled("syncenable_promise_truetrue", true);
        hilog.info(0x0000, tag, "====>setDataSyncEnabled second time 1200 start====");
        await accountManager.setDataSyncEnabled("syncenable_promise_truetrue", true);
        hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1200 start====");
        try {
          let data: boolean = await accountManager.checkDataSyncEnabled("syncenable_promise_truetrue");
          hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1200 data: " + JSON.stringify(data));
          expect(data).assertEqual(true);
          hilog.info(0x0000, tag, "====>delete account 1200 start====");
          await accountManager.removeAccount("syncenable_promise_truetrue");
          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.error(0x0000, tag, "====>checkDataSyncEnabled 1200 fail err: " + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_1300
    * @tc.name       ActsSetCheckDataSyncEnabled_1300
    * @tc.desc       Set synchronization flag for non-existent account, setDataSyncEnabled callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1300 start====");
        hilog.info(0x0000, tag, "====>setDataSyncEnabled 1300 start====");
        let accountNotExist: string = "syncenable_callback_notexist";
        accountManager.setDataSyncEnabled(accountNotExist, true, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>setDataSyncEnabled 1300 err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300003);
              hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1300 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_1400
    * @tc.name       ActsSetCheckDataSyncEnabled_1400
    * @tc.desc       Set synchronization flag for non-existent account, setDataSyncEnabled promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1400 start====");
        hilog.info(0x0000, tag, "====>setDataSyncEnabled 1400 start====");
        let accountNotExist: string = "syncenable_promise_notexist";
        try {
          await accountManager.setDataSyncEnabled(accountNotExist, true);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setDataSyncEnabled 1400 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1400 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_1500
    * @tc.name       ActsSetCheckDataSyncEnabled_1500
    * @tc.desc       Check synchronization flag for non-existent account, checkDataSyncEnabled callback form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1500 start====");
        hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1500 start====");
        let accountNotExist: string = "syncenable_callback_notexist";
        accountManager.checkDataSyncEnabled(accountNotExist,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1500 err: " + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
                hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1500 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_1600
    * @tc.name       ActsSetCheckDataSyncEnabled_1600
    * @tc.desc       Check synchronization flag for non-existent account, checkDataSyncEnabled promise form
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1600 start====");
        hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1600 start====");
        let accountNotExist: string = "syncenable_promise_notexist";
        try {
          await accountManager.checkDataSyncEnabled(accountNotExist);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>checkDataSyncEnabled 1600 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1600 end====");
          done();
        }
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_1700
    * @tc.name       ActsSetCheckDataSyncEnabled_1700
    * @tc.desc       12300002 param check, test interface checkDataSyncEnabled callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>ActsSetCheckDataSyncEnabled_1700 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < 512 + 1; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start checkDataSyncEnabled");
        accountManager.checkDataSyncEnabled(accountName,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300002);
                hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1700 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_1800
    * @tc.name       ActsSetCheckDataSyncEnabled_1800
    * @tc.desc       13200003 param check, test interface setDataSyncEnabled promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsSetCheckDataSyncEnabled_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>ActsSetCheckDataSyncEnabled_1800 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < 512; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start checkDataSyncEnabled");
          let data: boolean = await accountManager.checkDataSyncEnabled(accountName);
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
    * @tc.number     ActsSetCheckDataSyncEnabled_1900
    * @tc.name       ActsSetCheckDataSyncEnabled_1900
    * @tc.desc       12300003 param check, test interface checkDataSyncEnabled callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsSetCheckDataSyncEnabled_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>ActsSetCheckDataSyncEnabled_1900 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = 'i';
        hilog.info(0x0000, tag, logTag + "start checkDataSyncEnabled");
        accountManager.checkDataSyncEnabled(accountName,
          (err: BusinessError<void> | null, data: boolean | undefined): void => {
            hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, logTag + "data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(12300003);
                hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_1900 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
            }
            done();
          });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_2000
    * @tc.name       ActsSetCheckDataSyncEnabled_2000
    * @tc.desc       13200002 param check, test interface checkDataSyncEnabled promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsSetCheckDataSyncEnabled_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>ActsSetCheckDataSyncEnabled_2000 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        try {
          hilog.info(0x0000, tag, logTag + "start checkDataSyncEnabled");
          let data: boolean = await accountManager.checkDataSyncEnabled(accountName);
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
    * @tc.number     ActsSetCheckDataSyncEnabled_2100
    * @tc.name       ActsSetCheckDataSyncEnabled_2100
    * @tc.desc       12300002 param check, test interface setDataSyncEnabled callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsSetCheckDataSyncEnabled_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>ActsSetCheckDataSyncEnabled_2100 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < 512 + 1; i++) {
          accountName += 'i';
        }
        hilog.info(0x0000, tag, logTag + "start setDataSyncEnabled");
        accountManager.setDataSyncEnabled(accountName, true, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300002);
              hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_2100 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_2200
    * @tc.name       ActsSetCheckDataSyncEnabled_2200
    * @tc.desc       13200003 param check, test interface setDataSyncEnabled promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsSetCheckDataSyncEnabled_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>ActsSetCheckDataSyncEnabled_2200 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        for (let i: int = 0; i < 512; i++) {
          accountName += 'i';
        }
        try {
          hilog.info(0x0000, tag, logTag + "start setDataSyncEnabled");
          await accountManager.setDataSyncEnabled(accountName, false);
          hilog.info(0x0000, tag, logTag + "run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        }
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_2300
    * @tc.name       ActsSetCheckDataSyncEnabled_2300
    * @tc.desc       12300003 param check, test interface setDataSyncEnabled callback
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL2
    */
    it('ActsSetCheckDataSyncEnabled_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>ActsSetCheckDataSyncEnabled_2300 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = 'i';
        hilog.info(0x0000, tag, logTag + "start setDataSyncEnabled");
        accountManager.setDataSyncEnabled(accountName, true, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, logTag + "err: " + JSON.stringify(err));
          try {
            if (err) {
              expect(err?.code).assertEqual(12300003);
              hilog.info(0x0000, tag, "====>ActsSetCheckDataSyncEnabled_2300 end====");
            } else {
              hilog.info(0x0000, tag, "====>run err");
              expect().assertFail();
            }
          } catch (err) {
            hilog.info(0x0000, tag, "====>Assert Fail: " + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number     ActsSetCheckDataSyncEnabled_2400
    * @tc.name       ActsSetCheckDataSyncEnabled_2400
    * @tc.desc       13200002 param check, test interface setDataSyncEnabled promise
    * @tc.type       FUNCTION
    * @tc.size       MEDIUMTEST
    * @tc.level      LEVEL3
    */
    it('ActsSetCheckDataSyncEnabled_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let logTag: string = "====>ActsSetCheckDataSyncEnabled_2400 ";
        hilog.info(0x0000, tag, logTag + "start====");
        let accountName: string = '';
        try {
          hilog.info(0x0000, tag, logTag + "start setDataSyncEnabled");
          await accountManager.setDataSyncEnabled(accountName, false);
          hilog.info(0x0000, tag, logTag + "run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, logTag + "catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
          hilog.info(0x0000, tag, logTag + "end====");
          done();
        }
      });
  });
}
