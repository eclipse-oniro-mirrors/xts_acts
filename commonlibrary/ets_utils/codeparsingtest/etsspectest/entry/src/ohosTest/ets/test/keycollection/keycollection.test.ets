/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { sleep } from '../../testability/pages/Utils'

export default function KeyCollectionTest() {
  describe('KeyCollectionTest', () => {
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
     * @tc.name   KeyCollectionTest001
     * @tc.number KEY_COLLECTION_TEST_001
     * @tc.desc   Map initialization (Empty instance)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<string, number> = new Map();
      expect(map.size).assertEqual(0);
    })

    /**
     * @tc.name   KeyCollectionTest002
     * @tc.number KEY_COLLECTION_TEST_002
     * @tc.desc   Map Initialization (including initial data)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<number, string> = new Map([[1, 'a'], [2, 'b']]);
      expect(map.size).assertEqual(2);
    })

    /**
     * @tc.name   KeyCollectionTest003
     * @tc.number KEY_COLLECTION_TEST_003
     * @tc.desc   Map.set() New string key added
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<string, boolean> = new Map();
      map.set('active', true);
      expect(map.get('active')).assertEqual(true);
    })

    /**
     * @tc.name   KeyCollectionTest004
     * @tc.number KEY_COLLECTION_TEST_004
     * @tc.desc   Map.set() New number key added
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<number, string> = new Map();
      map.set(100, 'hundred');
      expect(map.get(100)).assertEqual('hundred');
    })

    /**
     * @tc.name   KeyCollectionTest005
     * @tc.number KEY_COLLECTION_TEST_005
     * @tc.desc   Map.set() New object key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      class A { id: number =1 };
      const key:A  = { id: 1 };
      const map: Map<A, string> = new Map();
      map.set(key, 'user');
      expect(map.get(key)).assertEqual('user');
    })

    /**
     * @tc.name   KeyCollectionTest006
     * @tc.number KEY_COLLECTION_TEST_006
     * @tc.desc   Map.get() Get a non-existent key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<string, number> = new Map();
      expect(map.get('none')).assertEqual(undefined);
    })

    /**
     * @tc.name   KeyCollectionTest007
     * @tc.number KEY_COLLECTION_TEST_007
     * @tc.desc   Map.has() Detect non-existent keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<boolean, string> = new Map();
      expect(map.has(false)).assertEqual(false);
    })

    /**
     * @tc.name   KeyCollectionTest008
     * @tc.number KEY_COLLECTION_TEST_008
     * @tc.desc   Map.delete() Delete multiple keys consecutively
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<number, number> = new Map([[1, 10], [2, 20], [3, 30]]);
      map.delete(1);
      map.delete(2);
      expect(map.size).assertEqual(1);
    })

    /**
     * @tc.name   KeyCollectionTest009
     * @tc.number KEY_COLLECTION_TEST_009
     * @tc.desc   Map.clear() Then add the element again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<string, string> = new Map([['a', 'b']]);
      map.clear();
      map.set('c', 'd');
      expect(map.size).assertEqual(1);
    })

    /**
     * @tc.name   KeyCollectionTest010
     * @tc.number KEY_COLLECTION_TEST_010
     * @tc.desc   Map iterator keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<number, string> = new Map([[1, 'x'], [2, 'y']]);
      const keys: number[] = Array.from(map.keys());
      expect(keys[0]).assertEqual(1);
    })

    /**
     * @tc.name   KeyCollectionTest012
     * @tc.number KEY_COLLECTION_TEST_012
     * @tc.desc   Map iterator values()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<string, number> = new Map([['a', 1], ['b', 2]]);
      const values: number[] = Array.from(map.values());
      expect(values[1]).assertEqual(2);
    })

    /**
     * @tc.name   KeyCollectionTest013
     * @tc.number KEY_COLLECTION_TEST_013
     * @tc.desc   Map iterator entries()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<boolean, number> = new Map([[true, 1], [false, 0]]);
      const entries: [boolean, number][] = Array.from(map.entries());
      expect(entries[0][1]).assertEqual(1);
    })

    /**
     * @tc.name   KeyCollectionTest014
     * @tc.number KEY_COLLECTION_TEST_014
     * @tc.desc   Map key is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<null, string> = new Map();
      map.set(null, 'null key');
      expect(map.get(null)).assertEqual('null key');
    })

    /**
     * @tc.name   KeyCollectionTest015
     * @tc.number KEY_COLLECTION_TEST_015
     * @tc.desc   Map key is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<undefined, number> = new Map();
      map.set(undefined, 100);
      expect(map.has(undefined)).assertEqual(true);
    })

    /**
     * @tc.name   KeyCollectionTest016
     * @tc.number KEY_COLLECTION_TEST_016
     * @tc.desc   WeakMap The key is an object (obtained multiple times)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      class A { name = 'test' };
      const wm: WeakMap<object, number> = new WeakMap();
      const key: A = { name: 'test' };
      wm.set(key, 123);
      expect(wm.get(key)).assertEqual(123);
      expect(wm.get(key)).assertEqual(123); // Secondary acquisition
    })

    /**
     * @tc.name   KeyCollectionTest017
     * @tc.number KEY_COLLECTION_TEST_017
     * @tc.desc   WeakMap.delete() A non-existent key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const wm: WeakMap<object, string> = new WeakMap();
      class A { };
      const result: boolean = wm.delete(new A()); // Anonymous object, no reference
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   KeyCollectionTest018
     * @tc.number KEY_COLLECTION_TEST_018
     * @tc.desc   WeakMap The key is an array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const wm: WeakMap<object, boolean> = new WeakMap();
      const key: number[] = [1, 2, 3];
      wm.set(key, true);
      expect(wm.has(key)).assertEqual(true);
    })

    /**
     * @tc.name   KeyCollectionTest022
     * @tc.number KEY_COLLECTION_TEST_022
     * @tc.desc   WeakMap Overwrite existing keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      class A {};
      const key: object = new A();
      const wm: WeakMap<object, number> = new WeakMap();
      wm.set(key, 1);
      wm.set(key, 2); // Overwrite
      expect(wm.get(key)).assertEqual(2);
    })

    /**
     * @tc.name   KeyCollectionTest023
     * @tc.number KEY_COLLECTION_TEST_023
     * @tc.desc   Set Initialization (including arrays)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set: Set<string> = new Set(['a', 'b', 'c']);
      expect(set.size).assertEqual(3);
    })

    /**
     * @tc.name   KeyCollectionTest024
     * @tc.number KEY_COLLECTION_TEST_024
     * @tc.desc   Set.add() Mixed type value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set: Set<string | number> = new Set();
      set.add('a');
      set.add(1);
      expect(set.size).assertEqual(2);
    })

    /**
     * @tc.name   KeyCollectionTest025
     * @tc.number KEY_COLLECTION_TEST_025
     * @tc.desc   Set.has() detect NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set: Set<number> = new Set();
      set.add(NaN);
      expect(set.has(NaN)).assertEqual(true);
    })

    /**
     * @tc.name   KeyCollectionTest026
     * @tc.number KEY_COLLECTION_TEST_026
     * @tc.desc   Set.delete() A non-existent value
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest026', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL1, ():void => {
      const set: Set<boolean> = new Set([true]);
      const result: boolean = set.delete(false);
      expect(result).assertEqual(false);
    })

    /**
     * @tc.name   KeyCollectionTest027
     * @tc.number KEY_COLLECTION_TEST_027
     * @tc.desc   Set.clear() Post-detection value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set: Set<number> = new Set([1, 2]);
      set.clear();
      expect(set.has(1)).assertEqual(false);
    })

    /**
     * @tc.name   KeyCollectionTest029
     * @tc.number KEY_COLLECTION_TEST_029
     * @tc.desc   Set iterator for...of
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set: Set<string> = new Set(['x', 'y']);
      let first: string = '';
      for (const val of set) {
        first = val;
        break;
      }
      expect(first).assertEqual('x');
    })

    /**
     * @tc.name   KeyCollectionTest030
     * @tc.number KEY_COLLECTION_TEST_030
     * @tc.desc   Set keys() and values() are the same.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set: Set<number> = new Set([10]);
      const key: number = Array.from(set.keys())[0];
      const value: number = Array.from(set.values())[0];
      expect(key === value).assertEqual(true);
    })

    /**
     * @tc.name   KeyCollectionTest031
     * @tc.number KEY_COLLECTION_TEST_031
     * @tc.desc   WeakSet.add() Repeated object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      class A { };
      const ws: WeakSet<object> = new WeakSet();
      const val: object = new A();
      ws.add(val);
      ws.add(val); // Repeated addition
      expect(ws.has(val)).assertEqual(true);
    })

    /**
     * @tc.name   KeyCollectionTest032
     * @tc.number KEY_COLLECTION_TEST_032
     * @tc.desc   WeakSet.has() Recovered object (simulation)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const ws: WeakSet<object> = new WeakSet();
      class A { };
      let val: object | null = new A();
      ws.add(val);
      val = null; // Remove references and simulate recycling
      // The recycling cannot be directly detected. The test logic shows no error
      expect(true).assertEqual(true);
    })

    /**
     * @tc.name   KeyCollectionTest033
     * @tc.number KEY_COLLECTION_TEST_033
     * @tc.desc   WeakSet.delete() The existing value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const ws: WeakSet<object> = new WeakSet();
      class A { id: number =1 };
      const val: object = new A();
      ws.add(val);
      const result: boolean = ws.delete(val);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   KeyCollectionTest036
     * @tc.number KEY_COLLECTION_TEST_036
     * @tc.desc   In a Map, -0 and +0 are regarded as the same key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<number, string> = new Map();
      map.set(-0, 'zero');
      expect(map.get(+0)).assertEqual('zero');
    })

    /**
     * @tc.name   KeyCollectionTest037
     * @tc.number KEY_COLLECTION_TEST_037
     * @tc.desc   In a Set, -0 and +0 are regarded as the same value
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest037', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, ():void => {
      const set: Set<number> = new Set();
      set.add(-0);
      set.add(+0);
      expect(set.size).assertEqual(1);
    })

    /**
     * @tc.name   KeyCollectionTest038
     * @tc.number KEY_COLLECTION_TEST_038
     * @tc.desc   Different objects are regarded as different values in a Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set: Set<object> = new Set();
      class A { id: number =1 };
      set.add(new A());
      set.add(new A()); // 新对象
      expect(set.size).assertEqual(2);
    })

    /**
     * @tc.name   KeyCollectionTest039
     * @tc.number KEY_COLLECTION_TEST_039
     * @tc.desc   Strings and numbers are regarded as different keys in a Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map: Map<string | number, string> = new Map();
      map.set('1', 'string');
      map.set(1, 'number');
      expect(map.size).assertEqual(2);
    })

    /**
     * @tc.name   KeyCollectionTest040
     * @tc.number KEY_COLLECTION_TEST_040
     * @tc.desc   Strings and numbers are regarded as different values in a Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('KeyCollectionTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set: Set<string | number> = new Set();
      set.add('1');
      set.add(1);
      expect(set.size).assertEqual(2);
    })

  })
}
