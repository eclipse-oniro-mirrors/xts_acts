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

import { describe, it, expect, Level } from '@ohos/hypium'
import commoneventerror from 'libcommoneventerrorcode.so'

export default function ActsCommonEventErrorTest() {
  describe('ActsCommonEventErrorTest', () => {
    /**
     * @tc.number  : SUB_CommonEvent_NoError_0100
     * @tc.name    : testCommonEventNoError0100
     * @tc.desc    : Gets the name of the OS account to which the caller process belongs.
     * @tc.level   : Level0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testCommonEventNoError0100', Level.LEVEL2, async (done: Function) => {
      try {
        console.info("====>TestCommonEventNoError start====");
        let result: number = commoneventerror.testCommonEventNoError();
        expect(result).assertEqual(0);
        console.info("====>TestCommonEventNoError result: " + result);
        done()
      } catch (err) {
        console.error("====>TestCommonEventNoError catch err: " + err);
        done()
      }
    });
  })
}
