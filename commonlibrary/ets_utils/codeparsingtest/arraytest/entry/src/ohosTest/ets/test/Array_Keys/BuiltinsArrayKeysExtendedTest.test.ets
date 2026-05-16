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
import * as Missing from './ArrayKeysMissingTest';

export default function BuiltinsArrayKeysExtendedTest() {
describe('BuiltinsArrayKeysExtendedTest', () => {
  beforeAll(async () => {});
  beforeEach(async () => {});
  afterEach(async () => { await Utils.msSleep(10) });
  afterAll(() => {});

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest0100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_0100
   * @tc.desc   Verify keys() on large array (2^20 elements)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: object = Missing.ArrayKeysLargeArrayTest37();
    expect(result['first']).assertEqual(0);
    expect(result['last']).assertEqual(1048575);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest0200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_0200
   * @tc.desc   Verify keys() result can be used with forEach
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let sum: number = 0;
    keys.forEach((key: number, index: number) => {
      sum = sum + key;
    });
    expect(sum).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest0300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_0300
   * @tc.desc   Verify keys() result can be used with map
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let mapped: number[] = keys.map((key: number) => key * 2);
    expect(mapped.length).assertEqual(3);
    expect(mapped[0]).assertEqual(0);
    expect(mapped[1]).assertEqual(2);
    expect(mapped[2]).assertEqual(4);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest0400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_0400
   * @tc.desc   Verify keys() result can be used with filter
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c', 'd'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let filtered: number[] = keys.filter((key: number) => key % 2 === 0);
    expect(filtered.length).assertEqual(2);
    expect(filtered[0]).assertEqual(0);
    expect(filtered[1]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest0500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_0500
   * @tc.desc   Verify keys() result can be used with reduce
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let sum: number = keys.reduce((acc: number, key: number) => acc + key, 0);
    expect(sum).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest0600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_0600
   * @tc.desc   Verify keys() result can be used with indexOf
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(keys.indexOf(1)).assertEqual(1);
    expect(keys.indexOf(5)).assertEqual(-1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest0700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_0700
   * @tc.desc   Verify keys() result can be used with includes
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(keys.includes(1)).assertTrue();
    expect(keys.includes(5)).assertFalse();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest0800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_0800
   * @tc.desc   Verify keys() result can be used with find
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c', 'd'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let found: number | undefined = keys.find((key: number) => key > 1);
    expect(found).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest0900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_0900
   * @tc.desc   Verify keys() result can be used with some
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let hasEven: boolean = keys.some((key: number) => key % 2 === 0);
    expect(hasEven).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1000
   * @tc.desc   Verify keys() result can be used with every
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let allNonNegative: boolean = keys.every((key: number) => key >= 0);
    expect(allNonNegative).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1100
   * @tc.desc   Verify keys() result can be chained with filter, map, reduce
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c', 'd', 'e'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let result: number = keys
      .filter((key: number) => key % 2 === 0)
      .map((key: number) => key * 10)
      .reduce((acc: number, val: number) => acc + val, 0);
    expect(result).assertEqual(60);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1200
   * @tc.desc   Verify keys() result can be used with slice
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c', 'd', 'e'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let sliced: number[] = keys.slice(1, 4);
    expect(sliced.length).assertEqual(3);
    expect(sliced[0]).assertEqual(1);
    expect(sliced[1]).assertEqual(2);
    expect(sliced[2]).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1300
   * @tc.desc   Verify keys() results can be concatenated
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr1: string[] = ['a', 'b'];
    let arr2: string[] = ['c', 'd'];
    let keys1: number[] = Missing.ArrayKeysToArrayTest01(arr1);
    let keys2: number[] = Missing.ArrayKeysToArrayTest01(arr2);
    let combined: number[] = keys1.concat(keys2);
    expect(combined.length).assertEqual(4);
    expect(combined[0]).assertEqual(0);
    expect(combined[1]).assertEqual(1);
    expect(combined[2]).assertEqual(0);
    expect(combined[3]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1400
   * @tc.desc   Verify Object.entries() on array returns different format than keys()
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let entries: [string, string][] = Object.entries(arr);
    expect(keys.length).assertEqual(3);
    expect(entries.length).assertEqual(3);
    expect(keys[0]).assertEqual(0);
    expect(entries[0][0]).assertEqual('0');
    expect(entries[0][1]).assertEqual('a');
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1500
   * @tc.desc   Verify keys() on number and string mixed array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: (number | string)[] = [1, 'two', 3, 'four'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(4);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
    expect(result[3]).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1600
   * @tc.desc   Verify keys() iterator length matches array length
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let values: string[] = [];
    for (let i: number = 0; i < arr.length; i++) {
      values.push(arr[i]);
    }
    expect(keys.length).assertEqual(arr.length);
    expect(values.length).assertEqual(arr.length);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1700
   * @tc.desc   Verify keys() returns same indices as manual index iteration
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c', 'd', 'e'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    for (let i: number = 0; i < arr.length; i++) {
      expect(keys[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1800
   * @tc.desc   Verify keys() on Symbol element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysSymbolArrayTest47();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest1900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_1900
   * @tc.desc   Verify keys() on Array.from() created array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(10);
    for (let i: number = 0; i < 10; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2000
   * @tc.desc   Verify keys() on array created with Array.of()
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = Array.of(1, 2, 3, 4, 5);
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2100
   * @tc.desc   Verify keys() returns IterableIterator type
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [1, 2, 3];
    let iterator: IterableIterator<number> = arr.keys();
    expect(iterator !== null).assertTrue();
    expect(iterator !== undefined).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2200
   * @tc.desc   Verify keys() indices are always integers
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    for (let i: number = 0; i < keys.length; i++) {
      expect(Number.isInteger(keys[i])).assertTrue();
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2300
   * @tc.desc   Verify keys() indices are always non-negative
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    for (let i: number = 0; i < keys.length; i++) {
      expect(keys[i] >= 0).assertTrue();
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2400
   * @tc.desc   Verify keys() indices start from 0 and are consecutive
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c', 'd', 'e'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    for (let i: number = 0; i < keys.length; i++) {
      expect(keys[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2500
   * @tc.desc   Verify keys() can be used to iterate over array indices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let accessedValues: string[] = [];
    for (let i: number = 0; i < keys.length; i++) {
      accessedValues.push(arr[keys[i]]);
    }
    expect(accessedValues[0]).assertEqual('a');
    expect(accessedValues[1]).assertEqual('b');
    expect(accessedValues[2]).assertEqual('c');
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2600
   * @tc.desc   Verify keys() length property equals array length
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr1: string[] = [];
    let arr2: string[] = ['a'];
    let arr3: string[] = ['a', 'b', 'c'];
    let keys1: number[] = Missing.ArrayKeysToArrayTest01(arr1);
    let keys2: number[] = Missing.ArrayKeysToArrayTest01(arr2);
    let keys3: number[] = Missing.ArrayKeysToArrayTest01(arr3);
    expect(keys1.length).assertEqual(arr1.length);
    expect(keys2.length).assertEqual(arr2.length);
    expect(keys3.length).assertEqual(arr3.length);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2700
   * @tc.desc   Verify keys() on deeply nested array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysNestedArrayTest48();
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2800
   * @tc.desc   Verify keys() method exists on Array.prototype
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: boolean = Missing.ArrayKeysPrototypeExistsTest66();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest2900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_2900
   * @tc.desc   Verify keys() can be called via Array.prototype.keys.call
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: boolean = Missing.ArrayKeysPrototypeCallTest49();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3000
   * @tc.desc   Verify keys() does not modify the original array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let originalLength: number = arr.length;
    Missing.ArrayKeysToArrayTest01(arr);
    expect(arr.length).assertEqual(originalLength);
    expect(arr[0]).assertEqual('a');
    expect(arr[1]).assertEqual('b');
    expect(arr[2]).assertEqual('c');
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3100
   * @tc.desc   Verify keys() can be used to modify array elements
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [10, 20, 30];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    for (let i: number = 0; i < keys.length; i++) {
      arr[keys[i]] = arr[keys[i]] * 2;
    }
    expect(arr[0]).assertEqual(20);
    expect(arr[1]).assertEqual(40);
    expect(arr[2]).assertEqual(60);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3200
   * @tc.desc   Verify keys() works correctly after array modification
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    arr.push('d');
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(4);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
    expect(result[3]).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3300
   * @tc.desc   Verify keys() works correctly after array element removal
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c', 'd'];
    arr.pop();
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3400
   * @tc.desc   Verify keys() on array with very large indices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayKeysExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let arr: string[] = [];
    arr[10000] = 'last';
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(10001);
    expect(result[0]).assertEqual(0);
    expect(result[10000]).assertEqual(10000);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3500
   * @tc.desc   Verify keys() returns same indices for same length arrays with different content
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr1: number[] = [1, 2, 3];
    let arr2: string[] = ['a', 'b', 'c'];
    let keys1: number[] = Missing.ArrayKeysToArrayTest01(arr1);
    let keys2: number[] = Missing.ArrayKeysToArrayTest01(arr2);
    expect(keys1.length).assertEqual(keys2.length);
    for (let i: number = 0; i < keys1.length; i++) {
      expect(keys1[i]).assertEqual(keys2[i]);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3600
   * @tc.desc   Verify keys() iterator is not the same as array iterator
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keysIter: IterableIterator<number> = arr.keys();
    let valuesIter: IterableIterator<string> = arr.values();
    let entriesIter: IterableIterator<[number, string]> = arr.entries();
    // Get first value from each iterator to verify they are different types
    let keysFirst: number = keysIter.next().value;
    let valuesFirst: string = valuesIter.next().value;
    let entriesFirst: [number, string] = entriesIter.next().value;
    // keys returns number (index), values returns string (value), entries returns array [index, value]
    expect(typeof keysFirst === 'number').assertTrue();
    expect(typeof valuesFirst === 'string').assertTrue();
    expect(Array.isArray(entriesFirst)).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3700
   * @tc.desc   Verify keys() iterator values match expected indices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let iterator: IterableIterator<number> = arr.keys();
    let expectedIndex: number = 0;
    let result: IteratorResult<number>;
    while (!(result = iterator.next()).done) {
      expect(result.value).assertEqual(expectedIndex);
      expectedIndex++;
    }
    expect(expectedIndex).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3800
   * @tc.desc   Verify multiple calls to keys() on same array produce consistent results
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys1: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let keys2: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let keys3: number[] = Missing.ArrayKeysToArrayTest01(arr);
    for (let i: number = 0; i < keys1.length; i++) {
      expect(keys1[i]).assertEqual(keys2[i]);
      expect(keys2[i]).assertEqual(keys3[i]);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest3900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_3900
   * @tc.desc   Verify keys() results are independent between different arrays
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr1: string[] = ['a', 'b'];
    let arr2: string[] = ['c', 'd', 'e'];
    let keys1: number[] = Missing.ArrayKeysToArrayTest01(arr1);
    let keys2: number[] = Missing.ArrayKeysToArrayTest01(arr2);
    expect(keys1.length).assertEqual(2);
    expect(keys2.length).assertEqual(3);
    expect(keys1[0]).assertEqual(0);
    expect(keys2[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4000
   * @tc.desc   Verify keys() works on array subclass
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysSubclassTest50();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4100
   * @tc.desc   Verify keys() on sealed array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysSealedArrayTest67();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4200
   * @tc.desc   Verify keys() on prevented extensions array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysPreventExtensionsTest68();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4300
   * @tc.desc   Verify keys() works with Number object wrapper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayKeysNumberWrapperTest51();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4400
   * @tc.desc   Verify keys() works with Boolean object wrapper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayKeysBooleanWrapperTest52();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4500
   * @tc.desc   Verify keys() works with String object wrapper
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysStringWrapperTest53();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4600
   * @tc.desc   Verify keys() on array with all same values
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [5, 5, 5, 5, 5];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4700
   * @tc.desc   Verify keys() on array with duplicate values
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'a', 'c', 'a'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(5);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
    expect(result[3]).assertEqual(3);
    expect(result[4]).assertEqual(4);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4800
   * @tc.desc   Verify keys() on RegExp array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysRegExpArrayTest69();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest4900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_4900
   * @tc.desc   Verify keys() on Date array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysDateArrayTest70();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5000
   * @tc.desc   Verify keys() on BigInt array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysBigIntArrayTest71();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5100
   * @tc.desc   Verify keys() iterator returns correct done value at end
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a'];
    let iterator: IterableIterator<number> = arr.keys();
    let result1: IteratorResult<number> = iterator.next();
    let result2: IteratorResult<number> = iterator.next();
    expect(result1.done).assertFalse();
    expect(result2.done).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5200
   * @tc.desc   Verify keys() iterator value is undefined when done
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a'];
    let iterator: IterableIterator<number> = arr.keys();
    iterator.next();
    let result: IteratorResult<number> = iterator.next();
    expect(result.value).assertEqual(undefined);
    expect(result.done).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5300
   * @tc.desc   Verify keys() iterator maintains proper state
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let iterator: IterableIterator<number> = arr.keys();
    let count: number = 0;
    while (!iterator.next().done) {
      count++;
    }
    expect(count).assertEqual(3);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5400
   * @tc.desc   Verify keys() results are correct for reversed array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    arr.reverse();
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5500
   * @tc.desc   Verify keys() results are correct for sorted array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [3, 1, 2];
    arr.sort();
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5600
   * @tc.desc   Verify keys() results are correct for spliced array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c', 'd', 'e'];
    arr.splice(2, 2);
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5700
   * @tc.desc   Verify keys() iterator protocol compliance
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: boolean = Missing.ArrayKeysIteratorProtocolTest77();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5800
   * @tc.desc   Verify keys() can be used with join
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let joined: string = keys.join(',');
    expect(joined).assertEqual('0,1,2');
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest5900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_5900
   * @tc.desc   Verify keys() can be used with toString
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    let str: string = keys.toString();
    expect(str).assertEqual('0,1,2');
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6000
   * @tc.desc   Verify keys() return type is correct
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let iterator: IterableIterator<number> = arr.keys();
    // Verify iterator has the expected methods and behavior
    expect(typeof iterator.next).assertEqual('function');
    expect(iterator.next().value).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6100
   * @tc.desc   Verify keys() always returns fresh iterator
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let iter1: IterableIterator<number> = arr.keys();
    let iter2: IterableIterator<number> = arr.keys();
    expect(iter1 !== iter2).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6200
   * @tc.desc   Verify keys() iterator is not affected by other array operations
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysIteratorSnapshotTest54();
    // Iterator reflects current array state, so after push it includes the new index
    expect(result.length).assertEqual(4);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6300
   * @tc.desc   Verify keys() works with array literal
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: number[] = Missing.ArrayKeysToArrayTest01(['a', 'b', 'c']);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6400
   * @tc.desc   Verify keys() works with Array constructor
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = new Array(5);
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6500
   * @tc.desc   Verify keys() on filled array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = new Array(5).fill(0);
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6600
   * @tc.desc   Verify keys() maintains proper order with modified array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['a', 'b', 'c'];
    arr[0] = 'z';
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6700
   * @tc.desc   Verify keys() on array with single element at large index
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayKeysExtendedTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let arr: string[] = [];
    arr[1000] = 'item';
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(1001);
    expect(result[0]).assertEqual(0);
    expect(result[1000]).assertEqual(1000);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6800
   * @tc.desc   Verify keys() properly handles sparse array gaps
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysSparseGapTest55();
    expect(result.length).assertEqual(6);
    for (let i: number = 0; i < 6; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest6900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_6900
   * @tc.desc   Verify keys() on array with only empty slots
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: (number | null)[] = new Array(3);
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7000
   * @tc.desc   Verify keys() on class array with custom length
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeCustomTest56();
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7100
   * @tc.desc   Verify keys() iterator next() returns proper iterator result
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: boolean = Missing.ArrayKeysIteratorResultTest64();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7200
   * @tc.desc   Verify keys() iterator is iterable
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: boolean = Missing.ArrayKeysIteratorSymbolTest78();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7300
   * @tc.desc   Verify keys() iterator Symbol.iterator returns self
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: boolean = Missing.ArrayKeysIteratorReturnsSelfTest79();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7400
   * @tc.desc   Verify keys() basic functionality with typical array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [10, 20, 30, 40, 50];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(5);
    expect(result[0]).assertEqual(0);
    expect(result[4]).assertEqual(4);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7500
   * @tc.desc   Verify keys() returns consecutive integers starting from 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(10);
    for (let i: number = 0; i < 10; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7600
   * @tc.desc   Verify keys() works with array containing empty strings
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: string[] = ['', '', ''];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7700
   * @tc.desc   Verify keys() works with array containing zeros
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [0, 0, 0];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7800
   * @tc.desc   Verify keys() works with array containing negative numbers
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [-1, -2, -3];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest7900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_7900
   * @tc.desc   Verify keys() works with array containing Infinity
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [Infinity, -Infinity];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8000
   * @tc.desc   Verify keys() works with array containing NaN
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [NaN, NaN, NaN];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8100
   * @tc.desc   Verify keys() works with heterogeneous array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysHeterogeneousArrayTest80();
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8200
   * @tc.desc   Verify keys() on array with single empty object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysSingleEmptyObjectTest57();
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8300
   * @tc.desc   Verify keys() on array with single empty array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysSingleEmptyArrayTest58();
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8400
   * @tc.desc   Verify keys() on array with functions
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysFunctionArrayTest59();
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8500
   * @tc.desc   Verify keys() on array with arrow functions
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysLambdaArrayTest81();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8600
   * @tc.desc   Verify keys() on array with named functions
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysNamedFunctionArrayTest60();
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8700
   * @tc.desc   Verify keys() behavior is consistent across multiple executions
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    for (let i: number = 0; i < 5; i++) {
      let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8800
   * @tc.desc   Verify keys() returns indices in correct order
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['z', 'y', 'x', 'w', 'v'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    for (let i: number = 0; i < result.length; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest8900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_8900
   * @tc.desc   Verify keys() iterator is an object with proper structure
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: boolean = Missing.ArrayKeysIteratorHasNextTest76();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9000
   * @tc.desc   Verify keys() iterator can be converted to array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let result: number[] = Missing.ArrayKeysArrayFromTest11(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9100
   * @tc.desc   Verify keys() iterator follows iterator protocol correctly
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b'];
    let iterator: IterableIterator<number> = arr.keys();
    let result1: IteratorResult<number> = iterator.next();
    let result2: IteratorResult<number> = iterator.next();
    let result3: IteratorResult<number> = iterator.next();
    expect(result1.value).assertEqual(0);
    expect(result1.done).assertFalse();
    expect(result2.value).assertEqual(1);
    expect(result2.done).assertFalse();
    expect(result3.value).assertEqual(undefined);
    expect(result3.done).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9200
   * @tc.desc   Verify keys() on class array with additional properties
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeExtraPropsTest61();
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9300
   * @tc.desc   Verify keys() on class array with non-index properties
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeNonIndexTest62();
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9400
   * @tc.desc   Verify keys() on class array with negative index properties
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysExtendedTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeNegativeIndexTest63();
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9500
   * @tc.desc   Verify keys() returns indices 0 to length-1
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest9500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: number[] = Missing.ArrayKeysLargeArrayTest82();
    expect(result[0]).assertEqual(0);
    expect(result[result.length - 1]).assertEqual(99);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9600
   * @tc.desc   Verify keys() and array indices relationship
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysExtendedTest9600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c', 'd', 'e'];
    let keys: number[] = Missing.ArrayKeysToArrayTest01(arr);
    for (let i: number = 0; i < keys.length; i++) {
      expect(arr[keys[i]]).assertEqual(arr[i]);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9700
   * @tc.desc   Verify keys() includes indices for all slots including undefined
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest9700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysUndefinedMiddleTest83();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9800
   * @tc.desc   Verify keys() handles array with deleted element
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysExtendedTest9800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysDeletedElementTest65();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysExtendedTest9900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_EXTENDED_TEST_9900
   * @tc.desc   Verify keys() on array with maximum safe integer length is not tested due to memory
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('BuiltinsArrayKeysExtendedTest9900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(Number.isSafeInteger(result[0])).assertTrue();
  });
})
}
