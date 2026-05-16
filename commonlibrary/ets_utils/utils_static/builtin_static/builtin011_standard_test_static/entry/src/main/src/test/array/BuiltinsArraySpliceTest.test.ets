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

export default function BuiltinsArraySpliceTest() : void{
  describe("BuiltinsArraySpliceTest", () => {
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
     * @tc.name    builtinsArraySpliceTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_0100
     * @tc.desc    Verify splice on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySpliceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.splice(0);
      
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySpliceTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_0200
     * @tc.desc    Verify splice with start at 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySpliceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(0);
      
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySpliceTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_0300
     * @tc.desc    Verify splice with start in middle
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySpliceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.splice(2);
      
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArraySpliceTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_0400
     * @tc.desc    Verify splice with start equal to array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(3);
      
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySpliceTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_0500
     * @tc.desc    Verify splice with negative start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.splice(-2);
      
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArraySpliceTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_0600
     * @tc.desc    Verify splice with start greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(10);
      
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySpliceTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_0700
     * @tc.desc    Verify splice with minimum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySpliceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(-2147483648);
      
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySpliceTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_0800
     * @tc.desc    Verify splice with maximum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySpliceTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(2147483647);
      
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySpliceTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_0900
     * @tc.desc    Verify splice with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(4, '');
      arr[0] = 'a';
      arr[1] = 'b';
      arr[2] = 'c';
      arr[3] = 'd';
      const result = arr.splice(1);
      
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('a');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('b');
      expect(result[1]).assertEqual('c');
      expect(result[2]).assertEqual('d');
    });

    /**
     * @tc.name    builtinsArraySpliceTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1000
     * @tc.desc    Verify splice with object elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: Record<string, string> = { "name": 'test1' };
      const obj2: Record<string, string> = { "name": 'test2' };
      const obj3: Record<string, string> = { "name": 'test3' };
      const arr = Array.create<Record<string, string>>(3, obj1);
      arr[0] = obj1;
      arr[1] = obj2;
      arr[2] = obj3;
      const result = arr.splice(1);
      
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertDeepEquals(obj1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertDeepEquals(obj2);
      expect(result[1]).assertDeepEquals(obj3);
    });

    /**
     * @tc.name    builtinsArraySpliceTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1100
     * @tc.desc    Verify splice with start and delete parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySpliceTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.splice(1, 2);
      
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySpliceTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1200
     * @tc.desc    Verify splice with start, delete and items parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySpliceTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.splice(1, 2, 6, 7);
      
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(6);
      expect(arr[2]).assertEqual(7);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySpliceTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1300
     * @tc.desc    Verify splice with delete undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(1, undefined, 4);
      
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySpliceTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1400
     * @tc.desc    Verify splice with delete 0 (insert only)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(1, 0, 4, 5);
      
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySpliceTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1500
     * @tc.desc    Verify splice with negative delete (treated as 0)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(1, -5, 4);
      
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySpliceTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1600
     * @tc.desc    Verify splice with delete greater than remaining elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(1, 10);
      
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySpliceTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1700
     * @tc.desc    Verify splice with minimum int value for start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySpliceTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(-2147483648, 2, 4);
      
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArraySpliceTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1800
     * @tc.desc    Verify splice with maximum int value for start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySpliceTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.splice(2147483647, 2, 4);
      
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySpliceTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_1900
     * @tc.desc    Verify splice with string elements and items
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(4, '');
      arr[0] = 'a';
      arr[1] = 'b';
      arr[2] = 'c';
      arr[3] = 'd';
      const result = arr.splice(1, 2, 'x', 'y');
      
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('x');
      expect(arr[2]).assertEqual('y');
      expect(arr[3]).assertEqual('d');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('b');
      expect(result[1]).assertEqual('c');
    });

    /**
     * @tc.name    builtinsArraySpliceTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_SPLICE_TEST_2000
     * @tc.desc    Verify splice with object elements and items
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySpliceTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: Record<string, string> = { "name": 'test1' };
      const obj2: Record<string, string> = { "name": 'test2' };
      const obj3: Record<string, string> = { "name": 'test3' };
      const obj4: Record<string, string> = { "name": 'test4' };
      const obj5: Record<string, string> = { "name": 'test5' };
      const arr = Array.create<Record<string, string>>(3, obj1);
      arr[0] = obj1;
      arr[1] = obj2;
      arr[2] = obj3;
      const result = arr.splice(1, 1, obj4, obj5);
      
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertDeepEquals(obj1);
      expect(arr[1]).assertDeepEquals(obj4);
      expect(arr[2]).assertDeepEquals(obj5);
      expect(arr[3]).assertDeepEquals(obj3);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertDeepEquals(obj2);
    });
  })
}