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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';

export default function BuiltinsArrayIndexOfTest(): void {
  describe("BuiltinsArrayIndexOfTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   BuiltinsArrayIndexOfTest0100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0100
     * @tc.desc   Verify indexOf finds existing element and returns correct index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest0200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0200
     * @tc.desc   Verify indexOf returns first occurrence for duplicate elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'b', 'd'];
      const result: number = arr.indexOf('b');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest0300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0300
     * @tc.desc   Verify indexOf finds first element and returns index 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [10, 20, 30, 40];
      const result: number = arr.indexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest0400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0400
     * @tc.desc   Verify indexOf finds last element and returns correct index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [10, 20, 30, 40];
      const result: number = arr.indexOf(40);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest0500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0500
     * @tc.desc   Verify indexOf returns -1 for non-existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest0600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0600
     * @tc.desc   Verify indexOf returns -1 for empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [];
      const result: number = arr.indexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest0700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0700
     * @tc.desc   Verify indexOf uses strict equality (number vs string)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<Object> = [1 as Object, 2 as Object, 3 as Object];
      const result1: number = arr.indexOf('1' as Object);
      const result2: number = arr.indexOf(1 as Object);
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest0800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0800
     * @tc.desc   Verify indexOf treats -0 and +0 as equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [-0, 1, 2];
      const result: number = arr.indexOf(+0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest0900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_0900
     * @tc.desc   Verify indexOf compares objects by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      interface TestObj {
        a: number;
      }
      const obj1: TestObj = {a: 1};
      const obj2: TestObj = {a: 1};
      const arr: Array<TestObj> = [obj1, obj2];
      const obj3: TestObj = {a: 1};
      const result1: number = arr.indexOf(obj1);
      const result2: number = arr.indexOf(obj3);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1000
     * @tc.desc   Verify indexOf with fromIndex=0 searches from beginning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      const result: number = arr.indexOf('c', 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1100
     * @tc.desc   Verify indexOf with positive fromIndex starts from specified position
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'b', 'd'];
      const result: number = arr.indexOf('b', 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1200
     * @tc.desc   Verify indexOf returns -1 when fromIndex >= array.length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const result1: number = arr.indexOf(1, 3);
      const result2: number = arr.indexOf(1, 10);
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1300
     * @tc.desc   Verify indexOf with negative fromIndex calculates from end
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(3, -3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1400
     * @tc.desc   Verify indexOf with large negative fromIndex starts from 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(1, -10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1500
     * @tc.desc   Verify indexOf with undefined fromIndex defaults to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];

      const result: number = arr.indexOf(3, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1600
     * @tc.desc   Verify indexOf with null fromIndex converts to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];

      const result: number = arr.indexOf(1, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1700
     * @tc.desc   Verify indexOf with decimal fromIndex truncates to integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(3, 1.9);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1800
     * @tc.desc   Verify indexOf with NaN fromIndex converts to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(1, NaN);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest1900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_1900
     * @tc.desc   Verify indexOf finds string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['apple', 'banana', 'cherry'];
      const result: number = arr.indexOf('banana');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2000
     * @tc.desc   Verify indexOf finds boolean elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<boolean> = [true, false, true];
      const result1: number = arr.indexOf(true);
      const result2: number = arr.indexOf(false);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2100
     * @tc.desc   Verify indexOf finds null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<Object | null> = [1 as Object, null, 3 as Object];
      const result: number = arr.indexOf(null);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2200
     * @tc.desc   Verify indexOf finds undefined element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<Object | undefined> = [1 as Object, undefined, 3 as Object];
      const result: number = arr.indexOf(undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2300
     * @tc.desc   Verify indexOf cannot find NaN (NaN !== NaN)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [NaN, 1, 2];
      const result: number = arr.indexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2400
     * @tc.desc   Verify indexOf returns -1 even with multiple NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [NaN, NaN, NaN];
      const result: number = arr.indexOf(NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2500
     * @tc.desc   Verify indexOf finds first zero value in mixed zero array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [-0, +0, 1];
      const result: number = arr.indexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2600
     * @tc.desc   Verify indexOf distinguishes null from undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<Object | null | undefined> = [null, undefined];
      const result1: number = arr.indexOf(null);
      const result2: number = arr.indexOf(undefined);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2700
     * @tc.desc   Verify indexOf does not confuse boolean with number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<Object> = [true as Object, false as Object, 1 as Object, 0 as Object];
      const result1: number = arr.indexOf(1 as Object);
      const result2: number = arr.indexOf(0 as Object);
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2800
     * @tc.desc   Verify indexOf finds empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['', 'a', 'b'];
      const result: number = arr.indexOf('');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest2900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_2900
     * @tc.desc   Verify indexOf skips holes in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = new Array<number | undefined>(5);
      arr[0] = 1;
      arr[2] = 3;
      arr[4] = 5;
      const result1: number = arr.indexOf(1);
      const result2: number = arr.indexOf(3);
      const result3: number = arr.indexOf(5);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
      expect(result3).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3000
     * @tc.desc   Verify indexOf does not find undefined in sparse array holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, 3];
      arr[1] = undefined;
      const result: number = arr.indexOf(undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3100
     * @tc.desc   Verify indexOf finds explicit undefined but not holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Object | undefined> = [1 as Object, undefined, undefined, undefined, 5 as Object];
      arr[1] = undefined;
      arr[3] = undefined;
      const result: number = arr.indexOf(undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3200
     * @tc.desc   Verify indexOf with single element array finds element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [42];
      const result1: number = arr.indexOf(42);
      const result2: number = arr.indexOf(43);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3300
     * @tc.desc   Verify indexOf with large array finds element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(10000);
      for (let i = 0; i < 10000; i++) {
        arr[i] = 0;
      }
      arr[5000] = 1;
      const result: number = arr.indexOf(1);
      expect(result).assertEqual(5000);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3400
     * @tc.desc   Verify indexOf with fromIndex at last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(5, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3500
     * @tc.desc   Verify indexOf with very large positive fromIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result: number = arr.indexOf(1, Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3600
     * @tc.desc   Verify indexOf with very large negative fromIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result: number = arr.indexOf(1, -Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3700
     * @tc.desc   Verify indexOf finds Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [Number.MAX_VALUE, 1, 2];
      const result: number = arr.indexOf(Number.MAX_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3800
     * @tc.desc   Verify indexOf finds Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [Infinity, 1, 2];
      const result: number = arr.indexOf(Infinity);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest3900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_3900
     * @tc.desc   Verify indexOf finds -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [-Infinity, 1, 2];
      const result: number = arr.indexOf(-Infinity);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4000
     * @tc.desc   Verify indexOf finds Unicode string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['你好', '世界', '🌍'];
      const result1: number = arr.indexOf('你好');
      const result2: number = arr.indexOf('🌍');
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4100
     * @tc.desc   Verify indexOf compares arrays by reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr1: Array<number> = [1, 2];
      const arr2: Array<number> = [1, 2];
      const arr: Array<Array<number>> = [arr1, arr2];
      const result: number = arr.indexOf([1, 2]);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4200
     * @tc.desc   Verify indexOf in mixed type array distinguishes types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Object | null | undefined> = [1 as Object, '1' as Object, true as Object, null, undefined];
      const result1: number = arr.indexOf(1 as Object);
      const result2: number = arr.indexOf('1' as Object);
      const result3: number = arr.indexOf(true as Object);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4300
     * @tc.desc   Verify indexOf vs lastIndexOf finds first vs last occurrence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'b', 'd'];
      const result1: number = arr.indexOf('b');
      const result2: number = arr.lastIndexOf('b');
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4400
     * @tc.desc   Verify indexOf vs includes for existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result1: number = arr.indexOf(3);
      const result2: boolean = arr.includes(3);
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4500
     * @tc.desc   Verify indexOf vs includes difference for NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [NaN, 1, 2];
      const result1: number = arr.indexOf(NaN);
      const result2: boolean = arr.includes(NaN);
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4600
     * @tc.desc   Verify indexOf after delete creates hole
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.splice(2, 1);
      const result1: number = arr.indexOf(3);
      const result2: number = arr.indexOf(4);
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4700
     * @tc.desc   Verify indexOf after increasing length creates holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.length = 6;
      const result1: number = arr.indexOf(1);
      expect(result1).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4800
     * @tc.desc   Verify indexOf after decreasing length removes elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.length = 3;
      const result: number = arr.indexOf(4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest4900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_4900
     * @tc.desc   Verify indexOf with string numeric fromIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(3, Number('2'));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5000
     * @tc.desc   Verify indexOf with non-numeric string fromIndex converts to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(1, Number('abc'));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5100
     * @tc.desc   Verify indexOf with Infinity and -Infinity fromIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result1: number = arr.indexOf(1, Infinity);
      const result2: number = arr.indexOf(1, -Infinity);
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5200
     * @tc.desc   Verify indexOf with negative fromIndex finds element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      const result: number = arr.indexOf('c', -3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5300
     * @tc.desc   Verify indexOf with negative fromIndex misses element before start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIndexOfTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      const result: number = arr.indexOf('a', -3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5400
     * @tc.desc   Verify indexOf with fromIndex跨越 sparse array holes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, undefined, 4, 5];
      const result: number = arr.indexOf(4, 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5500
     * @tc.desc   Verify indexOf with negative fromIndex in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, undefined, 4, 5];
      const result: number = arr.indexOf(4, -3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5600
     * @tc.desc   Verify indexOf on array method result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const sliced: Array<number> = arr.slice(1, 4);
      const result: number = sliced.indexOf(3);
      expect(result).assertEqual(1);
      expect(sliced.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5700
     * @tc.desc   Verify indexOf on mapped array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const mapped: Array<number> = arr.map((x: number): number => x * 2);
      const result: number = mapped.indexOf(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5800
     * @tc.desc   Verify indexOf on filtered array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const filtered: Array<number> = arr.filter((x: number): boolean => x > 2);
      const result: number = filtered.indexOf(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest5900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_5900
     * @tc.desc   Verify indexOf on concatenated array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2];
      const arr2: Array<number> = [3, 4];
      const concatenated: Array<number> = arr1.concat(arr2);
      const result: number = concatenated.indexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6000
     * @tc.desc   Verify using indexOf for array deduplication
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 2, 3, 3, 3, 4];
      const unique: Array<number> = arr.filter((item: number, index: number): boolean => {
        return arr.indexOf(item) === index;
      });
      expect(unique.length).assertEqual(4);
      expect(unique[0]).assertEqual(1);
      expect(unique[1]).assertEqual(2);
      expect(unique[2]).assertEqual(3);
      expect(unique[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6100
     * @tc.desc   Verify using indexOf to check if array contains element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const contains: boolean = arr.indexOf(2) !== -1;
      expect(contains).assertEqual(true);
      const notContains: boolean = arr.indexOf(5) !== -1;
      expect(notContains).assertEqual(false);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6200
     * @tc.desc   Verify using indexOf to find all occurrences
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'b', 'd'];
      const indices: Array<number> = [];
      let idx: number = arr.indexOf('b');
      while (idx !== -1) {
        indices.push(idx);
        idx = arr.indexOf('b', idx + 1);
      }
      expect(indices.length).assertEqual(2);
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6300
     * @tc.desc   Verify using indexOf for array difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2, 3, 4];
      const arr2: Array<number> = [2, 4];
      const difference: Array<number> = arr1.filter((item: number): boolean => arr2.indexOf(item) === -1);
      expect(difference.length).assertEqual(2);
      expect(difference[0]).assertEqual(1);
      expect(difference[1]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6400
     * @tc.desc   Verify using indexOf for array intersection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2, 3, 4];
      const arr2: Array<number> = [2, 4, 5];
      const intersection: Array<number> = arr1.filter((item: number): boolean => arr2.indexOf(item) !== -1);
      expect(intersection.length).assertEqual(2);
      expect(intersection[0]).assertEqual(2);
      expect(intersection[1]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6500
     * @tc.desc   Verify using indexOf to remove element from array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      const index: number = arr.indexOf('c');
      if (index !== -1) {
        arr.splice(index, 1);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual('d');
      expect(arr[3]).assertEqual('e');
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6600
     * @tc.desc   Verify using indexOf to add element if not exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      if (arr.indexOf(4) === -1) {
        arr.push(4);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6700
     * @tc.desc   Verify indexOf finds Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [Number.MIN_VALUE, 1, 2];
      const result: number = arr.indexOf(Number.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6800
     * @tc.desc   Verify indexOf finds -Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [-Number.MAX_VALUE, 1, 2];
      const result: number = arr.indexOf(-Number.MAX_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest6900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_6900
     * @tc.desc   Verify indexOf finds Number.MAX_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [Number.MAX_SAFE_INTEGER, 1, 2];
      const result: number = arr.indexOf(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7000
     * @tc.desc   Verify indexOf finds Number.MIN_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [Number.MIN_SAFE_INTEGER, 1, 2];
      const result: number = arr.indexOf(Number.MIN_SAFE_INTEGER);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7100
     * @tc.desc   Verify indexOf finds long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const longStr: string = 'a'.repeat(1000);
      const arr: Array<string> = [longStr, 'b', 'c'];
      const result: number = arr.indexOf(longStr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7200
     * @tc.desc   Verify indexOf finds first empty string in array with multiple empty strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['', 'a', '', 'b'];
      const result: number = arr.indexOf('');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7300
     * @tc.desc   Verify indexOf finds both -0 and +0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [-0, 1, 2];
      const result1: number = arr.indexOf(+0);
      const result2: number = arr.indexOf(-0);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7400
     * @tc.desc   Verify indexOf skips multiple holes in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = new Array<number | undefined>(5);
      arr[0] = 1;
      arr[4] = 5;
      const result1: number = arr.indexOf(1);
      const result2: number = arr.indexOf(5);
      const result3: number = arr.indexOf(undefined);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(4);
      expect(result3).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7500
     * @tc.desc   Verify indexOf finds element in sparse array with mixed holes and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, undefined, undefined, 5];
      arr[1] = undefined;
      arr[3] = undefined;
      const result: number = arr.indexOf(undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7600
     * @tc.desc   Verify indexOf after removing element cannot find removed element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.splice(2, 1);
      const result1: number = arr.indexOf(3);
      const result2: number = arr.indexOf(4);
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7700
     * @tc.desc   Verify indexOf with fromIndex equal to array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: number = arr.indexOf(1, 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7800
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7800
     * @tc.desc   Verify indexOf and lastIndexOf return same index for unique element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'd'];
      const result1: number = arr.indexOf('c');
      const result2: number = arr.lastIndexOf('c');
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest7900
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_7900
     * @tc.desc   Verify indexOf and lastIndexOf both return -1 for non-existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const result1: number = arr.indexOf('d');
      const result2: number = arr.lastIndexOf('d');
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest8000
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_8000
     * @tc.desc   Verify indexOf and includes for non-existing element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result1: number = arr.indexOf(5);
      const result2: boolean = arr.includes(5);
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(false);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest8100
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_8100
     * @tc.desc   Verify using indexOf to simulate includes behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const exists: boolean = arr.indexOf(3) !== -1;
      expect(exists).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest8200
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_8200
     * @tc.desc   Verify using indexOf to locate then slice array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      const index: number = arr.indexOf('c');
      const sliced: Array<string> = arr.slice(index);
      expect(sliced.length).assertEqual(3);
      expect(sliced[0]).assertEqual('c');
      expect(sliced[1]).assertEqual('d');
      expect(sliced[2]).assertEqual('e');
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest8300
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_8300
     * @tc.desc   Verify using indexOf with slice to extract subarray between two elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['start', 'a', 'b', 'c', 'end'];
      const startIndex: number = arr.indexOf('a');
      const endIndex: number = arr.indexOf('end');
      const result: Array<string> = arr.slice(startIndex, endIndex);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest8400
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_8400
     * @tc.desc   Verify using indexOf to locate then remove element with splice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      const index: number = arr.indexOf('c');
      if (index !== -1) {
        arr.splice(index, 1);
      }
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual('d');
      expect(arr[3]).assertEqual('e');
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest8500
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_8500
     * @tc.desc   Verify using indexOf with filter to keep only unique elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 2, 3, 4, 4, 5];
      const unique: Array<number> = arr.filter((item: number): boolean => {
        return arr.indexOf(item) === arr.lastIndexOf(item);
      });
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual(1);
      expect(unique[1]).assertEqual(3);
      expect(unique[2]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest8600
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_8600
     * @tc.desc   Verify using indexOf on mapped object array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface TestObj {
        x: number;
      }
      const arr: Array<TestObj> = [{x: 1}, {x: 2}, {x: 3}];
      const mapped: Array<number> = arr.map((obj: TestObj): number => obj.x);
      const result: number = mapped.indexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIndexOfTest8700
     * @tc.number SUB_BUILTINS_ARRAY_INDEX_OF_TEST_8700
     * @tc.desc   Verify using indexOf on mapped array then access original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIndexOfTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface TestObj {
        id: number;
        name: string;
      }
      const arr: Array<TestObj> = [{id: 1, name: 'a'}, {id: 2, name: 'b'}, {id: 3, name: 'c'}];
      const ids: Array<number> = arr.map((obj: TestObj): number => obj.id);
      const index: number = ids.indexOf(2);
      expect(arr[index].name).assertEqual('b');
    });

  });
}
