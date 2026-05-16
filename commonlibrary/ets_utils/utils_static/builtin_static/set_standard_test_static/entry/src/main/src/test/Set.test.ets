
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
interface IdentifiedObject {
  id: number;
}

interface InnerObj {
  b: number;
}
interface MyObj {
  a: InnerObj;
}

interface MyObject {
  prop: string;
}

class TestClass {

}

class MyClass {
  name : string;
  constructor(name: string) {
    this.name = name;
  }
}


export default function SetSetTest() {
  describe('SetSetTest', () => {
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
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_001
     * @tc.name MapSetTest001
     * @tc.desc Basic functionality: set string key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,string> = new Map<string,string>();
      map.set('name', 'Alice');
      expect(map.has('name')).assertEqual(true);
      expect(map.get('name')).assertEqual('Alice');
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_002
     * @tc.name MapSetTest002
     * @tc.desc Overwrite existing key with new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<string,int>([['age', 20]]);
      map.set('age', 21);
      expect(map.get('age')).assertEqual(21);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_003
     * @tc.name MapSetTest003
     * @tc.desc Set number key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<number,string> = new Map<number,string>();
      map.set(42, 'answer');
      expect(map.has(42)).assertEqual(true);
      expect(map.get(42)).assertEqual('answer');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_004
     * @tc.name MapSetTest004
     * @tc.desc Set boolean key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<boolean,string> = new Map<boolean,string>();
      map.set(true, 'active');
      expect(map.has(true)).assertEqual(true);
      expect(map.get(true)).assertEqual('active');
      expect(map.has(false)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_005
     * @tc.name MapSetTest005
     * @tc.desc Set null key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<null,string> = new Map<null,string>();
      map.set(null, 'null value');
      expect(map.has(null)).assertEqual(true);
      expect(map.get(null)).assertEqual('null value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_006
     * @tc.name MapSetTest006
     * @tc.desc Set undefined key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<undefined,string> = new Map<undefined,string>();
      map.set(undefined, 'undefined value');
      expect(map.has(undefined)).assertEqual(true);
      expect(map.get(undefined)).assertEqual('undefined value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_008
     * @tc.name MapSetTest008
     * @tc.desc Set array key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map:Map<int[],string> = new Map<int[],string>();
      map.set(arr, 'array value');
      expect(map.has(arr)).assertEqual(true);
      expect(map.get(arr)).assertEqual('array value');
      expect(map.has([1, 2, 3])).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_011
     * @tc.name MapSetTest011
     * @tc.desc Set date object key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const map:Map<Date,string> = new Map<Date,string>();
      map.set(date, 'date value');
      expect(map.has(date)).assertEqual(true);
      expect(map.get(date)).assertEqual('date value');
      expect(map.has(new Date())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_012
     * @tc.name MapSetTest012
     * @tc.desc Set regexp key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex  = new RegExp('test');
      const regex2  = new RegExp('test');
      const map:Map<RegExp,string> = new Map<RegExp,string>();
      map.set(regex, 'regex value');
      expect(map.has(regex)).assertEqual(true);
      expect(map.get(regex)).assertEqual('regex value');
      expect(map.has(regex2)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_013
     * @tc.name MapSetTest013
     * @tc.desc Set bigint key-value pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bigintKey = 123n;
      const map:Map<BigInt,string> = new Map<BigInt,string>();
      map.set(bigintKey, 'bigint value');
      expect(map.has(bigintKey)).assertEqual(true);
      expect(map.get(bigintKey)).assertEqual('bigint value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_014
     * @tc.name MapSetTest014
     * @tc.desc Set multiple key-value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,number> = new Map<string,number>();
      map.set('a', 1)
        .set('b', 2)
        .set('c', 3);
      expect(map.size).assertEqual(3);
      expect(map.get('a')).assertEqual(1);
      expect(map.get('b')).assertEqual(2);
      expect(map.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_015
     * @tc.name MapSetTest015
     * @tc.desc Set with same value for different keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,number> = new Map<string,number>();
      map.set('x', 10)
        .set('y', 10)
        .set('z', 10);
      expect(map.get('x')).assertEqual(10);
      expect(map.get('y')).assertEqual(10);
      expect(map.get('z')).assertEqual(10);
      expect(map.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_018
     * @tc.name MapSetTest018
     * @tc.desc Set with array as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const valueArr = [1, 2, 3];
      const map:Map<string,int[]> = new Map<string,int[]>();
      map.set('arr', valueArr);
      expect(map.get('arr')).assertEqual(valueArr);
      expect(map.get('arr')![1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_019
     * @tc.name MapSetTest019
     * @tc.desc Modifying array value after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const valueArr = [1, 2, 3];
      const map:Map<string,int[]> = new Map<string,int[]>();
      map.set('key', valueArr);

      valueArr.push(4);
      expect(map.get('key')!.length).assertEqual(4);
      expect(map.get('key')![3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_020
     * @tc.name MapSetTest020
     * @tc.desc Set with function as value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const func = () => 'hello';
      const map:Map<string,()=>string> = new Map<string,()=>string>();
      map.set('func', func);
      expect(map.get('func')).assertEqual(func);
      expect(map.get('func')!()).assertEqual('hello');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_023
     * @tc.name MapSetTest023
     * @tc.desc Set returns the map instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,string> = new Map<string,string>();
      const result = map.set('key', 'value');
      expect(result).assertEqual(map);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_024
     * @tc.name MapSetTest024
     * @tc.desc Chaining set operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,number> = new Map<string,number>();
      map.set('a', 1)
        .set('b', 2)
        .set('c', 3);
      expect(map.size).assertEqual(3);
      expect(map.get('b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_025
     * @tc.name MapSetTest025
     * @tc.desc Set with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,string> = new Map<string,string>();
      map.set('', 'empty string');
      expect(map.has('')).assertEqual(true);
      expect(map.get('')).assertEqual('empty string');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_026
     * @tc.name MapSetTest026
     * @tc.desc Set with numeric string vs number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<string|number,string|number> = new Map<string|number,string|number>();
      map.set('123', 'string')
        .set(123, 'number');
      expect(map.size).assertEqual(2);
      expect(map.get('123')).assertEqual('string');
      expect(map.get(123)).assertEqual('number');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_027
     * @tc.name MapSetTest027
     * @tc.desc Set with negative number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<number,string> = new Map<number,string>();
      map.set(-42, 'negative');
      expect(map.has(-42)).assertEqual(true);
      expect(map.get(-42)).assertEqual('negative');
      expect(map.has(42)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_028
     * @tc.name MapSetTest028
     * @tc.desc Set with zero and negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number,string> = new Map<number,string>();
      map.set(0, 'zero')
        .set(-0, 'negative zero');
      expect(map.size).assertEqual(1);
      expect(map.get(0)).assertEqual('negative zero');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_029
     * @tc.name MapSetTest029
     * @tc.desc Set with NaN as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number,string> = new Map<number,string>();
      map.set(NaN, 'not a number');
      expect(map.has(NaN)).assertEqual(true);
      expect(map.get(NaN)).assertEqual('not a number');
      expect(map.has(Number('invalid'))).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_030
     * @tc.name MapSetTest030
     * @tc.desc Set with Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number,string> = new Map<number,string>();
      map.set(Infinity, 'infinite');
      expect(map.has(Infinity)).assertEqual(true);
      expect(map.get(Infinity)).assertEqual('infinite');
      expect(map.has(-Infinity)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_031
     * @tc.name MapSetTest031
     * @tc.desc Set with -Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number,string> = new Map<number,string>();
      map.set(-Infinity, 'negative infinite');
      expect(map.has(-Infinity)).assertEqual(true);
      expect(map.get(-Infinity)).assertEqual('negative infinite');
      expect(map.has(Infinity)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_032
     * @tc.name MapSetTest032
     * @tc.desc Set with very large number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const largeNum = Number.MAX_SAFE_INTEGER;
      const map:Map<number,string> = new Map<number,string>();
      map.set(largeNum, 'max safe integer');
      expect(map.has(largeNum)).assertEqual(true);
      expect(map.get(largeNum)).assertEqual('max safe integer');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_033
     * @tc.name MapSetTest033
     * @tc.desc Set with very small number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const smallNum = Number.MIN_SAFE_INTEGER;
      const map:Map<number,string> = new Map<number,string>();
      map.set(smallNum, 'min safe integer');
      expect(map.has(smallNum)).assertEqual(true);
      expect(map.get(smallNum)).assertEqual('min safe integer');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_034
     * @tc.name MapSetTest034
     * @tc.desc Set with float number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<number,string> = new Map<number,string>();
      map.set(3.14, 'pi');
      expect(map.has(3.14)).assertEqual(true);
      expect(map.get(3.14)).assertEqual('pi');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_035
     * @tc.name MapSetTest035
     * @tc.desc Set with string containing special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '!@#$%^&*()_+{}:"<>?`~';
      const map:Map<string,string> = new Map<string,string>();
      map.set(key, 'special chars');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('special chars');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_036
     * @tc.name MapSetTest036
     * @tc.desc Set with multi-line string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = 'line1\nline2';
      const map:Map<string,string> = new Map<string,string>();
      map.set(key, 'multi-line');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('multi-line');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_037
     * @tc.name MapSetTest037
     * @tc.desc Set with Unicode character key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '€';
      const map:Map<string,string> = new Map<string,string>();
      map.set(key, 'unicode');
      expect(map.has(key)).assertEqual(true);
      expect(map.get(key)).assertEqual('unicode');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_043
     * @tc.name MapSetTest043
     * @tc.desc Set with nested object as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const obj: MyObj = {
        a: { b: 1 }
      };
      const map:Map<MyObj,string> = new Map<MyObj,string>();
      map.set(obj, 'nested object');
      expect(map.has(obj)).assertEqual(true);
      expect(map.get(obj)).assertEqual('nested object');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_044
     * @tc.name MapSetTest044
     * @tc.desc Modifying object key after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const obj: MyObject = {
        prop: 'value'
      };
      const map:Map<MyObject,string> = new Map<MyObject,string>();
      map.set(obj, 'object value');
      obj.prop = 'modified';
      expect(map.has(obj)).assertEqual(true);
      expect(map.get(obj)).assertEqual('object value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_045
     * @tc.name MapSetTest045
     * @tc.desc Set with array key then modify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map:Map<int[],string> = new Map<int[],string>();
      map.set(arr, 'array value');
      arr.push(4);
      expect(map.has(arr)).assertEqual(true);
      expect(map.get(arr)).assertEqual('array value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_046
     * @tc.name MapSetTest046
     * @tc.desc Set with typed array as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const typedArr = new Uint8Array([1, 2, 3]);
      const map:Map<Uint8Array,string> = new Map<Uint8Array,string>();
      map.set(typedArr, 'typed array');
      expect(map.has(typedArr)).assertEqual(true);
      expect(map.get(typedArr)).assertEqual('typed array');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_047
     * @tc.name MapSetTest047
     * @tc.desc Set with Map instance as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyMap:Map<string,string> = new Map<string,string>();
      const map:Map<Map<string,string>,string> = new Map<Map<string,string>,string>();
      map.set(keyMap, 'map as key');
      expect(map.has(keyMap)).assertEqual(true);
      expect(map.get(keyMap)).assertEqual('map as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_048
     * @tc.name MapSetTest048
     * @tc.desc Set with Set instance as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keySet:Set<string> = new Set<string>();
      const map:Map<Set<string>,string> = new Map<Set<string>,string>();
      map.set(keySet, 'set as key');
      expect(map.has(keySet)).assertEqual(true);
      expect(map.get(keySet)).assertEqual('set as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_049
     * @tc.name MapSetTest049
     * @tc.desc Set with WeakMap instance as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyWeakMap: WeakMap<object, number> = new WeakMap<object, number>();
      const map: Map<WeakMap<object, number>, string> = new Map<WeakMap<object, number>, string>();
      map.set(keyWeakMap, 'weakmap as key');
      expect(map.has(keyWeakMap)).assertEqual(true);
      expect(map.get(keyWeakMap)).assertEqual('weakmap as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_050
     * @tc.name MapSetTest050
     * @tc.desc Set with WeakSet instance as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyWeakSet:WeakSet<object> = new WeakSet<object>();
      const map:Map<WeakSet<object>, string> = new Map<WeakSet<object>, string>();
      map.set(keyWeakSet, 'weakset as key');
      expect(map.has(keyWeakSet)).assertEqual(true);
      expect(map.get(keyWeakSet)).assertEqual('weakset as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_051
     * @tc.name MapSetTest051
     * @tc.desc Set with Promise as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const promise : Promise<string> = Promise.resolve('test');
      const map:Map<Promise<string>,string> = new Map<Promise<string>,string>();
      map.set(promise, 'promise as key');
      expect(map.has(promise)).assertEqual(true);
      expect(map.get(promise)).assertEqual('promise as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_052
     * @tc.name MapSetTest052
     * @tc.desc Set with Error object as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const error = new Error('test');
      const map:Map<Error,string> = new Map<Error,string>();
      map.set(error, 'error as key');
      expect(map.has(error)).assertEqual(true);
      expect(map.get(error)).assertEqual('error as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_053
     * @tc.name MapSetTest053
     * @tc.desc Set with class as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const  instance  =  new TestClass();
      const map:Map<TestClass,string> = new Map<TestClass,string>();
      map.set(instance, 'class as key');
      expect(map.has(instance)).assertEqual(true);
      expect(map.get(instance)).assertEqual('class as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_054
     * @tc.name MapSetTest054
     * @tc.desc Set with class instance as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const instance = new TestClass();
      const map:Map<TestClass,string> = new Map<TestClass,string>();
      map.set(instance, 'instance as key');
      expect(map.has(instance)).assertEqual(true);
      expect(map.get(instance)).assertEqual('instance as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_056
     * @tc.name MapSetTest056
     * @tc.desc Set with async function as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncFunc = async () => {};
      const map:Map<Function,string> = new Map<Function,string>();
      map.set(asyncFunc, 'async function as key');
      expect(map.has(asyncFunc)).assertEqual(true);
      expect(map.get(asyncFunc)).assertEqual('async function as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_057
     * @tc.name MapSetTest057
     * @tc.desc Set with arrow function as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arrowFunc = () => {};
      const map:Map<Function,string> = new Map<Function,string>();
      map.set(arrowFunc, 'arrow function as key');
      expect(map.has(arrowFunc)).assertEqual(true);
      expect(map.get(arrowFunc)).assertEqual('arrow function as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_061
     * @tc.name MapSetTest061
     * @tc.desc Set with ArrayBuffer as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(8);
      const map:Map<ArrayBuffer,string> = new Map<ArrayBuffer,string>();
      map.set(buffer, 'array buffer as key');
      expect(map.has(buffer)).assertEqual(true);
      expect(map.get(buffer)).assertEqual('array buffer as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_062
     * @tc.name MapSetTest062
     * @tc.desc Set with DataView as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const map:Map<DataView,string> = new Map<DataView,string>();
      map.set(view, 'data view as key');
      expect(map.has(view)).assertEqual(true);
      expect(map.get(view)).assertEqual('data view as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_063
     * @tc.name MapSetTest063
     * @tc.desc Set with RegExp with flags as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex  = new RegExp('test','gi');
      const regex1 = new RegExp('test','gi');
      const map:Map<RegExp,string> = new Map<RegExp,string>();
      map.set(regex, 'regex with flags');
      expect(map.has(regex)).assertEqual(true);
      expect(map.get(regex)).assertEqual('regex with flags');
      expect(map.has(regex1)).assertEqual(false);
    });


    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_065
     * @tc.name MapSetTest065
     * @tc.desc Set with Math object as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<Math,string> = new Map<Math,string>();
      let a = new Math;
      map.set(a, 'math object');
      expect(map.has(a)).assertEqual(true);
      expect(map.get(a)).assertEqual('math object');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_066
     * @tc.name MapSetTest066
     * @tc.desc Set with JSON object as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<JSON,string> = new Map<JSON,string>();
      let a = new JSON;
      map.set(a, 'json object');
      expect(map.has(a)).assertEqual(true);
      expect(map.get(a)).assertEqual('json object');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_068
     * @tc.name MapSetTest068
     * @tc.desc Set with empty map and add entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,number> = new Map<string,number>();
      expect(map.size).assertEqual(0);

      map.set('a', 1);
      map.set('b', 2);

      expect(map.size).assertEqual(2);
      expect(map.get('a')).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_069
     * @tc.name MapSetTest069
     * @tc.desc Set after delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<String,String>([['key', 'value']]);
      map.delete('key');
      expect(map.has('key')).assertEqual(false);

      map.set('key', 'new value');
      expect(map.has('key')).assertEqual(true);
      expect(map.get('key')).assertEqual('new value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_070
     * @tc.name MapSetTest070
     * @tc.desc Set after clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<String,int>([['a', 1], ['b', 2]]);
      map.clear();
      expect(map.size).assertEqual(0);
      map.set('c', 3);
      expect(map.size).assertEqual(1);
      expect(map.get('c')).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_071
     * @tc.name MapSetTest071
     * @tc.desc Set with same key multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapSetTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map:Map<string,string> = new Map<string,string>();
      map.set('key', 'first');
      map.set('key', 'second');
      map.set('key', 'third');

      expect(map.size).assertEqual(1);
      expect(map.get('key')).assertEqual('third');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_072
     * @tc.name MapSetTest072
     * @tc.desc Set with key that is a map entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const entry = ['key', 'value'];
      const map:Map<string[],string> = new Map<string[],string>();
      map.set(entry, 'entry as key');
      expect(map.has(entry)).assertEqual(true);
      expect(map.get(entry)).assertEqual('entry as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_073
     * @tc.name MapSetTest073
     * @tc.desc Set with key that is a Map iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const innerMap = new Map<String,number>([['a', 1]]);
      const iterator = innerMap.entries();
      const map:Map<IterableIterator<[string, number]>,string> = new Map<IterableIterator<[string, number]>,string>();
      map.set(iterator, 'iterator as key');
      expect(map.has(iterator)).assertEqual(true);
      expect(map.get(iterator)).assertEqual('iterator as key');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_074
     * @tc.name MapSetTest074
     * @tc.desc Set with large number of entries
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapSetTest074', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const map:Map<string,number> = new Map<string,number>();
      const count = 10000;
      for (let i = 0; i < count; i++) {
        map.set(`key-${i}`, i);
      }
      expect(map.size).assertEqual(count);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_075
     * @tc.name MapSetTest075
     * @tc.desc Performance test: set with string keys
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('MapSetTest075', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, async () => {
      const map:Map<string,number> = new Map<string,number>();
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
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_077
     * @tc.name MapSetTest077
     * @tc.desc Set with key that is a number converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number|string,string> = new Map<number|string,string>();
      map.set(123, 'number')
        .set('123', 'string');

      expect(map.size).assertEqual(2);
      expect(map.get(123)).assertEqual('number');
      expect(map.get('123')).assertEqual('string');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_078
     * @tc.name MapSetTest078
     * @tc.desc Set with boolean true and number 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<boolean|number,string> = new Map<boolean|number,string>();
      map.set(true, 'boolean')
        .set(1, 'number');

      expect(map.size).assertEqual(2);
      expect(map.get(true)).assertEqual('boolean');
      expect(map.get(1)).assertEqual('number');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_079
     * @tc.name MapSetTest079
     * @tc.desc Set with boolean false and number 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<boolean|number,string> = new Map<boolean|number,string>();
      map.set(false, 'boolean')
        .set(0, 'number');

      expect(map.size).assertEqual(2);
      expect(map.get(false)).assertEqual('boolean');
      expect(map.get(0)).assertEqual('number');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_080
     * @tc.name MapSetTest080
     * @tc.desc Set with key that is a string with different cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<string,string> = new Map<string,string>();
      map.set('Key', 'capitalized')
        .set('key', 'lowercase');

      expect(map.size).assertEqual(2);
      expect(map.get('Key')).assertEqual('capitalized');
      expect(map.get('key')).assertEqual('lowercase');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_081
     * @tc.name MapSetTest081
     * @tc.desc Set with key that is a string with whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<string,string> = new Map<string,string>();
      map.set('key', 'no space')
        .set(' key ', 'with spaces');

      expect(map.size).assertEqual(2);
      expect(map.get('key')).assertEqual('no space');
      expect(map.get(' key ')).assertEqual('with spaces');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_083
     * @tc.name MapSetTest083
     * @tc.desc Set with key that is a BigInt and a Number with same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<bigint|number,string> = new Map<bigint|number,string>();
      map.set(42n, 'bigint')
        .set(42, 'number');

      expect(map.size).assertEqual(2);
      expect(map.get(42n)).assertEqual('bigint');
      expect(map.get(42)).assertEqual('number');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_084
     * @tc.name MapSetTest084
     * @tc.desc Set with key that is a Date and a string representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const dateStr = date.toString();
      const map:Map<Date|string,string> = new Map<Date|string,string>();
      map.set(date, 'date object')
        .set(dateStr, 'date string');

      expect(map.size).assertEqual(2);
      expect(map.get(date)).assertEqual('date object');
      expect(map.get(dateStr)).assertEqual('date string');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_085
     * @tc.name MapSetTest085
     * @tc.desc Set with key that is a RegExp and its source string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex = new RegExp('test');
      const map:Map<RegExp|string,string> = new Map<RegExp|string,string>();
      map.set(regex, 'regex object')
        .set(regex.source, 'regex source');

      expect(map.size).assertEqual(2);
      expect(map.get(regex)).assertEqual('regex object');
      expect(map.get(regex.source)).assertEqual('regex source');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_086
     * @tc.name MapSetTest086
     * @tc.desc Set with key that is an array and a similar string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map:Map<int[]|string,string> = new Map<int[]|string,string>();
      map.set(arr, 'array')
        .set('1,2,3', 'string');

      expect(map.size).assertEqual(2);
      expect(map.get(arr)).assertEqual('array');
      expect(map.get('1,2,3')).assertEqual('string');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_089
     * @tc.name MapSetTest089
     * @tc.desc Set with function and its name as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const myFunc = () => {};
      const map:Map<Function|string,string> = new Map<Function|string,string>();
      map.set(myFunc, 'function object')
        .set(myFunc.name, 'function name');

      expect(map.size).assertEqual(2);
      expect(map.get(myFunc)).assertEqual('function object');
      expect(map.get(myFunc.name)).assertEqual('function name');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_090
     * @tc.name MapSetTest090
     * @tc.desc Set with class and its name as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const myClass = new MyClass('');
      const map: Map<MyClass | string, string> = new Map<MyClass | string, string>();
      map.set(myClass as MyClass, 'class object')
        .set(myClass.name , 'class name');

      expect(map.size).assertEqual(2);
      expect(map.get(myClass)).assertEqual('class object');
      expect(map.get(myClass.name)).assertEqual('class name');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_091
     * @tc.name MapSetTest091
     * @tc.desc Set with undefined and string 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<undefined|string,string> = new Map<undefined|string,string>();
      map.set(undefined, 'undefined value')
        .set('undefined', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(undefined)).assertEqual('undefined value');
      expect(map.get('undefined')).assertEqual('string value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_092
     * @tc.name MapSetTest092
     * @tc.desc Set with null and string 'null'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<null|string,string> = new Map<null|string,string>();
      map.set(null, 'null value')
        .set('null', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(null)).assertEqual('null value');
      expect(map.get('null')).assertEqual('string value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_093
     * @tc.name MapSetTest093
     * @tc.desc Set with NaN and string 'NaN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number|string,string> = new Map<number|string,string>();
      map.set(NaN, 'nan value')
        .set('NaN', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(NaN)).assertEqual('nan value');
      expect(map.get('NaN')).assertEqual('string value');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_SET_TEST_094
     * @tc.name MapSetTest094
     * @tc.desc Set with Infinity and string 'Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapSetTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map:Map<number|string,string> = new Map<number|string,string>();
      map.set(Infinity, 'infinity value')
        .set('Infinity', 'string value');

      expect(map.size).assertEqual(2);
      expect(map.get(Infinity)).assertEqual('infinity value');
      expect(map.get('Infinity')).assertEqual('string value');
    });

  })
}