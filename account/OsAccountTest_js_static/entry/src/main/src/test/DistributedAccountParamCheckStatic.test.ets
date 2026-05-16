/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import distributedAccount from '@ohos.account.distributedAccount'
import Want from '@ohos.app.ability.Want';
import { describe, it, expect, TestType, Size, Level, beforeEach } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

let tag: string = 'testTag';

export default function DistributedAccountParamCheckStatic() {
  describe('DistributedAccountParamCheckStatic', () => {
    let distributedAccountAbility:distributedAccount.DistributedAccountAbility = distributedAccount.getDistributedAccountAbility();
    hilog.info(0x0000, tag, '====>getDistributedAccountAbility finish====');

    /**
     * @tc.number     DistributedAccountParamCheckStatic_0100
     * @tc.name       DistributedAccountParamCheckStatic_0100
     * @tc.desc       createAccount with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('DistributedAccountParamCheckStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0100 start====");
        let accountInfo: distributedAccount.DistributedInfo = {
          name: 'testName',
          id: 'testId',
          event: 'testEvent',
          status: distributedAccount.DistributedAccountStatus.NOT_LOGGED_IN
        };
        try {
          await distributedAccountAbility.setOsAccountDistributedInfo(accountInfo);
          hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0100 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0100 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     DistributedAccountParamCheckStatic_0200
     * @tc.name       DistributedAccountParamCheckStatic_0200
     * @tc.desc       createAccount with options, empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('DistributedAccountParamCheckStatic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0200 start====");
        let accountInfo: distributedAccount.DistributedInfo = {
          name: 'testName',
          id: 'testId',
          event: 'testEvent',
          status: distributedAccount.DistributedAccountStatus.NOT_LOGGED_IN
        };
        distributedAccountAbility.setOsAccountDistributedInfo(accountInfo, (err: BusinessError | null) => {
          if (err) {
            hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0200 err: " + err.code);
            expect(err.code).assertEqual(12300002);
            done();
          } else {
            hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0200 run err");
            expect().assertFail();
            done();
          }
        });
      });
    /**
     * @tc.number     DistributedAccountParamCheckStatic_0300
     * @tc.name       DistributedAccountParamCheckStatic_0300
     * @tc.desc       createAccount with empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('DistributedAccountParamCheckStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0300 start====");
        let accountInfo: distributedAccount.DistributedInfo = {
          name: 'testName',
          id: 'testId',
          event: 'testEvent',
          status: distributedAccount.DistributedAccountStatus.LOGGED_IN
        };
        try {
          await distributedAccountAbility.setOsAccountDistributedInfo(accountInfo);
          hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0300 run err");
          expect().assertFail();
        } catch (err) {
          hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0300 err: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300002);
        }
        done();
      });

    /**
     * @tc.number     DistributedAccountParamCheckStatic_0400
     * @tc.name       DistributedAccountParamCheckStatic_0400
     * @tc.desc       createAccount with options, empty string name parameter
     * @tc.type       FUNCTION
     * @tc.size       MEDIUMTEST
     * @tc.level      LEVEL3
     */
    it('DistributedAccountParamCheckStatic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0400 start====");
        let accountInfo: distributedAccount.DistributedInfo = {
          name: 'testName',
          id: 'testId',
          event: 'testEvent',
          status: distributedAccount.DistributedAccountStatus.LOGGED_IN
        };
        distributedAccountAbility.setOsAccountDistributedInfo(accountInfo, (err: BusinessError | null) => {
          if (err) {
            hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0400 err: " + err.code);
            expect(err.code).assertEqual(12300002);
            done();
          } else {
            hilog.info(0x0000, tag, "====>DistributedAccountParamCheckStatic_0400 run err");
            expect().assertFail();
            done();
          }
        });
      });
    /**
     * @tc.name   DistributedAccountParamCheck_1700
     * @tc.number DistributedAccountParamCheck_1700
     * @tc.desc   return of getDistributedAccountAbility.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>DistributedAccountParamCheck_1700 start");
        try {
          let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
          hilog.info(0x0000, tag, "====>distributedAccountAbility is: " + JSON.stringify(distributedAccountAbility));
          expect(distributedAccountAbility).not().assertUndefined();
        } catch (err) {
          hilog.info(0x0000, tag, "====>catch err: " + err.code);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   DistributedAccountParamCheck_1900
     * @tc.number DistributedAccountParamCheck_1900
     * @tc.desc   setOsAccountDistributedInfo with status NOT_LOGGED_IN callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('DistributedAccountParamCheck_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>DistributedAccountParamCheck_1900 start");
        let distributedAccountAbility = distributedAccount.getDistributedAccountAbility();
        distributedAccountAbility.getOsAccountDistributedInfo((err: BusinessError | null, data: distributedAccount.DistributedInfo | undefined): void => {
          hilog.info(0x0000, tag, "====>err: " + JSON.stringify(err));
          hilog.info(0x0000, tag, "====>data: " + JSON.stringify(data));
          if (data) {
            try {
              expect(data.name).not().assertUndefined();
              expect(data.id).not().assertUndefined();
              expect(data.event).not().assertUndefined();
              expect(data.nickname).not().assertUndefined();
              expect(data.avatar).not().assertUndefined();
              expect(data.status).not().assertUndefined();
              expect(data.scalableData).not().assertUndefined();
            } catch (e) {
              hilog.info(0x0000, tag, "====>Assert Fail:" + JSON.stringify(e));
            }
          } else {
            expect().assertFail();
          }
          done();
        })
      });
  });
}
