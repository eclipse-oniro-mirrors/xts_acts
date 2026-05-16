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
import * as Missing from './ArrayOfMissingTest';

export default function BuiltinsArrayOfTest() {
describe('BuiltinsArrayOfTest', () => {
  beforeAll(async () => {});
  beforeEach(async () => {});
  afterEach(async () => { await Utils.msSleep(10) });
  afterAll(() => {});

  /**
   * @tc.name   BuiltinsArrayOfTest0100
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0100
   * @tc.desc   Verify Array.of() with no arguments returns empty array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = Array.of();
    expect(Array.isArray(arr)).assertTrue();
    expect(arr.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest0200
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0200
   * @tc.desc   Verify Array.of() with single number argument returns array with that element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = Array.of(7);
    expect(Array.isArray(arr)).assertTrue();
    expect(arr.length).assertEqual(1);
    expect(arr[0]).assertEqual(7);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest0300
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0300
   * @tc.desc   Verify Array.of() with multiple number arguments returns array with all elements
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = Array.of(1, 2, 3, 4, 5);
    expect(Array.isArray(arr)).assertTrue();
    expect(arr.length).assertEqual(5);
    expect(arr[0]).assertEqual(1);
    expect(arr[4]).assertEqual(5);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest0400
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0400
   * @tc.desc   Verify Array.of() with mixed type arguments returns array with all types
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: boolean = Missing.ArrayOfTest3000();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfTest0500
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0500
   * @tc.desc   Verify Array.of() with integer arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = Array.of(42, -10, 0, 999);
    expect(arr.length).assertEqual(4);
    expect(arr[0]).assertEqual(42);
    expect(arr[1]).assertEqual(-10);
    expect(arr[2]).assertEqual(0);
    expect(arr[3]).assertEqual(999);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest0600
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0600
   * @tc.desc   Verify Array.of() with floating point arguments returns correct array with value and type verification
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = Array.of(3.14, -2.718, 0.0);
    expect(arr.length).assertEqual(3);
    expect(arr[0]).assertEqual(3.14);
    expect(arr[1]).assertEqual(-2.718);
    expect(arr[2]).assertEqual(0.0);
    expect(typeof arr[0]).assertEqual("number");
    expect(typeof arr[1]).assertEqual("number");
    expect(typeof arr[2]).assertEqual("number");
  });

  /**
   * @tc.name   BuiltinsArrayOfTest0700
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0700
   * @tc.desc   Verify Array.of() with string arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = Array.of("hello", "world", "test");
    expect(arr.length).assertEqual(3);
    expect(arr[0]).assertEqual("hello");
    expect(arr[0].length).assertEqual(5);
    expect(arr[1]).assertEqual("world");
    expect(arr[2]).assertEqual("test");
  });

  /**
   * @tc.name   BuiltinsArrayOfTest0800
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0800
   * @tc.desc   Verify Array.of() with empty string argument returns array with empty string
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = Array.of("");
    expect(arr.length).assertEqual(1);
    expect(arr[0]).assertEqual("");
    expect(arr[0].length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest0900
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_0900
   * @tc.desc   Verify Array.of() with boolean arguments returns correct array with value and type verification
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: boolean[] = Array.of(true, false, true);
    expect(arr.length).assertEqual(3);
    expect(arr[0]).assertEqual(true);
    expect(arr[1]).assertEqual(false);
    expect(arr[2]).assertEqual(true);
    expect(typeof arr[0]).assertEqual("boolean");
    expect(typeof arr[1]).assertEqual("boolean");
    expect(typeof arr[2]).assertEqual("boolean");
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1000
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1000
   * @tc.desc   Verify Array.of() with null argument returns array with null element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: (number | null)[] = Array.of(null);
    expect(arr.length).assertEqual(1);
    expect(arr[0]).assertEqual(null);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1100
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1100
   * @tc.desc   Verify Array.of() with undefined argument returns array with undefined element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: (number | undefined)[] = Array.of(undefined);
    expect(arr.length).assertEqual(1);
    expect(arr[0]).assertEqual(undefined);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1200
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1200
   * @tc.desc   Verify Array.of() with NaN argument returns array with NaN element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = Array.of(NaN);
    expect(arr.length).assertEqual(1);
    expect(isNaN(arr[0])).assertTrue();
    expect(Number.isNaN(arr[0])).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1300
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1300
   * @tc.desc   Verify Array.of() with Infinity arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = Array.of(Infinity, -Infinity);
    expect(arr.length).assertEqual(2);
    expect(arr[0]).assertEqual(Infinity);
    expect(arr[1]).assertEqual(-Infinity);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1400
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1400
   * @tc.desc   Verify Array.of() returns array with correct type
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = Array.of(1, 2, 3);
    expect(Array.isArray(arr)).assertTrue();
    expect(arr instanceof Array).assertTrue();
    expect(arr.constructor === Array).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1500
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1500
   * @tc.desc   Verify Array.of() returns array with correct length property
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr1: number[] = Array.of();
    let arr2: number[] = Array.of(1);
    let arr3: number[] = Array.of(1, 2, 3);
    expect(arr1.length).assertEqual(0);
    expect(arr2.length).assertEqual(1);
    expect(arr3.length).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1600
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1600
   * @tc.desc   Verify elements of Array.of() result can be accessed by index
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = Array.of("a", "b", "c");
    expect(arr[0]).assertEqual("a");
    expect(arr[1]).assertEqual("b");
    expect(arr[2]).assertEqual("c");
    expect(arr[-1]).assertEqual(undefined);
    expect(arr[100]).assertEqual(undefined);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1700
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1700
   * @tc.desc   Verify Array.of(7) differs from Array(7) - of creates single element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arrOf: number[] = Array.of(7);
    let arrNew: number[] = new Array(7);
    expect(arrOf.length).assertEqual(1);
    expect(arrOf[0]).assertEqual(7);
    expect(arrNew.length).assertEqual(7);
    expect(arrNew[0]).assertEqual(undefined);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1800
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1800
   * @tc.desc   Verify Array.of(0) differs from Array(0)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arrOf: number[] = Array.of(0);
    let arrNew: number[] = new Array(0);
    expect(arrOf.length).assertEqual(1);
    expect(arrOf[0]).assertEqual(0);
    expect(arrNew.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest1900
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_1900
   * @tc.desc   Verify Array.of() with multiple arguments behaves same as Array() with multiple arguments
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arrOf: number[] = Array.of(1, 2, 3);
    let arrNew: number[] = new Array(1, 2, 3);
    expect(arrOf.length).assertEqual(arrNew.length);
    expect(arrOf[0]).assertEqual(arrNew[0]);
    expect(arrOf[1]).assertEqual(arrNew[1]);
    expect(arrOf[2]).assertEqual(arrNew[2]);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest2000
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2000
   * @tc.desc   Verify Array.of("7") behaves same as Array("7")
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arrOf: string[] = Array.of("7");
    let arrNew: string[] = new Array("7");
    expect(arrOf.length).assertEqual(arrNew.length);
    expect(arrOf[0]).assertEqual(arrNew[0]);
    expect(arrOf[0]).assertEqual("7");
  });

  /**
   * @tc.name   BuiltinsArrayOfTest2100
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2100
   * @tc.desc   Verify Array.of() result array can be modified by adding elements
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = Array.of(1, 2);
    arr.push(3);
    expect(arr.length).assertEqual(3);
    expect(arr[2]).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest2200
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2200
   * @tc.desc   Verify Array.of() result array can be modified by removing elements
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = Array.of(1, 2, 3);
    arr.pop();
    expect(arr.length).assertEqual(2);
    expect(arr[0]).assertEqual(1);
    expect(arr[1]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest2300
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2300
   * @tc.desc   Verify Array.of() result array elements can be modified
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = Array.of(1, 2, 3);
    arr[0] = 100;
    expect(arr[0]).assertEqual(100);
    expect(arr[1]).assertEqual(2);
    expect(arr[2]).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest2400
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2400
   * @tc.desc   Verify Array.of() with two arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayOfTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = Array.of(1, 2);
    expect(arr.length).assertEqual(2);
    expect(arr[0]).assertEqual(1);
    expect(arr[1]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest2500
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2500
   * @tc.desc   Verify Array.of() with ten arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    expect(arr.length).assertEqual(10);
    expect(arr[0]).assertEqual(1);
    expect(arr[9]).assertEqual(10);
  });

  interface TestObj1 { name: string; value: number }
  interface TestObj2 { id: number }
  /**
   * @tc.name   BuiltinsArrayOfTest2600
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2600
   * @tc.desc   Verify Array.of() with object arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let obj1: TestObj1 = { name: "test", value: 123 };
    let obj2: TestObj2 = { id: 1 };
    let arr1: TestObj1[] = Array.of(obj1);
    let arr2: TestObj2[] = Array.of(obj2);
    expect(arr1.length).assertEqual(1);
    expect(arr2.length).assertEqual(1);
    expect(arr1[0].name).assertEqual("test");
    expect(arr1[0].value).assertEqual(123);
    expect(arr2[0].id).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest2700
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2700
   * @tc.desc   Verify Array.of() with array arguments creates nested array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[][] = Array.of([1, 2], [3, 4, 5]);
    expect(arr.length).assertEqual(2);
    expect(Array.isArray(arr[0])).assertTrue();
    expect(Array.isArray(arr[1])).assertTrue();
    expect(arr[0].length).assertEqual(2);
    expect(arr[1].length).assertEqual(3);
    expect(arr[0][0]).assertEqual(1);
    expect(arr[1][2]).assertEqual(5);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest2800
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2800
   * @tc.desc   Verify Array.of() with function arguments returns array of functions
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let func1: () => number = () => 1;
    let func2: () => number = () => 2;
    let arr: (() => number)[] = Array.of(func1, func2);
    expect(arr.length).assertEqual(2);
    expect(typeof arr[0]).assertEqual("function");
    expect(typeof arr[1]).assertEqual("function");
    expect(arr[0]()).assertEqual(1);
    expect(arr[1]()).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest2900
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_2900
   * @tc.desc   Verify Array.of() with Number.MAX_VALUE and Number.MIN_VALUE
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: number[] = Array.of(Number.MAX_VALUE, Number.MIN_VALUE);
    expect(arr.length).assertEqual(2);
    expect(arr[0]).assertEqual(Number.MAX_VALUE);
    expect(arr[1]).assertEqual(Number.MIN_VALUE);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest3000
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_3000
   * @tc.desc   Verify Array.of() with deeply nested array arguments
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: number[][][] = Array.of([[1, 2], [3, 4]], [[5, 6]]);
    expect(arr.length).assertEqual(2);
    expect(Array.isArray(arr[0])).assertTrue();
    expect(Array.isArray(arr[0][0])).assertTrue();
    expect(arr[0][0][0]).assertEqual(1);
    expect(arr[0][1][1]).assertEqual(4);
    expect(arr[1][0][1]).assertEqual(6);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest3100
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_3100
   * @tc.desc   Verify Array.of() consistently creates new array instances
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr1: number[] = Array.of(1, 2, 3);
    let arr2: number[] = Array.of(1, 2, 3);
    expect(arr1).not().assertEqual(arr2);
    expect(arr1.length).assertEqual(arr2.length);
    expect(arr1[0]).assertEqual(arr2[0]);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest3200
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_3200
   * @tc.desc   Verify Array.of() creates dense arrays not sparse arrays
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: undefined[] = Array.of(undefined, undefined, undefined);
    expect(arr.length).assertEqual(3);
    expect(arr[0]).assertEqual(undefined);
    expect(arr[1]).assertEqual(undefined);
    expect(arr[2]).assertEqual(undefined);
    expect(Missing.ArrayOfHasOwnPropertyTest01(arr, 0)).assertTrue();
    expect(Missing.ArrayOfHasOwnPropertyTest01(arr, 1)).assertTrue();
    expect(Missing.ArrayOfHasOwnPropertyTest01(arr, 2)).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfTest3300
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_3300
   * @tc.desc   Verify Array.of(-5) creates [-5] while Array(-5) throws RangeError
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arrOf: number[] = Array.of(-5);
    expect(arrOf.length).assertEqual(1);
    expect(arrOf[0]).assertEqual(-5);
    let hasThrown: boolean = false;
    try {
      new Array(-5);
    } catch (e) {
      hasThrown = true;
    }
    expect(hasThrown).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfTest3400
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_3400
   * @tc.desc   Verify Array.of(undefined) and Array(undefined) have same behavior
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arrOf: (undefined | number)[] = Array.of(undefined);
    let arrNew: (undefined | number)[] = new Array(undefined);
    expect(arrOf.length).assertEqual(arrNew.length);
    expect(arrOf[0]).assertEqual(arrNew[0]);
    expect(arrOf.length).assertEqual(1);
    expect(arrOf[0]).assertEqual(undefined);
  });

  /**
   * @tc.name   BuiltinsArrayOfTest3500
   * @tc.number SUB_BUILTINS_ARRAY_OF_TEST_3500
   * @tc.desc   Verify Array.of(null) and Array(null) have same behavior
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arrOf: (null | number)[] = Array.of(null);
    let arrNew: (null | number)[] = new Array(null);
    expect(arrOf.length).assertEqual(arrNew.length);
    expect(arrOf[0]).assertEqual(arrNew[0]);
    expect(arrOf.length).assertEqual(1);
    expect(arrOf[0]).assertEqual(null);
  });
})
}
