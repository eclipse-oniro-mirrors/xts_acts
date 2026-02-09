
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
class TestClass {}
class TestClass2 {
  a:int;
  b:int;
}
export default function MapClearTest() {
  describe('MapClearTest', () => {
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
     * @tc.number MAP_CLEAR_TEST_001
     * @tc.name MapClearTest001
     * @tc.desc Clear an empty Map, check size is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,number> = new Map<number, number>();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_002
     * @tc.name MapClearTest002
     * @tc.desc Clear a Map with one element, check size is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_003
     * @tc.name MapClearTest003
     * @tc.desc Clear a Map with multiple elements, check size is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map<number, string>();
      map.set(1, 'a');
      map.set(2, 'b');
      map.set(3, 'c');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_004
     * @tc.name MapClearTest004
     * @tc.desc After clear, check if original key exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.has('key')).assertEqual(false);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_005
     * @tc.name MapClearTest005
     * @tc.desc After clear, check if get returns undefined for original key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map<string, string>();
      map.set('key', 'value');
      map.clear();
      expect(map.get('key')).assertEqual(undefined);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_006
     * @tc.name MapClearTest006
     * @tc.desc Clear a Map with number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map<number, string>();
      map.set(100, 'hundred');
      map.set(200, 'two hundred');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_007
     * @tc.name MapClearTest007
     * @tc.desc Clear a Map with boolean keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<boolean,string> = new Map<boolean, string>();
      map.set(true, 'yes');
      map.set(false, 'no');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_008
     * @tc.name MapClearTest008
     * @tc.desc Clear a Map with object keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const obj1 = new Object();
      const obj2 = new Object();
      const map:Map<Any,string> = new Map<Any, string>();
      map.set(obj1, 'value1');
      map.set(obj2, 'value2');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_009
     * @tc.name MapClearTest009
     * @tc.desc Clear a Map with null key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,string> = new Map<Any, string>();
      map.set(null, 'null value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_010
     * @tc.name MapClearTest010
     * @tc.desc Clear a Map with undefined key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,string>  = new Map<Any, string>();
      map.set(undefined, 'undefined value');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_012
     * @tc.name MapClearTest012
     * @tc.desc Clear a Map with function keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const func1 = () => {};
      const func2 = () => {};
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set(func1, 'function1');
      map.set(func2, 'function2');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_013
     * @tc.name MapClearTest013
     * @tc.desc Clear a Map with array keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set(arr1, 'array1');
      map.set(arr2, 'array2');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_014
     * @tc.name MapClearTest014
     * @tc.desc Clear a Map with mixed key types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set('string', 1);
      map.set(123, 'number');
      map.set(true, 'boolean');
      map.set({} as TestClass, 'object');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_015
     * @tc.name MapClearTest015
     * @tc.desc Clear a Map and check entries iterator is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      expect(Array.from(map.entries()).length).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_016
     * @tc.name MapClearTest016
     * @tc.desc Clear a Map and check keys iterator is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      expect(Array.from(map.keys()).length).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_017
     * @tc.name MapClearTest017
     * @tc.desc Clear a Map and check values iterator is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set('a', 1);
      map.set('b', 2);
      map.clear();
      expect(Array.from(map.values()).length).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_018
     * @tc.name MapClearTest018
     * @tc.desc Call clear multiple times on the same Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set('key', 'value');
      map.clear();
      map.clear();
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_019
     * @tc.name MapClearTest019
     * @tc.desc Clear a Map and then add new elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set('old', 'value');
      map.clear();
      map.set('new', 'value');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_020
     * @tc.name MapClearTest020
     * @tc.desc Clear a Map created from an array of pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<string, number>([['a', 1], ['b', 2], ['c', 3]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_021
     * @tc.name MapClearTest021
     * @tc.desc Clear a Map created from another Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const original = new Map<string, number>([['a', 1]]);
      const map = new Map<string, number>(original);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_022
     * @tc.name MapClearTest022
     * @tc.desc Clear a large Map with 1000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      for (let i: int = 0; i < 1000; i++) {
        map.set(i, i * 2);
      }
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_024
     * @tc.name MapClearTest024
     * @tc.desc Clear a Map and check forEach doesn't execute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<string, number>([['a', 1]]);
      map.clear();
      let count: int = 0;
      map.forEach(() => {count++});
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_025
     * @tc.name MapClearTest025
     * @tc.desc Clear a Map with nested objects as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set('obj', { a: 1, b: 2 } as TestClass2);
      map.set('arr', [1, 2, 3]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_026
     * @tc.name MapClearTest026
     * @tc.desc Clear a Map with Date objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const date1 = new Date(2020, 0, 1);
      const date2 = new Date(2021, 0, 1);
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set(date1, '2020');
      map.set(date2, '2021');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_027
     * @tc.name MapClearTest027
     * @tc.desc Clear a Map with RegExp objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const regex1 = new RegExp("test");
      const regex2 = new RegExp("another");
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set(regex1, 'first');
      map.set(regex2, 'second');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_028
     * @tc.name MapClearTest028
     * @tc.desc Clear a Map and verify with has() for multiple keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
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
     * @tc.number MAP_CLEAR_TEST_029
     * @tc.name MapClearTest029
     * @tc.desc Clear a Map with numbers that are loosely equal but strictly different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set(1, 'number');
      map.set('1', 'string');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_030
     * @tc.name MapClearTest030
     * @tc.desc Clear a Map and check after setting same key again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      const key = 'key';
      map.set(key, 'old');
      map.clear();
      map.set(key, 'new');
      expect(map.get(key) as string).assertEqual('new');
    });

    /**
     * @tc.number MAP_CLEAR_TEST_031
     * @tc.name MapClearTest031
     * @tc.desc Clear a Map with Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set(Infinity, 'infinite');
      map.set(-Infinity, 'negative infinite');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_032
     * @tc.name MapClearTest032
     * @tc.desc Clear a Map with NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set(NaN, 'not a number');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_034
     * @tc.name MapClearTest034
     * @tc.desc Clear a Map and check if it's iterable (should be empty)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      map.clear();
      let count: int = 0;
      for (const entry of map) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_035
     * @tc.name MapClearTest035
     * @tc.desc Clear a Map and check with JSON.stringify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<string, number>([['a', 1]]);
      map.clear();
      expect(JSON.stringify(Array.from(map))).assertEqual('[]');
    });

    /**
     * @tc.number MAP_CLEAR_TEST_036
     * @tc.name MapClearTest036
     * @tc.desc Clear a Map that's been assigned to another variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map1 = new Map<string, string>([['key', 'value']]);
      const map2 = map1;
      map2.clear();
      expect(map1.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_038
     * @tc.name MapClearTest038
     * @tc.desc Clear a Map and check prototype methods still work
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<string, number>([['a', 1]]);
      map.clear();
      map.set('b', 2);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_041
     * @tc.name MapClearTest041
     * @tc.desc Clear a Map with elements added after previous clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<Any,Any> = new Map<Any, Any>();
      map.set('first', 1);
      map.clear();
      map.set('second', 2);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_044
     * @tc.name MapClearTest044
     * @tc.desc Clear a Map with Unicode string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map<string, string>();
      map.set('café', 'coffee');
      map.set('café', 'coffee'); // Same key with different encoding
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_045
     * @tc.name MapClearTest045
     * @tc.desc Clear a Map with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,string> = new Map<string, string>();
      map.set('', 'empty string');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_046
     * @tc.name MapClearTest046
     * @tc.desc Clear a Map with large integer keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map<number, string>();
      map.set(9007199254740991, 'max safe integer');
      map.set(9007199254740992, 'beyond max safe integer');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_047
     * @tc.name MapClearTest047
     * @tc.desc Clear a Map with negative number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map<number, string>();
      map.set(-1, 'negative one');
      map.set(-100, 'negative hundred');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_048
     * @tc.name MapClearTest048
     * @tc.desc Clear a Map with floating point number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<number,string> = new Map<number, string>();
      map.set(3.14, 'pi');
      map.set(2.718, 'e');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_051
     * @tc.name MapClearTest051
     * @tc.desc Clear a Map and check if it's empty using Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(Array.from(map).length).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_053
     * @tc.name MapClearTest053
     * @tc.desc Clear a Map and then delete a key (should have no effect)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<string, string>([['key', 'value']]);
      map.clear();
      const result = map.delete('key');
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_054
     * @tc.name MapClearTest054
     * @tc.desc Clear a Map in a setTimeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<string, string>([['key', 'value']]);
      setTimeout(() => {
        map.clear();
        expect(map.size).assertEqual(0);

      }, 0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_056
     * @tc.name MapClearTest056
     * @tc.desc Clear a Map with a Map as a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const innerMap = new Map<string, string>([['inner', 'value']]);
      const outerMap = new Map<string, Map<string, string>>([['outer', innerMap]]);
      outerMap.clear();
      expect(outerMap.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_057
     * @tc.name MapClearTest057
     * @tc.desc Clear a Map with a Set as a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const set = new Set<number>([1, 2, 3]);
      const map = new Map<string, Set<number>>([['set', set]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_058
     * @tc.name MapClearTest058
     * @tc.desc Clear a Map with a function as a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const func = () => 'test';
      const map = new Map<string, Function>([['func', func]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_061
     * @tc.name MapClearTest061
     * @tc.desc Clear a Map with a Date as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const date = new Date();
      const map = new Map<string, Date>([['date', date]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_062
     * @tc.name MapClearTest062
     * @tc.desc Clear a Map with a RegExp as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const regex = new RegExp("pattern");
      const map = new Map<string, RegExp>([['regex', regex]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_063
     * @tc.name MapClearTest063
     * @tc.desc Clear a Map with a class instance as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const instance = new TestClass();
      const map = new Map<TestClass, string>([[instance, 'instance value']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_064
     * @tc.name MapClearTest064
     * @tc.desc Clear a Map with a class instance as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const instance = new TestClass();
      const map = new Map<string, TestClass>([['key', instance]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_067
     * @tc.name MapClearTest067
     * @tc.desc Clear a Map with a Map as a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const keyMap = new Map<string, number>([['a', 1]]);
      const map = new Map<Map<string, number>, string>([[keyMap, 'value']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_068
     * @tc.name MapClearTest068
     * @tc.desc Clear a Map with a Set as a key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const keySet = new Set<number>([1, 2]);
      const map = new Map<Set<number>, string>([[keySet, 'value']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_073
     * @tc.name MapClearTest073
     * @tc.desc Clear a Map and check with Map.prototype.keys.next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number,string>([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(map.keys().next().done).assertEqual(true);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_074
     * @tc.name MapClearTest074
     * @tc.desc Clear a Map and check with Map.prototype.values.next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number,string>([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(map.values().next().done).assertEqual(true);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_075
     * @tc.name MapClearTest075
     * @tc.desc Clear a Map and check with Map.prototype.entries.next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number,string>([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(map.entries().next().done).assertEqual(true);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_076
     * @tc.name MapClearTest076
     * @tc.desc Clear a Map and check with Map.prototype[Symbol.iterator].next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number,string>([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(map.$_iterator().next().done).assertEqual(true);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_079
     * @tc.name MapClearTest079
     * @tc.desc Clear a Map and then check with a for loop using keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number,string>([[1, 'a'], [2, 'b']]);
      map.clear();
      let iterationCount: int = 0;

      for (const key of map.keys()) {
        iterationCount++;
      }

      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_080
     * @tc.name MapClearTest080
     * @tc.desc Clear a Map and then check with a for loop using values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number,string>([[1, 'a'], [2, 'b']]);
      map.clear();
      let iterationCount: int = 0;

      for (const value of map.values()) {
        iterationCount++;
      }

      expect(iterationCount).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_085
     * @tc.name MapClearTest085
     * @tc.desc Clear a Map and check with JSON.stringify after converting to array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number,string>([[1, 'a'], [2, 'b']]);
      map.clear();
      expect(JSON.stringify(Array.from(map.entries()))).assertEqual('[]');
    });

    /**
     * @tc.number MAP_CLEAR_TEST_086
     * @tc.name MapClearTest086
     * @tc.desc Clear a Map and then check if the map is equal to a new empty map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number,string>([[1, 'a']]);
      map.clear();
      const emptyMap:Map<string,string> = new Map<string, string>();
      expect(Array.from(map)).assertDeepEquals(Array.from(emptyMap));
    });

    /**
     * @tc.number MAP_CLEAR_TEST_089
     * @tc.name MapClearTest089
     * @tc.desc Clear a Map and check that the map is an instance of Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number,string>([[1, 'a']]);
      map.clear();
      expect(map instanceof Map).assertEqual(true);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_091
     * @tc.name MapClearTest091
     * @tc.desc Clear a Map with a key that's a BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<bigint,string> = new Map<bigint, string>();
      map.set(BigInt(9007199254740991), 'big integer');
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_092
     * @tc.name MapClearTest092
     * @tc.desc Clear a Map with a value that's a BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map:Map<string,bigint> = new Map<string, bigint>();
      map.set('bigint', BigInt(9007199254740991));
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_093
     * @tc.name MapClearTest093
     * @tc.desc Clear a Map with a key that's a typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const typedArray = new Uint8Array([1, 2, 3]);
      const map = new Map<Uint8Array,string>([[typedArray, 'typed array']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_094
     * @tc.name MapClearTest094
     * @tc.desc Clear a Map with a value that's a typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const typedArray = new Uint8Array([1, 2, 3]);
      const map = new Map<string, Uint8Array>([['typed', typedArray]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_095
     * @tc.name MapClearTest095
     * @tc.desc Clear a Map with a key that's an ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const buffer = new ArrayBuffer(8);
      const map = new Map<ArrayBuffer,string>([[buffer, 'array buffer']]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_096
     * @tc.name MapClearTest096
     * @tc.desc Clear a Map with a value that's an ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const buffer = new ArrayBuffer(8);
      const map = new Map<string,ArrayBuffer>([['buffer', buffer]]);
      map.clear();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number MAP_CLEAR_TEST_097
     * @tc.name MapClearTest097
     * @tc.desc Clear a Map and check that the clear method still exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapClearTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const map = new Map<number, string>([[1, 'a']]);
      map.clear();
      expect(typeof map.clear).assertEqual('function');
    });

  })
}


