/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { FlatObj, Multiply } from '../../testability/pages/DataFlg';
import { sleep } from '../../testability/pages/Utils';
import { collections } from '@kit.ArkTS';

export default function builtinsArrayFlatMapTest() {
  describe('BuiltinsArrayFlatMapTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   builtinsArrayFlatMapTest1001
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0100
     * @tc.desc   Verify basic flatten mapping with multiplier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayFlatMapTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = collections.Array.from([1, 2, 3]);
      expect(JSON.stringify(Array.from(arr).flatMap(x => [x, x * 2]))).assertEqual(JSON.stringify([1, 2, 2, 4, 3, 6]));
    });

    /**
     * @tc.name   builtinsArrayFlatMapTest1002
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0200
     * @tc.desc   Verify non-array return values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatMapTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      expect(JSON.stringify(Array.from(arr).flatMap(x => x * 2))).assertEqual(JSON.stringify([2, 4, 6]));
    });

    /**
     * @tc.name   builtinsArrayFlatMapTest1003
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0300
     * @tc.desc   Verify empty slots are removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatMapTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, , 3]);
      expect(JSON.stringify(Array.from(arr).flatMap(x => [x]))).assertEqual(JSON.stringify([1, null, 3]));
    });

    /**
     * @tc.name   builtinsArrayFlatMapTest1004
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0400
     * @tc.desc   Verify empty array returns empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatMapTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([].flatMap(x => [x])).assertDeepEquals([]);
    });

    /**
     * @tc.name   builtinsArrayFlatMapTest1005
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0500
     * @tc.desc   Verify identity mapping behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatMapTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3]);
      expect(JSON.stringify(Array.from(arr).flatMap(x => [x]))).assertEqual(JSON.stringify(arr));
    });

    /**
     * @tc.name   builtinsArrayFlatMapTest1006
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0600
     * @tc.desc   Verify thisArg parameter binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatMapTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const arr = collections.Array.from([1, 2, 3]);
        const context: Multiply = {
          value: 2
        };
        expect(JSON.stringify(Array.from(arr).flatMap(x => x * 2, context))).assertEqual(JSON.stringify([2, 4, 6]));
    });

    /**
     * @tc.name   builtinsArrayFlatMapTest1007
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0700
     * @tc.desc   Verify undefined return handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayFlatMapTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = collections.Array.from([1, 2, 3, 4, 5]);

      expect(Array.from(arr).flatMap(() => {
      }).every(item => item === undefined)).assertTrue();
    });

  });
}