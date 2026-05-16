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

class C {
}
export default function MapDeleteTest() {
  describe('MapDeleteTest', () => {
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
     * @tc.number MAP_DELETE_TEST_001
     * @tc.name MapDeleteTest001
     * @tc.desc delete existing string key should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_002
     * @tc.name MapDeleteTest002
     * @tc.desc delete existing number key should return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'x']]);
      let result = map.delete(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_003
     * @tc.name MapDeleteTest003
     * @tc.desc delete non-existing string key should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      let result = map.delete('b');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_004
     * @tc.name MapDeleteTest004
     * @tc.desc delete from empty map should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map: Map<string, string> = new Map<string, string>();
      let result = map.delete('a');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_005
     * @tc.name MapDeleteTest005
     * @tc.desc size should decrease after deleting existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number MAP_DELETE_TEST_006
     * @tc.name MapDeleteTest006
     * @tc.desc size should not change when deleting non-existing key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      map.delete('b');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number MAP_DELETE_TEST_007
     * @tc.name MapDeleteTest007
     * @tc.desc should remove only target key not others
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      expect(map.has('b')).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_008
     * @tc.name MapDeleteTest008
     * @tc.desc delete boolean true key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<boolean, string>([[true, 'yes']]);
      let result = map.delete(true);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_009
     * @tc.name MapDeleteTest009
     * @tc.desc delete boolean false key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<boolean, string>([[false, 'no']]);
      let result = map.delete(false);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_010
     * @tc.name MapDeleteTest010
     * @tc.desc delete null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<Any, string>([[null, 'n']]);
      let result = map.delete(null);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_011
     * @tc.name MapDeleteTest011
     * @tc.desc delete undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<Any, string>([[undefined, 'u']]);
      let result = map.delete(undefined);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_014
     * @tc.name MapDeleteTest014
     * @tc.desc delete array key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = [1, 2];
      let map = new Map<Array<int>, string>([[arr, 'a']]);
      let result = map.delete(arr);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_015
     * @tc.name MapDeleteTest015
     * @tc.desc delete function key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let fn = () => {
      };
      let map = new Map<() =>void, string>([[fn, 'f']]);
      let result = map.delete(fn);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_017
     * @tc.name MapDeleteTest017
     * @tc.desc delete set used as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let set: Set<string> = new Set<string>();
      let map = new Map<Set<string>, string>([[set, 's']]);
      let result = map.delete(set);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_018
     * @tc.name MapDeleteTest018
     * @tc.desc delete twice should return false second time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      let first = map.delete('a');
      let second = map.delete('a');
      expect(second).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_019
     * @tc.name MapDeleteTest019
     * @tc.desc delete after clear should return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      map.clear();
      let result = map.delete('a');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_020
     * @tc.name MapDeleteTest020
     * @tc.desc delete inside iteration should not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1], ['b', 2]]);
      for (let key of map.keys()) {
        map.delete(key);
      }
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_DELETE_TEST_021
     * @tc.name MapDeleteTest021
     * @tc.desc delete correct key while others remain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      map.delete(2);
      expect(map.has(1)).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_022
     * @tc.name MapDeleteTest022
     * @tc.desc delete should affect has() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'one']]);
      map.delete(1);
      expect(map.has(1)).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_023
     * @tc.name MapDeleteTest023
     * @tc.desc delete should affect get() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'one']]);
      map.delete(1);
      expect(map.get(1)).assertEqual(undefined);
    });

    /**
     * @tc.number MAP_DELETE_TEST_029
     * @tc.name MapDeleteTest029
     * @tc.desc delete works after set overwrites value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'one']]);
      map.set(1, 'uno');
      let result = map.delete(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_030
     * @tc.name MapDeleteTest030
     * @tc.desc delete large map element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map: Map<number, number> = new Map<number, number>();
      for (let i = 0; i < 1000; i++) {
        map.set(i, i);
      }
      let result = map.delete(500);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_031
     * @tc.name MapDeleteTest031
     * @tc.desc delete multiple sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      map.delete(1);
      map.delete(2);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number MAP_DELETE_TEST_032
     * @tc.name MapDeleteTest032
     * @tc.desc delete all keys should empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      map.delete(1);
      map.delete(2);
      map.delete(3);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_DELETE_TEST_033
     * @tc.name MapDeleteTest033
     * @tc.desc delete should not affect unrelated keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      map.delete(1);
      expect(map.get(2)).assertEqual('b');
    });

    /**
     * @tc.number MAP_DELETE_TEST_034
     * @tc.name MapDeleteTest034
     * @tc.desc delete should return boolean not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string,number>([['a', 1]]);
      let result = map.delete('a');
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number MAP_DELETE_TEST_035
     * @tc.name MapDeleteTest035
     * @tc.desc delete should work after re-adding key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      map.delete('a');
      map.set('a', 2);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_037
     * @tc.name MapDeleteTest037
     * @tc.desc delete works on key with array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, Array<number>>([['a', [1, 2]]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_038
     * @tc.name MapDeleteTest038
     * @tc.desc delete works on key with function value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let fn = () => {};
      let map = new Map<string, ()=>void>([['a', fn]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_039
     * @tc.name MapDeleteTest039
     * @tc.desc delete works on key with map value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let inner: Map<string, string> = new Map<string, string>();
      let map = new Map<string, Map<string, string>>([['a', inner]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_040
     * @tc.name MapDeleteTest040
     * @tc.desc delete works on key with set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let inner: Set<string> = new Set<string>();
      let map = new Map<string, Set<string>>([['a', inner]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_042
     * @tc.name MapDeleteTest042
     * @tc.desc delete key with boolean true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, boolean>([['a', true]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_043
     * @tc.name MapDeleteTest043
     * @tc.desc delete key with boolean false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, boolean>([['a', false]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_044
     * @tc.name MapDeleteTest044
     * @tc.desc delete key with big integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let big = 9007199254740991n;
      let map = new Map<string, bigint>([['a', big]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_045
     * @tc.name MapDeleteTest045
     * @tc.desc delete non-existing key in non-empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      let result = map.delete('b');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_046
     * @tc.name MapDeleteTest046
     * @tc.desc delete then check map size decreases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number MAP_DELETE_TEST_047
     * @tc.name MapDeleteTest047
     * @tc.desc delete all keys one by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      map.delete('b');
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_DELETE_TEST_048
     * @tc.name MapDeleteTest048
     * @tc.desc delete with forEach iteration afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1], ['b', 2]]);
      map.delete('a');
      let keys: string[] = [];
      map.forEach((_, k) => {keys.push(k)});
      expect(keys.length).assertEqual(1);
      expect(keys[0]).assertEqual('b');
    });

    /**
     * @tc.number MAP_DELETE_TEST_050
     * @tc.name MapDeleteTest050
     * @tc.desc delete key and reinsert same key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      map.delete('a');
      map.set('a', 2);
      expect(map.get('a')).assertEqual(2);
    });

    /**
     * @tc.number MAP_DELETE_TEST_051
     * @tc.name MapDeleteTest051
     * @tc.desc delete key twice consecutively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      let first = map.delete('a');
      let second = map.delete('a');
      expect(first).assertEqual(true);
      expect(second).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_052
     * @tc.name MapDeleteTest052
     * @tc.desc delete key after clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      map.clear();
      let result = map.delete('a');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_055
     * @tc.name MapDeleteTest055
     * @tc.desc delete undefined key after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<Any, string>([[undefined, 'x']]);
      let result = map.delete(undefined);
      expect(result).assertEqual(true);
      expect(map.has(undefined)).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_056
     * @tc.name MapDeleteTest056
     * @tc.desc delete null key after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<Any, string>([[null, 'x']]);
      let result = map.delete(null);
      expect(result).assertEqual(true);
      expect(map.has(null)).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_060
     * @tc.name MapDeleteTest060
     * @tc.desc delete on large map (1000 entries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map: Map<number, number> = new Map<number, number>();
      for (let i = 0; i < 1000; i++) {
        map.set(i, i);
      }
      let result = map.delete(500);
      expect(result).assertEqual(true);
      expect(map.has(500)).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_064
     * @tc.name MapDeleteTest064
     * @tc.desc delete bigint key correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let big = 123456789012345678901234567890n;
      let map = new Map<bigint, string>([[big, 'big']]);
      let result = map.delete(big);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_065
     * @tc.name MapDeleteTest065
     * @tc.desc delete when value is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, Any>([['a', null]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_066
     * @tc.name MapDeleteTest066
     * @tc.desc delete when value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, Any>([['a', undefined]]);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_067
     * @tc.name MapDeleteTest067
     * @tc.desc delete multiple keys in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map: Map<number, number> = new Map<number, number>();
      for (let i = 0; i < 10; i++) {
        map.set(i, i);
      }
      for (let i = 0; i < 5; i++) {
        map.delete(i);
      }
      expect(map.size).assertEqual(5);
    });

    /**
     * @tc.number MAP_DELETE_TEST_068
     * @tc.name MapDeleteTest068
     * @tc.desc delete with string object key new String()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let key = new String('a');
      let map = new Map<string, string>([[key, 'value']]);
      let result = map.delete(key);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_069
     * @tc.name MapDeleteTest069
     * @tc.desc delete with number object key new Number()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let key = new Number(10);
      let map = new Map<Number, string>([[key, 'value']]);
      let result = map.delete(key);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_070
     * @tc.name MapDeleteTest070
     * @tc.desc delete with boolean object key new Boolean()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let key = new Boolean(true);
      let map = new Map<Boolean, string>([[key, 'value']]);
      let result = map.delete(key);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_071
     * @tc.name MapDeleteTest071
     * @tc.desc delete works with NaN key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[NaN, 'nan']]);
      let result = map.delete(NaN);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_072
     * @tc.name MapDeleteTest072
     * @tc.desc delete key that was never added
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map: Map<string, string> = new Map<string, string>();
      let result = map.delete('ghost');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_073
     * @tc.name MapDeleteTest073
     * @tc.desc delete after clear then add again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<string, number>([['a', 1]]);
      map.clear();
      map.set('a', 2);
      let result = map.delete('a');
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_074
     * @tc.name MapDeleteTest074
     * @tc.desc delete works with nested map as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let key = new Map<string, number>([['x', 1]]);
      let map = new Map<Map<string, number>, string>([[key, 'nested']]);
      let result = map.delete(key);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_075
     * @tc.name MapDeleteTest075
     * @tc.desc delete works with set as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let key = new Set<number>([1, 2]);
      let map = new Map<Set<number>, string>([[key, 'set']]);
      let result = map.delete(key);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_076
     * @tc.name MapDeleteTest076
     * @tc.desc delete works with function key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let fn = () => {}
      let map = new Map<() =>void, string>([[fn, 'func']]);
      let result = map.delete(fn);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_077
     * @tc.name MapDeleteTest077
     * @tc.desc delete works with arrow function key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let fn = () => {
      };
      let map = new Map<() =>void, string>([[fn, 'arrow']]);
      let result = map.delete(fn);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_078
     * @tc.name MapDeleteTest078
     * @tc.desc delete works with class instance key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let inst = new C();
      let map = new Map<C, string>([[inst, 'cls']]);
      let result = map.delete(inst);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_079
     * @tc.name MapDeleteTest079
     * @tc.desc delete works with Date key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let d = new Date();
      let map = new Map<Date, string>([[d, 'date']]);
      let result = map.delete(d);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_080
     * @tc.name MapDeleteTest080
     * @tc.desc delete works with RegExp key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let r = new RegExp("abc");
      let map = new Map<RegExp, string>([[r, 'regex']]);
      let result = map.delete(r);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_081
     * @tc.name MapDeleteTest081
     * @tc.desc delete key when map size is large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map: Map<number, number> = new Map<number, number>();
      for (let i = 0; i < 1000; i++) {
        map.set(i, i);
      }
      let result = map.delete(500);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_082
     * @tc.name MapDeleteTest082
     * @tc.desc delete non-existent key from large map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map: Map<number, number> = new Map<number, number>();
      for (let i = 0; i < 1000; i++) {
        map.set(i, i);
      }
      let result = map.delete(2000);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_083
     * @tc.name MapDeleteTest083
     * @tc.desc delete last key in map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      let result = map.delete(2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_084
     * @tc.name MapDeleteTest084
     * @tc.desc delete first key in map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      let result = map.delete(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_085
     * @tc.name MapDeleteTest085
     * @tc.desc delete in loop over map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      for (let key of map.keys()) {
        if (key === 2) {
          map.delete(key);
        }
      }
      expect(map.has(2)).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_086
     * @tc.name MapDeleteTest086
     * @tc.desc delete inside forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      map.forEach((_, k) => {
        if (k === 1) {
          map.delete(k);
        }
      });
      expect(map.has(1)).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_087
     * @tc.name MapDeleteTest087
     * @tc.desc delete during iteration with iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      let iter = map.keys();
      iter.next();
      map.delete(1);
      expect(map.has(1)).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_088
     * @tc.name MapDeleteTest088
     * @tc.desc delete same key twice in loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a']]);
      let first = map.delete(1);
      let second = map.delete(1);
      expect(first && !second).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_089
     * @tc.name MapDeleteTest089
     * @tc.desc delete after clearing map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new Map<number, string>([[1, 'a']]);
      map.clear();
      let result = map.delete(1);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number MAP_DELETE_TEST_090
     * @tc.name MapDeleteTest090
     * @tc.desc delete on map after re-insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map: Map<number, string> = new Map<number, string>();
      map.set(1, 'a');
      map.delete(1);
      map.set(1, 'b');
      let result = map.delete(1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number MAP_DELETE_TEST_099
     * @tc.name MapDeleteTest099
     * @tc.desc delete works with array as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapDeleteTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let key = [1, 2, 3];
      let map = new Map<Array<int>, string>([[key, 'val']]);
      let result = map.delete(key);
      expect(result).assertEqual(true);
    });

  })
}