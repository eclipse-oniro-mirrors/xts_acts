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

class TestClass {
}

export default function MapHasTest() {
  describe('MapHasTest', () => {
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
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_001
     * @tc.name MapHasTest001
     * @tc.desc Verify that has() returns true for an existing string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<string, string>([['username', 'zhangsan']]);
      const hasKey = map.has('username');
      expect(hasKey).assertEqual(true);
      expect(typeof hasKey).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_002
     * @tc.name MapHasTest002
     * @tc.desc Verify that has() returns false for a non-existent key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<string, int>([['age', 25]]);
      const hasKey = map.has('gender');
      expect(hasKey).assertEqual(false);
      expect(typeof hasKey).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_005
     * @tc.name MapHasTest005
     * @tc.desc Verify the matchability when NaN is used as a key (SameValueZero algorithm)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map<number, string>([[NaN, 'not a number']]);
      const hasNaN1 = map.has(NaN);
      const hasNaN2 = map.has(Number('abc')); // The result of Number('abc') is NaN
      expect(hasNaN1).assertEqual(true);
      expect(hasNaN2).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_006
     * @tc.name MapHasTest006
     * @tc.desc Verify the distinction between undefined and null as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map<Any, string>([[undefined, 'u'], [null, 'n']]);
      const hasUndefined = map.has(undefined);
      const hasNull = map.has(null);
      expect(hasUndefined).assertEqual(true);
      expect(hasNull).assertEqual(true);
      expect(map.has(undefined) === map.has(null)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_008
     * @tc.name MapHasTest008
     * @tc.desc Verify that has() returns false when called on an empty Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const emptyMap: Map<string, string> = new Map<string, string>();
      expect(emptyMap.has('any')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_010
     * @tc.name MapHasTest010
     * @tc.desc Verify that has() returns false after the key is deleted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map<string, number>([['score', 90]]);
      map.delete('score');
      const hasScore = map.has('score');
      expect(hasScore).assertEqual(false);
      expect(map.size).assertEqual(0);
    });
    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_011
     * @tc.name MapHasTest011
     * @tc.desc Verify has() returns true for existing number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<number, string>([[42, 'answer']]);
      expect(map.has(42)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_012
     * @tc.name MapHasTest012
     * @tc.desc Verify has() returns false for non-existent number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<number, string>([[42, 'answer']]);
      expect(map.has(100)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_013
     * @tc.name MapHasTest013
     * @tc.desc Verify has() with boolean true as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<boolean, string>([[true, 'flag']]);
      expect(map.has(true)).assertEqual(true);
      expect(map.has(false)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_014
     * @tc.name MapHasTest014
     * @tc.desc Verify has() with boolean false as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<boolean, string>([[false, 'flag']]);
      expect(map.has(false)).assertEqual(true);
      expect(map.has(true)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_017
     * @tc.name MapHasTest017
     * @tc.desc Verify has() with empty string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<string, string>([['', 'empty']]);
      expect(map.has('')).assertEqual(true);
      expect(map.has(' ')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_019
     * @tc.name MapHasTest019
     * @tc.desc Verify has() with negative number key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<number, string>([[-42, 'negative']]);
      expect(map.has(-42)).assertEqual(true);
      expect(map.has(42)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_020
     * @tc.name MapHasTest020
     * @tc.desc Verify has() with zero as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<number, string>([[0, 'zero']]);
      expect(map.has(0)).assertEqual(true);
      expect(map.has(-0)).assertEqual(true); // SameValueZero considers 0 and -0 equal
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_022
     * @tc.name MapHasTest022
     * @tc.desc Verify has() with date object as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const map = new Map<Date, string>([[date, 'timestamp']]);
      expect(map.has(date)).assertEqual(true);
      expect(map.has(new Date())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_023
     * @tc.name MapHasTest023
     * @tc.desc Verify has() with regexp as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex = new RegExp("test");
      const map = new Map<RegExp, string>([[regex, 'pattern']]);
      expect(map.has(regex)).assertEqual(true);
      expect(map.has(new RegExp("test"))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_024
     * @tc.name MapHasTest024
     * @tc.desc Verify has() after adding key with set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('newKey', 'value');
      expect(map.has('newKey')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_025
     * @tc.name MapHasTest025
     * @tc.desc Verify has() returns false after clear()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<string, string>([['key', 'value']]);
      map.clear();
      expect(map.has('key')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_027
     * @tc.name MapHasTest027
     * @tc.desc Verify has() with array as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map = new Map<Array<int>, string>([[arr, 'array']]);
      expect(map.has(arr)).assertEqual(true);
      expect(map.has([1, 2, 3])).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_028
     * @tc.name MapHasTest028
     * @tc.desc Verify has() with modified array as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map = new Map<Array<int>, string>([[arr, 'array']]);
      arr.push(4); // Modify array content
      expect(map.has(arr)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_031
     * @tc.name MapHasTest031
     * @tc.desc Verify has() with Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map<number, string>([[Infinity, 'infinite']]);
      expect(map.has(Infinity)).assertEqual(true);
      expect(map.has(-Infinity)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_032
     * @tc.name MapHasTest032
     * @tc.desc Verify has() with -Infinity as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map<number, string>([[-Infinity, 'negative infinite']]);
      expect(map.has(-Infinity)).assertEqual(true);
      expect(map.has(Infinity)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_033
     * @tc.name MapHasTest033
     * @tc.desc Verify has() with number precision edge cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapHasTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const map = new Map<number, string>([[0.1 + 0.2, 'precision']]);
      expect(map.has(0.3)).assertEqual(false); // 0.1+0.2�?.3 due to floating point precision
      expect(map.has(0.1 + 0.2)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_034
     * @tc.name MapHasTest034
     * @tc.desc Verify has() with very large number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const largeNum = Number.MAX_SAFE_INTEGER;
      const map = new Map<number, string>([[largeNum, 'max safe integer']]);
      expect(map.has(largeNum)).assertEqual(true);
      expect(map.has(largeNum + 1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_035
     * @tc.name MapHasTest035
     * @tc.desc Verify has() with very small number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const smallNum = Number.MIN_SAFE_INTEGER;
      const map = new Map<number, string>([[smallNum, 'min safe integer']]);
      expect(map.has(smallNum)).assertEqual(true);
      expect(map.has(smallNum - 1)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_036
     * @tc.name MapHasTest036
     * @tc.desc Verify has() with function as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const func = () => 'test';
      const map = new Map<() =>string, string>([[func, 'function key']]);
      expect(map.has(func)).assertEqual(true);
      expect(map.has(() => 'test')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_040
     * @tc.name MapHasTest040
     * @tc.desc Verify has() with multi-line string key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = 'line1\nline2';
      const map = new Map<string, string>([[key, 'multi-line']]);
      expect(map.has(key)).assertEqual(true);
      expect(map.has('line1line2')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_041
     * @tc.name MapHasTest041
     * @tc.desc Verify has() with string containing special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '!@#$%^&*()_+{}:"<>?`~';
      const map = new Map<string, string>([[key, 'special chars']]);
      expect(map.has(key)).assertEqual(true);
      expect(map.has('!@#$%^&*()_+{}:"<>?`~ ')).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_045
     * @tc.name MapHasTest045
     * @tc.desc Verify has() with typed array as key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = new Uint8Array([1, 2, 3]);
      const map = new Map<Uint8Array, string>([[arr, 'typed array']]);
      expect(map.has(arr)).assertEqual(true);
      expect(map.has(new Uint8Array([1, 2, 3]))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_049
     * @tc.name MapHasTest049
     * @tc.desc Verify has() with same string key added multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map: Map<string, string> = new Map<string, string>();
      map.set('key', 'first');
      map.set('key', 'second'); // Overwrites the first value
      expect(map.has('key')).assertEqual(true);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_050
     * @tc.name MapHasTest050
     * @tc.desc Verify has() with key after reassigning variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let key = 'original';
      const map = new Map<string, string>([[key, 'value']]);
      key = 'changed'; // Reassign variable
      expect(map.has(key)).assertEqual(false);
      expect(map.has('original')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_051
     * @tc.name MapHasTest051
     * @tc.desc Verify has() with key that is a Map instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyMap: Map<string, string> = new Map<string, string>();
      const map: Map<Map<string, string>, string> = new Map<Map<string, string>, string>([[keyMap, 'map as key']]);
      expect(map.has(keyMap)).assertEqual(true);
      expect(map.has(new Map<string, string>())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_052
     * @tc.name MapHasTest052
     * @tc.desc Verify has() with key that is a Set instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keySet: Set<string> = new Set<string>();
      const map = new Map<Set<string>, string>([[keySet, 'set as key']]);
      expect(map.has(keySet)).assertEqual(true);
      expect(map.has(new Set<string>())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_053
     * @tc.name MapHasTest053
     * @tc.desc Verify has() with key that is a WeakMap instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyWeakMap: WeakMap<object, string> = new WeakMap<object, string>();
      const map = new Map<WeakMap<object, string>, string>([[keyWeakMap, 'weakmap as key']]);
      expect(map.has(keyWeakMap)).assertEqual(true);
      expect(map.has(new WeakMap<object, string>())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_054
     * @tc.name MapHasTest054
     * @tc.desc Verify has() with key that is a WeakSet instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyWeakSet = new WeakSet<number>();
      const map = new Map<WeakSet<number>, string>([[keyWeakSet, 'weakset as key']]);
      expect(map.has(keyWeakSet)).assertEqual(true);
      expect(map.has(new WeakSet<number>())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_055
     * @tc.name MapHasTest055
     * @tc.desc Verify has() with key after many operations
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapHasTest055', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const map: Map<string | number, String | number> = new Map<string | number, String | number>();
      const specialKey = 'special';
      // Add many entries
      for (let i = 0; i < 1000; i++) {
        map.set(i, i);
      }
      map.set(specialKey, 'value');
      // Remove many entries
      for (let i = 0; i < 500; i++) {
        map.delete(i);
      }
      expect(map.has(specialKey)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_056
     * @tc.name MapHasTest056
     * @tc.desc Verify has() with key that is a Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyPromise = Promise.resolve('test');
      const map = new Map<Promise<string>, string>([[keyPromise, 'promise as key']]);
      expect(map.has(keyPromise)).assertEqual(true);
      expect(map.has(Promise.resolve('test'))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_059
     * @tc.name MapHasTest059
     * @tc.desc Verify has() with key that is an instance of a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const instance = new TestClass();
      const map = new Map<TestClass, string>([[instance, 'instance as key']]);
      expect(map.has(instance)).assertEqual(true);
      expect(map.has(new TestClass())).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_060
     * @tc.name MapHasTest060
     * @tc.desc Verify has() with key after being deleted and re-added
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map<string, string>([['key', 'value']]);

      map.delete('key');
      expect(map.has('key')).assertEqual(false);

      map.set('key', 'new value');
      expect(map.has('key')).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_061
     * @tc.name MapHasTest061
     * @tc.desc Verify has() with key that is a RegExp with same pattern but different flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex = new RegExp("test*");
      const map = new Map<RegExp, string>([[regex, 'regex as key']]);

      expect(map.has(regex)).assertEqual(true);
      expect(map.has(new RegExp("test", "g"))).assertEqual(false); // Different flags
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_062
     * @tc.name MapHasTest062
     * @tc.desc Verify has() with key that is a Date with same timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date(2023, 0, 1);
      const map = new Map<Date, string>([[date, 'date as key']]);

      expect(map.has(date)).assertEqual(true);
      expect(map.has(new Date(2023, 0, 1))).assertEqual(false); // Same timestamp, different object
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_064
     * @tc.name MapHasTest064
     * @tc.desc Verify has() with key that is a BigInt with same numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bigint1 = 42n;
      const bigint2 = 42n; // New BigInt with same value
      const map = new Map<bigint, string>([[bigint1, 'bigint as key']]);
      expect(map.has(bigint1)).assertEqual(true);
      expect(map.has(bigint2)).assertEqual(true); // Same value, different BigInt
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_065
     * @tc.name MapHasTest065
     * @tc.desc Verify has() with key that is a string with same value but different case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapHasTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map<string, string>([['Key', 'value']]);
      expect(map.has('Key')).assertEqual(true);
      expect(map.has('key')).assertEqual(false); // Different case
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_071
     * @tc.name MapHasTest071
     * @tc.desc Verify has() with key that is a string with leading/trailing whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map<string, string>([[' key ', 'with spaces']]);
      expect(map.has(' key ')).assertEqual(true);
      expect(map.has('key')).assertEqual(false); // No spaces
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_072
     * @tc.name MapHasTest072
     * @tc.desc Verify has() with key that is a Unicode character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '�?'; // Unicode character
      const map = new Map<string, string>([[key, 'unicode']]);

      expect(map.has(key)).assertEqual(true);
      expect(map.has('$')).assertEqual(false); // Different character
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_073
     * @tc.name MapHasTest073
     * @tc.desc Verify has() with key that is a Unicode escape sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '\u00A9'; // Copyright symbol
      const map = new Map<string, string>([[key, 'unicode escape']]);

      expect(map.has(key)).assertEqual(true);
      expect(map.has('©')).assertEqual(true); // Same character, different representation
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_074
     * @tc.name MapHasTest074
     * @tc.desc Verify has() with key that is a surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '😀'; // Emoji as surrogate pair
      const map = new Map<string, string>([[key, 'surrogate pair']]);

      expect(map.has(key)).assertEqual(true);
      expect(map.has('😃')).assertEqual(false); // Different emoji
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_078
     * @tc.name MapHasTest078
     * @tc.desc Verify has() with key that is a Error object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const error = new Error('test');
      const map = new Map<Error, string>([[error, 'error object']]);

      expect(map.has(error)).assertEqual(true);
      expect(map.has(new Error('test'))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_079
     * @tc.name MapHasTest079
     * @tc.desc Verify has() with key that is a TypeError object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const error = new TypeError('test');
      const map = new Map<Error, string>([[error, 'type error object']]);

      expect(map.has(error)).assertEqual(true);
      expect(map.has(new TypeError('test'))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_080
     * @tc.name MapHasTest080
     * @tc.desc Verify has() with key that is a RegExp with same source and flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex1 = new RegExp("test", "g");
      const regex2 = new RegExp("test", "g"); // Same pattern and flags
      const map = new Map<RegExp, string>([[regex1, 'regex']]);

      expect(map.has(regex1)).assertEqual(true);
      expect(map.has(regex2)).assertEqual(false); // Same pattern, different object
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_081
     * @tc.name MapHasTest081
     * @tc.desc Verify has() with key that is a ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(8);
      const map = new Map<ArrayBuffer, string>([[buffer, 'array buffer']]);

      expect(map.has(buffer)).assertEqual(true);
      expect(map.has(new ArrayBuffer(8))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_082
     * @tc.name MapHasTest082
     * @tc.desc Verify has() with key that is a DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const map = new Map<DataView, string>([[view, 'data view']]);

      expect(map.has(view)).assertEqual(true);
      expect(map.has(new DataView(buffer))).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_083
     * @tc.name MapHasTest083
     * @tc.desc Verify has() with key that is a Map after being modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyMap: Map<string, string> = new Map<string, string>();
      const map = new Map<Map<string, string>, string>([[keyMap, 'map key']]);

      keyMap.set('a', 'b'); // Modify the map used as key
      expect(map.has(keyMap)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_084
     * @tc.name MapHasTest084
     * @tc.desc Verify has() with key that is a Set after being modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keySet: Set<string> = new Set<string>();
      const map = new Map<Set<string>, string>([[keySet, 'set key']]);

      keySet.add('value'); // Modify the set used as key
      expect(map.has(keySet)).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_095
     * @tc.name MapHasTest095
     * @tc.desc Verify has() with key that is an async function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapHasTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncFunc = async () => {};
      const map = new Map<()=>Promise<void>, string>([[asyncFunc, 'async function']]);

      expect(map.has(asyncFunc)).assertEqual(true);
      expect(map.has(async () => {
      })).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_098
     * @tc.name MapHasTest098
     * @tc.desc Verify has() performance with large number of keys
     * @tc.size LargeTest
     * @tc.type Performance
     * @tc.level Level 3
     */
    it('MapHasTest098', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, async () => {
      const map: Map<string, string | number> = new Map<string, string | number>();
      const testKey = 'test-key-99999';
      // Add 100,000 keys
      for (let i = 0; i < 100000; i++) {
        map.set(`test-key-${i}`, i);
      }
      // Measure performance
      const start: number = Date.now();
      const result = map.has(testKey);
      const end: number = Date.now();

      expect(result).assertEqual(true);
      expect(end - start).assertLess(10);
    });

  })
}