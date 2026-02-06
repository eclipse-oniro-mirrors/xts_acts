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
import {
  MapConstructorObject,
  MapConstructorPrototype,
  MapConstructorSymbol,
  MapConstructorTest004,
  MapConstructorTest005,
  MapConstructorTest006,
  MapConstructorTest009,
  MapConstructorTest010,
  MapConstructorTest020,
  MapConstructorTest021,
  MapConstructorTest028,
  MapConstructorTest029,
  MapConstructorTest030,
  MapConstructorTest031,
  MapConstructorTest032,
  MapConstructorTest034,
  MapConstructorTest035,
  MapConstructorTest036,
  MapConstructorTest041,
  MapConstructorTest043,
  MapConstructorTest048,
  MapConstructorTest049,
  MapConstructorTest054,
  MapConstructorTest059,
  MapConstructorTest061,
  MapConstructorTest064,
  MapConstructorTest083,
  MapConstructorTest084,
  MapConstructorTest091,
  MapConstructorTest092,
  MapConstructorTest094,
  MapConstructorTest095,
  MapConstructorTest096,
  MapConstructorTest097,
  MapConstructorTest098,
  MapConstructorTest099,
  MapConstructorTest100,
  MapConstructorTest101,
  MapConstructorTest102,
  MapConstructorTest103
} from './mapConstructor'

