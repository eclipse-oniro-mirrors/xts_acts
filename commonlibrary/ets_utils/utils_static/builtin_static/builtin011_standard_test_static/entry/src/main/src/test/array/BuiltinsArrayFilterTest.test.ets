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

export default function BuiltinsArrayFilterTest(): void {
  describe("BuiltinsArrayFilterTest", () => {
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
     * @tc.name    builtinsArrayFilterTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_0100
     * @tc.desc    Verify filter on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFilterTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.filter((value) => value > 0);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFilterTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_0200
     * @tc.desc    Verify filter with normal predicate
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFilterTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const result = arr.filter((value) => value > 2);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayFilterTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_0300
     * @tc.desc    Verify filter with all elements satisfying predicate
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFilterTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.filter((value) => value > 0);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFilterTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_0400
     * @tc.desc    Verify filter with no elements satisfying predicate
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFilterTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.filter((value) => value > 5);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFilterTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_0500
     * @tc.desc    Verify filter using index parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFilterTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(4, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      const result = arr.filter((value, index) => index % 2 === 0);
      
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.name    builtinsArrayFilterTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_0600
     * @tc.desc    Verify filter using array parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFilterTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.filter((value, index, array) => array.length > 2);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFilterTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_0700
     * @tc.desc    Verify filter with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFilterTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(4, '');
      arr[0] = 'apple';
      arr[1] = 'banana';
      arr[2] = 'cherry';
      arr[3] = 'date';
      const result = arr.filter((value) => value.length > 5);
      
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('banana');
    });

    /**
     * @tc.name    builtinsArrayFilterTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_0800
     * @tc.desc    Verify filter returns new array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFilterTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.filter((value) => value > 1);

      expect(result.length).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFilterTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_0900
     * @tc.desc    Verify filter with index parameter using integer operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFilterTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const result = arr.filter((value, index) => {
        return (index * 10) % 20 === 0;
      });
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(30);
      expect(result[2]).assertEqual(50);
    });

    /**
     * @tc.name    builtinsArrayFilterTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_1000
     * @tc.desc    Verify filter with large index values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFilterTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(10, 0);
      for (let i = 0; i < 10; i++) {
        arr[i] = i + 1;
      }
      
      const result = arr.filter((value, index) => {
        return index < 5;
      });
      
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayFilterTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_1100
     * @tc.desc    Verify filter with edge case index comparisons
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFilterTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result1 = arr.filter((value, index) => index === 0);
      expect(result1.length).assertEqual(1);
      expect(result1[0]).assertEqual(1);
      
      const result2 = arr.filter((value, index) => index === arr.length - 1);
      expect(result2.length).assertEqual(1);
      expect(result2[0]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFilterTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_1200
     * @tc.desc    Verify filter with int type boundary values in predicate
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFilterTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const minInt = -2147483648;
      const result1 = arr.filter((value, index) => {
        return index > minInt;
      });
      expect(result1.length).assertEqual(3);
      
      const maxInt = 2147483647;
      const result2 = arr.filter((value, index) => {
        return index < maxInt;
      });
      expect(result2.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFilterTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_FILTER_TEST_1300
     * @tc.desc    Verify filter with int type arithmetic operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFilterTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(4, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;

      const result = arr.filter((value, index) => {
        const sum = index + 1;
        const difference = index - 1;
        const product = index * 10;
        const quotient = index / 2;

        return sum > 0 && difference < 3 && product < 40 && quotient >= 0;
      });
      
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
      expect(result[3]).assertEqual(40);
    });
  })
}