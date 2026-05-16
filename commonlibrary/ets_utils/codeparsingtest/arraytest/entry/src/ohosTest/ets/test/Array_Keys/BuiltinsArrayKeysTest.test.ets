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

export default function BuiltinsArrayKeysTest() {
describe('BuiltinsArrayKeysTest', () => {
  beforeAll(async () => {});
  beforeEach(async () => {});
  afterEach(async () => { await Utils.msSleep(10) });
  afterAll(() => {});

  /**
   * @tc.name   BuiltinsArrayKeysTest0100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_0100
   * @tc.desc   Verify Array.prototype.keys() returns all indices for multi-element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest0200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_0200
   * @tc.desc   Verify Array.prototype.keys() works with for...of iteration
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['x', 'y', 'z'];
    let result: number[] = Missing.ArrayKeysForOfTest02(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest0300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_0300
   * @tc.desc   Verify first index returned by keys() is 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['first', 'second'];
    let firstKey: number = Missing.ArrayKeysNextTest03(arr);
    expect(firstKey).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest0400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_0400
   * @tc.desc   Verify Array.prototype.keys() on empty array returns empty iterator
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest0500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_0500
   * @tc.desc   Verify Array.prototype.keys() on single element array returns index 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['only'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest0600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_0600
   * @tc.desc   Verify Array.prototype.keys() on 10-element array returns indices 0-9
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = new Array(10);
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(10);
    for (let i: number = 0; i < 10; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest0700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_0700
   * @tc.desc   Verify keys() returns an object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [1, 2, 3];
    let iterator: IterableIterator<number> = arr.keys();
    expect(typeof iterator).assertEqual('object');
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest0800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_0800
   * @tc.desc   Verify keys() return object has next method
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [1, 2, 3];
    let iterator: IterableIterator<number> = arr.keys();
    expect(typeof iterator.next).assertEqual('function');
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest0900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_0900
   * @tc.desc   Verify keys() iterator has Symbol.iterator method
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [1, 2, 3];
    let result: boolean = Missing.ArrayKeysSymbolIteratorTest07(arr);
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1000
   * @tc.desc   Verify keys() iterator Symbol.iterator returns self
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [1, 2, 3];
    let result: boolean = Missing.ArrayKeysSymbolIteratorSelfTest08(arr);
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1100
   * @tc.desc   Verify next() method returns object with value and done properties
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [1, 2, 3];
    let result: boolean = Missing.ArrayKeysNextFormatTest06(arr);
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1200
   * @tc.desc   Verify iterator can be exhausted and reused returns empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [1, 2, 3];
    let result: boolean = Missing.ArrayKeysExhaustedTest04(arr);
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1300
   * @tc.desc   Verify multiple calls to keys() return independent iterators
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [1, 2, 3];
    let result: boolean = Missing.ArrayKeysIndependentTest05(arr);
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1400
   * @tc.desc   Verify next() returns correct value and done state
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let iterator: IterableIterator<number> = arr.keys();
    let result1: IteratorResult<number> = iterator.next();
    let result2: IteratorResult<number> = iterator.next();
    let result3: IteratorResult<number> = iterator.next();
    let result4: IteratorResult<number> = iterator.next();
    expect(result1.value).assertEqual(0);
    expect(result1.done).assertFalse();
    expect(result2.value).assertEqual(1);
    expect(result2.done).assertFalse();
    expect(result3.value).assertEqual(2);
    expect(result3.done).assertFalse();
    expect(result4.value).assertEqual(undefined);
    expect(result4.done).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1500
   * @tc.desc   Verify Array.prototype.keys() on Array() empty array returns empty iterator
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = new Array();
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1600
   * @tc.desc   Verify Array.prototype.keys() on Array.of() empty array returns empty iterator
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = Array.of();
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1700
   * @tc.desc   Verify empty array iterator next() immediately returns done:true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [];
    let iterator: IterableIterator<number> = arr.keys();
    let result: IteratorResult<number> = iterator.next();
    expect(result.value).assertEqual(undefined);
    expect(result.done).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1800
   * @tc.desc   Verify for...of loop on empty array keys does not execute
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: boolean = Missing.ArrayKeysEmptyForOfTest09();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest1900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_1900
   * @tc.desc   Verify single element array returns index 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['only'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2000
   * @tc.desc   Verify single element array next() returns value 0 and done false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [42];
    let iterator: IterableIterator<number> = arr.keys();
    let result1: IteratorResult<number> = iterator.next();
    let result2: IteratorResult<number> = iterator.next();
    expect(result1.value).assertEqual(0);
    expect(result1.done).assertFalse();
    expect(result2.value).assertEqual(undefined);
    expect(result2.done).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2100
   * @tc.desc   Verify single number element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [100];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2200
   * @tc.desc   Verify single string element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['hello'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2300
   * @tc.desc   Verify single object element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: number[] = Missing.ArrayKeysObjectArrayTest40();
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2400
   * @tc.desc   Verify single null element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: (number | null)[] = [null];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2500
   * @tc.desc   Verify single undefined element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: (number | undefined)[] = [undefined];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2600
   * @tc.desc   Verify two element array returns indices 0 and 1
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [1, 2];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2700
   * @tc.desc   Verify three element array returns indices 0, 1, 2
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2800
   * @tc.desc   Verify five element array returns indices 0-4
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [1, 2, 3, 4, 5];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest2900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_2900
   * @tc.desc   Verify sparse array with empty slots includes all indices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysSparseTest21();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3000
   * @tc.desc   Verify all empty slots array returns all indices
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysAllEmptySlotsTest22();
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3100
   * @tc.desc   Verify sparse array with leading empty slot
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysSparseLeadingTest24();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3200
   * @tc.desc   Verify sparse array with trailing empty slot
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysSparseTrailingTest25();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3300
   * @tc.desc   Verify multiple consecutive empty slots
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysSparseConsecutiveTest26();
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3400
   * @tc.desc   Verify alternating empty slots and values
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysSparseAlternatingTest27();
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3500
   * @tc.desc   Verify keys() vs Object.keys() on sparse array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: object = Missing.ArrayKeysCompareObjectKeysTest23();
    expect(result['prototypeKeys'].length).assertEqual(3);
    expect(result['objectKeys'].length).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3600
   * @tc.desc   Verify iterator continues to return done:true after exhaustion
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: boolean = Missing.ArrayKeysContinueAfterDoneTest31();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3700
   * @tc.desc   Verify Array.prototype.keys() on class array object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeTest12();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3800
   * @tc.desc   Verify keys() on class array with only length property
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeLengthOnlyTest13();
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest3900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_3900
   * @tc.desc   Verify keys() on arguments object
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArgumentsTest14();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4000
   * @tc.desc   Verify keys() on string primitive
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysStringTest15();
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4100
   * @tc.desc   Verify keys() throws TypeError when this is null
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: boolean = Missing.ArrayKeysNullTest16();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4200
   * @tc.desc   Verify keys() throws TypeError when this is undefined
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: boolean = Missing.ArrayKeysUndefinedTest17();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4300
   * @tc.desc   Verify keys() throws TypeError when this is number primitive
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: boolean = Missing.ArrayKeysNumberTest18();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4400
   * @tc.desc   Verify keys() throws TypeError when this is boolean primitive
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: boolean = Missing.ArrayKeysBooleanTest19();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4500
   * @tc.desc   Verify keys() works on string primitive
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysStringPrimitiveTest20();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4600
   * @tc.desc   Verify keys() ignores passed parameters
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysIgnoresParamsTest28();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4700
   * @tc.desc   Verify keys() works on frozen array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysFrozenArrayTest29();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4800
   * @tc.desc   Verify Array.from() can convert keys iterator to array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [1, 2, 3];
    let result: number[] = Missing.ArrayKeysArrayFromTest11(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest4900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_4900
   * @tc.desc   Verify destructuring works with keys iterator
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = [1, 2, 3];
    let result: object = Missing.ArrayKeysDestructuringTest10(arr);
    expect(result['first']).assertEqual(0);
    expect(result['second']).assertEqual(1);
    expect(result['third']).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5000
   * @tc.desc   Verify keys() on class array with length 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeLengthZeroTest41();
    expect(result.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5100
   * @tc.desc   Verify keys() on class array with length 1
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeLengthOneTest42();
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5200
   * @tc.desc   Verify keys() on class array with decimal length
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeDecimalLengthTest32();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5300
   * @tc.desc   Verify keys() on class array with non-numeric string length returns empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeStringLengthTest33();
    expect(result.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5400
   * @tc.desc   Verify keys() on class array with object length returns empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeObjectLengthTest34();
    expect(result.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5500
   * @tc.desc   Verify keys() on class array with Symbol length returns empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysArrayLikeSymbolLengthTest35();
    expect(result.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5600
   * @tc.desc   Verify keys() works on TypedArray
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysTypedArrayTest36();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5700
   * @tc.desc   Verify keys() on array with length set to decimal
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysLengthDecimalTest38();
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5800
   * @tc.desc   Verify keys() on array with length set to NaN returns empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: number[] = Missing.ArrayKeysLengthNaNTest39();
    expect(result.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest5900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_5900
   * @tc.desc   Verify keys(), values(), entries() work consistently
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: object = Missing.ArrayKeysCompareValuesEntriesTest30();
    expect(result['keys'].length).assertEqual(3);
    expect(result['values'].length).assertEqual(3);
    expect(result['entries'].length).assertEqual(3);
    expect(result['keys'][0]).assertEqual(0);
    expect(result['keys'][1]).assertEqual(1);
    expect(result['keys'][2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6000
   * @tc.desc   Verify keys() on number array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[] = [1, 2, 3, 4, 5];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(5);
    for (let i: number = 0; i < 5; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6100
   * @tc.desc   Verify keys() on string array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: string[] = ['a', 'b', 'c'];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6200
   * @tc.desc   Verify keys() on boolean array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: boolean[] = [true, false, true];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6300
   * @tc.desc   Verify keys() on object array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let result: number[] = Missing.ArrayKeysMultipleObjectsTest43();
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6400
   * @tc.desc   Verify keys() on nested array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: number[][] = [[1, 2], [3, 4], [5, 6]];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6500
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6500
   * @tc.desc   Verify keys() on function array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('BuiltinsArrayKeysTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
    let arr: (() => number)[] = [() => 1, () => 2, () => 3];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6600
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6600
   * @tc.desc   Verify keys() on null element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: (number | null)[] = [null, null, null];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6700
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6700
   * @tc.desc   Verify keys() on undefined element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: (number | undefined)[] = [undefined, undefined, undefined];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(3);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
    expect(result[2]).assertEqual(2);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6800
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6800
   * @tc.desc   Verify keys() on mixed type array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let result: number[] = Missing.ArrayKeysMixedTypesTest44();
    expect(result.length).assertEqual(6);
    for (let i: number = 0; i < 6; i++) {
      expect(result[i]).assertEqual(i);
    }
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest6900
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_6900
   * @tc.desc   Verify keys() on 100 element array
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = new Array(100).fill(0);
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(100);
    expect(result[0]).assertEqual(0);
    expect(result[99]).assertEqual(99);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest7000
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_7000
   * @tc.desc   Verify keys() on array with length 1
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = new Array(1);
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(1);
    expect(result[0]).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest7100
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_7100
   * @tc.desc   Verify keys() on array with length 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL1
   */
  it('BuiltinsArrayKeysTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    let arr: number[] = new Array(0);
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(0);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest7200
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_7200
   * @tc.desc   Verify keys() on array with Number.MAX_VALUE and Number.MIN_VALUE
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let arr: number[] = [Number.MAX_VALUE, Number.MIN_VALUE];
    let result: number[] = Missing.ArrayKeysToArrayTest01(arr);
    expect(result.length).assertEqual(2);
    expect(result[0]).assertEqual(0);
    expect(result[1]).assertEqual(1);
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest7300
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_7300
   * @tc.desc   Verify keys() on array with negative length throws RangeError
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayKeysNegativeLengthTest45();
    expect(result).assertTrue();
  });

  /**
   * @tc.name   BuiltinsArrayKeysTest7400
   * @tc.number SUB_BUILTINS_ARRAY_KEYS_TEST_7400
   * @tc.desc   Verify keys() on array with Infinity length throws RangeError
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('BuiltinsArrayKeysTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
    let result: boolean = Missing.ArrayKeysInfinityLengthTest46();
    expect(result).assertTrue();
  });
})
}
