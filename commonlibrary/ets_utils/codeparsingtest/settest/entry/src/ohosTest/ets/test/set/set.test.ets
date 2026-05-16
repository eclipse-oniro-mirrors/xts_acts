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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,TestType, Level,Size} from '@ohos/hypium';
import { MapSetTest007, MapSetTest009, MapSetTest010, MapSetTest016, MapSetTest017, MapSetTest021,
  MapSetTest022,
  MapSetTest038,
  MapSetTest039,
  MapSetTest040,
  MapSetTest041,
  MapSetTest042,
  MapSetTest055,
  MapSetTest058,
  MapSetTest059,
  MapSetTest060,
  MapSetTest067,
  MapSetTest082,
  MapSetTest087,
  MapSetTest088,
  MapSetTest095,
  MapSetTest096,
  MapSetTest097} from './set';
export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}
export default function SetSetTest() {
  describe('SetSetTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50)
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
     * @tc.name   MapSetTest001
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_001
     * @tc.desc   Basic functionality: set string key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,string> = new Map();
      map.set('name', 'Alice');
      expect(map.has('name')).assertEqual(true);
      expect(map.get('name')).assertEqual('Alice');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.name   MapSetTest002
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_002
     * @tc.desc   Overwrite existing key with new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([['age', 20]]);
      map.set('age', 21);
      expect(map.get('age')).assertEqual(21);
      expect(map.size).assertEqual(1); // Size remains the same
    });

    /**
     * @tc.name   MapSetTest003
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_003
     * @tc.desc   Set number key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<number,string> = new Map();
      map.set(42, 'answer');
      expect(map.has(42)).assertEqual(true);
      expect(map.get(42)).assertEqual('answer');
    });

    /**
     * @tc.name   MapSetTest004
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_004
     * @tc.desc   Set boolean key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<boolean,string> = new Map();
      map.set(true, 'active');
      expect(map.has(true)).assertEqual(true);
      expect(map.get(true)).assertEqual('active');
      expect(map.has(false)).assertEqual(false);
    });

    /**
     * @tc.name   MapSetTest005
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_005
     * @tc.desc   Set null key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<null,string> = new Map();
      map.set(null, 'null value');
      expect(map.has(null)).assertEqual(true);
      expect(map.get(null)).assertEqual('null value');
    });

    /**
     * @tc.name   MapSetTest006
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_006
     * @tc.desc   Set undefined key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<undefined,string> = new Map();
      map.set(undefined, 'undefined value');
      expect(map.has(undefined)).assertEqual(true);
      expect(map.get(undefined)).assertEqual('undefined value');
    });

    /**
     * @tc.name   MapSetTest007
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_007
     * @tc.desc   Set object key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest007 = MapSetTest007();
      expect(setTest007.map.has(setTest007.obj)).assertEqual(true);
      expect(setTest007.map.get(setTest007.obj)).assertEqual('object value');
      expect(setTest007.map.has({ id: 1 })).assertEqual(false); // Different object instance
    });

    /**
     * @tc.name   MapSetTest008
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_008
     * @tc.desc   Set array key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map:Map<number[],string> = new Map();
      map.set(arr, 'array value');
      expect(map.has(arr)).assertEqual(true);
      expect(map.get(arr)).assertEqual('array value');
      expect(map.has([1, 2, 3])).assertEqual(false); // Different array instance
    });

    /**
     * @tc.name   MapSetTest009
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_009
     * @tc.desc   Set symbol key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest009 = MapSetTest009();
      expect(setTest009.map.has(setTest009.sym)).assertEqual(true);
      expect(setTest009.map.get(setTest009.sym)).assertEqual('symbol value');
    });

    /**
     * @tc.name   MapSetTest010
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_010
     * @tc.desc   Set function key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest010 = MapSetTest010();
      expect(setTest010.map.has(setTest010.func)).assertEqual(true);
      expect(setTest010.map.get(setTest010.func)).assertEqual('function value');
      expect(setTest010.map.has(() => {})).assertEqual(false); // Different function
    });

    /**
     * @tc.name   MapSetTest011
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_011
     * @tc.desc   Set date object key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const map:Map<Date,string> = new Map();
      map.set(date, 'date value');
      expect(map.has(date)).assertEqual(true);
      expect(map.get(date)).assertEqual('date value');
      expect(map.has(new Date())).assertEqual(false); // Different date instance
    });

    /**
     * @tc.name   MapSetTest012
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_012
     * @tc.desc   Set regexp key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex = /test/;
      const map:Map<RegExp,string> = new Map();
      map.set(regex, 'regex value');
      expect(map.has(regex)).assertEqual(true);
      expect(map.get(regex)).assertEqual('regex value');
      expect(map.has(/test/)).assertEqual(false); // Different regex instance
    });

    /**
     * @tc.name   MapSetTest013
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_013
     * @tc.desc   Set bigint key-value pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bigint = 123n;
      const map:Map<bigint,string> = new Map();
      map.set(bigint, 'bigint value');
      expect(map.has(bigint)).assertEqual(true);
      expect(map.get(bigint)).assertEqual('bigint value');
      // expect(map.has(123n)).assertEqual(false); // Different bigint instance
    });

    /**
     * @tc.name   MapSetTest014
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_014
     * @tc.desc   Set multiple key-value pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,number> = new Map();
      map.set('a', 1)
        .set('b', 2)
        .set('c', 3);
      expect(map.size).assertEqual(3);
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);
      expect(map.get('c')).assertEqual(3);
    });

    /**
     * @tc.name   MapSetTest015
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_015
     * @tc.desc   Set with same value for different keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,number> = new Map();
      map.set('x', 10)
        .set('y', 10)
        .set('z', 10);
      expect(map.get('x')).assertEqual(10);
      expect(map.get('y')).assertEqual(10);
      expect(map.get('z')).assertEqual(10);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.name   MapSetTest016
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_016
     * @tc.desc   Set with object as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let setTest016 = MapSetTest016();
      expect(setTest016.map.get('obj')).assertEqual(setTest016.valueObj);
      expect(setTest016.map.get('obj').name).assertEqual('Test');
    });

    /**
     * @tc.name   MapSetTest017
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_017
     * @tc.desc   Modifying object value after set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest017 = MapSetTest017();
      expect(setTest017.map.get('key').name).assertEqual('Modified');
    });

    /**
     * @tc.name   MapSetTest018
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_018
     * @tc.desc   Set with array as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const valueArr = [1, 2, 3];
      const map:Map<string,number[]> = new Map();
      map.set('arr', valueArr);
      expect(map.get('arr')).assertEqual(valueArr);
      expect(map.get('arr')![1]).assertEqual(2);
    });

    /**
     * @tc.name   MapSetTest019
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_019
     * @tc.desc   Modifying array value after set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const valueArr = [1, 2, 3];
      const map:Map<string,number[]> = new Map();
      map.set('key', valueArr);

      valueArr.push(4);
      expect(map.get('key')!.length).assertEqual(4);
      expect(map.get('key')![3]).assertEqual(4);
    });

    /**
     * @tc.name   MapSetTest020
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_020
     * @tc.desc   Set with function as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const func = () => 'hello';
      const map:Map<string,()=>string> = new Map();
      map.set('func', func);
      expect(map.get('func')).assertEqual(func);
      expect(map.get('func')!()).assertEqual('hello');
    });

    /**
     * @tc.name   MapSetTest021
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_021
     * @tc.desc   Set with map as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest021 = MapSetTest021();
      expect(setTest021.map.get('inner')).assertEqual(setTest021.innerMap);
      expect(setTest021.map.get('inner').get('a')).assertEqual(1);
    });

    /**
     * @tc.name   MapSetTest022
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_022
     * @tc.desc   Set with set as value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest022 = MapSetTest022();
      expect(setTest022.map.get('inner')).assertEqual(setTest022.innerSet);
      expect(setTest022.map.get('inner').has(2)).assertEqual(true);
    });

    /**
     * @tc.name   MapSetTest023
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_023
     * @tc.desc   Set returns the map instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,string> = new Map();
      const result = map.set('key', 'value');
      expect(result).assertEqual(map); // set() returns the map instance
    });

    /**
     * @tc.name   MapSetTest024
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_024
     * @tc.desc   Chaining set operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,number> = new Map();
      map.set('a', 1)
        .set('b', 2)
        .set('c', 3);
      expect(map.size).assertEqual(3);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   MapSetTest025
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_025
     * @tc.desc   Set with empty string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,string> = new Map();
      map.set('', 'empty string');
      expect(map.has('')).assertEqual(true);
      expect(map.get('')).assertEqual('empty string');
    });

    /**
     * @tc.name   MapSetTest026
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_026
     * @tc.desc   Set with numeric string vs number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<string|number,string|number> = new Map();
      map.set('123', 'string')
        .set(123, 'number');
      expect(map.size).assertEqual(2);
      expect(map.get('123')).assertEqual('string');
      expect(map.get(123)).assertEqual('number');
    });

    /**
     * @tc.name   MapSetTest027
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_027
     * @tc.desc   Set with negative number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<number,string> = new Map();
      map.set(-42, 'negative');
      expect(map.has(-42)).assertEqual(true);
      expect(map.get(-42)).assertEqual('negative');
      expect(map.has(42)).assertEqual(false);
    });

    /**
     * @tc.name   MapSetTest028
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_028
     * @tc.desc   Set with zero and negative zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number,string> = new Map();
      map.set(0, 'zero')
        .set(-0, 'negative zero');
      expect(map.size).assertEqual(1); // 0 and -0 are considered equal
      expect(map.get(0)).assertEqual('negative zero'); // Last set value remains
    });

    /**
     * @tc.name   MapSetTest029
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_029
     * @tc.desc   Set with NaN as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number,string> = new Map();
      map.set(NaN, 'not a number');
      expect(map.has(NaN)).assertEqual(true);
      expect(map.get(NaN)).assertEqual('not a number');
      expect(map.has(Number('invalid'))).assertEqual(true); // Number('invalid') is NaN
    });

    /**
     * @tc.name   MapSetTest030
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_030
     * @tc.desc   Set with Infinity as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number,string> = new Map();
      map.set(Infinity, 'infinite');
      expect(map.has(Infinity)).assertEqual(true);
      expect(map.get(Infinity)).assertEqual('infinite');
      expect(map.has(-Infinity)).assertEqual(false);
    });

    /**
     * @tc.name   MapSetTest031
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_031
     * @tc.desc   Set with -Infinity as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number,string> = new Map();
      map.set(-Infinity, 'negative infinite');
      expect(map.has(-Infinity)).assertEqual(true);
      expect(map.get(-Infinity)).assertEqual('negative infinite');
      expect(map.has(Infinity)).assertEqual(false);
    });

    /**
     * @tc.name   MapSetTest032
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_032
     * @tc.desc   Set with very large number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const largeNum = Number.MAX_SAFE_INTEGER;
      const map:Map<number,string> = new Map();
      map.set(largeNum, 'max safe integer');
      expect(map.has(largeNum)).assertEqual(true);
      expect(map.get(largeNum)).assertEqual('max safe integer');
    });

    /**
     * @tc.name   MapSetTest033
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_033
     * @tc.desc   Set with very small number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const smallNum = Number.MIN_SAFE_INTEGER;
      const map:Map<number,string> = new Map();
      map.set(smallNum, 'min safe integer');
      expect(map.has(smallNum)).assertEqual(true);
      expect(map.get(smallNum)).assertEqual('min safe integer');
    });

    /**
     * @tc.name   MapSetTest034
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_034
     * @tc.desc   Set with float number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<number,string> = new Map();
      map.set(3.14, 'pi');
      expect(map.has(3.14)).assertEqual(true);
      expect(map.get(3.14)).assertEqual('pi');
    });

    /**
     * @tc.name   MapSetTest035
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_035
     * @tc.desc   Set with string containing special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '!@#$%^&*()_+{}:"<>?`~';
      const map:Map<string,string> = new Map();
      map.set(key, 'special chars');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('special chars');
    });

    /**
     * @tc.name   MapSetTest036
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_036
     * @tc.desc   Set with multi-line string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = 'line1\nline2';
      const map:Map<string,string> = new Map();
      map.set(key, 'multi-line');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('multi-line');
    });

    /**
     * @tc.name   MapSetTest037
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_037
     * @tc.desc   Set with Unicode character key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '€'; // Unicode character
      const map:Map<string,string> = new Map();
      map.set(key, 'unicode');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('unicode');
    });

    /**
     * @tc.name   MapSetTest038
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_038
     * @tc.desc   Set with symbol from Symbol.for()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest038 = MapSetTest038();
      expect(setTest038.map.has(setTest038.sym)).assertEqual(true);
      expect(setTest038.map.get(setTest038.sym)).assertEqual('shared symbol');
    });

    /**
     * @tc.name   MapSetTest039
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_039
     * @tc.desc   Set with well-known symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest039 = MapSetTest039();
      expect(setTest039.map.has(Symbol.iterator)).assertEqual(true);
      expect(setTest039.map.get(Symbol.iterator)).assertEqual('iterator symbol');
    });

    /**
     * @tc.name   MapSetTest040
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_040
     * @tc.desc   Set with frozen object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest040 = MapSetTest040();
      expect(setTest040.map.has(setTest040.obj)).assertEqual(true);
      expect(setTest040.map.get(setTest040.obj)).assertEqual('frozen object');
    });

    /**
     * @tc.name   MapSetTest041
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_041
     * @tc.desc   Set with sealed object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest041 = MapSetTest041();
      expect(setTest041.map.has(setTest041.obj)).assertEqual(true);
      expect(setTest041.map.get(setTest041.obj)).assertEqual('sealed object');
    });

    /**
     * @tc.name   MapSetTest042
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_042
     * @tc.desc   Set with empty object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest042 = MapSetTest042();
      expect(setTest042.map.has(setTest042.obj)).assertEqual(true);
      expect(setTest042.map.get(setTest042.obj)).assertEqual('empty object');
    });

    /**
     * @tc.name   MapSetTest043
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_043
     * @tc.desc   Set with nested object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      interface InnerObj {
        b: number;
      }
      interface MyObj {
        a: InnerObj;
      }
      const obj: MyObj = {
        a: { b: 1 }
      };
      const map:Map<MyObj,string> = new Map();
      map.set(obj, 'nested object');
      expect(map.has(obj)).assertEqual(true);
      expect(map.get(obj)).assertEqual('nested object');
    });

    /**
     * @tc.name   MapSetTest044
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_044
     * @tc.desc   Modifying object key after set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      interface MyObject {
        prop: string; // 明确指定prop属性为string类型
      }
      const obj: MyObject = {
        prop: 'value' // 符合接口定义，类型匹配
      };
      const map:Map<MyObject,string> = new Map();
      map.set(obj, 'object value');
      obj.prop = 'modified'; // Modify the object used as key
      expect(map.has(obj)).assertEqual(true);
      expect(map.get(obj)).assertEqual('object value');
    });

    /**
     * @tc.name   MapSetTest045
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_045
     * @tc.desc   Set with array key then modify array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map:Map<number[],string> = new Map();
      map.set(arr, 'array value');
      arr.push(4); // Modify the array used as key
      expect(map.has(arr)).assertEqual(true);
      expect(map.get(arr)).assertEqual('array value');
    });

    /**
     * @tc.name   MapSetTest046
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_046
     * @tc.desc   Set with typed array as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const typedArr = new Uint8Array([1, 2, 3]);
      const map:Map<Uint8Array,string> = new Map();
      map.set(typedArr, 'typed array');
      expect(map.has(typedArr)).assertEqual(true);
      expect(map.get(typedArr)).assertEqual('typed array');
    });

    /**
     * @tc.name   MapSetTest047
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_047
     * @tc.desc   Set with Map instance as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyMap:Map<string,string> = new Map();
      const map:Map<Map<string,string>,string> = new Map();
      map.set(keyMap, 'map as key');
      expect(map.has(keyMap)).assertEqual(true);
      expect(map.get(keyMap)).assertEqual('map as key');
    });

    /**
     * @tc.name   MapSetTest048
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_048
     * @tc.desc   Set with Set instance as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keySet:Set<string> = new Set();
      const map:Map<Set<string>,string> = new Map();
      map.set(keySet, 'set as key');
      expect(map.has(keySet)).assertEqual(true);
      expect(map.get(keySet)).assertEqual('set as key');
    });

    /**
     * @tc.name   MapSetTest049
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_049
     * @tc.desc   Set with WeakMap instance as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyWeakMap: WeakMap<object, number> = new WeakMap();
      const map: Map<WeakMap<object, number>, string> = new Map();
      map.set(keyWeakMap, 'weakmap as key');
      expect(map.has(keyWeakMap)).assertEqual(true);
      expect(map.get(keyWeakMap)).assertEqual('weakmap as key');
    });

    /**
     * @tc.name   MapSetTest050
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_050
     * @tc.desc   Set with WeakSet instance as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyWeakSet:WeakSet<object> = new WeakSet();
      const map:Map<WeakSet<object>, string> = new Map();
      map.set(keyWeakSet, 'weakset as key');
      expect(map.has(keyWeakSet)).assertEqual(true);
      expect(map.get(keyWeakSet)).assertEqual('weakset as key');
    });

    /**
     * @tc.name   MapSetTest051
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_051
     * @tc.desc   Set with Promise as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promise = Promise.resolve('test');
      const map:Map<Promise<string>,string> = new Map();
      map.set(promise, 'promise as key');
      expect(map.has(promise)).assertEqual(true);
      expect(map.get(promise)).assertEqual('promise as key');
    });

    /**
     * @tc.name   MapSetTest052
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_052
     * @tc.desc   Set with Error object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const error = new Error('test');
      const map:Map<Error,string> = new Map();
      map.set(error, 'error as key');
      expect(map.has(error)).assertEqual(true);
      expect(map.get(error)).assertEqual('error as key');
    });

    /**
     * @tc.name   MapSetTest053
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_053
     * @tc.desc   Set with class as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestClass {}
      const map:Map<TestClass,string> = new Map();
      map.set(TestClass, 'class as key');
      expect(map.has(TestClass)).assertEqual(true);
      expect(map.get(TestClass)).assertEqual('class as key');
    });

    /**
     * @tc.name   MapSetTest054
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_054
     * @tc.desc   Set with class instance as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestClass {}
      const instance = new TestClass();
      const map:Map<TestClass,string> = new Map();
      map.set(instance, 'instance as key');
      expect(map.has(instance)).assertEqual(true);
      expect(map.get(instance)).assertEqual('instance as key');
    });

    /**
     * @tc.name   MapSetTest055
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_055
     * @tc.desc   Set with generator function as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest055 = MapSetTest055();
      expect(setTest055.map.has(setTest055.generator)).assertEqual(true);
      expect(setTest055.map.get(setTest055.generator)).assertEqual('generator as key');
    });

    /**
     * @tc.name   MapSetTest056
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_056
     * @tc.desc   Set with async function as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncFunc = async () => {};
      const map:Map<Function,string> = new Map();
      map.set(asyncFunc, 'async function as key');
      expect(map.has(asyncFunc)).assertEqual(true);
      expect(map.get(asyncFunc)).assertEqual('async function as key');
    });

    /**
     * @tc.name   MapSetTest057
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_057
     * @tc.desc   Set with arrow function as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arrowFunc = () => {};
      const map:Map<Function,string> = new Map();
      map.set(arrowFunc, 'arrow function as key');
      expect(map.has(arrowFunc)).assertEqual(true);
      expect(map.get(arrowFunc)).assertEqual('arrow function as key');
    });

    /**
     * @tc.name   MapSetTest058
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_058
     * @tc.desc   Set with bound function as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest058 = MapSetTest058();
      expect(setTest058.map.has(setTest058.boundFunc)).assertEqual(true);
      expect(setTest058.map.get(setTest058.boundFunc)).assertEqual('bound function as key');
    });

    /**
     * @tc.name   MapSetTest059
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_059
     * @tc.desc   Set with Proxy object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapSetTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let setTest059 = MapSetTest059();
      expect(setTest059.map.has(setTest059.proxy)).assertEqual(true);
      expect(setTest059.map.get(setTest059.proxy)).assertEqual('proxy as key');
    });

    /**
     * @tc.name   MapSetTest060
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_060
     * @tc.desc   Set with revoked proxy as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapSetTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let setTest060 = MapSetTest060();
      expect(setTest060.map.has(setTest060.proxy)).assertEqual(true);
      setTest060.revoke();
      // Revoked proxy can still be used as key
      expect(setTest060.map.has(setTest060.proxy)).assertEqual(true);
    });

    /**
     * @tc.name   MapSetTest061
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_061
     * @tc.desc   Set with ArrayBuffer as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(8);
      const map:Map<ArrayBuffer,string> = new Map();
      map.set(buffer, 'array buffer as key');
      expect(map.has(buffer)).assertEqual(true);
      expect(map.get(buffer)).assertEqual('array buffer as key');
    });

    /**
     * @tc.name   MapSetTest062
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_062
     * @tc.desc   Set with DataView as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const map:Map<DataView,string> = new Map();
      map.set(view, 'data view as key');
      expect(map.has(view)).assertEqual(true);
      expect(map.get(view)).assertEqual('data view as key');
    });

    /**
     * @tc.name   MapSetTest063
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_063
     * @tc.desc   Set with RegExp with flags as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex = /test/gi;
      const map:Map<RegExp,string> = new Map();
      map.set(regex, 'regex with flags');
      expect(map.has(regex)).assertEqual(true);
      expect(map.get(regex)).assertEqual('regex with flags');
      expect(map.has(/test/gi)).assertEqual(false); // Different instance
    });


    /**
     * @tc.name   MapSetTest065
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_065
     * @tc.desc   Set with Math object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<Math,string> = new Map();
      map.set(Math, 'math object');
      expect(map.has(Math)).assertEqual(true);
      expect(map.get(Math)).assertEqual('math object');
    });

    /**
     * @tc.name   MapSetTest066
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_066
     * @tc.desc   Set with JSON object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<JSON,string> = new Map();
      map.set(JSON, 'json object');
      expect(map.has(JSON)).assertEqual(true);
      expect(map.get(JSON)).assertEqual('json object');
    });

    /**
     * @tc.name   MapSetTest067
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_067
     * @tc.desc   Set with Reflect object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest067 = MapSetTest067();
      expect(setTest067.map.has(setTest067.Reflect)).assertEqual(true);
      expect(setTest067.map.get(setTest067.Reflect)).assertEqual('reflect object');
    });

    /**
     * @tc.name   MapSetTest068
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_068
     * @tc.desc   Set with empty map and add entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,number> = new Map();
      expect(map.size).assertEqual(0);

      map.set('a', 1);
      map.set('b', 2);

      expect(map.size).assertEqual(2);
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.name   MapSetTest069
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_069
     * @tc.desc   Set after delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([['key', 'value']]);
      map.delete('key');
      expect(map.has('key')).assertEqual(false);

      map.set('key', 'new value');
      expect(map.has('key')).assertEqual(true);
      expect(map.get('key')).assertEqual('new value');
    });

    /**
     * @tc.name   MapSetTest070
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_070
     * @tc.desc   Set after clear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([['a', 1], ['b', 2]]);
      map.clear();
      expect(map.size).assertEqual(0);
      map.set('c', 3);
      expect(map.size).assertEqual(1);
      expect(map.get('c')).assertEqual(3);
    });

    /**
     * @tc.name   MapSetTest071
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_071
     * @tc.desc   Set with same key multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapSetTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,string> = new Map();
      map.set('key', 'first');
      map.set('key', 'second');
      map.set('key', 'third');

      expect(map.size).assertEqual(1);
      expect(map.get('key')).assertEqual('third'); // Last value remains
    });

    /**
     * @tc.name   MapSetTest072
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_072
     * @tc.desc   Set with key that is a map entry
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const entry = ['key', 'value'];
      const map:Map<string[],string> = new Map();
      map.set(entry, 'entry as key');
      expect(map.has(entry)).assertEqual(true);
      expect(map.get(entry)).assertEqual('entry as key');
    });

    /**
     * @tc.name   MapSetTest073
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_073
     * @tc.desc   Set with key that is a Map iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const innerMap = new Map([['a', 1]]);
      const iterator = innerMap.entries();
      const map:Map< IterableIterator<[string, number]>,string> = new Map();
      map.set(iterator, 'iterator as key');
      expect(map.has(iterator)).assertEqual(true);
      expect(map.get(iterator)).assertEqual('iterator as key');
    });

    /**
     * @tc.name   MapSetTest074
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_074
     * @tc.desc   Set with large number of entries
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('MapSetTest074', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const map:Map<string,number> = new Map();
      const count = 10000;
      for (let i = 0; i < count; i++) {
        map.set(`key-${i}`, i);
      }
      expect(map.size).assertEqual(count);
    });

    /**
     * @tc.name   MapSetTest075
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_075
     * @tc.desc   Performance test: set with string keys
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('MapSetTest075', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, async () => {
      const map:Map<string,number> = new Map();
      const count = 1000;
      const start = Date.now();
      for (let i = 0; i < count; i++) {
        map.set(`perf-key-${i}`, i);
      }
      const end = Date.now();
      const duration = end - start;

      expect(map.size).assertEqual(count);
      expect(duration).assertLess(10000);
    });

    /**
     * @tc.name   MapSetTest076
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_076
     * @tc.desc   Performance test: set with object keys
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('MapSetTest076', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, async () => {
      interface IdentifiedObject {
        id: number;
      }
      const map:Map<IdentifiedObject, number>  = new Map();
      const count = 500;
      const objects:IdentifiedObject[] = [];
      // Create objects first
      for (let i = 0; i < count; i++) {
        objects.push({ id: i });
      }
      const start = Date.now();

      for (let i = 0; i < count; i++) {
        map.set(objects[i], i);
      }

      const end = Date.now();
      const duration = end - start;

      expect(map.size).assertEqual(count);
      expect(duration).assertLess(300); // Should complete in under 300ms
    });

    /**
     * @tc.name   MapSetTest077
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_077
     * @tc.desc   Set with key that is a number converted to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number|string,string> = new Map();
      map.set(123, 'number')
        .set('123', 'string');

      expect(map.size).assertEqual(2);
      expect(map.get(123)).assertEqual('number');
      expect(map.get('123')).assertEqual('string');
    });

    /**
     * @tc.name   MapSetTest078
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_078
     * @tc.desc   Set with boolean true and number 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<boolean|number,string> = new Map();
      map.set(true, 'boolean')
        .set(1, 'number');

      expect(map.size).assertEqual(2);
      expect(map.get(true)).assertEqual('boolean');
      expect(map.get(1)).assertEqual('number');
    });

    /**
     * @tc.name   MapSetTest079
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_079
     * @tc.desc   Set with boolean false and number 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<boolean|number,string> = new Map();
      map.set(false, 'boolean')
        .set(0, 'number');

      expect(map.size).assertEqual(2);
      expect(map.get(false)).assertEqual('boolean');
      expect(map.get(0)).assertEqual('number');
    });

    /**
     * @tc.name   MapSetTest080
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_080
     * @tc.desc   Set with key that is a string with different cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<string,string> = new Map();
      map.set('Key', 'capitalized')
        .set('key', 'lowercase');

      expect(map.size).assertEqual(2);
      expect(map.get('Key')).assertEqual('capitalized');
      expect(map.get('key')).assertEqual('lowercase');
    });

    /**
     * @tc.name   MapSetTest081
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_081
     * @tc.desc   Set with key that is a string with whitespace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<string,string> = new Map();
      map.set('key', 'no space')
        .set(' key ', 'with spaces');

      expect(map.size).assertEqual(2);
      expect(map.get('key')).assertEqual('no space');
      expect(map.get(' key ')).assertEqual('with spaces');
    });

    /**
     * @tc.name   MapSetTest082
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_082
     * @tc.desc   Set with key that is a symbol and a string with same description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest082 = MapSetTest082();
      expect(setTest082.map.size).assertEqual(2);
      expect(setTest082.map.get(setTest082.sym)).assertEqual('symbol');
      expect(setTest082.map.get('description')).assertEqual('string');
    });

    /**
     * @tc.name   MapSetTest083
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_083
     * @tc.desc   Set with key that is a BigInt and a Number with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<bigint|number,string> = new Map();
      map.set(42n, 'bigint')
        .set(42, 'number');

      expect(map.size).assertEqual(2);
      expect(map.get(42n)).assertEqual('bigint');
      expect(map.get(42)).assertEqual('number');
    });

    /**
     * @tc.name   MapSetTest084
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_084
     * @tc.desc   Set with key that is a Date and a string representation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const dateStr = date.toString();
      const map:Map<Date|string,string> = new Map();
      map.set(date, 'date object')
        .set(dateStr, 'date string');

      expect(map.size).assertEqual(2);
      expect(map.get(date)).assertEqual('date object');
      expect(map.get(dateStr)).assertEqual('date string');
    });

    /**
     * @tc.name   MapSetTest085
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_085
     * @tc.desc   Set with key that is a RegExp and its source string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex = /test/;
      const map:Map<RegExp|string,string> = new Map();
      map.set(regex, 'regex object')
        .set(regex.source, 'regex source');

      expect(map.size).assertEqual(2);
      expect(map.get(regex)).assertEqual('regex object');
      expect(map.get(regex.source)).assertEqual('regex source');
    });

    /**
     * @tc.name   MapSetTest086
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_086
     * @tc.desc   Set with key that is an array and a similar string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map:Map<number[]|string,string> = new Map();
      map.set(arr, 'array')
        .set('1,2,3', 'string');

      expect(map.size).assertEqual(2);
      expect(map.get(arr)).assertEqual('array');
      expect(map.get('1,2,3')).assertEqual('string');
    });

    /**
     * @tc.name   MapSetTest087
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_087
     * @tc.desc   Set with null prototype object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest087 = MapSetTest087();
      expect(setTest087.map.has(setTest087.obj)).assertEqual(true);
      expect(setTest087.map.get(setTest087.obj)).assertEqual('null prototype');
    });

    /**
     * @tc.name   MapSetTest088
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_088
     * @tc.desc   Set with object and its prototype as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest088 = MapSetTest088();
      expect(setTest088.map.size).assertEqual(2);
      expect(setTest088.map.get(setTest088.proto)).assertEqual('prototype');
      expect(setTest088.map.get(setTest088.obj)).assertEqual('instance');
    });

    /**
     * @tc.name   MapSetTest089
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_089
     * @tc.desc   Set with function and its name as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const myFunc = () => {};
      const map:Map<Function|string,string> = new Map();
      map.set(myFunc, 'function object')
        .set(myFunc.name, 'function name');

      expect(map.size).assertEqual(2);
      expect(map.get(myFunc)).assertEqual('function object');
      expect(map.get(myFunc.name)).assertEqual('function name');
    });

    /**
     * @tc.name   MapSetTest090
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_090
     * @tc.desc   Set with class and its name as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class MyClass {}
      const map:Map<MyClass,string> = new Map();
      map.set(MyClass, 'class object')
        .set(MyClass.name, 'class name');

      expect(map.size).assertEqual(2);
      expect(map.get(MyClass)).assertEqual('class object');
      expect(map.get(MyClass.name)).assertEqual('class name');
    });

    /**
     * @tc.name   MapSetTest091
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_091
     * @tc.desc   Set with undefined and string 'undefined'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<undefined|string,string> = new Map();
      map.set(undefined, 'undefined value')
        .set('undefined', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(undefined)).assertEqual('undefined value');
      expect(map.get('undefined')).assertEqual('string value');
    });

    /**
     * @tc.name   MapSetTest092
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_092
     * @tc.desc   Set with null and string 'null'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<null|string,string> = new Map();
      map.set(null, 'null value')
        .set('null', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(null)).assertEqual('null value');
      expect(map.get('null')).assertEqual('string value');
    });

    /**
     * @tc.name   MapSetTest093
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_093
     * @tc.desc   Set with NaN and string 'NaN'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number|string,string> = new Map();
      map.set(NaN, 'nan value')
        .set('NaN', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(NaN)).assertEqual('nan value');
      expect(map.get('NaN')).assertEqual('string value');
    });

    /**
     * @tc.name   MapSetTest094
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_094
     * @tc.desc   Set with Infinity and string 'Infinity'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number|string,string> = new Map();
      map.set(Infinity, 'infinity value')
        .set('Infinity', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(Infinity)).assertEqual('infinity value');
      expect(map.get('Infinity')).assertEqual('string value');
    });

    /**
     * @tc.name   MapSetTest095
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_095
     * @tc.desc   Set with key that is a proxy and its target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapSetTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let setTest095 = MapSetTest095();
      expect(setTest095.map.size).assertEqual(2);
      expect(setTest095.map.get(setTest095.proxy)).assertEqual('proxy');
      expect(setTest095.map.get(setTest095.target)).assertEqual('target');
    });

    /**
     * @tc.name   MapSetTest096
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_096
     * @tc.desc   Set with key that is a generator object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest096 = MapSetTest096();
      expect(setTest096.map.has(setTest096.genObj)).assertEqual(true);
      expect(setTest096.map.get(setTest096.genObj)).assertEqual('generator object');
    });

    /**
     * @tc.name   MapSetTest097
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_097
     * @tc.desc   Set with key that is an async generator object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapSetTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let setTest097 = MapSetTest097();
      expect(setTest097.map.has(setTest097.asyncGenObj)).assertEqual(true);
      expect(setTest097.map.get(setTest097.asyncGenObj)).assertEqual('async generator object');
    });

  })
}