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

export default function BuiltinsArrayUnshiftTest() : void{
  describe("BuiltinsArrayUnshiftTest", () => {
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
     * @tc.name    builtinsArrayUnshiftTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0100
     * @tc.desc    Verify unshift with no parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = arr.unshift();

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayUnshiftTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0200
     * @tc.desc    Verify unshift with single number parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [2, 3];
      const result = arr.unshift(1);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayUnshiftTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0300
     * @tc.desc    Verify unshift with multiple number parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [4, 5];
      const result = arr.unshift(1, 2, 3);

      expect(result).assertEqual(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name    builtinsArrayUnshiftTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0400
     * @tc.desc    Verify unshift with single string parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['world', 'test'];
      const result = arr.unshift('hello');

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
      expect(arr[2]).assertEqual('test');
    });

    /**
     * @tc.name    builtinsArrayUnshiftTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0500
     * @tc.desc    Verify unshift with multiple string parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['test'];
      const result = arr.unshift('hello', 'world');

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
      expect(arr[2]).assertEqual('test');
    });

    /**
     * @tc.name    builtinsArrayUnshiftTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0600
     * @tc.desc    Verify unshift with boolean parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<boolean> = [true];
      const result = arr.unshift(false, true);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(false);
      expect(arr[1]).assertEqual(true);
      expect(arr[2]).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayUnshiftTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0700
     * @tc.desc    Verify unshift with null and undefined parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number | null | undefined> = [1];
      const result = arr.unshift(null, undefined);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayUnshiftTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0800
     * @tc.desc    Verify unshift with object parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const arr: Array<TestObj> = [{ name: 'obj3', value: 3 }];
      const result = arr.unshift({ name: 'obj1', value: 1 }, { name: 'obj2', value: 2 });

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0].name).assertEqual('obj1');
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].name).assertEqual('obj2');
      expect(arr[1].value).assertEqual(2);
      expect(arr[2].name).assertEqual('obj3');
      expect(arr[2].value).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayUnshiftTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_0900
     * @tc.desc    Verify unshift with array parameters
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<Array<number>> = [[3, 4]];
      const result = arr.unshift([1, 2]);

      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[0][1]).assertEqual(2);
      expect(arr[1][0]).assertEqual(3);
      expect(arr[1][1]).assertEqual(4);
    });

    /**
     * @tc.name    builtinsArrayUnshiftTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_UNSHIFT_TEST_1000
     * @tc.desc    Verify unshift on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayUnshiftTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [];
      const result = arr.unshift(1, 2, 3);

      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

  })
}
