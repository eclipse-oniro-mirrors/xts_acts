/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

interface ObjectWithId {
  id: number;
}

interface ObjectWithValue {
  value: number;
}

interface MappedObject {
  original: int;
  squared: int;
  isEven: boolean;
}

interface GeneratedTypeLiteralInterface_2 {
  name: string;
  value: number;
}

interface NestedObject068 {
    id: number;
    details: GeneratedTypeLiteralInterface_2;
}

interface NestedObject069 {
    id: number;
    details: GeneratedTypeLiteralInterface_2;
}

type MixedType067 = number | string | null;

export default function ArrayFromTest() {
  describe('ArrayFromTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.name   testArrayFrom0001
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0001
     * @tc.desc   Verify Array.from() creates array from string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = 'hello';
      const arr = Array.from(str);
      expect(arr).assertDeepEquals(['h', 'e', 'l', 'l', 'o']);
    });

    /**
     * @tc.name   testArrayFrom0002
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0002
     * @tc.desc   Verify Array.from() creates array from empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = '';
      const arr = Array.from(str);
      let arr1: [] = [];
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify(arr1));
    });

    /**
     * @tc.name   testArrayFrom0003
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0003
     * @tc.desc   Verify Array.from() creates array from Set of numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<number>([1, 2, 3, 3]);
      const arr = Array.from(set);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFrom0004
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0004
     * @tc.desc   Verify Array.from() creates array from Set of strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<string>(['a', 'b', 'c']);
      const arr = Array.from(set);
      expect(arr).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   testArrayFrom0005
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0005
     * @tc.desc   Verify Array.from() creates array from Map entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const arr = Array.from(map);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([[1, 'one'], [2, 'two']]));
    });

    /**
     * @tc.name   testArrayFrom0006
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0006
     * @tc.desc   Verify Array.from() creates array from Map keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const arr = Array.from(map.keys());
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   testArrayFrom0007
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0007
     * @tc.desc   Verify Array.from() creates array from Map values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const arr = Array.from(map.values());
      expect(arr).assertDeepEquals(['one', 'two']);
    });

    /**
     * @tc.name   testArrayFrom0010
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0010
     * @tc.desc   Verify Array.from() with mapFn for number conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = '1234';
      const arr = Array.from(str, (val: string) => parseInt(val, 10));
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   testArrayFrom0011
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0011
     * @tc.desc   Verify Array.from() with mapFn for string uppercase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = 'abc';
      const arr = Array.from(str, (val: string) => val.toUpperCase());
      expect(arr).assertDeepEquals(['A', 'B', 'C']);
    });

    /**
     * @tc.name   testArrayFrom0012
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0012
     * @tc.desc   Verify Array.from() with mapFn and index parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = 'abc';
      const arr = Array.from(str, (val: string, idx) => `${val}-${idx}`);
      expect(arr).assertDeepEquals(['a-0', 'b-1', 'c-2']);
    });

    /**
     * @tc.name   testArrayFrom0014
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0014
     * @tc.desc   Verify Array.from() creates array from empty Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      const arr = Array.from(set);
      let arr1: [] = [];
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify(arr1));
    });

    /**
     * @tc.name   testArrayFrom0015
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0015
     * @tc.desc   Verify Array.from() creates array from empty Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>();
      const arr = Array.from(map);
      let arr1: [] = [];
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify(arr1));
    });

    /**
     * @tc.name   testArrayFrom0017
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0017
     * @tc.desc   Verify Array.from() creates array from typed array (Uint8Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr = new Uint8Array([1, 2, 3]);
      const arr = Array.from(typedArr);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFrom0018
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0018
     * @tc.desc   Verify Array.from() creates array from typed array (Float32Array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr = new Float32Array([1.1, 2.2, 3.3]);
      const arr = Array.from(typedArr);
      expect(arr).assertDeepEquals([1.100000023841858, 2.200000047683716, 3.299999952316284]);
    });

    /**
     * @tc.name   testArrayFrom0019
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0019
     * @tc.desc   Verify Array.from() with mapFn on typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr = new Uint8Array([1, 2, 3]);
      const arr = Array.from(typedArr, (num: number) => num * 2);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([2, 4, 6]));
    });

    /**
     * @tc.name   testArrayFrom0021
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0021
     * @tc.desc   Verify Array.from() creates array from boolean Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<boolean>([true, false, true]);
      const arr = Array.from(set);
      expect(arr).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   testArrayFrom0023
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0023
     * @tc.desc   Verify Array.from() with mapFn returns correct type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = Array.from([1, 2, 3], (num: int) => num.toString());
      expect(arr).assertDeepEquals(['1', '2', '3']);
    });

    /**
     * @tc.name   testArrayFrom0024
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0024
     * @tc.desc   Verify Array.from() creates array from nested array (shallow copy)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nestedArr = [[1, 2], [3, 4]];
      const arr = Array.from(nestedArr);
      expect(arr).assertDeepEquals([[1, 2], [3, 4]]);
      expect(arr[0]).assertEqual(nestedArr[0]);
    });

    /**
     * @tc.name   testArrayFrom0027
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0027
     * @tc.desc   Verify Array.from() creates array from Date Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-01-02');
      const set = new Set<Date>([date1, date2]);
      const arr = Array.from(set);
      expect(arr).assertDeepEquals([date1, date2]);
    });

    /**
     * @tc.name   testArrayFrom0028
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0028
     * @tc.desc   Verify Array.from() creates array from RegExp match results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = 'test123test456';
      let arr1: Array<string> = [];
      const matches = str.match(new RegExp("test\\d+", "g"));
      const arr = Array.from(matches!);
      expect(arr).assertDeepEquals(['test123', 'test456']);
    });

    /**
     * @tc.name   testArrayFrom0029
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0029
     * @tc.desc   Verify Array.from() with mapFn on RegExp matches
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo
    // it('testArrayFrom0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const str = 'test123test456';
    //   let arr1: Array<string> = [];
    //   const matches = str.match(new RegExp("test\\d+", "g")) || arr1;
    //   const arr = Array.from(matches, (match) => match.replace('test', ''));
    //   expect(arr).assertDeepEquals(['123', '456']);
    // });

    /**
     * @tc.name   testArrayFrom0030
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0030
     * @tc.desc   Verify Array.from() creates array from large string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = 'a'.repeat(100);
      const arr = Array.from(str);
      expect(arr.length).assertEqual(100);
      expect(arr[99]).assertEqual('a');
    });

    /**
     * @tc.name   testArrayFrom0031
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0031
     * @tc.desc   Verify Array.from() creates array from large Set
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0031', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set = new Set<number>();
      for (let i: int = 0; i < 1000; i++) {
        set.add(i);
      }
      const arr = Array.from(set);
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.name   testArrayFrom0034
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0034
     * @tc.desc   Verify Array.from() creates array from function arguments (array-like)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const getArgs = (...args: number[]) => Array.from(args);
      const arr = getArgs(1, 2, 3);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFrom0035
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0035
     * @tc.desc   Verify Array.from() with mapFn on function arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const processArgs = (...args: number[]) => Array.from(args, (num: number) => num * 10);
      const arr = processArgs(1, 2, 3);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([10, 20, 30]));
    });

    /**
     * @tc.name   testArrayFrom0042
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0042
     * @tc.desc   Verify Array.from() with mapFn returns different type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr = Array.from([1, 2, 3], (num) => num > 2);
      expect(arr).assertDeepEquals([false, false, true]);
    });

    /**
     * @tc.name   testArrayFrom0045
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0045
     * @tc.desc   Verify Array.from() creates array from nested Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set1 = new Set<number>([1, 2]);
      const set2 = new Set<number>([3, 4]);
      const parentSet = new Set<Set<number>>([set1, set2]);
      const arr = Array.from(parentSet);
      expect(arr).assertDeepEquals([set1, set2]);
    });

    /**
     * @tc.name   testArrayFrom0046
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0046
     * @tc.desc   Verify Array.from() with mapFn on nested Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo app
    // it('testArrayFrom0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const set1 = new Set<number>([1, 2]);
    //   const set2 = new Set<number>([3, 4]);
    //   const parentSet = new Set<Set<number>>([set1, set2]);
    //   const arr = Array.from(parentSet, (set) => Array.from(set));
    //   expect(arr).assertDeepEquals([[1, 2], [3, 4]]);
    // });

    /**
     * @tc.name   testArrayFrom0047
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0047
     * @tc.desc   Verify Array.from() creates array from Map with object keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const key1: ObjectWithId = { id: 1 };
      const key2: ObjectWithId = { id: 2 };
      const map = new Map<ObjectWithId, string>([[key1, 'val1'], [key2, 'val2']]);
      const arr = Array.from(map);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([[key1, 'val1'], [key2, 'val2']]));
    });

    /**
     * @tc.name   testArrayFrom0051
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0051
     * @tc.desc   Verify Array.from() with mapFn returns boolean array from string length check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strArr = ['a', 'bb', 'ccc', 'dddd'];
      const arr = Array.from(strArr, (str) => str.length > 2);
      expect(arr).assertDeepEquals([false, false, true, true]);
    });

    /**
     * @tc.name   testArrayFrom0052
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0052
     * @tc.desc   Verify Array.from() creates array from TypedArray with mapFn for type conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr = new Int16Array([-1, 2, -3]);
      const arr = Array.from(typedArr, (num: number) => num.toString());
      expect(arr).assertDeepEquals(['-1', '2', '-3']);
    });

    /**
     * @tc.name   testArrayFrom0053
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0053
     * @tc.desc   Verify Array.from() creates array from Map with Date keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-02-01');
      const map = new Map<Date, string>([[date1, 'Jan'], [date2, 'Feb']]);
      const arr = Array.from(map);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([[date1, 'Jan'], [date2, 'Feb']]));
    });

    /**
     * @tc.name   testArrayFrom0054
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0054
     * @tc.desc   Verify Array.from() with mapFn calculates sum of nested array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nestedArr = [[1, 2], [3, 4, 5], [6]];
      const arr = Array.from(nestedArr, (subArr: Array<int>) => subArr.reduce((acc: int, curr: int) => acc + curr, 0));
      expect(arr).assertDeepEquals([3, 12, 6]);
    });

    /**
     * @tc.name   testArrayFrom0057
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0057
     * @tc.desc   Verify Array.from() creates array from Set of objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: ObjectWithId = { id: 1 };
      const obj2: ObjectWithId = { id: 2 };
      const set = new Set<ObjectWithId>([obj1, obj2, obj1]);
      const arr = Array.from(set);
      expect(arr).assertDeepEquals([obj1, obj2]);
    });

    /**
     * @tc.name   testArrayFrom0060
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0060
     * @tc.desc   Verify Array.from() creates array from iterable with mixed data types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const iterable = new Array<number | string | boolean>(1, 'a', true, 2, 'b');
      const arr = Array.from(iterable);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 'a', true, 2, 'b']));
    });

    /**
     * @tc.name   testArrayFrom0061
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0061
     * @tc.desc   Verify Array.from() with mapFn filters and transforms data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numArr = [1, 2, 3, 4, 5];
      const arr = Array.from(numArr, (num: int) => num % 2 === 0 ? num * 2 : undefined).filter((val) => val !== undefined);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([4, 8]));
    });

    /**
     * @tc.name   testArrayFrom0062
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0062
     * @tc.desc   Verify Array.from() creates array from empty TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr = new Uint32Array(0);
      const arr = Array.from(typedArr);
      let arr1:[] = [];
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify(arr1));
    });

    /**
     * @tc.name   testArrayFrom0063
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0063
     * @tc.desc   Verify Array.from() creates array from Map with boolean values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, boolean>([['active', true], ['disabled', false], ['pending', true]]);
      const arr = Array.from(map);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([['active', true], ['disabled', false], ['pending', true]]));
    });

    /**
     * @tc.name   testArrayFrom0064
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0064
     * @tc.desc   Verify Array.from() with mapFn converts string to number array with radix
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const hexStr = '1a3f';
      const arr = Array.from(hexStr, (val: string) => parseInt(val, 16));
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 10, 3, 15]));
    });

    /**
     * @tc.name   testArrayFrom0066
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0066
     * @tc.desc   Verify Array.from() with mapFn uses index to calculate values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const baseArr: Array<int> = [10, 20, 30];
      const arr = Array.from(baseArr, (num, idx) => num + idx);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([10, 21, 32]));
    });

    /**
     * @tc.name   testArrayFrom0067
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0067
     * @tc.desc   Verify Array.from() creates array from Set of mixed types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const set = new Set<MixedType067>([1, 'a', null, 1, 'b']);
      const arr = Array.from(set);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 'a', null, 'b']));
    });

    /**
     * @tc.name   testArrayFrom0068
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0068
     * @tc.desc   Verify Array.from() creates array from iterable with nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: NestedObject068 = { id: 1, details: { name: 'obj1', value: 10 } };
      const obj2: NestedObject068 = { id: 2, details: { name: 'obj2', value: 20 } };
      const iterable = new Array<NestedObject068>(obj1, obj2);
      const arr = Array.from(iterable);
      expect(arr).assertDeepEquals([obj1, obj2]);
    });

    /**
     * @tc.name   testArrayFrom0069
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0069
     * @tc.desc   Verify Array.from() with mapFn extracts nested object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const objArr: NestedObject069[] = [
        { id: 1, details: { name: 'obj1', value: 10 } },
        { id: 2, details: { name: 'obj2', value: 20 } }
      ];
      const arr = Array.from(objArr, (obj: NestedObject069) => obj.details.name);
      expect(arr).assertDeepEquals(['obj1', 'obj2']);
    });

    /**
     * @tc.name   testArrayFrom0072
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0072
     * @tc.desc   Verify Array.from() with mapFn counting code points
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const str = 'A𝌆B'; // 𝌆 is a surrogate pair (U+1D306)
      const arr = Array.from(str, (val: string) => val.codePointAt(0));
      expect(arr).assertDeepEquals([65, 0x1D306, 66]);
    });

    /**
     * @tc.name   testArrayFrom0073
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0073
     * @tc.desc   Verify Array.from() with Set containing objects with same values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1: ObjectWithValue = { value: 10 };
      const obj2: ObjectWithValue = { value: 10 }; // Same value but different reference
      const set = new Set<ObjectWithValue>([obj1, obj2]);
      const arr = Array.from(set);
      expect(arr).assertDeepEquals([obj1, obj2]);
      expect(arr[0] === arr[1]).assertEqual(false);
    });

    /**
     * @tc.name   testArrayFrom0075
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0075
     * @tc.desc   Verify Array.from() with Int32Array containing negative numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr = new Int32Array([-1000, 0, 2000, -3000]);
      const arr = Array.from(typedArr);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([-1000, 0, 2000, -3000]));
    });

    /**
     * @tc.name   testArrayFrom0076
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0076
     * @tc.desc   Verify Array.from() with Uint32Array for large numbers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr = new Uint32Array([4294967295, 0, 123456789]);
      const arr = Array.from(typedArr);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([4294967295, 0, 123456789]));
    });

    /**
     * @tc.name   testArrayFrom0077
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0077
     * @tc.desc   Verify Array.from() with mapFn creating complex objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numbers = [1, 2, 3, 4, 5];
      const arr: MappedObject[] = Array.from(numbers, (num: int) => ({
        original: num,
        squared: num * num,
        isEven: num % 2 === 0
      } as MappedObject));
      expect(arr).assertDeepEquals([
        { original: 1, squared: 1, isEven: false } as MappedObject,
        { original: 2, squared: 4, isEven: true } as MappedObject,
        { original: 3, squared: 9, isEven: false } as MappedObject,
        { original: 4, squared: 16, isEven: true } as MappedObject,
        { original: 5, squared: 25, isEven: false } as MappedObject
      ]);
    });

    /**
     * @tc.name   testArrayFrom0079
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0079
     * @tc.desc   Verify Array.from() with array containing various falsy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const falsyArr = [false, 0, '', null, undefined];
      const arr = Array.from(falsyArr);
      expect(arr).assertDeepEquals([false, 0, '', null, undefined]);
    });

    /**
     * @tc.name   testArrayFrom0080
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0080
     * @tc.desc   Verify Array.from() with mapFn distinguishing falsy values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // todo app
    // it('testArrayFrom0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
    //   const falsyArr = [false, 0, '', null, undefined, NaN];
    //   const arr = Array.from(falsyArr, (val, idx) => {
    //     if (val === false) {
    //       return 'false';
    //     }
    //     if (val === 0) {
    //       return 'zero';
    //     }
    //     if (val === '') {
    //       return 'empty';
    //     }
    //     if (val === null) {
    //       return 'null';
    //     }
    //     if (val === undefined) {
    //       return 'undefined';
    //     }
    //     if (isNaN(val)) {
    //       return 'nan';
    //     }
    //     return 'unknown';
    //   });
    //   expect(arr).assertDeepEquals(['false', 'zero', 'empty', 'null', 'undefined', 'nan']);
    // });

    /**
     * @tc.name   testArrayFrom0081
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0081
     * @tc.desc   Verify Array.from() with very large string (10k characters)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0081', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      let largeStr = '';
      for (let i: int = 0; i < 10000; i++) {
        largeStr += String.fromCharCode(97 + (i % 26)); // a-z repeating
      }
      const arr = Array.from(largeStr);
      expect(arr.length).assertEqual(10000);
      expect(arr[9999]).assertEqual(String.fromCharCode(97 + (9999 % 26)));
    });

    /**
     * @tc.name   testArrayFrom0082
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0082
     * @tc.desc   Verify Array.from() with Set containing large number of unique objects
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0082', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const set = new Set<ObjectWithId>();
      for (let i: int = 0; i < 5000; i++) {
        set.add({ id: i } as ObjectWithId);
      }
      const arr = Array.from(set);
      expect(arr.length).assertEqual(5000);
      expect(arr[4999].id).assertEqual(4999);
    });

    /**
     * @tc.name   testArrayFrom0083
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0083
     * @tc.desc   Verify Array.from() with nested arrays preservation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nestedArr: Array<Any> = [
        [1, 2],
        [3, [4, 5]],
        [[[6]]]
      ];
      const arr = Array.from(nestedArr);
      expect(arr).assertDeepEquals(nestedArr);
      expect((arr![1] as Array<number|Array<number>>)[1]).assertEqual((nestedArr![1] as Array<number|Array<number>>)[1]);
    });

    /**
     * @tc.name   testArrayFrom0084
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0084
     * @tc.desc   Verify Array.from() with mapFn flattening nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const nestedArr = [
        [1, 2],
        [3, 4],
        [5, 6]
      ];
      const arr = Array.from(nestedArr, (subArr: Array<int>) => subArr[0] + subArr[1]);
      expect(arr).assertDeepEquals([3, 7, 11]);
    });

    /**
     * @tc.name   testArrayFrom0087
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0087
     * @tc.desc   Verify Array.from() with Float64Array for precision testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr = new Float64Array([0.1, 0.2, 0.3, 0.1 + 0.2]);
      const arr = Array.from(typedArr);
      expect(arr).assertDeepEquals([0.1, 0.2, 0.3, 0.30000000000000004]);
    });

    /**
     * @tc.name   testArrayFrom0088
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0088
     * @tc.desc   Verify Array.from() with mapFn for precision calculation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArr = new Float32Array([1.0000001, 2.0000002, 3.0000003]);
      const arr = Array.from(typedArr, (num: number) => Math.round(num * 1000000) / 1000000.0);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   testArrayFrom0089
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0089
     * @tc.desc   Verify Array.from() with array of functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const func1 = () => 'result1';
      const func2 = () => 'result2';
      const func3 = () => 'result3';
      const arr = Array.from([func1, func2, func3]);
      expect(arr.length).assertEqual(3);
      expect(arr[0]()).assertEqual('result1');
      expect(arr[1]()).assertEqual('result2');
      expect(arr[2]()).assertEqual('result3');
    });

    /**
     * @tc.name   testArrayFrom0090
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0090
     * @tc.desc   Verify Array.from() with mapFn executing functions and transforming results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const funcArr = [
        () => 10,
        () => 20,
        () => 30
      ];
      const arr = Array.from(funcArr, (func: (() => int), idx) => func() + idx);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([10, 21, 32]));
    });

    /**
     * @tc.name   testArrayFrom0091
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0091
     * @tc.desc   Verify Array.from() with Set containing Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2023-01-02');
      const date3 = new Date('2023-01-01'); // Same value as date1 but different object
      const set = new Set<Date>([date1, date2, date3]);
      const arr = Array.from(set);
      expect(arr).assertDeepEquals([date1, date2, date3]);
      expect(arr[0].getTime()).assertEqual(arr[2].getTime());
      expect(arr[0]).not().assertEqual(arr[2]);
    });

    /**
     * @tc.name   testArrayFrom0092
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0092
     * @tc.desc   Verify Array.from() with mapFn formatting dates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const dates = [
        new Date('2023-01-01'),
        new Date('2023-02-15'),
        new Date('2023-12-25')
      ];
      const arr = Array.from(dates, (date: Date) => date.toISOString().split('T')[0]);
      expect(arr).assertDeepEquals(['2023-01-01', '2023-02-15', '2023-12-25']);
    });

    /**
     * @tc.name   testArrayFrom0093
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0093
     * @tc.desc   Verify Array.from() with Map using Date objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const key1 = new Date('2024-01-01');
      const key2 = new Date('2024-01-02');
      const map = new Map<Date, string>([
        [key1, 'New Year'],
        [key2, 'Second day']
      ]);
      const arr = Array.from(map);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([[key1, 'New Year'], [key2, 'Second day']]));
    });

    /**
     * @tc.name   testArrayFrom0094
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0094
     * @tc.desc   Verify Array.from() with array of RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regexArr = [new RegExp("abc"), new RegExp("\\d+", "g"), new RegExp("^test$", "i")];
      const arr = Array.from(regexArr);
      expect(arr).assertDeepEquals(regexArr);
      expect(arr[0].test('abc')).assertTrue();
      expect(arr[1].exec('123')?.[0]).assertEqual('123');
    });

    /**
     * @tc.name   testArrayFrom0095
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0095
     * @tc.desc   Verify Array.from() with mapFn testing RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const testStr = 'test123TEST';
      const regexArr = [new RegExp("test"), new RegExp("TEST"), new RegExp("test", "i"), new RegExp("\\d+")];
      const arr = Array.from(regexArr, (regex: RegExp) => regex.test(testStr));
      expect(arr).assertDeepEquals([true, true, true, true]);
    });

    /**
     * @tc.name   testArrayFrom0096
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0096
     * @tc.desc   Verify Array.from() with sparse array (containing empty slots)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      // Create sparse array with empty slots
      const sparseArr: (number | undefined)[] = new Array<number | undefined>(4);
      sparseArr[0] = 10;
      sparseArr[2] = 30;
      sparseArr.length = 4;

      const arr = Array.from(sparseArr);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([10, undefined, 30, undefined]));
    });

    /**
     * @tc.name   testArrayFrom0097
     * @tc.number SUB_COMMONLIBRARY_ARRAY_From_0097
     * @tc.desc   Verify Array.from() with mapFn handling sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testArrayFrom0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const sparseArr: (number | undefined)[] = new Array<number | undefined>(5);
      sparseArr[0] = 1;
      sparseArr[3] = 4;
      sparseArr.length = 5;

      const arr = Array.from(sparseArr, (val: number | undefined, idx: int) => val ?? idx * 10);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 10, 20, 4, 40]));
    });
  });
}