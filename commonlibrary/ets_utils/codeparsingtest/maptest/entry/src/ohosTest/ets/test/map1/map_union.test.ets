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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  getUnionMap,
  getUnionMapTh,
  MapUnionTest004,
  MapUnionTest010,
  MapUnionTest012,
  MapUnionTest018,
  MapUnionTest019,
  MapUnionTest025,
  MapUnionTest026,
  MapUnionTest037,
  MapUnionTest041,
  MapUnionTest058
} from './map_union';

export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

interface BaseI {
  name?: string;
  id?: number | string;
  value?: string;
  tagName?: string;
  b?: number;
  a?: BaseI;
}

export default function MapUnionTest() {
  describe('SetUnionTest', () => {
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
     * @tc.number MAP_UNION_TEST_001
     * @tc.name MapUnionTest001
     * @tc.desc Union of two non-empty Maps (no duplicate keys)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapUnionTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b']]);
      const map2 = new Map([[3, 'c'], [4, 'd']]);

      const union = getUnionMap(map1, map2) as Map<number, string>;

      expect(union.size).assertEqual(4);
      expect(union.get(1)).assertEqual('a');
      expect(union.get(3)).assertEqual('c');
      expect(union.has(4)).assertTrue();
    });

    /**
     * @tc.number MAP_UNION_TEST_002
     * @tc.name MapUnionTest002
     * @tc.desc Union of two Maps (with duplicate keys, latter overwrites former)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapUnionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b']]);
      const map2 = new Map([[2, 'x'], [3, 'c']]);

      const union = getUnionMap(map1, map2) as Map<number, string>;

      expect(union.size).assertEqual(3);
      expect(union.get(2)).assertEqual('x');
      expect(union.get(1)).assertEqual('a');
      expect(union.get(3)).assertEqual('c');
    });

    /**
     * @tc.number MAP_UNION_TEST_003
     * @tc.name MapUnionTest003
     * @tc.desc Union of empty Map and non-empty Map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('MapUnionTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const emptyMap = new Map<number, string>();
      const nonEmptyMap = new Map([[1, 'a'], [2, 'b']]);

      const union1 = getUnionMap(emptyMap, nonEmptyMap) as Map<number, string>;
      const union2 = getUnionMap(nonEmptyMap, emptyMap) as Map<number, string>;

      expect(union1.size).assertEqual(2);
      expect(union2.size).assertEqual(2);
      expect(union1.get(1)).assertEqual(union2.get(1));
    });

    /**
     * @tc.number MAP_UNION_TEST_004
     * @tc.name MapUnionTest004
     * @tc.desc Union of Maps with multi-type keys (object keys, Symbol keys, etc.)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = MapUnionTest004();

      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual('updated object');
      expect(result[2]).assertEqual('symbol value');
      expect(result[3]).assertEqual('null value');
    });

    /**
     * @tc.number MAP_UNION_TEST_005
     * @tc.name MapUnionTest005
     * @tc.desc Union of three or more Maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, 'a']]);
      const map2 = new Map([[2, 'b'], [3, 'c']]);
      const map3 = new Map([[3, 'x'], [4, 'd']]);

      const union = getUnionMapTh(map1, map2, map3) as Map<number, string>;

      expect(union.size).assertEqual(4);
      expect(union.get(3)).assertEqual('x');
      expect(union.get(4)).assertEqual('d');
    });
    /**
     * @tc.number MAP_UNION_TEST_006
     * @tc.name MapUnionTest006
     * @tc.desc Union of Maps with special key types (NaN, 0, -0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[NaN, 'nan1'], [0, 'zero']]);
      const map2 = new Map([[NaN, 'nan2'], [-0, 'negZero']]);

      const union = getUnionMap(map1, map2) as Map<number, string>;

      expect(union.size).assertEqual(2); // NaN and 0/-0 are considered same keys
      expect(union.get(NaN)).assertEqual('nan2'); // Latter NaN overwrites former
      expect(union.get(0)).assertEqual('negZero'); // -0 overwrites 0
    });

    /**
     * @tc.number MAP_UNION_TEST_007
     * @tc.name MapUnionTest007
     * @tc.desc Union with Map containing complex object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: BaseI = { name: 'obj1' };
      const obj2: BaseI = { name: 'obj2' };
      const obj3: BaseI = { name: 'obj3' };

      const map1 = new Map([[1, obj1], [2, obj2]]);
      const map2 = new Map([[2, obj3], [3, obj1]]);

      const union = getUnionMap(map1, map2) as Map<number, string>;

      expect(union.size).assertEqual(3);
      expect(union.get(2)).assertEqual(obj3); // Overwritten object reference
      expect(union.get(3)).assertEqual(obj1); // Shared object reference preserved
    });

    /**
     * @tc.number MAP_UNION_TEST_008
     * @tc.name MapUnionTest008
     * @tc.desc Union of Maps after modifying original Maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, 'a']]);
      const map2 = new Map([[2, 'b']]);

      // Create union first
      const union = getUnionMap(map1, map2) as Map<number, string>;

      // Modify original maps after union creation
      map1.set(1, 'modified');
      map2.set(3, 'c');

      // Union should remain unchanged
      expect(union.get(1)).assertEqual('a');
      expect(union.has(3)).assertFalse();
      expect(union.size).assertEqual(2);
    });

    /**
     * @tc.number MAP_UNION_TEST_009
     * @tc.name MapUnionTest009
     * @tc.desc Union combined with forEach to process values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 10], [2, 20]]);
      const map2 = new Map([[2, 30], [3, 40]]);

      const union = getUnionMap(map1, map2) as Map<number, number>;
      const summedValues: number[] = [];

      // Use forEach to process union values
      union.forEach((value) => {
        summedValues.push(value * 2);
      });

      expect(summedValues).assertDeepEquals([20, 60, 80]); // 10*2, 30*2, 40*2
      expect(summedValues.length).assertEqual(3);
    });

    /**
     * @tc.number MAP_UNION_TEST_010
     * @tc.name MapUnionTest010
     * @tc.desc Union with conditional filtering during creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 'apple'], [2, 'banana'], [3, 'cherry']]);
      const map2 = new Map([[3, 'date'], [4, 'elderberry'], [5, 'fig']]);

      // Create union with filter (exclude entries where value length < 5)
      const union = MapUnionTest010(map1, map2) as Map<number, string>;

      expect(union.size).assertEqual(4);
      expect(union.has(1)).assertTrue(); // 'apple' length 5 is included (edge case)
      expect(union.has(2)).assertTrue(); // 'banana' length 6
      expect(union.get(3)).assertEqual('cherry'); // Filtered union still overwrites
      expect(union.has(5)).assertFalse(); // 'fig' length 3 excluded
    });

    /**
     * @tc.number MAP_UNION_TEST_011
     * @tc.name MapUnionTest011
     * @tc.desc Union of Maps with nested Map values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const nestedMap1 = new Map([['a', 1]]);
      const nestedMap2 = new Map([['b', 2]]);
      const nestedMap3 = new Map([['a', 3], ['c', 4]]);

      const map1 = new Map([[1, nestedMap1], [2, nestedMap2]]);
      const map2 = new Map([[2, nestedMap3], [3, nestedMap1]]);

      const union = getUnionMap(map1, map2) as Map<number, Map<string, number>>;

      expect(union.size).assertEqual(3);
      expect(union.get(2)!.size).assertEqual(2); // nestedMap3 has 2 entries
      expect(union.get(2)!.get('a')).assertEqual(3); // Nested union behavior
      expect(union.get(3)).assertEqual(nestedMap1); // Preserved reference
    });

    /**
     * @tc.number MAP_UNION_TEST_012
     * @tc.name MapUnionTest012
     * @tc.desc Union with entries converted from object and array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const union = MapUnionTest012() as Map<string, string>;

      expect(union.size).assertEqual(3);
      expect(union.get('y')).assertEqual('y-updated'); // Overwritten by array entry
      expect(union.get('x')).assertEqual('x-value');
      expect(union.get('z')).assertEqual('z-value');
    });
    /**
     * @tc.number MAP_UNION_TEST_013
     * @tc.name MapUnionTest013
     * @tc.desc Union of Maps with function values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func1 = () => 'func1';
      const func2 = () => 'func2';
      const func3 = () => 'func3';

      const map1 = new Map([[1, func1], [2, func2]]);
      const map2 = new Map([[2, func3], [3, func1]]);

      const union = getUnionMap(map1, map2) as Map<number, Function>;

      expect(union.size).assertEqual(3);
      expect(union.get(2)!()).assertEqual('func3'); // Overwritten function
      expect(union.get(3)!()).assertEqual('func1'); // Preserved function reference
      expect(union.get(1)).assertEqual(func1);
    });

    /**
     * @tc.number MAP_UNION_TEST_014
     * @tc.name MapUnionTest014
     * @tc.desc Union with Maps containing large number of entries
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest014', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const map1 = new Map<number, string>();
      const map2 = new Map<number, string>();

      // Populate maps with 1000 entries each (500 unique in each)
      for (let i = 0; i < 1000; i++) {
        map1.set(i, `value-${i}`);
        map2.set(i + 500, `value-${i + 500}`);
      }

      const union = getUnionMap(map1, map2) as Map<number, string>;

      expect(union.size).assertEqual(1500); // 1000 + 500 unique entries
      expect(union.get(0)).assertEqual('value-0');
      expect(union.get(1499)).assertEqual('value-1499');
      expect(union.get(750)).assertEqual('value-750'); // From map2
    });

    /**
     * @tc.number MAP_UNION_TEST_015
     * @tc.name MapUnionTest015
     * @tc.desc Union combined with entries() and keys() iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b']]);
      const map2 = new Map([[2, 'c'], [3, 'd']]);

      const union = getUnionMap(map1, map2) as Map<number, string>;

      // Collect keys using keys() iterator
      const unionKeys = Array.from(union.keys());
      // Collect entries using entries() iterator
      const unionEntries = Array.from(union.entries());

      expect(unionKeys).assertDeepEquals([1, 2, 3]);
      expect(unionEntries).assertDeepEquals([[1, 'a'], [2, 'c'], [3, 'd']]);
      expect(unionEntries.length).assertEqual(union.size);
    });

    /**
     * @tc.number MAP_UNION_TEST_016
     * @tc.name MapUnionTest016
     * @tc.desc Union of Maps with null and undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, null], [2, undefined], [3, 'valid']]);
      const map2 = new Map([[2, null], [4, undefined], [1, 'defined']]);

      const union = getUnionMap(map1, map2) as Map<number, string | null | undefined>;

      expect(union.size).assertEqual(4);
      expect(union.get(1)).assertEqual('defined'); // Overwritten from null
      expect(union.get(2)).assertEqual(null); // Overwritten from undefined
      expect(union.get(4)).assertEqual(undefined);
    });

    /**
     * @tc.number MAP_UNION_TEST_017
     * @tc.name MapUnionTest017
     * @tc.desc Union with Maps and subsequent delete operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b']]);
      const map2 = new Map([[3, 'c'], [4, 'd']]);

      const union = getUnionMap(map1, map2) as Map<number, string>;

      // Delete entries from union
      union.delete(2);
      union.delete(3);

      expect(union.size).assertEqual(2);
      expect(union.has(2)).assertFalse();
      expect(union.get(4)).assertEqual('d');

      // Original maps should remain unchanged
      expect(map1.has(2)).assertTrue();
      expect(map2.has(3)).assertTrue();
    });

    /**
     * @tc.number MAP_UNION_TEST_018
     * @tc.name MapUnionTest018
     * @tc.desc Union of Maps with BigInt and Symbol keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const union = MapUnionTest018();

      expect(union[0]).assertEqual(4);
      expect(union[1]).assertEqual('bigint-100-updated');
      expect(union[2]).assertEqual('symbol-2');
    });

    /**
     * @tc.number MAP_UNION_TEST_019
     * @tc.name MapUnionTest019
     * @tc.desc Union with Maps and value transformation during creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 10], [2, 20]]);
      const map2 = new Map([[2, 30], [3, 40]]);

      // Create union with value transformation (multiply by 10)
      const transformedUnion = MapUnionTest019(map1, map2) as Map<number, number>;

      expect(transformedUnion.get(1)).assertEqual(100);
      expect(transformedUnion.get(2)).assertEqual(300); // Transformed after overwrite
      expect(transformedUnion.get(3)).assertEqual(400);
    });

    /**
     * @tc.number MAP_UNION_TEST_020
     * @tc.name MapUnionTest020
     * @tc.desc Union of Maps with Date object keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 0, 2);
      const date3 = new Date(2023, 0, 1); // Same as date1 but different instance

      const map1 = new Map([[date1, 'Jan 1'], [date2, 'Jan 2']]);
      const map2 = new Map([[date3, 'Jan 1 updated'], [new Date(2023, 0, 3), 'Jan 3']]);

      const union = getUnionMap(map1, map2) as Map<Date, string>;

      expect(union.size).assertEqual(4); // date1 and date3 are different keys
      expect(union.get(date1)).assertEqual('Jan 1');
      expect(union.get(date3)).assertEqual('Jan 1 updated');
      expect(union.get(new Date(2023, 0, 3))).assertEqual(undefined); // New Date instance is different key
    });
    /**
     * @tc.number MAP_UNION_TEST_021
     * @tc.name MapUnionTest021
     * @tc.desc Union of Maps with RegExp keys and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const regex1 = /test/;
      const regex2 = /test/g;
      const regex3 = /test/; // Same pattern as regex1 but different instance

      const map1 = new Map([[regex1, 'regex1 value'], [regex2, 'regex2 value']]);
      const map2 = new Map([[regex3, 'regex3 value'], [/new/, 'new regex value']]);

      const union = getUnionMap(map1, map2) as Map<RegExp, string>;

      expect(union.size).assertEqual(4); // All regex instances are distinct keys
      expect(union.get(regex1)).assertEqual('regex1 value');
      expect(union.get(regex3)).assertEqual('regex3 value');
      expect(union.get(/new/)).assertEqual(undefined); // New RegExp instance is different key
    });

    /**
     * @tc.number MAP_UNION_TEST_022
     * @tc.name MapUnionTest022
     * @tc.desc Union with Maps and check using has() method after union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b'], [5, 'e']]);
      const map2 = new Map([[3, 'c'], [4, 'd'], [5, 'f']]);

      const union = getUnionMap(map1, map2) as Map<number, string>;

      // Verify existence using has()
      expect(union.has(1)).assertTrue();
      expect(union.has(3)).assertTrue();
      expect(union.has(5)).assertTrue();
      expect(union.has(6)).assertFalse();

      // Check values for existing keys
      expect(union.has(5) && union.get(5) === 'f').assertTrue();
    });

    /**
     * @tc.number MAP_UNION_TEST_023
     * @tc.name MapUnionTest023
     * @tc.desc Union of Maps with array keys (reference comparison)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const arr1 = [1, 2];
      const arr2 = [3, 4];
      const arr3 = [1, 2]; // Same content as arr1 but different reference

      const map1 = new Map([[arr1, 'arr1'], [arr2, 'arr2']]);
      const map2 = new Map([[arr3, 'arr3'], [arr2, 'arr2-updated']]);

      const union = getUnionMap(map1, map2) as Map<number[], string>;

      expect(union.size).assertEqual(3); // arr1 and arr3 are distinct keys
      expect(union.get(arr1)).assertEqual('arr1');
      expect(union.get(arr3)).assertEqual('arr3');
      expect(union.get(arr2)).assertEqual('arr2-updated'); // Overwritten
    });

    /**
     * @tc.number MAP_UNION_TEST_024
     * @tc.name MapUnionTest024
     * @tc.desc Union combined with values() iterator and array methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 10], [2, 20], [3, 30]]);
      const map2 = new Map([[3, 40], [4, 50], [5, 60]]);

      const union = getUnionMap(map1, map2) as Map<number, number>;

      // Get values and use array methods
      const unionValues = Array.from(union.values());
      const sum = unionValues.reduce((acc: number, val: number) => acc + val, 0);
      const filtered = unionValues.filter(val => val > 30);

      expect(sum).assertEqual(10 + 20 + 40 + 50 + 60); // 180
      expect(filtered).assertDeepEquals([40, 50, 60]);
    });

    /**
     * @tc.number MAP_UNION_TEST_025
     * @tc.name MapUnionTest025
     * @tc.desc Union of Maps with frozen objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const union = MapUnionTest025();

      expect(union[0]).assertEqual(3); // frozen1 and frozen3 are distinct keys
      expect(union[1]).assertEqual('frozen1');
      expect(union[2]).assertEqual('frozen3');
      expect(union[3]).assertEqual('frozen2-updated');
    });

    /**
     * @tc.number MAP_UNION_TEST_026
     * @tc.name MapUnionTest026
     * @tc.desc Union of Maps with cyclic reference values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const union = MapUnionTest026() as (string | number | boolean)[];

      expect(union[0]).assertEqual(3);
      expect(union[1]).assertEqual(true); // Preserved cyclic reference
      expect(union[2]).assertEqual('cyclic2'); // Overwritten
      expect(union[3]).assertEqual(true); // Shared reference
    });

    /**
     * @tc.number MAP_UNION_TEST_027
     * @tc.name MapUnionTest027
     * @tc.desc Union of subclassed Maps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {

      // Define Map subclass
      class MyMap extends Map<number, string> {
        customProp = 'custom';

        getCustom() {
          return this.customProp;
        }

        constructor(entries?: Iterable<readonly [number, string]>) {
          super(entries); // 调用父类 Map 的构造函数，传递参数
        }
      }

      const subMap1 = new MyMap([[1, 'a'], [2, 'b']]);
      const subMap2 = new MyMap([[2, 'x'], [3, 'c']]);

      // Union of subclasses (result is base Map)
      const union = getUnionMap(subMap1, subMap2) as Map<number, string>;

      expect(union instanceof Map).assertTrue();
      expect(union instanceof MyMap).assertFalse(); // Union is not a subclass instance
      expect(union.size).assertEqual(3);
      expect(union.get(2)).assertEqual('x');
    });

    /**
     * @tc.number MAP_UNION_TEST_028
     * @tc.name MapUnionTest028
     * @tc.desc Union with Maps and then clear() the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b']]);
      const map2 = new Map([[3, 'c'], [4, 'd']]);

      const union = getUnionMap(map1, map2) as Map<number, string>;
      expect(union.size).assertEqual(4);

      // Clear the union
      union.clear();

      expect(union.size).assertEqual(0);
      expect(union.has(1)).assertFalse();
      // Original maps remain intact
      expect(map1.size).assertEqual(2);
      expect(map2.size).assertEqual(2);
    });

    /**
     * @tc.number MAP_UNION_TEST_029
     * @tc.name MapUnionTest029
     * @tc.desc Union of Maps with Unicode string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([
        ['café', 'coffee'],
        ['cafè', 'coffee (italian)'], // Different Unicode character
        ['π', 'pi']
      ]);
      const map2 = new Map([
        ['café', 'coffee (updated)'],
        ['µ', 'micro'],
        ['π', 'pi (greek)']
      ]);

      const union = getUnionMap(map1, map2) as Map<string, string>;

      expect(union.size).assertEqual(4);
      expect(union.get('café')).assertEqual('coffee (updated)');
      expect(union.get('cafè')).assertEqual('coffee (italian)'); // Preserved as distinct key
      expect(union.get('π')).assertEqual('pi (greek)');
    });

    /**
     * @tc.number MAP_UNION_TEST_030
     * @tc.name MapUnionTest030
     * @tc.desc Union with Maps and dynamic key addition during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b']]);
      const map2 = new Map([[3, 'c']]);

      // Create array of entries with dynamic addition
      const entries: [number, string][] = [];
      for (const entry of map1) {
        entries.push(entry);
      }
      map2.set(4, 'd'); // Add new entry to map2 after starting iteration
      for (const entry of map2) {
        entries.push(entry);
      }

      const union = new Map(entries);

      expect(union.size).assertEqual(4); // Includes dynamically added entry
      expect(union.get(4)).assertEqual('d');
    });
    /**
     * @tc.number MAP_UNION_TEST_031
     * @tc.name MapUnionTest031
     * @tc.desc Union of Maps with typed array keys and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const uint8Arr1 = new Uint8Array([1, 2, 3]);
      const uint8Arr2 = new Uint8Array([1, 2, 3]); // Same content, different instance
      const int16Arr = new Int16Array([4, 5]);

      const map1 = new Map<Uint8Array | Int16Array, string>([[uint8Arr1, 'uint8-1'], [int16Arr, 'int16']]);
      const map2 = new Map<Uint8Array | Int16Array, string>([[uint8Arr2, 'uint8-2'], [int16Arr, 'int16-updated']]);

      const union = getUnionMap(map1, map2) as Map<Uint8Array | Int16Array, string>;

      expect(union.size).assertEqual(3); // Typed arrays are reference-based keys
      expect(union.get(uint8Arr1)).assertEqual('uint8-1');
      expect(union.get(uint8Arr2)).assertEqual('uint8-2');
      expect(union.get(int16Arr)).assertEqual('int16-updated');
    });

    /**
     * @tc.number MAP_UNION_TEST_032
     * @tc.name MapUnionTest032
     * @tc.desc Union with Maps and check size after multiple operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b']]);
      const map2 = new Map([[2, 'c'], [3, 'd']]);
      const map3 = new Map([[3, 'e'], [4, 'f']]);

      // Step 1: Union of first two maps
      const union1 = getUnionMap(map1, map2) as Map<number, string>;
      expect(union1.size).assertEqual(3);

      // Step 2: Union with third map
      const union2 = getUnionMap(union1, map3) as Map<number, string>;
      expect(union2.size).assertEqual(4);

      // Step 3: Add new entry to union
      union2.set(5, 'g');
      expect(union2.size).assertEqual(5);
    });

    /**
     * @tc.number MAP_UNION_TEST_033
     * @tc.name MapUnionTest033
     * @tc.desc Union of Maps with WeakMap and WeakSet references as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const wmKey: BaseI = {};
      const wsKey: BaseI = {};

      const weakMap = new WeakMap<BaseI, string>();
      weakMap.set(wmKey, 'wm-value');

      const weakSet = new WeakSet();
      weakSet.add(wsKey);

      const map1 =
        new Map<number, WeakMap<BaseI, string> | string>([[1, weakMap], [2, 'normal']]);
      const map2 =
        new Map<number, WeakMap<BaseI, string> | WeakSet<BaseI>>([[2,
          weakSet], [3, weakMap]]);

      const union = getUnionMap(map1,
        map2) as Map<number, WeakMap<BaseI, string> | WeakSet<BaseI> | string>;

      expect(union.size).assertEqual(3);
      expect((union.get(1) as WeakMap<BaseI, string>).has(wmKey))
        .assertTrue(); // WeakMap reference preserved
      expect((union.get(2) as WeakSet<BaseI>).has(wsKey))
        .assertTrue(); // WeakSet reference preserved
      expect(union.get(3)).assertEqual(weakMap); // Shared WeakMap reference
    });

    /**
     * @tc.number MAP_UNION_TEST_034
     * @tc.name MapUnionTest034
     * @tc.desc Union with Maps and value equality checks (not reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const obj1: BaseI = { id: 1 };
      const obj2: BaseI = { id: 1 }; // Same content, different reference
      const obj3: BaseI = { id: 2 };

      const map1 = new Map([[1, obj1], [2, obj3]]);
      const map2 = new Map([[1, obj2], [3, obj1]]);

      const union = getUnionMap(map1, map2) as Map<number, BaseI>;

      // References are different but content is same for obj1 and obj2
      expect(union.get(1)).assertEqual(obj2); // Reference from map2
      expect(union.get(1)!.id).assertEqual(1); // Content equality
      expect(union.get(3)!.id).assertEqual(1); // Preserved content
    });

    /**
     * @tc.number MAP_UNION_TEST_035
     * @tc.name MapUnionTest035
     * @tc.desc Union of Maps with async function values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      const asyncFunc1 = async () => 'result1';
      const asyncFunc2 = async () => 'result2';
      const asyncFunc3 = async () => 'result3';

      const map1 = new Map([[1, asyncFunc1], [2, asyncFunc2]]);
      const map2 = new Map([[2, asyncFunc3], [3, asyncFunc1]]);

      const union = getUnionMap(map1, map2) as Map<number, Function>;

      expect(union.size).assertEqual(3);
      expect(await union.get(2)!()).assertEqual('result3'); // Overwritten async function
      expect(await union.get(3)!()).assertEqual('result1'); // Preserved async function
    });

    /**
     * @tc.number MAP_UNION_TEST_036
     * @tc.name MapUnionTest036
     * @tc.desc Union with Maps containing ArrayBuffer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(8); // Same size, different buffer
      const view = new Uint32Array(buffer1);
      view[0] = 0x12345678;

      const map1 = new Map<number, ArrayBuffer | string>([[1, buffer1], [2, 'text']]);
      const map2 = new Map([[2, buffer2], [3, buffer1]]);

      const union = getUnionMap(map1, map2) as Map<number, ArrayBuffer | string>;

      expect(union.size).assertEqual(3);
      expect(union.get(1)).assertEqual(buffer1);
      expect(union.get(2)).assertEqual(buffer2);
      expect(new Uint32Array((union.get(3) as ArrayBuffer))[0]).assertEqual(0x12345678); // Buffer content preserved
    });

    /**
     * @tc.number MAP_UNION_TEST_037
     * @tc.name MapUnionTest037
     * @tc.desc Union of Maps with generator function values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const result = MapUnionTest037() as (boolean | number)[];

      expect(result[0]).assertEqual(3);

      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(false);

      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number MAP_UNION_TEST_038
     * @tc.name MapUnionTest038
     * @tc.desc Union with Maps and subsequent set() operations on union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b']]);
      const map2 = new Map([[3, 'c'], [4, 'd']]);

      const union = getUnionMap(map1, map2) as Map<number, string>;

      // Add new entry to union
      union.set(5, 'e');
      // Update existing entry from map1
      union.set(1, 'a-updated');
      // Update existing entry from map2
      union.set(3, 'c-updated');

      expect(union.size).assertEqual(5);
      expect(union.get(1)).assertEqual('a-updated');
      expect(union.get(3)).assertEqual('c-updated');
      expect(union.get(5)).assertEqual('e');

      // Original maps unchanged
      expect(map1.get(1)).assertEqual('a');
      expect(map2.get(3)).assertEqual('c');
    });

    /**
     * @tc.number MAP_UNION_TEST_039
     * @tc.name MapUnionTest039
     * @tc.desc Union of Maps with class instances as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      class KeyClass {
        public id: number;

        constructor(id: number) {
          this.id = id;
        }
      }

      const instance1 = new KeyClass(1);
      const instance2 = new KeyClass(2);
      const instance3 = new KeyClass(1); // Same id, different instance

      const map1 = new Map([[instance1, 'inst1'], [instance2, 'inst2']]);
      const map2 = new Map([[instance3, 'inst3'], [instance2, 'inst2-updated']]);

      const union = getUnionMap(map1, map2) as Map<KeyClass, string>;

      expect(union.size).assertEqual(3); // Instances are distinct keys
      expect(union.get(instance1)).assertEqual('inst1');
      expect(union.get(instance3)).assertEqual('inst3');
      expect(union.get(instance2)).assertEqual('inst2-updated');
    });

    /**
     * @tc.number MAP_UNION_TEST_040
     * @tc.name MapUnionTest040
     * @tc.desc Union with Maps and values containing Map references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const innerMap1 = new Map([['x', 10]]);
      const innerMap2 = new Map([['y', 20]]);

      const map1 = new Map([[1, innerMap1], [2, innerMap2]]);
      const map2 = new Map([[2, innerMap1], [3, innerMap2]]);

      const union = getUnionMap(map1, map2) as Map<number, Map<string, number>>;

      expect(union.size).assertEqual(3);
      expect(union.get(2)!.get('x')).assertEqual(10); // innerMap1 overwrites innerMap2
      expect(union.get(3)!.get('y')).assertEqual(20); // Preserved innerMap2
      expect(union.get(1) === innerMap1).assertTrue(); // Reference preserved
    });
    /**
     * @tc.number MAP_UNION_TEST_041
     * @tc.name MapUnionTest041
     * @tc.desc Union of Maps with proxy objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const union = MapUnionTest041();

      expect(union[0]).assertEqual(3); // Proxies are distinct keys
      expect(union[1]).assertEqual('proxy1');
      expect(union[2]).assertEqual('proxy2');
      expect(union[3]).assertEqual('value2-updated');
    });

    /**
     * @tc.number MAP_UNION_TEST_042
     * @tc.name MapUnionTest042
     * @tc.desc Union with Maps and entries sorted by key after union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[3, 'c'], [1, 'a']]);
      const map2 = new Map([[4, 'd'], [2, 'b'], [1, 'a-updated']]);

      // Create union and sort entries by key
      const unionEntries =
        Array.from(((getUnionMap(map1, map2) as Map<number, string>).entries())).sort((k1, k2) => k1[0] - k2[0]);
      const sortedUnion = new Map(unionEntries);

      expect(Array.from(sortedUnion.keys())).assertDeepEquals([1, 2, 3, 4]);
      expect(sortedUnion.get(1)).assertEqual('a-updated');
    });

    /**
     * @tc.number MAP_UNION_TEST_043
     * @tc.name MapUnionTest043
     * @tc.desc Union of Maps with Error objects as values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const error1 = new Error('Error 1');
      const error2 = new Error('Error 2');
      const error3 = new Error('Error 1'); // Same message, different instance

      const map1 = new Map([[1, error1], [2, error2]]);
      const map2 = new Map([[2, error3], [3, error1]]);

      const union = getUnionMap(map1, map2) as Map<number, Error>;

      expect(union.size).assertEqual(3);
      expect(union.get(2)!.message).assertEqual('Error 1'); // error3 overwrites error2
      expect(union.get(3)).assertEqual(error1); // Preserved reference
      expect(union.get(1) === error1).assertTrue();
    });

    /**
     * @tc.number MAP_UNION_TEST_044
     * @tc.name MapUnionTest044
     * @tc.desc Union with Maps and check for value mutations after union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const mutableObj: BaseI = { value: 'original' };
      const map1 = new Map<number, BaseI | string>([[1, mutableObj], [2, 'static']]);
      const map2 =
        new Map<number, BaseI | string>([[2, 'static-updated'], [3, mutableObj]]);

      const union = getUnionMap(map1, map2) as Map<number, BaseI | string>;

      // Mutate the original object
      mutableObj.value = 'modified';

      // Union values should reflect mutation (same reference)
      expect((union.get(1) as BaseI).value).assertEqual('modified');
      expect((union.get(3) as BaseI).value).assertEqual('modified');
      expect(union.get(2)).assertEqual('static-updated'); // Static value unchanged
    });

    /**
     * @tc.number MAP_UNION_TEST_045
     * @tc.name MapUnionTest045
     * @tc.desc Union of Maps with mixed case string keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([['Key', 'value1'], ['key', 'value2'], ['KEY', 'value3']]);
      const map2 = new Map([['key', 'value4'], ['Key', 'value5'], ['newKey', 'value6']]);

      const union = getUnionMap(map1, map2) as Map<string, string>;

      expect(union.size).assertEqual(4); // String keys are case-sensitive
      expect(union.get('Key')).assertEqual('value5');
      expect(union.get('key')).assertEqual('value4');
      expect(union.get('KEY')).assertEqual('value3');
      expect(union.get('newKey')).assertEqual('value6');
    });

    /**
     * @tc.number MAP_UNION_TEST_046
     * @tc.name MapUnionTest046
     * @tc.desc Union with Maps and then check iterator behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 'a'], [2, 'b']]);
      const map2 = new Map([[3, 'c'], [2, 'd']]);

      const union = getUnionMap(map1, map2) as Map<number, string>;

      // Check iterator order (insertion order preserved)
      const iterator = union[Symbol.iterator]();
      expect(iterator.next().value).assertDeepEquals([1, 'a']);
      expect(iterator.next().value).assertDeepEquals([2, 'd']); // From map2
      expect(iterator.next().value).assertDeepEquals([3, 'c']);
      expect(iterator.next().done).assertTrue();
    });

    /**
     * @tc.number MAP_UNION_TEST_047
     * @tc.name MapUnionTest047
     * @tc.desc Union of Maps with Map instances as both keys and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const keyMap = new Map([[1, 'key']]);
      const valueMap1 = new Map([[2, 'val1']]);
      const valueMap2 = new Map([[3, 'val2']]);

      const map1 = new Map<Map<number, string> | number, Map<number, string>>([[keyMap, valueMap1], [1, valueMap2]]);
      const map2 = new Map<Map<number, string> | number, Map<number, string>>([[keyMap, valueMap2], [2, valueMap1]]);

      const union = getUnionMap(map1, map2) as Map<Map<number, string> | number, Map<number, string>>;

      expect(union.size).assertEqual(3);
      expect(union.get(keyMap)!.get(3)).assertEqual('val2'); // valueMap2 overwrites valueMap1
      expect(union.get(1)).assertEqual(valueMap2);
      expect(union.get(2)!.get(2)).assertEqual('val1');
    });

    /**
     * @tc.number MAP_UNION_TEST_048
     * @tc.name MapUnionTest048
     * @tc.desc Union with Maps containing non-serializable values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nonSerializable = () => {
      }; // Functions are non-serializable
      const map1 = new Map<number, Function | string>([[1, nonSerializable], [2, 'serializable']]);
      const map2 = new Map<number, Function | string>([[2, nonSerializable], [3, 'another']]);

      const union = getUnionMap(map1, map2) as Map<number, Function | string>;

      expect(union.size).assertEqual(3);
      expect(union.get(1)).assertEqual(nonSerializable);
      expect(union.get(2)).assertEqual(nonSerializable); // Function reference from map2
      expect(union.get(3)).assertEqual('another');
    });

    /**
     * @tc.number MAP_UNION_TEST_049
     * @tc.name MapUnionTest049
     * @tc.desc Union of Maps with nested array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = [1, 2, 3];
      const arr2 = [4, 5];
      const arr3 = [1, 2, 3]; // Same content, different reference

      const map1 = new Map([[1, arr1], [2, arr2]]);
      const map2 = new Map([[2, arr3], [3, arr1]]);

      const union = getUnionMap(map1, map2) as Map<number, number[]>;

      expect(union.size).assertEqual(3);
      expect(union.get(2)).assertDeepEquals([1, 2, 3]); // Content matches arr3
      expect(union.get(2) === arr3).assertTrue(); // Reference is arr3
      expect(union.get(3) === arr1).assertTrue();
    });

    /**
     * @tc.number MAP_UNION_TEST_050
     * @tc.name MapUnionTest050
     * @tc.desc Union with Maps and perform bulk operations on union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 10], [2, 20], [3, 30]]);
      const map2 = new Map([[3, 40], [4, 50], [5, 60]]);

      const union = getUnionMap(map1, map2) as Map<number, number>;

      // Bulk update: multiply all values by 2
      Array.from(union.keys()).forEach(key => {
        union.set(key, union.get(key)! * 2);
      });

      expect(union.get(1)).assertEqual(20);
      expect(union.get(3)).assertEqual(80); // Updated from 40
      expect(union.get(5)).assertEqual(120);

      // Bulk delete: remove even keys
      Array.from(union.keys()).forEach(key => {
        if (key % 2 === 0) {
          union.delete(key);
        }
      });

      expect(union.size).assertEqual(3);
      expect(union.has(2)).assertFalse();
      expect(union.has(4)).assertFalse();
    });
    /**
     * @tc.number MAP_UNION_TEST_051
     * @tc.name MapUnionTest051
     * @tc.desc Union of Maps with BigInt values and number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, 100n], [2, 200n], [3, 300n]]);
      const map2 = new Map([[3, 400n], [4, 500n], [5, 600n]]);

      const union = getUnionMap(map1, map2) as Map<number, bigint>;

      expect(union.size).assertEqual(5);
      expect(union.get(3)).assertEqual(400n);
      expect(union.get(5)).assertEqual(600n);
      expect(union.get(1)! + 50n).assertEqual(150n); // BigInt operation
    });

    /**
     * @tc.number MAP_UNION_TEST_052
     * @tc.name MapUnionTest052
     * @tc.desc Union with Maps and check key existence using keys() iterator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([['a', 1], ['b', 2]]);
      const map2 = new Map([['b', 3], ['c', 4]]);

      const union = getUnionMap(map1, map2) as Map<string, number>;
      const unionKeys = Array.from(union.keys());

      expect(unionKeys.includes('a')).assertTrue();
      expect(unionKeys.includes('b')).assertTrue();
      expect(unionKeys.includes('c')).assertTrue();
      expect(unionKeys.includes('d')).assertFalse();
      expect(unionKeys.length).assertEqual(3);
    });

    /**
     * @tc.number MAP_UNION_TEST_053
     * @tc.name MapUnionTest053
     * @tc.desc Union of Maps with Set objects as keys and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const setKey1 = new Set([1, 2]);
      const setKey2 = new Set([3, 4]);
      const setVal1 = new Set(['a', 'b']);
      const setVal2 = new Set(['c', 'd']);

      const map1 = new Map([[setKey1, setVal1], [setKey2, setVal2]]);
      const map2 = new Map([[setKey2, setVal1], [new Set([5, 6]), setVal2]]);

      const union = getUnionMap(map1, map2) as Map<Set<number>, Set<string>>;

      expect(union.size).assertEqual(3);
      expect(union.get(setKey2)!.has('a')).assertTrue(); // setVal1 overwrites setVal2
      expect(union.get(setKey1)!.has('b')).assertTrue();
    });

    /**
     * @tc.number MAP_UNION_TEST_054
     * @tc.name MapUnionTest054
     * @tc.desc Union with Maps and value replacement using map() on entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 'apple'], [2, 'banana']]);
      const map2 = new Map([[2, 'blueberry'], [3, 'cherry']]);

      // Create union and transform values to uppercase
      const transformedUnion = new Map(
        Array.from((getUnionMap(map1, map2) as Map<number, string>).entries()).map((entry) => {
          return [
            entry[0],
            entry[1].toUpperCase()
          ]
        })
      );

      expect(transformedUnion.get(1)).assertEqual('APPLE');
      expect(transformedUnion.get(2)).assertEqual('BLUEBERRY');
      expect(transformedUnion.get(3)).assertEqual('CHERRY');
    });

    /**
     * @tc.number MAP_UNION_TEST_055
     * @tc.name MapUnionTest055
     * @tc.desc Union of Maps with DOM element-like objects as keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      // Simulate DOM elements
      const elem1: BaseI = { tagName: 'DIV', id: 'div1' };
      const elem2: BaseI = { tagName: 'SPAN', id: 'span1' };
      const elem3: BaseI = { tagName: 'DIV', id: 'div1' }; // Same props, different ref

      const map1 = new Map([[elem1, 'div content'], [elem2, 'span content']]);
      const map2 = new Map([[elem3, 'div content updated'], [elem2, 'span content updated']]);

      const union = getUnionMap(map1, map2) as Map<BaseI, string>;

      expect(union.size).assertEqual(3);
      expect(union.get(elem1)).assertEqual('div content');
      expect(union.get(elem3)).assertEqual('div content updated');
      expect(union.get(elem2)).assertEqual('span content updated');
    });

    /**
     * @tc.number MAP_UNION_TEST_056
     * @tc.name MapUnionTest056
     * @tc.desc Union with Maps and check for NaN values in union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, NaN], [2, 10], [3, NaN]]);
      const map2 = new Map([[3, 20], [4, NaN], [1, 5]]);

      const union = getUnionMap(map1, map2) as Map<number, number>;

      expect(union.size).assertEqual(4);
      expect(isNaN(union.get(4) as number)).assertTrue(); // Preserved NaN
      expect(union.get(3)).assertEqual(20); // Overwritten NaN
      expect(union.get(1)).assertEqual(5); // Overwritten NaN
    });

    /**
     * @tc.number MAP_UNION_TEST_057
     * @tc.name MapUnionTest057
     * @tc.desc Union of Maps with nested object values and deep comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const nested1: BaseI = { a: ({ b: 1 }) };
      const nested2: BaseI = { a: { b: 2 } };
      const nested3: BaseI = { a: { b: 1 } }; // Same structure, different ref

      const map1 = new Map([[1, nested1], [2, nested2]]);
      const map2 = new Map([[2, nested3], [3, nested1]]);

      const union = getUnionMap(map1, map2) as Map<number, BaseI>;

      expect(union.size).assertEqual(3);
      expect(union.get(2)!.a!.b).assertEqual(1); // Deep value matches nested3
      expect(union.get(2) === nested3).assertTrue(); // Reference check
      expect(union.get(3)!.a!.b).assertEqual(1);
    });

    /**
     * @tc.number MAP_UNION_TEST_058
     * @tc.name MapUnionTest058
     * @tc.desc Union with Maps and forEach iteration with thisArg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map([[1, 10], [2, 20]]);
      const map2 = new Map([[2, 30], [3, 40]]);
      const union = getUnionMap(map1, map2) as Map<number, string>;
      expect(MapUnionTest058(union)).assertDeepEquals([20, 60, 80]); // 10*2, 30*2, 40*2
    });

    /**
     * @tc.number MAP_UNION_TEST_059
     * @tc.name MapUnionTest059
     * @tc.desc Union of Maps with Infinity and -Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MapUnionTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map1 = new Map([[1, Infinity], [2, -Infinity], [3, 0]]);
      const map2 = new Map([[3, Infinity], [4, -Infinity], [1, 100]]);

      const union = getUnionMap(map1, map2) as Map<number, number>;

      expect(union.size).assertEqual(4);
      expect(union.get(1)).assertEqual(100); // Overwritten Infinity
      expect(union.get(3)).assertEqual(Infinity); // Overwritten 0
      expect(union.get(2)).assertEqual(-Infinity);
    });

    /**
     * @tc.number MAP_UNION_TEST_060
     * @tc.name MapUnionTest060
     * @tc.desc Union with Maps and conversion to object (string keys only)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('MapUnionTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      const map1 = new Map<string, string | number>([['name', 'Alice'], ['age', 30]]);
      const map2 = new Map<string, string | number>([['age', 31], ['email', 'alice@example.com']]);

      const union = getUnionMap(map1, map2) as Map<string, string | number>;

      // Convert union to plain object (loses non-string keys)
      const unionObj: Record<string, string | number> = {};
      union.forEach((value, key) => {
        if (typeof key === 'string') {
          unionObj[key] = value;
        }
      });

      expect(unionObj.name).assertEqual('Alice');
      expect(unionObj.age).assertEqual(31); // Overwritten
      expect(unionObj.email).assertEqual('alice@example.com');
    });
  })
}
