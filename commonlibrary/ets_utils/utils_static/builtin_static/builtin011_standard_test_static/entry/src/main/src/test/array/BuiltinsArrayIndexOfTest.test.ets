/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BuiltinsArrayIndexOfTest(): void {
  describe("BuiltinsArrayIndexOfTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
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
     * @tc.name    builtinsArrayIndexOfTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0100
     * @tc.desc    Verify indexOf with single parameter - element found at first position
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayIndexOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.indexOf(1);
      const expected = 0;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0200
     * @tc.desc    Verify indexOf with single parameter - element found at middle position
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.indexOf(3);
      const expected = 2;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0300
     * @tc.desc    Verify indexOf with single parameter - element found at last position
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.indexOf(5);
      const expected = 4;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0400
     * @tc.desc    Verify indexOf with single parameter - element not found
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.indexOf(6);
      const expected = -1;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0500
     * @tc.desc    Verify indexOf with single parameter - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.indexOf(1);
      const expected = -1;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0600
     * @tc.desc    Verify indexOf with fromIndex parameter - element found after fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 1;

      const result = arr.indexOf(2, 2);
      const expected = 3;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0700
     * @tc.desc    Verify indexOf with fromIndex parameter - element not found after fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.indexOf(2, 3);
      const expected = -1;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0800
     * @tc.desc    Verify indexOf with fromIndex parameter - fromIndex equals array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.indexOf(1, 5);
      const expected = -1;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0900
     * @tc.desc    Verify indexOf with fromIndex parameter - negative fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.indexOf(4, -2);
      const expected = 3;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1000
     * @tc.desc    Verify indexOf with fromIndex parameter - fromIndex not provided (defaults to 0)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.indexOf(3, undefined);
      const expected = 2;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1100
     * @tc.desc    Verify indexOf with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ["apple", "banana", "cherry", "date"];

      const result = arr.indexOf("cherry");
      const expected = 2;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayIndexOfTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1200
     * @tc.desc    Verify indexOf with boolean elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIndexOfTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false, true, false];

      const result = arr.indexOf(false, 1);
      const expected = 1;

      expect(result).assertEqual(expected);
    });
  });
}
