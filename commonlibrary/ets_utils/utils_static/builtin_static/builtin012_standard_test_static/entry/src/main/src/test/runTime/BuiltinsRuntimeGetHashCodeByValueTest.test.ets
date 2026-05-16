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

interface GeneratedObjectLiteralInterface_1 {
  name: string;
  age: number;
}

interface GeneratedObjectLiteralInterface_2 {
  name: string;
  age: number;
}

export default function BuiltinsRuntimeGetHashCodeByValueTest(): void {
  describe("BuiltinsRuntimeGetHashCodeByValueTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest0100
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_0100
     * @tc.desc    Verify getHashCodeByValue returns same value for equal numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const num1 = 42;
      const num2 = 42;

      const hash1 = Runtime.getHashCodeByValue(num1);
      const hash2 = Runtime.getHashCodeByValue(num2);

      expect(hash1).assertEqual(hash2);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest0200
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_0200
     * @tc.desc    Verify getHashCodeByValue returns same value for equal strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const str1 = "hello";
      const str2 = "hello";

      const hash1 = Runtime.getHashCodeByValue(str1);
      const hash2 = Runtime.getHashCodeByValue(str2);

      expect(hash1).assertEqual(hash2);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest0300
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_0300
     * @tc.desc    Verify getHashCodeByValue returns same value for equal booleans
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bool1 = true;
      const bool2 = true;

      const hash1 = Runtime.getHashCodeByValue(bool1);
      const hash2 = Runtime.getHashCodeByValue(bool2);

      expect(hash1).assertEqual(hash2);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest0400
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_0400
     * @tc.desc    Verify getHashCodeByValue returns different values for different numbers
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hash1 = Runtime.getHashCodeByValue(42);
      const hash2 = Runtime.getHashCodeByValue(100);

      expect(hash1 !== hash2).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest0500
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_0500
     * @tc.desc    Verify getHashCodeByValue returns different values for different strings
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const hash1 = Runtime.getHashCodeByValue("hello");
      const hash2 = Runtime.getHashCodeByValue("world");

      expect(hash1 !== hash2).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest0600
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_0600
     * @tc.desc    Verify getHashCodeByValue for objects with same content returns different values (same as getHashCode)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj1: GeneratedObjectLiteralInterface_1 = { name: 'test', age: 10 };
      const obj2: GeneratedObjectLiteralInterface_1 = { name: 'test', age: 10 };

      const hash1 = Runtime.getHashCodeByValue(obj1);
      const hash2 = Runtime.getHashCodeByValue(obj2);

      expect(hash1 !== hash2).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest0700
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_0700
     * @tc.desc    Verify getHashCodeByValue returns same value for same object reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj: GeneratedObjectLiteralInterface_1 = { name: 'test', age: 10 };
      const hash1 = Runtime.getHashCodeByValue(obj);
      const hash2 = Runtime.getHashCodeByValue(obj);
      const hash3 = Runtime.getHashCodeByValue(obj);

      expect(hash1).assertEqual(hash2);
      expect(hash2).assertEqual(hash3);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest0800
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_0800
     * @tc.desc    Verify getHashCodeByValue remains unchanged after object content modification (for objects)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: GeneratedObjectLiteralInterface_1 = { name: 'test', age: 10 };
      const hashBefore = Runtime.getHashCodeByValue(obj);

      obj.name = 'modified';
      obj.age = 20;

      const hashAfter = Runtime.getHashCodeByValue(obj);

      expect(hashBefore).assertEqual(hashAfter);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest0900
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_0900
     * @tc.desc    Verify getHashCodeByValue with null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let nullValue: null = null;
      const result = Runtime.getHashCodeByValue(nullValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1000
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1000
     * @tc.desc    Verify getHashCodeByValue returns same result as getHashCode for non-special types
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: GeneratedObjectLiteralInterface_2 = { name: 'test', age: 10 };
      const hashByValue = Runtime.getHashCodeByValue(obj);
      const hashCode = Runtime.getHashCode(obj);
      expect(hashByValue).assertEqual(hashCode);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1100
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1100
     * @tc.desc    Verify getHashCodeByValue with array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = [1, 2, 3];
      const result = Runtime.getHashCodeByValue(arr);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1200
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1200
     * @tc.desc    Verify getHashCodeByValue with Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValue = Number.MAX_VALUE;
      const result = Runtime.getHashCodeByValue(maxValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1300
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1300
     * @tc.desc    Verify getHashCodeByValue with Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValue = Number.MIN_VALUE;
      const result = Runtime.getHashCodeByValue(minValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1400
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1400
     * @tc.desc    Verify getHashCodeByValue with Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const infinityValue = Infinity;
      const result = Runtime.getHashCodeByValue(infinityValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1500
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1500
     * @tc.desc    Verify getHashCodeByValue with NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nanValue = NaN;
      const result = Runtime.getHashCodeByValue(nanValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1600
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1600
     * @tc.desc    Verify getHashCodeByValue with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const emptyStr = "";
      const result = Runtime.getHashCodeByValue(emptyStr);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1700
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1700
     * @tc.desc    Verify getHashCodeByValue with zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zeroValue = 0;
      const result = Runtime.getHashCodeByValue(zeroValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1800
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1800
     * @tc.desc    Verify getHashCodeByValue with negative zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const negZero = -0;
      const result = Runtime.getHashCodeByValue(negZero);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest1900
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_1900
     * @tc.desc    Verify getHashCodeByValue with Number.MAX_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const maxSafeInt = Number.MAX_SAFE_INTEGER;
      const result = Runtime.getHashCodeByValue(maxSafeInt);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest2000
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_2000
     * @tc.desc    Verify getHashCodeByValue with Number.MIN_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const minSafeInt = Number.MIN_SAFE_INTEGER;
      const result = Runtime.getHashCodeByValue(minSafeInt);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeByValueTest2100
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_BY_VALUE_TEST_2100
     * @tc.desc    Verify getHashCodeByValue with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeGetHashCodeByValueTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr: number[] = [];
      const result = Runtime.getHashCodeByValue(emptyArr);
      const resultType = typeof result;
      expect(resultType).assertEqual('long');
    });

  })
}
