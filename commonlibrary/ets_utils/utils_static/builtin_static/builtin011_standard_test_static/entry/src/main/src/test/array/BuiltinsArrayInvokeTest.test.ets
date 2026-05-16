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

export default function BuiltinsArrayInvokeTest() : void{
  describe("BuiltinsArrayInvokeTest", () => {
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
     * @tc.name    builtinsArrayInvokeTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_0100
     * @tc.desc    Verify $_invoke with no parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayInvokeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);

      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayInvokeTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_0200
     * @tc.desc    Verify $_invoke with single number parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayInvokeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array<number>(1);
      
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayInvokeTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_0300
     * @tc.desc    Verify $_invoke with multiple number parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayInvokeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array<number>(1, 2, 3, 4, 5);
      
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayInvokeTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_0400
     * @tc.desc    Verify $_invoke with single string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayInvokeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array<string>('test');
      
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('test');
    });

    /**
     * @tc.name    builtinsArrayInvokeTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_0500
     * @tc.desc    Verify $_invoke with multiple string parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayInvokeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array<string>('a', 'b', 'c');
      
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
      expect(arr[2]).assertEqual('c');
    });

    /**
     * @tc.name    builtinsArrayInvokeTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_0600
     * @tc.desc    Verify $_invoke with object parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayInvokeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: Record<string, string> = { "name": 'test1' };
      const obj2: Record<string, string> = { "name": 'test2' };
      const arr = Array<Record<string, string>>(obj1, obj2);
      
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertDeepEquals(obj1);
      expect(arr[1]).assertDeepEquals(obj2);
    });

    /**
     * @tc.name    builtinsArrayInvokeTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_0700
     * @tc.desc    Verify $_invoke with mixed type parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayInvokeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array<number | string | boolean | null | undefined>(1, 'test', true, null, undefined);
      
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('test');
      expect(arr[2]).assertEqual(true);
      expect(arr[3]).assertNull();
      expect(arr[4]).assertUndefined();
    });

    /**
     * @tc.name    builtinsArrayInvokeTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_0800
     * @tc.desc    Verify $_invoke with single negative integer parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayInvokeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array<number>(-5);
      
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-5);
    });

    /**
     * @tc.name    builtinsArrayInvokeTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_0900
     * @tc.desc    Verify $_invoke with single zero parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayInvokeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array<number>(0);
      
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayInvokeTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_1000
     * @tc.desc    Verify $_invoke with single positive integer parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayInvokeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array<number>(10);
      
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.name    builtinsArrayInvokeTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_1100
     * @tc.desc    Verify $_invoke with minimum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayInvokeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array<number>(-2147483648);
      
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-2147483648);
    });

    /**
     * @tc.name    builtinsArrayInvokeTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_INVOKE_TEST_1200
     * @tc.desc    Verify $_invoke with maximum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayInvokeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array<number>(2147483647);
      
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(2147483647);
    });
  })
}