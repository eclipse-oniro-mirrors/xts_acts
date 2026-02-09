/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import osAccount from '@ohos.account.osAccount'
import distributedAccount from '@ohos.account.distributedAccount'
import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'

let tag: string = 'testTag';

export default function ActsOsAccountThirdPartyTest_third_3_Static() {
  describe('ActsOsAccountThirdPartyTest_third_3_Static', () => {
    let accountManager: osAccount.AccountManager = osAccount.getAccountManager();
    hilog.info(0x0000, tag, "====>get os AccountManager finish====");
    
    /**
    * @tc.number   ActsOsAccountDeviceId_0100
    * @tc.name     ActsOsAccountDeviceId_0100
    * @tc.desc     get distributed virtual device ID queryDistributedVirtualDeviceId callback
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL2
    */
    it('ActsOsAccountDeviceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountDeviceId_0100 start====");
        let accountAbility: distributedAccount.DistributedAccountAbility =
          distributedAccount.getDistributedAccountAbility();
        accountAbility.setOsAccountDistributedInfo({
          name: 'ZhangSan',
          id: '12345',
          event: "Ohos.account.event.LOGIN"
        }, (err: BusinessError<void> | null): void => {
          hilog.info(0x0000, tag, "====>update distributedInfo err: " + JSON.stringify(err));
          accountManager.queryDistributedVirtualDeviceId((err: BusinessError<void> | null,
            id: string | undefined): void => {
            hilog.info(0x0000, tag, "====>queryDistributedVirtualDeviceId err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>queryDistributedVirtualDeviceId deviceId: " + id);
            try {
              if (err) {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              } else {
                if (id) {
                  expect(id !== 'ohosAnonymousUid').assertTrue();
                  hilog.info(0x0000, tag, "====>ActsOsAccountDeviceId_0100 end====");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
            }
            done();
          });
        });
      });
    
    /**
    * @tc.number   ActsOsAccountDeviceId_0200
    * @tc.name     ActsOsAccountDeviceId_0200
    * @tc.desc     get distributed virtual device ID queryDistributedVirtualDeviceId promise
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL2
    */
    it('ActsOsAccountDeviceId_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountDeviceId_0200 start====");
        let accountAbility: distributedAccount.DistributedAccountAbility =
          distributedAccount.getDistributedAccountAbility();
        await accountAbility.setOsAccountDistributedInfo({
          name: 'ZhangSan',
          id: '12345',
          event: "Ohos.account.event.LOGIN"
        });
        try {
          hilog.info(0x0000, tag, "====>queryDistributedVirtualDeviceId start====");
          let id: string = await accountManager.queryDistributedVirtualDeviceId();
          hilog.info(0x0000, tag, "====>queryDistributedVirtualDeviceId: " + id);
          expect(id !== 'ohosAnonymousUid').assertTrue();
          hilog.info(0x0000, tag, "====>ActsOsAccountDeviceId_0200 end====");
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
        }
        done();
      });

    /**
    * @tc.number   ActsOsAccountCheckMulty_0100
    * @tc.name     ActsOsAccountCheckMulty_0100
    * @tc.desc     Check checkMultiOsAccountEnabled callback
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL0
    */
    it('ActsOsAccountCheckMulty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountCheckMulty_0100 start====");
        accountManager.checkMultiOsAccountEnabled((err: BusinessError<void> | null,
          data: boolean | undefined): void => {
          hilog.info(0x0000, tag, "====>checkMultiOsAccountEnabled err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>checkMultiOsAccountEnabled data: " + data);
          try {
            if (err) {
              hilog.info(0x0000, tag, '====>queryDistributedVirtualDeviceId fail');
              expect().assertFail();
            } else {
              if (data) {
                expect(data !== null).assertTrue();
                hilog.info(0x0000, tag, "====>ActsOsAccountCheckMulty_0100 end====");
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });

    /**
    * @tc.number   ActsOsAccountCheckMulty_0200
    * @tc.name     ActsOsAccountCheckMulty_0200
    * @tc.desc     Check checkMultiOsAccountEnabled promise
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL0
    */
    it('ActsOsAccountCheckMulty_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountCheckMulty_0200 start====");
        try {
          let data: boolean = await accountManager.checkMultiOsAccountEnabled();
          hilog.info(0x0000, tag, "====>checkMultiOsAccountEnabled data: " + data);
          expect(data !== null).assertTrue();
          hilog.info(0x0000, tag, "====>ActsOsAccountCheckMulty_0200 end====");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>catch checkMultiOsAccountEnabled err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountCheckTest_0100
    * @tc.name     ActsOsAccountCheckTest_0100
    * @tc.desc     check whether this OS account is a test OS account checkOsAccountTestable callback
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL4
    */
    it('ActsOsAccountCheckTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountCheckTest_0100 start====");
        accountManager.checkOsAccountTestable((err: BusinessError<void> | null, data: boolean | undefined): void => {
          hilog.info(0x0000, tag, "====>checkOsAccountTestable err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>checkOsAccountTestable data: " + data);
          try {
            if (err) {
              hilog.info(0x0000, tag, '====>checkOsAccountTestable fail');
              expect().assertFail();
            } else {
              expect(data).assertEqual(false);
              hilog.info(0x0000, tag, "====>ActsOsAccountCheckTest_0100 end====");
            }
          } catch (err) {
            hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
          }
          done();
        });
      });
    /**
    * @tc.number   ActsOsAccountCheckTest_0200
    * @tc.name     ActsOsAccountCheckTest_0200
    * @tc.desc     check whether this OS account is a test OS account, checkOsAccountTestable promise
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL4
    */
    it('ActsOsAccountCheckTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(0x0000, tag, "====>ActsOsAccountCheckTest_0200 start====");
          let isTest: boolean = await accountManager.checkOsAccountTestable();
          expect(isTest).assertFalse();
          hilog.info(0x0000, tag, "====>ActsOsAccountCheckTest_0200 end====");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   ActsOsAccountIsOsAccountUnlocked_0100
     * @tc.number ActsOsAccountIsOsAccountUnlocked_0100
     * @tc.desc   Verify isOsAccountUnlocked that the initial state query is unlocked to false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsOsAccountIsOsAccountUnlocked_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(0x0000, tag, "====>ActsOsAccountIsOsAccountUnlocked_0100 start====");
          let isUnlocked: boolean = await accountManager.isOsAccountUnlocked();
          hilog.info(0x0000, tag, "====>IsOsAccountUnlocked data: " + isUnlocked);
          expect(isUnlocked).assertEqual(true);
          hilog.info(0x0000, tag, "====>ActsOsAccountIsOsAccountUnlocked_0100 end====");
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>catch err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });
  })
}
