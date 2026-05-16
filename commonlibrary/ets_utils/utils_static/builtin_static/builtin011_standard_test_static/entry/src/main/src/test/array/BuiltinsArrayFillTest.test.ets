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

interface TestObject {
  value: number;
}

export default function BuiltinsArrayFillTest(): void {
  describe("BuiltinsArrayFillTest", () => {
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
     * @tc.name    builtinsArrayFillTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_0100
     * @tc.desc    Verify fill with only value parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFillTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.fill(0);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFillTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_0200
     * @tc.desc    Verify fill with value and start parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.fill(0, 2);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFillTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_0300
     * @tc.desc    Verify fill with value, start, and end parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.fill(0, 1, 4);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayFillTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_0400
     * @tc.desc    Verify fill with negative start index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.fill(0, -3);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFillTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_0500
     * @tc.desc    Verify fill with negative end index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result = arr.fill(0, 1, -1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayFillTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_0600
     * @tc.desc    Verify fill with start greater than end
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.fill(0, 2, 1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFillTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_0700
     * @tc.desc    Verify fill with start equal to end
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.fill(0, 1, 1);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFillTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_0800
     * @tc.desc    Verify fill with start greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.fill(0, 5);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFillTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_0900
     * @tc.desc    Verify fill with end greater than array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.fill(0, 1, 10);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFillTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_1000
     * @tc.desc    Verify fill with minimum int values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFillTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.fill(0, -2147483648, -2147483648);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFillTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_1100
     * @tc.desc    Verify fill with maximum int values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFillTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.fill(0, 2147483647, 2147483647);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFillTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_1200
     * @tc.desc    Verify fill with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      
      const result = arr.fill(0);
      
      expect(result).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFillTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_1300
     * @tc.desc    Verify fill with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(1, 0);
      arr[0] = 42;
      
      const result = arr.fill(0);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFillTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_FILL_TEST_1400
     * @tc.desc    Verify fill with object value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFillTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      
      const obj: TestObject = { "value": 42 };
      const arr = Array.create<TestObject>(3, obj);
      
      const result = arr.fill(obj);
      
      expect(result).assertEqual(arr);
      expect(arr[0]).assertEqual(obj);
      expect(arr[1]).assertEqual(obj);
      expect(arr[2]).assertEqual(obj);
    });
  })
}