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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  MapHasTest003,
  MapHasTest004,
  MapHasTest007,
  MapHasTest009,
  MapHasTest015,
  MapHasTest018,
  MapHasTest021,
  MapHasTest026,
  MapHasTest030,
  MapHasTest038,
  MapHasTest039,
  MapHasTest042,
  MapHasTest043,
  MapHasTest044,
  MapHasTest046,
  MapHasTest047,
  MapHasTest048,
  MapHasTest057,
  MapHasTest058,
  MapHasTest063,
  MapHasTest066,
  MapHasTest067,
  MapHasTest068,
  MapHasTest069,
  MapHasTest070,
  MapHasTest075,
  MapHasTest076,
  MapHasTest085,
  MapHasTest086,
  MapHasTest087,
  MapHasTest088,
  MapHasTest093,
  MapHasTest094,
  MapHasTest096,
  MapHasTest097,
  MapHasTest099
} from './MapHas';

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function MapHasTest() {
  describe('MapHasTest', () => {
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
     * @tc.name   MapHasTest001
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_001
     * @tc.desc   Verify that has() returns true for an existing string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([['username', 'zhangsan']]);
      const hasKey = map.has('username');
      expect(hasKey).assertEqual(true);
      expect(typeof hasKey).assertEqual('boolean');
    });

    /**
     * @tc.name   MapHasTest002
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_002
     * @tc.desc   Verify that has() returns false for a non-existent key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([['age', 25]]);
      const hasKey = map.has('gender');
      expect(hasKey).assertEqual(false);
      expect(typeof hasKey).assertEqual('boolean');
    });

    /**
     * @tc.name   MapHasTest003
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_003
     * @tc.desc   Verify the distinction between primitive values and wrapper objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const HasTest003 = MapHasTest003()
      expect(HasTest003.hasWrapper).assertEqual(false)
      expect(HasTest003.hasPrimitive).assertEqual(true)
    });

    /**
     * @tc.name   MapHasTest004
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_004
     * @tc.desc   Verify the distinction between different reference objects as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest004 = MapHasTest004()
      expect(hasTest004.hasObj2).assertEqual(false);
      expect(hasTest004.hasObj1).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest005
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_005
     * @tc.desc   Verify the matchability when NaN is used as a key (SameValueZero algorithm)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[NaN, 'not a number']]);
      const hasNaN1 = map.has(NaN);
      const hasNaN2 = map.has(Number('abc')); // The result of Number('abc') is NaN
      expect(hasNaN1).assertEqual(true);
      expect(hasNaN2).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest006
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_006
     * @tc.desc   Verify the distinction between undefined and null as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[undefined, 'u'], [null, 'n']]);
      const hasUndefined = map.has(undefined);
      const hasNull = map.has(null);
      expect(hasUndefined).assertEqual(true);
      expect(hasNull).assertEqual(true);
      expect(map.has(undefined) === map.has(null)).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest007
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_007
     * @tc.desc   Verify the uniqueness of Symbol type keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest007 = MapHasTest007()
      expect(hasTest007.hasSym1).assertEqual(true)
      expect(hasTest007.hasSym2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest008
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_008
     * @tc.desc   Verify that has() returns false when called on an empty Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const emptyMap: Map<string, string> = new Map();
      expect(emptyMap.has('any')).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest009
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_009
     * @tc.desc   Verify that modifying properties of an object key does not affect has() judgment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest009 = MapHasTest009()
      expect(hasTest009).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest010
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_010
     * @tc.desc   Verify that has() returns false after the key is deleted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([['score', 90]]);
      map.delete('score');
      const hasScore = map.has('score');
      expect(hasScore).assertEqual(false);
      expect(map.size).assertEqual(0);
    });
    /**
     * @tc.name   MapHasTest011
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_011
     * @tc.desc   Verify has() returns true for existing number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([[42, 'answer']]);
      expect(map.has(42)).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest012
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_012
     * @tc.desc   Verify has() returns false for non-existent number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([[42, 'answer']]);
      expect(map.has(100)).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest013
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_013
     * @tc.desc   Verify has() with boolean true as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([[true, 'flag']]);
      expect(map.has(true)).assertEqual(true);
      expect(map.has(false)).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest014
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_014
     * @tc.desc   Verify has() with boolean false as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([[false, 'flag']]);
      expect(map.has(false)).assertEqual(true);
      expect(map.has(true)).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest015
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_015
     * @tc.desc   Verify distinction between true and 1 as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest015 = MapHasTest015()
      expect(hasTest015).assertEqual(false)
    });

    /**
     * @tc.name   MapHasTest016
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_016
     * @tc.desc   Verify distinction between false and 0 as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest016 = MapHasTest015()
      expect(hasTest016).assertEqual(false)
    });

    /**
     * @tc.name   MapHasTest017
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_017
     * @tc.desc   Verify has() with empty string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([['', 'empty']]);
      expect(map.has('')).assertEqual(true);
      expect(map.has(' ')).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest018
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_018
     * @tc.desc   Verify has() with string and number keys that look similar
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest018 = MapHasTest018()
      expect(hasTest018).assertEqual(false)
    });

    /**
     * @tc.name   MapHasTest019
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_019
     * @tc.desc   Verify has() with negative number key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([[-42, 'negative']]);
      expect(map.has(-42)).assertEqual(true);
      expect(map.has(42)).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest020
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_020
     * @tc.desc   Verify has() with zero as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([[0, 'zero']]);
      expect(map.has(0)).assertEqual(true);
      expect(map.has(-0)).assertEqual(true); // SameValueZero considers 0 and -0 equal
    });

    /**
     * @tc.name   MapHasTest021
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_021
     * @tc.desc   Verify has() with bigint key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest018 = MapHasTest021()
      expect(hasTest018.has42n).assertEqual(true);
      expect(hasTest018.has42).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest022
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_022
     * @tc.desc   Verify has() with date object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date();
      const map = new Map([[date, 'timestamp']]);
      expect(map.has(date)).assertEqual(true);
      expect(map.has(new Date())).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest023
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_023
     * @tc.desc   Verify has() with regexp as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex = /test/;
      const map = new Map([[regex, 'pattern']]);
      expect(map.has(regex)).assertEqual(true);
      expect(map.has(/test/)).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest024
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_024
     * @tc.desc   Verify has() after adding key with set()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map: Map<string, string> = new Map();
      map.set('newKey', 'value');
      expect(map.has('newKey')).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest025
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_025
     * @tc.desc   Verify has() returns false after clear()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([['key', 'value']]);
      map.clear();
      expect(map.has('key')).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest026
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_026
     * @tc.desc   Verify has() with multiple keys of different types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest026 = MapHasTest026()
      expect(hasTest026.hasString).assertEqual(true);
      expect(hasTest026.has123).assertEqual(true);
      expect(hasTest026.hasTrue).assertEqual(true);
      expect(hasTest026.hasFalse).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest027
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_027
     * @tc.desc   Verify has() with array as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map = new Map([[arr, 'array']]);
      expect(map.has(arr)).assertEqual(true);
      expect(map.has([1, 2, 3])).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest028
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_028
     * @tc.desc   Verify has() with modified array as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const map = new Map([[arr, 'array']]);
      arr.push(4); // Modify array content
      expect(map.has(arr)).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest029
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_029
     * @tc.desc   Verify has() with null prototype object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    // it('MapHasTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
    //   const obj = Object.create(null);
    //   const map = new Map([[obj, 'no prototype']]);
    //   expect(map.has(obj)).assertEqual(true);
    //   expect(map.has(Object.create(null))).assertEqual(false);
    // });

    /**
     * @tc.name   MapHasTest030
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_030
     * @tc.desc   Verify has() with symbol from Symbol.for()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hasTest030 = MapHasTest030()
      expect(hasTest030.map1).assertEqual(true);
      expect(hasTest030.map2).assertEqual(false);
    });
    /**
     * @tc.name   MapHasTest031
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_031
     * @tc.desc   Verify has() with Infinity as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[Infinity, 'infinite']]);
      expect(map.has(Infinity)).assertEqual(true);
      expect(map.has(-Infinity)).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest032
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_032
     * @tc.desc   Verify has() with -Infinity as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[-Infinity, 'negative infinite']]);
      expect(map.has(-Infinity)).assertEqual(true);
      expect(map.has(Infinity)).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest033
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_033
     * @tc.desc   Verify has() with number precision edge cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapHasTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const map = new Map([[0.1 + 0.2, 'precision']]);
      expect(map.has(0.3)).assertEqual(false); // 0.1+0.2�?.3 due to floating point precision
      expect(map.has(0.1 + 0.2)).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest034
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_034
     * @tc.desc   Verify has() with very large number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const largeNum = Number.MAX_SAFE_INTEGER;
      const map = new Map([[largeNum, 'max safe integer']]);
      expect(map.has(largeNum)).assertEqual(true);
      expect(map.has(largeNum + 1)).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest035
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_035
     * @tc.desc   Verify has() with very small number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const smallNum = Number.MIN_SAFE_INTEGER;
      const map = new Map([[smallNum, 'min safe integer']]);
      expect(map.has(smallNum)).assertEqual(true);
      expect(map.has(smallNum - 1)).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest036
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_036
     * @tc.desc   Verify has() with function as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const func = () => 'test';
      const map = new Map([[func, 'function key']]);
      expect(map.has(func)).assertEqual(true);
      expect(map.has(() => 'test')).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest037
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_037
     * @tc.desc   Verify has() with modified function as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const func = () => 'test';
      const map = new Map([[func, 'function key']]);
      func.property = 'modified'; // Add property to function
      expect(map.has(func)).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest038
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_038
     * @tc.desc   Verify has() with null as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let hasTest038 = MapHasTest038()
      expect(hasTest038.map1).assertEqual(true);
      expect(hasTest038.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest039
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_039
     * @tc.desc   Verify has() with undefined as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let hasTest039 = MapHasTest039()
      expect(hasTest039.map1).assertEqual(true);
      expect(hasTest039.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest040
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_040
     * @tc.desc   Verify has() with multi-line string key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = 'line1\nline2';
      const map = new Map([[key, 'multi-line']]);
      expect(map.has(key)).assertEqual(true);
      expect(map.has('line1line2')).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest041
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_041
     * @tc.desc   Verify has() with string containing special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '!@#$%^&*()_+{}:"<>?`~';
      const map = new Map([[key, 'special chars']]);
      expect(map.has(key)).assertEqual(true);
      expect(map.has('!@#$%^&*()_+{}:"<>?`~ ')).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest042
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_042
     * @tc.desc   Verify has() with empty object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest042 = MapHasTest042()
      expect(hasTest042.map1).assertEqual(true);
      expect(hasTest042.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest043
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_043
     * @tc.desc   Verify has() with nested object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest043 = MapHasTest043()
      expect(hasTest043.map1).assertEqual(true);
      expect(hasTest043.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest044
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_044
     * @tc.desc   Verify has() after modifying nested object properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest044 = MapHasTest044()
      expect(hasTest044).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest045
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_045
     * @tc.desc   Verify has() with typed array as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const arr = new Uint8Array([1, 2, 3]);
      const map = new Map([[arr, 'typed array']]);
      expect(map.has(arr)).assertEqual(true);
      expect(map.has(new Uint8Array([1, 2, 3]))).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest046
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_046
     * @tc.desc   Verify has() with frozen object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest046 = MapHasTest046()
      expect(hasTest046).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest047
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_047
     * @tc.desc   Verify has() with sealed object as key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest047 = MapHasTest047()
      expect(hasTest047).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest048
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_048
     * @tc.desc   Verify has() with symbol as key in multiple Maps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest048 = MapHasTest048()
      expect(hasTest048.hasSym1).assertEqual(true);
      expect(hasTest048.hasSym2).assertEqual(false);
      expect(hasTest048.hasSym3).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest049
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_049
     * @tc.desc   Verify has() with same string key added multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map: Map<string, string> = new Map();
      map.set('key', 'first');
      map.set('key', 'second'); // Overwrites the first value
      expect(map.has('key')).assertEqual(true);
      expect(map.size).assertEqual(1);
    });

    /**
     * @tc.name   MapHasTest050
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_050
     * @tc.desc   Verify has() with key after reassigning variable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let key = 'original';
      const map = new Map([[key, 'value']]);
      key = 'changed'; // Reassign variable
      expect(map.has(key)).assertEqual(false);
      expect(map.has('original')).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest051
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_051
     * @tc.desc   Verify has() with key that is a Map instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyMap: Map<string, string> = new Map();
      const map: Map<Map<string, string>, string> = new Map([[keyMap, 'map as key']]);
      expect(map.has(keyMap)).assertEqual(true);
      expect(map.has(new Map())).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest052
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_052
     * @tc.desc   Verify has() with key that is a Set instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keySet: Set<string> = new Set();
      const map = new Map([[keySet, 'set as key']]);
      expect(map.has(keySet)).assertEqual(true);
      expect(map.has(new Set())).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest053
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_053
     * @tc.desc   Verify has() with key that is a WeakMap instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyWeakMap: WeakMap<object, string> = new WeakMap();
      const map = new Map([[keyWeakMap, 'weakmap as key']]);
      expect(map.has(keyWeakMap)).assertEqual(true);
      expect(map.has(new WeakMap())).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest054
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_054
     * @tc.desc   Verify has() with key that is a WeakSet instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyWeakSet = new WeakSet();
      const map = new Map([[keyWeakSet, 'weakset as key']]);
      expect(map.has(keyWeakSet)).assertEqual(true);
      expect(map.has(new WeakSet())).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest055
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_055
     * @tc.desc   Verify has() with key after many operations
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('MapHasTest055', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const map: Map<string | number, String | number> = new Map();
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
     * @tc.name   MapHasTest056
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_056
     * @tc.desc   Verify has() with key that is a Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyPromise = Promise.resolve('test');
      const map = new Map([[keyPromise, 'promise as key']]);
      expect(map.has(keyPromise)).assertEqual(true);
      expect(map.has(Promise.resolve('test'))).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest057
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_057
     * @tc.desc   Verify has() with key that is a generator function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest057 = MapHasTest057()
      expect(hasTest057.map1).assertEqual(true);
      expect(hasTest057.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest058
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_058
     * @tc.desc   Verify has() with key that is a class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest058: boolean = MapHasTest058()

      class TestClass {
      }

      const map = new Map([[TestClass, 'class as key']]);
      expect(map.has(TestClass)).assertEqual(true);
      expect(hasTest058).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest059
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_059
     * @tc.desc   Verify has() with key that is an instance of a class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      class TestClass {
      }

      const instance = new TestClass();
      const map = new Map([[instance, 'instance as key']]);
      expect(map.has(instance)).assertEqual(true);
      expect(map.has(new TestClass())).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest060
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_060
     * @tc.desc   Verify has() with key after being deleted and re-added
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([['key', 'value']]);

      map.delete('key');
      expect(map.has('key')).assertEqual(false);

      map.set('key', 'new value');
      expect(map.has('key')).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest061
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_061
     * @tc.desc   Verify has() with key that is a RegExp with same pattern but different flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex = /test*/;
      const map = new Map([[regex, 'regex as key']]);

      expect(map.has(regex)).assertEqual(true);
      expect(map.has(/test/g)).assertEqual(false); // Different flags
    });

    /**
     * @tc.name   MapHasTest062
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_062
     * @tc.desc   Verify has() with key that is a Date with same timestamp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const date = new Date(2023, 0, 1);
      const map = new Map([[date, 'date as key']]);

      expect(map.has(date)).assertEqual(true);
      expect(map.has(new Date(2023, 0, 1))).assertEqual(false); // Same timestamp, different object
    });

    /**
     * @tc.name   MapHasTest063
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_063
     * @tc.desc   Verify has() with key that is a Symbol with same description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest063 = MapHasTest063()
      expect(hasTest063.map1).assertEqual(true);
      expect(hasTest063.map2).assertEqual(false); // Same description, different symbol
    });

    /**
     * @tc.name   MapHasTest064
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_064
     * @tc.desc   Verify has() with key that is a BigInt with same numeric value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bigint1 = 42n;
      const bigint2 = 42n; // New BigInt with same value
      const map = new Map([[bigint1, 'bigint as key']]);
      expect(map.has(bigint1)).assertEqual(true);
      expect(map.has(bigint2)).assertEqual(true); // Same value, different BigInt
    });

    /**
     * @tc.name   MapHasTest065
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_065
     * @tc.desc   Verify has() with key that is a string with same value but different case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapHasTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const map = new Map([['Key', 'value']]);
      expect(map.has('Key')).assertEqual(true);
      expect(map.has('key')).assertEqual(false); // Different case
    });

    /**
     * @tc.name   MapHasTest066
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_066
     * @tc.desc   Verify has() with key that is a number converted from string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest066 = MapHasTest066()
      expect(hasTest066.map1).assertEqual(true);
      expect(hasTest066.map2).assertEqual(false); // Converted to number
    });

    /**
     * @tc.name   MapHasTest067
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_067
     * @tc.desc   Verify has() with key that is a string converted from number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest067 = MapHasTest067()
      expect(hasTest067.map1).assertEqual(true);
      expect(hasTest067.map2).assertEqual(false); // Converted to string
    });

    /**
     * @tc.name   MapHasTest068
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_068
     * @tc.desc   Verify has() with key that is a boolean converted from number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest068 = MapHasTest068()
      expect(hasTest068.map1).assertEqual(true);
      expect(hasTest068.map2).assertEqual(false); // Number 1 is truthy but not equal to true
    });

    /**
     * @tc.name   MapHasTest069
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_069
     * @tc.desc   Verify has() with key that is a boolean converted from number zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest069 = MapHasTest069()
      expect(hasTest069.map1).assertEqual(true);
      expect(hasTest069.map2).assertEqual(false); // Number 0 is falsy but not equal to false
    });

    /**
     * @tc.name   MapHasTest070
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_070
     * @tc.desc   Verify has() with key that is a number after type coercion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hasTest070 = MapHasTest070()
      expect(hasTest070.map2).assertEqual(true);
      expect(hasTest070.map1).assertEqual(false); // Coerced equality doesn't affect Map
    });

    /**
     * @tc.name   MapHasTest071
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_071
     * @tc.desc   Verify has() with key that is a string with leading/trailing whitespace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[' key ', 'with spaces']]);
      expect(map.has(' key ')).assertEqual(true);
      expect(map.has('key')).assertEqual(false); // No spaces
    });

    /**
     * @tc.name   MapHasTest072
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_072
     * @tc.desc   Verify has() with key that is a Unicode character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '�?'; // Unicode character
      const map = new Map([[key, 'unicode']]);

      expect(map.has(key)).assertEqual(true);
      expect(map.has('$')).assertEqual(false); // Different character
    });

    /**
     * @tc.name   MapHasTest073
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_073
     * @tc.desc   Verify has() with key that is a Unicode escape sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '\u00A9'; // Copyright symbol
      const map = new Map([[key, 'unicode escape']]);

      expect(map.has(key)).assertEqual(true);
      expect(map.has('©')).assertEqual(true); // Same character, different representation
    });

    /**
     * @tc.name   MapHasTest074
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_074
     * @tc.desc   Verify has() with key that is a surrogate pair
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const key = '😀'; // Emoji as surrogate pair
      const map = new Map([[key, 'surrogate pair']]);

      expect(map.has(key)).assertEqual(true);
      expect(map.has('😃')).assertEqual(false); // Different emoji
    });

    /**
     * @tc.name   MapHasTest075
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_075
     * @tc.desc   Verify has() with key that is a null prototype object after modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapHasTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let hasTest075 = MapHasTest075()
      expect(hasTest075).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest076
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_076
     * @tc.desc   Verify has() with key that is a prototype object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest076 = MapHasTest076()
      expect(hasTest076.map1).assertEqual(true);
      expect(hasTest076.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest077
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_077
     * @tc.desc   Verify has() with key that is a DOM element (if available)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    // it('MapHasTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
    //
    //   // Only run if we're in a browser environment
    //   let hasTest077 = MapHasTest077()
    //   expect(hasTest077!.map1).assertEqual(true);
    //   expect(hasTest077!.map2).assertEqual(false);
    // });

    /**
     * @tc.name   MapHasTest078
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_078
     * @tc.desc   Verify has() with key that is a Error object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const error = new Error('test');
      const map = new Map([[error, 'error object']]);

      expect(map.has(error)).assertEqual(true);
      expect(map.has(new Error('test'))).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest079
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_079
     * @tc.desc   Verify has() with key that is a TypeError object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const error = new TypeError('test');
      const map = new Map([[error, 'type error object']]);

      expect(map.has(error)).assertEqual(true);
      expect(map.has(new TypeError('test'))).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest080
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_080
     * @tc.desc   Verify has() with key that is a RegExp with same source and flags
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const regex1 = /test/g;
      const regex2 = /test/g; // Same pattern and flags
      const map = new Map([[regex1, 'regex']]);

      expect(map.has(regex1)).assertEqual(true);
      expect(map.has(regex2)).assertEqual(false); // Same pattern, different object
    });

    /**
     * @tc.name   MapHasTest081
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_081
     * @tc.desc   Verify has() with key that is a ArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(8);
      const map = new Map([[buffer, 'array buffer']]);

      expect(map.has(buffer)).assertEqual(true);
      expect(map.has(new ArrayBuffer(8))).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest082
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_082
     * @tc.desc   Verify has() with key that is a DataView
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const buffer = new ArrayBuffer(8);
      const view = new DataView(buffer);
      const map = new Map([[view, 'data view']]);

      expect(map.has(view)).assertEqual(true);
      expect(map.has(new DataView(buffer))).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest083
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_083
     * @tc.desc   Verify has() with key that is a Map after being modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keyMap: Map<string, string> = new Map();
      const map = new Map([[keyMap, 'map key']]);

      keyMap.set('a', 'b'); // Modify the map used as key
      expect(map.has(keyMap)).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest084
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_084
     * @tc.desc   Verify has() with key that is a Set after being modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keySet: Set<string> = new Set();
      const map = new Map([[keySet, 'set key']]);

      keySet.add('value'); // Modify the set used as key
      expect(map.has(keySet)).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest085
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_085
     * @tc.desc   Verify has() with key that is a WeakMap after being modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hasTest085 = MapHasTest085()
      expect(hasTest085).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest086
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_086
     * @tc.desc   Verify has() with key that is a WeakSet after being modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hasTest086 = MapHasTest086()
      expect(hasTest086).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest087
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_087
     * @tc.desc   Verify has() with key that is a Proxy object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapHasTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let hasTest087 = MapHasTest087()
      expect(hasTest087.map1).assertEqual(true);
      expect(hasTest087.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest088
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_088
     * @tc.desc   Verify has() with key that is a Reflect object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest088 = MapHasTest088()
      expect(hasTest088).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest089
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_089
     * @tc.desc   Verify has() with key that is a Math object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[Math, 'math']]);
      expect(map.has(Math)).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest090
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_090
     * @tc.desc   Verify has() with key that is a JSON object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[JSON, 'json']]);
      expect(map.has(JSON)).assertEqual(true);
    });


    /**
     * @tc.name   MapHasTest093
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_093
     * @tc.desc   Verify has() with key that is a function after binding
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest093 = MapHasTest093()
      expect(hasTest093.map1).assertEqual(true);
      expect(hasTest093.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest094
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_094
     * @tc.desc   Verify has() with key that is a generator object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest094 = MapHasTest094()
      expect(hasTest094.map1).assertEqual(true);
      expect(hasTest094.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest095
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_095
     * @tc.desc   Verify has() with key that is an async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const asyncFunc = async () => {
      };
      const map = new Map([[asyncFunc, 'async function']]);

      expect(map.has(asyncFunc)).assertEqual(true);
      expect(map.has(async () => {
      })).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest096
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_096
     * @tc.desc   Verify has() with key that is an async generator function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapHasTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let hasTest096 = MapHasTest096()
      expect(hasTest096.map1).assertEqual(true);
      expect(hasTest096.map2).assertEqual(false);
    });

    /**
     * @tc.name   MapHasTest097
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_097
     * @tc.desc   Verify has() with key that is a revoked proxy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapHasTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let hasTest097 = MapHasTest097()
      expect(hasTest097.map1).assertEqual(true);
      // Accessing revoked proxy throws, but has() should still work
      expect(hasTest097.map2).assertEqual(true);
    });

    /**
     * @tc.name   MapHasTest098
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_098
     * @tc.desc   Verify has() performance with large number of keys
     * @tc.type   PERFORMANCE
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('MapHasTest098', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL3, async () => {
      const map: Map<string, string | number> = new Map();
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

    /**
     * @tc.name   MapHasTest099
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_099
     * @tc.desc   Verify has() with key that is a Symbol.toStringTag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapHasTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let hasTest099 = MapHasTest099()
      expect(hasTest099.map1).assertEqual(true);
      expect(hasTest099.map2).assertEqual(true); // Same well-known symbol
    });

    /**
     * @tc.name   MapHasTest100
     * @tc.number SUB_BUILTINS_MAP_HAS_TEST_100
     * @tc.desc   Verify has() with key that is a Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapHasTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const key = Symbol.iterator;
      const map = new Map([[key, 'iterator']]);
      expect(map.has(key)).assertEqual(true);
      expect(map.has(Symbol.iterator)).assertEqual(true); // Same well-known symbol
    });
  })
}