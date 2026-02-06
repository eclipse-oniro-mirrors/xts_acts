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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { Except, TestA, TestB, TestC } from "../../testability/pages/DataFlg";
import { ConcatArrayTest, sleep } from "../../testability/pages/TsMethodTest";

export default function builtinsConcatArraySliceTest() {
  describe('BuiltinsConcatArraySliceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(100);
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
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_0100
     * @tc.name builtinsConcatArraySliceTest1001
     * @tc.desc Test basic slice with start and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsConcatArraySliceTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3, 4, 5])
      expect(arr.slice(1, 3)).assertDeepEquals([2, 3]);
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_0200
     * @tc.name builtinsConcatArraySliceTest1002
     * @tc.desc Test single parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3, 4, 5])
      expect(arr.slice(2)).assertDeepEquals([3, 4, 5]);
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_0300
     * @tc.name builtinsConcatArraySliceTest1003
     * @tc.desc Test negative indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3, 4, 5])
      expect(arr.slice(-3, -1)).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_0400
     * @tc.name builtinsConcatArraySliceTest1004
     * @tc.desc Test sparse array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let sparseArr = new ConcatArrayTest<number | undefined>([1, , 3])
      const result: number[] = sparseArr.slice(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]?.toString()).assertEqual('1');
      expect(result[1] === undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_0500
     * @tc.name builtinsConcatArraySliceTest1005
     * @tc.desc Test out-of-bound indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3])
      expect(arr.slice(5, 10)).assertDeepEquals([]);
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_0600
     * @tc.name builtinsConcatArraySliceTest1006
     * @tc.desc Test same start and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3])
      expect(arr.slice(2, 2)).assertDeepEquals([]);
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_0700
     * @tc.name builtinsConcatArraySliceTest1007
     * @tc.desc Test invalid parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3, 4, 5])
      expect(arr.slice(3, 1)).assertDeepEquals([]);
      expect(arr.slice(undefined)).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(arr.slice(1, undefined)).assertDeepEquals([2, 3, 4, 5]);
      expect(arr.slice(NaN)).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_0800
     * @tc.name builtinsConcatArraySliceTest1008
     * @tc.desc Test string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new ConcatArrayTest<string>(['a', 'b', 'c', 'd']);
      expect(arr.slice(2)).assertDeepEquals(['c', 'd']);
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_0900
     * @tc.name builtinsConcatArraySliceTest1009
     * @tc.desc Test object array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let objArr = new ConcatArrayTest<TestA | TestB | TestC>([{
        a: 1
      }, {
        b: 2
      }, {
        c: 3
      }]);
      const sliced: number[] = objArr.slice(0, 2);
      expect(sliced.length).assertEqual(2);
      expect(JSON.stringify(sliced)).assertEqual(JSON.stringify([{
        a: 1
      }, {
        b: 2
      }]));
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_1000
     * @tc.name builtinsConcatArraySliceTest1010
     * @tc.desc Test nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let nestedArr = new ConcatArrayTest<number[]>([[1, 2], [3, 4], [5, 6]])
      expect(nestedArr.slice(1, 3)).assertDeepEquals([[3, 4], [5, 6]]);
    });

    /**
     * @tc.number SUB_CONCAT_ARRAY_SLICE_TEST_1100
     * @tc.name builtinsConcatArraySliceTest1011
     * @tc.desc Test special number parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArraySliceTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr = new ConcatArrayTest<number>([1, 2, 3, 4, 5])
      const testCases: Except[] = [
        {
          param: Math.floor(1.5), expected: [2, 3, 4, 5]
        },
        {
          param: -0, expected: [1, 2, 3, 4, 5]
        },
        {
          param: Number.EPSILON, expected: [1, 2, 3, 4, 5]
        },
        {
          param: Number.MIN_VALUE, expected: [1, 2, 3, 4, 5]
        },
        {
          param: Number.MAX_VALUE, expected: []
        },
        {
          param: -Infinity, expected: [1, 2, 3, 4, 5]
        },
        {
          param: Infinity, expected: []
        },
        {
          param: 123.456, expected: []
        },
        {
          param: 0xCAFEBABE, expected: []
        },
        {
          param: 0x0102,
          expected: []
        },
        {
          param: 0x3, expected: [4, 5]
        }
      ];

      testCases.forEach((item) => {
        expect(arr.slice(item.param)).assertDeepEquals(item.expected);
      });
    });
  });
}