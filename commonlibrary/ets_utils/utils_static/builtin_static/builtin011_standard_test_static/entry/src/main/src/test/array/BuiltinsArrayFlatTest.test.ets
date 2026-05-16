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

export default function BuiltinsArrayFlatTest(): void {
  describe("BuiltinsArrayFlatTest", () => {
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
     * @tc.name    builtinsArrayFlatTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0100
     * @tc.desc    Verify flat with depth 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFlatTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<Array<number> | number>(3, NaN);
      arr[0] = 1;
      const innerArr1 = Array.create<number>(2, NaN);
      innerArr1[0] = 2;
      innerArr1[1] = 3;
      arr[1] = innerArr1;
      arr[2] = 4;
      
      const result = arr.flat<number>(1);
      
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0200
     * @tc.desc    Verify flat with depth 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<Array<number> | number>(3, NaN);
      arr[0] = 1;
      const innerArr1 = Array.create<number>(2, NaN);
      innerArr1[0] = 2;
      innerArr1[1] = 3;
      arr[1] = innerArr1;
      arr[2] = 4;
      
      const result = arr.flat<Array<number> | number>(0);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(innerArr1);
      expect(result[2]).assertEqual(4);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0300
     * @tc.desc    Verify flat with depth greater than nested levels
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<Array<Array<number>> | number>(2, NaN);
      arr[0] = 1;
      const innerArr1: Array<number>[] = Array.create<Array<number>>(2, []);
      const innerInnerArr1 = Array.create<number>(2, NaN);
      innerInnerArr1[0] = 2;
      innerInnerArr1[1] = 3;
      innerArr1[0] = innerInnerArr1;
      const innerInnerArr2 = Array.create<number>(2, NaN);
      innerInnerArr2[0] = 4;
      innerInnerArr2[1] = 5;
      innerArr1[1] = innerInnerArr2;
      arr[1] = innerArr1;
      
      const result = arr.flat<number>(3);
      
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);

      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayFlatTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0400
     * @tc.desc    Verify flat with negative depth
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<Array<number> | number>(3, NaN);
      arr[0] = 1;
      const innerArr1 = Array.create<number>(2, NaN);
      innerArr1[0] = 2;
      innerArr1[1] = 3;
      arr[1] = innerArr1;
      arr[2] = 4;
      
      const result = arr.flat<Array<number> | number>(-1);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(innerArr1);
      expect(result[2]).assertEqual(4);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0500
     * @tc.desc    Verify flat with minimum int value as depth
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFlatTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<Array<number> | number>(3, NaN);
      arr[0] = 1;
      const innerArr1 = Array.create<number>(2, NaN);
      innerArr1[0] = 2;
      innerArr1[1] = 3;
      arr[1] = innerArr1;
      arr[2] = 4;
      
      const result = arr.flat<Array<number> | number>(-2147483648);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(innerArr1);
      expect(result[2]).assertEqual(4);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0600
     * @tc.desc    Verify flat with maximum int value as depth
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFlatTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<Array<Array<number>> | number>(2, NaN);
      arr[0] = 1;
      const innerArr1: Array<number>[] = [];
      const innerInnerArr1 = Array.create<number>(2, NaN);
      innerInnerArr1[0] = 2;
      innerInnerArr1[1] = 3;
      innerArr1.push(innerInnerArr1);
      const innerInnerArr2 = Array.create<number>(2, NaN);
      innerInnerArr2[0] = 4;
      innerInnerArr2[1] = 5;
      innerArr1.push(innerInnerArr2);
      arr[1] = innerArr1;
      
      const result = arr.flat<number>(2147483647);
      
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);

      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayFlatTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0700
     * @tc.desc    Verify flat with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (Array<number> | number)[] = [];

      const result = arr.flat<number>(1);
      
      expect(result.length).assertEqual(0);

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFlatTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0800
     * @tc.desc    Verify flat with non-nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.flat<number>(1);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_0900
     * @tc.desc    Verify flat with multi-level nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<Array<Array<Array<number>>> | number>(2, NaN);
      arr[0] = 1;
      const innerArr1: Array<Array<number>>[] = [];
      const innerInnerArr1: Array<number>[] = [];
      const innerInnerInnerArr1 = Array.create<number>(2, NaN);
      innerInnerInnerArr1[0] = 2;
      innerInnerInnerArr1[1] = 3;
      innerInnerArr1.push(innerInnerInnerArr1);
      innerArr1.push(innerInnerArr1);
      arr[1] = innerArr1;
      
      const result = arr.flat<number>(3);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);

      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayFlatTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1000
     * @tc.desc    Verify flat with depth 2
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<Array<Array<number>> | number>(2, NaN);
      arr[0] = 1;
      const innerArr1: Array<number>[] = Array.create<Array<number>>(2, []);
      const innerInnerArr1 = Array.create<number>(2, NaN);
      innerInnerArr1[0] = 2;
      innerInnerArr1[1] = 3;
      innerArr1[0] = innerInnerArr1;
      const innerInnerArr2 = Array.create<number>(2, NaN);
      innerInnerArr2[0] = 4;
      innerInnerArr2[1] = 5;
      innerArr1[1] = innerInnerArr2;
      arr[1] = innerArr1;
      
      const result = arr.flat<Array<number> | number>(1);
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(innerInnerArr1);
      expect(result[2]).assertEqual(innerInnerArr2);

      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayFlatTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1100
     * @tc.desc    Verify flat without parameters (default depth 1)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFlatTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<Array<number> | number>(3, NaN);
      arr[0] = 1;
      const innerArr1 = Array.create<number>(2, NaN);
      innerArr1[0] = 2;
      innerArr1[1] = 3;
      arr[1] = innerArr1;
      arr[2] = 4;
      
      const result = arr.flat<number>();
      
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1200
     * @tc.desc    Verify flat without parameters on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: (Array<number> | number)[] = [];

      const result = arr.flat<number>();
      
      expect(result.length).assertEqual(0);

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFlatTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1300
     * @tc.desc    Verify flat without parameters on non-nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      
      const result = arr.flat<number>();
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);

      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_FLAT_TEST_1400
     * @tc.desc    Verify flat without parameters on multi-level nested array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<Array<Array<number>> | number>(2, NaN);
      arr[0] = 1;
      const innerArr1: Array<number>[] = Array.create<Array<number>>(2, []);
      const innerInnerArr1 = Array.create<number>(2, NaN);
      innerInnerArr1[0] = 2;
      innerInnerArr1[1] = 3;
      innerArr1[0] = innerInnerArr1;
      const innerInnerArr2 = Array.create<number>(2, NaN);
      innerInnerArr2[0] = 4;
      innerInnerArr2[1] = 5;
      innerArr1[1] = innerInnerArr2;
      arr[1] = innerArr1;
      
      const result = arr.flat<Array<number> | number>();
      
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(innerInnerArr1);
      expect(result[2]).assertEqual(innerInnerArr2);

      expect(arr.length).assertEqual(2);
    });
  })
}