export function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function MapConstructorTest() {
  describe('MapConstructorTest', () => {
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
     * @tc.name   MapConstructorTest001
     * @tc.number MAP_CONSTRUCTOR_TEST_001
     * @tc.desc   Create empty Map using constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<number, number> = new Map();
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapConstructorTest002
     * @tc.number MAP_CONSTRUCTOR_TEST_002
     * @tc.desc   Create Map from array of key-value pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([['a', 1], ['b', 2]]);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.name   MapConstructorTest003
     * @tc.number MAP_CONSTRUCTOR_TEST_003
     * @tc.desc   Create Map from another Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original = new Map([['key', 'value']]);
      const map = new Map(original);
      expect(map.get('key')).assertEqual('value');
    });

    /**
     * @tc.name   MapConstructorTest004
     * @tc.number MAP_CONSTRUCTOR_TEST_004
     * @tc.desc   Create Map from Set with key-value pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('MapConstructorTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
    //   const map:Map<ESObject,ESObject> = MapConstructorTest004()
    //   expect(map.has('a')).assertEqual(true);
    // });

    /**
     * @tc.name   MapConstructorTest005
     * @tc.number MAP_CONSTRUCTOR_TEST_005
     * @tc.desc   Create Map from object with iterable interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = MapConstructorTest005()
      expect(map.get('y')).assertEqual(20);
    });

    /**
     * @tc.name   MapConstructorTest006
     * @tc.number MAP_CONSTRUCTOR_TEST_006
     * @tc.desc   Map constructor without new throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let errorThrown = MapConstructorTest006();
      expect(errorThrown).assertEqual(false);
    });

    /**
     * @tc.name   MapConstructorTest007
     * @tc.number MAP_CONSTRUCTOR_TEST_007
     * @tc.desc   Create Map with null as parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>(null);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapConstructorTest008
     * @tc.number MAP_CONSTRUCTOR_TEST_008
     * @tc.desc   Create Map with undefined as parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>(undefined);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.name   MapConstructorTest009
     * @tc.number MAP_CONSTRUCTOR_TEST_009
     * @tc.desc   Create Map with number as parameter (non-iterable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let errorThrown = MapConstructorTest009()
      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   MapConstructorTest010
     * @tc.number MAP_CONSTRUCTOR_TEST_010
     * @tc.desc   Create Map with string as parameter (iterable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('MapConstructorTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
    //   let map:Map<string,ESObject> = MapConstructorTest010()
    //   expect(map.size).assertEqual(3);
    //   expect(map.get('a')).assertEqual('a'.charCodeAt(0));
    // });

    /**
     * @tc.name   MapConstructorTest011
     * @tc.number MAP_CONSTRUCTOR_TEST_011
     * @tc.desc   Map with boolean keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[true, 'yes'], [false, 'no']]);
      expect(map.get(true)).assertEqual('yes');
      expect(map.get(false)).assertEqual('no');
    });

    /**
     * @tc.name   MapConstructorTest012
     * @tc.number MAP_CONSTRUCTOR_TEST_012
     * @tc.desc   Map with number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[1, 'one'], [2, 'two']]);
      expect(map.get(1)).assertEqual('one');
      expect(map.get(2)).assertEqual('two');
    });

    /**
     * @tc.name   MapConstructorTest013
     * @tc.number MAP_CONSTRUCTOR_TEST_013
     * @tc.desc   Map with object keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj1 = MapConstructorObject();
      const obj2 = MapConstructorObject();
      const map = new Map([[obj1, 'value1'], [obj2, 'value2']]);
      expect(map.get(obj1)).assertEqual('value1');
      expect(map.get(obj2)).assertEqual('value2');
    });

    /**
     * @tc.name   MapConstructorTest014
     * @tc.number MAP_CONSTRUCTOR_TEST_014
     * @tc.desc   Map with NaN as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[NaN, 'not a number']]);
      expect(map.get(NaN)).assertEqual('not a number');
    });

    /**
     * @tc.name   MapConstructorTest015
     * @tc.number MAP_CONSTRUCTOR_TEST_015
     * @tc.desc   Map with symbol keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const sym1 = MapConstructorSymbol('key1');
      const sym2 = MapConstructorSymbol('key2');
      const map = new Map([[sym1, 'val1'], [sym2, 'val2']]);
      expect(map.get(sym1)).assertEqual('val1');
      expect(map.get(sym2)).assertEqual('val2');
    });

    /**
     * @tc.name   MapConstructorTest016
     * @tc.number MAP_CONSTRUCTOR_TEST_016
     * @tc.desc   Map with mixed key types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = MapConstructorObject();
      const sym = MapConstructorSymbol();
      const map = new Map([
        [1, 'num'],
        ['str', 'string'],
        [true, 'bool'],
        [obj, 'object'],
        [sym, 'symbol']
      ]);
      expect(map.get(1)).assertEqual('num');
      expect(map.get('str')).assertEqual('string');
      expect(map.get(true)).assertEqual('bool');
      expect(map.get(obj)).assertEqual('object');
      expect(map.get(sym)).assertEqual('symbol');
    });

    /**
     * @tc.name   MapConstructorTest017
     * @tc.number MAP_CONSTRUCTOR_TEST_017
     * @tc.desc   Map with duplicate primitive keys in iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([['a', 1], ['a', 2], ['a', 3]]);
      expect(map.size).assertEqual(1);
      expect(map.get('a')).assertEqual(3);
    });

    /**
     * @tc.name   MapConstructorTest018
     * @tc.number MAP_CONSTRUCTOR_TEST_018
     * @tc.desc   Map with duplicate object keys in iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = MapConstructorObject();
      const map = new Map([[obj, 1], [obj, 2], [obj, 3]]);
      expect(map.size).assertEqual(1);
      expect(map.get(obj)).assertEqual(3);
    });

    /**
     * @tc.name   MapConstructorTest019
     * @tc.number MAP_CONSTRUCTOR_TEST_019
     * @tc.desc   Map with nested arrays as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const arr1 = [1, 2];
      const arr2 = [1, 2];
      const map = new Map([[arr1, 'val1'], [arr2, 'val2']]);
      expect(map.size).assertEqual(2);
      expect(map.get(arr1)).assertEqual('val1');
      expect(map.get(arr2)).assertEqual('val2');
    });

    /**
     * @tc.name   MapConstructorTest020
     * @tc.number MAP_CONSTRUCTOR_TEST_020
     * @tc.desc   Create Map from array-like object with length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('MapConstructorTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
    //   const map:Map<string,number> = MapConstructorTest020();
    //   expect(map.size).assertEqual(0);
    // });

    /**
     * @tc.name   MapConstructorTest021
     * @tc.number MAP_CONSTRUCTOR_TEST_021
     * @tc.desc   Create Map from generator function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = MapConstructorTest021();
      expect(map.size).assertEqual(3);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   MapConstructorTest022
     * @tc.number MAP_CONSTRUCTOR_TEST_022
     * @tc.desc   Check Map.prototype.constructor property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = new Map();
      expect(map.constructor).assertEqual(Map);
    });

    /**
     * @tc.name   MapConstructorTest023
     * @tc.number MAP_CONSTRUCTOR_TEST_023
     * @tc.desc   Check Map is instance of Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = new Map();
      expect(map instanceof Map).assertEqual(true);
    });

    /**
     * @tc.name   MapConstructorTest024
     * @tc.number MAP_CONSTRUCTOR_TEST_024
     * @tc.desc   Check Map is instance of Object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = new Map();
      expect(map instanceof Object).assertEqual(true);
    });

    /**
     * @tc.name   MapConstructorTest025
     * @tc.number MAP_CONSTRUCTOR_TEST_025
     * @tc.desc   Check Map.prototype is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(typeof MapConstructorPrototype()).assertEqual('object');
    });

    /**
     * @tc.name   MapConstructorTest026
     * @tc.number MAP_CONSTRUCTOR_TEST_026
     * @tc.desc   Create Map with Date objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const date1 = new Date(2020, 0, 1);
      const date2 = new Date(2020, 0, 1);
      const map = new Map([[date1, 'first'], [date2, 'second']]);
      expect(map.size).assertEqual(2);
      expect(map.get(date1)).assertEqual('first');
      expect(map.get(date2)).assertEqual('second');
    });

    /**
     * @tc.name   MapConstructorTest027
     * @tc.number MAP_CONSTRUCTOR_TEST_027
     * @tc.desc   Create Map with RegExp objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const regex1 = /test/;
      const regex2 = /test/;
      const map = new Map([[regex1, 'one'], [regex2, 'two']]);
      expect(map.size).assertEqual(2);
      expect(map.get(regex1)).assertEqual('one');
      expect(map.get(regex2)).assertEqual('two');
    });

    /**
     * @tc.name   MapConstructorTest028
     * @tc.number MAP_CONSTRUCTOR_TEST_028
     * @tc.desc   Create large Map with 1000 entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = MapConstructorTest028();
      expect(map.size).assertEqual(1000);
      expect(map.get('key999')).assertEqual(999);
    });

    /**
     * @tc.name   MapConstructorTest029
     * @tc.number MAP_CONSTRUCTOR_TEST_029
     * @tc.desc   Map constructor with non-array iterable entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<string, number> = MapConstructorTest029();
      expect(map.size).assertEqual(2);
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.name   MapConstructorTest030
     * @tc.number MAP_CONSTRUCTOR_TEST_030
     * @tc.desc   Map constructor with iterable containing non-entry elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('MapConstructorTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
    //   const map = MapConstructorTest030();
    //   expect(map.size).assertEqual(1);
    //   expect(map.get('valid')).assertEqual(1);
    // });

    /**
     * @tc.name   MapConstructorTest031
     * @tc.number MAP_CONSTRUCTOR_TEST_031
     * @tc.desc   Map with key as Map instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const val = MapConstructorTest031();
      expect(val).assertEqual('value');
    });

    /**
     * @tc.name   MapConstructorTest032
     * @tc.number MAP_CONSTRUCTOR_TEST_032
     * @tc.desc   Map with key as Set instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      const map = MapConstructorTest032();
      expect(map.map.get(map.keySet)).assertEqual('value');
    });

    /**
     * @tc.name   MapConstructorTest033
     * @tc.number MAP_CONSTRUCTOR_TEST_033
     * @tc.desc   Map with key as Function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const keyFunc = () => {
      };
      const map = new Map([[keyFunc, 'value']]);
      expect(map.get(keyFunc)).assertEqual('value');
    });

    /**
     * @tc.name   MapConstructorTest034
     * @tc.number MAP_CONSTRUCTOR_TEST_034
     * @tc.desc   Check Map.prototype.size is a getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const descriptor = MapConstructorTest034();
      expect(typeof descriptor.g).assertEqual('function');
      expect(descriptor.s).assertEqual(undefined);
    });

    /**
     * @tc.name   MapConstructorTest035
     * @tc.number MAP_CONSTRUCTOR_TEST_035
     * @tc.desc   Create Map from another Map with same entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const original: Map<ESObject, ESObject> = MapConstructorTest035();
      const copy: Map<ESObject, ESObject> = new Map(original);
      expect(copy.size).assertEqual(original.size);
      expect(copy.get('a')).assertEqual(original.get('a'));
      expect(copy.get(2)).assertEqual(original.get(2));
      expect(copy.get(true)).assertEqual(original.get(true));
    });

    /**
     * @tc.name   MapConstructorTest036
     * @tc.number MAP_CONSTRUCTOR_TEST_036
     * @tc.desc   Map with numeric string vs number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<ESObject, ESObject> = MapConstructorTest036();
      expect(map.size).assertEqual(2);
      expect(map.get('1')).assertEqual('string');
      expect(map.get(1)).assertEqual('number');
    });

    /**
     * @tc.name   MapConstructorTest037
     * @tc.number MAP_CONSTRUCTOR_TEST_037
     * @tc.desc   Map with key as null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[null, 'null value']]);
      expect(map.get(null)).assertEqual('null value');
    });

    /**
     * @tc.name   MapConstructorTest038
     * @tc.number MAP_CONSTRUCTOR_TEST_038
     * @tc.desc   Map with key as undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[undefined, 'undefined value']]);
      expect(map.get(undefined)).assertEqual('undefined value');
    });

    /**
     * @tc.name   MapConstructorTest039
     * @tc.number MAP_CONSTRUCTOR_TEST_039
     * @tc.desc   Map with key as Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Infinity, 'infinity value']]);
      expect(map.get(Infinity)).assertEqual('infinity value');
    });

    /**
     * @tc.name   MapConstructorTest040
     * @tc.number MAP_CONSTRUCTOR_TEST_040
     * @tc.desc   Map with key as -Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[-Infinity, 'negative infinity value']]);
      expect(map.get(-Infinity)).assertEqual('negative infinity value');
    });

    /**
     * @tc.name   MapConstructorTest041
     * @tc.number MAP_CONSTRUCTOR_TEST_041
     * @tc.desc   Map constructor with iterable that modifies itself during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      const map: Map<ESObject, ESObject> = MapConstructorTest041();
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.name   MapConstructorTest042
     * @tc.number MAP_CONSTRUCTOR_TEST_042
     * @tc.desc   Map with key as bigint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const key = 123n;
      const map = new Map([[key, 'bigint value']]);
      expect(map.get(key)).assertEqual('bigint value');
    });

    /**
     * @tc.name   MapConstructorTest043
     * @tc.number MAP_CONSTRUCTOR_TEST_043
     * @tc.desc   Map with same numeric bigint and number as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map: Map<ESObject, ESObject> = MapConstructorTest043();
      expect(map.size).assertEqual(2);
      expect(map.get(123)).assertEqual('number');
      expect(map.get(123n)).assertEqual('bigint');
    });

    /**
     * @tc.name   MapConstructorTest044
     * @tc.number MAP_CONSTRUCTOR_TEST_044
     * @tc.desc   Map with empty string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([['', 'empty string']]);
      expect(map.get('')).assertEqual('empty string');
    });

    /**
     * @tc.name   MapConstructorTest045
     * @tc.number MAP_CONSTRUCTOR_TEST_045
     * @tc.desc   Map with whitespace string keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[' ', 'space'], ['\t', 'tab'], ['\n', 'newline']]);
      expect(map.get(' ')).assertEqual('space');
      expect(map.get('\t')).assertEqual('tab');
      expect(map.get('\n')).assertEqual('newline');
    });

    /**
     * @tc.name   MapConstructorTest046
     * @tc.number MAP_CONSTRUCTOR_TEST_046
     * @tc.desc   Map with special character keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([['!', 'exclamation'], ['@', 'at'], ['#', 'hash']]);
      expect(map.get('!')).assertEqual('exclamation');
      expect(map.get('@')).assertEqual('at');
      expect(map.get('#')).assertEqual('hash');
    });

    /**
     * @tc.name   MapConstructorTest047
     * @tc.number MAP_CONSTRUCTOR_TEST_047
     * @tc.desc   Map with Unicode character keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([['€', 'euro'], ['π', 'pi'], ['😊', 'smile']]);
      expect(map.get('€')).assertEqual('euro');
      expect(map.get('π')).assertEqual('pi');
      expect(map.get('😊')).assertEqual('smile');
    });

    /**
     * @tc.name   MapConstructorTest048
     * @tc.number MAP_CONSTRUCTOR_TEST_048
     * @tc.desc   Map constructor with sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('MapConstructorTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
    //   const map:Map<ESObject,ESObject> = MapConstructorTest048();
    //   expect(map.size).assertEqual(2);
    //   expect(map.get('a')).assertEqual(1);
    //   expect(map.get('b')).assertEqual(2);
    // });

    /**
     * @tc.name   MapConstructorTest049
     * @tc.number MAP_CONSTRUCTOR_TEST_049
     * @tc.desc   Map with key as WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = MapConstructorTest049();
      expect(map.map.get(map.keyWeakMap)).assertEqual('value');
    });

    /**
     * @tc.name   MapConstructorTest050
     * @tc.number MAP_CONSTRUCTOR_TEST_050
     * @tc.desc   Map with key as WeakSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const keyWeakSet = new WeakSet();
      const map = new Map([[keyWeakSet, 'value']]);
      expect(map.get(keyWeakSet)).assertEqual('value');
    });

    /**
     * @tc.name   MapConstructorTest051
     * @tc.number MAP_CONSTRUCTOR_TEST_051
     * @tc.desc   Map with key as ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const buffer = new ArrayBuffer(8);
      const map = new Map([[buffer, 'buffer value']]);
      expect(map.get(buffer)).assertEqual('buffer value');
    });

    /**
     * @tc.name   MapConstructorTest052
     * @tc.number MAP_CONSTRUCTOR_TEST_052
     * @tc.desc   Map with key as DataView
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const view = new DataView(new ArrayBuffer(8));
      const map = new Map([[view, 'view value']]);
      expect(map.get(view)).assertEqual('view value');
    });

    /**
     * @tc.name   MapConstructorTest053
     * @tc.number MAP_CONSTRUCTOR_TEST_053
     * @tc.desc   Map with key as TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const typedArray = new Uint8Array([1, 2, 3]);
      const map = new Map([[typedArray, 'typed array value']]);
      expect(map.get(typedArray)).assertEqual('typed array value');
    });

    /**
     * @tc.name   MapConstructorTest054
     * @tc.number MAP_CONSTRUCTOR_TEST_054
     * @tc.desc   Map constructor with iterable that throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {

      const map = MapConstructorTest054();
      expect(map.errorThrown).assertEqual(true);
      expect(map.map).assertEqual(undefined);
    });

    /**
     * @tc.name   MapConstructorTest055
     * @tc.number MAP_CONSTRUCTOR_TEST_055
     * @tc.desc   Map with key as Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const error = new Error('test');
      const map = new Map([[error, 'error value']]);
      expect(map.get(error)).assertEqual('error value');
    });

    /**
     * @tc.name   MapConstructorTest056
     * @tc.number MAP_CONSTRUCTOR_TEST_056
     * @tc.desc   Map with key as Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const promise = Promise.resolve();
      const map = new Map([[promise, 'promise value']]);
      expect(map.get(promise)).assertEqual('promise value');
    });

    /**
     * @tc.name   MapConstructorTest057
     * @tc.number MAP_CONSTRUCTOR_TEST_057
     * @tc.desc   Map with key as Proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const target = MapConstructorObject();
      const proxy = new Proxy(target, MapConstructorObject());
      const map = new Map([[proxy, 'proxy value']]);
      expect(map.get(proxy)).assertEqual('proxy value');
    });

    /**
     * @tc.name   MapConstructorTest058
     * @tc.number MAP_CONSTRUCTOR_TEST_058
     * @tc.desc   Map with key as class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      class MyClass {
      }

      const instance = new MyClass();
      const map = new Map([[instance, 'instance value']]);
      expect(map.get(instance)).assertEqual('instance value');
    });

    /**
     * @tc.name   MapConstructorTest059
     * @tc.number MAP_CONSTRUCTOR_TEST_059
     * @tc.desc   Map with key as generator object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = MapConstructorTest059();
      expect(map.map.get(map.generator)).assertEqual('generator value');
    });

    /**
     * @tc.name   MapConstructorTest060
     * @tc.number MAP_CONSTRUCTOR_TEST_060
     * @tc.desc   Map with key as regex result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const result = /t(e)st/.exec('test');
      if (result) {
        const map = new Map([[result, 'result value']]);
        expect(map.get(result)).assertEqual('result value');
      } else {
        expect(true).assertEqual(false); // Should not reach here
      }
    });

    /**
     * @tc.name   MapConstructorTest061
     * @tc.number MAP_CONSTRUCTOR_TEST_061
     * @tc.desc   Map with key as arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const args = MapConstructorTest061();
      const map = new Map([[args, 'arguments value']]);
      expect(map.get(args)).assertEqual('arguments value');
    });

    /**
     * @tc.name   MapConstructorTest062
     * @tc.number MAP_CONSTRUCTOR_TEST_062
     * @tc.desc   Map with circular reference as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const obj = MapConstructorObject();
      obj.self = obj; // Create circular reference
      const map = new Map([[obj, 'circular value']]);
      expect(map.get(obj)).assertEqual('circular value');
    });


    /**
     * @tc.name   MapConstructorTest064
     * @tc.number MAP_CONSTRUCTOR_TEST_064
     * @tc.desc   Map constructor with iterable that returns non-objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('MapConstructorTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
    //   const map:Map<ESObject,ESObject> = MapConstructorTest064();
    //   expect(map.size).assertEqual(0);
    // });

    /**
     * @tc.name   MapConstructorTest065
     * @tc.number MAP_CONSTRUCTOR_TEST_065
     * @tc.desc   Map with key as Math object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Math, 'math value']]);
      expect(map.get(Math)).assertEqual('math value');
    });

    /**
     * @tc.name   MapConstructorTest066
     * @tc.number MAP_CONSTRUCTOR_TEST_066
     * @tc.desc   Map with key as JSON object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[JSON, 'json value']]);
      expect(map.get(JSON)).assertEqual('json value');
    });

    /**
     * @tc.name   MapConstructorTest067
     * @tc.number MAP_CONSTRUCTOR_TEST_067
     * @tc.desc   Map with key as Array constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Array, 'array constructor']]);
      expect(map.get(Array)).assertEqual('array constructor');
    });

    /**
     * @tc.name   MapConstructorTest068
     * @tc.number MAP_CONSTRUCTOR_TEST_068
     * @tc.desc   Map with key as Object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Object, 'object constructor']]);
      expect(map.get(Object)).assertEqual('object constructor');
    });

    /**
     * @tc.name   MapConstructorTest069
     * @tc.number MAP_CONSTRUCTOR_TEST_069
     * @tc.desc   Map with key as Function constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Function, 'function constructor']]);
      expect(map.get(Function)).assertEqual('function constructor');
    });

    /**
     * @tc.name   MapConstructorTest070
     * @tc.number MAP_CONSTRUCTOR_TEST_070
     * @tc.desc   Map with key as Number constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Number, 'number constructor']]);
      expect(map.get(Number)).assertEqual('number constructor');
    });

    /**
     * @tc.name   MapConstructorTest071
     * @tc.number MAP_CONSTRUCTOR_TEST_071
     * @tc.desc   Map with key as String constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[String, 'string constructor']]);
      expect(map.get(String)).assertEqual('string constructor');
    });

    /**
     * @tc.name   MapConstructorTest072
     * @tc.number MAP_CONSTRUCTOR_TEST_072
     * @tc.desc   Map with key as Boolean constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Boolean, 'boolean constructor']]);
      expect(map.get(Boolean)).assertEqual('boolean constructor');
    });

    /**
     * @tc.name   MapConstructorTest073
     * @tc.number MAP_CONSTRUCTOR_TEST_073
     * @tc.desc   Map with key as Symbol function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Symbol, 'symbol function']]);
      expect(map.get(Symbol)).assertEqual('symbol function');
    });

    /**
     * @tc.name   MapConstructorTest074
     * @tc.number MAP_CONSTRUCTOR_TEST_074
     * @tc.desc   Map with key as Date constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Date, 'date constructor']]);
      expect(map.get(Date)).assertEqual('date constructor');
    });

    /**
     * @tc.name   MapConstructorTest075
     * @tc.number MAP_CONSTRUCTOR_TEST_075
     * @tc.desc   Map with key as RegExp constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[RegExp, 'regexp constructor']]);
      expect(map.get(RegExp)).assertEqual('regexp constructor');
    });

    /**
     * @tc.name   MapConstructorTest076
     * @tc.number MAP_CONSTRUCTOR_TEST_076
     * @tc.desc   Map with key as Error constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Error, 'error constructor']]);
      expect(map.get(Error)).assertEqual('error constructor');
    });

    /**
     * @tc.name   MapConstructorTest077
     * @tc.number MAP_CONSTRUCTOR_TEST_077
     * @tc.desc   Map with key as Map constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Map, 'map constructor']]);
      expect(map.get(Map)).assertEqual('map constructor');
    });

    /**
     * @tc.name   MapConstructorTest078
     * @tc.number MAP_CONSTRUCTOR_TEST_078
     * @tc.desc   Map with key as Set constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Set, 'set constructor']]);
      expect(map.get(Set)).assertEqual('set constructor');
    });

    /**
     * @tc.name   MapConstructorTest079
     * @tc.number MAP_CONSTRUCTOR_TEST_079
     * @tc.desc   Map with key as WeakMap constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[WeakMap, 'weakmap constructor']]);
      expect(map.get(WeakMap)).assertEqual('weakmap constructor');
    });

    /**
     * @tc.name   MapConstructorTest080
     * @tc.number MAP_CONSTRUCTOR_TEST_080
     * @tc.desc   Map with key as WeakSet constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[WeakSet, 'weakset constructor']]);
      expect(map.get(WeakSet)).assertEqual('weakset constructor');
    });

    /**
     * @tc.name   MapConstructorTest081
     * @tc.number MAP_CONSTRUCTOR_TEST_081
     * @tc.desc   Map with key as Promise constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Promise, 'promise constructor']]);
      expect(map.get(Promise)).assertEqual('promise constructor');
    });

    /**
     * @tc.name   MapConstructorTest082
     * @tc.number MAP_CONSTRUCTOR_TEST_082
     * @tc.desc   Map with key as Proxy constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Proxy, 'proxy constructor']]);
      expect(map.get(Proxy)).assertEqual('proxy constructor');
    });

    /**
     * @tc.name   MapConstructorTest083
     * @tc.number MAP_CONSTRUCTOR_TEST_083
     * @tc.desc   Map with key as Reflect object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = MapConstructorTest083();
      expect(map.map.get(map.Reflect)).assertEqual('reflect object');
    });

    /**
     * @tc.name   MapConstructorTest084
     * @tc.number MAP_CONSTRUCTOR_TEST_084
     * @tc.desc   Map with key as Intl object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = MapConstructorTest084();
      expect(map.map.get(map.Intl)).assertEqual('intl object');
    });

    /**
     * @tc.name   MapConstructorTest085
     * @tc.number MAP_CONSTRUCTOR_TEST_085
     * @tc.desc   Map with key as Atomics object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      if (typeof Atomics !== 'undefined') {
        const map = new Map([[Atomics, 'atomics object']]);
        expect(map.get(Atomics)).assertEqual('atomics object');
      } else {
        // Skip if Atomics is not available
      }
    });

    /**
     * @tc.name   MapConstructorTest086
     * @tc.number MAP_CONSTRUCTOR_TEST_086
     * @tc.desc   Map with key as SharedArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      if (typeof SharedArrayBuffer !== 'undefined') {
        const map = new Map([[SharedArrayBuffer, 'shared array buffer constructor']]);
        expect(map.get(SharedArrayBuffer)).assertEqual('shared array buffer constructor');
      } else {
        // Skip if SharedArrayBuffer is not available
      }
    });

    /**
     * @tc.name   MapConstructorTest087
     * @tc.number MAP_CONSTRUCTOR_TEST_087
     * @tc.desc   Map with key as DataView constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[DataView, 'data view constructor']]);
      expect(map.get(DataView)).assertEqual('data view constructor');
    });

    /**
     * @tc.name   MapConstructorTest088
     * @tc.number MAP_CONSTRUCTOR_TEST_088
     * @tc.desc   Map with key as ArrayBuffer constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[ArrayBuffer, 'array buffer constructor']]);
      expect(map.get(ArrayBuffer)).assertEqual('array buffer constructor');
    });

    /**
     * @tc.name   MapConstructorTest089
     * @tc.number MAP_CONSTRUCTOR_TEST_089
     * @tc.desc   Map with key as Uint8Array constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Uint8Array, 'uint8 array constructor']]);
      expect(map.get(Uint8Array)).assertEqual('uint8 array constructor');
    });

    /**
     * @tc.name   MapConstructorTest090
     * @tc.number MAP_CONSTRUCTOR_TEST_090
     * @tc.desc   Map with key as Float64Array constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map([[Float64Array, 'float64 array constructor']]);
      expect(map.get(Float64Array)).assertEqual('float64 array constructor');
    });

    /**
     * @tc.name   MapConstructorTest093
     * @tc.number MAP_CONSTRUCTOR_TEST_093
     * @tc.desc   Map with key as console object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      if (typeof console !== 'undefined') {
        const map = new Map([[console, 'console object']]);
        expect(map.get(console)).assertEqual('console object');
      } else {
        // Skip if console is not available
      }
    });

    /**
     * @tc.name   MapConstructorTest101
     * @tc.number MAP_CONSTRUCTOR_TEST_101
     * @tc.desc   Map with key as a frozen object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const frozen = MapConstructorTest101();
      const map = new Map([[frozen, 'frozen value']]);
      expect(map.get(frozen)).assertEqual('frozen value');
    });

    /**
     * @tc.name   MapConstructorTest102
     * @tc.number MAP_CONSTRUCTOR_TEST_102
     * @tc.desc   Map with key as a sealed object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const sealed = MapConstructorObject();
      MapConstructorTest102(sealed);
      const map = new Map([[sealed, 'sealed value']]);
      expect(map.get(sealed)).assertEqual('sealed value');
    });

    /**
     * @tc.name   MapConstructorTest103
     * @tc.number MAP_CONSTRUCTOR_TEST_103
     * @tc.desc   Map with key as an immutable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const immutable = MapConstructorTest103()
      const map = new Map([[immutable, 'immutable value']]);
      expect(map.get(immutable)).assertEqual('immutable value');
    });

    /**
     * @tc.name   MapConstructorTest104
     * @tc.number MAP_CONSTRUCTOR_TEST_104
     * @tc.desc   Map with key as a primitive wrapper object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const numObj = new Number(123);
      const map = new Map([[numObj, 'number object']]);
      expect(map.get(numObj)).assertEqual('number object');
      expect(map.get(123)).assertEqual(undefined);
    });

    /**
     * @tc.name   MapConstructorTest105
     * @tc.number MAP_CONSTRUCTOR_TEST_105
     * @tc.desc   Map with key as a string object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const strObj = new String('test');
      const map = new Map([[strObj, 'string object']]);
      expect(map.get(strObj)).assertEqual('string object');
      expect(map.get('test')).assertEqual(undefined);
    });

    /**
     * @tc.name   MapConstructorTest106
     * @tc.number MAP_CONSTRUCTOR_TEST_106
     * @tc.desc   Map with key as a boolean object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapConstructorTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const boolObj = new Boolean(true);
      const map = new Map([[boolObj, 'boolean object']]);
      expect(map.get(boolObj)).assertEqual('boolean object');
      expect(map.get(true)).assertEqual(undefined);
    });

  })
}
