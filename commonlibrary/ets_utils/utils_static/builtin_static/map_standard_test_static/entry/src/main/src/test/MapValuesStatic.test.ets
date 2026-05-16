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

interface MyObj {
  id: number
}

interface MyObj33 {}

class TestClass {
  public prop = 'test';
}

interface LevelC {
  c: number;
}

interface LevelB {
  b: LevelC;
}

interface NestedObject {
  a: LevelB;
}

interface MyObj43 {
  prop: MyObj43 | null
}
interface MyObj64 {
  prop: string;
}
interface MyObj68 {}

interface MyObj70 {
  a: string,
  b: string,
  c: string
}

interface MyObj73 {
  prop: string;
}

interface MyObj74 {
  prop: string;
}

interface MyObj74_1 extends MyObj74 {}

interface MyObj106 {
  value: string;
}
interface MyObj108 {
  a: number
}

export default function MapValueTest() {
  describe('MapValueTest', () => {
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
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_001
     * @tc.name MapValuesTest001
     * @tc.desc Basic functionality: values() of empty Map returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapValuesTest001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map<string, string>();
      const values = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_002
     * @tc.name MapValuesTest002
     * @tc.desc Basic functionality: values() with single key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapValuesTest002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a']]);
      const values = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_003
     * @tc.name MapValuesTest003
     * @tc.desc Order preservation: values() maintains insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapValuesTest003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[3, 'c'], [1, 'a'], [2, 'b']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('c');
      expect(values[1]).assertEqual('a');
      expect(values[2]).assertEqual('b');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_004
     * @tc.name MapValuesTest004
     * @tc.desc Key override: values() keeps last set value for duplicate keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapValuesTest004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('key', 'old');
      map.set('key', 'new');
      const values = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('new');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_005
     * @tc.name MapValuesTest005
     * @tc.desc Iterator property: values() returns object with next method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map<string, string>();
      const iterator = map.values();
      expect(typeof iterator.next).assertEqual('function');
      expect(iterator.next instanceof Function).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_006
     * @tc.name MapValuesTest006
     * @tc.desc Iterator traversal: complete value sequence via next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest006',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'x'], [2, 'y']]);
      const iterator = map.values();
      expect(iterator.next().value).assertEqual('x');
      expect(iterator.next().value).assertEqual('y');
      expect(iterator.next().done).assertEqual(true);
      expect(iterator.next().value).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_007
     * @tc.name MapValuesTest007
     * @tc.desc Consistency: values() match values in entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest007',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[10, 'foo'], [20, 'bar']]);
      const values = Array.from(map.values());
      const entries = Array.from(map.entries());
      expect(values[0]).assertEqual(entries[0][1]);
      expect(values[1]).assertEqual(entries[1][1]);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_008
     * @tc.name MapValuesTest008
     * @tc.desc Consistency: values() match get() results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest008',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[5, 'test']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(map.get(5));
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_009
     * @tc.name MapValuesTest009
     * @tc.desc String keys: values() with string as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapValuesTest009',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<string, string>([['name', 'test']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('test');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_010
     * @tc.name MapValuesTest010
     * @tc.desc Boolean keys: values() with boolean as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapValuesTest010',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<boolean, string>([[true, 'yes'], [false, 'no']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('yes');
      expect(values[1]).assertEqual('no');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_011
     * @tc.name MapValuesTest011
     * @tc.desc Object keys: values() with object reference as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest011',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const keyObj: MyObj = { id: 1 };
      const map = new Map<MyObj, string>([[keyObj, 'object value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('object value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_013
     * @tc.name MapValuesTest013
     * @tc.desc Null key: values() with null as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest013',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<Any, string>([[null, 'null value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('null value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_014
     * @tc.name MapValuesTest014
     * @tc.desc Undefined key: values() with undefined as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest014',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<Any, string>([[undefined, 'undefined value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('undefined value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_015
     * @tc.name MapValuesTest015
     * @tc.desc Function values: values() contains function references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest015',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const func = () => 'test';
      const map = new Map<number, () =>string>([[1, func]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(func);
      expect(values[0]()).assertEqual('test');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_016
     * @tc.name MapValuesTest016
     * @tc.desc Array values: values() contains array references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest016',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const map = new Map<int, int[]>([[1, arr]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(arr);
      expect(values[0].length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_017
     * @tc.name MapValuesTest017
     * @tc.desc Object values: values() contains object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest017',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MyObj = { id: 1 };
      const map = new Map<number,MyObj>([[1, obj]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(obj);
      expect(values[0].id).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_018
     * @tc.name MapValuesTest018
     * @tc.type Function
     * @tc.desc Original Map unchanged after values()
     * @tc.size MediumTest
     * @tc.level Level 1
     */
    it('MapValuesTest018',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a']]);
      Array.from(map.values());
      expect(map.size).assertEqual(1);
      expect(map.get(1)).assertEqual('a');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_019
     * @tc.name MapValuesTest019
     * @tc.desc Iterator reuse: can traverse multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest019',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a']]);
      const values1 = Array.from(map.values());
      const values2 = Array.from(map.values());
      expect(values1).assertDeepEquals(values2);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_020
     * @tc.name MapValuesTest020
     * @tc.desc New iterator: each values() call returns new iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest020',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map<string, string>();
      const iter1 = map.values();
      const iter2 = map.values();
      expect(iter1 === iter2).assertFalse();
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_021
     * @tc.name MapValuesTest021
     * @tc.desc Iterator behavior: continues after Map modification (add new entry)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest021',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a']]);
      const iterator = map.values();
      iterator.next(); // 消耗第一个值
      map.set(2, 'b'); // 动态添加新键值对
      expect(iterator.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_022
     * @tc.name MapValuesTest022
     * @tc.desc Iterator behavior: skips deleted entries (not yet iterated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest022',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      const iterator = map.values();
      iterator.next(); // 消耗 'a'
      map.delete(2); // 删除未迭代的键
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_023
     * @tc.name MapValuesTest023
     * @tc.desc Iterator behavior: ignores modified entries (already iterated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest023',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      const iterator = map.values();
      expect(iterator.next().value).assertEqual('a');
      map.set(1, 'modified'); // 修改已迭代的键
      expect(iterator.next().value).assertEqual('b');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_024
     * @tc.name MapValuesTest024
     * @tc.desc for...of loop over values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest024',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'x'], [2, 'y']]);
      const result: string[] = [];
      for (const value of map.values()) {
        result.push(value);
      }
      expect(result[0]).assertEqual('x');
      expect(result[1]).assertEqual('y');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_025
     * @tc.name MapValuesTest025
     * @tc.desc values() with NaN as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest025',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, number>([[1, NaN]]);
      const values = Array.from(map.values());
      expect(values[0] !== values[0]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_026
     * @tc.name MapValuesTest026
     * @tc.desc values() with Infinity as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest026',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, number>([[1, Infinity]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_027
     * @tc.name MapValuesTest027
     * @tc.desc values() with -Infinity as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest027',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, number>([[1, -Infinity]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_028
     * @tc.name MapValuesTest028
     * @tc.desc values() with BigInt as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest028',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, bigint>([[1, 42n]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_029
     * @tc.name MapValuesTest029
     * @tc.desc values() with Date object as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date: Date = new Date(2023, 0, 1);
      const map: Map<number, Date> = new Map<number, Date>([[1, date]]);
      const values: Date[] = Array.from(map.values());

      expect(values.length).assertEqual(1);
      expect(values[0].getTime()).assertEqual(date.getTime());
      expect(values[0].getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_030
     * @tc.name MapValuesTest030
     * @tc.desc values() with RegExp as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest030',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex = new RegExp("test");
      const map = new Map<number, RegExp>([[1, regex]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(regex);
      expect(values[0].test('test')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_031
     * @tc.name MapValuesTest031
     * @tc.desc values() with Map as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest031',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const innerMap = new Map<number, string>([[1, 'a']]);
      const map = new Map<number, Map<number, string>>([[1, innerMap]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(innerMap);
      expect(values[0].size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_032
     * @tc.name MapValuesTest032
     * @tc.desc values() with Set as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest032',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set<number>([1, 2]);
      const map = new Map<number, Set<number>>([[1, set]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(set);
      expect(values[0].size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_033
     * @tc.name MapValuesTest033
     * @tc.desc values() with WeakMap as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest033',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const wm: WeakMap<MyObj33, string> = new WeakMap<MyObj33, string>();
      const obj: MyObj33 = {};
      wm.set(obj, 'value');
      const map = new Map<number, WeakMap<MyObj33, string>>([[1, wm]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(wm);
      expect(values[0].has(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_034
     * @tc.name MapValuesTest034
     * @tc.desc values() with WeakSet as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest034',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const ws = new WeakSet<MyObj33>();
      const obj: MyObj33 = {};
      ws.add(obj);
      const map = new Map<number, WeakSet<MyObj33>>([[1, ws]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(ws);
      expect(values[0].has(obj)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_035
     * @tc.name MapValuesTest035
     * @tc.desc values() with class instance as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest035',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const instance = new TestClass();
      const map = new Map<number, TestClass>([[1, instance]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(instance);
      expect(values[0].prop).assertEqual('test');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_036
     * @tc.name MapValuesTest036
     * @tc.desc values() after clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest036',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      map.clear();
      const values = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_037
     * @tc.name MapValuesTest037
     * @tc.desc Iterator behavior: after clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest037',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      const iterator = map.values();
      iterator.next(); // 消耗 'a'
      map.clear();
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_038
     * @tc.name MapValuesTest038
     * @tc.desc values() with numeric zero and negative zero as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest038',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, number>([[1, 0], [2, -0]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(0);
      expect(1 / values[0]).assertEqual(Infinity);
      expect(1 / values[1]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_039
     * @tc.name MapValuesTest039
     * @tc.desc values() with empty string as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, '']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('');
      expect(values[0].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_040
     * @tc.name MapValuesTest040
     * @tc.desc values() with large string as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest040',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const largeStr = 'a'.repeat(1000);
      const map = new Map<number, string>([[1, largeStr]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(largeStr);
      expect(values[0].length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_041
     * @tc.name MapValuesTest041
     * @tc.desc values() with multi-line string as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest041',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const multiStr = 'line1\nline2';
      const map = new Map<number, string>([[1, multiStr]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(multiStr);
      expect(values[0].split('\n').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_042
     * @tc.name MapValuesTest042
     * @tc.desc values() with nested objects as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest042',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const nested: NestedObject = {
        a: {
          b: {
            c: 1
          }
        }
      };
      const map = new Map<number, NestedObject>([[1, nested]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(nested);
      expect(values[0].a.b.c).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_043
     * @tc.name MapValuesTest043
     * @tc.desc values() with circular reference as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest043',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: MyObj43 = { prop: null };
      obj.prop = obj; // 创建循环引用
      const map = new Map<number, MyObj43>([[1, obj]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(obj);
      expect(values[0].prop).assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_044
     * @tc.name MapValuesTest044
     * @tc.desc values() with typed array as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest044',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr = new Uint8Array([1, 2, 3]);
      const map = new Map<number, Uint8Array>([[1, typedArr]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(typedArr);
      expect(values[0][1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_047
     * @tc.name MapValuesTest047
     * @tc.desc values() with async function as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest047',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncFunc = async () => 'async result';
      const map = new Map<number, ()=>Promise<string>>([[1, asyncFunc]]);
      const values = Array.from(map.values());
      expect(await values[0]()).assertEqual('async result');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_048
     * @tc.name MapValuesTest048
     * @tc.desc values() with array buffer as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest048',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const map = new Map<number, ArrayBuffer>([[1, buffer]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(buffer);
      expect(values[0].byteLength).assertEqual(8);
    });

    /**
     * @tc.name   MapValuesTest053
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_053
     * @tc.desc   values() with undefined as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest053',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, Any>([[1, undefined]]);
      const values = Array.from(map.values());
      expect(values[0] as undefined).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_055
     * @tc.name MapValuesTest055
     * @tc.desc values() with large number of entries (1000)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest055',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<number, string> = new Map<number, string>();
      const count = 1000;
      for (let i = 0; i < count; i++) {
        map.set(i, `value-${i}`);
      }
      const values = Array.from(map.values());
      expect(values.length).assertEqual(count);
      expect(values[999]).assertEqual('value-999');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_061
     * @tc.name MapValuesTest061
     * @tc.desc values() after entries deletion during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest061',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      const values: string[] = [];

      for (const value of map.values()) {
        values.push(value);
        if (value === 'b') {
          map.delete(3); // 删除尚未迭代的条目
        }
      }
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_062
     * @tc.name MapValuesTest062
     * @tc.desc values() after entries addition during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest062',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      const values: string[] = [];

      for (const value of map.values()) {
        values.push(value);
        if (value === 'a') {
          map.set(3, 'c'); // 添加新条目
        }
      }
      expect(values.length).assertEqual(3);
      expect(values[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_064
     * @tc.name MapValuesTest064
     * @tc.desc values() with same value in multiple entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest064',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const sharedValue: MyObj64 = { prop: 'shared' };
      const map = new Map<number, MyObj64>([
        [1, sharedValue],
        [2, sharedValue],
        [3, sharedValue]
      ]);
      const values = Array.from(map.values());

      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual(sharedValue);
      expect(values[1]).assertEqual(sharedValue);
      expect(values[2]).assertEqual(sharedValue);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_065
     * @tc.name MapValuesTest065
     * @tc.desc values() with Map that has NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest065',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[NaN, 'value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_066
     * @tc.name MapValuesTest066
     * @tc.desc values() with Map that has -0 as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest066',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[-0, 'value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_067
     * @tc.name MapValuesTest067
     * @tc.desc values() with Map that has 0 and -0 as separate keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest067',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[0, 'zero'], [-0, 'neg-zero']]);
      const values = Array.from(map.values());
      // 注意：0和-0在Map中被视为相同的键，后设置的会覆盖先设置的
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('neg-zero');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_068
     * @tc.name MapValuesTest068
     * @tc.desc values() with Map that has same object reference as key multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest068',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const key: MyObj68 = {};
      const map = new Map<MyObj68, string>([
        [key, 'first'],
        [key, 'second'],
        [key, 'third']
      ]);
      const values = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('third');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_072
     * @tc.name MapValuesTest072
     * @tc.desc values() with Map created from another Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest072',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = new Map<number, string>([[1, 'a'], [2, 'b']]);
      const map = new Map<number, string>(original);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_074
     * @tc.name MapValuesTest074
     * @tc.desc values() after replacing value object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest074',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj1: MyObj74 = { prop: 'first' };
      const obj2: MyObj74_1 = { prop: 'second' };
      const map = new Map<number, MyObj74>([[1, obj1]]);
      // 替换整个对象
      map.set(1, obj2);

      const values = Array.from(map.values());
      expect(values[0]).assertEqual(obj2);
      expect(values[0].prop).assertEqual('second');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_080
     * @tc.name MapValuesTest080
     * @tc.desc values() used with Array.prototype.map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest080',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, number>([[1, 10], [2, 20], [3, 30]]);
      const values = Array.from(map.values());
      const doubled = values.map(v => v * 2);
      expect(doubled[0]).assertEqual(20);
      expect(doubled[1]).assertEqual(40);
      expect(doubled[2]).assertEqual(60);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_081
     * @tc.name MapValuesTest081
     * @tc.desc values() used with Array.prototype.filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest081',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, number>([[1, 5], [2, 15], [3, 25], [4, 5]]);
      const values = Array.from(map.values());
      const filtered = values.filter(v => v > 10);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(15);
      expect(filtered[1]).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_082
     * @tc.name MapValuesTest082
     * @tc.desc values() used with Array.prototype.reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest082',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, number>([[1, 1], [2, 2], [3, 3], [4, 4]]);
      const values = Array.from(map.values());
      const sum = values.reduce((acc, curr) => acc + curr, 0);

      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_083
     * @tc.name MapValuesTest083
     * @tc.desc values() used with Array.prototype.find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest083',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'apple'], [2, 'banana'], [3, 'cherry']]);
      const values = Array.from(map.values());
      const found = values.find(v => v.startsWith('b'));
      expect(found).assertEqual('banana');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_084
     * @tc.name MapValuesTest084
     * @tc.desc values() used with Array.prototype.every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest084',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map1 = new Map<number, number>([[1, 5], [2, 10], [3, 15]]);
      const map2 = new Map<number, number>([[1, 5], [2, 20], [3, 15]]);

      const values1 = Array.from(map1.values());
      const values2 = Array.from(map2.values());

      const allLessThan16 = values1.every(v => v < 16);
      const allLessThan10 = values2.every(v => v < 10);

      expect(allLessThan16).assertEqual(true);
      expect(allLessThan10).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_085
     * @tc.name MapValuesTest085
     * @tc.desc values() used with Array.prototype.some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest085',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map1 = new Map<number, string>([[1, 'cat'], [2, 'dog'], [3, 'bird']]);
      const map2 = new Map<number, string>([[1, 'cat'], [2, 'dog'], [3, 'fish']]);

      const values1 = Array.from(map1.values());
      const values2 = Array.from(map2.values());

      const hasBird = values1.some(v => v === 'bird');
      const hasBird2 = values2.some(v => v === 'bird');

      expect(hasBird).assertEqual(true);
      expect(hasBird2).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_086
     * @tc.name MapValuesTest086
     * @tc.desc values() with empty values array and array methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest086',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map<string, string>();
      const values = Array.from(map.values());

      expect(values.length).assertEqual(0);
      expect(values.every(() => false)).assertEqual(true);
      expect(values.some(() => true)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_087
     * @tc.name MapValuesTest087
     * @tc.desc values() iterator with spread operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest087',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
      expect(values[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_089
     * @tc.name MapValuesTest089
     * @tc.desc values() with Map containing other Maps as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest089',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map1 = new Map<number, string>([[1, 'a']]);
      const map2 = new Map<number, string>([[2, 'b']]);
      const mainMap = new Map<number, Map<number, string>>([[10, map1], [20, map2]]);

      const values = Array.from(mainMap.values());
      expect(values[0]).assertEqual(map1);
      expect(values[1]).assertEqual(map2);
      expect(values[0].get(1)).assertEqual('a');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_091
     * @tc.name MapValuesTest091
     * @tc.desc values() with Map that has been converted to array and back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest091',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = new Map<number, string>([[1, 'a'], [2, 'b']]);
      const entries = Array.from(original.entries());
      const newMap = new Map<number, string>(entries);

      const values = Array.from(newMap.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_093
     * @tc.name MapValuesTest093
     * @tc.desc values() with non-serializable values (functions)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest093',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const func = () => {
      };
      const map = new Map<number, ()=>void>([[1, func]]);
      const values = Array.from(map.values());

      expect(values[0]).assertEqual(func);
      expect(JSON.stringify(values)).assertEqual('[null]');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_094
     * @tc.name MapValuesTest094
     * @tc.desc values() with Map in a different realm (iframe)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest094',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const iframeMap = new Map<number, string>([[1, 'iframe value']]);
      const values = Array.from(iframeMap.values());

      expect(values[0]).assertEqual('iframe value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_095
     * @tc.name MapValuesTest095
     * @tc.desc values() with Map that has been cloned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest095',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = new Map<number, string>([[1, 'a'], [2, 'b']]);
      // 创建克隆
      const clone = new Map<number, string>(original);

      const originalValues = Array.from(original.values());
      const cloneValues = Array.from(clone.values());

      expect(originalValues).assertDeepEquals(cloneValues);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_098
     * @tc.name MapValuesTest098
     * @tc.desc values() with very large values (memory usage test)
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('MapValuesTest098',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<number, string> = new Map<number, string>();
      const count = 100;
      const largeValue = 'x'.repeat(100000);
      for (let i = 0; i < count; i++) {
        map.set(i, largeValue);
      }
      const values = Array.from(map.values());
      expect(values.length).assertEqual(count);
      expect(values[0].length).assertEqual(100000);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_099
     * @tc.name MapValuesTest099
     * @tc.desc values() with Map that has been garbage collected (indirect test)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapValuesTest099',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map: Map<number, string> | null = new Map<number, string>([[1, 'a']]);
      const values = Array.from(map.values());
      const valueRef = values[0];
      map = null;
      expect(valueRef).assertEqual('a');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_100
     * @tc.name MapValuesTest100
     * @tc.desc values() with Map and same values added and removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<number, string> = new Map<number, string>();
      map.set(1, 'a');
      map.delete(1);
      map.set(1, 'a');
      const values = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_101
     * @tc.name MapValuesTest101
     * @tc.desc values() with Map and numeric keys in descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest101',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<number, string>([[5, 'e'], [4, 'd'], [3, 'c'], [2, 'b'], [1, 'a']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('e');
      expect(values[1]).assertEqual('d');
      expect(values[2]).assertEqual('c');
      expect(values[3]).assertEqual('b');
      expect(values[4]).assertEqual('a');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_102
     * @tc.name MapValuesTest102
     * @tc.desc values() with Map and string keys with varying cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest102',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map<string, string>([
        ['Apple', 'red'],
        ['banana', 'yellow'],
        ['Cherry', 'red']
      ]);
      const values = Array.from(map.values());

      expect(values[0]).assertEqual('red');
      expect(values[1]).assertEqual('yellow');
      expect(values[2]).assertEqual('red');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_105
     * @tc.name MapValuesTest105
     * @tc.desc values() with Map and dynamic values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest105',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dynamicValue = 'initial';
      const map = new Map<number, string>([[1, dynamicValue]]);
      dynamicValue = 'modified';
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('initial');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_106
     * @tc.name MapValuesTest106
     * @tc.desc values() with Map and dynamic object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapValuesTest106',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const dynamicObj: MyObj106 = { value: 'initial' };
      const map = new Map<number, MyObj106>([[1, dynamicObj]]);
      dynamicObj.value = 'modified';
      const values = Array.from(map.values());
      expect(values[0].value).assertEqual('modified');
    });
    /**
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_108
     * @tc.name MapValuesTest108
     * @tc.desc values() with Map and reflective properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('MapValuesTest108',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   const obj: MyObj108 = { a: 1 };
    //   const map = new Map<number, MyObj108>([[1, obj]]);
    //   const values = Array.from(map.values());
    //
    //   expect(Reflect.get(values[0], 'a')).assertEqual(1);
    //   expect(Reflect.has(values[0], 'a')).assertEqual(true);
    // });

  })
}