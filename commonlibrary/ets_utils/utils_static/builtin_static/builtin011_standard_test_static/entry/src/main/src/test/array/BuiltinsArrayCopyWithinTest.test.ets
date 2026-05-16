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

export default function BuiltinsArrayCopyWithinTest(): void {
  describe("BuiltinsArrayCopyWithinTest", () => {
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
     * @tc.name    builtinsArrayCopyWithinTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_0100
     * @tc.desc    Verify copyWithin with positive target index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayCopyWithinTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.copyWithin(2);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(2);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_0200
     * @tc.desc    Verify copyWithin with target index 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(0);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_0300
     * @tc.desc    Verify copyWithin with negative target index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.copyWithin(-2);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_0400
     * @tc.desc    Verify copyWithin with target index equal to array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(3);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_0500
     * @tc.desc    Verify copyWithin with minimum int value as target
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayCopyWithinTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(-2147483648);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_0600
     * @tc.desc    Verify copyWithin with maximum int value as target
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayCopyWithinTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(2147483647);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_0700
     * @tc.desc    Verify copyWithin with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.copyWithin(0);
      
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_0800
     * @tc.desc    Verify copyWithin with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(1, NaN);
      arr[0] = 42;
      
      const result = arr.copyWithin(0);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_0900
     * @tc.desc    Verify copyWithin with start parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.copyWithin(1, 3);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(5);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1000
     * @tc.desc    Verify copyWithin with start and end parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.copyWithin(0, 1, 3);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1100
     * @tc.desc    Verify copyWithin(target: int, start: int) with positive indices
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.copyWithin(2, 1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1200
     * @tc.desc    Verify copyWithin(target: int, start: int) with negative indices
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.copyWithin(-3, -2);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1300
     * @tc.desc    Verify copyWithin(target: int, start: int) with target equal to start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(1, 1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1400
     * @tc.desc    Verify copyWithin(target: int, start: int) with start greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(0, 5);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1500
     * @tc.desc    Verify copyWithin(target: int, start: int) with minimum int values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayCopyWithinTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(-2147483648, -2147483648);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1600
     * @tc.desc    Verify copyWithin(target: int, start: int) with maximum int values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayCopyWithinTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(2147483647, 2147483647);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1700
     * @tc.desc    Verify copyWithin(target: int, start: int) with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.copyWithin(0, 0);
      
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1800
     * @tc.desc    Verify copyWithin(target: int, start: int) with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(1, NaN);
      arr[0] = 42;
      
      const result = arr.copyWithin(0, 0);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_1900
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) with positive indices
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.copyWithin(0, 1, 3);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_2000
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) with negative indices
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.copyWithin(-3, -4, -1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_2100
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) with end less than start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(0, 2, 1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_2200
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) with end equal to start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(0, 1, 1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_2300
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) with end greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(0, 1, 10);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_2400
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) with minimum int values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayCopyWithinTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(-2147483648, -2147483648, -2147483648);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_2500
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) with maximum int values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayCopyWithinTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.copyWithin(2147483647, 2147483647, 2147483647);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_2600
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.copyWithin(0, 0, 0);
      
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_2700
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(1, NaN);
      arr[0] = 42;
      
      const result = arr.copyWithin(0, 0, 1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArrayCopyWithinTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_COPYWITHIN_TEST_2800
     * @tc.desc    Verify copyWithin(target: int, start: int, end?: int) without end parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCopyWithinTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.copyWithin(2, 1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
      expect(arr[4]).assertEqual(4);
    });
  })
}