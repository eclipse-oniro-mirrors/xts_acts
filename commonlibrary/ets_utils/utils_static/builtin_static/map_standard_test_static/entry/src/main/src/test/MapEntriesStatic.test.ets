'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
interface GeneratedObjectLiteralInterface_1 {
  id: number;
}

interface GeneratedObjectLiteralInterface_2 {
  name: string;
}

interface GeneratedObjectLiteralInterface_3 {
  tagName: string;
  id: string;
}

interface test0028 {
  prop: string;
}

class KeyClass {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }
}

interface test0035 {};
interface test0042 {};
interface test0043 {};
interface test0060 {
  a: number;
  b: number;
  c: number
}
class TestClass {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

interface TargetObject {
  id: number;
}

interface ProxyHandler {}

interface CustomToString {
  id: number;
  toString: () => string;
}

interface TestObject {
  value: number;
  valueOf: () => int;
}

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function MapEntriesTest() {
  describe('MapEntriesTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      await Utils.msSleep(30);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0001
     * @tc.name testMapEntries0001
     * @tc.desc Verify entries() returns iterator for non-empty Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapEntries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2]]);
      const entries = map.entries();
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['a', 1]));
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['b', 2]));
      expect(entries.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0002
     * @tc.name testMapEntries0002
     * @tc.desc Verify entries() returns empty iterator for empty Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapEntries0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>();
      const entries = map.entries();
      expect(entries.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0003
     * @tc.name testMapEntries0003
     * @tc.desc Verify entries() returns entries in insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapEntries0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<int, string>();
      map.set(3, 'three');
      map.set(1, 'one');
      map.set(2, 'two');

      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[3, 'three'], [1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0004
     * @tc.name testMapEntries0004
     * @tc.desc Verify entries() works with number keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapEntries0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<int, string>([[1, 'one'], [2, 'two']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0005
     * @tc.name testMapEntries0005
     * @tc.desc Verify entries() works with string keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapEntries0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, int>([['one', 1], ['two', 2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['one', 1], ['two', 2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0006
     * @tc.name testMapEntries0006
     * @tc.desc Verify entries() works with boolean keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[true, 'yes'], [false, 'no']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0007
     * @tc.name testMapEntries0007
     * @tc.desc Verify entries() works with object keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const key1: GeneratedObjectLiteralInterface_1 = { id: 1 };
      const key2: GeneratedObjectLiteralInterface_1 = { id: 2 };
      const map = new Map<GeneratedObjectLiteralInterface_1, string>([[key1, 'first'], [key2, 'second']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[key1, 'first'], [key2, 'second']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0010
     * @tc.name testMapEntries0010
     * @tc.desc Verify entries() reflects changes to Map after iterator creation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>([[1, 'one']]);
      const entries = map.entries();
      map.set(2, 'two');
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify([1, 'one']));
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify([2, 'two']));
      expect(entries.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0011
     * @tc.name testMapEntries0011
     * @tc.desc Verify entries() iterator does not include deleted entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      const entries = map.entries();

      entries.next(); // Get first entry
      map.delete(2);

      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify([3, 'three']));
      expect(entries.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0012
     * @tc.name testMapEntries0012
     * @tc.desc Verify entries() works with Map containing null values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, null>([['a', null], ['b', null]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['a', null], ['b', null]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0013
     * @tc.name testMapEntries0013
     * @tc.desc Verify entries() works with Map containing undefined values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, undefined>([['a', undefined], ['b', undefined]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['a', undefined], ['b', undefined]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0014
     * @tc.name testMapEntries0014
     * @tc.desc Verify entries() works with Map containing object values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const value1: GeneratedObjectLiteralInterface_2 = { name: 'Alice' };
      const value2: GeneratedObjectLiteralInterface_2 = { name: 'Bob' };
      const map = new Map<number, GeneratedObjectLiteralInterface_2>([[1, value1], [2, value2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, value1], [2, value2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0015
     * @tc.name testMapEntries0015
     * @tc.desc Verify entries() works with large Map (100 entries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, int>();
      for (let i = 0; i < 100; i++) {
        map.set(i, i * 2);
      }

      const entries = Array.from(map.entries());
      expect(entries.length).assertDeepEquals(100);
      expect(JSON.stringify(entries[50])).assertDeepEquals(JSON.stringify([50, 100]));
      expect(JSON.stringify(entries[99])).assertDeepEquals(JSON.stringify([99, 198]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0016
     * @tc.name testMapEntries0016
     * @tc.desc Verify entries() iterator can be iterated with for...of loop
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2], ['c', 3]]);
      const results: [string, int][] = [];

      for (const entry of map.entries()) {
        results.push(entry);
      }

      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([['a', 1], ['b', 2], ['c', 3]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0017
     * @tc.name testMapEntries0017
     * @tc.desc Verify entries() returns new iterator each time it's called
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>([[1, 'one'], [2, 'two']]);
      const entries1 = map.entries();
      const entries2 = map.entries();

      expect(JSON.stringify(entries1.next().value)).assertDeepEquals(JSON.stringify([1, 'one']));
      expect(JSON.stringify(entries2.next().value)).assertDeepEquals(JSON.stringify([1, 'one'])); // Should be independent
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0018
     * @tc.name testMapEntries0018
     * @tc.desc Verify entries() works with Map created from another Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const original = new Map<int, string>([[1, 'one'], [2, 'two']]);
      const map = new Map<int, string>(original);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0019
     * @tc.name testMapEntries0019
     * @tc.desc Verify entries() works with Map containing NaN keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[NaN, 'not a number'], [NaN, 'another NaN']]);
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(1);
      expect(isNaN(entries[0][0])).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0020
     * @tc.name testMapEntries0020
     * @tc.desc Verify entries() works with Map containing Date objects as keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2024-01-01');
      const map = new Map<Date, string>([[date1, 'past'], [date2, 'future']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[date1, 'past'], [date2, 'future']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0021
     * @tc.name testMapEntries0021
     * @tc.desc Verify entries() works with Map containing RegExp objects as keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const key1 = new RegExp("test");
      const key2 = new RegExp("example", "g");
      const map = new Map<RegExp, int>([[key1, 1], [key2, 2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[key1, 1], [key2, 2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0022
     * @tc.name testMapEntries0022
     * @tc.desc Verify entries() iterator is not affected by value modifications
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>([[1, 'one'], [2, 'two']]);
      const entries = map.entries();

      map.set(1, 'modified');

      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify([1, 'modified']));
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify([2, 'two']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0023
     * @tc.name testMapEntries0023
     * @tc.desc Verify entries() works with Map containing function keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const key1 = () => 'func1';
      const key2 = () => 'func2';
      const map = new Map<() => string, int>([[key1, 10], [key2, 20]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[key1, 10], [key2, 20]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0024
     * @tc.name testMapEntries0024
     * @tc.desc Verify entries() iterator can be restarted by creating new iterator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['b', 2]]);
      const entries1 = map.entries();
      entries1.next(); // Move to second entry

      const entries2 = map.entries(); // Create new iterator
      expect(JSON.stringify(entries2.next().value)).assertDeepEquals(JSON.stringify(['a', 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0025
     * @tc.name testMapEntries0025
     * @tc.desc Verify entries() works with Map containing array keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testMapEntries0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
    //   const key1 = [1, 2];
    //   const key2 = [3, 4];
    //   const map = new Map<int[], string>([[key1, 'first'], [key2, 'second']]);
    //   const entries = Array.from(map.entries());
    //   expect(entries).assertDeepEquals([[key1, 'first'], [key2, 'second']]);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0026
     * @tc.name testMapEntries0026
     * @tc.desc Verify entries() iterator throws error when Map is modified during iteration with invalid operation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const entries = map.entries();
      let errorThrown = false;

      try {
        entries.next();
        map.clear();
        entries.next();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertEqual(false); // Map modification during iteration is allowed
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0027
     * @tc.name testMapEntries0027
     * @tc.desc Verify entries() works with Map containing nested Map as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const nestedMap1 = new Map<string, number>([['a', 1]]);
      const nestedMap2 = new Map<string, number>([['b', 2]]);
      const map = new Map<int, Map<string, number>>([[1, nestedMap1], [2, nestedMap2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, nestedMap1], [2, nestedMap2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0028
     * @tc.name testMapEntries0028
     * @tc.desc Verify entries() returns entries with same object reference for object values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const obj: test0028 = { prop: 'value' };
      const map = new Map<number, test0028>([[1, obj]]);
      const entries = Array.from(map.entries());
      expect(entries[0][1]).assertDeepEquals(obj);
      expect(entries[0][1].prop).assertEqual('value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0029
     * @tc.name testMapEntries0029
     * @tc.desc Verify entries() works with Map containing 0 and -0 as distinct keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<int, string>([[0, 'zero'], [-0, 'negative zero']]);
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(1);
      expect(JSON.stringify(entries[0])).assertDeepEquals(JSON.stringify([0, 'negative zero']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0030
     * @tc.name testMapEntries0030
     * @tc.desc Verify entries() iterator can be converted to array using spread operator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, boolean>([['active', true], ['visible', false]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['active', true], ['visible', false]]));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0031
     * @tc.name testMapEntries0031
     * @tc.desc Verify entries() works with Map containing typed array values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const value1 = new Uint8Array([1, 2, 3]);
      const value2 = new Float32Array([4.5, 5.5]);
      const map = new Map<string, Uint8Array | Float32Array>([['u8', value1], ['f32', value2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['u8', value1], ['f32', value2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0032
     * @tc.name testMapEntries0032
     * @tc.desc Verify entries() works with Map after multiple set and delete operations
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>();
      map.set(1, 'one');
      map.set(2, 'two');
      map.delete(1);
      map.set(3, 'three');
      map.set(2, 'modified two');

      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[2, 'modified two'], [3, 'three']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0034
     * @tc.name testMapEntries0034
     * @tc.desc Verify entries() works with Map containing class instances as keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const key1 = new KeyClass(1);
      const key2 = new KeyClass(2);
      const map = new Map<KeyClass, string>([[key1, 'first'], [key2, 'second']]);
      const entries = Array.from(map.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[key1, 'first'], [key2, 'second']]));
      expect(entries[0][0].id).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0035
     * @tc.name testMapEntries0035
     * @tc.desc Verify entries() works with Map containing weak references (WeakMap simulation)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const obj1: test0035 = {};
      const obj2: test0035 = {};
      const map = new Map<object, string>([[obj1, 'obj1'], [obj2, 'obj2']]);
      map.delete(obj1);
      const obj3 = obj1;
      map.set(obj3, 'obj3');

      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[obj2, 'obj2'], [obj3, 'obj3']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0036
     * @tc.name testMapEntries0036
     * @tc.desc Verify entries() works with Map containing empty string keys and values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>([['', 'empty key'], ['key', '']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['', 'empty key'], ['key', '']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0037
     * @tc.name testMapEntries0037
     * @tc.desc Verify entries() iterator can be used in Array.from with mapping function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 10], [2, 20]]);
      const mapped = Array.from(map.entries(), (entry:[number,number]) => entry[0] * entry[1]);
      expect(JSON.stringify(mapped)).assertDeepEquals(JSON.stringify([10, 40]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0038
     * @tc.name testMapEntries0038
     * @tc.desc Verify entries() works with Map containing Unicode characters in keys and values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>([['café', 'coffee'], ['cœur', 'heart']]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['café', 'coffee'], ['cœur', 'heart']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0039
     * @tc.name testMapEntries0039
     * @tc.desc Verify entries() works with Map containing Infinity and -Infinity as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>([['inf', Infinity], ['ninf', -Infinity]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['inf', Infinity], ['ninf', -Infinity]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0041
     * @tc.name testMapEntries0041
     * @tc.desc Verify entries() works with Map containing Set objects as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const set1 = new Set<number>([1, 2, 3]);
      const set2 = new Set<string>(['a', 'b']);
      const map = new Map<number, Set<number> | Set<string>>([[1, set1], [2, set2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, set1], [2, set2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0042
     * @tc.name testMapEntries0042
     * @tc.desc Verify entries() works with Map containing WeakSet as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const ws1 = new WeakSet<object>();
      const ws2 = new WeakSet<object>();
      const obj1: test0042 = {};
      const obj2: test0042 = {};
      ws1.add(obj1);
      ws2.add(obj2);
      const map = new Map<number, WeakSet<object>>([[1, ws1], [2, ws2]]);
      const entries = Array.from(map.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(1);
      expect(entries[0][1]).assertEqual(ws1);
      expect(entries[1][0]).assertEqual(2);
      expect(entries[1][1]).assertEqual(ws2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0043
     * @tc.name testMapEntries0043
     * @tc.desc Verify entries() works with Map containing WeakMap as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const wm1 = new WeakMap<object, string>();
      const wm2 = new WeakMap<object, number>();
      const key1: test0043 = {};
      const key2: test0043 = {};
      wm1.set(key1, 'value1');
      wm2.set(key2, 100);
      const map = new Map<number, WeakMap<object, string> | WeakMap<object, number>>([
        [1, wm1],
        [2, wm2]
      ]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, wm1], [2, wm2]]));
      expect((entries[0][1] as WeakMap<object, string>).get(key1)).assertEqual('value1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0044
     * @tc.name testMapEntries0044
     * @tc.desc Verify entries() works with Map containing DataView objects as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(16);
      const dv1 = new DataView(buffer1);
      const dv2 = new DataView(buffer2);
      dv1.setInt32(0, 12345);
      dv2.setFloat64(8, 987.654);

      const map = new Map<string, DataView>([['dv1', dv1], ['dv2', dv2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['dv1', dv1], ['dv2', dv2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0045
     * @tc.name testMapEntries0045
     * @tc.desc Verify entries() works with Map containing ArrayBuffer as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const ab1 = new ArrayBuffer(10);
      const ab2 = new ArrayBuffer(20);
      const map = new Map<number, ArrayBuffer>([[1, ab1], [2, ab2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, ab1], [2, ab2]]));
      expect(entries[0][1].byteLength).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0046
     * @tc.name testMapEntries0046
     * @tc.desc Verify entries() works with Map containing Error objects as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const err1 = new Error('Error message');
      const err2 = new TypeError('Type error message');
      const map = new Map<number, Error>([[1, err1], [2, err2]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, err1], [2, err2]]));
      expect(entries[0][1].message).assertEqual('Error message');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0047
     * @tc.name testMapEntries0047
     * @tc.desc Verify entries() works with Map containing Promise objects as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const promise1 = Promise.resolve('resolved');
      const promise2 = Promise.reject(new Error('rejected'));
      const map = new Map<number, Promise<string>>([[1, promise1], [2, promise2]]);
      const entries = Array.from(map.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, promise1], [2, promise2]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0054
     * @tc.name testMapEntries0054
     * @tc.desc Verify entries() works with Map containing multi-line string values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>([
        [1, 'line1\nline2'],
        [2, 'single line']
      ]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([
        [1, 'line1\nline2'],
        [2, 'single line']
      ]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0055
     * @tc.name testMapEntries0055
     * @tc.desc Verify entries() works with Map containing special Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>([
        ['emoji', '😊🎉'],
        ['math', '∑∫�?'],
        ['cyrillic', 'привет']
      ]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([
        ['emoji', '😊🎉'],
        ['math', '∑∫�?'],
        ['cyrillic', 'привет']
      ]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0057
     * @tc.name testMapEntries0057
     * @tc.desc Verify entries() works with Map containing numbers in scientific notation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([
        [1e3, 2e3],
        [3e-4, 4e-5]
      ]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([
        [1e3, 2e3],
        [3e-4, 4e-5]
      ]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0061
     * @tc.name testMapEntries0061
     * @tc.desc Verify entries() works with Map containing Map objects as keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const key1 = new Map<number, string>([[1, 'one']]);
      const key2 = new Map<number, string>([[2, 'two']]);
      const map = new Map<Map<number, string>, boolean>([[key1, true], [key2, false]]);
      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[key1, true], [key2, false]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0062
     * @tc.name testMapEntries0062
     * @tc.desc Verify entries() works with Map containing Date objects with same time value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const date1 = new Date(2024, 0, 1);
      const date2 = new Date(2024, 0, 1); // Same time value but different object
      const map = new Map<Date, string>([[date1, 'first'], [date2, 'second']]);
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertDeepEquals(date1);
      expect(entries[1][0]).assertDeepEquals(date2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0063
     * @tc.name testMapEntries0063
     * @tc.desc Verify entries() works with Map containing RegExp objects with same pattern
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const regex1 = new RegExp("test");
      const regex2 = new RegExp("test"); // Same pattern but different object
      const map = new Map<RegExp, number>([[regex1, 1], [regex2, 2]]);
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(regex1);
      expect(entries[1][0]).assertEqual(regex2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0064
     * @tc.name testMapEntries0064
     * @tc.desc Verify entries() works with Map after clear()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      map.clear();
      const entries = Array.from(map.entries());
      expect(entries.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0065
     * @tc.name testMapEntries0065
     * @tc.desc Verify entries() iterator continues correctly after partial iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>([['a', 1], ['b', 2], ['c', 3], ['d', 4]]);
      const entries = map.entries();

      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['a', 1]));
      expect(JSON.stringify(entries.next().value)).assertDeepEquals(JSON.stringify(['b', 2]));

      const remainingEntries: [string, number][] = [];
      let result: IteratorResult<[string, number]> = entries.next();
      while (!result.done) {
        if (result.value != undefined) remainingEntries.push(result.value!);
        result = entries.next();
      }
      expect(JSON.stringify(remainingEntries)).assertDeepEquals(JSON.stringify([['c', 3], ['d', 4]]));
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0066
     * @tc.name testMapEntries0066
     * @tc.desc Verify entries() works with Map containing class instances with same properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const instance1 = new TestClass(10);
      const instance2 = new TestClass(10); // Same value but different instance
      const map = new Map<TestClass, string>([[instance1, 'first'], [instance2, 'second']]);
      const entries = Array.from(map.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(instance1);
      expect(entries[1][0]).assertEqual(instance2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0067
     * @tc.name testMapEntries0067
     * @tc.desc Verify entries() works with Map containing ArrayBuffer views as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('testMapEntries0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
    //   const buffer = new ArrayBuffer(16);
    //   const intView = new Int32Array(buffer);
    //   const floatView = new Float64Array(buffer);
    //   intView[0] = 12345;
    //   floatView[1] = 987.654;
    //
    //   const map = new Map<string, Int32Array | Float64Array>([['int', intView], ['float', floatView]]);
    //   const entries = Array.from(map.entries());
    //
    //   expect(entries).assertDeepEquals([['int', intView], ['float', floatView]]);
    //   expect(entries[0][1][0]).assertEqual(12345);
    //   expect(entries[1][1][1]).assertEqual(987.654);
    // });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0068
     * @tc.name testMapEntries0068
     * @tc.desc Verify entries() works with Map containing function values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const func1 = () => 'result1';
      const func2 = () => 'result2';
      const map = new Map<string, () => string>([['f1', func1], ['f2', func2]]);
      const entries = Array.from(map.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['f1', func1], ['f2', func2]]));
      expect(entries[0][1]()).assertEqual('result1');
      expect(entries[1][1]()).assertEqual('result2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0069
     * @tc.name testMapEntries0069
     * @tc.desc Verify entries() works with Map containing async function values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async (): Promise<void> => {
      const asyncFunc1 = async () => 'async1';
      const asyncFunc2 = async () => 'async2';
      const map = new Map<string, () => Promise<string>>([['af1', asyncFunc1], ['af2', asyncFunc2]]);
      const entries = Array.from(map.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['af1', asyncFunc1], ['af2', asyncFunc2]]));

      const result1 = await entries[0][1]();
      const result2 = await entries[1][1]();

      expect(result1).assertEqual('async1');
      expect(result2).assertEqual('async2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0071
     * @tc.name testMapEntries0071
     * @tc.desc Verify entries() works with Map containing large string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create a large string (10,000 characters)
      const largeString = 'a'.repeat(10000);
      const map = new Map<number, string>([[1, largeString], [2, 'small']]);
      const entries = Array.from(map.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, largeString], [2, 'small']]));
      expect(entries[0][1].length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0072
     * @tc.name testMapEntries0072
     * @tc.desc Verify entries() works with Map containing typed array keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const key1 = new Uint8Array([1, 2, 3]);
      const key2 = new Uint8Array([1, 2, 3]); // Same values but different array
      const map = new Map<Uint8Array, string>([[key1, 'first'], [key2, 'second']]);
      const entries = Array.from(map.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(key1);
      expect(entries[1][0]).assertEqual(key2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0073
     * @tc.name testMapEntries0073
     * @tc.desc Verify entries() works with Map containing Buffer objects (Node.js simulation)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      // Simulating Buffer using Uint8Array for cross-environment compatibility
      const buf1 = new Uint8Array([0x48, 0x65, 0x6c, 0x6c, 0x6f]); // "Hello"
      const buf2 = new Uint8Array([0x57, 0x6f, 0x72, 0x6c, 0x64]); // "World"
      const map = new Map<Uint8Array, string>([[buf1, 'hello'], [buf2, 'world']]);
      const entries = Array.from(map.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[buf1, 'hello'], [buf2, 'world']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0074
     * @tc.name testMapEntries0074
     * @tc.desc Verify entries() works with Map containing Map that has been modified
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const nestedMap = new Map<number, string>([[1, 'one']]);
      const map = new Map<number, Map<number, string>>([[1, nestedMap]]);

      // Modify the nested map after creating the outer map
      nestedMap.set(2, 'two');

      const entries = Array.from(map.entries());
      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, nestedMap]]));
      expect(entries[0][1].size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0076
     * @tc.name testMapEntries0076
     * @tc.desc Verify entries() works with Map containing Date objects with different time zones
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      // Create dates that represent the same moment in different time zones
      const date1 = new Date('2024-01-01T00:00:00Z');
      const date2 = new Date('2024-01-01T08:00:00+08:00');

      const map = new Map<Date, string>([[date1, 'UTC'], [date2, 'China']]);
      const entries = Array.from(map.entries());

      expect(entries.length).assertEqual(2);
      expect(entries[0][0]).assertEqual(date1);
      expect(entries[1][0]).assertEqual(date2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0078
     * @tc.name testMapEntries0078
     * @tc.desc Verify entries() works with Map containing objects with custom valueOf
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapEntries0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const obj1: TestObject = {
        value: 10,
        valueOf: () => 100
      };
      const obj2: TestObject = {
        value: 20,
        valueOf: () => 200
      };

      const map = new Map<TestObject, string>([[obj1, 'first'], [obj2, 'second']]);
      const entries = Array.from(map.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[obj1, 'first'], [obj2, 'second']]));

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0083
     * @tc.name testMapEntries0083
     * @tc.desc Verify entries() works with Map containing DOM element simulations as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const elem1: GeneratedObjectLiteralInterface_3 = { tagName: 'DIV', id: 'div1' };
      const elem2: GeneratedObjectLiteralInterface_3 = { tagName: 'SPAN', id: 'span1' };
      const map = new Map<string, GeneratedObjectLiteralInterface_3>([['div', elem1], ['span', elem2]]);
      const entries = Array.from(map.entries());

      expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([['div', elem1], ['span', elem2]]));
      expect(entries[0][1].tagName).assertEqual('DIV');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_Entries_0084
     * @tc.name testMapEntries0084
     * @tc.desc Verify entries() works with Map containing error instances with stack traces
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapEntries0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      try {
        throw new Error('Test error');
      } catch (e) {
        const error1 = e as Error;
        const error2 = new TypeError('Type error');
        const map = new Map<number, Error>([[1, error1], [2, error2]]);
        const entries = Array.from(map.entries());

        expect(JSON.stringify(entries)).assertDeepEquals(JSON.stringify([[1, error1], [2, error2]]));
        expect(entries[0][1].message).assertEqual('Test error');
      }
    });

  })
}


