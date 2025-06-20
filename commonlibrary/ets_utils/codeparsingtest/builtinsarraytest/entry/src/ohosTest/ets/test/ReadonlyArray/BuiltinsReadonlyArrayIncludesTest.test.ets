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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TestA } from '../../testability/pages/DataFlg';
import { sleep } from '../../testability/pages/TsMethodTest';

export default function builtinsReadonlyArrayIncludesTest() {
  describe('BuiltinsReadonlyArrayIncludesTest', () => {
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
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_0100
     * @tc.name builtinsReadonlyArrayIncludesTest1001
     * @tc.desc Verify basic element existence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_0200
     * @tc.name builtinsReadonlyArrayIncludesTest1002
     * @tc.desc Verify non-existence case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.includes(4)).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_0300
     * @tc.name builtinsReadonlyArrayIncludesTest1003
     * @tc.desc Verify start index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3, 2, 4];
      expect(arr.includes(2, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_0400
     * @tc.name builtinsReadonlyArrayIncludesTest1004
     * @tc.desc Verify index out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3, 2, 4];
      expect(arr.includes(2, 3)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_0500
     * @tc.name builtinsReadonlyArrayIncludesTest1005
     * @tc.desc Verify index out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3, 2, 4];
      expect(arr.includes(2, 4)).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_0600
     * @tc.name builtinsReadonlyArrayIncludesTest1006
     * @tc.desc Verify element empty handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number | undefined)[] = [1, , 3];
      expect(arr.includes(undefined)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_0700
     * @tc.name builtinsReadonlyArrayIncludesTest1007
     * @tc.desc Verify element empty handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number | undefined)[] = [1, , 3];
      expect(arr.includes(2)).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_0800
     * @tc.name builtinsReadonlyArrayIncludesTest1008
     * @tc.desc Verify NaN comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [NaN];
      expect(arr.includes(NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_0900
     * @tc.name builtinsReadonlyArrayIncludesTest1009
     * @tc.desc Verify +0/-0 equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number | undefined)[] = [0, -0];
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1000
     * @tc.name builtinsReadonlyArrayIncludesTest1010
     * @tc.desc Verify undefined equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly undefined[] = [undefined];
      expect(arr.includes(undefined)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1100
     * @tc.name builtinsReadonlyArrayIncludesTest1011
     * @tc.desc Verify negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.includes(2, -1)).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1200
     * @tc.name builtinsReadonlyArrayIncludesTest1012
     * @tc.desc Verify negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.includes(3, -1)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1300
     * @tc.name builtinsReadonlyArrayIncludesTest1013
     * @tc.desc Verify negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.includes(2, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1400
     * @tc.name builtinsReadonlyArrayIncludesTest1014
     * @tc.desc Verify negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.includes(2, -5)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1500
     * @tc.name builtinsReadonlyArrayIncludesTest1015
     * @tc.desc Verify empty ReadonlyArray handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly undefined[] = [];
      expect(arr.includes(undefined)).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1600
     * @tc.name builtinsReadonlyArrayIncludesTest1016
     * @tc.desc Verify ReadonlyArray elements comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number[])[] = [[], [1], [2]];
      expect(arr.includes([])).assertFalse();
      expect(arr.includes(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1700
     * @tc.name builtinsReadonlyArrayIncludesTest1017
     * @tc.desc Verify null handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number | null)[] = [1, null, 3, 4];
      expect(arr.includes(null)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1800
     * @tc.name builtinsReadonlyArrayIncludesTest1018
     * @tc.desc Verify object reference comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: TestA = {
        a: 1
      };
      let arr: readonly (number | TestA)[] = [1, obj, 3];
      expect(arr.includes(obj)).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_1900
     * @tc.name builtinsReadonlyArrayIncludesTest1019
     * @tc.desc Verify string elements handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly string[] = ['apple', 'banana', 'cherry'];
      expect(arr.includes('banana')).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_2000
     * @tc.name builtinsReadonlyArrayIncludesTest1020
     * @tc.desc Verify string elements handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly string[] = ['apple', '', 'cherry'];
      expect(arr.includes('')).assertTrue();
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_INCLUDES_TEST_2100
     * @tc.name builtinsReadonlyArrayIncludesTest1021
     * @tc.desc Verify special number handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsReadonlyArrayIncludesTest1021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testReadonlyArray: readonly number[] = [
        1,
        0,
        Number.EPSILON,
        Number.MIN_VALUE,
        Number.MAX_VALUE,
        Infinity,
        -Infinity,
        3405691582,
        258,
        16909060,
        3
      ];

      expect(testReadonlyArray.includes(Math.floor(1.5))).assertTrue();
      expect(testReadonlyArray.includes(-0)).assertTrue();
      expect(testReadonlyArray.includes(Number.EPSILON)).assertTrue();
      expect(testReadonlyArray.includes(Number.MIN_VALUE)).assertTrue();
      expect(testReadonlyArray.includes(Number.MAX_VALUE)).assertTrue();
      expect(testReadonlyArray.includes(Infinity)).assertTrue();
      expect(testReadonlyArray.includes(-Infinity)).assertTrue();
      expect(testReadonlyArray.includes(0xcafebabe)).assertTrue();
      expect(testReadonlyArray.includes(0x0102)).assertTrue();
      expect(testReadonlyArray.includes(0x01020304)).assertTrue();
      expect(testReadonlyArray.includes(0x3)).assertTrue();
    });

  });
}