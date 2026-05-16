/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  testSetKeysJs0014,
  testSetKeysJs0037,
  testSetKeysJs0043,
  testSetKeysJs0044,
  testSetKeysJs0045,
  testSetKeysJs0046,
  testSetKeysJs0055,
  testSetKeysJs0061,
  testSetSizeJs010,
  testSetSizeJs019,
  testSetSizeJs025,
  testSetSizeJs034,
  testSetSizeJs036,
  testSetSizeJs038,
  testSetSizeJs039,
  testSetSizeJs073,
  testSetSizeJs077,
  testSetSizeJs082,
  testSetSizeJs088,
  testSetSizeJs092,
  testSetValuesJs014,
  testSetValuesJs044,
  testSetValuesJs046,
  testSetValuesJs052,
  testSetValuesJs059
} from './SetKeys';
export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}
export interface GeneratedObjectLiteralInterface_1 {
  id: number;
}

export interface GeneratedObjectLiteralInterface_3 {
  name: string;
}

interface GeneratedObjectLiteralInterface_4 {
  prop: string;
}

interface ValueOfInterface {
  valueOf: () => number;
}

interface toStringInterface {
  toString: () => 'same';
}

interface GeneratedObjectLiteralInterface_5 {
  a: number;
  b: number;
}

interface TestObject {
  id: number;
  data: string;
}

class TestClass {
  public name: string;
  public version: number;

  constructor(name: string, version: number) {
    this.name = name;
    this.version = version;
  }
}

enum TestEnum {
  Option1,
  Option2,
  Option3
}

interface TestEntity {
  id: number;
  name: string;
}

class TestModel {
  public code: string;
  public value: number;

  constructor(code: string, value: number) {
    this.code = code;
    this.value = value;
  }
}

enum TestStatus {
  New,
  Processing,
  Completed,
  Failed
}

class ImmutableData {
  public readonly key: string;
  public readonly value: number;

  constructor(key: string, value: number) {
    this.key = key;
    this.value = value;
  }
}

type SpecialTypes = null | undefined | bigint | RegExp;

class ImmutableItem {
  public key: string;
  public value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

interface GeneratedTypeLiteralInterface_2 {
  type: 'add' | 'delete';
  value: number;
}

interface EmptyObject {}

interface DataObject {
  id: number;
  content: string;
}

class CustomItem {
  public code: string;
  public value: number;

