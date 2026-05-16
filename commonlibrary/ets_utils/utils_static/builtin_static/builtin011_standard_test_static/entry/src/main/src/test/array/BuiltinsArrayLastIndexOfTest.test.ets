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

interface Person {
  name: string;
  age: number;
}

export default function BuiltinsArrayLastIndexOfTest() : void{
  describe("BuiltinsArrayLastIndexOfTest", () => {
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
     * @tc.name    builtinsArrayLastIndexOfTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_0100
     * @tc.desc    Verify lastIndexOf with positive match (Level0 smoke test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayLastIndexOfTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 1;
      const result = arr.lastIndexOf(2);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_0200
     * @tc.desc    Verify lastIndexOf with no match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.lastIndexOf(6);

      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_0300
     * @tc.desc    Verify lastIndexOf with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.lastIndexOf(1);

      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_0400
     * @tc.desc    Verify lastIndexOf with single element array - match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(42, 0);
      const result = arr.lastIndexOf(42);

      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_0500
     * @tc.desc    Verify lastIndexOf with single element array - no match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(42, 0);
      const result = arr.lastIndexOf(100);

      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_0600
     * @tc.desc    Verify lastIndexOf with string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(4, '');
      arr[0] = 'hello';
      arr[1] = 'world';
      arr[2] = 'test';
      arr[3] = 'world';
      const result = arr.lastIndexOf('world');

      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_0700
     * @tc.desc    Verify lastIndexOf with boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<boolean>(4, false);
      arr[0] = true;
      arr[1] = false;
      arr[2] = true;
      arr[3] = false;
      const result = arr.lastIndexOf(true);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_0800
     * @tc.desc    Verify lastIndexOf with object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const person1: Person = { name: 'Alice', age: 25 };
      const person2: Person = { name: 'Bob', age: 30 };
      const person3: Person = { name: 'Alice', age: 25 };
      const arr: Person[] = Array.create<Person>(3, { name: '', age: 0 });
      arr[0] = person1;
      arr[1] = person2;
      arr[2] = person3;

      const result = arr.lastIndexOf(person1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_0900
     * @tc.desc    Verify lastIndexOf with null and undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number | null | undefined> = Array.create<number | null | undefined>(6, 0);
      arr[0] = 1;
      arr[1] = null;
      arr[2] = 2;
      arr[3] = undefined;
      arr[4] = 3;
      arr[5] = null;

      const result1 = arr.lastIndexOf(null);
      expect(result1).assertEqual(5);

      const result2 = arr.lastIndexOf(undefined);
      expect(result2).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1000
     * @tc.desc    Verify lastIndexOf with boundary number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayLastIndexOfTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(4, 0);
      arr[0] = 2147483647;
      arr[1] = -2147483648;
      arr[2] = 0;
      arr[3] = 2147483647;

      const result1 = arr.lastIndexOf(2147483647);
      expect(result1).assertEqual(3);

      const result2 = arr.lastIndexOf(-2147483648);
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1100
     * @tc.desc    Verify lastIndexOf with negative numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = -1;
      arr[1] = -2;
      arr[2] = -3;
      arr[3] = -2;
      arr[4] = -1;
      const result = arr.lastIndexOf(-2);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1200
     * @tc.desc    Verify lastIndexOf with floating point numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(4, 0);
      arr[0] = 3.14;
      arr[1] = 2.718;
      arr[2] = 3.14;
      arr[3] = 1.414;
      const result = arr.lastIndexOf(3.14);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1300
     * @tc.desc    Verify lastIndexOf with zero value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 0;
      arr[1] = 1;
      arr[2] = 0;
      arr[3] = 2;
      arr[4] = 0;
      const result = arr.lastIndexOf(0);

      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1400
     * @tc.desc    Verify lastIndexOf with large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayLastIndexOfTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const size = 1000;
      const arr = Array.create<number>(size, 0);
      for (let i = 0; i < size; i++) {
        arr[i] = i % 100;
      }

      const result = arr.lastIndexOf(99);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1500
     * @tc.desc    Verify lastIndexOf with element at first position
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 5;
      arr[1] = 1;
      arr[2] = 2;
      arr[3] = 3;
      arr[4] = 4;
      const result = arr.lastIndexOf(5);

      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1600
     * @tc.desc    Verify lastIndexOf with element at last position
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.lastIndexOf(5);

      expect(result).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1700
     * @tc.desc    Verify lastIndexOf with positive fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 1;
      const result = arr.lastIndexOf(2, 2);

      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1800
     * @tc.desc    Verify lastIndexOf with negative fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 1;
      const result = arr.lastIndexOf(2, -3);

      expect(result).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_1900
     * @tc.desc    Verify lastIndexOf with fromIndex = 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 1;
      const result = arr.lastIndexOf(2, 0);

      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_2000
     * @tc.desc    Verify lastIndexOf with fromIndex greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 1;
      const result = arr.lastIndexOf(2, 10);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_2100
     * @tc.desc    Verify lastIndexOf with fromIndex equal to array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 1;
      const result = arr.lastIndexOf(2, 5);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_2200
     * @tc.desc    Verify lastIndexOf with fromIndex as maximum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayLastIndexOfTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 1;
      const result = arr.lastIndexOf(2, 2147483647);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_2300
     * @tc.desc    Verify lastIndexOf with fromIndex as minimum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayLastIndexOfTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 1;
      const result = arr.lastIndexOf(2, -2147483648);

      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_2400
     * @tc.desc    Verify lastIndexOf with fromIndex and no match
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.lastIndexOf(6, 2);

      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_2500
     * @tc.desc    Verify lastIndexOf with fromIndex in empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.lastIndexOf(1, 0);

      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    builtinsArrayLastIndexOfTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_LASTINDEXOF_TEST_2600
     * @tc.desc    Verify lastIndexOf with fromIndex and single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLastIndexOfTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(42, NaN);
      const result1 = arr.lastIndexOf(42, 0);
      expect(result1).assertEqual(-1);

      const result2 = arr.lastIndexOf(42, 1);
      expect(result2).assertEqual(-1);

      const result3 = arr.lastIndexOf(42, -1);
      expect(result3).assertEqual(-1);
    });
  })
}