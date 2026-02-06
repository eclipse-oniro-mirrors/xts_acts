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
import { FlatObj, FlatParams } from '../../testability/pages/DataFlg';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsArrayFlatTest() {
  describe('BuiltinsArrayFlatTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0100
     * @tc.name builtinsArrayFlatTest1001
     * @tc.desc test worker error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsArrayFlatTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = [1, [2, 3], 4];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0200
     * @tc.name builtinsArrayFlatTest1002
     * @tc.desc Verify flat method returns original array when no nesting exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const result = arr.flat();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(arr));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0300
     * @tc.name builtinsArrayFlatTest1003
     * @tc.desc Verify flat method with depth=1 on multi-level nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, 4], 5], 6];
      expect(JSON.stringify(arr.flat(1))).assertEqual(JSON.stringify([1, 2, [3, 4], 5, 6]));
      expect(JSON.stringify(arr.flat(-1))).assertEqual(JSON.stringify([1, [2, [3, 4], 5], 6]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0400
     * @tc.name builtinsArrayFlatTest1004
     * @tc.desc Verify full flattening with depth=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, 4], 5], 6];
      expect(JSON.stringify(arr.flat(2))).assertEqual(JSON.stringify([1, 2, 3, 4, 5, 6]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0500
     * @tc.name builtinsArrayFlatTest1005
     * @tc.desc Verify no flattening with depth=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], 4];
      expect(JSON.stringify(arr.flat(0))).assertEqual(JSON.stringify(arr));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0600
     * @tc.name builtinsArrayFlatTest1006
     * @tc.desc Verify handling of sparse arrays (empty slots)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, , 3];
      expect(JSON.stringify(arr.flat())).assertEqual(JSON.stringify([1, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0700
     * @tc.name builtinsArrayFlatTest1007
     * @tc.desc Verify flattening nested sparse arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [, 3], 4];
      expect(JSON.stringify(arr.flat(1))).assertEqual(JSON.stringify([1, 3, 4]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0800
     * @tc.name builtinsArrayFlatTest1008
     * @tc.desc Verify handling of mixed element types (number + string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], 'hello'];
      expect(JSON.stringify(arr.flat())).assertEqual(JSON.stringify([1, 2, 3, 'hello']));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_0900
     * @tc.name builtinsArrayFlatTest1009
     * @tc.desc Verify deep flattening with mixed data types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, [3, 'a']], 4];
      expect(JSON.stringify(arr.flat(2))).assertEqual(JSON.stringify([1, 2, 3, 'a', 4]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1000
     * @tc.name builtinsArrayFlatTest1010
     * @tc.desc Verify empty array returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([].flat().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1100
     * @tc.name builtinsArrayFlatTest1011
     * @tc.desc Verify flattening of nested empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [[], [1], [2]];
      expect(JSON.stringify(arr.flat(1))).assertEqual(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1200
     * @tc.name builtinsArrayFlatTest1012
     * @tc.desc Verify no flattening with depth=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, [2, 3], 4];
      expect(JSON.stringify(arr.flat())).assertEqual(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1300
     * @tc.name builtinsArrayFlatTest1013
     * @tc.desc Verify handling of null and undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [null, [undefined, 3]];
      expect(JSON.stringify(arr.flat())).assertEqual(JSON.stringify([null, undefined, 3]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1400
     * @tc.name builtinsArrayFlatTest1014
     * @tc.desc Verify objects are not flattened
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: FlatObj = {
        name: 'hh', age: 10, like: [1, 2, 3, 4, 5]
      };
      const arr = [obj];
      expect(JSON.stringify(arr.flat(1))).assertEqual(JSON.stringify([obj]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_FLAT_TEST_1500
     * @tc.name builtinsArrayFlatTest1015
     * @tc.desc Verify handling of edge case numeric parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayFlatTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testArray = [1, [2, [3, [4]]], 5];
      const testParams: FlatParams[] = [
        {
          depth: Math.floor(1.5), expected: [1, 2, [3, [4]], 5]
        },
        {
          depth: 0, expected: testArray
        },
        {
          depth: -0, expected: testArray
        },
        {
          depth: NaN, expected: testArray
        },
        {
          depth: undefined, expected: [1, 2, [3, [4]], 5]
        },
        {
          depth: Number.EPSILON, expected: testArray
        },
        {
          depth: Number.MIN_VALUE, expected: testArray
        },
        {
          depth: Number.MAX_VALUE, expected: [1, 2, 3, 4, 5]
        },
        {
          depth: Infinity, expected: [1, 2, 3, 4, 5]
        },
        {
          depth: -Infinity, expected: testArray
        },
        {
          depth: 123.456, expected: [1, 2, 3, 4, 5]
        },
        {
          depth: 1.999, expected: [1, 2, [3, [4]], 5]
        },
        {
          depth: 0xcafebabe, expected: [1, 2, 3, 4, 5]
        },
        {
          depth: 0x0102, expected: [1, 2, 3, 4, 5]
        },
        {
          depth: 0x3e8, expected: [1, 2, 3, 4, 5]
        },
        {
          depth: 0x3, expected: [1, 2, 3, 4, 5]
        }
      ];

      testParams.forEach((param) => {
        const actual = JSON.stringify(testArray.flat(param.depth));
        const expected = JSON.stringify(param.expected);
        expect(actual).assertEqual(expected);
      });
    });
  });
}