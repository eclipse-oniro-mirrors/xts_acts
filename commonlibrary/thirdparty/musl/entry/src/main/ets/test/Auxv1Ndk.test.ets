/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import auxv from 'libauxv1ndk.so'

export default function auxv1NdkTest() {
  describe('MuslAuxv1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AUXV_GETAUXVAL_0100
     * @tc.name       : testMuslAuxvGetauxval001
     * @tc.desc       : test getauxval
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAuxvGetauxval001', 0, async (done: Function) => {
      let result: number = auxv.getauxval(0);
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_AUXV_GETAUXVAL_0200
     * @tc.name       : testMuslAuxvGetauxval002
     * @tc.desc       : test getauxval
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslAuxvGetauxval002', 0, async (done: Function) => {
      let result: number = auxv.getauxval(-1);
      expect(result).assertEqual(-1);
      done()
    });
  })
}
