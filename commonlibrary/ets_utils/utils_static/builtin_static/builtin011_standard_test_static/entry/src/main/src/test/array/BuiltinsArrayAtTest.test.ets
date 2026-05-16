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

export default function BuiltinsArrayAtTest(): void {
  describe("BuiltinsArrayAtTest", () => {
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
     * @tc.name    builtinsArrayAtTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0100
     * @tc.desc    Verify at with positive index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayAtTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayAtTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0200
     * @tc.desc    Verify at with negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayAtTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      expect(arr.at(-1)).assertEqual(3);
      expect(arr.at(-2)).assertEqual(2);
      expect(arr.at(-3)).assertEqual(1);
    });

    /**
     * @tc.name    builtinsArrayAtTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0300
     * @tc.desc    Verify at with index out of bounds (positive)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayAtTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      expect(() => {
        arr.at(3);
      }).assertThrow('Invalid index');
    });

    /**
     * @tc.name    builtinsArrayAtTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0400
     * @tc.desc    Verify at with index out of bounds (negative)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayAtTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      expect(() => {
        arr.at(-4);
      }).assertThrow('Invalid index');
    });

    /**
     * @tc.name    builtinsArrayAtTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0500
     * @tc.desc    Verify at with minimum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayAtTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      expect(() => {
        arr.at(-2147483648);
      }).assertThrow('Invalid index');
    });

    /**
     * @tc.name    builtinsArrayAtTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0600
     * @tc.desc    Verify at with maximum int value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayAtTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;

      expect(() => {
        arr.at(2147483647);
      }).assertThrow('Invalid index');
    });

    /**
     * @tc.name    builtinsArrayAtTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0700
     * @tc.desc    Verify at with string elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayAtTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(3, '');
      arr[0] = 'a';
      arr[1] = 'b';
      arr[2] = 'c';

      expect(arr.at(0)).assertEqual('a');
      expect(arr.at(-1)).assertEqual('c');
    });

    /**
     * @tc.name    builtinsArrayAtTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_AT_TEST_0800
     * @tc.desc    Verify at with single element array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayAtTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(1, 0);
      arr[0] = 42;

      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(-1)).assertEqual(42);

      expect(() => {
        arr.at(1);
      }).assertThrow('Invalid index');

      expect(() => {
        arr.at(-2);
      }).assertThrow('Invalid index');
    });

  })
}