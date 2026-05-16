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
import daccount from '@ohos.account.distributedAccount'
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'

let tag: string = 'testTag';

export default function ActsPermissionTestStatic() {
  describe('ActsPermissionTestStatic', () => {

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0300
     * @tc.number ActsOnlyOnePermissionTest_0300
     * @tc.desc   check getOsAccountDistributedInfo interface meeting ohos.permission.GET_DISTRIBUTED_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>start====");
      try {
        let accountAbility = daccount.getDistributedAccountAbility();
        let data = await accountAbility.getOsAccountDistributedInfo();
        hilog.info(0x0000, tag, '====>ActsOnlyOnePermissionTest_0300 data:' + JSON.stringify(data));
        expect(data).not().assertUndefined();
        done();
      } catch (err){
        hilog.info(0x0000, tag, '====>ActsOnlyOnePermissionTest_0300 err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ActsOnlyOnePermissionTest_0400
     * @tc.number ActsOnlyOnePermissionTest_0400
     * @tc.desc   check getOsAccountDistributedInfo interface meeting ohos.permission.GET_DISTRIBUTED_ACCOUNTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ActsOnlyOnePermissionTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
      hilog.info(0x0000, tag, "====>start====");
      let accountAbility = daccount.getDistributedAccountAbility();
      try {
        accountAbility.getOsAccountDistributedInfo((err, data) => {
          hilog.info(0x0000, tag, '====>err: ' + JSON.stringify(err));
          hilog.info(0x0000, tag, '====>data: ' + JSON.stringify(data));
          expect(err).assertNull();
          done();
        });
      } catch (err) {
        hilog.info(0x0000, tag, '====>ActsOnlyOnePermissionTest_0400 err:' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });
  });
}
