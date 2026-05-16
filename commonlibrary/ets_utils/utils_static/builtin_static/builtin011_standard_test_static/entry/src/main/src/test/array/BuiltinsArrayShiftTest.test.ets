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

export default function BuiltinsArrayShiftTest() : void{
  describe("BuiltinsArrayShiftTest", () => {
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
     * @tc.name    builtinsArrayShiftTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_SHIFT_TEST_0100
     * @tc.desc    Verify shift on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayShiftTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.shift();
      
      expect(arr.length).assertEqual(0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsArrayShiftTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_SHIFT_TEST_0200
     * @tc.desc    Verify shift on array with single element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayShiftTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(1, NaN);
      arr[0] = 10;
      const result = arr.shift();
      
      expect(arr.length).assertEqual(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name    builtinsArrayShiftTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_SHIFT_TEST_0300
     * @tc.desc    Verify shift on array with multiple elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayShiftTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.shift();
      
      expect(arr.length).assertEqual(2);
      expect(result).assertEqual(1);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayShiftTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_SHIFT_TEST_0400
     * @tc.desc    Verify multiple consecutive shifts
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayShiftTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      
      const result1 = arr.shift();
      expect(arr.length).assertEqual(4);
      expect(result1).assertEqual(1);
      expect(arr[0]).assertEqual(2);
      
      const result2 = arr.shift();
      expect(arr.length).assertEqual(3);
      expect(result2).assertEqual(2);
      expect(arr[0]).assertEqual(3);
      
      const result3 = arr.shift();
      expect(arr.length).assertEqual(2);
      expect(result3).assertEqual(3);
      expect(arr[0]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayShiftTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_SHIFT_TEST_0500
     * @tc.desc    Verify shift on array with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayShiftTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(2, '');
      arr[0] = 'first';
      arr[1] = 'second';
      const result = arr.shift();
      
      expect(arr.length).assertEqual(1);
      expect(result).assertEqual('first');
      expect(arr[0]).assertEqual('second');
    });

    /**
     * @tc.name    builtinsArrayShiftTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_SHIFT_TEST_0600
     * @tc.desc    Verify shift on array with object elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayShiftTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: Record<string, string> = { "name": 'test1' };
      const obj2: Record<string, string> = { "name": 'test2' };
      const arr: Record<string, string>[] = [obj1, obj2];
      const result = arr.shift();
      
      expect(arr.length).assertEqual(1);
      expect(result).assertDeepEquals(obj1);
      expect(arr[0]).assertDeepEquals(obj2);
    });
  })
}