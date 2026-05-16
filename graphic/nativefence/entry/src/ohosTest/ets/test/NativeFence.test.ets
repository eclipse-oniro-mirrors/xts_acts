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
     * @tc.name   testNativeFenceWait0100
     * @tc.number testNativeFenceWait0100
     * @tc.desc   testNativeFenceWait0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeFenceWait0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitIs0();
      expect(result).assertEqual(1);
      done();
    });


    /**
     * @tc.name   testNativeFenceWait0101
     * @tc.number testNativeFenceWait0101
     * @tc.desc   testNativeFenceWait0101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeFenceWait0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitIs500();
      expect(result).assertEqual(1);
      done();
    });


    /**
     * @tc.name   testNativeFenceWait0102
     * @tc.number testNativeFenceWait0102
     * @tc.desc   testNativeFenceWait0102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeFenceWait0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitIs5000();
      expect(result).assertEqual(1);
      done();
    });


    /**
     * @tc.name   testNativeFenceWait0103
     * @tc.number testNativeFenceWait0103
     * @tc.desc   testNativeFenceWait0103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNativeFenceWait0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitKill();
      expect(result).assertEqual(1);
      done();
    });


    /**
     * @tc.name   testNativeFenceWaitForever0200
     * @tc.number testNativeFenceWaitForever0200
     * @tc.desc   testNativeFenceWaitForever0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNativeFenceWaitForever0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = nativefence.nativeFenceWaitForeverKill();
      expect(result).assertEqual(1);
      done();
    });
  })
}
