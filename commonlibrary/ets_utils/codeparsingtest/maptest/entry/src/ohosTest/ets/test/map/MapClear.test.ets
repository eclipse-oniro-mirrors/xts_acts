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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { MapClearTest011, MapClearTest037,
  MapClearTest039,
  MapClearTest040,
  MapClearTest042,
  MapClearTest043,
  MapClearTest050,
  MapClearTest052,
  MapClearTest055,
  MapClearTest059,
  MapClearTest060,
  MapClearTest065,
  MapClearTest066,
  MapClearTest069,
  MapClearTest071,
  MapClearTest072,
  MapClearTest077,
  MapClearTest078,
  MapClearTest082,
  MapClearTest083,
  MapClearTest084,
  MapClearTest087,
  MapClearTest090,
  MapClearTest100,
  NewObject } from './MapClear'

export function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function MapClearTest() {
  describe('MapClearTest', () => {
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
     * @tc.name   MapClearTest001
     * @tc.number MAP_CLEAR_TEST_001
     * @tc.desc   Clear an empty Map, check size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,number> = new Map();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest002
     * @tc.number MAP_CLEAR_TEST_002
     * @tc.desc   Clear a Map with one element, check size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map();
      map.set('key', 'value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest003
     * @tc.number MAP_CLEAR_TEST_003
     * @tc.desc   Clear a Map with multiple elements, check size is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map();
      map.set(1, 'a');
      map.set(2, 'b');
      map.set(3, 'c');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest004
     * @tc.number MAP_CLEAR_TEST_004
     * @tc.desc   After clear, check if original key exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map();
      map.set('key', 'value');
      map.clear();
      expect(map.has('key')).assertEqual(false);
    });

    /**
     * @tc.name   MapClearTest005
     * @tc.number MAP_CLEAR_TEST_005
     * @tc.desc   After clear, check if get returns undefined for original key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map();
      map.set('key', 'value');
      map.clear();
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.name   MapClearTest006
     * @tc.number MAP_CLEAR_TEST_006
     * @tc.desc   Clear a Map with number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map();
      map.set(100, 'hundred');
      map.set(200, 'two hundred');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest007
     * @tc.number MAP_CLEAR_TEST_007
     * @tc.desc   Clear a Map with boolean keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<boolean,string> = new Map();
      map.set(true, 'yes');
      map.set(false, 'no');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest008
     * @tc.number MAP_CLEAR_TEST_008
     * @tc.desc   Clear a Map with object keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const obj1 = NewObject();
      const obj2 = NewObject();
      const map:Map<object,string> = new Map();
      map.set(obj1, 'value1');
      map.set(obj2, 'value2');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest009
     * @tc.number MAP_CLEAR_TEST_009
     * @tc.desc   Clear a Map with null key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,string> = new Map();
      map.set(null, 'null value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest010
     * @tc.number MAP_CLEAR_TEST_010
     * @tc.desc   Clear a Map with undefined key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,string>  = new Map();
      map.set(undefined, 'undefined value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest011
     * @tc.number MAP_CLEAR_TEST_011
     * @tc.desc   Clear a Map with symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = MapClearTest011();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest012
     * @tc.number MAP_CLEAR_TEST_012
     * @tc.desc   Clear a Map with function keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const func1 = () => {};
      const func2 = () => {};
      const map:Map<ESObject,ESObject> = new Map();
      map.set(func1, 'function1');
      map.set(func2, 'function2');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest013
     * @tc.number MAP_CLEAR_TEST_013
     * @tc.desc   Clear a Map with array keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const map:Map<ESObject,ESObject> = new Map();
      map.set(arr1, 'array1');
      map.set(arr2, 'array2');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest014
     * @tc.number MAP_CLEAR_TEST_014
     * @tc.desc   Clear a Map with mixed key types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set('string', 1);
      map.set(123, 'number');
      map.set(true, 'boolean');
      map.set({}, 'object');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest015
     * @tc.number MAP_CLEAR_TEST_015
     * @tc.desc   Clear a Map and check entries iterator is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      expect(Array.from(map.entries()).length).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest016
     * @tc.number MAP_CLEAR_TEST_016
     * @tc.desc   Clear a Map and check keys iterator is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      expect(Array.from(map.keys()).length).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest017
     * @tc.number MAP_CLEAR_TEST_017
     * @tc.desc   Clear a Map and check values iterator is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      expect(Array.from(map.values()).length).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest018
     * @tc.number MAP_CLEAR_TEST_018
     * @tc.desc   Call clear multiple times on the same Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set('key', 'value');
      map.clear();
      map.clear();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest019
     * @tc.number MAP_CLEAR_TEST_019
     * @tc.desc   Clear a Map and then add new elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set('old', 'value');
      map.clear();
      map.set('new', 'value');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.name   MapClearTest020
     * @tc.number MAP_CLEAR_TEST_020
     * @tc.desc   Clear a Map created from an array of pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([['a', 1], ['b', 2], ['c', 3]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest021
     * @tc.number MAP_CLEAR_TEST_021
     * @tc.desc   Clear a Map created from another Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const original = new Map([['a', 1]]);
      const map = new Map(original);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest022
     * @tc.number MAP_CLEAR_TEST_022
     * @tc.desc   Clear a large Map with 1000 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      for (let i = 0; i < 1000; i++) {
        map.set(i, i * 2);
      }
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest023
     * @tc.number MAP_CLEAR_TEST_023
     * @tc.desc   Check that clear returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      const result:ESObject = map.clear();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   MapClearTest024
     * @tc.number MAP_CLEAR_TEST_024
     * @tc.desc   Clear a Map and check forEach doesn't execute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([['a', 1]]);
      map.clear();
      let count = 0;
      map.forEach(() => count++);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest025
     * @tc.number MAP_CLEAR_TEST_025
     * @tc.desc   Clear a Map with nested objects as values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set('obj', { a: 1, b: 2 });
      map.set('arr', [1, 2, 3]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest026
     * @tc.number MAP_CLEAR_TEST_026
     * @tc.desc   Clear a Map with Date objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const date1 = new Date(2020, 0, 1);
      const date2 = new Date(2021, 0, 1);
      const map:Map<ESObject,ESObject> = new Map();
      map.set(date1, '2020');
      map.set(date2, '2021');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest027
     * @tc.number MAP_CLEAR_TEST_027
     * @tc.desc   Clear a Map with RegExp objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const regex1 = /test/;
      const regex2 = /another/;
      const map:Map<ESObject,ESObject> = new Map();
      map.set(regex1, 'first');
      map.set(regex2, 'second');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest028
     * @tc.number MAP_CLEAR_TEST_028
     * @tc.desc   Clear a Map and verify with has() for multiple keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      const key1 = 'key1';
      const key2 = 'key2';
      const key3 = 'key3';
      map.set(key1, 1);
      map.set(key2, 2);
      map.set(key3, 3);
      map.clear();
      expect(map.has(key1) && map.has(key2) && map.has(key3)).assertEqual(false);
    });

    /**
     * @tc.name   MapClearTest029
     * @tc.number MAP_CLEAR_TEST_029
     * @tc.desc   Clear a Map with numbers that are loosely equal but strictly different
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set(1, 'number');
      map.set('1', 'string');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest030
     * @tc.number MAP_CLEAR_TEST_030
     * @tc.desc   Clear a Map and check after setting same key again
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      const key = 'key';
      map.set(key, 'old');
      map.clear();
      map.set(key, 'new');
      expect(map.get(key)).assertEqual('new');
    });

    /**
     * @tc.name   MapClearTest031
     * @tc.number MAP_CLEAR_TEST_031
     * @tc.desc   Clear a Map with Infinity as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set(Infinity, 'infinite');
      map.set(-Infinity, 'negative infinite');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest032
     * @tc.number MAP_CLEAR_TEST_032
     * @tc.desc   Clear a Map with NaN as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set(NaN, 'not a number');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest033
     * @tc.number MAP_CLEAR_TEST_033
     * @tc.desc   Clear a Map with multiple references to the same object key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const obj = NewObject();
      const map:Map<ESObject,ESObject> = new Map();
      map.set(obj, 'value1');
      map.set(obj, 'value2'); // This overwrites the previous entry
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest034
     * @tc.number MAP_CLEAR_TEST_034
     * @tc.desc   Clear a Map and check if it's iterable (should be empty)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      let count = 0;
      for (const entry of map) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest035
     * @tc.number MAP_CLEAR_TEST_035
     * @tc.desc   Clear a Map and check with JSON.stringify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([['a', 1]]);
      map.clear();
      expect(JSON.stringify(Array.from(map))).assertEqual('[]');
    });

    /**
     * @tc.name   MapClearTest036
     * @tc.number MAP_CLEAR_TEST_036
     * @tc.desc   Clear a Map that's been assigned to another variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map1 = new Map([['key', 'value']]);
      const map2 = map1;
      map2.clear();
      expect(map1.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest037
     * @tc.number MAP_CLEAR_TEST_037
     * @tc.desc   Clear a Map inside a function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      // let map = MapClearTest037();
      expect(MapClearTest037()).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest038
     * @tc.number MAP_CLEAR_TEST_038
     * @tc.desc   Clear a Map and check prototype methods still work
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([['a', 1]]);
      map.clear();
      map.set('b', 2);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   MapClearTest039
     * @tc.number MAP_CLEAR_TEST_039
     * @tc.desc   Clear a frozen Map (should throw error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {


      expect(MapClearTest039()).assertEqual(false);
    });

    /**
     * @tc.name   MapClearTest040
     * @tc.number MAP_CLEAR_TEST_040
     * @tc.desc   Clear a sealed Map (should throw error)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      expect(MapClearTest040()).assertEqual(false);
    });

    /**
     * @tc.name   MapClearTest041
     * @tc.number MAP_CLEAR_TEST_041
     * @tc.desc   Clear a Map with elements added after previous clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,ESObject> = new Map();
      map.set('first', 1);
      map.clear();
      map.set('second', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest042
     * @tc.number MAP_CLEAR_TEST_042
     * @tc.desc   Clear a Map and check that keys are not weakly referenced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      let map:Map<ESObject,ESObject> = MapClearTest042()
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest043
     * @tc.number MAP_CLEAR_TEST_043
     * @tc.desc   Clear a Map during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      expect(MapClearTest043()).assertEqual(2);
    });

    /**
     * @tc.name   MapClearTest044
     * @tc.number MAP_CLEAR_TEST_044
     * @tc.desc   Clear a Map with Unicode string keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map();
      map.set('café', 'coffee');
      map.set('café', 'coffee'); // Same key with different encoding
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest045
     * @tc.number MAP_CLEAR_TEST_045
     * @tc.desc   Clear a Map with empty string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map();
      map.set('', 'empty string');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest046
     * @tc.number MAP_CLEAR_TEST_046
     * @tc.desc   Clear a Map with large integer keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map();
      map.set(9007199254740991, 'max safe integer');
      map.set(9007199254740992, 'beyond max safe integer');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest047
     * @tc.number MAP_CLEAR_TEST_047
     * @tc.desc   Clear a Map with negative number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map();
      map.set(-1, 'negative one');
      map.set(-100, 'negative hundred');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest048
     * @tc.number MAP_CLEAR_TEST_048
     * @tc.desc   Clear a Map with floating point number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map();
      map.set(3.14, 'pi');
      map.set(2.718, 'e');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest049
     * @tc.number MAP_CLEAR_TEST_049
     * @tc.desc   Clear a Map with Symbol.iterator as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<ESObject,string> = new Map();
      map.set(Symbol.iterator, 'iterator symbol');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest050
     * @tc.number MAP_CLEAR_TEST_050
     * @tc.desc   Clear a Map with well-known symbols as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest050()).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest051
     * @tc.number MAP_CLEAR_TEST_051
     * @tc.desc   Clear a Map and check if it's empty using Array.from
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(Array.from(map).length).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest052
     * @tc.number MAP_CLEAR_TEST_052
     * @tc.desc   Clear a Map and check with spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest052()).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest053
     * @tc.number MAP_CLEAR_TEST_053
     * @tc.desc   Clear a Map and then delete a key (should have no effect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([['key', 'value']]);
      map.clear();
      const result = map.delete('key');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   MapClearTest054
     * @tc.number MAP_CLEAR_TEST_054
     * @tc.desc   Clear a Map in a setTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([['key', 'value']]);

      setTimeout(() => {
        map.clear();
        expect(map.size).assertEqual(0);

      }, 0);
    });

    /**
     * @tc.name   MapClearTest055
     * @tc.number MAP_CLEAR_TEST_055
     * @tc.desc   Clear a Map in a promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async ():Promise<void> => {

      expect(await MapClearTest055()).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest056
     * @tc.number MAP_CLEAR_TEST_056
     * @tc.desc   Clear a Map with a Map as a value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const innerMap = new Map([['inner', 'value']]);
      const outerMap = new Map([['outer', innerMap]]);
      outerMap.clear();
      expect(outerMap.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest057
     * @tc.number MAP_CLEAR_TEST_057
     * @tc.desc   Clear a Map with a Set as a value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set = new Set([1, 2, 3]);
      const map = new Map([['set', set]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest058
     * @tc.number MAP_CLEAR_TEST_058
     * @tc.desc   Clear a Map with a function as a value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const func = () => 'test';
      const map = new Map([['func', func]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest059
     * @tc.number MAP_CLEAR_TEST_059
     * @tc.desc   Clear a Map and check that the original values are still accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      expect(MapClearTest059()).assertEqual('test');
    });

    /**
     * @tc.name   MapClearTest060
     * @tc.number MAP_CLEAR_TEST_060
     * @tc.desc   Clear a Map and check that the original keys are still accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      expect(MapClearTest060()).assertEqual('test');
    });

    /**
     * @tc.name   MapClearTest061
     * @tc.number MAP_CLEAR_TEST_061
     * @tc.desc   Clear a Map with a Date as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const date = new Date();
      const map = new Map([['date', date]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest062
     * @tc.number MAP_CLEAR_TEST_062
     * @tc.desc   Clear a Map with a RegExp as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const regex = /pattern/;
      const map = new Map([['regex', regex]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest063
     * @tc.number MAP_CLEAR_TEST_063
     * @tc.desc   Clear a Map with a class instance as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      class TestClass {}
      const instance = new TestClass();
      const map = new Map([[instance, 'instance value']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest064
     * @tc.number MAP_CLEAR_TEST_064
     * @tc.desc   Clear a Map with a class instance as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      class TestClass {}
      const instance = new TestClass();
      const map = new Map([['key', instance]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest065
     * @tc.number MAP_CLEAR_TEST_065
     * @tc.desc   Clear a Map with a Buffer as key (Node.js environment)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest065()).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest066
     * @tc.number MAP_CLEAR_TEST_066
     * @tc.desc   Clear a Map with a Buffer as value (Node.js environment)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest066()).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest067
     * @tc.number MAP_CLEAR_TEST_067
     * @tc.desc   Clear a Map with a Map as a key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const keyMap = new Map([['a', 1]]);
      const map = new Map([[keyMap, 'value']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest068
     * @tc.number MAP_CLEAR_TEST_068
     * @tc.desc   Clear a Map with a Set as a key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const keySet = new Set([1, 2]);
      const map = new Map([[keySet, 'value']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest069
     * @tc.number MAP_CLEAR_TEST_069
     * @tc.desc   Clear a Map with a WeakMap reference as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      expect(MapClearTest069()).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest070
     * @tc.number MAP_CLEAR_TEST_070
     * @tc.desc   Clear a Map with a WeakSet reference as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const weakSet = new WeakSet();
      const obj = NewObject();
      weakSet.add(obj);
      const map = new Map([['weak', weakSet]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest071
     * @tc.number MAP_CLEAR_TEST_071
     * @tc.desc   Clear a Map with a generator function as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      expect(MapClearTest071()).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest072
     * @tc.number MAP_CLEAR_TEST_072
     * @tc.desc   Clear a Map with an async function as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      expect(MapClearTest072()).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest073
     * @tc.number MAP_CLEAR_TEST_073
     * @tc.desc   Clear a Map and check with Map.prototype.keys.next()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(map.keys().next().done).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest074
     * @tc.number MAP_CLEAR_TEST_074
     * @tc.desc   Clear a Map and check with Map.prototype.values.next()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(map.values().next().done).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest075
     * @tc.number MAP_CLEAR_TEST_075
     * @tc.desc   Clear a Map and check with Map.prototype.entries.next()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(map.entries().next().done).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest076
     * @tc.number MAP_CLEAR_TEST_076
     * @tc.desc   Clear a Map and check with Map.prototype[Symbol.iterator].next()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(map[Symbol.iterator]().next().done).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest077
     * @tc.number MAP_CLEAR_TEST_077
     * @tc.desc   Clear a Map and check if the map is empty with a custom function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      expect(MapClearTest077()).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest078
     * @tc.number MAP_CLEAR_TEST_078
     * @tc.desc   Clear a Map and then check with a for...of loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest078()).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest079
     * @tc.number MAP_CLEAR_TEST_079
     * @tc.desc   Clear a Map and then check with a for loop using keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      let iterationCount = 0;

      for (const key of map.keys()) {
        iterationCount++;
      }

      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest080
     * @tc.number MAP_CLEAR_TEST_080
     * @tc.desc   Clear a Map and then check with a for loop using values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      let iterationCount = 0;

      for (const value of map.values()) {
        iterationCount++;
      }

      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest081
     * @tc.number MAP_CLEAR_TEST_081
     * @tc.desc   Clear a Map with a key that's a reference to the map itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:ESObject = new Map();
      map.set(map, 'self reference');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest082
     * @tc.number MAP_CLEAR_TEST_082
     * @tc.desc   Clear a Map with circular references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {

      expect(MapClearTest082()).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest083
     * @tc.number MAP_CLEAR_TEST_083
     * @tc.desc   Clear a Map with a key that's a DOM element (browser environment)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest083()).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest084
     * @tc.number MAP_CLEAR_TEST_084
     * @tc.desc   Clear a Map with a value that's a DOM element (browser environment)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest084()).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest085
     * @tc.number MAP_CLEAR_TEST_085
     * @tc.desc   Clear a Map and check with JSON.stringify after converting to array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(JSON.stringify(Array.from(map.entries()))).assertEqual('[]');
    });

    /**
     * @tc.name   MapClearTest086
     * @tc.number MAP_CLEAR_TEST_086
     * @tc.desc   Clear a Map and then check if the map is equal to a new empty map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a']]);
      map.clear();
      const emptyMap:Map<string,string> = new Map();
      expect(Array.from(map)).assertDeepEquals(Array.from(emptyMap));
    });

    /**
     * @tc.name   MapClearTest087
     * @tc.number MAP_CLEAR_TEST_087
     * @tc.desc   Clear a Map and check that the map's prototype is unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest087()).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest088
     * @tc.number MAP_CLEAR_TEST_088
     * @tc.desc   Clear a Map and check that the map's constructor is Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a']]);
      map.clear();
      expect(map.constructor).assertEqual(Map);
    });

    /**
     * @tc.name   MapClearTest089
     * @tc.number MAP_CLEAR_TEST_089
     * @tc.desc   Clear a Map and check that the map is an instance of Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a']]);
      map.clear();
      expect(map instanceof Map).assertEqual(true);
    });

    /**
     * @tc.name   MapClearTest090
     * @tc.number MAP_CLEAR_TEST_090
     * @tc.desc   Clear a Map and check that the map has not been converted to another type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest090()).assertEqual('[object Map]');
    });

    /**
     * @tc.name   MapClearTest091
     * @tc.number MAP_CLEAR_TEST_091
     * @tc.desc   Clear a Map with a key that's a BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<bigint,string> = new Map();
      map.set(BigInt(9007199254740991), 'big integer');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest092
     * @tc.number MAP_CLEAR_TEST_092
     * @tc.desc   Clear a Map with a value that's a BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,bigint> = new Map();
      map.set('bigint', BigInt(9007199254740991));
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest093
     * @tc.number MAP_CLEAR_TEST_093
     * @tc.desc   Clear a Map with a key that's a typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const typedArray = new Uint8Array([1, 2, 3]);
      const map = new Map([[typedArray, 'typed array']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest094
     * @tc.number MAP_CLEAR_TEST_094
     * @tc.desc   Clear a Map with a value that's a typed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const typedArray = new Uint8Array([1, 2, 3]);
      const map = new Map([['typed', typedArray]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest095
     * @tc.number MAP_CLEAR_TEST_095
     * @tc.desc   Clear a Map with a key that's an ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const buffer = new ArrayBuffer(8);
      const map = new Map([[buffer, 'array buffer']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest096
     * @tc.number MAP_CLEAR_TEST_096
     * @tc.desc   Clear a Map with a value that's an ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const buffer = new ArrayBuffer(8);
      const map = new Map([['buffer', buffer]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest097
     * @tc.number MAP_CLEAR_TEST_097
     * @tc.desc   Clear a Map and check that the clear method still exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map([[1, 'a']]);
      map.clear();
      expect(typeof map.clear).assertEqual('function');
    });

    /**
     * @tc.name   MapClearTest098
     * @tc.number MAP_CLEAR_TEST_098
     * @tc.desc   Clear a Map with a key that's a Proxy object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const target = NewObject();
      const proxy = new Proxy(target, NewObject());
      const map = new Map([[proxy, 'proxy']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest099
     * @tc.number MAP_CLEAR_TEST_099
     * @tc.desc   Clear a Map with a value that's a Proxy object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const target = NewObject();
      const proxy = new Proxy(target, NewObject());
      const map = new Map([['proxy', proxy]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapClearTest100
     * @tc.number MAP_CLEAR_TEST_100
     * @tc.desc   Clear a Map with a key that's a Reflect object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapClearTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      expect(MapClearTest100()).assertEqual(0);
    });
  })
}


