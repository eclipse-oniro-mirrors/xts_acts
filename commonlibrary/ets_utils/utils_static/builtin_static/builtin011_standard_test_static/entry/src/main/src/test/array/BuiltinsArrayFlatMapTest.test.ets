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

export default function BuiltinsArrayFlatMapTest(): void {
  describe("BuiltinsArrayFlatMapTest", () => {
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
     * @tc.name    builtinsArrayFlatMapTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_FLATMAP_TEST_0100
     * @tc.desc    Verify flatMap with basic functionality
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayFlatMapTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];

      const result = arr.flatMap<number>((value: number, index: int) => {
        return [value, value * 2];
      });

      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(3);
      expect(result[5]).assertEqual(6);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatMapTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_FLATMAP_TEST_0200
     * @tc.desc    Verify flatMap with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatMapTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [];

      const result = arr.flatMap<number>((value: number) => {
        return [value, value * 2];
      });

      expect(result.length).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayFlatMapTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_FLATMAP_TEST_0300
     * @tc.desc    Verify flatMap with non-array return values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatMapTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];

      const result = arr.flatMap<number>((value: number) => {
        return value * 2;
      });

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(6);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatMapTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_FLATMAP_TEST_0400
     * @tc.desc    Verify flatMap with index parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatMapTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [10, 20, 30];

      const result = arr.flatMap<number>((value: number, index: int) => {
        return [value, index];
      });

      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(20);
      expect(result[3]).assertEqual(1);
      expect(result[4]).assertEqual(30);
      expect(result[5]).assertEqual(2);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayFlatMapTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_FLATMAP_TEST_0500
     * @tc.desc    Verify flatMap with array parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayFlatMapTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2];

      const result = arr.flatMap<number>((value: number, index: int, array: Array<number>) => {
        return [value, array.length];
      });

      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayFlatMapTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_FLATMAP_TEST_0600
     * @tc.desc    Verify flatMap with int minimum value in callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFlatMapTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = [1];

      const result = arr.flatMap<number>((value: number) => {
        return [value, -2147483648];
      });

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(-2147483648);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayFlatMapTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_FLATMAP_TEST_0700
     * @tc.desc    Verify flatMap with int maximum value in callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayFlatMapTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr: Array<number> = [1];

      const result = arr.flatMap<number>((value: number) => {
        return [value, 2147483647];
      });

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2147483647);
      expect(arr.length).assertEqual(1);
    });

  })
}
