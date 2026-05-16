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

interface ResultObj {
  value: number;
  index: number;
}

export default function BuiltinsArrayFromTest(): void {
  describe("BuiltinsArrayFromTest", () => {
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
     * @tc.name    builtinsArrayFromTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0100
     * @tc.desc    Verify from with ArrayLike<number> using array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFromTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const source = [1, 2, 3];
      const arr = Array.from(source);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFromTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0200
     * @tc.desc    Verify from with ArrayLike of strings using array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = ['hello', 'world', 'test'];
      const arr = Array.from(source);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
      expect(arr[2]).assertEqual('test');
    });

    /**
     * @tc.name    builtinsArrayFromTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0300
     * @tc.desc    Verify from with ArrayLike of booleans using array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = [true, false, true];
      const arr = Array.from(source);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(true);
      expect(arr[1]).assertEqual(false);
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayFromTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0400
     * @tc.desc    Verify from with empty ArrayLike
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source: number[] = [];
      const arr = Array.from(source);

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFromTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0500
     * @tc.desc    Verify from with ArrayLike of single element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = [42];
      const arr = Array.from(source);

      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayFromTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0600
     * @tc.desc    Verify from with ArrayLike containing null and undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = [1, null, undefined];
      const arr = Array.from(source);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(null);
      expect(arr[2]).assertEqual(undefined);
    });

    /**
     * @tc.name    builtinsArrayFromTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0700
     * @tc.desc    Verify from with ArrayLike containing boundary number values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFromTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const source = [2147483647, -2147483648, 0];
      const arr = Array.from(source);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(-2147483648);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFromTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0800
     * @tc.desc    Verify from with ArrayLike containing floating point numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = [3.14, 2.718, 1.414];
      const arr = Array.from(source);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(3.14);
      expect(arr[1]).assertEqual(2.718);
      expect(arr[2]).assertEqual(1.414);
    });

    /**
     * @tc.name    builtinsArrayFromTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_0900
     * @tc.desc    Verify from with large ArrayLike
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFromTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const size = 100;
      const sourceArr: number[] = [];
      for (let i = 0; i < size; i++) {
        sourceArr.push(i);
      }
      const source = sourceArr;
      const arr = Array.from(source);

      expect(arr.length).assertEqual(size);
      expect(arr[0]).assertEqual(0);
      expect(arr[size - 1]).assertEqual(size - 1);
    });

    /**
     * @tc.name    builtinsArrayFromTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1000
     * @tc.desc    Verify from with Set
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = new Set<number>([1, 2, 3, 4, 5]);
      const arr = Array.from(source);

      expect(arr.length).assertEqual(5);
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(3)).assertTrue();
      expect(arr.includes(4)).assertTrue();
      expect(arr.includes(5)).assertTrue();
    });

    /**
     * @tc.name    builtinsArrayFromTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1100
     * @tc.desc    Verify from with Map
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = new Map<string, number>([['a', 1], ['b', 2], ['c', 3]]);
      const arr = Array.from(source);

      expect(arr.length).assertEqual(3);
      expect(arr[0][0]).assertEqual('a');
      expect(arr[0][1]).assertEqual(1);
      expect(arr[1][0]).assertEqual('b');
      expect(arr[1][1]).assertEqual(2);
      expect(arr[2][0]).assertEqual('c');
      expect(arr[2][1]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFromTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1200
     * @tc.desc    Verify from with string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = 'hello';
      const arr = Array.from(source);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual('h');
      expect(arr[1]).assertEqual('e');
      expect(arr[2]).assertEqual('l');
      expect(arr[3]).assertEqual('l');
      expect(arr[4]).assertEqual('o');
    });

    /**
     * @tc.name    builtinsArrayFromTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1300
     * @tc.desc    Verify from with empty Set
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = new Set<number>();
      const arr = Array.from(source);

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFromTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1400
     * @tc.desc    Verify from with empty Map
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = new Map<string, number>();
      const arr = Array.from(source);

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFromTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1500
     * @tc.desc    Verify from with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = '';
      const arr = Array.from(source);

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFromTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1600
     * @tc.desc    Verify from with ArrayLike and mapfn
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = [1, 2, 3];
      const arr = Array.from(source, (v, k) => v * 2);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.name    builtinsArrayFromTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1700
     * @tc.desc    Verify from with Set and mapfn
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = new Set<number>([1, 2, 3]);
      const arr = Array.from(source, (v, k) => v * 3);

      expect(arr.length).assertEqual(3);
      expect(arr.includes(3)).assertTrue();
      expect(arr.includes(6)).assertTrue();
      expect(arr.includes(9)).assertTrue();
    });

    /**
     * @tc.name    builtinsArrayFromTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1800
     * @tc.desc    Verify from with string and mapfn
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = 'hello';
      const arr = Array.from(source, (v, k) => v.toUpperCase());

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual('H');
      expect(arr[1]).assertEqual('E');
      expect(arr[2]).assertEqual('L');
      expect(arr[3]).assertEqual('L');
      expect(arr[4]).assertEqual('O');
    });

    /**
     * @tc.name    builtinsArrayFromTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_1900
     * @tc.desc    Verify from with mapfn using index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source = [10, 20, 30];
      const arr = Array.from(source, (v, k) => v + k);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(21);
      expect(arr[2]).assertEqual(32);
    });

    /**
     * @tc.name    builtinsArrayFromTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2000
     * @tc.desc    Verify from with mapfn returning objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {


      const source = [1, 2, 3];
      const arr = Array.from(source, (v, k): ResultObj => ({ value: v, index: k }));

      expect(arr.length).assertEqual(3);
      expect(arr[0].value).assertEqual(1);
      expect(arr[0].index).assertEqual(0);
      expect(arr[1].value).assertEqual(2);
      expect(arr[1].index).assertEqual(1);
      expect(arr[2].value).assertEqual(3);
      expect(arr[2].index).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayFromTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_FROM_TEST_2100
     * @tc.desc    Verify from with empty ArrayLike and mapfn
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFromTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source: number[] = [];
      const arr = Array.from(source, (v, k) => v * 2);
      expect(arr.length).assertEqual(0);
    });
  })
}