  constructor(code: string, value: number) {
    this.code = code;
    this.value = value;
  }
}

enum Status {
  PENDING,
  PROCESSING,
  COMPLETED
}

export default function SetKeysTest() {
  describe('SetKeysTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await sleep(50)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });
    /**
     * @tc.name   testSetKeys0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_001
     * @tc.desc   Test basic functionality of Set.keys() with string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['a', 'b', 'c']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual('b');
      expect(keys.next().value).assertEqual('c');
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_002
     * @tc.desc   Test Set.keys() with number elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3, 4]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(4);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_003
     * @tc.desc   Test Set.keys() on empty Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      const keys = set.keys();
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_004
     * @tc.desc   Test that Set.keys() preserves insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<string>();
      set.add('first');
      set.add('second');
      set.add('third');

      const keys = set.keys();
      expect(keys.next().value).assertEqual('first');
      expect(keys.next().value).assertEqual('second');
      expect(keys.next().value).assertEqual('third');
    });

    /**
     * @tc.name   testSetKeys0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_005
     * @tc.desc   Test Set.keys() with duplicate elements (which get ignored)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 2, 3, 3, 3]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_006
     * @tc.desc   Test Set.keys() with mixed data types (number, string, boolean, null, undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 'a', true, null, undefined]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual(true);
      expect(keys.next().value).assertEqual(null);
      expect(keys.next().value).assertEqual(undefined);
    });

    /**
     * @tc.name   testSetKeys0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_007
     * @tc.desc   Test Set.keys() with object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_1 = { id: 1 };
      const obj2: GeneratedObjectLiteralInterface_1 = { id: 2 };
      const set = new Set([obj1, obj2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
    });

    /**
     * @tc.name   testSetKeys0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_008
     * @tc.desc   Test Set.keys() with NaN elements (which are considered equal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([NaN, NaN, 10]);
      const keys = set.keys();
      expect(Number.isNaN(keys.next().value)).assertEqual(true);
      expect(keys.next().value).assertEqual(10);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_009
     * @tc.desc   Test Set.keys() with 0 and -0 (treated as equal)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([0, -0, 1]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_010
     * @tc.desc   Test that each call to keys() returns a new iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3]);
      const keys1 = set.keys();
      expect(keys1.next().value).assertEqual(1);

      const keys2 = set.keys();
      expect(keys2.next().value).assertEqual(1);
      expect(keys1.next().value).assertEqual(2);
    });

    /**
     * @tc.name   testSetKeys0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_011
     * @tc.desc   Test Set.keys() after adding new elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2]);
      set.add(3);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
    });

    /**
     * @tc.name   testSetKeys0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_012
     * @tc.desc   Test Set.keys() after deleting an element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3]);
      set.delete(2);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_013
     * @tc.desc   Test Set.keys() with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1n, 2n, 3n]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1n);
      expect(keys.next().value).assertEqual(2n);
      expect(keys.next().value).assertEqual(3n);
    });

    /**
     * @tc.name   testSetKeys0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_014
     * @tc.desc   Test Set.keys() with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0014()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testSetKeys0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_015
     * @tc.desc   Test iterator state after complete iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2]);
      const keys = set.keys();
      keys.next();
      keys.next();
      expect(keys.next().done).assertEqual(true);
      expect(keys.next().value).assertEqual(undefined);
    });

    /**
     * @tc.name   testSetKeys0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_016
     * @tc.desc   Test Set.keys() with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2023-01-02');
      const set = new Set([date1, date2]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(date1);
      expect(keys.next().value).assertEqual(date2);
    });

    /**
     * @tc.name   testSetKeys0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_017
     * @tc.desc   Test Set.keys() with RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = /a/;
      const regex2 = /b/;
      const set = new Set([regex1, regex2]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(regex1);
      expect(keys.next().value).assertEqual(regex2);
    });

    /**
     * @tc.name   testSetKeys0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_018
     * @tc.desc   Test converting Set.keys() iterator to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['x', 'y', 'z']);
      const keysArray = Array.from(set.keys());
      expect(keysArray.length).assertEqual(3);
      expect(keysArray[0]).assertEqual('x');
      expect(keysArray[1]).assertEqual('y');
      expect(keysArray[2]).assertEqual('z');
    });

    /**
     * @tc.name   testSetKeys0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_019
     * @tc.desc   Test iterating over Set.keys() with for...of loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([10, 20, 30]);
      const result: number[] = [];
      for (const key of set.keys()) {
        result.push(key);
      }
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name   testSetKeys0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_020
     * @tc.desc   Test Set.keys() with SameValueZero comparison (0, -0, false)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([0, -0, false]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(0);
      expect(keys.next().value).assertEqual(false);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_021
     * @tc.desc   Test Set.keys() with large number of elements (1000 elements)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0021', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      const size = 1000;
      for (let i = 0; i < size; i++) {
        set.add(i);
      }

      const keys = set.keys();
      for (let i = 0; i < size; i++) {
        expect(keys.next().value).assertEqual(i);
      }
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_022
     * @tc.desc   Test Set.keys() after calling clear()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3]);
      set.clear();
      const keys = set.keys();
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_023
     * @tc.desc   Test that keys() and values() return same iterator for Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['a', 'b']);
      const keys = set.keys();
      const values = set.values();
      expect(keys.next().value).assertEqual(values.next().value);
      expect(keys.next().value).assertEqual(values.next().value);
    });

    /**
     * @tc.name   testSetKeys0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_024
     * @tc.desc   Test that keys() returns an iterator object with next() method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2]);
      const keys = set.keys();
      expect(typeof keys.next).assertEqual('function');
    });


    /**
     * @tc.name   testSetKeys0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_026
     * @tc.desc   Test Set.keys() with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = () => 'hello';
      const func2 = () => 'world';
      const set = new Set([func1, func2]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(func1);
      expect(keys.next().value).assertEqual(func2);
    });

    /**
     * @tc.name   testSetKeys0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_027
     * @tc.desc   Test partial iteration with Set.keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3, 4, 5]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().value).assertEqual(2);
      // Stop iteration early
    });

    /**
     * @tc.name   testSetKeys0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_028
     * @tc.desc   Test Set.keys() with null and undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([null, undefined, null, undefined]);
      const keys = set.keys();
      expect(keys.next().value).assertEqual(null);
      expect(keys.next().value).assertEqual(undefined);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_029
     * @tc.desc   Test chained iteration with Set.keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['p', 'q', 'r']);
      const keys = set.keys();

      const first = keys.next();
      expect(first.value).assertEqual('p');
      expect(first.done).assertEqual(false);

      const second = keys.next();
      expect(second.value).assertEqual('q');
      expect(second.done).assertEqual(false);

      const third = keys.next();
      expect(third.value).assertEqual('r');
      expect(third.done).assertEqual(false);

      const done = keys.next();
      expect(done.value).assertEqual(undefined);
      expect(done.done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_030
     * @tc.desc   Test Set.keys() with mixed objects and primitives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: GeneratedObjectLiteralInterface_3 = { name: 'test' };
      const set = new Set([obj, 42, 'string']);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(obj);
      expect(keys.next().value).assertEqual(42);
      expect(keys.next().value).assertEqual('string');
      expect(keys.next().done).assertEqual(true);
    });
    /**
     * @tc.name   testSetKeys0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_031
     * @tc.desc   Test Set.keys() with elements added in reverse order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      [5, 4, 3, 2, 1].forEach(num => set.add(num));
      const keys = set.keys();
      expect(keys.next().value).assertEqual(5);
      expect(keys.next().value).assertEqual(4);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(1);
    });

    /**
     * @tc.name   testSetKeys0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_032
     * @tc.desc   Test Set.keys() with elements added and removed multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      set.add(1);
      set.add(2);
      set.delete(1);
      set.add(3);
      set.add(1);
      set.delete(2);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_033
     * @tc.desc   Test Set.keys() with Symbol.iterator call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['a', 'b']);
      const keys: Iterator<string> = set.keys();

      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual('b');
    });

    /**
     * @tc.name   testSetKeys0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_034
     * @tc.desc   Test Set.keys() with very large integers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const largeNum1 = 9007199254740991n; // Maximum safe integer as BigInt
      const largeNum2 = 9007199254740992n;
      const set = new Set([largeNum1, largeNum2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(largeNum1);
      expect(keys.next().value).assertEqual(largeNum2);
    });

    /**
     * @tc.name   testSetKeys0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_035
     * @tc.desc   Test Set.keys() with empty strings and whitespace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['', ' ', '  ']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('');
      expect(keys.next().value).assertEqual(' ');
      expect(keys.next().value).assertEqual('  ');
    });

    /**
     * @tc.name   testSetKeys0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_036
     * @tc.desc   Test Set.keys() with objects modified after insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: GeneratedObjectLiteralInterface_4 = { prop: 'initial' };
      const set = new Set([obj]);
      obj.prop = 'modified'; // Modify the object after insertion

      const keys: Iterator<GeneratedObjectLiteralInterface_4> = set.keys();
      const firstValue: GeneratedObjectLiteralInterface_4 | undefined = keys.next().value;
      expect(firstValue).assertEqual(obj);
      expect(firstValue?.prop).assertEqual('modified');
    });

    /**
     * @tc.name   testSetKeys0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_037
     * @tc.desc   Test Set.keys() with iterating over frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0037()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testSetKeys0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_038
     * @tc.desc   Test Set.keys() with iterating during concurrent modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([1, 2, 3]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(1);
      set.add(4); // Modify set during iteration
      expect(keys.next().value).assertEqual(2);
      expect(keys.next().value).assertEqual(3);
      expect(keys.next().value).assertEqual(4); // New element should be included
    });

    /**
     * @tc.name   testSetKeys0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_039
     * @tc.desc   Test Set.keys() with iterating over weak references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let obj1: GeneratedObjectLiteralInterface_3 | null = { name: 'obj1' };
      let obj2: GeneratedObjectLiteralInterface_3 | null = { name: 'obj2' };
      const set = new Set([obj1, obj2]);
      // Create weak references
      const weakRef1 = new WeakRef(obj1);
      const weakRef2 = new WeakRef(obj2);
      obj1 = null;
      obj2 = null;

      // Force garbage collection (if possible in test environment)
      if (typeof globalThis.gc === 'function') {
        globalThis.gc();
      }

      const keys = set.keys();
      // Since we're using Set (strong references), objects should still exist
      expect(keys.next().value).assertEqual(weakRef1.deref());
      expect(keys.next().value).assertEqual(weakRef2.deref());
    });

    /**
     * @tc.name   testSetKeys0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_040
     * @tc.desc   Test Set.keys() with Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set(['ä', 'ö', 'ü', 'ñ', 'ç']);
      const keys = set.keys();
      expect(keys.next().value).assertEqual('ä');
      expect(keys.next().value).assertEqual('ö');
      expect(keys.next().value).assertEqual('ü');
      expect(keys.next().value).assertEqual('ñ');
      expect(keys.next().value).assertEqual('ç');
    });

    /**
     * @tc.name   testSetKeys0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_041
     * @tc.desc   Test Set.keys() with surrogate pair characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const emoji1 = '😊'; // U+1F60A
      const emoji2 = '🎉'; // U+1F389
      const set = new Set([emoji1, emoji2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(emoji1);
      expect(keys.next().value).assertEqual(emoji2);
    });

    /**
     * @tc.name   testSetKeys0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_042
     * @tc.desc   Test Set.keys() with very long strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const longStr1 = 'a'.repeat(1000);
      const longStr2 = 'b'.repeat(1000);
      const set = new Set([longStr1, longStr2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(longStr1);
      expect(keys.next().value).assertEqual(longStr2);
    });

    /**
     * @tc.name   testSetKeys0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_043
     * @tc.desc   Test Set.keys() with inherited properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0043()).assertDeepEquals([true, true, true])
    });

    /**
     * @tc.name   testSetKeys0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_044
     * @tc.desc   Test Set.keys() with non-enumerable properties in objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0044()).assertDeepEquals([true, 'secret']);
    });

    /**
     * @tc.name   testSetKeys0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_045
     * @tc.desc   Test Set.keys() with symbol properties in objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0045()).assertDeepEquals([true, 'private']);
    });

    /**
     * @tc.name   testSetKeys0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_046
     * @tc.desc   Test Set.keys() with circular references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0046()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testSetKeys0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_047
     * @tc.desc   Test Set.keys() with Date objects of same time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2023-01-01'); // Same time, different object

      const set = new Set([date1, date2]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(date1);
      expect(keys.next().value).assertEqual(date2);
      // They are different objects, so both should appear
    });

    /**
     * @tc.name   testSetKeys0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_048
     * @tc.desc   Test Set.keys() with large dataset after many modifications
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0048', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      const initialSize = 1000;

      // Add initial elements
      for (let i = 0; i < initialSize; i++) {
        set.add(i);
      }

      // Modify the set - remove half, add new ones
      for (let i = 0; i < initialSize / 2; i++) {
        set.delete(i);
        set.add(initialSize + i);
      }

      // Collect all keys and verify count
      const keysArray = Array.from(set.keys());
      expect(keysArray.length).assertEqual(initialSize);
    });

    /**
     * @tc.name   testSetKeys0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_049
     * @tc.desc   Test Set.keys() with typed arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Uint16Array([4, 5, 6]);
      const set = new Set([arr1, arr2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(arr1);
      expect(keys.next().value).assertEqual(arr2);
    });

    /**
     * @tc.name   testSetKeys0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_050
     * @tc.desc   Test Set.keys() with Map objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1 = new Map([['a', 1]]);
      const map2 = new Map([['b', 2]]);
      const set = new Set([map1, map2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(map1);
      expect(keys.next().value).assertEqual(map2);
    });

    /**
     * @tc.name   testSetKeys0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_051
     * @tc.desc   Test Set.keys() with Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const innerSet1 = new Set([1, 2]);
      const innerSet2 = new Set([3, 4]);
      const outerSet = new Set([innerSet1, innerSet2]);

      const keys = outerSet.keys();
      expect(keys.next().value).assertEqual(innerSet1);
      expect(keys.next().value).assertEqual(innerSet2);
    });

    /**
     * @tc.name   testSetKeys0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_052
     * @tc.desc   Test Set.keys() with WeakMap objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const wm1: WeakMap<object, string> = new WeakMap();
      const wm2: WeakMap<object, string> = new WeakMap();
      const set = new Set([wm1, wm2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(wm1);
      expect(keys.next().value).assertEqual(wm2);
    });

    /**
     * @tc.name   testSetKeys0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_053
     * @tc.desc   Test Set.keys() with WeakSet objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const ws1 = new WeakSet();
      const ws2 = new WeakSet();
      const set = new Set([ws1, ws2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(ws1);
      expect(keys.next().value).assertEqual(ws2);
    });

    /**
     * @tc.name   testSetKeys0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_054
     * @tc.desc   Test Set.keys() with promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1 = Promise.resolve(1);
      const promise2 = Promise.reject(new Error('test'));
      const set = new Set([promise1, promise2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(promise1);
      expect(keys.next().value).assertEqual(promise2);
    });

    /**
     * @tc.name   testSetKeys0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_055
     * @tc.desc   Test Set.keys() with generators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0055()).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   testSetKeys0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_056
     * @tc.desc   Test Set.keys() with iterators from other collections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [1, 2, 3];
      const map = new Map([['a', 1]]);

      const set = new Set([arr.values(), map.keys()]);
      const keys = set.keys();

      expect(keys.next().value).assertDeepEquals(arr.values());
      expect(keys.next().value).assertDeepEquals(map.keys());
    });

    /**
     * @tc.name   testSetKeys0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_057
     * @tc.desc   Test Set.keys() with Error objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error1 = new Error('Error 1');
      const error2 = new TypeError('Type Error');
      const set = new Set([error1, error2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(error1);
      expect(keys.next().value).assertEqual(error2);
    });

    /**
     * @tc.name   testSetKeys0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_059
     * @tc.desc   Test Set.keys() with objects implementing valueOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: ValueOfInterface = {
        valueOf: () => 100
      };
      const obj2: ValueOfInterface = {
        valueOf: () => 100
      }; // Same valueOf result, different object
      const set = new Set([obj1, obj2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
      // valueOf doesn't affect Set equality checks
    });

    /**
     * @tc.name   testSetKeys0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_060
     * @tc.desc   Test Set.keys() with objects implementing toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: toStringInterface = { toString: () => 'same' };
      const obj2: toStringInterface = { toString: () => 'same' }; // Same toString result, different object
      const set = new Set([obj1, obj2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
      // toString doesn't affect Set equality checks
    });

    /**
     * @tc.name   testSetKeys0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_061
     * @tc.desc   Test Set.keys() with null prototype objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetKeysJs0061()).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   testSetKeys0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_062
     * @tc.desc   Test Set.keys() with boxed primitives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numObj = new Number(123);
      const strObj = new String('test');
      const boolObj = new Boolean(true);

      const set = new Set([numObj, strObj, boolObj]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(numObj);
      expect(keys.next().value).assertEqual(strObj);
      expect(keys.next().value).assertEqual(boolObj);
    });

    /**
     * @tc.name   testSetKeys0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_063
     * @tc.desc   Test Set.keys() with boxed vs unboxed primitives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numObj = new Number(123);
      const numPrimitive = 123;

      const set = new Set([numObj, numPrimitive]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(numObj);
      expect(keys.next().value).assertEqual(numPrimitive);
      // Boxed and unboxed are considered different
    });

    /**
     * @tc.name   testSetKeys0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_064
     * @tc.desc   Test Set.keys() with multiple NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([NaN, NaN, NaN, 1, NaN]);
      const keys = set.keys();
      let a: Number = keys.next().value;
      expect(keys.next().value).assertEqual(1);
      expect(keys.next().done).assertEqual(true);
      // All NaNs are considered equal
    });

    /**
     * @tc.name   testSetKeys0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_065
     * @tc.desc   Test Set.keys() with Infinity and -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set([Infinity, -Infinity, Infinity]);
      const keys = set.keys();

      expect(keys.next().value).assertEqual(Infinity);
      expect(keys.next().value).assertEqual(-Infinity);
      expect(keys.next().done).assertEqual(true);
    });


    /**
     * @tc.name   testSetKeys0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_067
     * @tc.desc   Test Set.keys() with objects having same JSON representation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_5 = { a: 1, b: 2 };
      const obj2: GeneratedObjectLiteralInterface_5 = { a: 1, b: 2 }; // Same JSON, different reference
      const set = new Set([obj1, obj2]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
    });

    /**
     * @tc.name   testSetKeys0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_068
     * @tc.desc   Test Set.keys() with iterating over a set of sets
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type NumberSet = Set<number>;

      const innerSetA: NumberSet = new Set([1, 2]);
      const innerSetB: NumberSet = new Set([3, 4]);

      const outerSet: Set<NumberSet> = new Set([innerSetA, innerSetB]);

      const keys: Iterator<NumberSet> = outerSet.keys();
      const firstKey: NumberSet | undefined = keys.next().value;
      const secondKey: NumberSet | undefined = keys.next().value;

      expect(firstKey).assertEqual(innerSetA);
      expect(secondKey).assertEqual(innerSetB);
      // expect(Array.from(firstKey)).assertEqual([1, 2]);
    });

    /**
     * @tc.name   testSetKeys0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_069
     * @tc.desc   Test Set.keys() with date objects after modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date = new Date('2023-01-01');
      const set = new Set([date]);

      date.setFullYear(2024); // Modify the date after insertion
      const keys = set.keys();
      const firstValue: Date = keys.next().value;

      expect(firstValue).assertEqual(date);
      expect(firstValue.getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.name   testSetKeys0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_070
     * @tc.desc   Test Set.keys() with multiple references to the same object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const sharedObj: GeneratedObjectLiteralInterface_3 = { name: 'shared' };
      const set = new Set([sharedObj, sharedObj, sharedObj]);

      const keys = set.keys();
      expect(keys.next().value).assertEqual(sharedObj);
      expect(keys.next().done).assertEqual(true);
      // Duplicate references are stored only once
    });

    /**
     * @tc.name   testSetKeys0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_071
     * @tc.desc   Test Set.keys() with objects having read-only properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface ReadonlyObj {
        readonly id: number;
        name: string;
      }

      const obj1: ReadonlyObj = { id: 1, name: 'test1' };
      const obj2: ReadonlyObj = { id: 2, name: 'test2' };
      const set: Set<ReadonlyObj> = new Set([obj1, obj2]);

      const keys: Iterator<ReadonlyObj> = set.keys();
      const firstVal: ReadonlyObj = keys.next().value;
      const secondVal: ReadonlyObj = keys.next().value;

      expect(firstVal).assertEqual(obj1);
      expect(secondVal).assertEqual(obj2);
      expect(firstVal?.id).assertEqual(1);
    });

    /**
     * @tc.name   testSetKeys0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_072
     * @tc.desc   Test Set.keys() with union type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type UnionType = string | number | boolean;
      const set: Set<UnionType> = new Set(['a', 123, true]);

      const keys: Iterator<UnionType> = set.keys();
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual(123);
      expect(keys.next().value).assertEqual(true);
    });


    /**
     * @tc.name   testSetKeys0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_074
     * @tc.desc   Test Set.keys() with optional properties objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface OptionalPropObj {
        name: string;
        age?: number;
      }

      const obj1: OptionalPropObj = { name: 'Alice' };
      const obj2: OptionalPropObj = { name: 'Bob', age: 20 };
      const set: Set<OptionalPropObj> = new Set([obj1, obj2]);

      const keys: Iterator<OptionalPropObj> = set.keys();
      const firstObj: OptionalPropObj = keys.next().value;
      const secondObj: OptionalPropObj = keys.next().value;

      expect(firstObj).assertEqual(obj1);
      expect(secondObj).assertEqual(obj2);
      expect(firstObj?.age).assertEqual(undefined);
      expect(secondObj?.age).assertEqual(20);
    });


    /**
     * @tc.name   testSetKeys0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_077
     * @tc.desc   Test Set.keys() with intersection type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Base {
        id: number;
      }

      interface Name extends Base { // 继承Base接口
        name: string;
      }

      const obj1: Name = { id: 1, name: 'X' };
      const obj2: Name = { id: 2, name: 'Y' };
      const set: Set<Name> = new Set([obj1, obj2]);

      const keys: Iterator<Name> = set.keys();
      const firstObj: Name | undefined = keys.next().value;
      expect(firstObj?.id).assertEqual(1);
      expect(firstObj?.name).assertEqual('X');
    });

    /**
     * @tc.name   testSetKeys0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_078
     * @tc.desc   Test Set.keys() with enum type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      enum Color { Red, Green, Blue }

      const set: Set<Color> = new Set([Color.Red, Color.Green]);

      const keys: Iterator<Color> = set.keys();
      expect(keys.next().value).assertEqual(Color.Red);
      expect(keys.next().value).assertEqual(Color.Green);
    });

    /**
     * @tc.name   testSetKeys0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_079
     * @tc.desc   Test Set.keys() with class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Person {
        public name: string;
        public age: number;

        constructor(name: string, age: number) {
          this.name = name;
          this.age = age;
        }
      }

      const person1: Person = new Person('Alice', 25);
      const person2: Person = new Person('Bob', 30);
      const set: Set<Person> = new Set([person1, person2]);

      const keys: Iterator<Person> = set.keys();
      const firstPerson: Person | undefined = keys.next().value;
      expect(firstPerson?.name).assertEqual('Alice');
      expect(keys.next().value?.name).assertEqual('Bob');
    });

    /**
     * @tc.name   testSetKeys0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_080
     * @tc.desc   Test Set.keys() with abstract class implementations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      abstract class Shape {
        abstract getArea(): number;
      }

      class Circle extends Shape {
        private radius: number;

        constructor(radius: number) {
          super();
          this.radius = radius;
        }

        getArea(): number {
          return Math.PI * this.radius**2;
        }
      }

      class Square extends Shape {
        private side: number;

        constructor(side: number) {
          super();
          this.side = side;
        }

        getArea(): number {
          return this.side**2;
        }
      }

      const circle: Shape = new Circle(5);
      const square: Shape = new Square(4);
      const set: Set<Shape> = new Set([circle, square]);

      const keys: Iterator<Shape> = set.keys();
      const firstShape: Shape | undefined = keys.next().value;
      expect(firstShape?.getArea()).assertEqual(Math.PI * 25);
    });

    /**
     * @tc.name   testSetKeys0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_081
     * @tc.desc   Test Set.keys() with generic class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Box<T> {
        public content: T;

        constructor(content: T) {
          this.content = content;
        }
      }

      const box1: Box<string> = new Box('apple');
      const box2: Box<number> = new Box(100);
      const set: Set<Box<string> | Box<number>> = new Set([box1, box2]);

      const keys: Iterator<Box<string> | Box<number>> = set.keys();
      const firstBox: Box<string> | Box<number> | undefined = keys.next().value;
      const secondBox: Box<string> | Box<number> | undefined = keys.next().value;

      expect(firstBox?.content).assertEqual('apple');
      expect(secondBox?.content).assertEqual(100);
    });

    /**
     * @tc.name   testSetKeys0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_083
     * @tc.desc   Test Set.keys() with nullable type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type NullableString = string | null;
      const set: Set<NullableString> = new Set(['a', null, 'b']);

      const keys: Iterator<NullableString> = set.keys();
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual(null);
      expect(keys.next().value).assertEqual('b');
    });

    /**
     * @tc.name   testSetKeys0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_084
     * @tc.desc   Test Set.keys() with non-null assertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type MaybeNumber = number | undefined;
      const num1: MaybeNumber = 10;
      const num2: MaybeNumber = 20;
      const set: Set<MaybeNumber> = new Set([num1, num2]);

      const keys: Iterator<MaybeNumber> = set.keys();
      const firstNum: MaybeNumber = keys.next().value!;
      const secondNum: MaybeNumber = keys.next().value!;

      expect(firstNum).assertEqual(10);
      expect(secondNum).assertEqual(20);
    });

    /**
     * @tc.name   testSetKeys0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_085
     * @tc.desc   Test Set.keys() with type assertion elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface Animal { type: string; }

      interface Dog extends Animal { bark: () => void; }

      const animal1: Animal = { type: 'dog' };
      const animal2: Animal = { type: 'cat' };
      const dog1 = animal1 as Dog;
      dog1.bark = () => console.log('woof');

      const set: Set<Dog> = new Set([dog1]);
      const keys: Iterator<Dog> = set.keys();
      const firstDog: Dog = keys.next().value!;
      expect(firstDog.type).assertEqual('dog');
    });

    /**
     * @tc.name   testSetKeys0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_086
     * @tc.desc   Test Set.keys() with never type in union
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type NeverUnion = string | never;
      const set: Set<NeverUnion> = new Set(['a', 'b']);

      const keys: Iterator<NeverUnion> = set.keys();
      expect(keys.next().value).assertEqual('a');
      expect(keys.next().value).assertEqual('b');
    });

    /**
     * @tc.name   testSetKeys0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_087
     * @tc.desc   Test Set.keys() with void type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type VoidType = void;
      const set: Set<VoidType> = new Set([undefined, undefined]);

      const keys: Iterator<VoidType> = set.keys();
      expect(keys.next().value).assertEqual(undefined);
      expect(keys.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeys0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_088
     * @tc.desc   Test Set.keys() with bigint literals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<bigint> = new Set([100n, 200n, 300n]);

      const keys: Iterator<bigint> = set.keys();
      expect(keys.next().value).assertEqual(100n);
      expect(keys.next().value).assertEqual(200n);
      expect(keys.next().value).assertEqual(300n);
    });

    /**
     * @tc.name   testSetKeys0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_089
     * @tc.desc   Test Set.keys() with template literal types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type Greeting = `Hello, ${string}`;
      const greeting1: Greeting = 'Hello, World' as Greeting;
      const greeting2: Greeting = 'Hello, TypeScript' as Greeting;
      const set: Set<Greeting> = new Set([greeting1, greeting2]);

      const keys: Iterator<Greeting> = set.keys();
      expect(keys.next().value).assertEqual('Hello, World');
      expect(keys.next().value).assertEqual('Hello, TypeScript');
    });

    /**
     * @tc.name   testSetKeys0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_092
     * @tc.desc   Test Set.keys() with recursive type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface RecursiveType {
        value: number;
        nested?: RecursiveType;
      };
      const item1: RecursiveType = { value: 1 };
      const item2: RecursiveType = { value: 2, nested: { value: 3 } };
      const set: Set<RecursiveType> = new Set([item1, item2]);

      const keys: Iterator<RecursiveType> = set.keys();
      const firstItem: RecursiveType = keys.next().value;
      const secondItem: RecursiveType = keys.next().value;

      expect(firstItem?.value).assertEqual(1);
      expect(secondItem?.nested?.value).assertEqual(3);
    });

    /**
     * @tc.name   testSetKeys0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_093
     * @tc.desc   Test Set.keys() with function types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type StringProcessor = (input: string) => string;
      const func1: StringProcessor = (s) => s.toUpperCase();
      const func2: StringProcessor = (s) => s.toLowerCase();
      const set: Set<StringProcessor> = new Set([func1, func2]);

      const keys: Iterator<StringProcessor> = set.keys();
      const firstFunc: StringProcessor = keys.next().value!;
      const secondFunc: StringProcessor = keys.next().value!;

      expect(firstFunc('test')).assertEqual('TEST');
      expect(secondFunc('TEST')).assertEqual('test');
    });

    /**
     * @tc.name   testSetKeys0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_094
     * @tc.desc   Test Set.keys() with parameter properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Car {
        public brand: string;
        private year: number;

        constructor(
          brand: string,
          year: number
        ) {
          this.brand = brand;
          this.year = year;
        }

        getYear(): number {
          return this.year;
        }
      }

      const car1: Car = new Car('Toyota', 2020);
      const car2: Car = new Car('Honda', 2022);
      const set: Set<Car> = new Set([car1, car2]);

      const keys: Iterator<Car> = set.keys();
      const firstCar: Car = keys.next().value;
      expect(firstCar?.brand).assertEqual('Toyota');
      expect(firstCar?.getYear()).assertEqual(2020);
    });

    /**
     * @tc.name   testSetKeys0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_095
     * @tc.desc   Test Set.keys() with static class properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Configuration {
        static version: string = '1.0.0';
        public name: string;

        constructor(name: string) {
          this.name = name;
        }
      }

      const config1: Configuration = new Configuration('dev');
      const config2: Configuration = new Configuration('prod');
      const set: Set<Configuration> = new Set([config1, config2]);

      const keys: Iterator<Configuration> = set.keys();
      const firstConfig: Configuration | undefined = keys.next().value;
      expect(firstConfig?.name).assertEqual('dev');
      expect(Configuration.version).assertEqual('1.0.0');
    });

    /**
     * @tc.name   testSetKeys0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_096
     * @tc.desc   Test Set.keys() with private class methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Counter {
        private count: number = 0;

        increment(): void {
          this.count++;
        }

        getCount(): number {
          return this.count;
        }
      }

      const counter1: Counter = new Counter();
      const counter2: Counter = new Counter();
      counter1.increment();
      const set: Set<Counter> = new Set([counter1, counter2]);

      const keys: Iterator<Counter> = set.keys();
      const firstCounter: Counter | undefined = keys.next().value;
      expect(firstCounter?.getCount()).assertEqual(1);
      expect(keys.next().value?.getCount()).assertEqual(0);
    });

    /**
     * @tc.name   testSetKeys0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_097
     * @tc.desc   Test Set.keys() with protected class members
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Parent {
        protected value: number;

        constructor(val: number) {
          this.value = val;
        }
      }

      class Child extends Parent {
        getValue(): number {
          return this.value;
        }
      }

      const child1: Child = new Child(10);
      const child2: Child = new Child(20);
      const set: Set<Child> = new Set([child1, child2]);

      const keys: Iterator<Child> = set.keys();
      const firstChild: Child | undefined = keys.next().value;
      expect(firstChild?.getValue()).assertEqual(10);
      expect(keys.next().value?.getValue()).assertEqual(20);
    });

    /**
     * @tc.name   testSetKeys0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_098
     * @tc.desc   Test Set.keys() with static methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MathOperations {
        static multiply(a: number, b: number): number {
          return a * b;
        }
      }

      const obj1: MathOperations = new MathOperations();
      const obj2: MathOperations = new MathOperations();
      const set: Set<MathOperations> = new Set([obj1, obj2]);

      const keys: Iterator<MathOperations> = set.keys();
      expect(keys.next().value).assertEqual(obj1);
      expect(keys.next().value).assertEqual(obj2);
      expect(MathOperations.multiply(3, 4)).assertEqual(12);
    });

    /**
     * @tc.name   testSetKeys0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_099
     * @tc.desc   Test Set.keys() with abstract methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      abstract class Device {
        abstract powerOn(): void;
      }

      class Phone extends Device {
        powerOn(): void {
          console.log('Phone powered on');
        }
      }

      class Laptop extends Device {
        powerOn(): void {
          console.log('Laptop powered on');
        }
      }

      const phone: Device = new Phone();
      const laptop: Device = new Laptop();
      const set: Set<Device> = new Set([phone, laptop]);

      const keys: Iterator<Device> = set.keys();
      expect(keys.next().value).assertEqual(phone);
      expect(keys.next().value).assertEqual(laptop);
    });

    /**
     * @tc.name   testSetKeys0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_SET_KEYS_100
     * @tc.desc   Test Set.keys() with generic functions as elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeys0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      type GenericFunc<T> = (input: T) => T;
      const func1: GenericFunc<number> = (x) => x * 2;
      const func2: GenericFunc<string> = (s) => s.repeat(2);
      const set: Set<GenericFunc<number> | GenericFunc<string>> = new Set([func1, func2]);

      const keys: Iterator<GenericFunc<number> | GenericFunc<string>> = set.keys();
      const firstFunc: GenericFunc<number> = keys.next().value!;
      const secondFunc: GenericFunc<string> = keys.next().value!;

      expect(firstFunc(5)).assertEqual(10);
      expect(secondFunc('ab')).assertEqual('abab');
    });

    /**
     * @tc.name   testSetValues001
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_001
     * @tc.desc   Test Set.values() iteration with basic string elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['alpha', 'beta', 'gamma']);
      const values: Iterator<string> = set.values();

      expect(values.next().value).assertEqual('alpha');
      expect(values.next().value).assertEqual('beta');
      expect(values.next().value).assertEqual('gamma');
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues002
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_002
     * @tc.desc   Test Set.values() iteration with basic number elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([5, 10, 15, 20]);
      const values: Iterator<number> = set.values();

      expect(values.next().value).assertEqual(5);
      expect(values.next().value).assertEqual(10);
      expect(values.next().value).assertEqual(15);
      expect(values.next().value).assertEqual(20);
    });

    /**
     * @tc.name   testSetValues003
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_003
     * @tc.desc   Test Set.values() with empty Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<boolean> = new Set();
      const values: Iterator<boolean> = set.values();

      expect(values.next().done).assertEqual(true);
      expect(values.next().value).assertEqual(undefined);
    });

    /**
     * @tc.name   testSetValues004
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_004
     * @tc.desc   Test that Set.values() maintains insertion order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['first', 'second', 'third']);
      const values: Iterator<string> = set.values();
      const result: string[] = [];

      let current = values.next();
      while (!current.done) {
        result.push(current.value);
        current = values.next();
      }

      expect(result[0]).assertEqual('first');
      expect(result[1]).assertEqual('second');
      expect(result[2]).assertEqual('third');
    });

    /**
     * @tc.name   testSetValues005
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_005
     * @tc.desc   Test that Set.values() filters duplicate elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([3, 3, 6, 6, 9]);
      const values: Iterator<number> = set.values();

      expect(values.next().value).assertEqual(3);
      expect(values.next().value).assertEqual(6);
      expect(values.next().value).assertEqual(9);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues006
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_006
     * @tc.desc   Test Set.values() with boolean elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<boolean> = new Set([true, false, true]);
      const values: Iterator<boolean> = set.values();

      expect(values.next().value).assertEqual(true);
      expect(values.next().value).assertEqual(false);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues007
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_007
     * @tc.desc   Test Set.values() with plain object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: TestObject = { id: 1, data: 'test1' };
      const obj2: TestObject = { id: 2, data: 'test2' };
      const set: Set<TestObject> = new Set([obj1, obj2]);
      const values: Iterator<TestObject> = set.values();

      const firstVal: TestObject = values.next().value;
      const secondVal: TestObject = values.next().value;

      expect(firstVal).assertEqual(obj1);
      expect(secondVal).assertEqual(obj2);
      expect(firstVal?.data).assertEqual('test1');
    });

    /**
     * @tc.name   testSetValues008
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_008
     * @tc.desc   Test Set.values() with NaN elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([NaN, NaN, 7]);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value;
      expect(isNaN(firstVal)).assertEqual(true);
      expect(values.next().value).assertEqual(7);
    });

    /**
     * @tc.name   testSetValues009
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_009
     * @tc.desc   Test Set.values() with 0 and -0 elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([0, -0, 4]);
      const values: Iterator<number> = set.values();

      expect(values.next().value).assertEqual(0);
      expect(values.next().value).assertEqual(4);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues010
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_010
     * @tc.desc   Test independence of multiple iterators from Set.values()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      const values1: Iterator<string> = set.values();
      const values2: Iterator<string> = set.values();

      expect(values1.next().value).assertEqual('a');
      expect(values1.next().value).assertEqual('b');
      expect(values2.next().value).assertEqual('a');
      expect(values1.next().value).assertEqual('c');
      expect(values2.next().value).assertEqual('b');
    });

    /**
     * @tc.name   testSetValues011
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_011
     * @tc.desc   Test Set.values() after adding elements dynamically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2]);
      set.add(3);
      set.add(4);
      const values: Iterator<number> = set.values();

      expect(values.next().value).assertEqual(1);
      expect(values.next().value).assertEqual(2);
      expect(values.next().value).assertEqual(3);
      expect(values.next().value).assertEqual(4);
    });

    /**
     * @tc.name   testSetValues012
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_012
     * @tc.desc   Test Set.values() after deleting elements dynamically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['x', 'y', 'z']);
      set.delete('y');
      const values: Iterator<string> = set.values();

      expect(values.next().value).assertEqual('x');
      expect(values.next().value).assertEqual('z');
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues013
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_013
     * @tc.desc   Test Set.values() with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<bigint> = new Set([100n, 200n, 300n]);
      const values: Iterator<bigint> = set.values();

      expect(values.next().value).assertEqual(100n);
      expect(values.next().value).assertEqual(200n);
      expect(values.next().value).assertEqual(300n);
    });

    /**
     * @tc.name   testSetValues014
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_014
     * @tc.desc   Test Set.values() with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs014()).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues015
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_015
     * @tc.desc   Test Set.values() state after full iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();

      while (!values.next().done) {
      }
      expect(values.next().done).assertEqual(true);
      expect(values.next().value).assertEqual(undefined);
    });

    /**
     * @tc.name   testSetValues016
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_016
     * @tc.desc   Test Set.values() with Date object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date('2024-01-01');
      const date2: Date = new Date('2024-01-02');
      const set: Set<Date> = new Set([date1, date2]);
      const values: Iterator<Date> = set.values();

      const firstDate: Date = values.next().value;
      const secondDate: Date = values.next().value;

      expect(firstDate).assertEqual(date1);
      expect(secondDate).assertEqual(date2);
      expect(firstDate?.toISOString()).assertEqual('2024-01-01T00:00:00.000Z');
    });

    /**
     * @tc.name   testSetValues017
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_017
     * @tc.desc   Test Set.values() with RegExp object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const reg1: RegExp = /abc/;
      const reg2: RegExp = /def/g;
      const set: Set<RegExp> = new Set([reg1, reg2]);
      const values: Iterator<RegExp> = set.values();

      const firstReg: RegExp = values.next().value;
      const secondReg: RegExp = values.next().value;

      expect(firstReg).assertEqual(reg1);
      expect(secondReg).assertEqual(reg2);
      expect(firstReg?.test('abc')).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues018
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_018
     * @tc.desc   Test converting Set.values() iterator to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      const values: Iterator<string> = set.values();
      const result: string[] = [];

      let current = values.next();
      while (!current.done) {
        result.push(current.value);
        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.name   testSetValues019
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_019
     * @tc.desc   Test iterating Set.values() with for...of loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([10, 20, 30]);
      const values: Iterator<number> = set.values();
      const result: number[] = [];

      let current: IteratorResult<number> = values.next();
      while (!current.done) {
        const val: number = current.value!;
        result.push(val);
        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name   testSetValues020
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_020
     * @tc.desc   Test SameValueZero comparison via Set.values()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: TestObject = { id: 1, data: 'same' };
      const obj2: TestObject = { id: 1, data: 'same' };
      const set: Set<TestObject> = new Set([obj1, obj2]);
      const values: Iterator<TestObject> = set.values();

      expect(values.next().value).assertEqual(obj1);
      expect(values.next().value).assertEqual(obj2);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues021
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_021
     * @tc.desc   Test Set.values() with large dataset (1000+ elements)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetValues021', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      for (let i = 0; i < 1000; i++) {
        set.add(i);
      }

      const values: Iterator<number> = set.values();
      let count = 0;
      let current = values.next();

      while (!current.done) {
        count++;
        current = values.next();
      }

      expect(count).assertEqual(1000);
    });

    /**
     * @tc.name   testSetValues022
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_022
     * @tc.desc   Test Set.values() after clear() operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      set.clear();
      const values: Iterator<string> = set.values();

      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues023
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_023
     * @tc.desc   Test equivalence of Set.values() and Set.keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();
      const keys: Iterator<number> = set.keys();

      expect(values.next().value).assertEqual(keys.next().value);
      expect(values.next().value).assertEqual(keys.next().value);
      expect(values.next().value).assertEqual(keys.next().value);
    });

    /**
     * @tc.name   testSetValues024
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_024
     * @tc.desc   Test explicit type annotation for Set.values() iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['test']);
      const values: Iterator<string> = set.values();
      const value: string | undefined = values.next().value;

      expect(value).assertEqual('test');
    });

    /**
     * @tc.name   testSetValues026
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_026
     * @tc.desc   Test Set.values() with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = () => 'function1';
      const func2 = () => 'function2';
      const set: Set<() => string> = new Set([func1, func2]);
      const values: Iterator<() => string> = set.values();

      const firstFunc: () => string = values.next().value;
      const secondFunc: () => string = values.next().value;

      expect(firstFunc).assertEqual(func1);
      expect(secondFunc).assertEqual(func2);
      expect(firstFunc?.()).assertEqual('function1');
    });

    /**
     * @tc.name   testSetValues027
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_027
     * @tc.desc   Test partial iteration with Set.values()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['one', 'two', 'three', 'four']);
      const values: Iterator<string> = set.values();

      expect(values.next().value).assertEqual('one');
      expect(values.next().value).assertEqual('two');
      // Stop iteration halfway
      expect(values.next().done).assertEqual(false);
    });

    /**
     * @tc.name   testSetValues028
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_028
     * @tc.desc   Test Set.values() with null and undefined elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<null | undefined> = new Set([null, undefined, null]);
      const values: Iterator<null | undefined> = set.values();

      expect(values.next().value).assertEqual(null);
      expect(values.next().value).assertEqual(undefined);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues029
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_029
     * @tc.desc   Test chained iteration with Set.values()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();

      const first = values.next();
      expect(first.value).assertEqual(1);
      expect(first.done).assertEqual(false);

      const second = values.next();
      expect(second.value).assertEqual(2);
      expect(second.done).assertEqual(false);

      const third = values.next();
      expect(third.value).assertEqual(3);
      expect(third.done).assertEqual(false);

      const done = values.next();
      expect(done.value).assertEqual(undefined);
      expect(done.done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues030
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_030
     * @tc.desc   Test Set.values() with mixed type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mixedSet: Set<string | number | boolean> = new Set(['text', 42, true]);
      const values: Iterator<string | number | boolean> = mixedSet.values();

      expect(values.next().value).assertEqual('text');
      expect(values.next().value).assertEqual(42);
      expect(values.next().value).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues031
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_031
     * @tc.desc   Test Set.values() with elements added after iterator creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2]);
      const values: Iterator<number> = set.values();

      // Add elements after iterator creation
      set.add(3);
      set.add(4);

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;

      expect(firstVal).assertEqual(1);
      expect(secondVal).assertEqual(2);
      expect(thirdVal).assertEqual(3);
    });

    /**
     * @tc.name   testSetValues032
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_032
     * @tc.desc   Test Set.values() with elements deleted after iterator creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      const values: Iterator<string> = set.values();

      // Delete element after iterator creation
      set.delete('b');

      const firstVal: string = values.next().value!;
      const secondVal: string | undefined = values.next().value;

      expect(firstVal).assertEqual('a');
      expect(secondVal).assertEqual('c');
    });

    /**
     * @tc.name   testSetValues033
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_033
     * @tc.desc   Test Set.values() with iterator reusability
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([10, 20]);
      const values1: Iterator<number> = set.values();
      const values2: Iterator<number> = set.values();

      // Traverse first iterator
      const val1: number = values1.next().value!;
      const val2: number = values1.next().value!;

      // Second iterator should start from beginning
      const val3: number = values2.next().value!;

      expect(val1).assertEqual(10);
      expect(val2).assertEqual(20);
      expect(val3).assertEqual(10);
    });

    /**
     * @tc.name   testSetValues034
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_034
     * @tc.desc   Test Set.values() with deeply nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs034()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testSetValues035
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_035
     * @tc.desc   Test Set.values() with class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const instance1: TestClass = new TestClass('test1', 1);
      const instance2: TestClass = new TestClass('test2', 2);
      const set: Set<TestClass> = new Set([instance1, instance2]);
      const values: Iterator<TestClass> = set.values();

      const firstVal: TestClass = values.next().value!;
      const secondVal: TestClass = values.next().value!;

      expect(firstVal.name).assertEqual('test1');
      expect(secondVal.version).assertEqual(2);
    });

    /**
     * @tc.name   testSetValues036
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_036
     * @tc.desc   Test Set.values() with enum values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<TestEnum> = new Set([TestEnum.Option1, TestEnum.Option2]);
      const values: Iterator<TestEnum> = set.values();

      const firstVal: TestEnum = values.next().value!;
      const secondVal: TestEnum = values.next().value!;

      expect(firstVal).assertEqual(TestEnum.Option1);
      expect(secondVal).assertEqual(TestEnum.Option2);
    });

    /**
     * @tc.name   testSetValues037
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_037
     * @tc.desc   Test Set.values() with mixed primitive types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string | number | boolean> = new Set(['text', 100, true]);
      const values: Iterator<string | number | boolean> = set.values();

      const firstVal: string | number | boolean = values.next().value!;
      const secondVal: string | number | boolean = values.next().value!;
      const thirdVal: string | number | boolean = values.next().value!;

      expect(firstVal).assertEqual('text');
      expect(secondVal).assertEqual(100);
      expect(thirdVal).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues038
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_038
     * @tc.desc   Test Set.values() with very large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([Number.MAX_SAFE_INTEGER, Number.MAX_VALUE]);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;

      expect(firstVal).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(secondVal).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name   testSetValues039
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_039
     * @tc.desc   Test Set.values() with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([-1, -5, -10]);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;

      expect(firstVal).assertEqual(-1);
      expect(secondVal).assertEqual(-5);
      expect(thirdVal).assertEqual(-10);
    });

    /**
     * @tc.name   testSetValues040
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_040
     * @tc.desc   Test Set.values() with empty strings and whitespace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['', ' ', '  ']);
      const values: Iterator<string> = set.values();

      const firstVal: string = values.next().value!;
      const secondVal: string = values.next().value!;
      const thirdVal: string = values.next().value!;

      expect(firstVal).assertEqual('');
      expect(secondVal).assertEqual(' ');
      expect(thirdVal).assertEqual('  ');
    });

    /**
     * @tc.name   testSetValues041
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_041
     * @tc.desc   Test Set.values() after multiple add/delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      set.delete(2);
      set.add(4);
      set.add(5);
      set.delete(3);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;

      expect(firstVal).assertEqual(1);
      expect(secondVal).assertEqual(4);
      expect(thirdVal).assertEqual(5);
    });

    /**
     * @tc.name   testSetValues042
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_042
     * @tc.desc   Test Set.values() with Symbol.iterator polyfill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      const values: Iterator<string> = set.values();
      const result: string[] = [];

      let current: IteratorResult<string> = values.next();
      while (!current.done) {
        const currentVal: string = current.value!;
        result.push(currentVal);
        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
    });

    /**
     * @tc.name   testSetValues043
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_043
     * @tc.desc   Test Set.values() with sparse array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Create sparse array
      const sparseArray: number[] = [];
      sparseArray[0] = 10;
      sparseArray[5] = 20;
      sparseArray[10] = 30;

      const set: Set<number> = new Set(sparseArray);
      const values: Iterator<number> = set.values();

      const firstVal: number = values.next().value!;
      const secondVal: number = values.next().value!;
      const thirdVal: number = values.next().value!;
      const forthVal: number = values.next().value!;

      expect(firstVal).assertEqual(10);
      expect(secondVal).assertEqual(undefined);
      expect(thirdVal).assertEqual(20);
      expect(forthVal).assertEqual(30);

    });

    /**
     * @tc.name   testSetValues044
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_044
     * @tc.desc   Test Set.values() with frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs044()).assertEqual(1);
    });

    /**
     * @tc.name   testSetValues045
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_045
     * @tc.desc   Test Set.values() with very large dataset iteration performance
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetValues045', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const size: number = 10000;

      // Populate set
      for (let i = 0; i < size; i++) {
        set.add(i);
      }

      const values: Iterator<number> = set.values();
      const startTime: number = Date.now();
      let count: number = 0;

      // Iterate through all values
      let current: IteratorResult<number> = values.next();
      while (!current.done) {
        count++;
        current = values.next();
      }

      const endTime: number = Date.now();
      const duration: number = endTime - startTime;

      expect(count).assertEqual(size);
      // Performance assertion: Should complete in under 100ms
      expect(duration).assertLess(100);
    });

    /**
     * @tc.name   testSetValues046
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_046
     * @tc.desc   Test Set.values() with null prototype objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs046()).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues047
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_047
     * @tc.desc   Test Set.values() with regex pattern objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1: RegExp = /test/i;
      const regex2: RegExp = /pattern/g;
      const set: Set<RegExp> = new Set([regex1, regex2]);
      const values: Iterator<RegExp> = set.values();

      const firstVal: RegExp = values.next().value!;
      const secondVal: RegExp = values.next().value!;

      expect(firstVal.test('TEST')).assertEqual(true);
      expect(secondVal.flags).assertEqual('g');
    });

    /**
     * @tc.name   testSetValues048
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_048
     * @tc.desc   Test Set.values() with Date objects representing same time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date('2024-01-01');
      const date2: Date = new Date('2024-01-01'); // Same time but different instance
      const set: Set<Date> = new Set([date1, date2]);
      const values: Iterator<Date> = set.values();

      const firstVal: Date = values.next().value!;
      const secondVal: Date = values.next().value!;

      expect(firstVal).assertEqual(date1);
      expect(secondVal).assertEqual(date2);
    });

    /**
     * @tc.name   testSetValues049
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_049
     * @tc.desc   Test Set.values() with Map objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: Map<number, string> = new Map([[1, 'one']]);
      const map2: Map<number, string> = new Map([[2, 'two']]);
      const set: Set<Map<number, string>> = new Set([map1, map2]);
      const values: Iterator<Map<number, string>> = set.values();

      const firstVal: Map<number, string> = values.next().value!;
      const secondVal: Map<number, string> = values.next().value!;

      expect(firstVal.get(1)).assertEqual('one');
      expect(secondVal.get(2)).assertEqual('two');
    });

    /**
     * @tc.name   testSetValues050
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_050
     * @tc.desc   Test Set.values() with Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const innerSet1: Set<number> = new Set([1, 2]);
      const innerSet2: Set<number> = new Set([3, 4]);
      const set: Set<Set<number>> = new Set([innerSet1, innerSet2]);
      const values: Iterator<Set<number>> = set.values();

      const firstVal: Set<number> = values.next().value!;
      const secondVal: Set<number> = values.next().value!;

      expect(firstVal.has(1)).assertEqual(true);
      expect(secondVal.size).assertEqual(2);
    });

    /**
     * @tc.name   testSetValues051
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_051
     * @tc.desc   Test Set.values() with function objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1: () => string = () => 'function 1';
      const func2: () => string = () => 'function 2';
      const set: Set<() => string> = new Set([func1, func2]);
      const values: Iterator<() => string> = set.values();

      const firstVal: () => string = values.next().value!;
      const secondVal: () => string = values.next().value!;

      expect(firstVal()).assertEqual('function 1');
      expect(secondVal()).assertEqual('function 2');
    });

    /**
     * @tc.name   testSetValues052
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_052
     * @tc.desc   Test Set.values() with generator functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs052()).assertDeepEquals([1, 3]);
    });

    /**
     * @tc.name   testSetValues053
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_053
     * @tc.desc   Test Set.values() with Uint8Array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: Uint8Array = new Uint8Array([1, 2, 3]);
      const arr2: Uint8Array = new Uint8Array([4, 5, 6]);
      const set: Set<Uint8Array> = new Set([arr1, arr2]);
      const values: Iterator<Uint8Array> = set.values();

      const firstVal: Uint8Array = values.next().value!;
      const secondVal: Uint8Array = values.next().value!;

      expect(firstVal[0]).assertEqual(1);
      expect(secondVal.length).assertEqual(3);
    });

    /**
     * @tc.name   testSetValues054
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_054
     * @tc.desc   Test Set.values() with null and undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<null | undefined> = new Set([null, undefined, null]);
      const values: Iterator<null | undefined> = set.values();

      const firstVal: null | undefined = values.next().value!;
      const secondVal: null | undefined = values.next().value!;

      expect(firstVal).assertEqual(null);
      expect(secondVal).assertEqual(undefined);
    });

    /**
     * @tc.name   testSetValues055
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_055
     * @tc.desc   Test Set.values() with unique string objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strObj1: String = new String('test1');
      const strObj2: String = new String('test1'); // Same value, different object
      const set: Set<String> = new Set([strObj1, strObj2]);
      const values: Iterator<String> = set.values();

      const firstVal: String = values.next().value!;
      const secondVal: String = values.next().value!;

      expect(firstVal).assertEqual(strObj1);
      expect(secondVal).assertEqual(strObj2);
      expect(firstVal.toString()).assertEqual('test1');
    });

    /**
     * @tc.name   testSetValues056
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_056
     * @tc.desc   Test Set.values() with number objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const numObj1: Number = new Number(10);
      const numObj2: Number = new Number(20);
      const set: Set<Number> = new Set([numObj1, numObj2]);
      const values: Iterator<Number> = set.values();

      const firstVal: Number = values.next().value!;
      const secondVal: Number = values.next().value!;

      expect(firstVal.valueOf()).assertEqual(10);
      expect(secondVal.valueOf()).assertEqual(20);
    });

    /**
     * @tc.name   testSetValues057
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_057
     * @tc.desc   Test Set.values() with boolean objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const boolObj1: Boolean = new Boolean(true);
      const boolObj2: Boolean = new Boolean(false);
      const set: Set<Boolean> = new Set([boolObj1, boolObj2]);
      const values: Iterator<Boolean> = set.values();

      const firstVal: Boolean = values.next().value!;
      const secondVal: Boolean = values.next().value!;

      expect(firstVal.valueOf()).assertEqual(true);
      expect(secondVal.valueOf()).assertEqual(false);
    });

    /**
     * @tc.name   testSetValues058
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_058
     * @tc.desc   Test Set.values() with iterating and modifying simultaneously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();
      const result: number[] = [];

      let current: IteratorResult<number> = values.next();
      while (!current.done) {
        const val: number = current.value!;
        result.push(val);

        // Modify set during iteration
        if (val === 2) {
          set.add(4);
          set.delete(3);
        }

        current = values.next();
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.name   testSetValues059
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_059
     * @tc.desc   Test Set.values() with objects containing Symbols as properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetValuesJs059()).assertDeepEquals(['value1', 'value2']);
    });

    /**
     * @tc.name   testSetValues060
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_060
     * @tc.desc   Test Set.values() with maximum capacity elements
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetValues060', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const maxElements: number = 1000;

      // Add maximum elements
      for (let i = 0; i < maxElements; i++) {
        set.add(i);
      }

      const values: Iterator<number> = set.values();
      let count: number = 0;

      // Verify we can iterate through all elements
      let current: IteratorResult<number> = values.next();
      while (!current.done && count < maxElements) {
        count++;
        current = values.next();
      }
      expect(count).assertEqual(maxElements);
    });

    /**
     * @tc.name   testSetValues061
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_061
     * @tc.desc   Test Set.values() with elements added through constructor and add()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Initialize with constructor and add more elements
      const set: Set<string> = new Set(['init1', 'init2']);
      set.add('added1');
      set.add('added2');
      set.add('init1'); // Duplicate

      const values: Iterator<string> = set.values();
      const result: string[] = [];
      let next: IteratorResult<string>;

      while (!(next = values.next()).done) {
        result.push(next.value);
      }

      // Verify all unique elements in insertion order
      expect(result.length).assertEqual(4);
      expect(result).assertContain('init1');
      expect(result).assertContain('init2');
      expect(result).assertContain('added1');
      expect(result).assertContain('added2');
    });

    /**
     * @tc.name   testSetValues062
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_062
     * @tc.desc   Test Set.values() after clear() operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3, 4]);
      set.clear(); // Clear all elements

      const values: Iterator<number> = set.values();
      const firstResult: IteratorResult<number> = values.next();

      // Verify iterator has no values after clear
      expect(firstResult.done).assertEqual(true);
      expect(firstResult.value).assertUndefined();
    });

    /**
     * @tc.name   testSetValues063
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_063
     * @tc.desc   Test Set.values() with elements modified after insertion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: DataObject = { id: 1, content: 'original' };
      const obj2: DataObject = { id: 2, content: 'original' };
      const set: Set<DataObject> = new Set([obj1, obj2]);

      // Modify objects after insertion
      obj1.content = 'modified1';
      obj2.content = 'modified2';

      const values: Iterator<DataObject> = set.values();
      const result: DataObject[] = [];
      let next: IteratorResult<DataObject>;

      while (!(next = values.next()).done) {
        result.push(next.value);
      }

      // Verify values reflect object modifications
      expect(result.length).assertEqual(2);
      expect(result[0].content).assertEqual('modified1');
      expect(result[1].content).assertEqual('modified2');
    });

    /**
     * @tc.name   testSetValues065
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_065
     * @tc.desc   Test Set.values() with String objects and primitive strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strObj: String = new String('object');
      const strPrim: string = 'primitive';
      const set: Set<String | string> = new Set([strObj, strPrim]);

      const values: Iterator<String | string> = set.values();
      const firstVal: String | string = values.next().value!;
      const secondVal: String | string = values.next().value!;

      // Verify different string types are treated as distinct
      expect(firstVal).assertDeepEquals(strObj);
      expect(secondVal).assertDeepEquals(strPrim);
      expect(firstVal.valueOf()).assertEqual('object');
      expect(secondVal.valueOf()).assertEqual('primitive');
    });

    /**
     * @tc.name   testSetValues066
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_066
     * @tc.desc   Test Set.values() with elements removed during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([10, 20, 30, 40, 50]);
      const values: Iterator<number> = set.values();
      const result: number[] = [];
      let next: IteratorResult<number>;

      // Iterate and remove elements that meet condition
      while (!(next = values.next()).done) {
        result.push(next.value);
        if (next.value === 30) {
          set.delete(40); // Remove upcoming element
          set.delete(20); // Remove already iterated element
        }
      }

      // Verify iterator behavior during concurrent modification
      expect(result).assertDeepEquals([10, 20, 30, 50]);
      expect(set.size).assertEqual(3); // 10,30,50 remain
    });

    /**
     * @tc.name   testSetValues067
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_067
     * @tc.desc   Test Set.values() with custom class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const item1: CustomItem = new CustomItem('A', 100);
      const item2: CustomItem = new CustomItem('B', 200);
      const item3: CustomItem = new CustomItem('A', 100); // Same values, different instance
      const set: Set<CustomItem> = new Set([item1, item2, item3]);

      // Collect values using forEach
      const valuesFromForEach: CustomItem[] = [];
      set.forEach(item => valuesFromForEach.push(item));

      // Collect values using values() iterator
      const valuesFromIterator: CustomItem[] = Array.from(set.values());

      // Verify both methods return same elements in same order
      expect(valuesFromIterator.length).assertEqual(3);
      expect(valuesFromIterator).assertDeepEquals(valuesFromForEach);
      expect(valuesFromIterator[0]).assertDeepEquals(item1);
      expect(valuesFromIterator[1]).assertDeepEquals(item2);
      expect(valuesFromIterator[2]).assertDeepEquals(item3);
    });


    /**
     * @tc.name   testSetValues069
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_069
     * @tc.desc   Test Set.values() with large dataset and conversion to Array
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetValues069', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const targetSize: number = 1000;

      // Populate set with unique numbers
      for (let i = 0; i < targetSize; i++) {
        set.add(i);
      }

      // Measure time to convert values iterator to array
      const startTime: number = Date.now();
      const valuesArray: number[] = Array.from(set.values());
      const conversionTime: number = Date.now() - startTime;

      // Verify array content matches set
      expect(valuesArray.length).assertEqual(targetSize);
      expect(valuesArray[0]).assertEqual(0);
      expect(valuesArray[targetSize - 1]).assertEqual(targetSize - 1);
    });

    /**
     * @tc.name   testSetValues070
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_070
     * @tc.desc   Test Set.values() with nested Set objects as elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const innerSet1: Set<string> = new Set(['a', 'b']);
      const innerSet2: Set<string> = new Set(['c', 'd']);
      const outerSet: Set<Set<string>> = new Set([innerSet1, innerSet2]);

      const values: Iterator<Set<string>> = outerSet.values();
      const firstInnerSet: Set<string> = values.next().value!;
      const secondInnerSet: Set<string> = values.next().value!;

      // Verify inner sets are returned correctly
      expect(firstInnerSet).assertDeepEquals(innerSet1);
      expect(secondInnerSet).assertDeepEquals(innerSet2);
      expect(Array.from(firstInnerSet)).assertDeepEquals(['a', 'b']);
      expect(Array.from(secondInnerSet)).assertDeepEquals(['c', 'd']);

      // Modify inner set and verify changes are reflected
      innerSet1.add('e');
      expect(Array.from(firstInnerSet)).assertDeepEquals(['a', 'b', 'e']);
    });

    /**
     * @tc.name   testSetValues071
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_071
     * @tc.desc   Test Set.values() with elements added/removed before and during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      const values: Iterator<number> = set.values();

      // Initial state
      expect(values.next().value).assertEqual(1);

      // Modify during iteration
      set.delete(2);
      set.add(4);
      set.add(5);

      // Continue iteration
      expect(values.next().value).assertEqual(3); // Original element remains
      expect(values.next().value).assertEqual(4); // New element added
      expect(values.next().done).assertEqual(false);
      expect(values.next().done).assertEqual(true);

      // Verify final state
      expect(Array.from(set.values())).assertDeepEquals([1, 3, 4, 5]);
    });

    /**
     * @tc.name   testSetValues072
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_072
     * @tc.desc   Test Set.values() with ArrayBuffer and TypedArray elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer1: ArrayBuffer = new ArrayBuffer(8);
      const buffer2: ArrayBuffer = new ArrayBuffer(8);
      const view1: Uint32Array = new Uint32Array(buffer1);
      const view2: Uint32Array = new Uint32Array(buffer2);

      view1.set([0x12345678, 0x87654321]);
      view2.set([0x12345678, 0x87654321]);

      const set: Set<ArrayBuffer | Uint32Array> = new Set([buffer1, view1, buffer2, view2]);
      const values: Iterator<ArrayBuffer | Uint32Array> = set.values();

      const result: (ArrayBuffer | Uint32Array)[] = [];
      let next: IteratorResult<ArrayBuffer | Uint32Array>;
      while (!(next = values.next()).done) {
        result.push(next.value);
      }

      expect(result.length).assertEqual(4);
      expect(result[0]).assertDeepEquals(buffer1);
      expect(result[1]).assertDeepEquals(view1);
      expect(result[2]).assertDeepEquals(buffer2);
      expect(result[3]).assertDeepEquals(view2);
    });

    /**
     * @tc.name   testSetValues073
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_073
     * @tc.desc   Test Set.values() with objects containing Symbols as properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs073()).assertDeepEquals([2, 'value1', 'value2']);
    });

    /**
     * @tc.name   testSetValues074
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_074
     * @tc.desc   Test Set.values() with mixed Date objects and timestamps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date('2024-01-01');
      const date2: Date = new Date('2024-01-01'); // Same time, different instance
      const timestamp: number = date1.getTime();

      const set: Set<Date | number> = new Set([date1, date2, timestamp]);
      const values: Iterator<Date | number> = set.values();

      expect(values.next().value).assertDeepEquals(date1);
      expect(values.next().value).assertDeepEquals(date2);
      expect(values.next().value).assertEqual(timestamp);
      expect(values.next().done).assertEqual(true);
    });

    /**
     * @tc.name   testSetValues075
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_075
     * @tc.desc   Test Set.values() after multiple add/delete cycles
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set();

      // Complex modification sequence
      set.add('a');
      set.add('b');
      set.delete('a');
      set.add('c');
      set.add('a');
      set.delete('b');
      set.add('d');
      set.delete('c');
      set.add('b');
      set.add('e');

      const values: string[] = Array.from(set.values());

      // Verify final values in insertion order
      expect(values).assertDeepEquals(['a', 'd', 'b', 'e']);
    });

    /**
     * @tc.name   testSetValues077
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_077
     * @tc.desc   Test Set.values() with nested objects that modify during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs077()).assertDeepEquals(['modified1', 'modified2']);
    });

    /**
     * @tc.name   testSetValues078
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_078
     * @tc.desc   Test Set.values() with WeakRef objects as elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Define interface for weak reference targets
      interface RefTarget { data: string; }

      const target1: RefTarget = { data: 'target1' };
      const target2: RefTarget = { data: 'target2' };
      const ref1: WeakRef<RefTarget> = new WeakRef(target1);
      const ref2: WeakRef<RefTarget> = new WeakRef(target2);
      const ref3: WeakRef<RefTarget> = new WeakRef(target1);

      const set: Set<WeakRef<RefTarget>> = new Set([ref1, ref2, ref3]);
      const values: WeakRef<RefTarget>[] = Array.from(set.values());

      expect(values.length).assertEqual(3);
      expect(values[0].deref()?.data).assertEqual('target1');
      expect(values[1].deref()?.data).assertEqual('target2');
      expect(values[2].deref()?.data).assertEqual('target1');
    });

    /**
     * @tc.name   testSetValues079
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_079
     * @tc.desc   Test Set.values() with mixed enum values and their numeric equivalents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<Status | number> = new Set([
        Status.PENDING,
        0, // Numeric equivalent of PENDING
        Status.PROCESSING,
        1, // Numeric equivalent of PROCESSING
        Status.COMPLETED
      ]);

      const values: (Status | number)[] = Array.from(set.values());

      // Enum values and numbers are treated as distinct
      expect(values.length).assertEqual(3);
      expect(values).assertContain(Status.PENDING);
      expect(values).assertContain(0);
      expect(values).assertContain(Status.PROCESSING);
      expect(values).assertContain(1);
      expect(values).assertContain(Status.COMPLETED);
    });

    /**
     * @tc.name   testSetValues080
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_080
     * @tc.desc   Test Set.values() with very large string elements (100k+ characters)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetValues080', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      // Generate large strings
      const str1: string = 'a'.repeat(100000);
      const str2: string = 'b'.repeat(100000);
      const str3: string = 'a'.repeat(100000); // Duplicate of str1

      const set: Set<string> = new Set([str1, str2, str3]);
      const values: string[] = Array.from(set.values());

      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(str1);
      expect(values[1]).assertEqual(str2);
      expect(values[0].length).assertEqual(100000);
    });

    /**
     * @tc.name   testSetValues081
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_081
     * @tc.desc   Test Set.values() with objects that override valueOf()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class CustomNumber {
        private num: number;

        constructor(num: number) {
          this.num = num;
        }

        valueOf(): number {
          return this.num;
        }
      }

      const num1: CustomNumber = new CustomNumber(10);
      const num2: CustomNumber = new CustomNumber(20);
      const num3: CustomNumber = new CustomNumber(10); // Same value, different instance

      const set: Set<CustomNumber> = new Set([num1, num2, num3]);
      const values: CustomNumber[] = Array.from(set.values());

      // Set uses reference equality, not valueOf()
      expect(values.length).assertEqual(3);
      expect(values[0].valueOf()).assertEqual(10);
      expect(values[1].valueOf()).assertEqual(20);
      expect(values[2].valueOf()).assertEqual(10);
    });

    /**
     * @tc.name   testSetValues082
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_082
     * @tc.desc   Test Set.values() with recursive objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs082()).assertDeepEquals([2, 'root', 'root2']);
    });

    /**
     * @tc.name   testSetValues083
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_083
     * @tc.desc   Test Set.values() with elements added from another Set's values iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const sourceSet: Set<number> = new Set([10, 20, 30, 40]);
      const targetSet: Set<number> = new Set();

      // Add elements from sourceSet's values iterator
      const sourceValues: Iterator<number> = sourceSet.values();
      let next: IteratorResult<number>;
      while (!(next = sourceValues.next()).done) {
        if (next.value % 20 === 0) { // Filter even multiples of 20
          targetSet.add(next.value);
        }
      }

      const targetValues: number[] = Array.from(targetSet.values());
      expect(targetValues).assertDeepEquals([20, 40]);
    });

    /**
     * @tc.name   testSetValues084
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_084
     * @tc.desc   Test Set.values() with Promise objects as elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1: Promise<number> = Promise.resolve(100);
      const promise2: Promise<number> = Promise.resolve(100); // Same value, different promise
      const promise3: Promise<string> = Promise.resolve('completed');

      const set: Set<Promise<number> | Promise<string>> = new Set([promise1, promise2, promise3]);
      const values: (Promise<number> | Promise<string>)[] = Array.from(set.values());

      expect(values.length).assertEqual(3);
      expect(values[0]).assertDeepEquals(promise1);
      expect(values[1]).assertDeepEquals(promise2);
      expect(values[2]).assertDeepEquals(promise3);
    });

    /**
     * @tc.name   testSetValues085
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_085
     * @tc.desc   Test Set.values() with elements that are Maps with identical content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: Map<string, number> = new Map([['a', 1], ['b', 2]]);
      const map2: Map<string, number> = new Map([['a', 1], ['b', 2]]); // Same content, different instance
      const map3: Map<string, number> = map1; // Same reference as map1

      const set: Set<Map<string, number>> = new Set([map1, map2, map3]);
      const values: Map<string, number>[] = Array.from(set.values());

      expect(values.length).assertEqual(2); // map1/map3 are same reference
      expect(values[0]).assertDeepEquals(map1);
      expect(values[1]).assertDeepEquals(map2);
    });

    /**
     * @tc.name   testSetValues086
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_086
     * @tc.desc   Test Set.values() with typed arrays sharing the same buffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const int32View: Int32Array = new Int32Array(buffer);
      const float64View: Float64Array = new Float64Array(buffer);
      const uint8View: Uint8Array = new Uint8Array(buffer);

      int32View.set([1, 2, 3, 4]);

      const set: Set<Int32Array | Float64Array | Uint8Array> = new Set([
        int32View, float64View, uint8View, new Int32Array(buffer)
      ]);

      const values: (Int32Array | Float64Array | Uint8Array)[] = Array.from(set.values());

      expect(values.length).assertEqual(4); // All are distinct views or instances
      expect(values[0]).assertDeepEquals(int32View);
      expect(values[3].buffer).assertDeepEquals(buffer); // New view but same buffer
    });

    /**
     * @tc.name   testSetValues087
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_087
     * @tc.desc   Test Set.values() with Error objects of different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error1: Error = new Error('Generic error');
      const error2: TypeError = new TypeError('Type mismatch');
      const error3: Error = new Error('Generic error'); // Same message, different instance
      const error4: RangeError = new RangeError('Out of range');

      const set: Set<Error> = new Set([error1, error2, error3, error4]);
      const values: Error[] = Array.from(set.values());

      expect(values.length).assertEqual(4);
      expect(values[0].message).assertEqual('Generic error');
      expect(values[2].message).assertEqual('Generic error');
    });

    /**
     * @tc.name   testSetValues088
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_088
     * @tc.desc   Test Set.values() with elements added via spread operator from multiple sources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs088()).assertDeepEquals(['a', 'b', 'c', 'd', 'e', 'f', 'g']);
    });

    /**
     * @tc.name   testSetValues090
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_090
     * @tc.desc   Test Set.values() with BigInt values and their string representations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big1: bigint = 123456789012345678901234567890n;
      const big2: bigint = 123456789012345678901234567890n; // Same value
      const bigStr: string = big1.toString();

      const set: Set<bigint | string> = new Set([big1, big2, bigStr]);
      const values: (bigint | string)[] = Array.from(set.values());

      expect(values.length).assertEqual(2); // big1 and big2 are same value
      expect(values[0]).assertEqual(big1);
      expect(values[1]).assertEqual(bigStr);
    });

    /**
     * @tc.name   testSetValues091
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_091
     * @tc.desc   Test Set.values() with multiple iterators operating simultaneously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3, 4, 5]);

      // Create two concurrent iterators
      const iter1: Iterator<number> = set.values();
      const iter2: Iterator<number> = set.values();

      // Alternate between iterators
      expect(iter1.next().value).assertEqual(1);
      expect(iter2.next().value).assertEqual(1);
      expect(iter1.next().value).assertEqual(2);
      expect(iter2.next().value).assertEqual(2);

      // Modify set during iteration
      set.delete(3);
      set.add(6);

      expect(iter1.next().value).assertEqual(4); // Original element
      expect(iter2.next().value).assertEqual(4);
      expect(iter1.next().value).assertEqual(5);
      expect(iter2.next().value).assertEqual(5);
      expect(iter1.next().value).assertEqual(6); // New element
    });

    /**
     * @tc.name   testSetValues092
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_092
     * @tc.desc   Test Set.values() with objects created via Object.create()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs092()).assertDeepEquals([2, 1, 2, 'prototype']);
    });

    /**
     * @tc.name   testSetValues093
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_093
     * @tc.desc   Test Set.values() with regular expressions and their source equivalents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1: RegExp = /test/i;
      const regex2: RegExp = /test/i; // Same pattern, different instance
      const regex3: RegExp = new RegExp(regex1.source, regex1.flags); // Same pattern

      const set: Set<RegExp> = new Set([regex1, regex2, regex3]);
      const values: RegExp[] = Array.from(set.values());

      expect(values.length).assertEqual(3); // All are distinct instances
      expect(values[0].source).assertEqual('test');
      expect(values[1].flags).assertEqual('i');
    });

    /**
     * @tc.name   testSetValues094
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_094
     * @tc.desc   Test Set.values() with elements that are functions with same implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1: () => number = () => 42;
      const func2: () => number = () => 42; // Same implementation, different function
      const func3: () => number = func1; // Same reference as func1

      const set: Set<() => number> = new Set([func1, func2, func3]);
      const values: (() => number)[] = Array.from(set.values());

      expect(values.length).assertEqual(2); // func1 and func3 are same reference
      expect(values[0]).assertDeepEquals(func1);
      expect(values[1]).assertDeepEquals(func2);
      expect(values[0]()).assertEqual(42);
    });

    /**
     * @tc.name   testSetValues096
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_096
     * @tc.desc   Test Set.values() with elements that are HTML-like object representations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      interface HTMLElementLike {
        tag: string;
        attrs: Map<string, string>;
        children: HTMLElementLike[];
      }

      const el1: HTMLElementLike = {
        tag: 'div',
        attrs: new Map([['id', 'container']]),
        children: []
      };

      const el2: HTMLElementLike = {
        tag: 'div',
        attrs: new Map([['id', 'container']]),
        children: []
      }; // Same structure, different instance

      const set: Set<HTMLElementLike> = new Set([el1, el2]);
      const values: HTMLElementLike[] = Array.from(set.values());

      expect(values.length).assertEqual(2);
      expect(values[0].tag).assertEqual('div');
      expect(values[1].attrs.get('id')).assertEqual('container');
    });

    /**
     * @tc.name   testSetValues097
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_097
     * @tc.desc   Test Set.values() with elements added and removed in high frequency
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetValues097', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const operations: number = 1000;

      // High-frequency add/delete
      const startModify: number = Date.now();
      for (let i = 0; i < operations; i++) {
        set.add(i);
        if (i % 3 === 0) { // delete every third element (including 0)
          set.delete(i);
        }
      }
      const modifyTime: number = Date.now() - startModify;

      // Iterate values()
      const startIter: number = Date.now();
      const values: number[] = Array.from(set.values());
      const iterateTime: number = Date.now() - startIter;

      const deletedCount: number = Math.floor((operations - 1) / 3) + 1;
      const expectedLen: number = operations - deletedCount;

      expect(values.length).assertEqual(expectedLen);


      expect(values[0]).assertEqual(1);
      expect(values[1] % 3 === 0).assertEqual(false);
      expect(values[values.length - 1] % 3 === 0).assertEqual(false);

    });

    /**
     * @tc.name   testSetValues098
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_098
     * @tc.desc   Test Set.values() with mixed null/undefined and their string representations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<null | undefined | string> = new Set([
        null, null,
        undefined, undefined,
        'null', 'null',
        'undefined', 'undefined'
      ]);

      const values: (null | undefined | string)[] = Array.from(set.values());

      expect(values.length).assertEqual(4); // null, undefined, 'null', 'undefined'
      expect(values[0]).assertNull();
      expect(values[1]).assertUndefined();
      expect(values[2]).assertEqual('null');
      expect(values[3]).assertEqual('undefined');
    });

    /**
     * @tc.name   testSetValues099
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_099
     * @tc.desc   Test Set.values() with elements that are instances of derived classes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetValues099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class Base {
        public id: number;

        constructor(id: number) {
          this.id = id;
        }
      }

      class Derived extends Base {
        public name: string;

        constructor(id: number, name: string) {
          super(id);
          this.name = name;
        }
      }

      const base1: Base = new Base(1);
      const base2: Base = new Base(1); // Same id, different instance
      const derived1: Derived = new Derived(2, 'test');
      const derived2: Derived = new Derived(2, 'test'); // Same values, different instance

      const set: Set<Base | Derived> = new Set([base1, base2, derived1, derived2]);
      const values: (Base | Derived)[] = Array.from(set.values());

      expect(values.length).assertEqual(4); // All are distinct instances
    });

    /**
     * @tc.name   testSetValues100
     * @tc.number SUB_COMMONLIBRARY_SET_VALUES_100
     * @tc.desc   Test Set.values() with extremely large dataset (1M+ elements)
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetValues100', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const TARGET_SIZE = 1_00;
      const HEAD_TAKE   = 10;
      const PERF_FACTOR = 3;
      const POPULATE_BUDGET_MS = 1500 * PERF_FACTOR;
      const ITERATE_BUDGET_MS  = 1200 * PERF_FACTOR;

      const set: Set<number> = new Set();

      const populateStart = Date.now();
      for (let i = 0; i < TARGET_SIZE; i++) {
        set.add(i);
      }
      const populateTime = Date.now() - populateStart;

      expect(set.size).assertEqual(TARGET_SIZE);
      for (let i = TARGET_SIZE - HEAD_TAKE; i < TARGET_SIZE; i++) {
        expect(set.has(i)).assertTrue();
      }

      const iterateStart = Date.now();
      const iterator = set.values();
      for (let i = 0; i < HEAD_TAKE; i++) {
        const r = iterator.next();
        expect(r.done).assertFalse();
        const v = r.value as number;
        expect(v).assertEqual(i);
      }
      const iterateTime = Date.now() - iterateStart;

      expect(populateTime).assertLess(POPULATE_BUDGET_MS);
      expect(iterateTime).assertLess(ITERATE_BUDGET_MS);
    });


    /**
     * @tc.name   testSetSize001
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_001
     * @tc.desc   Verify size of empty Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const size: number = set.size;

      expect(size).assertEqual(0);
    });

    /**
     * @tc.name   testSetSize002
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_002
     * @tc.desc   Verify size with unique string elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c', 'd']);
      const size: number = set.size;

      expect(size).assertEqual(4);
    });

    /**
     * @tc.name   testSetSize003
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_003
     * @tc.desc   Verify size ignores duplicate number elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 2, 3, 3, 3]);
      const size: number = set.size;

      expect(size).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize004
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_004
     * @tc.desc   Verify size updates after add operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<boolean> = new Set();

      set.add(true);
      expect(set.size).assertEqual(1);

      set.add(false);
      expect(set.size).assertEqual(2);

      set.add(true); // Duplicate
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   testSetSize005
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_005
     * @tc.desc   Verify size updates after delete operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['x', 'y', 'z']);

      set.delete('y');
      expect(set.size).assertEqual(2);

      set.delete('a'); // Non-existent element
      expect(set.size).assertEqual(2);

      set.delete('x');
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name   testSetSize006
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_006
     * @tc.desc   Verify size after clear operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([10, 20, 30]);

      set.clear();
      expect(set.size).assertEqual(0);

      // Clear empty set
      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name   testSetSize007
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_007
     * @tc.desc   Verify size with object elements (distinct references)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: TestEntity = { id: 1, name: 'obj1' };
      const obj2: TestEntity = { id: 2, name: 'obj2' };
      const obj3: TestEntity = { id: 1, name: 'obj1' }; // Same content, different reference

      const set: Set<TestEntity> = new Set([obj1, obj2, obj3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize008
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_008
     * @tc.desc   Verify size with NaN elements (treated as equal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([NaN, NaN, 5, NaN]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   testSetSize009
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_009
     * @tc.desc   Verify size with 0 and -0 elements (treated as equal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([0, -0, 1, -0]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   testSetSize010
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_010
     * @tc.desc   Verify size with Symbol elements (always unique)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      try {
        testSetSizeJs010();
        expect(false).assertFail();
      } catch (err) {
        expect(err !== undefined && err !== null).assertTrue();
      }
    });

    /**
     * @tc.name   testSetSize011
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_011
     * @tc.desc   Verify size with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const big1: bigint = 100n;
      const big2: bigint = 200n;
      const big3: bigint = 100n; // Same value as big1

      const set: Set<bigint> = new Set([big1, big2, big3]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   testSetSize012
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_012
     * @tc.desc   Verify size with class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const inst1: TestModel = new TestModel('A', 10);
      const inst2: TestModel = new TestModel('B', 20);
      const inst3: TestModel = new TestModel('A', 10); // Same content, different instance

      const set: Set<TestModel> = new Set([inst1, inst2, inst3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize013
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_013
     * @tc.desc   Verify size with enum values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<TestStatus> = new Set([
        TestStatus.New,
        TestStatus.Processing,
        TestStatus.New,
        TestStatus.Completed
      ]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize014
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_014
     * @tc.desc   Verify size with mixed primitive types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string | number | boolean | null> = new Set([
        'text', 42, true, null, 42, 'text', false
      ]);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name   testSetSize015
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_015
     * @tc.desc   Verify size with large dataset (10,000+ elements)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetSize015', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const targetSize: number = 15000;

      for (let i = 0; i < targetSize; i++) {
        set.add(i);
      }

      expect(set.size).assertEqual(targetSize);

      // Add duplicates
      for (let i = 0; i < 5000; i++) {
        set.add(i);
      }

      expect(set.size).assertEqual(targetSize);
    });


    /**
     * @tc.name   testSetSize017
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_017
     * @tc.desc   Verify size with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date('2024-01-01');
      const date2: Date = new Date('2024-01-01'); // Same time, different instance
      const date3: Date = new Date('2024-01-02');

      const set: Set<Date> = new Set([date1, date2, date3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize018
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_018
     * @tc.desc   Verify size with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1: () => void = () => {
      };
      const func2: () => void = () => {
      };
      const func3: () => void = func1; // Same reference as func1

      const set: Set<() => void> = new Set([func1, func2, func3]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   testSetSize019
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_019
     * @tc.desc   Verify size immutability (cannot be assigned directly)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs019()).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize020
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_020
     * @tc.desc   Verify size after consecutive add/delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set();

      // Complex sequence of operations
      set.add('a');
      set.add('b');
      set.add('c');
      expect(set.size).assertEqual(3);

      set.delete('b');
      set.add('d');
      set.add('a'); // Duplicate
      expect(set.size).assertEqual(3);

      set.add('e');
      set.delete('a');
      set.delete('x'); // Non-existent
      set.add('f');
      expect(set.size).assertEqual(4);

      set.clear();
      expect(set.size).assertEqual(0);
    });

    /**
     * @tc.name   testSetSize021
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_021
     * @tc.desc   Verify size with extremely large string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Create very long strings
      const longStr1: string = 'a'.repeat(10000);
      const longStr2: string = 'b'.repeat(10000);
      const longStr3: string = 'a'.repeat(10000); // Duplicate of longStr1

      const set: Set<string> = new Set([longStr1, longStr2, longStr3]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   testSetSize022
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_022
     * @tc.desc   Verify size with mixed case-sensitive string elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['Apple', 'apple', 'APPLE', 'Banana']);
      expect(set.size).assertEqual(4); // Strings are case-sensitive
    });

    /**
     * @tc.name   testSetSize023
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_023
     * @tc.desc   Verify size with sparse array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Create sparse array with empty slots
      const sparseArray: number[] = [];
      sparseArray[0] = 10;
      sparseArray[5] = 20;
      sparseArray[10] = 30;

      const set: Set<number> = new Set(sparseArray);
      expect(set.size).assertEqual(4);
    });

    /**
     * @tc.name   testSetSize025
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_025
     * @tc.desc   Verify size with objects that have null prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs025()).assertEqual(2);
    });

    /**
     * @tc.name   testSetSize026
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_026
     * @tc.desc   Verify size with RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1: RegExp = /test/i;
      const regex2: RegExp = /test/i; // Same pattern, different instance
      const regex3: RegExp = /example/g;

      const set: Set<RegExp> = new Set([regex1, regex2, regex3]);
      expect(set.size).assertEqual(3); // All are distinct instances
    });

    /**
     * @tc.name   testSetSize027
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_027
     * @tc.desc   Verify size after adding and deleting the same element multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();

      // Add and remove the same element multiple times
      set.add(10);
      expect(set.size).assertEqual(1);

      set.delete(10);
      expect(set.size).assertEqual(0);

      set.add(10);
      expect(set.size).assertEqual(1);

      set.delete(10);
      expect(set.size).assertEqual(0);

      set.add(10);
      expect(set.size).assertEqual(1);
    });

    /**
     * @tc.name   testSetSize028
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_028
     * @tc.desc   Verify size with Map objects as elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: Map<string, number> = new Map([['a', 1]]);
      const map2: Map<string, number> = new Map([['b', 2]]);
      const map3: Map<string, number> = new Map([['a', 1]]); // Same content, different instance

      const set: Set<Map<string, number>> = new Set([map1, map2, map3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize029
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_029
     * @tc.desc   Verify size with Set objects as elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const innerSet1: Set<number> = new Set([1, 2]);
      const innerSet2: Set<number> = new Set([3, 4]);
      const innerSet3: Set<number> = new Set([1, 2]); // Same content, different instance

      const set: Set<Set<number>> = new Set([innerSet1, innerSet2, innerSet3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize030
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_030
     * @tc.desc   Verify size with TypedArray elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: Uint8Array = new Uint8Array([1, 2, 3]);
      const arr2: Uint8Array = new Uint8Array([1, 2, 3]); // Same content, different instance
      const arr3: Uint8Array = new Uint8Array([4, 5, 6]);

      const set: Set<Uint8Array> = new Set([arr1, arr2, arr3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize031
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_031
     * @tc.desc   Verify size with mixed unique and duplicate complex objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const data1: ImmutableData = new ImmutableData('key1', 100);
      const data2: ImmutableData = new ImmutableData('key2', 200);
      const data3: ImmutableData = new ImmutableData('key1', 100); // Same content, different instance
      const data4: ImmutableData = data1; // Same reference as data1

      const set: Set<ImmutableData> = new Set([data1, data2, data3, data4]);
      expect(set.size).assertEqual(3); // data1/data4 are same reference
    });

    /**
     * @tc.name   testSetSize032
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_032
     * @tc.desc   Verify size with maximum safe integer values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const maxSafe: number = Number.MAX_SAFE_INTEGER;
      const maxSafePlus: number = Number.MAX_SAFE_INTEGER + 1;
      const set: Set<number> = new Set([maxSafe, maxSafe, maxSafePlus, maxSafePlus]);

      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   testSetSize033
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_033
     * @tc.desc   Verify size with negative zero and positive zero in mixed types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number | string> = new Set([0, -0, '0', '-0', 0, -0]);
      expect(set.size).assertEqual(3); // 0/-0 merged, '0', '-0'
    });

    /**
     * @tc.name   testSetSize034
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_034
     * @tc.desc   Verify size with elements added during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3]);
      let iterationCount: number = 0;

      // Add elements during iteration
      for (const item of set) {
        iterationCount++;
        if (item === 2) {
          set.add(4);
          set.add(5);
        }
      }

      expect(set.size).assertEqual(5);
      expect(iterationCount).assertEqual(5);
    });

    /**
     * @tc.name   testSetSize035
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_035
     * @tc.desc   Verify size with elements removed during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3, 4, 5]);
      const values: Iterator<number> = set.values();

      // Remove elements during iteration
      let result: IteratorResult<number> = values.next();
      while (!result.done) {
        if (result.value % 2 === 0) { // Remove even numbers
          set.delete(result.value);
        }
        result = values.next();
      }

      expect(set.size).assertEqual(3); // Remaining: 1, 3, 5
    });

    /**
     * @tc.name   testSetSize036
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_036
     * @tc.desc   Verify size with complex union type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs036()).assertEqual(7);
    });

    /**
     * @tc.name   testSetSize038
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_038
     * @tc.desc   Verify size with generator function results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs038()).assertEqual(4); // Unique values: 1,2,3,4
    });

    /**
     * @tc.name   testSetSize039
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_039
     * @tc.desc   Verify size with objects containing Symbols as properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetSizeJs039()).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize040
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_040
     * @tc.desc   Verify size with maximum capacity elements (performance test)
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetSize040', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const targetSize: number = 1000;

      // Measure time to add elements
      const startTime: number = Date.now();
      for (let i = 0; i < targetSize; i++) {
        set.add(i);
      }
      const addTime: number = Date.now() - startTime;

      // Verify size
      expect(set.size).assertEqual(targetSize);

      // Performance assertion: Should complete in reasonable time
      expect(addTime).assertLess(500); // Less than 500ms

      // Measure time to clear
      const clearStartTime: number = Date.now();
      set.clear();
      const clearTime: number = Date.now() - clearStartTime;

      expect(set.size).assertEqual(0);
      expect(clearTime).assertLess(100); // Clear should be fast
    });

    /**
     * @tc.name   testSetSize041
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_041
     * @tc.desc   Verify size with empty and whitespace strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['', ' ', '  ', '\t', '\n', '']);
      expect(set.size).assertEqual(5);
    });

    /**
     * @tc.name   testSetSize042
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_042
     * @tc.desc   Verify size with numbers in different formats (octal, hex, decimal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([
        10, // Decimal
        0o12, // Octal for 10
        0xa, // Hexadecimal for 10
        20, // Decimal
        0o24// Octal for 20
      ]);
      expect(set.size).assertEqual(2); // All represent 10 and 20
    });

    /**
     * @tc.name   testSetSize043
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_043
     * @tc.desc   Verify size with objects after modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: GeneratedObjectLiteralInterface_1 = { id: 1 };
      const obj2: GeneratedObjectLiteralInterface_1 = { id: 2 };

      const set: Set<GeneratedObjectLiteralInterface_1> = new Set([obj1, obj2]);
      expect(set.size).assertEqual(2);

      // Modify object properties (should not affect size)
      obj1.id = 100;
      obj2.id = 200;

      expect(set.size).assertEqual(2);

      // Add modified object again (should not increase size)
      set.add(obj1);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   testSetSize044
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_044
     * @tc.desc   Verify size with multiple NaN values mixed with other numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([
        NaN,
        Number('invalid'), // Also NaN
        0 / 0, // Also NaN
        10,
        20,
        NaN
      ]);
      expect(set.size).assertEqual(3); // NaN (merged) + 10 + 20
    });

    /**
     * @tc.name   testSetSize045
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_045
     * @tc.desc   Verify size with Proxy objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const target1: GeneratedObjectLiteralInterface_1 = { id: 1 };
      const target2: GeneratedObjectLiteralInterface_1 = { id: 2 };
      const emp1: EmptyObject = {};
      const emp2: EmptyObject = {};
      const proxy1: GeneratedObjectLiteralInterface_1 = new Proxy(target1, emp1);
      const proxy2: GeneratedObjectLiteralInterface_1 = new Proxy(target1, emp2); // Same target, different proxy

      const set: Set<GeneratedObjectLiteralInterface_1> = new Set([proxy1, proxy2, target2]);
      expect(set.size).assertEqual(3); // All are distinct objects
    });

    /**
     * @tc.name   testSetSize046
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_046
     * @tc.desc   Verify size with dates across different time zones
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Same moment in time, different time zones
      const date1: Date = new Date('2024-01-01T00:00:00Z');
      const date2: Date = new Date('2023-12-31T19:00:00-05:00'); // Same as date1 in UTC
      const date3: Date = new Date('2024-01-01T08:00:00+08:00'); // Same as date1 in UTC

      const set: Set<Date> = new Set([date1, date2, date3]);
      expect(set.size).assertEqual(3); // Different Date instances
    });

    /**
     * @tc.name   testSetSize048
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_048
     * @tc.desc   Verify size with unique and duplicate special types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big1: bigint = 123n;
      const big2: bigint = 123n;
      const regex1: RegExp = /pattern/;
      const regex2: RegExp = /pattern/;

      const set: Set<SpecialTypes> = new Set([
        null, null,
        undefined, undefined,
        big1, big2,
        regex1, regex2
      ]);
      expect(set.size).assertEqual(5); // null, undefined, big1, regex1, regex2
    });

    /**
     * @tc.name   testSetSize049
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_049
     * @tc.desc   Verify size remains consistent after serialization/deserialization
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Create objects and serialize/deserialize
      const obj1: ImmutableItem = new ImmutableItem('a', '1');
      const obj2: ImmutableItem = new ImmutableItem('b', '2');
      const serialized1: string = JSON.stringify(obj1);
      const serialized2: string = JSON.stringify(obj2);
      const deserialized1: ImmutableItem = JSON.parse(serialized1);
      const deserialized2: ImmutableItem = JSON.parse(serialized2);

      const set: Set<ImmutableItem> = new Set([
        obj1, obj2, deserialized1, deserialized2
      ]);
      expect(set.size).assertEqual(4); // All are distinct objects after deserialization
    });

    /**
     * @tc.name   testSetSize050
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_050
     * @tc.desc   Verify size with elements added via spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: number[] = [1, 2, 3];
      const arr2: number[] = [3, 4, 5];
      const set: Set<number> = new Set([...arr1, ...arr2]);

      expect(set.size).assertEqual(5); // 1,2,3,4,5
    });

    /**
     * @tc.name   testSetSize051
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_051
     * @tc.desc   Verify size with elements added from another Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const sourceSet: Set<string> = new Set(['a', 'b', 'c']);
      const targetSet: Set<string> = new Set(['c', 'd', 'e']);

      // Add all elements from sourceSet to targetSet
      sourceSet.forEach(item => targetSet.add(item));

      expect(targetSet.size).assertEqual(5); // a,b,c,d,e
    });

    /**
     * @tc.name   testSetSize052
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_052
     * @tc.desc   Verify size with elements removed using multiple delete calls in sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([10, 20, 30, 40, 50, 60]);

      // Delete even numbers
      [20, 40, 60].forEach(num => set.delete(num));

      expect(set.size).assertEqual(3); // 10,30,50 remain
    });

    /**
     * @tc.name   testSetSize053
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_053
     * @tc.desc   Verify size with elements that are promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1: Promise<number> = Promise.resolve(1);
      const promise2: Promise<number> = Promise.resolve(1);
      const promise3: Promise<number> = Promise.resolve(2);

      const set: Set<Promise<number>> = new Set([promise1, promise2, promise3]);
      expect(set.size).assertEqual(3); // All are distinct promise objects
    });

    /**
     * @tc.name   testSetSize054
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_054
     * @tc.desc   Verify size with large negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([
        -1, -10, -100, -1000,
        -1, -100, // Duplicates
        -Infinity, -Infinity// Duplicates
      ]);
      expect(set.size).assertEqual(5); // -1, -10, -100, -1000, -Infinity
    });

    /**
     * @tc.name   testSetSize055
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_055
     * @tc.desc   Verify size with elements that are class instances with same values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const item1: ImmutableItem = new ImmutableItem('key', 'value');
      const item2: ImmutableItem = new ImmutableItem('key', 'value'); // Same values, different instance
      const item3: ImmutableItem = item1; // Same instance as item1

      const set: Set<ImmutableItem> = new Set([item1, item2, item3]);
      expect(set.size).assertEqual(2); // item1/item3 are same instance
    });

    /**
     * @tc.name   testSetSize056
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_056
     * @tc.desc   Verify size with elements that are error objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error1: Error = new Error('Message');
      const error2: Error = new Error('Message'); // Same message, different instance
      const error3: Error = new Error('Another message');

      const set: Set<Error> = new Set([error1, error2, error3]);
      expect(set.size).assertEqual(3);
    });

    /**
     * @tc.name   testSetSize057
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_057
     * @tc.desc   Verify size with elements added in different orders
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set1: Set<string> = new Set(['x', 'y', 'z']);
      const set2: Set<string> = new Set(['z', 'y', 'x']);

      expect(set1.size).assertEqual(3);
      expect(set2.size).assertEqual(3);
      expect(set1.size).assertEqual(set2.size);
    });

    /**
     * @tc.name   testSetSize058
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_058
     * @tc.desc   Verify size with elements that are weak references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const target1: EmptyObject = {};
      const target2: EmptyObject = {};
      const ref1: WeakRef<EmptyObject> = new WeakRef(target1);
      const ref2: WeakRef<EmptyObject> = new WeakRef(target1); // Same target, different ref
      const ref3: WeakRef<EmptyObject> = new WeakRef(target2);

      const set: Set<WeakRef<EmptyObject>> = new Set([ref1, ref2, ref3]);
      expect(set.size).assertEqual(3); // All are distinct WeakRef instances
    });

    /**
     * @tc.name   testSetSize059
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_059
     * @tc.desc   Verify size with elements that are buffers of same content
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetSize059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer1: ArrayBuffer = new ArrayBuffer(4);
      const buffer2: ArrayBuffer = new ArrayBuffer(4);
      const view1: Uint8Array = new Uint8Array(buffer1);
      const view2: Uint8Array = new Uint8Array(buffer2);

      // Fill with same content
      view1.set([1, 2, 3, 4]);
      view2.set([1, 2, 3, 4]);

      const set: Set<ArrayBuffer> = new Set([buffer1, buffer2]);
      expect(set.size).assertEqual(2); // Different buffer instances
    });

    /**
     * @tc.name   testSetSize060
     * @tc.number SUB_COMMONLIBRARY_SET_SIZE_060
     * @tc.desc   Verify size consistency across multiple operations
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetSize060', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const operations: Array<GeneratedTypeLiteralInterface_2> = [];

      // Generate random operations
      for (let i = 0; i < 100; i++) {
        operations.push({
          type: Math.random() > 0.3 ? 'add' : 'delete',
          value: Math.floor(Math.random() * 1000)
        });
      }

      // Execute operations
      operations.forEach(op => {
        if (op.type === 'add') {
          set.add(op.value);
        } else {
          set.delete(op.value);
        }
      });

      // Calculate expected size by tracking unique values that were added last
      const lastOperations: Map<number, 'add' | 'delete'> = new Map();
      operations.forEach(op => {
        lastOperations.set(op.value, op.type);
      });

      let expectedSize: number = 0;
      lastOperations.forEach((type) => {
        if (type === 'add') {
          expectedSize++;
        }
      });

      expect(set.size).assertEqual(expectedSize);
    });
  })
}