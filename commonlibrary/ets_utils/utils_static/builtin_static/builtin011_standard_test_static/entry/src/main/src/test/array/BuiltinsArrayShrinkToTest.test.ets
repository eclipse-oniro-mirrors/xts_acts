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

export default function BuiltinsArrayShrinkToTest() : void{
  describe("BuiltinsArrayShrinkToTest", () => {
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
     * @tc.name    builtinsArrayShrinkToTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_SHRINK_TO_TEST_0100
     * @tc.desc    Verify shrinkTo with normal positive length less than current length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayShrinkToTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const newLength = 3;
      
      arr.shrinkTo(newLength);
      
      expect(arr.length).assertEqual(newLength);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayShrinkToTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_SHRINK_TO_TEST_0200
     * @tc.desc    Verify shrinkTo with length equal to current length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayShrinkToTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const newLength = 3;
      
      arr.shrinkTo(newLength);
      
      expect(arr.length).assertEqual(newLength);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayShrinkToTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_SHRINK_TO_TEST_0300
     * @tc.desc    Verify shrinkTo with length greater than current length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayShrinkToTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const newLength = 5;
      
      arr.shrinkTo(newLength);
      
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayShrinkToTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_SHRINK_TO_TEST_0400
     * @tc.desc    Verify shrinkTo with negative length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayShrinkToTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(2, NaN);
      const newLength = -5;
      
      expect(() => {
        arr.shrinkTo(newLength);
      }).assertThrowError('', 'Parameter error.Invalid array length.');
    });

    /**
     * @tc.name    builtinsArrayShrinkToTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_SHRINK_TO_TEST_0500
     * @tc.desc    Verify shrinkTo with zero length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayShrinkToTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const newLength = 0;
      
      arr.shrinkTo(newLength);
      
      expect(arr.length).assertEqual(newLength);
    });

    /**
     * @tc.name    builtinsArrayShrinkToTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_SHRINK_TO_TEST_0600
     * @tc.desc    Verify shrinkTo with minimum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayShrinkToTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(2, NaN);
      const newLength = -2147483648;
      
      expect(() => {
        arr.shrinkTo(newLength);
      }).assertThrowError('', 'Parameter error.Invalid array length.');
    });

    /**
     * @tc.name    builtinsArrayShrinkToTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_SHRINK_TO_TEST_0700
     * @tc.desc    Verify shrinkTo with maximum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayShrinkToTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const newLength = 2147483647;
      
      arr.shrinkTo(newLength);
      
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });
  })
}