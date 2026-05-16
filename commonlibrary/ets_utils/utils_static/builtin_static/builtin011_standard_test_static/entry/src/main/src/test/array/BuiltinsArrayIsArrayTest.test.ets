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

export default function BuiltinsArrayIsArrayTest(): void {
  describe("BuiltinsArrayIsArrayTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    builtinsArrayIsArrayTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0100
     * @tc.desc    Verify isArray with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it("builtinsArrayIsArrayTest0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const result = Array.isArray(arr);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayIsArrayTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0200
     * @tc.desc    Verify isArray with non-empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it("builtinsArrayIsArrayTest0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const result = Array.isArray(arr);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayIsArrayTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0300
     * @tc.desc    Verify isArray with string array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it("builtinsArrayIsArrayTest0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = Array.create<string>(3, '');
      arr[0] = "apple";
      arr[1] = "banana";
      arr[2] = "cherry";
      const result = Array.isArray(arr);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayIsArrayTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0400
     * @tc.desc    Verify isArray with object array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it("builtinsArrayIsArrayTest0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;
      const result = Array.isArray(arr);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayIsArrayTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0500
     * @tc.desc    Verify isArray with number
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it("builtinsArrayIsArrayTest0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const num = 42;
      const result = Array.isArray(num);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name    builtinsArrayIsArrayTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0600
     * @tc.desc    Verify isArray with string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it("builtinsArrayIsArrayTest0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = "hello";
      const result = Array.isArray(str);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name    builtinsArrayIsArrayTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0800
     * @tc.desc    Verify isArray with null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it("builtinsArrayIsArrayTest0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nullValue = null;
      const result = Array.isArray(nullValue);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name    builtinsArrayIsArrayTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0900
     * @tc.desc    Verify isArray with undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it("builtinsArrayIsArrayTest0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const undefinedValue = undefined;
      const result = Array.isArray(undefinedValue);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name    builtinsArrayIsArrayTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1000
     * @tc.desc    Verify isArray with boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it("builtinsArrayIsArrayTest1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const boolValue = true;
      const result = Array.isArray(boolValue);
      expect(result).assertEqual(false);
    });
  });
}