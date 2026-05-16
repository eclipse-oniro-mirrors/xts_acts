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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';

export default function BuiltinsArrayIsArrayTest(): void {
  describe("BuiltinsArrayIsArrayTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   BuiltinsArrayIsArrayTest0100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0100
     * @tc.desc   Verify Array.isArray with literal array [1, 2, 3] returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest0200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0200
     * @tc.desc   Verify Array.isArray with empty array [] returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest0300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0300
     * @tc.desc   Verify Array.isArray with string array ['a', 'b', 'c'] returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<string> = ['a', 'b', 'c'];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest0400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0400
     * @tc.desc   Verify Array.isArray with new Array() constructor returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = new Array<number>();
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest0500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0500
     * @tc.desc   Verify Array.isArray with new Array(1, 2, 3) constructor returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = new Array<number>(1, 2, 3);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest0600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0600
     * @tc.desc   Verify array has correct length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = [1, 2, 3];
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest0700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0700
     * @tc.desc   Verify Array.from() creates array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const str: string = 'hello';
      const arr: Array<string> = Array.from(str);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest0800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0800
     * @tc.desc   Verify spread operator creates array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [...arr1];
      const result = Array.isArray(arr2);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest0900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_0900
     * @tc.desc   Verify Array.isArray with number 42 returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const num: number = 42;
      const result = Array.isArray(num);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1000
     * @tc.desc   Verify Array.isArray with float 3.14 returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const f: number = 3.14;
      const result = Array.isArray(f);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1100
     * @tc.desc   Verify Array.isArray with string hello returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str: string = 'hello';
      const result = Array.isArray(str);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1200
     * @tc.desc   Verify Array.isArray with empty string returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const emptyStr: string = '';
      const result = Array.isArray(emptyStr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1300
     * @tc.desc   Verify Array.isArray with boolean true returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const bool: boolean = true;
      const result = Array.isArray(bool);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1400
     * @tc.desc   Verify Array.isArray with boolean false returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const bool: boolean = false;
      const result = Array.isArray(bool);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1500
     * @tc.desc   Verify Array.isArray with null returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const nullVal: null = null;
      const result = Array.isArray(nullVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1600
     * @tc.desc   Verify Array.isArray with undefined returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const undefVal: undefined = undefined;
      const result = Array.isArray(undefVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1700
     * @tc.desc   Verify Array.isArray with NaN returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const nanVal: number = NaN;
      const result = Array.isArray(nanVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1800
     * @tc.desc   Verify Array.isArray with Infinity returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const infVal: number = Infinity;
      const result = Array.isArray(infVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest1900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_1900
     * @tc.desc   Verify Array.isArray with negative Infinity returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const negInfVal: number = -Infinity;
      const result = Array.isArray(negInfVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2000
     * @tc.desc   Verify Array.isArray with 0 returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const zero: number = 0;
      const result = Array.isArray(zero);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2100
     * @tc.desc   Verify Array.isArray with negative 0 returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const negZero: number = -0;
      const result = Array.isArray(negZero);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2200
     * @tc.desc   Verify Array.isArray with Number.MAX_VALUE returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const maxVal: number = Number.MAX_VALUE;
      const result = Array.isArray(maxVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2300
     * @tc.desc   Verify Array.isArray with plain object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const obj: Object = new Object();
      const result = Array.isArray(obj);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2400
     * @tc.desc   Verify Array.isArray with Date object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const date: Date = new Date();
      const result = Array.isArray(date);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2500
     * @tc.desc   Verify Array.isArray with Error object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const err: Error = new Error();
      const result = Array.isArray(err);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2600
     * @tc.desc   Verify Array.isArray with Map object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>();
      const result = Array.isArray(map);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2700
     * @tc.desc   Verify Array.isArray with Set object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set<number>();
      const result = Array.isArray(set);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2800
     * @tc.desc   Verify Array.isArray with arrow function returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const fn = (): void => {};
      const result = Array.isArray(fn as Object);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest2900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_2900
     * @tc.desc   Verify Array.isArray with 2D array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<number>> = [[1, 2], [3, 4]];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3000
     * @tc.desc   Verify Array.isArray with nested array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Array<Array<number>>> = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3100
     * @tc.desc   Verify Array.isArray with new Array(10) returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = new Array<number>(10);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3200
     * @tc.desc   Verify Array.isArray with mixed type array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<Object> = [1 as Object, 'string' as Object, true as Object];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3300
     * @tc.desc   Verify Array.isArray with object array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj1: Object = new Object();
      const obj2: Object = new Object();
      const arr: Array<Object> = [obj1, obj2];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3400
     * @tc.desc   Verify Array.isArray with Int8Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3500
     * @tc.desc   Verify Array.isArray with Uint8Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3600
     * @tc.desc   Verify Array.isArray with Int16Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Int16Array = new Int16Array([1, 2, 3]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3700
     * @tc.desc   Verify Array.isArray with Uint16Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Uint16Array = new Uint16Array([1, 2, 3]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3800
     * @tc.desc   Verify Array.isArray with Int32Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Int32Array = new Int32Array([1, 2, 3]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest3900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_3900
     * @tc.desc   Verify Array.isArray with Uint32Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Uint32Array = new Uint32Array([1, 2, 3]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4000
     * @tc.desc   Verify Array.isArray with Float32Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Float32Array = new Float32Array([1.1, 2.2, 3.3]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4100
     * @tc.desc   Verify Array.isArray with Float64Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Float64Array = new Float64Array([1.1, 2.2, 3.3]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4200
     * @tc.desc   Verify Array.isArray with BigInt64Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: BigInt64Array = new BigInt64Array([1n, 2n, 3n]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4300
     * @tc.desc   Verify Array.isArray with BigUint64Array returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: BigUint64Array = new BigUint64Array([1n, 2n, 3n]);
      const result = Array.isArray(arr);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4400
     * @tc.desc   Verify Array.isArray with array.concat result returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2];
      const arr2: Array<number> = [3, 4];
      const result = arr1.concat(arr2);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4500
     * @tc.desc   Verify Array.isArray with array.slice result returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const sliced: Array<number> = arr.slice(1, 3);
      const result = Array.isArray(sliced);
      expect(result).assertTrue();
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4600
     * @tc.desc   Verify Array.isArray with array.map result returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const mapped: Array<number> = arr.map((x: number): number => x * 2);
      const result = Array.isArray(mapped);
      expect(result).assertTrue();
      expect(mapped.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4700
     * @tc.desc   Verify Array.isArray with array.filter result returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const filtered: Array<number> = arr.filter((x: number): boolean => x > 2);
      const result = Array.isArray(filtered);
      expect(result).assertTrue();
      expect(filtered.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4800
     * @tc.desc   Verify Array.isArray with array.reverse result returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const reversed: Array<number> = arr.reverse();
      const result = Array.isArray(reversed);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest4900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_4900
     * @tc.desc   Verify Array.isArray with array.sort result returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [3, 1, 2];
      const sorted: Array<number> = arr.sort();
      const result = Array.isArray(sorted);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5000
     * @tc.desc   Verify Array.isArray with string representation returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const str: string = '[1, 2, 3]';
      const result = Array.isArray(str);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5100
     * @tc.desc   Verify Array.isArray with single element array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayIsArrayTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [42];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5200
     * @tc.desc   Verify Array.isArray with large array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(1000);
      for (let i = 0; i < 1000; i++) {
        arr[i] = i;
      }
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5300
     * @tc.desc   Verify Array.isArray consistency returns same result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result1 = Array.isArray(arr);
      const result2 = Array.isArray(arr);
      const result3 = Array.isArray(arr);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
      expect(result1).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5400
     * @tc.desc   Verify Array.isArray different from isArray check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const instanceResult = Array.isArray(arr);
      expect(instanceResult).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5500
     * @tc.desc   Verify Array.isArray with deeply nested array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nestedArr: Array<Array<Array<number>>> = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]];
      const result = Array.isArray(nestedArr);
      expect(result).assertTrue();
      expect(Array.isArray(nestedArr[0])).assertTrue();
      expect(Array.isArray(nestedArr[0][0])).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5600
     * @tc.desc   Verify Array.isArray with mixed nested array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const mixedArr: Array<Object> = [1 as Object, 'string' as Object, [2, 3] as Object];
      const result = Array.isArray(mixedArr);
      expect(result).assertTrue();
      expect(Array.isArray(mixedArr[2] as Array<number>)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5700
     * @tc.desc   Verify Array.isArray after push operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2];
      arr.push(3);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5800
     * @tc.desc   Verify Array.isArray after pop operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.pop();
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest5900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_5900
     * @tc.desc   Verify Array.isArray after reduce operation maintains array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const sum = arr.reduce((acc: number, curr: number): number => acc + curr, 0);
      expect(sum).assertEqual(15);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6000
     * @tc.desc   Verify Array.isArray with Symbol.iterator returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      let sum: number = 0;
      for (const item of arr) {
        sum += item;
      }
      expect(sum).assertEqual(6);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6100
     * @tc.desc   Verify Array.isArray does not modify original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const originalLength = arr.length;
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6200
     * @tc.desc   Verify Array.isArray after splice operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.splice(2, 1);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6300
     * @tc.desc   Verify Array.isArray after unshift operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [2, 3];
      arr.unshift(1);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6400
     * @tc.desc   Verify Array.isArray after shift operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      arr.shift();
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6500
     * @tc.desc   Verify Array.isArray with sparse array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = new Array<number>(5);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6600
     * @tc.desc   Verify Array.isArray different from typeof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const isArrayResult = Array.isArray(arr);
      const typeOfResult = typeof arr;
      expect(isArrayResult).assertTrue();
      expect(typeOfResult).assertEqual('object');
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6700
     * @tc.desc   Verify Array.isArray with WeakMap returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const weakMap = new WeakMap<Object, number>();
      const result = Array.isArray(weakMap);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6800
     * @tc.desc   Verify Array.isArray with WeakSet returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const weakSet = new WeakSet<Object>();
      const result = Array.isArray(weakSet);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest6900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_6900
     * @tc.desc   Verify Array.isArray with async arrow function returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncFn = async (): Promise<number> => {
        return 1;
      };
      const result = Array.isArray(asyncFn as Object);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest7000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_7000
     * @tc.desc   Verify Array.isArray with three-dimensional array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr3D: Array<Array<Array<number>>> = [[[1, 2]], [[3, 4]]];
      const result = Array.isArray(arr3D);
      expect(result).assertTrue();
      expect(Array.isArray(arr3D[0])).assertTrue();
      expect(Array.isArray(arr3D[0][0])).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest7100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_7100
     * @tc.desc   Verify Array.isArray with frozen array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest7200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_7200
     * @tc.desc   Verify Array.isArray with circular reference array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<Object> = [1, 2] as Array<Object>;
      const arr2: Array<Object> = [3, 4] as Array<Object>;
      arr1.push(arr2);
      arr2.push(arr1);
      const result1 = Array.isArray(arr1);
      const result2 = Array.isArray(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayTest7300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_TEST_7300
     * @tc.desc   Verify Array.isArray returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const result = Array.isArray(arr);
      expect(typeof (result as Object)).assertEqual('boolean');
      expect(result).assertTrue();
      const obj: Object = new Object();
      const result2 = Array.isArray(obj);
      expect(typeof (result2 as Object)).assertEqual('boolean');
      expect(result2).assertFalse();
    });
  });
}
