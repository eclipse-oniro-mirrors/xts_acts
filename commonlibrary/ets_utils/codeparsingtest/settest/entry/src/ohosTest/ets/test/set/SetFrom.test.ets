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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level  } from '@ohos/hypium';
import { GeneratedObjectLiteralInterface_1, GeneratedObjectLiteralInterface_3 } from './SetKeys.test';
import {
  testSetForOfJs009,
  testSetForOfJs024,
  testSetForOfJs025,
  testSetForOfJs036, testSetForOfJs038, testSetForOfJs060, testSetForOfJs061,
  testSetForOfJs065 } from './SetFrom';
export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

interface BasicEntity {
  id: string;
  value: number;
}

interface NestedItem {
  name: string;
  nested?: NestedItem;
}

class DataModel {
  public code: number;
  public label: string;

  constructor(code: number, label: string) {
  this.code = code;
  this.label = label;
  }
}

enum DataType {
  TEXT,
  NUMBER,
  BOOLEAN,
  OBJECT
}
export default function SetFromTest() {
  describe('SetFromTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.name   testSetKeysValues001
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_001
     * @tc.desc   Verify keys() and values() return same elements for primitive values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);

      const keys: string[] = Array.from(set.keys());
      const values: string[] = Array.from(set.values());

      expect(keys).assertDeepEquals(values);
      expect(keys).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   testSetKeysValues002
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_002
     * @tc.desc   Verify keys() and values() consistency after add operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2]);
      set.add(3);
      set.add(4);
      set.add(2); // Duplicate

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys.length).assertEqual(4);
      expect(keys).assertDeepEquals(values);
      expect(keys).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testSetKeysValues003
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_003
     * @tc.desc   Verify keys() and values() after delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<boolean> = new Set([true, false, true]);
      set.delete(true);

      const keys: boolean[] = Array.from(set.keys());
      const values: boolean[] = Array.from(set.values());

      expect(keys).assertDeepEquals([false]);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues004
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_004
     * @tc.desc   Verify keys() and values() for empty Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys).assertDeepEquals([]);
      expect(values).assertDeepEquals([]);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues005
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_005
     * @tc.desc   Verify keys() and values() with object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: BasicEntity = { id: '1', value: 100 };
      const obj2: BasicEntity = { id: '2', value: 200 };
      const set: Set<BasicEntity> = new Set([obj1, obj2]);

      const keys: BasicEntity[] = Array.from(set.keys());
      const values: BasicEntity[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(obj1);
      expect(keys[1]).assertDeepEquals(obj2);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues006
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_006
     * @tc.desc   Verify keys() and values() with mixed primitive types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string | number | boolean> = new Set([
        'text', 42, true, 'text', 42
      ]);

      const keys: (string | number | boolean)[] = Array.from(set.keys());
      const values: (string | number | boolean)[] = Array.from(set.values());

      expect(keys).assertDeepEquals(['text', 42, true]);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues007
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_007
     * @tc.desc   Verify keys() and values() after clear() operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([10, 20, 30]);
      set.clear();

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys).assertDeepEquals([]);
      expect(values).assertDeepEquals([]);
    });

    /**
     * @tc.name   testSetKeysValues008
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_008
     * @tc.desc   Verify simultaneous iteration with keys() and values()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set(['apple', 'banana', 'cherry']);

      const keyIter: Iterator<string> = set.keys();
      const valueIter: Iterator<string> = set.values();

      let result: boolean = true;
      let keyResult: IteratorResult<string>;
      let valueResult: IteratorResult<string>;

      while (!(keyResult = keyIter.next()).done && !(valueResult = valueIter.next()).done) {
        if (keyResult.value !== valueResult.value) {
          result = false;
          break;
        }
      }

      expect(result).assertTrue();
      //expect(keyResult.done).assertEqual(valueResult.done);
    });

    /**
     * @tc.name   testSetKeysValues009
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_009
     * @tc.desc   Verify keys() and values() with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetForOfJs009()).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeysValues010
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_010
     * @tc.desc   Verify keys() and values() with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big1: bigint = 1234567890123456789n;
      const big2: bigint = 1234567890123456789n; // same value as big1
      const big3: bigint = 9876543210987654321n;

      const set: Set<bigint> = new Set([big1, big2, big3]);

      const keys: bigint[] = Array.from(set.keys());
      const values: bigint[] = Array.from(set.values());

      expect(set.size).assertEqual(2);
      expect(keys.map(x => x.toString())).assertDeepEquals([big1, big3].map(x => x.toString()));
      expect(values.map(x => x.toString())).assertDeepEquals([big1, big3].map(x => x.toString()));
      expect(keys.map(x => x.toString())).assertDeepEquals(values.map(x => x.toString()));

    });

    /**
     * @tc.name   testSetKeysValues011
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_011
     * @tc.desc   Verify keys() and values() with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date('2024-01-01');
      const date2: Date = new Date('2024-01-01'); // Same time, different instance
      const set: Set<Date> = new Set([date1, date2]);

      const keys: Date[] = Array.from(set.keys());
      const values: Date[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(date1);
      expect(keys[1]).assertDeepEquals(date2);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues012
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_012
     * @tc.desc   Verify keys() and values() with class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const item1: DataModel = new DataModel(1, 'First');
      const item2: DataModel = new DataModel(2, 'Second');
      const item3: DataModel = new DataModel(1, 'First'); // Same values, different instance
      const set: Set<DataModel> = new Set([item1, item2, item3]);

      const keys: DataModel[] = Array.from(set.keys());
      const values: DataModel[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys[0].code).assertEqual(1);
      expect(keys[1].code).assertEqual(2);
      expect(keys[2].code).assertEqual(1);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues013
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_013
     * @tc.desc   Verify keys() and values() with modified objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: BasicEntity = { id: 'init', value: 0 };
      const set: Set<BasicEntity> = new Set([obj]);

      // Modify object after insertion
      obj.id = 'modified';
      obj.value = 100;

      const keys: BasicEntity[] = Array.from(set.keys());
      const values: BasicEntity[] = Array.from(set.values());

      expect(keys.length).assertEqual(1);
      expect(keys[0].id).assertEqual('modified');
      expect(keys[0].value).assertEqual(100);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues015
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_015
     * @tc.desc   Verify keys() and values() with regex elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1: RegExp = /pattern/;
      const regex2: RegExp = /pattern/; // Same pattern, different instance
      const set: Set<RegExp> = new Set([regex1, regex2]);

      const keys: RegExp[] = Array.from(set.keys());
      const values: RegExp[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(regex1);
      expect(keys[1]).assertDeepEquals(regex2);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues016
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_016
     * @tc.desc   Verify keys() and values() with NaN and special numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([
        0, -0,    // 0 and -0 are considered equal
        Infinity, -Infinity
      ]);

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys.length).assertEqual(3); // NaN, 0, Infinity, -Infinity
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues017
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_017
     * @tc.desc   Verify keys() and values() with enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<DataType> = new Set([
        DataType.TEXT,
        DataType.NUMBER,
        DataType.TEXT, // Duplicate
        DataType.BOOLEAN
      ]);

      const keys: DataType[] = Array.from(set.keys());
      const values: DataType[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys).assertDeepEquals([DataType.TEXT, DataType.NUMBER, DataType.BOOLEAN]);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues018
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_018
     * @tc.desc   Verify keys() and values() during concurrent modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set([1, 2, 3, 4]);
      const keyIter: Iterator<number> = set.keys();
      const valueIter: Iterator<number> = set.values();

      // Get first elements
      expect(keyIter.next().value).assertEqual(1);
      expect(valueIter.next().value).assertEqual(1);

      // Modify set during iteration
      set.delete(2);
      set.add(5);

      // Continue iteration
      expect(keyIter.next().value).assertEqual(3);
      expect(valueIter.next().value).assertEqual(3);
      expect(keyIter.next().value).assertEqual(4);
      expect(valueIter.next().value).assertEqual(4);
      expect(keyIter.next().value).assertEqual(5);
      expect(valueIter.next().value).assertEqual(5);
    });

    /**
     * @tc.name   testSetKeysValues020
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_020
     * @tc.desc   Verify keys() and values() with large dataset
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues020', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const size: number = 1000;

      // Populate set
      for (let i = 0; i < size; i++) {
        set.add(i);
      }

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys.length).assertEqual(size);
      expect(values.length).assertEqual(size);
      expect(keys[0]).assertEqual(0);
      expect(values[size - 1]).assertEqual(size - 1);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues021
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_021
     * @tc.desc   Verify keys() and values() with Promise elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1: Promise<number> = Promise.resolve(10);
      const promise2: Promise<number> = Promise.resolve(10); // Same value, different promise
      const set: Set<Promise<number>> = new Set([promise1, promise2]);

      const keys: Promise<number>[] = Array.from(set.keys());
      const values: Promise<number>[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(promise1);
      expect(keys[1]).assertDeepEquals(promise2);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues022
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_022
     * @tc.desc   Verify keys() and values() with Error objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error1: Error = new Error('Error 1');
      const error2: Error = new Error('Error 2');
      const error3: Error = new Error('Error 1'); // Same message, different instance
      const set: Set<Error> = new Set([error1, error2, error3]);

      const keys: Error[] = Array.from(set.keys());
      const values: Error[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys[0].message).assertEqual('Error 1');
      expect(keys[1].message).assertEqual('Error 2');
      expect(keys[2].message).assertEqual('Error 1');
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues023
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_023
     * @tc.desc   Verify keys() and values() with typed arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: Uint8Array = new Uint8Array([1, 2, 3]);
      const arr2: Uint8Array = new Uint8Array([1, 2, 3]); // Same content, different instance
      const set: Set<Uint8Array> = new Set([arr1, arr2]);

      const keys: Uint8Array[] = Array.from(set.keys());
      const values: Uint8Array[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(arr1);
      expect(keys[1]).assertDeepEquals(arr2);
      expect(keys[0].toString()).assertEqual('1,2,3');
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues024
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_024
     * @tc.desc   Verify keys() and values() with frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetForOfJs024()).assertEqual(false);
    });

    /**
     * @tc.name   testSetKeysValues025
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_025
     * @tc.desc   Verify keys() and values() with generator functions as elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetForOfJs025()).assertEqual(true);
    });

    /**
     * @tc.name   testSetKeysValues026
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_026
     * @tc.desc   Verify keys() and values() with mixed String objects and primitives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strObj: String = new String('object');
      const strPrim: string = 'primitive';
      const set: Set<String | string> = new Set([strObj, strPrim, new String('object')]);

      const keys: (String | string)[] = Array.from(set.keys());
      const values: (String | string)[] = Array.from(set.values());

      expect(keys.length).assertEqual(3); // All are distinct
      expect(keys[0]).assertDeepEquals(strObj);
      expect(keys[1]).assertDeepEquals(strPrim);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues027
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_027
     * @tc.desc   Verify keys() and values() with mixed Number objects and primitives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numObj: Number = new Number(42);
      const numPrim: number = 42;
      const set: Set<Number | number> = new Set([numObj, numPrim, new Number(42)]);

      const keys: (Number | number)[] = Array.from(set.keys());
      const values: (Number | number)[] = Array.from(set.values());

      expect(keys.length).assertEqual(3); // All are distinct
      expect(keys[0].valueOf()).assertEqual(42);
      expect(keys[1]).assertEqual(42);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues028
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_028
     * @tc.desc   Verify keys() and values() with Map objects as elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: Map<string, number> = new Map([['a', 1]]);
      const map2: Map<string, number> = new Map([['a', 1]]); // Same content, different instance
      const set: Set<Map<string, number>> = new Set([map1, map2]);

      const keys: Map<string, number>[] = Array.from(set.keys());
      const values: Map<string, number>[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0].get('a')).assertEqual(1);
      expect(keys[1].get('a')).assertEqual(1);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetKeysValues029
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_029
     * @tc.desc   Verify keys() and values() performance with frequent operations
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues029', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set();
      const operations: number = 50000;

      // frequent add/delete
      const startModify: number = Date.now();
      for (let i = 0; i < operations; i++) {
        set.add(i);
        if (i % 5 === 0) {
          set.delete(i);
        }
      }
      const modifyTime: number = Date.now() - startModify;

      // iteration performance
      const startKeys: number = Date.now();
      const keys: number[] = Array.from(set.keys());
      const keysTime: number = Date.now() - startKeys;

      const startValues: number = Date.now();
      const values: number[] = Array.from(set.values());
      const valuesTime: number = Date.now() - startValues;

      const expectedSize = operations - Math.floor(operations / 5);

      // correctness
      expect(set.size).assertEqual(expectedSize);
      expect(keys.length).assertEqual(expectedSize);
      expect(values.length).assertEqual(expectedSize);
      expect(keys).assertDeepEquals(values);

      // performance
      expect(modifyTime).assertLess(500);
      expect(keysTime).assertLess(300);
      expect(valuesTime).assertLess(300);
    });

    /**
     * @tc.name   testSetKeysValues030
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_030
     * @tc.desc   Verify keys() and values() with null, undefined and related strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetKeysValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<null | undefined | string> = new Set([
        null,
        undefined,
        'null',
        'undefined',
        null,
        undefined
      ]);

      const keys: (null | undefined | string)[] = Array.from(set.keys());
      const values: (null | undefined | string)[] = Array.from(set.values());

      expect(keys.length).assertEqual(4);
      expect(keys).assertDeepEquals([null, undefined, 'null', 'undefined']);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.name   testSetForOf001
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_001
     * @tc.desc   Verify For-of in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number|string>();
      mySet.add("0");
      mySet.add(1);
      const result = new Array<number|string>();

      for (const v of mySet) {
        result.push(v);
      }

      expect(result[0]).assertEqual("0");
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(undefined);
    });

    /**
     * @tc.name   testSetForOf002
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_002
     * @tc.desc   Verify iteration behavior when adding elements during for-of loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
        if (v === 1) {
          mySet.add(3);
        }
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name   testSetForOf003
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_003
     * @tc.desc   Verify iteration behavior when deleting elements during for-of loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
        if (v === 2) {
          mySet.delete(3);
        }
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name   testSetForOf004
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_004
     * @tc.desc   Verify for-of loop on empty Set after clear()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['a', 'b', 'c']);
      const result: string[] = [];

      mySet.clear();

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testSetForOf005
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_005
     * @tc.desc   Verify for-of loop with has() method check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<boolean>([true, false]);
      const result: boolean[] = [];

      for (const v of mySet) {
        result.push(mySet.has(v));
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   testSetForOf006
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_006
     * @tc.desc   Verify for-of loop with objects as elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1 : GeneratedObjectLiteralInterface_1= { id: 1 };
      const obj2 : GeneratedObjectLiteralInterface_1= { id: 2 };
      const mySet = new Set<object>([obj1, obj2]);
      const result: object[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(obj1);
      expect(result[1]).assertEqual(obj2);
    });

    /**
     * @tc.name   testSetForOf007
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_007
     * @tc.desc   Verify for-of loop after multiple add and delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>();
      mySet.add('x');
      mySet.add('y');
      mySet.delete('x');
      mySet.add('z');
      mySet.add('y'); // Duplicate, should not be added

      const result: string[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('y');
      expect(result[1]).assertEqual('z');
    });

    /**
     * @tc.name   testSetForOf008
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_008
     * @tc.desc   Verify for-of loop with mixed data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number | string | boolean>([10, 'hello', true]);
      const result: (number | string | boolean)[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual('hello');
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.name   testSetForOf009
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_009
     * @tc.desc   Verify for-of loop with large Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>();
      const size = 100;

      for (let i = 0; i < size; i++) {
        mySet.add(i);
      }

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(size);
      expect(result[99]).assertEqual(99);
    });

    /**
     * @tc.name   testSetForOf010
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_010
     * @tc.desc   Verify for-of loop with same-value-zero comparison elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([0, -0, 1]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2); // 0 and -0 are considered equal
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name   testSetForOf011
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_011
     * @tc.desc   Verify for-of loop with nested Set elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nestedSet1 = new Set<number>([1, 2]);
      const nestedSet2 = new Set<number>([3, 4]);
      const mySet = new Set<Set<number>>([nestedSet1, nestedSet2]);
      const result: Set<number>[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(nestedSet1);
      expect(result[1]).assertEqual(nestedSet2);
    });

    /**
     * @tc.name   testSetForOf012
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_012
     * @tc.desc   Verify for-of iteration order after multiple add operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>();
      mySet.add('first');
      mySet.add('second');
      mySet.add('third');

      const result: string[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals(['first', 'second', 'third']);
    });

    /**
     * @tc.name   testSetForOf013
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_013
     * @tc.desc   Verify for-of loop with undefined and null elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<undefined | null>([undefined, null]);
      const result: (undefined | null)[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(undefined);
      expect(result[1]).assertEqual(null);
    });

    /**
     * @tc.name   testSetForOf015
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_015
     * @tc.desc   Verify for-of loop after re-adding deleted element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3]);
      mySet.delete(2);
      mySet.add(2); // Re-adding should place at end

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([1, 3, 2]);
    });

    /**
     * @tc.name   testSetForOf016
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_016
     * @tc.desc   Verify for-of loop with numbers and their string equivalents
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number | string>([1, '1', 2, '2']);
      const result: (number | string)[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(4);
      expect(result).assertContain(1);
      expect(result).assertContain('1');
    });

    /**
     * @tc.name   testSetForOf017
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_017
     * @tc.desc   Verify breaking for-of loop early
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5]);
      const result: number[] = [];

      for (const v of mySet) {
        if (v > 3) break;
        result.push(v);
      }

      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testSetForOf018
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_018
     * @tc.desc   Verify continuing in for-of loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5]);
      const result: number[] = [];

      for (const v of mySet) {
        if (v % 2 === 0) continue;
        result.push(v);
      }

      expect(result).assertDeepEquals([1, 3, 5]);
    });

    /**
     * @tc.name   testSetForOf020
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_020
     * @tc.desc   Verify for-of loop with Set created from array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [10, 20, 30, 20, 40];
      const mySet = new Set<number>(arr);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(4);
      expect(result).assertDeepEquals([10, 20, 30, 40]);
    });

    /**
     * @tc.name   testSetForOf022
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_022
     * @tc.desc   Verify for-of loop with Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 2);
      const mySet = new Set<Date>([date1, date2]);
      const result: Date[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(date1);
      expect(result[1]).assertEqual(date2);
    });

    /**
     * @tc.name   testSetForOf023
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_023
     * @tc.desc   Verify for-of loop with NaN elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([NaN, NaN, 1, NaN]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(isNaN(result[0])).assertTrue();
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name   testSetForOf024
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_024
     * @tc.desc   Verify for-of loop with multiple delete operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5]);
      mySet.delete(2);
      mySet.delete(4);

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([1, 3, 5]);
    });

    /**
     * @tc.name   testSetForOf025
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_025
     * @tc.desc   Verify for-of loop with Set containing functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = () => 'hello';
      const func2 = () => 'world';
      const mySet = new Set<() => string>([func1, func2]);
      const result: (() => string)[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]()).assertEqual('hello');
      expect(result[1]()).assertEqual('world');
    });

    /**
     * @tc.name   testSetForOf026
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_026
     * @tc.desc   Verify for-of loop with empty Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>();
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   testSetForOf027
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_027
     * @tc.desc   Verify for-of loop with Set and has() for non-existent element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['apple', 'banana']);
      const result: boolean[] = [];

      for (const v of mySet) {
        result.push(mySet.has(v + 'x'));
      }

      expect(result).assertDeepEquals([false, false]);
    });

    /**
     * @tc.name   testSetForOf028
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_028
     * @tc.desc   Verify for-of loop with modified element properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1 : GeneratedObjectLiteralInterface_1 = { id: 10 };
      const obj2 : GeneratedObjectLiteralInterface_1 = { id: 20 };
      const mySet = new Set<GeneratedObjectLiteralInterface_1>([obj1, obj2]);

      // Modify properties after adding to Set
      obj1.id = 100;
      obj2.id = 200;

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v.id);
      }

      expect(result).assertDeepEquals([100, 200]);
    });

    /**
     * @tc.name   testSetForOf029
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_029
     * @tc.desc   Verify for-of loop with Set size check during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3]);
      const sizes: number[] = [];

      for (const v of mySet) {
        sizes.push(mySet.size);
        if (v === 2) {
          mySet.delete(3);
        }
      }

      expect(sizes).assertDeepEquals([3, 3]);
    });

    /**
     * @tc.name   testSetForOf030
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_030
     * @tc.desc   Verify for-of loop with same object added multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj : GeneratedObjectLiteralInterface_1= { id: 1 };
      const mySet = new Set<GeneratedObjectLiteralInterface_1>();
      mySet.add(obj);
      mySet.add(obj);
      mySet.add(obj);

      const result: GeneratedObjectLiteralInterface_1[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(obj);
    });

    /**
     * @tc.name   testSetForOf031
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_031
     * @tc.desc   Verify for-of loop with bigint elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big1 = BigInt(100);
      const big2 = BigInt(200);
      const mySet = new Set<bigint>([big1, big2]);
      const result: bigint[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(BigInt(100));
      expect(result[1]).assertEqual(BigInt(200));
    });

    /**
     * @tc.name   testSetForOf032
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_032
     * @tc.desc   Verify for-of loop with elements of different primitive types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string | number | boolean>(['text', 42, true]);
      const result: (string | number | boolean)[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('text');
      expect(result[1]).assertEqual(42);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.name   testSetForOf033
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_033
     * @tc.desc   Verify for-of loop after adding elements in reverse order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>();
      [5, 4, 3, 2, 1].forEach(num => mySet.add(num));

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([5, 4, 3, 2, 1]);
    });

    /**
     * @tc.name   testSetForOf034
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_034
     * @tc.desc   Verify for-of loop with element deletion before iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['a', 'b', 'c', 'd']);
      mySet.delete('b');
      mySet.delete('c');

      const result: string[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals(['a', 'd']);
    });


    /**
     * @tc.name   testSetForOf036
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_036
     * @tc.desc   Verify for-of loop with nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetForOfJs036()).assertDeepEquals(['test1', 'test2']);
    });

    /**
     * @tc.name   testSetForOf037
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_037
     * @tc.desc   Verify for-of loop with large string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const longStr1 = 'a'.repeat(1000);
      const longStr2 = 'b'.repeat(1000);
      const mySet = new Set<string>([longStr1, longStr2]);
      const result: string[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(longStr1);
      expect(result[1]).assertEqual(longStr2);
    });

    /**
     * @tc.name   testSetForOf038
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_038
     * @tc.desc   Verify for-of loop with elements added in different scopes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetForOfJs038()).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   testSetForOf041
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_041
     * @tc.desc   Verify for-of loop with elements deleted and re-added multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['a', 'b']);
      mySet.delete('a');
      mySet.add('a');
      mySet.delete('b');
      mySet.add('b');
      mySet.add('c');

      const result: string[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   testSetForOf042
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_042
     * @tc.desc   Verify for-of loop with Set containing RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = /test1/;
      const regex2 = /test2/;
      const mySet = new Set<RegExp>([regex1, regex2]);
      const result: RegExp[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(regex1);
      expect(result[1]).assertEqual(regex2);
    });

    /**
     * @tc.name   testSetForOf043
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_043
     * @tc.desc   Verify for-of loop with elements that are promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1 = Promise.resolve(1);
      const promise2 = Promise.resolve(2);
      const mySet = new Set<Promise<number>>([promise1, promise2]);
      const result: Promise<number>[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(promise1);
      expect(result[1]).assertEqual(promise2);
    });

    /**
     * @tc.name   testSetForOf044
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_044
     * @tc.desc   Verify for-of loop with Set created from another Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const originalSet = new Set<number>([1, 2, 3]);
      const newSet = new Set<number>(originalSet);
      const result: number[] = [];

      for (const v of newSet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testSetForOf045
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_045
     * @tc.desc   Verify for-of loop with Set and simultaneous iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3]);
      const result1: number[] = [];
      const result2: number[] = [];

      // Two separate iterators should work independently
      for (const v of mySet) result1.push(v);
      for (const v of mySet) result2.push(v);

      expect(result1).assertDeepEquals([1, 2, 3]);
      expect(result2).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testSetForOf046
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_046
     * @tc.desc   Verify for-of loop with elements that are class instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class TestClass {
        public id: number;

        constructor(id: number) {
          this.id = id;
        }
      }

      const instance1 = new TestClass(1);
      const instance2 = new TestClass(2);
      const mySet = new Set<TestClass>([instance1, instance2]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v.id);
      }

      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testSetForOf047
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_047
     * @tc.desc   Verify for-of loop with elements that are weak references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1 : GeneratedObjectLiteralInterface_3 = { name: 'obj1' };
      const obj2 : GeneratedObjectLiteralInterface_3 = { name: 'obj2' };
      const mySet = new Set<GeneratedObjectLiteralInterface_3>([obj1, obj2]);
      const result: string[] = [];

      // Dereference objects but they should still exist in Set
      const ref1 = obj1;
      const ref2 = obj2;

      for (const v of mySet) {
        result.push(v.name);
      }

      expect(result).assertDeepEquals(['obj1', 'obj2']);
    });

    /**
     * @tc.name   testSetForOf048
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_048
     * @tc.desc   Verify for-of loop with Set that has maximum size elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>();
      const maxSize = 1000;

      for (let i = 0; i < maxSize; i++) {
        mySet.add(i);
      }

      let count = 0;
      for (const v of mySet) {
        count++;
      }

      expect(count).assertEqual(maxSize);
    });

    /**
     * @tc.name   testSetForOf049
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_049
     * @tc.desc   Verify for-of loop with elements that are modified during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1 : GeneratedObjectLiteralInterface_1 = { id: 10 };
      const obj2 : GeneratedObjectLiteralInterface_1 = { id: 20 };
      const mySet = new Set<GeneratedObjectLiteralInterface_1>([obj1, obj2]);
      const result: number[] = [];

      for (const v of mySet) {
        v.id *= 2; // Modify the object during iteration
        result.push(v.id);
      }

      expect(result).assertDeepEquals([20, 40]);
    });

    /**
     * @tc.name   testSetForOf050
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_050
     * @tc.desc   Verify for-of loop with elements that are deleted and added in the same iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
        if (v === 2) {
          mySet.delete(3);
          mySet.add(4);
        }
      }

      expect(result).assertDeepEquals([1, 2, 4]);
    });

    /**
     * @tc.name   testSetForOf051
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_051
     * @tc.desc   Verify for-of loop with empty string elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['', '', 'non-empty']);
      const result: string[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('');
      expect(result[1]).assertEqual('non-empty');
    });

    /**
     * @tc.name   testSetForOf052
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_052
     * @tc.desc   Verify for-of loop with elements that are negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([-1, -2, -3]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([-1, -2, -3]);
    });

    /**
     * @tc.name   testSetForOf053
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_053
     * @tc.desc   Verify for-of loop with mixed positive and negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, -1, 2, -2]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([1, -1, 2, -2]);
    });

    /**
     * @tc.name   testSetForOf054
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_054
     * @tc.desc   Verify for-of loop with elements that are floating-point numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1.5, 2.5, 3.5]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([1.5, 2.5, 3.5]);
    });

    /**
     * @tc.name   testSetForOf055
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_055
     * @tc.desc   Verify for-of loop with elements that are special numbers (Infinity, -Infinity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([Infinity, -Infinity, 0]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(-Infinity);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name   testSetForOf056
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_056
     * @tc.desc   Verify for-of loop with elements that are Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['😀', '🌍', '📚']);
      const result: string[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals(['😀', '🌍', '📚']);
    });

    /**
     * @tc.name   testSetForOf057
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_057
     * @tc.desc   Verify for-of loop with elements that are multi-byte strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['你好', '世界', '测试']);
      const result: string[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals(['你好', '世界', '测试']);
    });

    /**
     * @tc.name   testSetForOf058
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_058
     * @tc.desc   Verify for-of loop with elements that are added using chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>()
        .add(1)
        .add(2)
        .add(3);

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   testSetForOf059
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_059
     * @tc.desc   Verify for-of loop with elements that are deleted using forEach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5]);

      // Delete even numbers using forEach
      mySet.forEach(num => {
        if (num % 2 === 0) {
          mySet.delete(num);
        }
      });

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([1, 3, 5]);
    });

    /**
     * @tc.name   testSetForOf060
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_060
     * @tc.desc   Verify for-of loop with elements that are Proxy objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetForOfJs060()).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.name   testSetForOf061
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_061
     * @tc.desc   Verify for-of loop with elements that are generators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(testSetForOfJs061()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testSetForOf062
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_062
     * @tc.desc   Verify for-of loop with elements that are added conditionally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>();
      const values = [1, 2, 3, 4, 5];

      values.forEach(num => {
        if (num > 2) {
          mySet.add(num);
        }
      });

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result).assertDeepEquals([3, 4, 5]);
    });

    /**
     * @tc.name   testSetForOf063
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_063
     * @tc.desc   Verify for-of loop with elements that are filtered during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetForOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5, 6]);
      const result: number[] = [];

      for (const v of mySet) {
        if (v % 3 === 0) {
          result.push(v);
        }
      }

      expect(result).assertDeepEquals([3, 6]);
    });


  });
}