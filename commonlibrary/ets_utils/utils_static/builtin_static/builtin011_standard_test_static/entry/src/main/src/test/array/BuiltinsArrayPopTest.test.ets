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

export default function BuiltinsArrayPopTest() : void{
  describe("BuiltinsArrayPopTest", () => {
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
     * @tc.name    builtinsArrayPopTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_POP_TEST_0100
     * @tc.desc    Verify pop on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayPopTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = arr.pop();
      
      expect(arr.length).assertEqual(0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    builtinsArrayPopTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_POP_TEST_0200
     * @tc.desc    Verify pop on array with single element
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayPopTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.of<number>(42);

      const result = arr.pop();

      expect(result).assertEqual(42);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayPopTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_POP_TEST_0300
     * @tc.desc    Verify pop on array with multiple elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayPopTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, NaN);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.pop();
      
      expect(arr.length).assertEqual(2);
      expect(result).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArrayPopTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_POP_TEST_0400
     * @tc.desc    Verify pop on array with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPopTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(3, '');
      arr[0] = 'hello';
      arr[1] = 'world';
      arr[2] = 'test';

      const result = arr.pop();

      expect(result).assertEqual('test');
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
    });

    /**
     * @tc.name    builtinsArrayPopTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_POP_TEST_0500
     * @tc.desc    Verify pop on array with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPopTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(2, '');
      arr[0] = 'first';
      arr[1] = 'second';
      const result = arr.pop();
      
      expect(arr.length).assertEqual(1);
      expect(result).assertEqual('second');
      expect(arr[0]).assertEqual('first');
    });

    /**
     * @tc.name    builtinsArrayPopTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_POP_TEST_0600
     * @tc.desc    Verify pop on array with object elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayPopTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: Record<string, string> = { "name": 'test1' };
      const obj2: Record<string, string> = { "name": 'test2' };
      const arr: Record<string, string>[] = [obj1, obj2];
      const result = arr.pop();
      
      expect(arr.length).assertEqual(1);
      expect(result).assertDeepEquals(obj2);
      expect(arr[0]).assertDeepEquals(obj1);
    });
  })
}