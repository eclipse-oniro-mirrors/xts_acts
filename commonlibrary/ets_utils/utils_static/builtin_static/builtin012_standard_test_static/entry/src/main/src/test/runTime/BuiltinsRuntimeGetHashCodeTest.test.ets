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

const fn1 = () =>{
  return 1;
};
const fn2 = () => {
  return 1;
};

interface GeneratedObjectLiteralInterface_1 {
  name: string;
  age: number;
}

export default function BuiltinsRuntimeGetHashCodeTest(): void {
  describe("BuiltinsRuntimeGetHashCodeTest", () => {
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
     * @tc.name    BuiltinsRuntimeGetHashCodeTest0100
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_0100
     * @tc.desc    Verify getHashCode returns same value for same object reference
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj: GeneratedObjectLiteralInterface_1 = { name: 'test', age: 10 };
      const hash1 = Runtime.getHashCode(obj);
      const hash2 = Runtime.getHashCode(obj);
      const hash3 = Runtime.getHashCode(obj);

      expect(hash1).assertEqual(hash2);
      expect(hash2).assertEqual(hash3);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest0200
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_0200
     * @tc.desc    Verify getHashCode returns different values for different object instances
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const obj1: GeneratedObjectLiteralInterface_1 = { name: 'test', age: 10 };
      const obj2: GeneratedObjectLiteralInterface_1 = { name: 'test', age: 10 };

      const hash1 = Runtime.getHashCode(obj1);
      const hash2 = Runtime.getHashCode(obj2);

      expect(hash1 !== hash2).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest0300
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_0300
     * @tc.desc    Verify getHashCode remains unchanged after object content modification
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: GeneratedObjectLiteralInterface_1 = { name: 'test', age: 10 };
      const hashBefore = Runtime.getHashCode(obj);

      obj.name = 'modified';
      obj.age = 20;

      const hashAfter = Runtime.getHashCode(obj);
      expect(hashBefore).assertEqual(hashAfter);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest0400
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_0400
     * @tc.desc    Verify getHashCode returns consistent value for "null" string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeGetHashCodeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result1 = Runtime.getHashCode("null");
      const result2 = Runtime.getHashCode("null");

      expect(result1).assertEqual(result2);

      expect(Math.floor(result1)).assertEqual(result1);

      const otherResult = Runtime.getHashCode("notNull");
      expect(result1 !== otherResult).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest0500
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_0500
     * @tc.desc    Verify getHashCode works with Number objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numObj1 = new Number(42);
      const numObj2 = new Number(42);
      const numObj3 = numObj1;

      const hash1 = Runtime.getHashCode(numObj1);
      const hash2 = Runtime.getHashCode(numObj2);
      const hash3 = Runtime.getHashCode(numObj3);

      expect(hash1 !== hash2).assertTrue();

      const primitiveHash = Runtime.getHashCode(42);
      expect(hash1 !== primitiveHash).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest0600
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_0600
     * @tc.desc    Verify getHashCode works with String objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const strObj1 = new String("hello");
      const strObj2 = new String("hello");
      const strObj3 = strObj1;

      const hash1 = Runtime.getHashCode(strObj1);
      const hash2 = Runtime.getHashCode(strObj2);
      const hash3 = Runtime.getHashCode(strObj3);

      expect(hash1).assertEqual(hash3);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest0700
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_0700
     * @tc.desc    Verify getHashCode works with Boolean objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const boolObj1 = new Boolean(true);
      const boolObj2 = new Boolean(true);
      const boolObj3 = boolObj1;

      const hash1 = Runtime.getHashCode(boolObj1);
      const hash2 = Runtime.getHashCode(boolObj2);
      const hash3 = Runtime.getHashCode(boolObj3);

      expect(hash1 !== hash2).assertTrue();

      const primitiveHash = Runtime.getHashCode(true);
      expect(hash1 !== primitiveHash).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest0800
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_0800
     * @tc.desc    Verify getHashCode works with Array objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr1 = [1, 2, 3];
      const arr2 = [1, 2, 3];
      const arr3 = arr1;

      const hash1 = Runtime.getHashCode(arr1);
      const hash2 = Runtime.getHashCode(arr2);
      const hash3 = Runtime.getHashCode(arr3);

      expect(hash1 !== hash2).assertTrue();
      expect(hash1).assertEqual(hash3);

      arr1.push(4);
      const hashAfterModify = Runtime.getHashCode(arr1);
      expect(hash1).assertEqual(hashAfterModify);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest0900
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_0900
     * @tc.desc    Verify getHashCode works with Date objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const date1 = new Date(2024, 0, 1);
      const date2 = new Date(2024, 0, 1);
      const date3 = date1;

      const hash1 = Runtime.getHashCode(date1);
      const hash2 = Runtime.getHashCode(date2);
      const hash3 = Runtime.getHashCode(date3);

      expect(hash1 !== hash2).assertTrue();
      expect(hash1).assertEqual(hash3);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1000
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1000
     * @tc.desc    Verify getHashCode works with Function objects
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const fn3 = fn1;

      const hash1 = Runtime.getHashCode(fn1);
      const hash2 = Runtime.getHashCode(fn2);
      const hash3 = Runtime.getHashCode(fn3);

      expect(hash1 !== hash2).assertTrue();
      expect(hash1).assertEqual(hash3);
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1100
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1100
     * @tc.desc    Verify getHashCode with Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const maxValue = Number.MAX_VALUE;
      const result = Runtime.getHashCode(maxValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1200
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1200
     * @tc.desc    Verify getHashCode with Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const minValue = Number.MIN_VALUE;
      const result = Runtime.getHashCode(minValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1300
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1300
     * @tc.desc    Verify getHashCode with Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const infinityValue = Infinity;
      const result = Runtime.getHashCode(infinityValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1400
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1400
     * @tc.desc    Verify getHashCode with NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const nanValue = NaN;
      const result = Runtime.getHashCode(nanValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1500
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1500
     * @tc.desc    Verify getHashCode with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const emptyStr = "";
      const result = Runtime.getHashCode(emptyStr);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1600
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1600
     * @tc.desc    Verify getHashCode with zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeGetHashCodeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const zeroValue = 0;
      const result = Runtime.getHashCode(zeroValue);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1700
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1700
     * @tc.desc    Verify getHashCode with negative zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeGetHashCodeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const negZero = -0;
      const result = Runtime.getHashCode(negZero);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1800
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1800
     * @tc.desc    Verify getHashCode with Number.MAX_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeGetHashCodeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const maxSafeInt = Number.MAX_SAFE_INTEGER;
      const result = Runtime.getHashCode(maxSafeInt);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest1900
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_1900
     * @tc.desc    Verify getHashCode with Number.MIN_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeGetHashCodeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const minSafeInt = Number.MIN_SAFE_INTEGER;
      const result = Runtime.getHashCode(minSafeInt);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

    /**
     * @tc.name    BuiltinsRuntimeGetHashCodeTest2000
     * @tc.number  SUB_BUILTINS_RUNTIME_GET_HASH_CODE_TEST_2000
     * @tc.desc    Verify getHashCode with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeGetHashCodeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const emptyArr: number[] = [];
      const result = Runtime.getHashCode(emptyArr);
      const resultType = typeof result;
      expect(resultType).assertEqual('int');
    });

  })
}
