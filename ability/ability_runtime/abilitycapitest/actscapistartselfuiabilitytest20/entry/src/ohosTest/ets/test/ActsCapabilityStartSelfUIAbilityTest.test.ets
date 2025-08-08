/*
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import osAccountNdk from 'libosaccountndk.so'

const OS_ACCOUNT_ERR_OK = 0;

export default function ActsCapabilityStartSelfUIAbilityTest() {
  describe('ActsCapabilityStartSelfUIAbilityTest', () => {

    /**
     * @tc.number  : DestroyChildProcessConfigsParamInvalid
     * @tc.name    : DestroyChildProcessConfigsParamInvalid
     * @tc.desc    : Meta-capability testing.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('DestroyChildProcessConfigsParamInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>DestroyChildProcessConfigsParamInvalid start====");
          let result = osAccountNdk.DestroyChildProcessConfigsParamInvalid();
          expect(401).assertEqual(result);
          console.info("====>DestroyChildProcessConfigsParamInvalid result: " + result);
          done()
        } catch (err) {
          console.error("====>DestroyChildProcessConfigsParamInvalid catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        }
      })

    /**
     * @tc.number  : DestroyChildProcessConfigsNoError
     * @tc.name    : DestroyChildProcessConfigsNoError
     * @tc.desc    : Meta-capability testing.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('DestroyChildProcessConfigsNoError', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>DestroyChildProcessConfigsNoError start====");
          let result = osAccountNdk.DestroyChildProcessConfigsNoError();
          expect(0).assertEqual(result);
          console.info("====>DestroyChildProcessConfigsNoError result: " + result);
          done()
        } catch (err) {
          console.error("====>DestroyChildProcessConfigsNoError catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
          done()
        }
      })
  })
}
