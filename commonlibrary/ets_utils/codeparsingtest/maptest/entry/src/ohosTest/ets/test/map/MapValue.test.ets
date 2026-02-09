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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect ,TestType, Size, Level} from '@ohos/hypium';
import {
  MapValuesTest012,
  MapValuesTest046,
  MapValuesTest049,
  MapValuesTest050,
  MapValuesTest051,
  MapValuesTest054,
  MapValuesTest057,
  MapValuesTest058,
  MapValuesTest059,
  MapValuesTest060,
  MapValuesTest063,
  MapValuesTest069,
  MapValuesTest071,
  MapValuesTest075,
  MapValuesTest076,
  MapValuesTest077,
  MapValuesTest078,
  MapValuesTest079,
  MapValuesTest088,
  MapValuesTest090,
  MapValuesTest092,
  MapValuesTest096,
  MapValuesTest097,
  MapValuesTest103,
  MapValuesTest104,
  MapValuesTest107,
  MapValuesTest109,
  MapValuesTest110
} from './MapValue';

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function MapValueTest() {
  describe('MapValueTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30)
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
     * @tc.name   MapValuesTest001
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_001
     * @tc.desc   Basic functionality: values() of empty Map returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map();
      const values = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.name   MapValuesTest002
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_002
     * @tc.desc   Basic functionality: values() with single key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'a']]);
      const values = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('a');
    });

    /**
     * @tc.name   MapValuesTest003
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_003
     * @tc.desc   Order preservation: values() maintains insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[3, 'c'], [1, 'a'], [2, 'b']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('c');
      expect(values[1]).assertEqual('a');
      expect(values[2]).assertEqual('b');
    });

    /**
     * @tc.name   MapValuesTest004
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_004
     * @tc.desc   Key override: values() keeps last set value for duplicate keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map();
      map.set('key', 'old');
      map.set('key', 'new');
      const values = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('new');
    });

    /**
     * @tc.name   MapValuesTest005
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_005
     * @tc.desc   Iterator property: values() returns object with next method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map();
      const iterator = map.values();
      expect(typeof iterator.next).assertEqual('function');
      expect(iterator.next instanceof Function).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest006
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_006
     * @tc.desc   Iterator traversal: complete value sequence via next()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest006',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'x'], [2, 'y']]);
      const iterator = map.values();
      expect(iterator.next().value).assertEqual('x');
      expect(iterator.next().value).assertEqual('y');
      expect(iterator.next().done).assertEqual(true);
      expect(iterator.next().value).assertEqual(undefined);
    });

    /**
     * @tc.name   MapValuesTest007
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_007
     * @tc.desc   Consistency: values() match values in entries()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest007',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[10, 'foo'], [20, 'bar']]);
      const values = Array.from(map.values());
      const entries = Array.from(map.entries());
      expect(values[0]).assertEqual(entries[0][1]);
      expect(values[1]).assertEqual(entries[1][1]);
    });

    /**
     * @tc.name   MapValuesTest008
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_008
     * @tc.desc   Consistency: values() match get() results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest008',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[5, 'test']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(map.get(5));
    });

    /**
     * @tc.name   MapValuesTest009
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_009
     * @tc.desc   String keys: values() with string as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest009',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([['name', 'test']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('test');
    });

    /**
     * @tc.name   MapValuesTest010
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_010
     * @tc.desc   Boolean keys: values() with boolean as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest010',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[true, 'yes'], [false, 'no']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('yes');
      expect(values[1]).assertEqual('no');
    });

    /**
     * @tc.name   MapValuesTest011
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_011
     * @tc.desc   Object keys: values() with object reference as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest011',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {
        id: number
      }

      const keyObj: MyObj = { id: 1 };
      const map = new Map([[keyObj, 'object value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('object value');
    });

    /**
     * @tc.name   MapValuesTest012
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_012
     * @tc.desc   Symbol keys: values() with Symbol as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest012',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest012 = MapValuesTest012();
      expect(ValuesTest012.values[0]).assertEqual('symbol value');
    });

    /**
     * @tc.name   MapValuesTest013
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_013
     * @tc.desc   Null key: values() with null as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest013',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[null, 'null value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('null value');
    });

    /**
     * @tc.name   MapValuesTest014
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_014
     * @tc.desc   Undefined key: values() with undefined as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest014',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[undefined, 'undefined value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('undefined value');
    });

    /**
     * @tc.name   MapValuesTest015
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_015
     * @tc.desc   Function values: values() contains function references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest015',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const func = () => 'test';
      const map = new Map([[1, func]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(func);
      expect(values[0]()).assertEqual('test');
    });

    /**
     * @tc.name   MapValuesTest016
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_016
     * @tc.desc   Array values: values() contains array references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest016',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr = [1, 2, 3];
      const map = new Map([[1, arr]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(arr);
      expect(values[0].length).assertEqual(3);
    });

    /**
     * @tc.name   MapValuesTest017
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_017
     * @tc.desc   Object values: values() contains object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest017',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {
        a: number;
      }

      const obj: MyObj = { a: 1 };
      const map = new Map([[1, obj]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(obj);
      expect(values[0].a).assertEqual(1);
    });

    /**
     * @tc.name   MapValuesTest018
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_018
     * @tc.desc   Original Map unchanged after values()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest018',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'a']]);
      Array.from(map.values());
      expect(map.size).assertEqual(1);
      expect(map.get(1)).assertEqual('a');
    });

    /**
     * @tc.name   MapValuesTest019
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_019
     * @tc.desc   Iterator reuse: can traverse multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest019',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'a']]);
      const values1 = Array.from(map.values());
      const values2 = Array.from(map.values());
      expect(values1).assertDeepEquals(values2);
    });

    /**
     * @tc.name   MapValuesTest020
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_020
     * @tc.desc   New iterator: each values() call returns new iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest020',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map();
      const iter1 = map.values();
      const iter2 = map.values();
      expect(iter1 === iter2).assertFalse();
    });

    /**
     * @tc.name   MapValuesTest021
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_021
     * @tc.desc   Iterator behavior: continues after Map modification (add new entry)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest021',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'a']]);
      const iterator = map.values();
      iterator.next(); // 消耗第一个值
      map.set(2, 'b'); // 动态添加新键值对
      expect(iterator.next().value).assertEqual('b');
    });

    /**
     * @tc.name   MapValuesTest022
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_022
     * @tc.desc   Iterator behavior: skips deleted entries (not yet iterated)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest022',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      const iterator = map.values();
      iterator.next(); // 消耗 'a'
      map.delete(2); // 删除未迭代的键
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest023
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_023
     * @tc.desc   Iterator behavior: ignores modified entries (already iterated)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest023',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      const iterator = map.values();
      expect(iterator.next().value).assertEqual('a');
      map.set(1, 'modified'); // 修改已迭代的键
      expect(iterator.next().value).assertEqual('b');
    });

    /**
     * @tc.name   MapValuesTest024
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_024
     * @tc.desc   for...of loop over values()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest024',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'x'], [2, 'y']]);
      const result: string[] = [];
      for (const value of map.values()) {
        result.push(value);
      }
      expect(result[0]).assertEqual('x');
      expect(result[1]).assertEqual('y');
    });

    /**
     * @tc.name   MapValuesTest025
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_025
     * @tc.desc   values() with NaN as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest025',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, NaN]]);
      const values = Array.from(map.values());
      expect(values[0] !== values[0]).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest026
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_026
     * @tc.desc   values() with Infinity as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest026',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, Infinity]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(Infinity);
    });

    /**
     * @tc.name   MapValuesTest027
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_027
     * @tc.desc   values() with -Infinity as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest027',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, -Infinity]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.name   MapValuesTest028
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_028
     * @tc.desc   values() with BigInt as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest028',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 42n]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(42n);
    });

    /**
     * @tc.name   MapValuesTest029
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_029
     * @tc.desc   values() with Date object as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapValuesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const date: Date = new Date(2023, 0, 1);
      const map: Map<number, Date> = new Map([[1, date]]);
      const values: Date[] = Array.from(map.values());

      expect(values.length).assertEqual(1);
      expect(values[0].getTime()).assertEqual(date.getTime());
      expect(values[0].getFullYear()).assertEqual(2023);
    });

    /**
     * @tc.name   MapValuesTest030
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_030
     * @tc.desc   values() with RegExp as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest030',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const regex = /test/;
      const map = new Map([[1, regex]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(regex);
      expect(values[0].test('test')).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest031
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_031
     * @tc.desc   values() with Map as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest031',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const innerMap = new Map([[1, 'a']]);
      const map = new Map([[1, innerMap]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(innerMap);
      expect(values[0].size).assertEqual(1);
    });

    /**
     * @tc.name   MapValuesTest032
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_032
     * @tc.desc   values() with Set as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest032',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const set = new Set([1, 2]);
      const map = new Map([[1, set]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(set);
      expect(values[0].size).assertEqual(2);
    });

    /**
     * @tc.name   MapValuesTest033
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_033
     * @tc.desc   values() with WeakMap as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest033',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {}

      const wm: WeakMap<MyObj, string> = new WeakMap();
      const obj: MyObj = {};
      wm.set(obj, 'value');
      const map = new Map([[1, wm]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(wm);
      expect(values[0].has(obj)).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest034
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_034
     * @tc.desc   values() with WeakSet as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest034',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {}

      const ws = new WeakSet();
      const obj: MyObj = {};
      ws.add(obj);
      const map = new Map([[1, ws]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(ws);
      expect(values[0].has(obj)).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest035
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_035
     * @tc.desc   values() with class instance as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest035',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'MapValuesTest035 begin');

      class TestClass {
        public prop = 'test';
      }

      const instance = new TestClass();
      const map = new Map([[1, instance]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(instance);
      expect(values[0].prop).assertEqual('test');
    });

    /**
     * @tc.name   MapValuesTest036
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_036
     * @tc.desc   values() after clear()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest036',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'MapValuesTest036 begin');
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      const values = Array.from(map.values());
      expect(values.length).assertEqual(0);
    });

    /**
     * @tc.name   MapValuesTest037
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_037
     * @tc.desc   Iterator behavior: after clear()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest037',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'MapValuesTest037 begin');
      const map = new Map([[1, 'a'], [2, 'b']]);
      const iterator = map.values();
      iterator.next(); // 消耗 'a'
      map.clear();
      expect(iterator.next().done).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest038
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_038
     * @tc.desc   values() with numeric zero and negative zero as values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest038',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'MapValuesTest038 begin');
      const map = new Map([[1, 0], [2, -0]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(-0);
      expect(1 / values[0]).assertEqual(Infinity);
      expect(1 / values[1]).assertEqual(-Infinity);
    });

    /**
     * @tc.name   MapValuesTest039
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_039
     * @tc.desc   values() with empty string as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'MapValuesTest039 begin');
      const map = new Map([[1, '']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('');
      expect(values[0].length).assertEqual(0);
    });

    /**
     * @tc.name   MapValuesTest040
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_040
     * @tc.desc   values() with large string as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest040',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'MapValuesTest040 begin');
      const largeStr = 'a'.repeat(1000);
      const map = new Map([[1, largeStr]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(largeStr);
      expect(values[0].length).assertEqual(1000);
    });

    /**
     * @tc.name   MapValuesTest041
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_041
     * @tc.desc   values() with multi-line string as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest041',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'MapValuesTest041 begin');
      const multiStr = 'line1\nline2';
      const map = new Map([[1, multiStr]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(multiStr);
      expect(values[0].split('\n').length).assertEqual(2);
    });

    /**
     * @tc.name   MapValuesTest042
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_042
     * @tc.desc   values() with nested objects as values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest042',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface LevelC {
        c: number;
      }

      interface LevelB {
        b: LevelC;
      }

      interface NestedObject {
        a: LevelB;
      }

      const nested: NestedObject = {
        a: {
          b: {
            c: 1
          }
        }
      };
      const map = new Map([[1, nested]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(nested);
      expect(values[0].a.b.c).assertEqual(1);
    });

    /**
     * @tc.name   MapValuesTest043
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_043
     * @tc.desc   values() with circular reference as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest043',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {
        prop: MyObj | null
      }

      const obj: MyObj = { prop: null };
      obj.prop = obj; // 创建循环引用
      const map = new Map([[1, obj]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(obj);
      expect(values[0].prop).assertEqual(obj);
    });

    /**
     * @tc.name   MapValuesTest044
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_044
     * @tc.desc   values() with typed array as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest044',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr = new Uint8Array([1, 2, 3]);
      const map = new Map([[1, typedArr]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(typedArr);
      expect(values[0][1]).assertEqual(2);
    });

    /**
     * @tc.name   MapValuesTest045
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_045
     * @tc.desc   values() with function with properties as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest045',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const testFunc = () => {
        return 'test';
      }
      testFunc.prop = 42;
      const map = new Map([[1, testFunc]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(testFunc);
      expect(values[0]()).assertEqual('test');
      expect(values[0].prop).assertEqual(42);
    });

    /**
     * @tc.name   MapValuesTest046
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_046
     * @tc.desc   values() with generator function as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest046',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest046 = MapValuesTest046();
      const first = ValuesTest046.gen.next();
      const second = ValuesTest046.gen.next();
      expect(first.value as number).assertEqual(1);
      expect(second.value as number).assertEqual(2);
    });

    /**
     * @tc.name   MapValuesTest047
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_047
     * @tc.desc   values() with async function as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest047',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const asyncFunc = async () => 'async result';
      const map = new Map([[1, asyncFunc]]);
      const values = Array.from(map.values());
      expect(await values[0]()).assertEqual('async result');
    });

    /**
     * @tc.name   MapValuesTest048
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_048
     * @tc.desc   values() with array buffer as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest048',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const buffer = new ArrayBuffer(8);
      const map = new Map([[1, buffer]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(buffer);
      expect(values[0].byteLength).assertEqual(8);
    });

    /**
     * @tc.name   MapValuesTest049
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_049
     * @tc.desc   values() with frozen object as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest049',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest049 = MapValuesTest049();
      expect(ValuesTest049.values[0]).assertEqual(ValuesTest049.frozen);
      expect(ValuesTest049.values[0].a).assertEqual(1);
    });

    /**
     * @tc.name   MapValuesTest050
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_050
     * @tc.desc   values() with sealed object as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest050',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest050 = MapValuesTest050();
      expect(ValuesTest050.values[0]).assertEqual(ValuesTest050.sealed);
      expect(ValuesTest050.values[0].a).assertEqual(1);
    });

    /**
     * @tc.name   MapValuesTest051
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_051
     * @tc.desc   values() with empty object as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest051',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest051 = MapValuesTest051();
      expect(ValuesTest051.values[0]).assertDeepEquals(ValuesTest051.values1);
      expect(Object.keys(ValuesTest051.values[0]).length).assertEqual(0);
    });

    /**
     * @tc.name   MapValuesTest052
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_052
     * @tc.desc   values() with null as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest052',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, null]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(null);
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
      const map = new Map([[1, undefined]]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual(undefined);
    });

    /**
     * @tc.name   MapValuesTest054
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_054
     * @tc.desc   values() with mixed value types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest054',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest054 = MapValuesTest054();
      expect(ValuesTest054.values[0]).assertEqual('string');
      expect(ValuesTest054.values[1]).assertEqual(42);
      expect(ValuesTest054.values[2]).assertEqual(true);
      expect(ValuesTest054.values[3]).assertEqual(null);
      expect(ValuesTest054.values[4]).assertEqual(undefined);
    });

    /**
     * @tc.name   MapValuesTest055
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_055
     * @tc.desc   values() with large number of entries (1000)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest055',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<number, string> = new Map();
      const count = 1000;
      for (let i = 0; i < count; i++) {
        map.set(i, `value-${i}`);
      }
      const values = Array.from(map.values());
      expect(values.length).assertEqual(count);
      expect(values[999]).assertEqual('value-999');
    });

    /**
     * @tc.name   MapValuesTest056
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_056
     * @tc.desc   Performance: values() with 10000 entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest056',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<number, number> = new Map();
      const count = 10000;
      for (let i = 0; i < count; i++) {
        map.set(i, i);
      }

      const start = Date.now();
      const values = Array.from(map.values());
      const duration = Date.now() - start;

      expect(values.length).assertEqual(count);
      expect(duration).assertLess(100); // 阈值可根据环境调整
    });

    /**
     * @tc.name   MapValuesTest057
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_057
     * @tc.desc   values() iterator with Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest057',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest057 = MapValuesTest057();
      expect(typeof ValuesTest057.iterator1).assertEqual('function');
      expect(ValuesTest057.iter.next().value).assertEqual('a');
      expect(ValuesTest057.iter.next().value).assertEqual('b');
    });

    /**
     * @tc.name   MapValuesTest058
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_058
     * @tc.desc   values() iterator toStringTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest058',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest058 = MapValuesTest058();
      expect(ValuesTest058.interator1).assertEqual('[object Map Iterator]');
      expect(ValuesTest058.interator2).assertEqual('Map Iterator');
    });

    /**
     * @tc.name   MapValuesTest059
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_059
     * @tc.desc   values() with Symbol as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest059',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest059 = MapValuesTest059();
      expect(ValuesTest059.values2).assertEqual(true);
      expect(ValuesTest059.values1).assertEqual(false);
    });

    /**
     * @tc.name   MapValuesTest060
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_060
     * @tc.desc   values() with global Symbol as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest060',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest060 = MapValuesTest060();
      expect(ValuesTest060.values1).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest061
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_061
     * @tc.desc   values() after entries deletion during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest061',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'a'], [2, 'b'], [3, 'c']]);
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
     * @tc.name   MapValuesTest062
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_062
     * @tc.desc   values() after entries addition during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest062',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'a'], [2, 'b']]);
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
     * @tc.name   MapValuesTest063
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_063
     * @tc.desc   values() iterator return() method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest063',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest063 = MapValuesTest063();
      expect(ValuesTest063.result1).assertEqual('a');
      expect(ValuesTest063.result3).assertEqual(false);
      expect(ValuesTest063.result2).assertEqual(false);
    });

    /**
     * @tc.name   MapValuesTest064
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_064
     * @tc.desc   values() with same value in multiple entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest064',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {
        prop: string;
      }

      const sharedValue: MyObj = { prop: 'shared' };
      const map = new Map([
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
     * @tc.name   MapValuesTest065
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_065
     * @tc.desc   values() with Map that has NaN as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest065',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[NaN, 'value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('value');
    });

    /**
     * @tc.name   MapValuesTest066
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_066
     * @tc.desc   values() with Map that has -0 as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest066',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[-0, 'value']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('value');
    });

    /**
     * @tc.name   MapValuesTest067
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_067
     * @tc.desc   values() with Map that has 0 and -0 as separate keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest067',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[0, 'zero'], [-0, 'neg-zero']]);
      const values = Array.from(map.values());
      // 注意：0和-0在Map中被视为相同的键，后设置的会覆盖先设置的
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('neg-zero');
    });

    /**
     * @tc.name   MapValuesTest068
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_068
     * @tc.desc   values() with Map that has same object reference as key multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest068',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {}

      const key: MyObj = {};
      const map = new Map([
        [key, 'first'],
        [key, 'second'],
        [key, 'third']
      ]);
      const values = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('third');
    });

    /**
     * @tc.name   MapValuesTest069
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_069
     * @tc.desc   values() with Map that has different object instances as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest069',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest069 = MapValuesTest069();
      expect(ValuesTest069.values.length).assertEqual(2);
      expect(ValuesTest069.values[0]).assertEqual('first');
      expect(ValuesTest069.values[1]).assertEqual('second');
    });

    /**
     * @tc.name   MapValuesTest070
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_070
     * @tc.desc   values() with Map created from object entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest070',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {
        a: string,
        b: string,
        c: string
      }

      const obj: MyObj = { a: 'one', b: 'two', c: 'three' };
      const map: Map<string, string> = new Map(Object.entries(obj));
      const values = Array.from(map.values());
      // 注意：Object.entries的顺序在ES6+中是确定的
      expect(values.length).assertEqual(3);
      expect(values).assertContain('one');
      expect(values).assertContain('two');
      expect(values).assertContain('three');
    });

    /**
     * @tc.name   MapValuesTest071
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_071
     * @tc.desc   values() with Map created from array of arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest071',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest071 = MapValuesTest071();
      expect(ValuesTest071.values[0]).assertEqual(1);
      expect(ValuesTest071.values[1]).assertEqual(2);
      expect(ValuesTest071.values[2]).assertEqual(3);
    });

    /**
     * @tc.name   MapValuesTest072
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_072
     * @tc.desc   values() with Map created from another Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest072',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = new Map([[1, 'a'], [2, 'b']]);
      const map = new Map(original);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.name   MapValuesTest073
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_073
     * @tc.desc   values() after modifying value object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest073',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {
        prop: string;
      }

      const obj: MyObj = { prop: 'initial' };
      const map = new Map([[1, obj]]);
      // 修改对象属性
      obj.prop = 'modified';
      const values = Array.from(map.values());
      expect(values[0].prop).assertEqual('modified');
    });

    /**
     * @tc.name   MapValuesTest074
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_074
     * @tc.desc   values() after replacing value object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest074',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {
        prop: string;
      }

      interface MyObj1 extends MyObj {}

      const obj1: MyObj = { prop: 'first' };
      const obj2: MyObj1 = { prop: 'second' };
      const map = new Map([[1, obj1]]);
      // 替换整个对象
      map.set(1, obj2);

      const values = Array.from(map.values());
      expect(values[0]).assertEqual(obj2);
      expect(values[0].prop).assertEqual('second');
    });

    /**
     * @tc.name   MapValuesTest075
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_075
     * @tc.desc   values() with inherited properties (none, since Map uses own properties)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest075',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest075 = MapValuesTest075();
      expect(ValuesTest075.values.length).assertEqual(0);
      // 清理
      expect(ValuesTest075.values1).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest076
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_076
     * @tc.desc   values() with Map that has been frozen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest076',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest076 = MapValuesTest076();
      expect(ValuesTest076.values[0]).assertEqual('a');
      expect(ValuesTest076.values[1]).assertEqual('b');
    });

    /**
     * @tc.name   MapValuesTest077
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_077
     * @tc.desc   values() with Map that has been sealed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest077',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest077 = MapValuesTest077();
      expect(ValuesTest077.values[0]).assertEqual('a');
      expect(ValuesTest077.values[1]).assertEqual('b');
    });

    /**
     * @tc.name   MapValuesTest078
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_078
     * @tc.desc   values() with Map prototype modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest078',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest078 = MapValuesTest078();
      expect(ValuesTest078.values[0]).assertEqual('modified');
    });

    /**
     * @tc.name   MapValuesTest079
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_079
     * @tc.desc   values() with subclassed Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest079',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest079 = MapValuesTest079();
      expect(ValuesTest079.values[0]).assertEqual('a');
      expect(ValuesTest079.values[1]).assertEqual('b');
    });

    /**
     * @tc.name   MapValuesTest080
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_080
     * @tc.desc   values() used with Array.prototype.map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest080',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 10], [2, 20], [3, 30]]);
      const values = Array.from(map.values());
      const doubled = values.map(v => v * 2);
      expect(doubled[0]).assertEqual(20);
      expect(doubled[1]).assertEqual(40);
      expect(doubled[2]).assertEqual(60);
    });

    /**
     * @tc.name   MapValuesTest081
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_081
     * @tc.desc   values() used with Array.prototype.filter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest081',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 5], [2, 15], [3, 25], [4, 5]]);
      const values = Array.from(map.values());
      const filtered = values.filter(v => v > 10);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(15);
      expect(filtered[1]).assertEqual(25);
    });

    /**
     * @tc.name   MapValuesTest082
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_082
     * @tc.desc   values() used with Array.prototype.reduce
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest082',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 1], [2, 2], [3, 3], [4, 4]]);
      const values = Array.from(map.values());
      const sum = values.reduce((acc, curr) => acc + curr, 0);

      expect(sum).assertEqual(10);
    });

    /**
     * @tc.name   MapValuesTest083
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_083
     * @tc.desc   values() used with Array.prototype.find
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest083',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'apple'], [2, 'banana'], [3, 'cherry']]);
      const values = Array.from(map.values());
      const found = values.find(v => v.startsWith('b'));
      expect(found).assertEqual('banana');
    });

    /**
     * @tc.name   MapValuesTest084
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_084
     * @tc.desc   values() used with Array.prototype.every
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest084',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map1 = new Map([[1, 5], [2, 10], [3, 15]]);
      const map2 = new Map([[1, 5], [2, 20], [3, 15]]);

      const values1 = Array.from(map1.values());
      const values2 = Array.from(map2.values());

      const allLessThan16 = values1.every(v => v < 16);
      const allLessThan10 = values2.every(v => v < 10);

      expect(allLessThan16).assertEqual(true);
      expect(allLessThan10).assertEqual(false);
    });

    /**
     * @tc.name   MapValuesTest085
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_085
     * @tc.desc   values() used with Array.prototype.some
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest085',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map1 = new Map([[1, 'cat'], [2, 'dog'], [3, 'bird']]);
      const map2 = new Map([[1, 'cat'], [2, 'dog'], [3, 'fish']]);

      const values1 = Array.from(map1.values());
      const values2 = Array.from(map2.values());

      const hasBird = values1.some(v => v === 'bird');
      const hasBird2 = values2.some(v => v === 'bird');

      expect(hasBird).assertEqual(true);
      expect(hasBird2).assertEqual(false);
    });

    /**
     * @tc.name   MapValuesTest086
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_086
     * @tc.desc   values() with empty values array and array methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest086',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<string, string> = new Map();
      const values = Array.from(map.values());

      expect(values.length).assertEqual(0);
      expect(values.every(() => false)).assertEqual(true);
      expect(values.some(() => true)).assertEqual(false);
    });

    /**
     * @tc.name   MapValuesTest087
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_087
     * @tc.desc   values() iterator with spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest087',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[1, 'a'], [2, 'b'], [3, 'c']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
      expect(values[2]).assertEqual('c');
    });

    /**
     * @tc.name   MapValuesTest088
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_088
     * @tc.desc   values() with Map containing itself as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest088',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest088 = MapValuesTest088();
      expect(ValuesTest088.values[0]).assertEqual(ValuesTest088.map);
    });

    /**
     * @tc.name   MapValuesTest089
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_089
     * @tc.desc   values() with Map containing other Maps as values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest089',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map1 = new Map([[1, 'a']]);
      const map2 = new Map([[2, 'b']]);
      const mainMap = new Map([[10, map1], [20, map2]]);

      const values = Array.from(mainMap.values());
      expect(values[0]).assertEqual(map1);
      expect(values[1]).assertEqual(map2);
      expect(values[0].get(1)).assertEqual('a');
    });

    /**
     * @tc.name   MapValuesTest090
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_090
     * @tc.desc   values() with recursive Map structure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest090',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest090 = MapValuesTest090();
      expect(ValuesTest090.values1[0]).assertEqual(ValuesTest090.map2);
      expect(ValuesTest090.values2[0]).assertEqual(ValuesTest090.map1);
    });

    /**
     * @tc.name   MapValuesTest091
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_091
     * @tc.desc   values() with Map that has been converted to array and back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest091',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = new Map([[1, 'a'], [2, 'b']]);
      const entries = Array.from(original.entries());
      const newMap = new Map(entries);

      const values = Array.from(newMap.values());
      expect(values[0]).assertEqual('a');
      expect(values[1]).assertEqual('b');
    });

    /**
     * @tc.name   MapValuesTest092
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_092
     * @tc.desc   values() with Map and JSON serialization of values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest092',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest092 = MapValuesTest092();
      expect(ValuesTest092.json).assertEqual('[{"a":1},{"b":2}]');
    });

    /**
     * @tc.name   MapValuesTest093
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_093
     * @tc.desc   values() with non-serializable values (functions)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest093',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const func = () => {
      };
      const map = new Map([[1, func]]);
      const values = Array.from(map.values());

      expect(values[0]).assertEqual(func);
      expect(JSON.stringify(values)).assertEqual('[null]');
    });

    /**
     * @tc.name   MapValuesTest094
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_094
     * @tc.desc   values() with Map in a different realm (iframe)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest094',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const iframeMap = new Map([[1, 'iframe value']]);
      const values = Array.from(iframeMap.values());

      expect(values[0]).assertEqual('iframe value');
    });

    /**
     * @tc.name   MapValuesTest095
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_095
     * @tc.desc   values() with Map that has been cloned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest095',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const original = new Map([[1, 'a'], [2, 'b']]);
      // 创建克隆
      const clone = new Map(original);

      const originalValues = Array.from(original.values());
      const cloneValues = Array.from(clone.values());

      expect(originalValues).assertDeepEquals(cloneValues);
    });

    /**
     * @tc.name   MapValuesTest096
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_096
     * @tc.desc   values() with Map and modified prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest096',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest096 = MapValuesTest096();
      expect(ValuesTest096.values[0]).assertEqual('a');
    });

    /**
     * @tc.name   MapValuesTest097
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_097
     * @tc.desc   values() with Map and property descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest097',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest097 = MapValuesTest097();
      expect(ValuesTest097.values[0]).assertEqual('a');
    });

    /**
     * @tc.name   MapValuesTest098
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_098
     * @tc.desc   values() with very large values (memory usage test)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest098',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<number, string> = new Map();
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
     * @tc.name   MapValuesTest099
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_099
     * @tc.desc   values() with Map that has been garbage collected (indirect test)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest099',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map: Map<number, string> | null = new Map([[1, 'a']]);
      const values = Array.from(map.values());
      const valueRef = values[0];
      map = null;
      expect(valueRef).assertEqual('a');
    });

    /**
     * @tc.name   MapValuesTest100
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_100
     * @tc.desc   values() with Map and same values added and removed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map: Map<number, string> = new Map();
      map.set(1, 'a');
      map.delete(1);
      map.set(1, 'a');
      const values = Array.from(map.values());
      expect(values.length).assertEqual(1);
      expect(values[0]).assertEqual('a');
    });

    /**
     * @tc.name   MapValuesTest101
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_101
     * @tc.desc   values() with Map and numeric keys in descending order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest101',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([[5, 'e'], [4, 'd'], [3, 'c'], [2, 'b'], [1, 'a']]);
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('e');
      expect(values[1]).assertEqual('d');
      expect(values[2]).assertEqual('c');
      expect(values[3]).assertEqual('b');
      expect(values[4]).assertEqual('a');
    });

    /**
     * @tc.name   MapValuesTest102
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_102
     * @tc.desc   values() with Map and string keys with varying cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest102',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const map = new Map([
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
     * @tc.name   MapValuesTest103
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_103
     * @tc.desc   values() with Map and mixed key types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest103',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest103 = MapValuesTest103();
      expect(ValuesTest103.values.length).assertEqual(5);
      expect(ValuesTest103.values[0]).assertEqual('number');
      expect(ValuesTest103.values[1]).assertEqual('string');
      expect(ValuesTest103.values[2]).assertEqual('boolean');
      expect(ValuesTest103.values[3]).assertEqual('object');
      expect(ValuesTest103.values[4]).assertEqual('symbol');
    });

    /**
     * @tc.name   MapValuesTest104
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_104
     * @tc.desc   values() with Map and ES6+ features as values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest104',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest104 = MapValuesTest104();
      expect(ValuesTest104.values[0] instanceof Set).assertEqual(true);
      expect(ValuesTest104.values[1] instanceof Map).assertEqual(true);
      expect(ValuesTest104.values[2] instanceof Promise).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest105
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_105
     * @tc.desc   values() with Map and dynamic values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest105',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dynamicValue = 'initial';
      const map = new Map([[1, dynamicValue]]);
      dynamicValue = 'modified';
      const values = Array.from(map.values());
      expect(values[0]).assertEqual('initial');
    });

    /**
     * @tc.name   MapValuesTest106
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_106
     * @tc.desc   values() with Map and dynamic object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest106',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {
        value: string;
      }

      const dynamicObj: MyObj = { value: 'initial' };
      const map = new Map([[1, dynamicObj]]);
      dynamicObj.value = 'modified';
      const values = Array.from(map.values());
      expect(values[0].value).assertEqual('modified');
    });

    /**
     * @tc.name   MapValuesTest107
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_107
     * @tc.desc   values() with Map and proxy as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest107',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest107 = MapValuesTest107();
      expect(ValuesTest107.values[0].a).assertEqual(2);
    });

    /**
     * @tc.name   MapValuesTest108
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_108
     * @tc.desc   values() with Map and reflective properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest108',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      interface MyObj {
        a: number
      }

      const obj: MyObj = { a: 1 };
      const map = new Map([[1, obj]]);
      const values = Array.from(map.values());

      // 使用Reflect API检查值
      expect(Reflect.get(values[0], 'a')).assertEqual(1);
      expect(Reflect.has(values[0], 'a')).assertEqual(true);
    });

    /**
     * @tc.name   MapValuesTest109
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_109
     * @tc.desc   values() with Map and symbols as values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest109',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest109 = MapValuesTest109();
      expect(ValuesTest109.values2).assertEqual(true);
      expect(ValuesTest109.values3).assertEqual(true);
      expect((ValuesTest109.values1!)).assertEqual(false);
    });

    /**
     * @tc.name   MapValuesTest110
     * @tc.number SUB_BUILTINS_MAP_VALUES_TEST_110
     * @tc.desc   values() with Map and comprehensive value types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapValuesTest110',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ValuesTest109 = MapValuesTest110();
      expect(ValuesTest109.values.length).assertEqual(14);
      expect(typeof ValuesTest109.values[0]).assertEqual('string');
      expect(typeof ValuesTest109.values[1]).assertEqual('number');
      expect(typeof ValuesTest109.values[2]).assertEqual('boolean');
      expect(ValuesTest109.values[3]).assertEqual(null);
      expect(ValuesTest109.values[4]).assertEqual(undefined);
      expect(typeof ValuesTest109.values[5]).assertEqual('object');
      expect(Array.isArray(ValuesTest109.values[6])).assertEqual(true);
      expect(typeof ValuesTest109.values[7]).assertEqual('function');
      expect(typeof ValuesTest109.values[8]).assertEqual('symbol');
      expect(typeof ValuesTest109.values[9]).assertEqual('bigint');
      expect(ValuesTest109.values[13]).assertEqual(Infinity);
    });

  })
}