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

import { describe, expect, it, TestType, Level, Size } from '@ohos/hypium'
import nativefence from 'libnativefence.so'

export default function nativeFenceTest() {
    describe('NativeFenceTest', () => {

    /**
     * @tc.number     : SUB_BASIC _GRAPHICS_SPECIAL_API_C_NATIVE_FENCE_0100
     * @tc.name       : testNativeFenceWait0100
     * @tc.desc       : test OH_NativeFence_Wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testNativeFenceWait0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitIs0();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_FENCE_0101
     * @tc.name       : testNativeFenceWait0101
     * @tc.desc       : test OH_NativeFence_Wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeFenceWait0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitIs500();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_FENCE_0102
     * @tc.name       : testNativeFenceWait0102
     * @tc.desc       : test OH_NativeFence_Wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeFenceWait0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitIs5000();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_FENCE_0103
     * @tc.name       : testNativeFenceWait0103
     * @tc.desc       : test OH_NativeFence_Wait
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('testNativeFenceWait0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitKill();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_BASIC_GRAPHICS_SPECIAL_API_C_NATIVE_FENCE_0200
     * @tc.name       : testNativeFenceWaitForever0200
     * @tc.desc       : test OH_NativeFence_WaitForever
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */

    it('testNativeFenceWaitForever0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitForeverKill();
      expect(result).assertEqual(0);
      done();
    });
  })
}
