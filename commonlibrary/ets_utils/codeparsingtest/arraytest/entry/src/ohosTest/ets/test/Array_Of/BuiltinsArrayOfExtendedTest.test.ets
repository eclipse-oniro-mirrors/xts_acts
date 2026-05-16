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

export default function BuiltinsArrayOfExtendedTest() {
describe('BuiltinsArrayOfExtendedTest', () => {
  beforeAll(async () => {});
  beforeEach(async () => {});
  afterEach(async () => { await Utils.msSleep(10) });
  afterAll(() => {});

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0100
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0100
   * @tc.desc   Verify Array.of() with Date object arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let date1: Date = new Date();
    let date2: Date = new Date(2020, 0, 1);
    let arr: Date[] = Array.of(date1, date2);
    expect(arr.length).assertEqual(2);
    expect(arr[0] instanceof Date).assertTrue();
    expect(arr[1] instanceof Date).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0200
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0200
   * @tc.desc   Verify Array.of() with empty object argument returns array with empty object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let emptyObj: Record<string, never> = {};
    let arr: Record<string, never>[] = Array.of(emptyObj);
    expect(arr.length).assertEqual(1);
    expect(typeof arr[0]).assertEqual("object");
    expect(Object.keys(arr[0]).length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0300
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0300
   * @tc.desc   Verify Array.of() with empty array argument returns array with empty array element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[][] = Array.of([]);
    expect(arr.length).assertEqual(1);
    expect(Array.isArray(arr[0])).assertTrue();
    expect(arr[0].length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0400
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0400
   * @tc.desc   Verify Array.of() with MAX_SAFE_INTEGER and MIN_SAFE_INTEGER
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: number[] = Array.of(Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER);
    expect(arr.length).assertEqual(2);
    expect(arr[0]).assertEqual(Number.MAX_SAFE_INTEGER);
    expect(arr[1]).assertEqual(Number.MIN_SAFE_INTEGER);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0500
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0500
   * @tc.desc   Verify Array.of() with long string argument preserves string length
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let longStr: string = "a".repeat(10000);
    let arr: string[] = Array.of(longStr);
    expect(arr.length).assertEqual(1);
    expect(arr[0].length).assertEqual(10000);
  });

  interface DeepObjD { e: number }
  interface DeepObjC { d: DeepObjD }
  interface DeepObjB { c: DeepObjC }
  interface DeepObjA { b: DeepObjB }
  interface DeepObj { a: DeepObjA }
  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0600
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0600
   * @tc.desc   Verify Array.of() with deeply nested object arguments
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let deepObj: DeepObj = { a: { b: { c: { d: { e: 1 } } } } };
    let arr: DeepObj[] = Array.of(deepObj);
    expect(arr.length).assertEqual(1);
    expect(arr[0].a.b.c.d.e).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0700
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0700
   * @tc.desc   Verify Array.of() with symbol argument returns array with symbol element via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayOfTest1900();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0800
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0800
   * @tc.desc   Verify Array.of() with Symbol.iterator returns array with symbol element via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayOfTest2000();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest0900
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_0900
   * @tc.desc   Verify Array.of() with BigInt arguments returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: bigint[] = Array.of(9007199254740991n, 123n);
    expect(arr.length).assertEqual(2);
    expect(typeof arr[0]).assertEqual("bigint");
    expect(typeof arr[1]).assertEqual("bigint");
    expect(arr[0]).assertEqual(9007199254740991n);
    expect(arr[1]).assertEqual(123n);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1000
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1000
   * @tc.desc   Verify Array.of() with RegExp arguments returns array of regex patterns
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: RegExp[] = Array.of(/test/, /pattern/gi);
    expect(arr.length).assertEqual(2);
    expect(arr[0] instanceof RegExp).assertTrue();
    expect(arr[1] instanceof RegExp).assertTrue();
    expect(arr[0].test("test")).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1100
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1100
   * @tc.desc   Verify Array.of() with Error objects returns array of errors
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let err1: Error = new Error("test error");
    let err2: TypeError = new TypeError("type error");
    let arr1: Error[] = Array.of(err1);
    let arr2: TypeError[] = Array.of(err2);
    expect(arr1.length).assertEqual(1);
    expect(arr2.length).assertEqual(1);
    expect(arr1[0] instanceof Error).assertTrue();
    expect(arr2[0] instanceof TypeError).assertTrue();
    expect(arr1[0].message).assertEqual("test error");
    expect(arr2[0].message).assertEqual("type error");
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1200
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1200
   * @tc.desc   Verify Array.of() with Map object returns array with Map element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let map: Map<string, number> = new Map([["a", 1], ["b", 2]]);
    let arr: Map<string, number>[] = Array.of(map);
    expect(arr.length).assertEqual(1);
    expect(arr[0] instanceof Map).assertTrue();
    expect(arr[0].get("a")).assertEqual(1);
    expect(arr[0].get("b")).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1300
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1300
   * @tc.desc   Verify Array.of() with Set object returns array with Set element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let set: Set<number> = new Set([1, 2, 3]);
    let arr: Set<number>[] = Array.of(set);
    expect(arr.length).assertEqual(1);
    expect(arr[0] instanceof Set).assertTrue();
    expect(arr[0].has(1)).assertTrue();
    expect(arr[0].has(2)).assertTrue();
    expect(arr[0].has(3)).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1400
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1400
   * @tc.desc   Verify Array.of() with Promise object returns array with Promise element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
    let promise: Promise<number> = Promise.resolve(42);
    let arr: Promise<number>[] = Array.of(promise);
    expect(arr.length).assertEqual(1);
    expect(arr[0] instanceof Promise).assertTrue();
    let result: number = await arr[0];
    expect(result).assertEqual(42);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1500
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1500
   * @tc.desc   Verify Array.of() result can be frozen and prevents modification via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayOfTest2100();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1600
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1600
   * @tc.desc   Verify Array.of() result can be sealed via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayOfTest2200();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1700
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1700
   * @tc.desc   Verify Array.of() result can be prevented from extensions via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayOfTest2300();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1800
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1800
   * @tc.desc   Verify Array.of() with generator function result
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest0100();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest1900
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_1900
   * @tc.desc   Verify Array.of() works with Array subclass and returns subclass instance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayOfTest0200();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2000
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2000
   * @tc.desc   Verify Array.of() subclass instance inherits Array methods
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayOfTest0300();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2100
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2100
   * @tc.desc   Verify Array.of() works with multi-level inheritance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest0400();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2200
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2200
   * @tc.desc   Verify TypedArray.of() creates typed arrays correctly
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let int8Array: Int8Array = Int8Array.of(1, 2, 3);
    let uint8Array: Uint8Array = Uint8Array.of(10, 20, 30);
    expect(int8Array.length).assertEqual(3);
    expect(int8Array[0]).assertEqual(1);
    expect(int8Array instanceof Int8Array).assertTrue();
    expect(uint8Array.length).assertEqual(3);
    expect(uint8Array[0]).assertEqual(10);
    expect(uint8Array instanceof Uint8Array).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2300
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2300
   * @tc.desc   Verify Array.of() with array-like object argument
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest0500();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2400
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2400
   * @tc.desc   Verify Array.of.call() with custom constructor
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest0700();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2500
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2500
   * @tc.desc   Verify Array.of.apply() with argument array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest0800();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2600
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2600
   * @tc.desc   Verify Array.of.bind() with custom constructor
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest0900();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2700
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2700
   * @tc.desc   Verify Array.of() result has correct prototype via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: boolean = Missing.ArrayOfTest2400();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2800
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2800
   * @tc.desc   Verify Array.of() result has correct enumerable keys
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayOfExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,() => {
    let arr: number[] = Array.of(1, 2, 3);
    let keys: string[] = Object.keys(arr);
    expect(keys.length).assertEqual(3);
    expect(keys[0]).assertEqual("0");
    expect(keys[1]).assertEqual("1");
    expect(keys[2]).assertEqual("2");
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest2900
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_2900
   * @tc.desc   Verify Array.of() with large number of arguments via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest1000();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3000
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3000
   * @tc.desc   Verify Array.of() with primitive wrapper objects
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let numObj: Number = new Number(42);
    let strObj: String = new String("test");
    let boolObj: Boolean = new Boolean(true);
    let numArr: Number[] = Array.of(numObj);
    let strArr: String[] = Array.of(strObj);
    let boolArr: Boolean[] = Array.of(boolObj);
    expect(numArr.length).assertEqual(1);
    expect(strArr.length).assertEqual(1);
    expect(boolArr.length).assertEqual(1);
    expect(numArr[0] instanceof Number).assertTrue();
    expect(strArr[0] instanceof String).assertTrue();
    expect(boolArr[0] instanceof Boolean).assertTrue();
    expect(Number(numArr[0])).assertEqual(42);
    expect(String(strArr[0])).assertEqual("test");
    expect(Boolean(boolArr[0])).assertEqual(true);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3100
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3100
   * @tc.desc   Verify Array.of() with special characters in strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: string[] = Array.of("\n", "\t", "\\", "\r");
    expect(arr.length).assertEqual(4);
    expect(arr[0]).assertEqual("\n");
    expect(arr[1]).assertEqual("\t");
    expect(arr[2]).assertEqual("\\");
    expect(arr[3]).assertEqual("\r");
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3200
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3200
   * @tc.desc   Verify Array.of() with async function
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
    let asyncFunc: () => Promise<number> = async () => 42;
    let arr: (() => Promise<number>)[] = Array.of(asyncFunc);
    expect(arr.length).assertEqual(1);
    expect(typeof arr[0]).assertEqual("function");
    let result: number = await arr[0]();
    expect(result).assertEqual(42);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3300
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3300
   * @tc.desc   Verify Array.of() with generator function via JS helper using ArrayOfTest0100
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest0100();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3400
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3400
   * @tc.desc   Verify Array.of() subclass constructor is correctly called via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest1200();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3500
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3500
   * @tc.desc   Verify Array.of() subclass custom getters (first/last) work via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest1300();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3600
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3600
   * @tc.desc   Verify Array.of() subclass with Symbol.species via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest1700();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3700
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3700
   * @tc.desc   Verify Array.of() with arguments object via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest0600();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3800
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3800
   * @tc.desc   Verify Array.of.call() with Object constructor via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest1400();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest3900
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_3900
   * @tc.desc   Verify Array.of.call() with plain object via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest1500();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest4000
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_4000
   * @tc.desc   Verify Array.of() with deeply nested generator via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest1600();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest4100
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_4100
   * @tc.desc   Verify Array.of() result wrapped in Proxy works correctly
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest2900();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest4200
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_4200
   * @tc.desc   Verify Array.of can be wrapped by Proxy and still works correctly via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest2500();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest4300
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_4300
   * @tc.desc   Verify Array.of() result with readonly length property throws TypeError when pushing via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest2600();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest4400
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_4400
   * @tc.desc   Verify Array.of() result elements can have getter/setter via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest2700();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest4500
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_4500
   * @tc.desc   Verify Array.of() works with circular reference object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayOfExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let result: boolean = Missing.ArrayOfTest2800();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest4600
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_4600
   * @tc.desc   Verify Array.of() uses modified Array.prototype.push correctly via JS helper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL4
   */
  it('BuiltinsArrayOfExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, () => {
    let result: boolean = Missing.ArrayOfTest1800();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest4700
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_4700
   * @tc.desc   Verify Array.of() with special character strings returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: string[] = Array.of("\n", "\t", "\\", "\r");
    expect(arr.length).assertEqual(4);
    expect(arr[0]).assertEqual("\n");
    expect(arr[1]).assertEqual("\t");
    expect(arr[2]).assertEqual("\\");
    expect(arr[3]).assertEqual("\r");
    expect(arr[0].length).assertEqual(1);
    expect(arr[1].length).assertEqual(1);
    expect(arr[2].length).assertEqual(1);
    expect(arr[3].length).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayOfExtendedTest4800
   * @tc.number SUB_BUILTINS_ARRAY_OF_EXTENDED_TEST_4800
   * @tc.desc   Verify Array.of() with Number.MIN_SAFE_INTEGER returns correct array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayOfExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: number[] = Array.of(Number.MIN_SAFE_INTEGER);
    expect(arr.length).assertEqual(1);
    expect(arr[0]).assertEqual(Number.MIN_SAFE_INTEGER);
    expect(arr[0]).assertEqual(-9007199254740991);
  });

})
}
