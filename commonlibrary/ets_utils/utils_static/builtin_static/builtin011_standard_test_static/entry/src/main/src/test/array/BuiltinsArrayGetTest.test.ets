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

interface TestObj {
  name: string;
  value: number;
}

export default function BuiltinsArrayGetTest(): void {
  describe("BuiltinsArrayGetTest", () => {
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
     * @tc.name    builtinsArrayGetTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_0100
     * @tc.desc    Verify $_get with index 0 (first element)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayGetTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 0;

      const result = arr[idx];
      const expected = 10;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_0200
     * @tc.desc    Verify $_get with index (length - 1) (last element)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = arr.length - 1;

      const result = arr[idx];
      const expected = 50;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_0300
     * @tc.desc    Verify $_get with index 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 1;

      const result = arr[idx];
      const expected = 20;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_0400
     * @tc.desc    Verify $_get with index 2
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 2;

      const result = arr[idx];
      const expected = 30;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_0500
     * @tc.desc    Verify $_get with index 3
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 3;

      const result = arr[idx];
      const expected = 40;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_0600
     * @tc.desc    Verify $_get with index 4
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 4;

      const result = arr[idx];
      const expected = 50;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_0700
     * @tc.desc    Verify $_get with string type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = ["a", "b", "c", "d", "e"];
      const idx = 2;

      const result = arr[idx];
      const expected = "c";

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_0800
     * @tc.desc    Verify $_get with boolean type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = [true, false, true, false, true];
      const idx = 1;

      const result = arr[idx];
      const expected = false;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_0900
     * @tc.desc    Verify $_get with object type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: TestObj = { name: "test1", value: 10 };
      const obj2: TestObj = { name: "test2", value: 20 };
      const arr: TestObj[] = [obj1, obj2];
      const idx = 0;

      const result = arr[idx];
      const expected = obj1;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_1000
     * @tc.desc    Verify $_get after setting element at specific index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;

      arr[2] = 100;

      const result = arr[2];
      const expected = 100;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_1100
     * @tc.desc    Verify $_get after set length operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayGetTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;

      arr.length = 3;

      const result1 = arr[0];
      const result2 = arr[1];
      const result3 = arr[2];

      expect(result1).assertEqual(10);
      expect(result2).assertEqual(20);
      expect(result3).assertEqual(30);
    });

    /**
     * @tc.name    builtinsArrayGetTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_1200
     * @tc.desc    Verify $_get with large array (10000 elements)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayGetTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(10000, 0);
      for (let i = 0; i < 10000; i++) {
        arr[i] = i;
      }

      const idx = 5000;
      const result = arr[idx];
      const expected = 5000;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_1300
     * @tc.desc    Verify $_get with array created by push operations
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.pushOne(10);
      arr.pushOne(20);
      arr.pushOne(30);

      const result1 = arr[0];
      const result2 = arr[1];
      const result3 = arr[2];

      expect(result1).assertEqual(10);
      expect(result2).assertEqual(20);
      expect(result3).assertEqual(30);
    });

    /**
     * @tc.name    builtinsArrayGetTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_1400
     * @tc.desc    Verify $_get with index 0 after pop operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      arr.pop();

      const result = arr[3];
      const expected = 40;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_1500
     * @tc.desc    Verify $_get with index 0 after shift operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayGetTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      arr.shift();

      const result = arr[0];
      const expected = 20;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayGetTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_1600
     * @tc.desc    Verify $_get with index 2147483647 (int max) throws out of bounds exception
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayGetTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 2147483647;

      expect(() => {
        const result = arr[idx];
      }).assertThrow('Out of bounds');
    });

    /**
     * @tc.name    builtinsArrayGetTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_GET_TEST_1700
     * @tc.desc    Verify $_get with index greater than array length throws out of bounds exception
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayGetTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 10;

      expect(() => {
        const result = arr[idx];
      }).assertThrow('Out of bounds');
    });

  })
}