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

export default function BuiltinsArrayExtendToTest(): void {
  describe("BuiltinsArrayExtendToTest", () => {
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
     * @tc.name    builtinsArrayExtendToTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_0100
     * @tc.desc    Verify extendTo with normal positive length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayExtendToTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;
      const initialValue = 0;
      const newLength = 5;
      
      arr.extendTo(newLength, initialValue);
      
      expect(arr.length).assertEqual(newLength);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(initialValue);
      expect(arr[3]).assertEqual(initialValue);
      expect(arr[4]).assertEqual(initialValue);
    });

    /**
     * @tc.name    builtinsArrayExtendToTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_0200
     * @tc.desc    Verify extendTo with length equal to current length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayExtendToTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const initialValue = 0;
      const newLength = 3;
      
      arr.extendTo(newLength, initialValue);
      
      expect(arr.length).assertEqual(newLength);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayExtendToTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_0300
     * @tc.desc    Verify extendTo with length less than current length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayExtendToTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const initialValue = 0;
      const newLength = 2;
      
      arr.extendTo(newLength, initialValue);
      
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayExtendToTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_0400
     * @tc.desc    Verify extendTo with negative length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayExtendToTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(2, 0);
      const initialValue = 0;
      const newLength = -5;
      
      expect(() => {
        arr.extendTo(newLength, initialValue);
      }).assertThrowError('', 'Parameter error.Invalid array length.');
    });

    /**
     * @tc.name    builtinsArrayExtendToTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_0500
     * @tc.desc    Verify extendTo with zero length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayExtendToTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;
      const initialValue = 0;
      const newLength = 0;
      
      arr.extendTo(newLength, initialValue);
      
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayExtendToTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_0600
     * @tc.desc    Verify extendTo with boundary value 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayExtendToTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const initialValue = 10;
      const newLength = 1;
      
      arr.extendTo(newLength, initialValue);
      
      expect(arr.length).assertEqual(newLength);
      expect(arr[0]).assertEqual(initialValue);
    });

    /**
     * @tc.name    builtinsArrayExtendToTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_0700
     * @tc.desc    Verify extendTo with object initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayExtendToTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Record<string, string>[] = Array.create<Record<string, string>>(1, {});
      const initialValue1: Record<string, string> = { "name": 'test1' };
      arr[0] = initialValue1;
      const initialValue2: Record<string, string> = { "name": 'test2' };
      const newLength = 3;
      
      arr.extendTo(newLength, initialValue2);
      
      expect(arr.length).assertEqual(newLength);
      expect(arr[0]).assertDeepEquals(initialValue1);
      expect(arr[1]).assertDeepEquals(initialValue2);
      expect(arr[2]).assertDeepEquals(initialValue2);
    });

    /**
     * @tc.name    builtinsArrayExtendToTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_0800
     * @tc.desc    Verify extendTo with large positive length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayExtendToTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;
      const initialValue = 0;
      const newLength = 1000;
      
      arr.extendTo(newLength, initialValue);
      
      expect(arr.length).assertEqual(newLength);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[999]).assertEqual(initialValue);
    });

    /**
     * @tc.name    builtinsArrayExtendToTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_0900
     * @tc.desc    Verify extendTo with minimum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayExtendToTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(2, 0);
      const initialValue = 0;
      const newLength = -2147483648;
      
      expect(() => {
        arr.extendTo(newLength, initialValue);
      }).assertThrowError('', 'Parameter error.Invalid array length.');
    });

    /**
     * @tc.name    builtinsArrayExtendToTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_EXTEND_TO_TEST_1000
     * @tc.desc    Verify extendTo with maximum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayExtendToTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;
      const initialValue = 0;
      const newLength = 2147483647;
      
      expect(() => {
        arr.extendTo(newLength, initialValue);
      }).assertThrowError('', 'size = -2147483647');
    });
  });
}