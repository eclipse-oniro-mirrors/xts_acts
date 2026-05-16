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

export default function BuiltinsArrayCreateTest(): void {
  describe("BuiltinsArrayCreateTest", () => {
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
     * @tc.name    builtinsArrayCreateTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_CREATE_TEST_0100
     * @tc.desc    Verify create with zero length (Level0 smoke test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayCreateTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result = Array.create<number>(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayCreateTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_CREATE_TEST_0200
     * @tc.desc    Verify create with positive integer length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCreateTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrayLength = 1;
      const initialValue = 10;

      const result = Array.create<number>(arrayLength, initialValue);

      expect(result.length).assertEqual(arrayLength);
      for (let i = 0; i < arrayLength; i++) {
        expect(result[i]).assertEqual(initialValue);
      }
    });

    /**
     * @tc.name    builtinsArrayCreateTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_CREATE_TEST_0600
     * @tc.desc    Verify create with boundary value 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCreateTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.create<string>(1, 'test');
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('test');
    });

    /**
     * @tc.name    builtinsArrayCreateTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_CREATE_TEST_0700
     * @tc.desc    Verify create with boundary value near zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCreateTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.create<number>(1, 0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArrayCreateTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_CREATE_TEST_0800
     * @tc.desc    Verify create with large positive value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayCreateTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arrayLength = 100000;
      const result = Array.create<boolean>(arrayLength, true);
      expect(result.length).assertEqual(arrayLength);
    });

    /**
     * @tc.name    builtinsArrayCreateTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_CREATE_TEST_0900
     * @tc.desc    Verify create with object initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCreateTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arrayLength: int = 3;
      let obj: Record<string, string> = { "name": "test" };
      let result: Array<Record<string, string>> = Array.create<Record<string, string>>(arrayLength, obj);
      for (let i: int = 0; i < arrayLength; i++) {
        result[i] = obj;
      }
      expect(result.length).assertEqual(arrayLength);
      for (let i: int = 0; i < arrayLength; i++) {
        expect(result[i]).assertDeepEquals(obj);
      }
    });

    /**
     * @tc.name    builtinsArrayCreateTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_CREATE_TEST_1000
     * @tc.desc    Verify create with undefined initial value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayCreateTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result = Array.create<undefined>(2, undefined);
      expect(result.length).assertEqual(2);
      for (let i = 0; i < 2; i++) {
        expect(result[i]).assertEqual(undefined);
      }
    });
  });
}