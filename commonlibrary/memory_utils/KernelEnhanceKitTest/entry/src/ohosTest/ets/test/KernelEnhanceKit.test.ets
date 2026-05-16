/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'
const sleep = (ms: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function KernelEnhanceKitTest() {
  describe('kernelEnhanceKitTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(async (done:Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(100);
      done();
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.name   SUB_CstandardLibrary_calloc
     * @tc.number SUB_CstandardLibrary_calloc
     * @tc.desc   test CstandardLibrary_calloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_CstandardLibrary_calloc', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.cstandardLibrary_calloc();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_CstandardLibrary_calloc catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_CstandardLibrary_realloc
     * @tc.number SUB_CstandardLibrary_realloc
     * @tc.desc   test CstandardLibrary_realloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_CstandardLibrary_realloc', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.cstandardLibrary_realloc();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_CstandardLibrary_realloc catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_CstandardLibrary_valloc
     * @tc.number SUB_CstandardLibrary_valloc
     * @tc.desc   test CstandardLibrary_valloc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_CstandardLibrary_valloc', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.cstandardLibrary_valloc();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_CstandardLibrary_valloc catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_CstandardLibrary_memalign
     * @tc.number SUB_CstandardLibrary_memalign
     * @tc.desc   test CstandardLibrary_memalign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_CstandardLibrary_memalign', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.cstandardLibrary_memalign();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_CstandardLibrary_memalign catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_CstandardLibrary_mallinfo
     * @tc.number SUB_CstandardLibrary_mallinfo
     * @tc.desc   test CstandardLibrary_mallinfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_CstandardLibrary_mallinfo', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.cstandardLibrary_mallinfo();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_CstandardLibrary_mallinfo catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_CstandardLibrary_mallinfo2
     * @tc.number SUB_CstandardLibrary_mallinfo2
     * @tc.desc   test CstandardLibrary_mallinfo2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_CstandardLibrary_mallinfo2', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.cstandardLibrary_mallinfo2();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_CstandardLibrary_mallinfo2 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_CstandardLibrary_malloc_check_from_ptr
     * @tc.number SUB_CstandardLibrary_malloc_check_from_ptr
     * @tc.desc   test CstandardLibrary_mallinfo2_keepcost
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_CstandardLibrary_malloc_check_from_ptr', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.cstandardLibrary_malloc_check_from_ptr();
        expect(c).assertEqual(3);
      } catch (err) {
        console.error("====>SUB_CstandardLibrary_malloc_check_from_ptr catch err: " + err);
        expect(false).assertEqual(0);
      }
    });
  })
}