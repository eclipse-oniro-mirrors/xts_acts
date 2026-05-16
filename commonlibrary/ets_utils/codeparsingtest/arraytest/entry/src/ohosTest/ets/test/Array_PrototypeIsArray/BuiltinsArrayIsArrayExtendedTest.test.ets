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
import * as ArrayIsArrayMissing from './ArrayIsArrayMissingTest';

class MyArray extends Array<number> {
  constructor(n1: number, n2: number, n3: number) {
    super(n1, n2, n3);
  }
}

export default function BuiltinsArrayIsArrayExtendedTest(): void {
  describe("BuiltinsArrayIsArrayExtendedTest", () => {
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
     * @tc.name   BuiltinsArrayIsArrayExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_0100
     * @tc.desc   Verify Array.isArray with BigInt returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntVal: Object = (123n) as Object;
      const result = Array.isArray(bigIntVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_0200
     * @tc.desc   Verify Array.isArray with BigInt() constructor returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntVal: Object = BigInt(456) as Object;
      const result = Array.isArray(bigIntVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_0300
     * @tc.desc   Verify Array.isArray with BigInt zero returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const bigIntVal: Object = (0n) as Object;
      const result = Array.isArray(bigIntVal);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_0400
     * @tc.desc   Verify Array.isArray with RegExp literal returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regExp: RegExp = new RegExp('pattern');
      const result = Array.isArray(regExp);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_0500
     * @tc.desc   Verify Array.isArray with RegExp constructor returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regExp: RegExp = new RegExp('test', 'g');
      const result = Array.isArray(regExp);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_0600
     * @tc.desc   Verify Array.isArray with arguments-like object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const argsObj: Object = new Object();
      const result = Array.isArray(argsObj);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_0700
     * @tc.desc   Verify Array.isArray with sparse array returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sparseArr: Array<number> = new Array<number>(5);
      const result = Array.isArray(sparseArr);
      expect(result).assertTrue();
      expect(sparseArr.length).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_0800
     * @tc.desc   Verify Array.isArray after setting element to undefined returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, 2, 3, 4, 5];
      arr[2] = undefined;
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_0900
     * @tc.desc   Verify Array.isArray with Array subclass instance returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const myArr: MyArray = new MyArray(1, 2, 3);
      const result = Array.isArray(myArr);
      expect(result).assertTrue();
      expect(myArr instanceof Array).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1000
     * @tc.desc   Verify Array.isArray different from instanceof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const isArrayResult = Array.isArray(arr);
      const isInstanceOf = arr instanceof Array;
      expect(isArrayResult).assertTrue();
      expect(isInstanceOf).assertTrue();

      const obj: Object = new Object();
      const isArrayResult2 = Array.isArray(obj);
      const isInstanceOf2 = obj instanceof Array;
      expect(isArrayResult2).assertFalse();
      expect(isInstanceOf2).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1100
     * @tc.desc   Verify Array.isArray different from constructor check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const isArrayResult = Array.isArray(arr);
      expect(isArrayResult).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1200
     * @tc.desc   Verify Array.isArray different from toString check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const isArrayResult = Array.isArray(arr);
      expect(isArrayResult).assertTrue();

      const obj: Object = new Object();
      const isArrayResult2 = Array.isArray(obj);
      expect(isArrayResult2).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1300
     * @tc.desc   Verify Array.isArray returns true for arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3];
      const isArrayResult = Array.isArray(arr);
      expect(isArrayResult).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1400
     * @tc.desc   Verify Array.isArray with plain object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nullObj: Object = new Object();
      const result = Array.isArray(nullObj);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1500
     * @tc.desc   Verify Array.isArray with Object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: Object = new Object();
      const result = Array.isArray(obj);
      expect(result).assertFalse();
      expect(obj instanceof Array).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1600
     * @tc.desc   Verify Array.isArray with Boolean object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const boolObj: Object = new Boolean(true);
      const result = Array.isArray(boolObj);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1700
     * @tc.desc   Verify Array.isArray with Number object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const numObj: Object = new Number(42);
      const result = Array.isArray(numObj);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1800
     * @tc.desc   Verify Array.isArray with String object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const strObj: Object = new String('hello');
      const result = Array.isArray(strObj);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_1900
     * @tc.desc   Verify Array.isArray with Set iterator returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set<number>();
      const iterator = set.values();
      const result = Array.isArray(iterator as Object);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2000
     * @tc.desc   Verify Array.isArray with Map iterator returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>();
      const iterator = map.keys();
      const result = Array.isArray(iterator as Object);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2100
     * @tc.desc   Verify Array.isArray with Array.of returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.of(1);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2200
     * @tc.desc   Verify Array.isArray with Array.of multiple elements returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = Array.of(1, 2, 3);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2300
     * @tc.desc   Verify Array.isArray with custom array-like object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arrayLike: Object = new Object();
      const result = Array.isArray(arrayLike);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2400
     * @tc.desc   Verify Array.isArray with no parameter returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result = Array.isArray(undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2500
     * @tc.desc   Verify Array.isArray returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const result1 = Array.isArray([1, 2, 3]);
      const result2 = Array.isArray('string');
      expect(typeof (result1 as Object)).assertEqual('boolean');
      expect(typeof (result2 as Object)).assertEqual('boolean');
      expect(result1).assertTrue();
      expect(result2).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2600
     * @tc.desc   Verify Array.isArray with Array.from(Set) returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set<number>();
      set.add(1);
      set.add(2);
      set.add(3);
      const arr = Array.from(set);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2700
     * @tc.desc   Verify Array.isArray with Array.from(Map) returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>();
      map.set(1, 'a');
      map.set(2, 'b');
      map.set(3, 'c');
      const arr = Array.from(map.values());
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2800
     * @tc.desc   Verify Array.isArray after fill operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.fill(0, 1, 3);
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_2900
     * @tc.desc   Verify Array.isArray with Promise.resolve returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const promise: Object = Promise.resolve([1, 2, 3]) as Object;
      const result = Array.isArray(promise);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3000
     * @tc.desc   Verify Array.isArray with array after destructuring returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [10, 20, 30];
      const a = arr[0];
      const b = arr[1];
      const c = arr[2];
      const result = Array.isArray(arr);
      expect(result).assertTrue();
      expect(a).assertEqual(10);
      expect(b).assertEqual(20);
      expect(c).assertEqual(30);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest3100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3100
     * @tc.desc   Verify Array.isArray with Number.MIN_SAFE_INTEGER returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const minSafe: number = Number.MIN_SAFE_INTEGER;
      const result = Array.isArray(minSafe);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest3200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3200
     * @tc.desc   Verify Array.isArray with Number.EPSILON returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const eps: number = Number.EPSILON;
      const result = Array.isArray(eps);
      expect(result).assertFalse();
    });

    /**
     * @tc.name  BuiltinsArrayIsArrayExtendedTest3300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3300
     * @tc.desc   Verify Array.isArray with Number.MAX_SAFE_INTEGER returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const maxSafe: number = Number.MAX_SAFE_INTEGER;
      const result = Array.isArray(maxSafe);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest3400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3400
     * @tc.desc   Verify Array.isArray with TypeError object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const err: Error = new TypeError('type error');
      const result = Array.isArray(err);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest3500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3500
     * @tc.desc   Verify Array.isArray with RangeError object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const err: Error = new RangeError('range error');
      const result = Array.isArray(err);
      expect(result).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest3600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3600
     * @tc.desc   Verify Array.isArray with array-like object created from Array.prototype returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayProtoTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest3700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3700
     * @tc.desc   Verify Array.isArray after delete operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayDeleteTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest3800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3800
     * @tc.desc   Verify Array.isArray with mixed content types returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayMixedTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest3900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_3900
     * @tc.desc   Verify Array.isArray with Symbol value returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArraySymbolTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4000
     * @tc.desc   Verify Array.isArray with Symbol.iterator value returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArraySymbolIterTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4100
     * @tc.desc   Verify Array.isArray with spread operator result returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArraySpreadTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4200
     * @tc.desc   Verify Array.isArray with generator function result returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayGeneratorTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4300
     * @tc.desc   Verify Array.isArray with string iterator returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayStringIterTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4400
     * @tc.desc   Verify Array.isArray with async function returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await ArrayIsArrayMissing.ArrayIsArrayAsyncTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4500
     * @tc.desc   Verify Array.isArray with constructor functions returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayConstructorTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4600
     * @tc.desc   Verify Array.isArray with Date object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayDateTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4700
     * @tc.desc   Verify Array.isArray with Map entries iterator returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayMapEntriesTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4800
     * @tc.desc   Verify Array.isArray with array-like object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayArrayLikeTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest4900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_4900
     * @tc.desc   Verify Array.isArray with empty array from Array.of returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayEmptyOfTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5000
     * @tc.desc   Verify Array.isArray after find operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayFindTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5100
     * @tc.desc   Verify Array.isArray after flat operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayFlatTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5200
     * @tc.desc   Verify Array.isArray after flatMap operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayFlatMapTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5300
     * @tc.desc   Verify Array.isArray after join operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayJoinTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5400
     * @tc.desc   Verify Array.isArray after every operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayEveryTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5500
     * @tc.desc   Verify Array.isArray after some operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArraySomeTest2200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5600
     * @tc.desc   Verify Array.isArray after forEach operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayForEachTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5700
     * @tc.desc   Verify Array.isArray after indexOf operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayIndexOfTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5800
     * @tc.desc   Verify Array.isArray after includes operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayIncludesTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest5900
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_5900
     * @tc.desc   Verify Array.isArray after reduceRight operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayReduceRightTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest6000
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_6000
     * @tc.desc   Verify Array.isArray after toLocaleString operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayLocaleStringTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest6100
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_6100
     * @tc.desc   Verify Array.isArray after toString operation returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayToStringTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest6200
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_6200
     * @tc.desc   Verify Array.isArray with array values iterator returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayValuesTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest6300
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_6300
     * @tc.desc   Verify Array.isArray with array keys iterator returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayKeysTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest6400
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_6400
     * @tc.desc   Verify Array.isArray with array entries iterator returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayEntriesTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest6500
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_6500
     * @tc.desc   Verify Array.isArray with array containing undefined element returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayUndefinedTest3200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest6600
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_6600
     * @tc.desc   Verify Array.isArray with array containing null element returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayNullTest3300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest6700
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_6700
     * @tc.desc   Verify Array.isArray with array containing NaN element returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayNaNTest3400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayIsArrayExtendedTest6800
     * @tc.number SUB_BUILTINS_ARRAY_IS_ARRAY_EXTENDED_TEST_6800
     * @tc.desc   Verify Array.isArray with generator function itself returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayIsArrayExtendedTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayIsArrayMissing.ArrayIsArrayGenFnTest3500();
      expect(result).assertEqual(true);
    });
  });
}
