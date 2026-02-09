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
import { BusinessError } from '@ohos.base';
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import Utils from './Util.test';
import hilog from '@ohos.hilog'

let tag: string = 'testTag';

export default function ActsOsAccountTestStatic() {
  describe('ActsOsAccountTestStatic', () => {
    let accountManager = osAccount.getAccountManager();
    hilog.info(0x0000, tag, "====>get os AccountManager finish====");

    /**
    * @tc.number   ActsOsAccountGetSerialNumberForOsAccountLocalId_0300
    * @tc.name     ActsOsAccountGetSerialNumberForOsAccountLocalId_0300
    * @tc.desc     Verify Parameter error code getSerialNumberForOsAccountLocalId callback
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL3
    */
    it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0300 start====");
        try {
          accountManager.getSerialNumberForOsAccountLocalId(-1,
            (err: BusinessError<void> | null, data: long | undefined): void => {
              hilog.info(0x0000, tag, "====>GetSerialNumberForOsAccountLocalId_0300 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>GetSerialNumberForOsAccountLocalId_0300 data: " + data);
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300003);
                  hilog.info(0x0000, tag, "====>getSerialNumberForOsAccountLocalId end====");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
              }
              done();
            });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>GetSerialNumberForOsAccountLocalId_0300 error: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountGetSerialNumberForOsAccountLocalId_0400
    * @tc.name     ActsOsAccountGetSerialNumberForOsAccountLocalId_0400
    * @tc.desc     Verify Parameter error code getSerialNumberForOsAccountLocalId callback
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL3
    */
    it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0400 start====");
        try {
          accountManager.getSerialNumberForOsAccountLocalId(9999,
            (err: BusinessError<void> | null, data: long | undefined): void => {
              hilog.info(0x0000, tag, "====>GetSerialNumberForOsAccountLocalId_0400 err: " + JSON.stringify(err));
              hilog.info(0x0000, tag, "====>GetSerialNumberForOsAccountLocalId_0400 data: " + data);
              try {
                if (err) {
                  expect(err?.code).assertEqual(12300003);
                  hilog.info(0x0000, tag, "====>getSerialNumberForOsAccountLocalId end====");
                } else {
                  hilog.info(0x0000, tag, "====>run err");
                  expect().assertFail();
                }
              } catch (err) {
                hilog.info(0x0000, tag, '====>Assert Fail, err: ' + JSON.stringify(err));
              }
              done();
            });
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>GetSerialNumberForOsAccountLocalId_0400 error: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountGetSerialNumberForOsAccountLocalId_0700
    * @tc.name     ActsOsAccountGetSerialNumberForOsAccountLocalId_0700
    * @tc.desc     Verify Parameter error code getSerialNumberForOsAccountLocalId promise
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL3
    */
    it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0700 start====");
        try {
          await accountManager.getSerialNumberForOsAccountLocalId(-1);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>GetSerialNumberForOsAccountLocalId_0700 error: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          done();
        }
      });

    /**
    * @tc.number   ActsOsAccountGetSerialNumberForOsAccountLocalId_0800
    * @tc.name     ActsOsAccountGetSerialNumberForOsAccountLocalId_0800
    * @tc.desc     Verify Parameter error code getSerialNumberForOsAccountLocalId promise
    * @tc.type     FUNCTION
    * @tc.size     MEDIUMTEST
    * @tc.level    LEVEL3
    */
    it('ActsOsAccountGetSerialNumberForOsAccountLocalId_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        hilog.info(0x0000, tag, "====>ActsOsAccountGetSerialNumberForOsAccountLocalId_0800 start====");
        try {
          await accountManager.getSerialNumberForOsAccountLocalId(9999);
          expect().assertFail();
          done();
        } catch (err) {
          err = err as BusinessError;
          hilog.info(0x0000, tag, "====>GetSerialNumberForOsAccountLocalId_0800 error: " + JSON.stringify(err));
          expect(err.code).assertEqual(12300003);
          done();
        }
      });
  });
}