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

export default function BuiltinsArraySliceTest() : void{
  describe("BuiltinsArraySliceTest", () => {
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
     * @tc.name    builtinsArraySliceTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_0100
     * @tc.desc    Verify slice with positive start index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySliceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.slice(2);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArraySliceTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_0200
     * @tc.desc    Verify slice with start index 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(0);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySliceTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_0300
     * @tc.desc    Verify slice with negative start index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.slice(-3);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArraySliceTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_0400
     * @tc.desc    Verify slice with start index equal to array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(3);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySliceTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_0500
     * @tc.desc    Verify slice with start index greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(5);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySliceTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_0600
     * @tc.desc    Verify slice with minimum int value as start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySliceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(-2147483648);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySliceTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_0700
     * @tc.desc    Verify slice with maximum int value as start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySliceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(2147483647);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySliceTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_0800
     * @tc.desc    Verify slice with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      
      const result = arr.slice(0);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySliceTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_0900
     * @tc.desc    Verify slice with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(1, NaN);
      arr[0] = 42;
      
      const result = arr.slice(0);
      
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.name    builtinsArraySliceTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1000
     * @tc.desc    Verify slice with start and end parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.slice(1, 4);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArraySliceTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1100
     * @tc.desc    Verify slice with negative end index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.slice(1, -1);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArraySliceTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1200
     * @tc.desc    Verify slice with end less than start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(2, 1);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySliceTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1300
     * @tc.desc    Verify slice with end equal to start
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(1, 1);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySliceTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1400
     * @tc.desc    Verify slice with end greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(0, 10);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySliceTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1500
     * @tc.desc    Verify slice with no parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice();
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySliceTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1600
     * @tc.desc    Verify slice with only end parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.slice(undefined, 3);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySliceTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1700
     * @tc.desc    Verify slice with negative start and end indices
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.slice(-4, -1);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArraySliceTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1800
     * @tc.desc    Verify slice with minimum int values for start and end
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySliceTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(-2147483648, -2147483648);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySliceTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_1900
     * @tc.desc    Verify slice with maximum int values for start and end
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySliceTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(2147483647, 2147483647);
      
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySliceTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_2000
     * @tc.desc    Verify slice with negative start and positive end
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.slice(-3, 4);
      
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArraySliceTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_2100
     * @tc.desc    Verify slice with positive start and negative end
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.slice(1, -2);
      
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArraySliceTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_SLICE_TEST_2200
     * @tc.desc    Verify slice with start and end at array boundaries
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySliceTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.slice(0, 3);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });
  })
}