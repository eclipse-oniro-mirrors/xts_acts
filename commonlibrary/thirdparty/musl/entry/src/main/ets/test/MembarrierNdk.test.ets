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

import { describe, expect, it } from '@ohos/hypium'
import membarrier from 'libmembarrierndk.so'

export default function membarrierNdkTest() {
  describe('MuslMembarrierTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_MEMBARRIER_MEMBARRIER_0100
     * @tc.name       : testMuslMembarrierMembarrier001
     * @tc.desc       : test membarrier
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testMuslMembarrierMembarrier001', 0, async (done: Function) => {
      let a: number = membarrier.membarrier();
      expect(a).assertEqual(0);
      done()
    });


  })
}