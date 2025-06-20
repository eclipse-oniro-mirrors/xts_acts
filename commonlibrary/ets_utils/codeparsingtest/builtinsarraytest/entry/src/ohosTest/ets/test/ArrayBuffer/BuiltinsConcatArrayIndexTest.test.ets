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
import { ConcatArrayTest, sleep } from "../../testability/pages/TsMethodTest";

export default function builtinsConcatArrayIndexTest() {
  describe('BuiltinsConcatArrayIndexTest', () => {
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

    // 测试数组定义
    const arr = new ConcatArrayTest<number>([1, 2, 3, 4, 5]);
    const emptyArr = new ConcatArrayTest([]);

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_0100
     * @tc.name builtinsConcatArrayIndexTest1001
     * @tc.desc Test index 0 access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_0200
     * @tc.name builtinsConcatArrayIndexTest1002
     * @tc.desc Test index 1 access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_0300
     * @tc.name builtinsConcatArrayIndexTest1003
     * @tc.desc Test negative index -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(-1)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_0400
     * @tc.name builtinsConcatArrayIndexTest1004
     * @tc.desc Test out-of-bound index 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(5)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_0500
     * @tc.name builtinsConcatArrayIndexTest1005
     * @tc.desc Test fractional index 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(0.5)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_0600
     * @tc.name builtinsConcatArrayIndexTest1006
     * @tc.desc Test empty array index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(emptyArr.index(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_0700
     * @tc.name builtinsConcatArrayIndexTest1007
     * @tc.desc Test number 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_0800
     * @tc.name builtinsConcatArrayIndexTest1008
     * @tc.desc Test number -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(-0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_0900
     * @tc.name builtinsConcatArrayIndexTest1009
     * @tc.desc Test number NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(NaN)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1000
     * @tc.name builtinsConcatArrayIndexTest1009
     * @tc.desc Test number Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(Infinity)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1100
     * @tc.name builtinsConcatArrayIndexTest1011
     * @tc.desc Test number -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(-Infinity)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1200
     * @tc.name builtinsConcatArrayIndexTest1012
     * @tc.desc Test number Math
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(Math.floor(1.5))).assertEqual(2);
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1300
     * @tc.name builtinsConcatArrayIndexTest1013
     * @tc.desc Test number max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(Number.MAX_VALUE)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1400
     * @tc.name builtinsConcatArrayIndexTest1014
     * @tc.desc Test number min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(Number.MIN_VALUE)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1500
     * @tc.name builtinsConcatArrayIndexTest1015
     * @tc.desc Test number EPSILON
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(Number.EPSILON)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1600
     * @tc.name builtinsConcatArrayIndexTest1016
     * @tc.desc Test number 123.456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(123.456)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1700
     * @tc.name builtinsConcatArrayIndexTest1017
     * @tc.desc Test number 0xcafebabe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(0xcafebabe)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1800
     * @tc.name builtinsConcatArrayIndexTest1018
     * @tc.desc Test number 0x0102
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(0x0102)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_1900
     * @tc.name builtinsConcatArrayIndexTest1019
     * @tc.desc Test number 0x01020304
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(0x01020304)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_2000
     * @tc.name builtinsConcatArrayIndexTest1020
     * @tc.desc Test number 0x3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(0x3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_2100
     * @tc.name builtinsConcatArrayIndexTest1021
     * @tc.desc Test special characters index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const index = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      expect(arr.index(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_2200
     * @tc.name builtinsConcatArrayIndexTest1022
     * @tc.desc Test undefined index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(undefined)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_2300
     * @tc.name builtinsConcatArrayIndexTest1023
     * @tc.desc Test null index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index(null)).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_2400
     * @tc.name builtinsConcatArrayIndexTest1024
     * @tc.desc Test string "0" & "NaN" index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index("0")).assertEqual(1);
      expect(arr.index("NaN")).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_2500
     * @tc.name builtinsConcatArrayIndexTest1025
     * @tc.desc Test empty string index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index("")).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_2600
     * @tc.name builtinsConcatArrayIndexTest1026
     * @tc.desc Test Unicode index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index("\uD83D\uDC46")).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_2700
     * @tc.name builtinsConcatArrayIndexTest1027
     * @tc.desc Test invalid Unicode index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index("\uDC04")).assertUndefined();
    });

    /**
     * @tc.number SUB_ConcatArray_INDEX_TEST_2800
     * @tc.name builtinsConcatArrayIndexTest1028
     * @tc.desc Test "\a" index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsConcatArrayIndexTest1028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(arr.index("\a")).assertUndefined();
    });
  });
}