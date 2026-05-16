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

export default function BuiltinsArrayToSplicedTest() : void{
  describe("BuiltinsArrayToSplicedTest", () => {
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
     * @tc.name    builtinsArrayToSplicedTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_0100
     * @tc.desc    Verify toSpliced with positive start index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToSplicedTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.toSpliced(2);
      
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_0200
     * @tc.desc    Verify toSpliced with start index 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(0);
      
      expect(result.length).assertEqual(0);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_0300
     * @tc.desc    Verify toSpliced with negative start index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.toSpliced(-3);
      
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);

      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_0400
     * @tc.desc    Verify toSpliced with start index equal to array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(3);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_0500
     * @tc.desc    Verify toSpliced with start index greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(5);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_0600
     * @tc.desc    Verify toSpliced with minimum int value as start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayToSplicedTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(-2147483648);
      
      expect(result.length).assertEqual(0);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_0700
     * @tc.desc    Verify toSpliced with maximum int value as start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayToSplicedTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(2147483647);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_0800
     * @tc.desc    Verify toSpliced with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.toSpliced(0);
      
      expect(result.length).assertEqual(0);

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_0900
     * @tc.desc    Verify toSpliced with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(1, NaN);
      arr[0] = 42;
      
      const result = arr.toSpliced(0);
      
      expect(result.length).assertEqual(0);

      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1000
     * @tc.desc    Verify toSpliced with object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = Array.create<Person>(3, { name: "", age: 0 });
      arr[0] = { name: "Alice", age: 25 };
      arr[1] = { name: "Bob", age: 30 };
      arr[2] = { name: "Charlie", age: 35 };
      
      const result = arr.toSpliced(1);
      
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(arr[0]);

    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1100
     * @tc.desc    Verify toSpliced with start, delete and items parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToSplicedTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.toSpliced(2, 2, 6, 7);
      
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(7);
      expect(result[4]).assertEqual(5);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1200
     * @tc.desc    Verify toSpliced with negative start index and items
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.toSpliced(-3, 2, 6, 7);
      
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(7);
      expect(result[4]).assertEqual(5);

      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1300
     * @tc.desc    Verify toSpliced with delete count 0 (only add items)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(1, 0, 4, 5);
      
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1400
     * @tc.desc    Verify toSpliced with delete count greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(1, 10, 4, 5);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1500
     * @tc.desc    Verify toSpliced with negative delete count
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(1, -5, 4, 5);
      
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1600
     * @tc.desc    Verify toSpliced with no items (only delete)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.toSpliced(1, 3);
      
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(5);

      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1700
     * @tc.desc    Verify toSpliced with minimum int value as start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayToSplicedTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(-2147483648, 1, 4);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1800
     * @tc.desc    Verify toSpliced with maximum int value as start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayToSplicedTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(2147483647, 0, 4);
      
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_1900
     * @tc.desc    Verify toSpliced with object array and items
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = [];
      arr.push({ name: "Alice", age: 25 } as Person);
      arr.push({ name: "Bob", age: 30 } as Person);
      arr.push({ name: "Charlie", age: 35 } as Person);
      
      const newPerson: Person = { name: "David", age: 40 };
      const result = arr.toSpliced(1, 1, newPerson);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(arr[0]);
      expect(result[1]).assertEqual(newPerson);
      expect(result[2]).assertEqual(arr[2]);


    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2000
     * @tc.desc    Verify toSpliced with empty array and items
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.toSpliced(0, 0, 1, 2, 3);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2100
     * @tc.desc    Verify toSpliced with both start and delete undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayToSplicedTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced();
      
      expect(result.length).assertEqual(3);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2200
     * @tc.desc    Verify toSpliced with only start defined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.toSpliced(2);
      
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2300
     * @tc.desc    Verify toSpliced with only delete defined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.toSpliced(undefined, 2);
      
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2400
     * @tc.desc    Verify toSpliced with negative start and delete
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.toSpliced(-3, 2);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(5);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2500
     * @tc.desc    Verify toSpliced with start equal to array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(3, 1);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2600
     * @tc.desc    Verify toSpliced with start greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(5, 1);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2700
     * @tc.desc    Verify toSpliced with delete count 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(1, 0);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2800
     * @tc.desc    Verify toSpliced with delete count greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(1, 10);
      
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_2900
     * @tc.desc    Verify toSpliced with negative delete count
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(1, -5);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_3000
     * @tc.desc    Verify toSpliced with minimum int value as start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayToSplicedTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(-2147483648, 2);
      
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(3);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_3100
     * @tc.desc    Verify toSpliced with maximum int value as start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayToSplicedTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.toSpliced(2147483647, 2);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_3200
     * @tc.desc    Verify toSpliced with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.toSpliced(0, 0);
      
      expect(result.length).assertEqual(0);
      // Original array should remain unchanged
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayToSplicedTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_TO_SPLICED_TEST_3300
     * @tc.desc    Verify toSpliced with object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayToSplicedTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = [];
      arr.push({ name: "Alice", age: 25 } as Person);
      arr.push({ name: "Bob", age: 30 } as Person);
      arr.push({ name: "Charlie", age: 35 } as Person);
      
      const result = arr.toSpliced(1, 1);
      
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(arr[0]);
      expect(result[1]).assertEqual(arr[2]);
      expect(arr.length).assertEqual(3);

    });
  })
}