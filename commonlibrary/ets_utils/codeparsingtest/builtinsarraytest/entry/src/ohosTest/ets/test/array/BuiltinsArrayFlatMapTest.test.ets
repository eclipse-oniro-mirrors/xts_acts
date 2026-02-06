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
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0100
     * @tc.name builtinsArrayFlatMapTest1001
     * @tc.desc Verify basic flatten mapping with multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsArrayFlatMapTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => [x, x * 2]);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 2, 4, 3, 6]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0200
     * @tc.name builtinsArrayFlatMapTest1002
     * @tc.desc Verify non-array return values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flatMap(x => x * 2);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 4, 6]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLATMAP_TEST_0300
     * @tc.name builtinsArrayFlatMapTest1003
     * @tc.desc Verify single-level array preservation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], 4];
      expect(JSON.stringify(arr.flatMap(x => [x]))).assertEqual(JSON.stringify(arr));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0400
     * @tc.name builtinsArrayFlatMapTest1004
     * @tc.desc Verify deep nested arrays are not flattened
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, 4], 5], 6];
      expect(JSON.stringify(arr.flatMap(x => [x]))).assertEqual(JSON.stringify(arr));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0500
     * @tc.name builtinsArrayFlatMapTest1005
     * @tc.desc Verify empty slots are removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, , 3];
      const result = arr.flatMap(x => [x]);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0600
     * @tc.name builtinsArrayFlatMapTest1006
     * @tc.desc Verify nested empty slots handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [, 3], 4];
      expect(JSON.stringify(arr.flatMap(x => [x]))).assertEqual(JSON.stringify([1, [, 3], 4]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0700
     * @tc.name builtinsArrayFlatMapTest1007
     * @tc.desc Verify empty array returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([].flatMap(x => [x])).assertDeepEquals([]);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0800
     * @tc.name builtinsArrayFlatMapTest1008
     * @tc.desc Verify nested empty arrays handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[], [1], [2]];
      expect(JSON.stringify(arr.flatMap(x => [x]))).assertEqual(JSON.stringify(arr));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0900
     * @tc.name builtinsArrayFlatMapTest1009
     * @tc.desc Verify identity mapping behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      expect(JSON.stringify(arr.flatMap(x => [x]))).assertEqual(JSON.stringify(arr));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1000
     * @tc.name builtinsArrayFlatMapTest1010
     * @tc.desc Verify thisArg parameter binding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const context: Multiply = {
        value: 2
      };
      const result = arr.flatMap(x => x * 2, context);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 4, 6])); // TODO
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1100
     * @tc.name builtinsArrayFlatMapTest1011
     * @tc.desc Verify undefined return handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3, 4, 5];
      const result = arr.flatMap(() => {
      });
      expect(result.every(item => item === undefined)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1200
     * @tc.name builtinsArrayFlatMapTest1012
     * @tc.desc Verify null/undefined element handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [null, [undefined, 3]];
      const result = arr.flatMap(x => [x, Number(x) * 2]);
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([null, 0, [undefined, 3], NaN]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1300
     * @tc.name builtinsArrayFlatMapTest1013
     * @tc.desc Verify object references are preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatMapTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FlatObj = {
        name: 'hh', age: 10, like: [1, 2, 3, 4, 5]
      };
      const arr = [obj];
      const result = arr.flatMap(x => [x, NaN]);
      expect(result[0]).assertEqual(obj);
      expect(Number.isNaN(result[1])).assertTrue();
    });

  });
}