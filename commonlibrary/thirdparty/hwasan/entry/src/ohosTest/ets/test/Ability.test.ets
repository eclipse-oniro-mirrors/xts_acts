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

import hwasan from 'libentry.so'
import { describe, it, expect , TestType, Size, Level } from "@ohos/hypium";

export default function abilityTest() {

  describe('ActsThirdPartyHWAsanTest', () => {
    /**
     * @tc.name   testHWAsanStackBufferOverflow001
     * @tc.number SUB_THIRDPARTY_HWASAN_STACKBUFFEROVERFLOW_0100
     * @tc.desc   test stackBufferOverflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHWAsanStackBufferOverflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hwasan.stackBufferOverflow();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHWAsanStackBufferUnderflow001
     * @tc.number SUB_THIRDPARTY_HWASAN_STACKBUFFERUNDERFLOW_0100
     * @tc.desc   test stackBufferUnderflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHWAsanStackBufferUnderflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hwasan.stackBufferUnderflow();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHWAsanHeapBufferOverflow001
     * @tc.number SUB_THIRDPARTY_HWASAN_HEAPBUFFEROVERFLOW_0100
     * @tc.desc   test heapBufferOverflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHWAsanHeapBufferOverflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hwasan.heapBufferOverflow();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHWAsanHeapBufferUnderflow001
     * @tc.number SUB_THIRDPARTY_HWASAN_HEAPBUFFERUNDERFLOW_0100
     * @tc.desc   test heapBufferUnderflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHWAsanHeapBufferUnderflow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hwasan.heapBufferUnderflow();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHWAsanHeapUseAfterFree001
     * @tc.number SUB_THIRDPARTY_HWASAN_HEAPUSEAFTERFREE_0100
     * @tc.desc   test heapUseAfterFree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHWAsanHeapUseAfterFree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hwasan.heapUseAfterFree();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHWAsanStackUseAfterScope001
     * @tc.number SUB_THIRDPARTY_HWASAN_STACKUSEAFTERSCOPE_0100
     * @tc.desc   test stackUseAfterScope
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHWAsanStackUseAfterScope001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hwasan.stackUseAfterScope();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHWAsanStackUseAfterReturn001
     * @tc.number SUB_THIRDPARTY_HWASAN_STACKUSEAFTERRETURN_0100
     * @tc.desc   test stackUseAfterReturn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHWAsanStackUseAfterReturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hwasan.stackUseAfterReturn();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHWAsanDoubleFree001
     * @tc.number SUB_THIRDPARTY_HWASAN_DOUBLEFREE_0100
     * @tc.desc   test doubleFree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHWAsanDoubleFree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hwasan.doubleFree();
      expect(result).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testHWAsanWildFree001
     * @tc.number SUB_THIRDPARTY_HWASAN_WILDFREE_0100
     * @tc.desc   test wildFree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testHWAsanWildFree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = hwasan.wildFree();
      expect(result).assertEqual(1);
      done()
    });

  })
}
