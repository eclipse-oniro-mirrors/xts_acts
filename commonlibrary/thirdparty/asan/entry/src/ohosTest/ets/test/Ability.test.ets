/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
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

import asan from 'libentry.so'
import Utils from './Utils'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';

export default function abilityTest() {

  describe('ActsThirdPartyAsanTest', () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      await Utils.sleep(1000)
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.sleep(1000)
    })

    /**
     * @tc.name   testStackBufferOverflow001
     * @tc.number SUB_THIRDPARTY_ASAN_STACKBUFFEROVERFLOW_0100
     * @tc.desc   test stackBufferOverflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackBufferOverflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = asan.stackBufferOverflow();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testStackBufferUnderflow001
     * @tc.number SUB_THIRDPARTY_ASAN_STACKBUFFERUNDERFLOW_0100
     * @tc.desc   test stackBufferUnderflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackBufferUnderflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = asan.stackBufferUnderflow();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHeapBufferOverflow001
     * @tc.number SUB_THIRDPARTY_ASAN_HEAPBUFFEROVERFLOW_0100
     * @tc.desc   test heapBufferOverflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeapBufferOverflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = asan.heapBufferOverflow();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHeapBufferUnderflow001
     * @tc.number SUB_THIRDPARTY_ASAN_HEAPBUFFERUNDERFLOW_0100
     * @tc.desc   test heapBufferUnderflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeapBufferUnderflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = asan.heapBufferUnderflow();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHeapUseAfterFree001
     * @tc.number SUB_THIRDPARTY_ASAN_HEAPUSEAFTERFREE_0100
     * @tc.desc   test heapUseAfterFree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHeapUseAfterFree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = asan.heapUseAfterFree();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testStackUseAfterScope001
     * @tc.number SUB_THIRDPARTY_ASAN_STACKUSEAFTERSCOPE_0100
     * @tc.desc   test stackUseAfterScope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackUseAfterScope001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = asan.stackUseAfterScope();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testStackUseAfterReturn001
     * @tc.number SUB_THIRDPARTY_ASAN_STACKUSEAFTERRETURN_0100
     * @tc.desc   test stackUseAfterReturn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStackUseAfterReturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = asan.stackUseAfterReturn();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testDoubleFree001
     * @tc.number SUB_THIRDPARTY_ASAN_DOUBLEFREE_0100
     * @tc.desc   test doubleFree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testDoubleFree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = asan.doubleFree();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testWildFree001
     * @tc.number SUB_THIRDPARTY_ASAN_WILDFREE_0100
     * @tc.desc   test wildFree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWildFree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = asan.wildFree();
      expect(result).assertEqual(1);
      done()
    });

  })
}
