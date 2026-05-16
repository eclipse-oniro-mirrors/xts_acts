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

export default function BuiltinsArrayIncludesTest(): void {
  describe("BuiltinsArrayIncludesTest", () => {
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
     * @tc.name    builtinsArrayIncludesTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_0100
     * @tc.desc    Verify includes with basic functionality
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayIncludesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      expect(arr.includes(3)).assertTrue();
      expect(arr.includes(6)).assertFalse();

      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_0200
     * @tc.desc    Verify includes with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIncludesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      expect(arr.includes(1)).assertFalse();

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_0300
     * @tc.desc    Verify includes with fromIndex parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIncludesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 2;
      arr[4] = 5;
      
      expect(arr.includes(2, 2)).assertTrue();
      expect(arr.includes(2, 4)).assertFalse();

      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_0400
     * @tc.desc    Verify includes with negative fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIncludesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      expect(arr.includes(4, -2)).assertTrue();
      expect(arr.includes(2, -4)).assertTrue();
      expect(arr.includes(1, -5)).assertTrue();
      expect(arr.includes(1, -6)).assertTrue();

      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_0500
     * @tc.desc    Verify includes with fromIndex 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIncludesTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      expect(arr.includes(1, 0)).assertTrue();
      expect(arr.includes(3, 0)).assertTrue();

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_0600
     * @tc.desc    Verify includes with fromIndex equal to array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIncludesTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      expect(arr.includes(1, 3)).assertFalse();

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_0700
     * @tc.desc    Verify includes with fromIndex greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIncludesTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      expect(arr.includes(1, 10)).assertFalse();

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_0800
     * @tc.desc    Verify includes with int minimum value as fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayIncludesTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      expect(arr.includes(1, -2147483648)).assertTrue();
      expect(arr.includes(3, -2147483648)).assertTrue();

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_0900
     * @tc.desc    Verify includes with int maximum value as fromIndex
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayIncludesTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      expect(arr.includes(1, 2147483647)).assertFalse();

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_1000
     * @tc.desc    Verify includes with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIncludesTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(3, '');
      arr[0] = "apple";
      arr[1] = "banana";
      arr[2] = "cherry";
      
      expect(arr.includes("banana")).assertTrue();
      expect(arr.includes("grape")).assertFalse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_1100
     * @tc.desc    Verify includes with object elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIncludesTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      
      const person1: Person = { name: "Alice", age: 25 };
      const person2: Person = { name: "Bob", age: 30 };
      const person3: Person = { name: "Charlie", age: 35 };
      
      const arr = Array.create<Person>(3, person1);
      arr[0] = person1;
      arr[1] = person2;
      arr[2] = person3;
      
      expect(arr.includes(person2)).assertTrue();
      expect(arr.includes({ name: "Bob", age: 30 })).assertFalse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayIncludesTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_INCLUDES_TEST_1200
     * @tc.desc    Verify includes with undefined and null values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayIncludesTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number | undefined | null>(3, null);
      arr[0] = 1;
      arr[1] = undefined;
      arr[2] = null;
      
      expect(arr.includes(undefined)).assertTrue();
      expect(arr.includes(null)).assertTrue();
      expect(arr.includes(2)).assertFalse();
      expect(arr.length).assertEqual(3);
    });
  })
}
