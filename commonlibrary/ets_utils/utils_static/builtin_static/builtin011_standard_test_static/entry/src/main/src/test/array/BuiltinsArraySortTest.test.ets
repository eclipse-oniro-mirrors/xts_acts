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

export default function BuiltinsArraySortTest() : void{
  describe("BuiltinsArraySortTest", () => {
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
     * @tc.name    builtinsArraySortTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_0100
     * @tc.desc    Verify sort without comparator sorts numbers in ascending order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySortTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 5;
      arr[1] = 3;
      arr[2] = 1;
      arr[3] = 4;
      arr[4] = 2;

      const result = arr.sort();

      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArraySortTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_0200
     * @tc.desc    Verify sort with comparator sorts numbers in descending order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySortTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 5;
      arr[1] = 3;
      arr[2] = 1;
      arr[3] = 4;
      arr[4] = 2;

      const result = arr.sort((a: number, b: number) => (b - a).toInt());

      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArraySortTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_0300
     * @tc.desc    Verify sort with comparator sorts strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySortTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(4, '');
      arr[0] = 'banana';
      arr[1] = 'apple';
      arr[2] = 'cherry';
      arr[3] = 'date';

      const result = arr.sort((a: string, b: string) => {
        if (a < b) return -1 as int;
        if (a > b) return 1 as int;
        return 0 as int;
      });

      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual('apple');
      expect(arr[1]).assertEqual('banana');
      expect(arr[2]).assertEqual('cherry');
      expect(arr[3]).assertEqual('date');
    });

    /**
     * @tc.name    builtinsArraySortTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_0400
     * @tc.desc    Verify sort with comparator sorts objects by property
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySortTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<Person>(3, { name: '', age: 0 });
      arr[0] = { name: 'Alice', age: 30 };
      arr[1] = { name: 'Bob', age: 20 };
      arr[2] = { name: 'Charlie', age: 25 };

      const result = arr.sort((a: Person, b: Person) => (a.age - b.age).toInt());

      expect(result).assertEqual(arr);
      expect(arr[0].age).assertEqual(20);
      expect(arr[1].age).assertEqual(25);
      expect(arr[2].age).assertEqual(30);
    });

    /**
     * @tc.name    builtinsArraySortTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_0500
     * @tc.desc    Verify sort with comparator that returns int max value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySortTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 2;
      arr[1] = 1;

      const result = arr.sort((a: number, b: number) => 2147483647);

      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArraySortTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_0600
     * @tc.desc    Verify sort with comparator that returns int min value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySortTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 2;
      arr[1] = 1;

      const result = arr.sort((a: number, b: number) => -2147483648);

      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArraySortTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_0700
     * @tc.desc    Verify sort with comparator that returns 0 (no sorting)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySortTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 5;
      arr[1] = 3;
      arr[2] = 1;
      arr[3] = 4;
      arr[4] = 2;
      const original = Array.create<number>(5, 0);
      original[0] = 5;
      original[1] = 3;
      original[2] = 1;
      original[3] = 4;
      original[4] = 2;

      const result = arr.sort((a: number, b: number) => 0);

      expect(result).assertEqual(arr);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(original[i]);
      }
    });

    /**
     * @tc.name    builtinsArraySortTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_0800
     * @tc.desc    Verify sort with comparator that returns negative value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySortTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 2;
      arr[1] = 1;

      const result = arr.sort((a: number, b: number) => -1);

      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArraySortTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_0900
     * @tc.desc    Verify sort with comparator that returns positive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySortTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;

      const result = arr.sort((a: number, b: number) => 1);

      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArraySortTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_1000
     * @tc.desc    Verify sort on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySortTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.sort();

      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySortTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_1100
     * @tc.desc    Verify sort on single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySortTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);
      const result = arr.sort();
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArraySortTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_SORT_TEST_1200
     * @tc.desc    Verify sort with comparator using index calculation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySortTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(8, 0);
      arr[0] = 3;
      arr[1] = 1;
      arr[2] = 4;
      arr[3] = 1;
      arr[4] = 5;
      arr[5] = 9;
      arr[6] = 2;
      arr[7] = 6;

      const result = arr.sort((a: number, b: number) => {
        if (a < b) return -2147483648;
        if (a > b) return 2147483647;
        return 0;
      });

      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(4);
      expect(arr[5]).assertEqual(5);
      expect(arr[6]).assertEqual(6);
      expect(arr[7]).assertEqual(9);
    });

  })
}
