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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import {
  MapKeysTest001,
  MapKeysTest002,
  MapKeysTest003,
  MapKeysTest004,
  MapKeysTest005,
  MapKeysTest006,
  MapKeysTest007,
  MapKeysTest008,
  MapKeysTest009,
  MapKeysTest010,
  MapKeysTest0100,
  MapKeysTest011,
  MapKeysTest012,
  MapKeysTest013,
  MapKeysTest014,
  MapKeysTest015,
  MapKeysTest016,
  MapKeysTest017,
  MapKeysTest018,
  MapKeysTest019,
  MapKeysTest020,
  MapKeysTest021,
  MapKeysTest025,
  MapKeysTest029,
  MapKeysTest030,
  MapKeysTest031,
  MapKeysTest032,
  MapKeysTest033,
  MapKeysTest034,
  MapKeysTest035,
  MapKeysTest036,
  MapKeysTest037,
  MapKeysTest038,
  MapKeysTest039,
  MapKeysTest040,
  MapKeysTest041,
  MapKeysTest042,
  MapKeysTest044,
  MapKeysTest046,
  MapKeysTest051,
  MapKeysTest052,
  MapKeysTest054,
  MapKeysTest056,
  MapKeysTest061,
  MapKeysTest066,
  MapKeysTest068,
  MapKeysTest069,
  MapKeysTest070,
  MapKeysTest071,
  MapKeysTest074,
  MapKeysTest075,
  MapKeysTest087,
  MapKeysTest089,
  MapKeysTest090,
  MapKeysTest095,
  MapKeysTest096,
  MapKeysTest099,
} from './MapKey';

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function MapKeyTest() {
  describe('MapKeyTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(30)
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   MapKeysTest001
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0001
     * @tc.desc   Calling keys() on an empty Map returns an iterator with no elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapKeysTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let keysTest001 = MapKeysTest001();
      expect(keysTest001.keys1).assertEqual(0);
      expect(keysTest001.keys).assertDeepEquals([]);
    });

    /**
     * @tc.name   MapKeysTest002
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0002
     * @tc.desc   Map with a single string key, keys() iterator contains that key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapKeysTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let keysTest002 = MapKeysTest002();
      expect(keysTest002.keys1).assertEqual(1);
      expect(keysTest002.keys[0]).assertEqual('a');
    });

    /**
     * @tc.name   MapKeysTest003
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0003
     * @tc.desc   Map with multiple string keys, keys() maintains insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapKeysTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let keysTest003 = MapKeysTest003();
      expect(keysTest003).assertDeepEquals(['b', 'a', 'c']);
    });

    /**
     * @tc.name   MapKeysTest004
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0004
     * @tc.desc   Map with a single number key, keys() iterator contains that key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapKeysTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let keysTest004 = MapKeysTest004();
      expect(keysTest004[0]).assertEqual(123);
    });

    /**
     * @tc.name   MapKeysTest005
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0005
     * @tc.desc   Map with multiple number keys, keys() maintains insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapKeysTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let keysTest005 = MapKeysTest005();
      expect(keysTest005).assertDeepEquals([3, 1, 2]);
    });

    /**
     * @tc.name   MapKeysTest006
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0006
     * @tc.desc   Map with a single boolean key (true), keys() contains that key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapKeysTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let keysTest006 = MapKeysTest006();
      expect(keysTest006[0]).assertEqual(true);
    });

    /**
     * @tc.name   MapKeysTest007
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0007
     * @tc.desc   Map with a single boolean key (false), keys() contains that key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapKeysTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let keysTest007 = MapKeysTest007();
      expect(keysTest007[0]).assertEqual(false);
    });

    /**
     * @tc.name   MapKeysTest008
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0008
     * @tc.desc   Boolean and number keys (true vs 1) coexist, both included in keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest008 = MapKeysTest008();

      expect(keysTest008.keys1).assertEqual(2);
      expect(keysTest008.keys).assertDeepEquals([true, 1]);
    });

    /**
     * @tc.name   MapKeysTest009
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0009
     * @tc.desc   Map with a single null key, keys() contains null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapKeysTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let keysTest009 = MapKeysTest009();
      expect(keysTest009).assertEqual(null);
    });

    /**
     * @tc.name   MapKeysTest010
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0010
     * @tc.desc   Map with a single undefined key, keys() contains undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapKeysTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let keysTest010 = MapKeysTest010();
      expect(keysTest010).assertEqual(undefined);
    });

    /**
     * @tc.name   MapKeysTest011
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0011
     * @tc.desc   null and undefined keys coexist, both included in keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest011 = MapKeysTest011();
      expect(keysTest011).assertDeepEquals([null, undefined]);
    });

    /**
     * @tc.name   MapKeysTest012
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0012
     * @tc.desc   Map with a single Symbol key, keys() contains that Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest012 = MapKeysTest012();
      expect(keysTest012.keys1 === keysTest012.s).assertEqual(true);
    });

    /**
     * @tc.name   MapKeysTest013
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0013
     * @tc.desc   Map with multiple distinct Symbol keys, keys() maintains order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest013 = MapKeysTest013();
      expect(JSON.stringify(keysTest013.keys)).assertDeepEquals(JSON.stringify(keysTest013.keys1));
    });



    /**
     * @tc.name   MapKeysTest014
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0014
     * @tc.desc   Map with a single BigInt key, keys() contains that BigInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keysTest014 = MapKeysTest014();
      expect(typeof keysTest014 === 'bigint').assertTrue();
      expect(keysTest014).assertEqual(42n);
    });


    /**
     * @tc.name   MapKeysTest015
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0015
     * @tc.desc   Multiple BigInt keys (same value, different instances), all included in keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest015 = MapKeysTest015();
      expect(keysTest015[0]).assertEqual(42n);
    });

    /**
     * @tc.name   MapKeysTest016
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0016
     * @tc.desc   Map with a single object key, keys() contains that object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest016 = MapKeysTest016();
      expect(keysTest016.keys1).assertEqual(keysTest016.obj);
    });

    /**
     * @tc.name   MapKeysTest017
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0017
     * @tc.desc   Multiple object keys (different references), all included in keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest017 = MapKeysTest017();
      expect(keysTest017.keys).assertDeepEquals(keysTest017.test017);
    });

    /**
     * @tc.name   MapKeysTest018
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0018
     * @tc.desc   Map with a single array key, keys() contains that array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest018 = MapKeysTest018();
      expect(keysTest018.keys1).assertEqual(keysTest018.arr);
      expect(keysTest018.keys1.length).assertEqual(2);
    });

    /**
     * @tc.name   MapKeysTest019
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0019
     * @tc.desc   Multiple array keys (same value, different references), all included in keys()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest019 = MapKeysTest019();

      expect(keysTest019.keys.length).assertEqual(2);
      expect(keysTest019.keys1 === keysTest019.keys2).assertFalse();
    });

    /**
     * @tc.name   MapKeysTest020
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0020
     * @tc.desc   Map with a single function key, keys() contains that function reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest020 = MapKeysTest020();
      expect(keysTest020.keys1).assertEqual(keysTest020.fn);
    });

    /**
     * @tc.name   MapKeysTest021
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0021
     * @tc.desc   Return value of keys() is an iterator object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest021 = MapKeysTest021();
      expect(typeof keysTest021.keys).assertEqual('function');
      expect(keysTest021.keys1 === undefined).assertFalse();
    });

    /**
     * @tc.name   MapKeysTest022
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0022
     * @tc.desc   First next() on empty Map's iterator returns done:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map: Map<string, string> = new Map();
      const result = map.keys().next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.name   MapKeysTest023
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0023
     * @tc.desc   First next() on single-key Map's iterator returns the key value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([['key', 'value']]);
      const result = map.keys().next();
      expect(result.done).assertEqual(false);
      expect(result.value).assertEqual('key');
    });

    /**
     * @tc.name   MapKeysTest024
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0024
     * @tc.desc   Second next() on single-key Map's iterator returns done:true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const iterator = new Map([['key', 'value']]).keys();
      iterator.next();
      const result = iterator.next();
      expect(result.done).assertEqual(true);
    });

    /**
     * @tc.name   MapKeysTest025
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0025
     * @tc.desc   Iterator of multi-key Map returns keys in insertion order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest025: number[] = MapKeysTest025();
      expect(keysTest025).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   MapKeysTest027
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0027
     * @tc.desc   Iterator can be converted to array via Array.from
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[true, 1], [false, 2]]);
      const keys = Array.from(map.keys());
      expect(keys).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   MapKeysTest028
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0028
     * @tc.desc   Multiple calls to keys() on the same Map return different iterators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[1, 'a']]);
      const iterator1 = map.keys();
      const iterator2 = map.keys();
      expect(iterator1 === iterator2).assertEqual(false);
    });

    /**
     * @tc.name   MapKeysTest029
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0029
     * @tc.desc   New keys added during iteration are not included in the iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest029 = MapKeysTest029();
      expect(keysTest029).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   MapKeysTest030
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0030
     * @tc.desc   Deleting already iterated keys during iteration doesn't affect subsequent iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest030 = MapKeysTest030();
      expect(keysTest030).assertDeepEquals([2]);
    });

    /**
     * @tc.name   MapKeysTest031
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0031
     * @tc.desc   Deleting uniterated keys during iteration prevents them from being returned
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest031 = MapKeysTest031();
      expect(keysTest031).assertDeepEquals([1]);
    });

    /**
     * @tc.name   MapKeysTest032
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0032
     * @tc.desc   No results when iterating again after iterator has been traversed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest032 = MapKeysTest032();
      expect(keysTest032).assertDeepEquals([]);
    });

    /**
     * @tc.name   MapKeysTest033
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0033
     * @tc.desc   When key is NaN, keys() correctly returns NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest033: number = MapKeysTest033();
      expect(Number.isNaN(keysTest033)).assertEqual(true);
    });

    /**
     * @tc.name   MapKeysTest034
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0034
     * @tc.desc   When keys are 0 and -0, keys() treats them as the same key (only first retained)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest034 = MapKeysTest034();
      expect(keysTest034.length).assertEqual(1);
      expect(keysTest034[0]).assertEqual(0);
    });

    /**
     * @tc.name   MapKeysTest035
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0035
     * @tc.desc   When keys are Date objects, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest035 = MapKeysTest035();
      expect(keysTest035.keys[0]).assertEqual(keysTest035.date);
      expect(keysTest035.keys[0].getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.name   MapKeysTest036
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0036
     * @tc.desc   When keys are RegExp objects, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest036 = MapKeysTest036();
      expect(keysTest036.keys[0]).assertEqual(keysTest036.regex);
      expect(keysTest036.keys[0].test('test')).assertEqual(true);
    });

    /**
     * @tc.name   MapKeysTest037
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0037
     * @tc.desc   When key is the Map itself, keys() returns self reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest037 = MapKeysTest037();
      expect(keysTest037.keys[0]).assertEqual(keysTest037.map);
    });

    /**
     * @tc.name   MapKeysTest038
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0038
     * @tc.desc   When keys are Set objects, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest038 = MapKeysTest038();
      expect(keysTest038.keys[0]).assertEqual(keysTest038.set);
      expect(keysTest038.keys[0].has(1)).assertEqual(true);
    });

    /**
     * @tc.name   MapKeysTest039
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0039
     * @tc.desc   keys() works correctly in strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest039 = MapKeysTest039();
      expect(keysTest039).assertDeepEquals(['strict']);
    });

    /**
     * @tc.name   MapKeysTest040
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0040
     * @tc.desc   Iterator can be used with destructuring assignment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest040 = MapKeysTest040();
      expect(keysTest040.k1).assertEqual(1);
      expect(keysTest040.k2).assertEqual(2);
      expect(keysTest040.k3).assertEqual(3);
    });
    /**
     * @tc.name   MapKeysTest041
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0041
     * @tc.desc   Iterator used with spread operator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest041 = MapKeysTest041();
      expect(keysTest041).assertDeepEquals(['x', 'y']);
    });

    /**
     * @tc.name   MapKeysTest042
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0042
     * @tc.desc   When keys are nested arrays, keys() retains original references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest042 = MapKeysTest042();
      expect(keysTest042.keys[0]).assertEqual(keysTest042.nestedArr);
      expect(keysTest042.keys[0][0][0]).assertEqual(1);
    });

    /**
     * @tc.name   MapKeysTest043
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0043
     * @tc.desc   Iterator traversed step by step in a for loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[10, 'a'], [20, 'b'], [30, 'c']]);
      const iterator: IterableIterator<number> = map.keys();
      const result: number[] = [];
      for (let i = 0; i < 3; i++) {
        result.push(iterator.next().value);
      }
      expect(result).assertDeepEquals([10, 20, 30]);
    });

    /**
     * @tc.name   MapKeysTest044
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0044
     * @tc.desc   Number objects (new Number()) and primitive numbers coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest044 = MapKeysTest044();
      console.log('11111111111111111', keysTest044.keys.length)
      expect(keysTest044.keys.length).assertEqual(2);
      expect(keysTest044.keys[0]).assertEqual(keysTest044.numObj);
      expect(keysTest044.keys[1]).assertEqual(5);
    });

    /**
     * @tc.name   MapKeysTest045
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0045
     * @tc.desc   Iterator terminates after calling return()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const map = new Map([[1, 'a'], [2, 'b'], [3, 'c']]);
      const iterator = map.keys();
      iterator.next(); // {value:1, done:false}
      if (iterator.return) {
        iterator.return(); // Terminate iteration
      }
      expect(iterator.next().done).assertEqual(false);
    });

    /**
     * @tc.name   MapKeysTest046
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0046
     * @tc.desc   String objects (new String()) and primitive strings coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest046 = MapKeysTest046();
      expect(keysTest046.keys.length).assertEqual(2);
      expect(keysTest046.keys[0]).assertEqual(keysTest046.strObj);
      expect(keysTest046.keys[1]).assertEqual('test');
    });

    /**
     * @tc.name   MapKeysTest047
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0047
     * @tc.desc   Iteration order of keys() for large Map (1000 keys)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest047', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const map: Map<number, number> = new Map();
      const expectedKeys: number[] = [];
      for (let i = 0; i < 1000; i++) {
        expectedKeys.push(i);
        map.set(i, i * 10);
      }
      expect(Array.from(map.keys())).assertDeepEquals(expectedKeys);
    });

    /**
     * @tc.name   MapKeysTest048
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0048
     * @tc.desc   Boolean objects (new Boolean()) and primitive booleans coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const boolObj = new Boolean(true);
      const map = new Map([[boolObj, 'obj'], [true, 'prim']]);
      const keys = Array.from(map.keys());
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(boolObj);
      expect(keys[1]).assertEqual(true);
    });

    /**
     * @tc.name   MapKeysTest049
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0049
     * @tc.desc   Iterator used as parameter to Array.from with mapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[2, 'a'], [3, 'b'], [4, 'c']]);
      const doubled = Array.from(map.keys(), k => k * 2);
      expect(doubled).assertDeepEquals([4, 6, 8]);
    });

    /**
     * @tc.name   MapKeysTest050
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0050
     * @tc.desc   When keys are Error objects, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const error = new Error('test');
      const map = new Map([[error, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(error);
      expect(keys[0].message).assertEqual('test');
    });
    /**
     * @tc.name   MapKeysTest051
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0051
     * @tc.desc   When keys are array-like objects, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest051 = MapKeysTest051()
      expect(keysTest051.keys[0]).assertEqual(keysTest051.arrayLike);
      expect(keysTest051.keys[0][0]).assertEqual('a');
    });

    /**
     * @tc.name   MapKeysTest052
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0052
     * @tc.desc   When keys are WeakMap instances (non-iterable but usable as keys)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest052 = MapKeysTest052()
      expect(keysTest052.keys[0]).assertEqual(keysTest052.weakMap);
    });

    /**
     * @tc.name   MapKeysTest053
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0053
     * @tc.desc   Iterator compatible with for-await-of (non-async iterator scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      const keys: number[] = [];
      for await (const key of map.keys()) {
        keys.push(key);
      }
      expect(keys).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   MapKeysTest054
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0054
     * @tc.desc   When keys are shared Symbols created with Symbol.for
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest054 = MapKeysTest054()
      expect(keysTest054.keys[0] == keysTest054.s2).assertEqual(true);
    });

    /**
     * @tc.name   MapKeysTest055
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0055
     * @tc.desc   When key is negative BigInt, keys() returns it correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const b = -42n;
      const map = new Map([[b, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(-42n);
    });

    /**
     * @tc.name   MapKeysTest056
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0056
     * @tc.desc   The Symbol.iterator property of the iterator points to itself
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest056 = MapKeysTest056()
      expect(keysTest056.keys1).assertEqual(keysTest056.iterator);
    });


    /**
     * @tc.name   MapKeysTest058
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0058
     * @tc.desc   null and string 'null' coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[null, 1], ['null', 2]]);
      const keys = Array.from(map.keys());
      expect(keys).assertDeepEquals([null, 'null']);
    });

    /**
     * @tc.name   MapKeysTest059
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0059
     * @tc.desc   undefined and string 'undefined' coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[undefined, 1], ['undefined', 2]]);
      const keys = Array.from(map.keys());
      expect(keys).assertDeepEquals([undefined, 'undefined']);
    });

    /**
     * @tc.name   MapKeysTest060
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0060
     * @tc.desc   No results when iterating after Map is cleared
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      const iterator = map.keys();
      map.clear(); // Clear the Map
      expect(Array.from(iterator)).assertDeepEquals([]);
    });

    /**
     * @tc.name   MapKeysTest061
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0061
     * @tc.desc   When keys are generator functions, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest061 = MapKeysTest061()
      expect(keysTest061.keys[0]).assertEqual(keysTest061.generator);
    });

    /**
     * @tc.name   MapKeysTest062
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0062
     * @tc.desc   When keys are Promise objects, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const promise = Promise.resolve();
      const map = new Map([[promise, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(promise);
    });

    /**
     * @tc.name   MapKeysTest063
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0063
     * @tc.desc   When key is Infinity, keys() returns it correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const inf = Infinity;
      const map = new Map([[inf, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(Infinity);
    });

    /**
     * @tc.name   MapKeysTest064
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0064
     * @tc.desc   When key is -Infinity, keys() returns it correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const negInf = -Infinity;
      const map = new Map([[negInf, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(-Infinity);
    });

    /**
     * @tc.name   MapKeysTest065
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0065
     * @tc.desc   Multiple NaN values as keys are treated as the same key (only first retained)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const map = new Map([[NaN, 1], [NaN, 2]]); // Two NaNs treated as same key
      const keys = Array.from(map.keys());
      expect(keys.length).assertEqual(1);
      expect(Number.isNaN(keys[0])).assertEqual(true);
    });

    /**
     * @tc.name   MapKeysTest066
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0066
     * @tc.desc   Arrays and array-like objects coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest066 = MapKeysTest066();
      expect(keysTest066.keys).assertDeepEquals(keysTest066.keys1);
    });

    /**
     * @tc.name   MapKeysTest067
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0067
     * @tc.desc   Iterator used with Array.prototype.map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([['a', 1], ['b', 2]]);
      const uppercased = Array.from(map.keys()).map(k => k.toUpperCase());
      expect(uppercased).assertDeepEquals(['A', 'B']);
    });

    /**
     * @tc.name   MapKeysTest068
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0068
     * @tc.desc   Number objects and BigInt coexist as keys (5 vs 5n)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest068 = MapKeysTest068();
      expect(keysTest068.keys.length).assertEqual(2);
      expect(keysTest068.keys[0]).assertEqual(keysTest068.numObj);
      expect(keysTest068.keys[1]).assertEqual(5n);
    });

    /**
     * @tc.name   MapKeysTest069
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0069
     * @tc.desc   When keys are proxy objects, keys() returns proxy references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest069 = MapKeysTest069();
      expect(keysTest069.keys[0]).assertEqual(keysTest069.proxy);
    });

    /**
     * @tc.name   MapKeysTest070
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0070
     * @tc.desc   keys() iterator of empty Map equals empty array iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest070 = MapKeysTest070();
      expect(keysTest070.mapKeys).assertDeepEquals(keysTest070.emptyArr);
    });

    /**
     * @tc.name   MapKeysTest071
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0071
     * @tc.desc   When keys are circular reference objects, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest071 = MapKeysTest071();
      expect(keysTest071.keys[0]).assertEqual(keysTest071.obj);
      expect(keysTest071.keys[0].self).assertEqual(keysTest071.obj);
    });

    /**
     * @tc.name   MapKeysTest072
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0072
     * @tc.desc   When keys are Intl objects (e.g., DateTimeFormat)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const intlObj = new Intl.DateTimeFormat();
      const map = new Map([[intlObj, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(intlObj);
    });

    /**
     * @tc.name   MapKeysTest073
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0073
     * @tc.desc   Iterators remain independent after Map is copied
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const original = new Map([[1, 'a'], [2, 'b']]);
      const copy = new Map(original); // Copy the Map
      const originalKeys = Array.from(original.keys());
      const copyKeys = Array.from(copy.keys());
      expect(originalKeys).assertDeepEquals(copyKeys); // Same key values
      original.delete(1); // Modify original Map
      expect(copyKeys).assertDeepEquals([1, 2]); // Copied Map unaffected
    });

    /**
     * @tc.name   MapKeysTest074
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0074
     * @tc.desc   Symbols and numbers coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest074 = MapKeysTest074();
      expect(JSON.stringify(keysTest074.keys)).assertDeepEquals(JSON.stringify([keysTest074.s, 123]));
    });




    /**
     * @tc.name   MapKeysTest075
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0075
     * @tc.desc   Functions and string 'function' coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest075 = MapKeysTest075();
      expect(keysTest075.keys).assertDeepEquals([keysTest075.fn, 'function']);
    });

    /**
     * @tc.name   MapKeysTest076
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0076
     * @tc.desc   Iterator used with conditional filtering
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[1, 'a'], [3, 'b'], [5, 'c']]);
      const oddKeys = Array.from(map.keys()).filter(k => k % 2 === 1);
      expect(oddKeys).assertDeepEquals([1, 3, 5]);
    });

    /**
     * @tc.name   MapKeysTest077
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0077
     * @tc.desc   When keys are ArrayBuffer objects, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const buffer = new ArrayBuffer(8);
      const map = new Map([[buffer, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(buffer);
      expect(keys[0].byteLength).assertEqual(8);
    });

    /**
     * @tc.name   MapKeysTest078
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0078
     * @tc.desc   When keys are DataView objects, keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const view = new DataView(new ArrayBuffer(8));
      const map = new Map([[view, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(view);
    });

    /**
     * @tc.name   MapKeysTest079
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0079
     * @tc.desc   When keys are TypedArrays (e.g., Uint8Array), keys() retains references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const typedArr = new Uint8Array([1, 2, 3]);
      const map = new Map([[typedArr, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(typedArr);
      expect(keys[0][0]).assertEqual(1);
    });

    /**
     * @tc.name   MapKeysTest080
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0080
     * @tc.desc   Keys are those returned by the Map's entries iterator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      const entryKey = Array.from(map.entries())[0][0]; // Get first key
      const keyMap = new Map([[entryKey, 'value']]);
      expect(Array.from(keyMap.keys())[0]).assertEqual(1);
    });

    /**
     * @tc.name   MapKeysTest081
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0081
     * @tc.desc   Mix of string primitives and string objects as keys (primitive first)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const str = 'test';
      const strObj = new String('test');
      const map = new Map([[str, 1], [strObj, 2]]);
      const keys = Array.from(map.keys());
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual('test');
      expect(keys[1]).assertEqual(strObj);
    });

    /**
     * @tc.name   MapKeysTest082
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0082
     * @tc.desc   Mix of number primitives and number objects as keys (object first)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const numObj = new Number(10);
      const num = 10;
      const map = new Map([[numObj, 1], [num, 2]]);
      const keys = Array.from(map.keys());
      expect(keys.length).assertEqual(2);
      expect(keys[0]).assertEqual(numObj);
      expect(keys[1]).assertEqual(10);
    });

    /**
     * @tc.name   MapKeysTest083
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0083
     * @tc.desc   Iterator works correctly in nested Maps
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const innerMap = new Map([['a', 1]]);
      const outerMap = new Map([[innerMap, 'value']]);
      const keys = Array.from(outerMap.keys());
      expect(keys[0]).assertEqual(innerMap);
      expect(Array.from(keys[0].keys())).assertDeepEquals(['a']);
    });

    /**
     * @tc.name   MapKeysTest084
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0084
     * @tc.desc   When key is Math object, keys() retains reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[Math, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(Math);
      expect(keys[0].PI).assertEqual(Math.PI);
    });

    /**
     * @tc.name   MapKeysTest085
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0085
     * @tc.desc   When key is JSON object, keys() retains reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[JSON, 'value']]);
      const keys = Array.from(map.keys());
      expect(keys[0]).assertEqual(JSON);
    });


    /**
     * @tc.name   MapKeysTest087
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0087
     * @tc.desc   Date strings and Date objects coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest087 = MapKeysTest087();
      expect(keysTest087.keys).assertDeepEquals(keysTest087.keys1);
    });

    /**
     * @tc.name   MapKeysTest088
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0088
     * @tc.desc   Iterator used with Array.prototype.includes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[10, 'a'], [20, 'b'], [30, 'c']]);
      const keys = Array.from(map.keys());
      expect(keys.includes(20)).assertEqual(true);
      expect(keys.includes(40)).assertEqual(false);
    });

    /**
     * @tc.name   MapKeysTest089
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0089
     * @tc.desc   RegExp and string with same pattern coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest089 = MapKeysTest089();
      expect(keysTest089.keys).assertDeepEquals(keysTest089.keys1);
    });

    /**
     * @tc.name   MapKeysTest090
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0090
     * @tc.desc   Iterator returns original reference after key object's properties are modified
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest090 = MapKeysTest090();
      expect(keysTest090.keys[0]).assertEqual(keysTest090.obj);
      expect(keysTest090.keys[0].prop).assertEqual('new');
    });

    /**
     * @tc.name   MapKeysTest091
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0091
     * @tc.desc   Multiple Set objects with same content (different references) as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const s1 = new Set([1, 2]);
      const s2 = new Set([1, 2]); // Same content, different reference
      const map = new Map([[s1, 1], [s2, 2]]);
      const keys = Array.from(map.keys());
      expect(keys.length).assertEqual(2);
      expect(keys[0] === keys[1]).assertFalse();
    });


    /**
     * @tc.name   MapKeysTest094
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0094
     * @tc.desc   Iterator used with spread operator in nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const map = new Map([[1, 'a'], [2, 'b']]);
      const nested = [Array.from(map.keys())];
      expect(nested).assertDeepEquals([[1, 2]]);
    });

    /**
     * @tc.name   MapKeysTest095
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0095
     * @tc.desc   Error objects and error message strings coexist as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keysTest095 = MapKeysTest095();
      expect(keysTest095.keys).assertDeepEquals(keysTest095.keys1);
    });

    /**
     * @tc.name   MapKeysTest096
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0096
     * @tc.desc   BigInt and its string representation coexist as keys (42n vs '42n')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const keysTest096 = MapKeysTest096();

      expect(typeof keysTest096.keys[0]).assertEqual('bigint');
      expect(keysTest096.keys[0]).assertEqual(42n);

      expect(typeof keysTest096.keys[1]).assertEqual('string');
      expect(keysTest096.keys[1]).assertEqual('42n');
    });


    /**
     * @tc.name   MapKeysTest097
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0097
     * @tc.desc   Iterator returns new keys after Map keys are replaced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const map = new Map([[1, 'a']]);
      map.delete(1); // Delete original key
      map.set(2, 'b'); // Add new key
      expect(Array.from(map.keys())).assertDeepEquals([2]);
    });

    /**
     * @tc.name   MapKeysTest098
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0098
     * @tc.desc   Multiple arrays of different lengths as keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapKeysTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const a1 = [1];
      const a2 = [1, 2];
      const a3 = [1, 2, 3];
      const map = new Map([[a1, 1], [a2, 2], [a3, 3]]);
      const keys = Array.from(map.keys());
      expect(keys).assertDeepEquals([a1, a2, a3]);
    });

    /**
     * @tc.name   MapKeysTest099
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0099
     * @tc.desc   When key is Symbol.iterator (special Symbol)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let keysTest099 = MapKeysTest099();
      expect(keysTest099.keys[0] === keysTest099.sym).assertTrue();
    });

    /**
     * @tc.name   MapKeysTest0100
     * @tc.number SUB_BUILTINS_MAP_KEYS_TEST_0100
     * @tc.desc   Verification of iteration order for mixed type keys
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('MapKeysTest0100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      let keysTest0100 = MapKeysTest0100();
      expect(keysTest0100.keys === keysTest0100.expectedKeys).assertFalse();
    });

  })
}