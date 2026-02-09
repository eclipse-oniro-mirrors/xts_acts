
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { GeneratedObjectLiteralInterface_1, GeneratedObjectLiteralInterface_3 } from './SetKeys.test';


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

class TestClass {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }
}

export default function SetFromTest() {
  describe('SetFromTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_001
     * @tc.name testSetKeysValues001
     * @tc.desc Verify keys() and values() return same elements for primitive values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set<string>(['a', 'b', 'c']);

      const keys: string[] = Array.from(set.keys());
      const values: string[] = Array.from(set.values());

      expect(keys).assertDeepEquals(values);
      expect(keys).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_002
     * @tc.name testSetKeysValues002
     * @tc.desc Verify keys() and values() consistency after add operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set<number>([1, 2]);
      set.add(3);
      set.add(4);
      set.add(2);

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys.length).assertEqual(4);
      expect(keys).assertDeepEquals(values);
      expect(JSON.stringify(keys)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_003
     * @tc.name testSetKeysValues003
     * @tc.desc Verify keys() and values() after delete operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<boolean> = new Set<boolean>([true, false, true]);
      set.delete(true);

      const keys: boolean[] = Array.from(set.keys());
      const values: boolean[] = Array.from(set.values());

      expect(JSON.stringify(keys)).assertDeepEquals(JSON.stringify([false]));
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_004
     * @tc.name testSetKeysValues004
     * @tc.desc Verify keys() and values() for empty Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set<number>();

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys).assertDeepEquals([] as number[]);
      expect(values).assertDeepEquals([] as number[]);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_005
     * @tc.name testSetKeysValues005
     * @tc.desc Verify keys() and values() with object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: BasicEntity = { id: '1', value: 100 };
      const obj2: BasicEntity = { id: '2', value: 200 };
      const set: Set<BasicEntity> = new Set<BasicEntity>([obj1, obj2]);

      const keys: BasicEntity[] = Array.from(set.keys());
      const values: BasicEntity[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(obj1);
      expect(keys[1]).assertDeepEquals(obj2);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_006
     * @tc.name testSetKeysValues006
     * @tc.desc Verify keys() and values() with mixed primitive types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string | number | boolean> = new Set<string | number | boolean>([
        'text', 42, true, 'text', 42
      ]);

      const keys: (string | number | boolean)[] = Array.from(set.keys());
      const values: (string | number | boolean)[] = Array.from(set.values());

      expect(JSON.stringify(keys)).assertDeepEquals(JSON.stringify(['text', 42, true]));
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_007
     * @tc.name testSetKeysValues007
     * @tc.desc Verify keys() and values() after clear() operation
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set<number>([10, 20, 30]);
      set.clear();

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys).assertDeepEquals([] as number[]);
      expect(values).assertDeepEquals([] as number[]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_008
     * @tc.name testSetKeysValues008
     * @tc.desc Verify simultaneous iteration with keys() and values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<string> = new Set<string>(['apple', 'banana', 'cherry']);

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
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_010
     * @tc.name testSetKeysValues010
     * @tc.desc Verify keys() and values() with BigInt elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const big1: bigint = 1234567890123456789n;
      const big2: bigint = 1234567890123456789n;
      const big3: bigint = 9876543210987654321n;

      const set: Set<bigint> = new Set<bigint>([big1, big2, big3]);

      const keys: bigint[] = Array.from(set.keys());
      const values: bigint[] = Array.from(set.values());

      expect(set.size).assertEqual(2);
      expect(keys.map((x) : void => x.toString())).assertDeepEquals([big1, big3].map((x) : void => x.toString()));
      expect(values.map((x) : void => x.toString())).assertDeepEquals([big1, big3].map((x) : void => x.toString()));
      expect(keys.map((x) : void => x.toString())).assertDeepEquals(values.map((x) : void => x.toString()));

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_011
     * @tc.name testSetKeysValues011
     * @tc.desc Verify keys() and values() with Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1: Date = new Date('2024-01-01');
      const date2: Date = new Date('2024-01-01');
      const set: Set<Date> = new Set<Date>([date1, date2]);

      const keys: Date[] = Array.from(set.keys());
      const values: Date[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(date1);
      expect(keys[1]).assertDeepEquals(date2);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_012
     * @tc.name testSetKeysValues012
     * @tc.desc Verify keys() and values() with class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const item1: DataModel = new DataModel(1, 'First');
      const item2: DataModel = new DataModel(2, 'Second');
      const item3: DataModel = new DataModel(1, 'First');
      const set: Set<DataModel> = new Set<DataModel>([item1, item2, item3]);

      const keys: DataModel[] = Array.from(set.keys());
      const values: DataModel[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys[0].code).assertEqual(1);
      expect(keys[1].code).assertEqual(2);
      expect(keys[2].code).assertEqual(1);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_013
     * @tc.name testSetKeysValues013
     * @tc.desc Verify keys() and values() with modified objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj: BasicEntity = { id: 'init', value: 0 };
      const set: Set<BasicEntity> = new Set<BasicEntity>([obj]);

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
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_015
     * @tc.name testSetKeysValues015
     * @tc.desc Verify keys() and values() with regex elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1: RegExp = new RegExp('pattern');
      const regex2: RegExp = new RegExp('pattern');
      const set: Set<RegExp> = new Set<RegExp>([regex1, regex2]);

      const keys: RegExp[] = Array.from(set.keys());
      const values: RegExp[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(regex1);
      expect(keys[1]).assertDeepEquals(regex2);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_016
     * @tc.name testSetKeysValues016
     * @tc.desc Verify keys() and values() with NaN and special numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set<number>([
        0, -0,
        Infinity, -Infinity
      ]);

      const keys: number[] = Array.from(set.keys());
      const values: number[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_017
     * @tc.name testSetKeysValues017
     * @tc.desc Verify keys() and values() with enum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<DataType> = new Set<DataType>([
        DataType.TEXT,
        DataType.NUMBER,
        DataType.TEXT,
        DataType.BOOLEAN
      ]);

      const keys: DataType[] = Array.from(set.keys());
      const values: DataType[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys).assertDeepEquals([DataType.TEXT, DataType.NUMBER, DataType.BOOLEAN]);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_018
     * @tc.name testSetKeysValues018
     * @tc.desc Verify keys() and values() during concurrent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set<number>([1, 2, 3, 4]);
      const keyIter: Iterator<number> = set.keys();
      const valueIter: Iterator<number> = set.values();

      expect(keyIter.next().value).assertEqual(1);
      expect(valueIter.next().value).assertEqual(1);

      set.delete(2);
      set.add(5);

      expect(keyIter.next().value).assertEqual(3);
      expect(valueIter.next().value).assertEqual(3);
      expect(keyIter.next().value).assertEqual(4);
      expect(valueIter.next().value).assertEqual(4);
      expect(keyIter.next().value).assertEqual(5);
      expect(valueIter.next().value).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_020
     * @tc.name testSetKeysValues020
     * @tc.desc Verify keys() and values() with large dataset
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues020', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set: Set<number> = new Set<number>();
      const size: int = 1000;
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
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_021
     * @tc.name testSetKeysValues021
     * @tc.desc Verify keys() and values() with Promise elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1: Promise<Int> = Promise.resolve(10);
      const promise2: Promise<Int> = Promise.resolve(10);
      const set: Set<Promise<Int>> = new Set<Promise<Int>>([promise1, promise2]);

      const keys: Promise<Int>[] = Array.from(set.keys());
      const values: Promise<Int>[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(promise1);
      expect(keys[1]).assertDeepEquals(promise2);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_022
     * @tc.name testSetKeysValues022
     * @tc.desc Verify keys() and values() with Error objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error1: Error = new Error('Error 1');
      const error2: Error = new Error('Error 2');
      const error3: Error = new Error('Error 1');
      const set: Set<Error> = new Set<Error>([error1, error2, error3]);

      const keys: Error[] = Array.from(set.keys());
      const values: Error[] = Array.from(set.values());

      expect(keys.length).assertEqual(3);
      expect(keys[0].message).assertEqual('Error 1');
      expect(keys[1].message).assertEqual('Error 2');
      expect(keys[2].message).assertEqual('Error 1');
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_023
     * @tc.name testSetKeysValues023
     * @tc.desc Verify keys() and values() with typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1: Uint8Array = new Uint8Array([1, 2, 3]);
      const arr2: Uint8Array = new Uint8Array([1, 2, 3]);
      const set: Set<Uint8Array> = new Set<Uint8Array>([arr1, arr2]);

      const keys: Uint8Array[] = Array.from(set.keys());
      const values: Uint8Array[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertDeepEquals(arr1);
      expect(keys[1]).assertDeepEquals(arr2);
      expect(keys[0].toString()).assertEqual('1,2,3');
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_028
     * @tc.name testSetKeysValues028
     * @tc.desc Verify keys() and values() with Map objects as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1: Map<string, number> = new Map<string, number>([['a', 1]]);
      const map2: Map<string, number> = new Map<string, number>([['a', 1]]);
      const set: Set<Map<string, number>> = new Set<Map<string, number>>([map1, map2]);

      const keys: Map<string, number>[] = Array.from(set.keys());
      const values: Map<string, number>[] = Array.from(set.values());

      expect(keys.length).assertEqual(2);
      expect(keys[0].get('a')).assertEqual(1);
      expect(keys[1].get('a')).assertEqual(1);
      expect(keys).assertDeepEquals(values);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_KEYS_VALUES_030
     * @tc.name testSetKeysValues030
     * @tc.desc Verify keys() and values() with null, undefined and related strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetKeysValues030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set: Set<null | undefined | string> = new Set<null | undefined | string>([
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_001
     * @tc.name testSetForOf001
     * @tc.desc Verify For-of in Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_002
     * @tc.name testSetForOf002
     * @tc.desc Verify iteration behavior when adding elements during for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_003
     * @tc.name testSetForOf003
     * @tc.desc Verify iteration behavior when deleting elements during for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_004
     * @tc.name testSetForOf004
     * @tc.desc Verify for-of loop on empty Set after clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_005
     * @tc.name testSetForOf005
     * @tc.desc Verify for-of loop with has() method check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_006
     * @tc.name testSetForOf006
     * @tc.desc Verify for-of loop with objects as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_007
     * @tc.name testSetForOf007
     * @tc.desc Verify for-of loop after multiple add and delete operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>();
      mySet.add('x');
      mySet.add('y');
      mySet.delete('x');
      mySet.add('z');
      mySet.add('y');

      const result: string[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('y');
      expect(result[1]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_008
     * @tc.name testSetForOf008
     * @tc.desc Verify for-of loop with mixed data types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_009
     * @tc.name testSetForOf009
     * @tc.desc Verify for-of loop with large Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_010
     * @tc.name testSetForOf010
     * @tc.desc Verify for-of loop with same-value-zero comparison elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([0, -0, 1]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_011
     * @tc.name testSetForOf011
     * @tc.desc Verify for-of loop with nested Set elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_012
     * @tc.name testSetForOf012
     * @tc.desc Verify for-of iteration order after multiple add operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_013
     * @tc.name testSetForOf013
     * @tc.desc Verify for-of loop with undefined and null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_015
     * @tc.name testSetForOf015
     * @tc.desc Verify for-of loop after re-adding deleted element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3]);
      mySet.delete(2);
      mySet.add(2);

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 3, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_016
     * @tc.name testSetForOf016
     * @tc.desc Verify for-of loop with numbers and their string equivalents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_017
     * @tc.name testSetForOf017
     * @tc.desc Verify breaking for-of loop early
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5]);
      const result: number[] = [];

      for (const v of mySet) {
        if (v > 3) break;
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_018
     * @tc.name testSetForOf018
     * @tc.desc Verify continuing in for-of loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5]);
      const result: number[] = [];

      for (const v of mySet) {
        if (v % 2 === 0) continue;
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 3, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_020
     * @tc.name testSetForOf020
     * @tc.desc Verify for-of loop with Set created from array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = [10, 20, 30, 20, 40];
      const mySet = new Set<int>(arr);
      const result: int[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(4);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([10, 20, 30, 40]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_022
     * @tc.name testSetForOf022
     * @tc.desc Verify for-of loop with Date objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_023
     * @tc.name testSetForOf023
     * @tc.desc Verify for-of loop with NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_024
     * @tc.name testSetForOf024
     * @tc.desc Verify for-of loop with multiple delete operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5]);
      mySet.delete(2);
      mySet.delete(4);

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 3, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_025
     * @tc.name testSetForOf025
     * @tc.desc Verify for-of loop with Set containing functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_026
     * @tc.name testSetForOf026
     * @tc.desc Verify for-of loop with empty Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_027
     * @tc.name testSetForOf027
     * @tc.desc Verify for-of loop with Set and has() for non-existent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_028
     * @tc.name testSetForOf028
     * @tc.desc Verify for-of loop with modified element properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1 : GeneratedObjectLiteralInterface_1 = { id: 10 };
      const obj2 : GeneratedObjectLiteralInterface_1 = { id: 20 };
      const mySet = new Set<GeneratedObjectLiteralInterface_1>([obj1, obj2]);

      obj1.id = 100;
      obj2.id = 200;

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v.id);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([100, 200]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_029
     * @tc.name testSetForOf029
     * @tc.desc Verify for-of loop with Set size check during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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

      expect(JSON.stringify(sizes)).assertDeepEquals(JSON.stringify([3, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_030
     * @tc.name testSetForOf030
     * @tc.desc Verify for-of loop with same object added multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_031
     * @tc.name testSetForOf031
     * @tc.desc Verify for-of loop with bigint elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_032
     * @tc.name testSetForOf032
     * @tc.desc Verify for-of loop with elements of different primitive types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_033
     * @tc.name testSetForOf033
     * @tc.desc Verify for-of loop after adding elements in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>();
      [5, 4, 3, 2, 1].forEach((num) : void => mySet.add(num));

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([5, 4, 3, 2, 1]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_034
     * @tc.name testSetForOf034
     * @tc.desc Verify for-of loop with element deletion before iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['a', 'b', 'c', 'd']);
      mySet.delete('b');
      mySet.delete('c');

      const result: string[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify(['a', 'd']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_037
     * @tc.name testSetForOf037
     * @tc.desc Verify for-of loop with large string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_041
     * @tc.name testSetForOf041
     * @tc.desc Verify for-of loop with elements deleted and re-added multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify(['a', 'b', 'c']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_042
     * @tc.name testSetForOf042
     * @tc.desc Verify for-of loop with Set containing RegExp objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = new RegExp('test1');
      const regex2 = new RegExp('test2');
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_043
     * @tc.name testSetForOf043
     * @tc.desc Verify for-of loop with elements that are promises
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise1 = Promise.resolve(1);
      const promise2 = Promise.resolve(2);
      const mySet = new Set<Promise<Int>>([promise1, promise2]);
      const result: Promise<Int>[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(promise1);
      expect(result[1]).assertEqual(promise2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_044
     * @tc.name testSetForOf044
     * @tc.desc Verify for-of loop with Set created from another Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const originalSet = new Set<number>([1, 2, 3]);
      const newSet = new Set<number>(originalSet);
      const result: number[] = [];

      for (const v of newSet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_045
     * @tc.name testSetForOf045
     * @tc.desc Verify for-of loop with Set and simultaneous iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3]);
      const result1: number[] = [];
      const result2: number[] = [];
      for (const v of mySet) result1.push(v);
      for (const v of mySet) result2.push(v);

      expect(JSON.stringify(result1)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      expect(JSON.stringify(result2)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_046
     * @tc.name testSetForOf046
     * @tc.desc Verify for-of loop with elements that are class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      const instance1 = new TestClass(1);
      const instance2 = new TestClass(2);
      const mySet = new Set<TestClass>([instance1, instance2]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v.id);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_047
     * @tc.name testSetForOf047
     * @tc.desc Verify for-of loop with elements that are weak references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1 : GeneratedObjectLiteralInterface_3 = { name: 'obj1' };
      const obj2 : GeneratedObjectLiteralInterface_3 = { name: 'obj2' };
      const mySet = new Set<GeneratedObjectLiteralInterface_3>([obj1, obj2]);
      const result: string[] = [];

      const ref1 = obj1;
      const ref2 = obj2;

      for (const v of mySet) {
        result.push(v.name);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify(['obj1', 'obj2']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_048
     * @tc.name testSetForOf048
     * @tc.desc Verify for-of loop with Set that has maximum size elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_049
     * @tc.name testSetForOf049
     * @tc.desc Verify for-of loop with elements that are modified during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1 : GeneratedObjectLiteralInterface_1 = { id: 10 };
      const obj2 : GeneratedObjectLiteralInterface_1 = { id: 20 };
      const mySet = new Set<GeneratedObjectLiteralInterface_1>([obj1, obj2]);
      const result: number[] = [];

      for (const v of mySet) {
        v.id *= 2;
        result.push(v.id);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([20, 40]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_050
     * @tc.name testSetForOf050
     * @tc.desc Verify for-of loop with elements that are deleted and added in the same iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 4]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_051
     * @tc.name testSetForOf051
     * @tc.desc Verify for-of loop with empty string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_052
     * @tc.name testSetForOf052
     * @tc.desc Verify for-of loop with elements that are negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([-1, -2, -3]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([-1, -2, -3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_053
     * @tc.name testSetForOf053
     * @tc.desc Verify for-of loop with mixed positive and negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, -1, 2, -2]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, -1, 2, -2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_054
     * @tc.name testSetForOf054
     * @tc.desc Verify for-of loop with elements that are floating-point numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1.5, 2.5, 3.5]);
      const result: number[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1.5, 2.5, 3.5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_055
     * @tc.name testSetForOf055
     * @tc.desc Verify for-of loop with elements that are special numbers (Infinity, -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_056
     * @tc.name testSetForOf056
     * @tc.desc Verify for-of loop with elements that are Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['😀', '🌍', '📚']);
      const result: string[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify(['😀', '🌍', '📚']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_057
     * @tc.name testSetForOf057
     * @tc.desc Verify for-of loop with elements that are multi-byte strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<string>(['你好', '世界', '测试']);
      const result: string[] = [];

      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify(['你好', '世界', '测试']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_058
     * @tc.name testSetForOf058
     * @tc.desc Verify for-of loop with elements that are added using chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
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

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_059
     * @tc.name testSetForOf059
     * @tc.desc Verify for-of loop with elements that are deleted using forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5]);

      mySet.forEach((num: number, value2: Double, set: Set<number>) : void => {
        if (num % 2 === 0) {
          mySet.delete(num);
        }
      });

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 3, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_062
     * @tc.name testSetForOf062
     * @tc.desc Verify for-of loop with elements that are added conditionally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>();
      const values : number[]= [1, 2, 3, 4, 5];

      values.forEach((num: number, value2: int, set: Array<number>) : void => {
        if (num > 2) {
          mySet.add(num);
        }
      });

      const result: number[] = [];
      for (const v of mySet) {
        result.push(v);
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([3, 4, 5]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_063
     * @tc.name testSetForOf063
     * @tc.desc Verify for-of loop with elements that are filtered during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSetForOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const mySet = new Set<number>([1, 2, 3, 4, 5, 6]);
      const result: number[] = [];

      for (const v of mySet) {
        if (v % 3 === 0) {
          result.push(v);
        }
      }

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([3, 6]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_SET_For_Of_064
     * @tc.name testSetForOf064
     * @tc.desc Verify for-of loop with elements that are transformed during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */

  });
}