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

import { describe, beforeEach, afterEach, it, expect, TestType, Size, Level } from "../../../hypium/index";
import account from '@ohos.account.distributedAccount'
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'

let tag: string = 'testTag';

export default function ActsDANoPermissionTestStatic() {
  describe('ActsDANoPermissionTestStatic', () => {

    /**
     * @tc.name   SUB_Account_DistributedAccount_NoPermission_static_0100
     * @tc.number SUB_Account_DistributedAccount_NoPermission_static_0100
     * @tc.desc   no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_DistributedAccount_NoPermission_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_DistributedAccount_NoPermission_0100 start====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          accountAbility.getOsAccountDistributedInfo((err: BusinessError<void> | null,
            data: account.DistributedInfo | undefined): void => {
            hilog.info(0x0000, tag, "====>0100 getOsAccountDistributedInfo err: " + JSON.stringify(err));
            hilog.info(0x0000, tag, "====>0100 getOsAccountDistributedInfo data: " + JSON.stringify(data));
            try {
              if (err) {
                expect(err?.code).assertEqual(201);
              } else {
                hilog.info(0x0000, tag, "====>run err");
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, "====>Assert err: " + JSON.stringify(err));
            }
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>getOsAccountDistributedInfo catch err: " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });

    /**
     * @tc.name   SUB_Account_DistributedAccount_NoPermission_static_0200
     * @tc.number SUB_Account_DistributedAccount_NoPermission_static_0200
     * @tc.desc   no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Account_DistributedAccount_NoPermission_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_DistributedAccount_NoPermission_0200 start====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        try {
          await accountAbility.getOsAccountDistributedInfo();
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>0200 getOsAccountDistributedInfo err: " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });

    /**
     * @tc.number   SUB_Account_DistributedAccount_NoPermission_static_0300
     * @tc.name     SUB_Account_DistributedAccount_NoPermission_static_0300
     * @tc.desc     no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_DistributedAccount_NoPermission_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_DistributedAccount_NoPermission_0300 start====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let accountInfo: account.DistributedInfo = { id: '12345', name: 'ZhangSan', event: 'Ohos.account.event.LOGIN' };
        try {
          hilog.info(0x0000, tag, "====>0300 start setOsAccountDistributedInfo");
          accountAbility.setOsAccountDistributedInfo(accountInfo, (err: BusinessError<void> | null): void => {
            hilog.info(0x0000, tag, '====>setOsAccountDistributedInfo exception: ' + JSON.stringify(err));
            try {
              if (err) {
                expect(err?.code).assertEqual(201);
              } else {
                hilog.info(0x0000, tag, '====>setOsAccountDistributedInfo fail');
                expect().assertFail();
              }
            } catch (err) {
              hilog.info(0x0000, tag, '====>Assert err: ' + JSON.stringify(err));
            }
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, '====>setOsAccountDistributedInfo exception: ' + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });

    /**
     * @tc.number   SUB_Account_DistributedAccount_NoPermission_static_0400
     * @tc.name     SUB_Account_DistributedAccount_NoPermission_static_0400
     * @tc.desc     no ohos.permission.MANAGE_DISTRIBUTED_ACCOUNTS.
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL3
     */
    it('SUB_Account_DistributedAccount_NoPermission_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>SUB_Account_DistributedAccount_NoPermission_0400 start====");
        let accountAbility: account.DistributedAccountAbility = account.getDistributedAccountAbility();
        let accountInfo: account.DistributedInfo = { id: '12345', name: 'ZhangSan', event: 'Ohos.account.event.LOGIN' };
        try {
          hilog.info(0x0000, tag, "====>0400 start setOsAccountDistributedInfo");
          await accountAbility.setOsAccountDistributedInfo(accountInfo);
          hilog.info(0x0000, tag, "====>run err");
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>setOsAccountDistributedInfo err: " + JSON.stringify(err));
          expect(err.code).assertEqual(201);
          done();
        }
      });
  });
}