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

export default function BuiltinsArrayPushArrayTest() : void{
  describe("BuiltinsArrayPushArrayTest", () => {
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
     * @tc.name    builtinsArrayPushArrayTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_0100
     * @tc.desc    Verify pushArray with no parameters (Level0 smoke test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayPushArrayTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.pushArray();

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_0200
     * @tc.desc    Verify pushArray with single number parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;
      const result = arr.pushArray(3);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_0300
     * @tc.desc    Verify pushArray with multiple number parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = Array.create<number>(1, 0);
      arr[0] = 1;
      const result = arr.pushArray(2, 3, 4, 5);

      expect(result).assertEqual(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_0400
     * @tc.desc    Verify pushArray with single string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = Array.create<string>(1, '');
      arr[0] = 'hello';
      const result = arr.pushArray('world');

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_0500
     * @tc.desc    Verify pushArray with multiple string parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = Array.create<string>(1, '');
      arr[0] = 'a';
      const result = arr.pushArray('b', 'c', 'd');

      expect(result).assertEqual(4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
      expect(arr[2]).assertEqual('c');
      expect(arr[3]).assertEqual('d');
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_0600
     * @tc.desc    Verify pushArray with boolean parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = Array.create<boolean>(1, false);
      arr[0] = true;
      const result = arr.pushArray(false, true);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_0700
     * @tc.desc    Verify pushArray with object parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = Array.create<Person>(1, { name: '', age: 0 });
      arr[0] = { name: 'Alice', age: 25 };
      const result = arr.pushArray({ name: 'Bob', age: 30 });

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].name).assertEqual('Alice');
      expect(arr[1].name).assertEqual('Bob');
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_0800
     * @tc.desc    Verify pushArray with multiple object parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Person[] = [];
      const result = arr.pushArray(
        { name: 'Alice', age: 25 },
        { name: 'Bob', age: 30 },
        { name: 'Charlie', age: 35 }
      );

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0].name).assertEqual('Alice');
      expect(arr[1].name).assertEqual('Bob');
      expect(arr[2].name).assertEqual('Charlie');
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_0900
     * @tc.desc    Verify pushArray with null and undefined parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number | null | undefined> = Array.create<number | null | undefined>(1, 0);
      arr[0] = 1;
      const result = arr.pushArray(null, undefined);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1000
     * @tc.desc    Verify pushArray on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.pushArray(1, 2, 3);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1100
     * @tc.desc    Verify pushArray with boundary number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayPushArrayTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = [];
      const result = arr.pushArray(2147483647, -2147483648);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1200
     * @tc.desc    Verify pushArray with floating point numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(1, 0);
      arr[0] = 1.0;
      const result = arr.pushArray(2.5, 3.14);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1.0);
      expect(arr[1]).assertEqual(2.5);
      expect(arr[2]).assertEqual(3.14);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1300
     * @tc.desc    Verify pushArray with array elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[][] = Array.create<number[]>(1, []);
      arr[0] = [1, 2];
      const result = arr.pushArray([3, 4], [5, 6]);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[0][1]).assertEqual(2);
      expect(arr[1][0]).assertEqual(3);
      expect(arr[1][1]).assertEqual(4);
      expect(arr[2][0]).assertEqual(5);
      expect(arr[2][1]).assertEqual(6);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1400
     * @tc.desc    Verify pushArray with large number of elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayPushArrayTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const elements: number[] = [];
      for (let i = 0; i < 100; i++) {
        elements.push(i);
      }
      const result = arr.pushArray(...elements);

      expect(result).assertEqual(100);
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(0);
      expect(arr[99]).assertEqual(99);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1500
     * @tc.desc    Verify pushArray returns correct new length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const result1 = arr.pushArray(4);
      expect(result1).assertEqual(4);

      const result2 = arr.pushArray(5, 6);
      expect(result2).assertEqual(6);

      const result3 = arr.pushArray();
      expect(result3).assertEqual(6);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1600
     * @tc.desc    Verify pushArray with negative numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [-1];
      const result = arr.pushArray(-2, -3, -4);

      expect(result).assertEqual(4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(-1);
      expect(arr[1]).assertEqual(-2);
      expect(arr[2]).assertEqual(-3);
      expect(arr[3]).assertEqual(-4);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1700
     * @tc.desc    Verify pushArray with mixed types in union type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number | string> = [1];
      const result = arr.pushArray('two', 3, 'four');

      expect(result).assertEqual(4);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual('four');
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1800
     * @tc.desc    Verify pushArray with zero values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [];
      const result = arr.pushArray(0, 0);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_1900
     * @tc.desc    Verify pushArray maintains array order
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [10, 20];
      const result = arr.pushArray(30, 40, 50);

      expect(result).assertEqual(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
      expect(arr[3]).assertEqual(40);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.name    builtinsArrayPushArrayTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_PUSHARRAY_TEST_2000
     * @tc.desc    Verify pushArray with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPushArrayTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ['a'];
      const result = arr.pushArray('', 'b');

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('');
      expect(arr[2]).assertEqual('b');
    });
  })
}
