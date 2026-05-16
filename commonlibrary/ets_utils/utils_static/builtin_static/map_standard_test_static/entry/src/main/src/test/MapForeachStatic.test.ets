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
  public id: number;

  constructor(id: number) {
    this.id = id;
  }
}

class CustomError extends Error {
  constructor(message?: string) {
    super(message);

    this.name = 'CustomError';
  }
}

interface test0010 {
  prop: string
}

interface test0016 {
  id: number;
}
interface test0017 {
  data: string;
}
interface test0042 {
  a: number;
  b: number;
}
interface MapForEach01 {}

export default function MapForeachTest() {
  describe('MapForeachTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0001
     * @tc.name testMapForEach0001
     * @tc.desc Verify forEach executes callback for each key-value pair in insertion order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapForEach0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, number>([['a', 1], ['b', 2], ['c', 3]]);
      const result: string[] = [];
      map.forEach((value, key) => {
        result.push(`${key}:${value}`);
      });
      expect(result).assertDeepEquals(['a:1', 'b:2', 'c:3']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0002
     * @tc.name testMapForEach0002
     * @tc.desc Verify callback receives value as first parameter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapForEach0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, string>([[1, 'x'], [2, 'y']]);
      const values: string[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['x', 'y']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0003
     * @tc.name testMapForEach0003
     * @tc.desc Verify callback receives key as second parameter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapForEach0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<boolean, number>([[true, 10], [false, 20]]);
      const keys: boolean[] = [];
      map.forEach((_, key) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals([true, false]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0004
     * @tc.name testMapForEach0004
     * @tc.desc Verify callback receives map as third parameter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapForEach0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, boolean>([['active', true]]);
      let targetMap: Map<string, boolean> | null = null;
      map.forEach((_, __, currentMap) => {
        targetMap = currentMap;
      });
      expect(targetMap).assertEqual(map);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0006
     * @tc.name testMapForEach0006
     * @tc.desc Verify forEach does not execute callback for deleted keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>([['a', 'foo'], ['b', 'bar']]);
      map.delete('a');
      const count: number[] = [];
      map.forEach(() => {
        count.push(1);
      });
      expect(count.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0007
     * @tc.name testMapForEach0007
     * @tc.desc Verify forEach executes callback for keys with undefined value
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let map = new Map<number, undefined>([[1, undefined], [2, undefined]]);
      let count = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0011
     * @tc.name testMapForEach0011
     * @tc.desc Verify forEach skips values deleted before iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      const result: string[] = [];
      map.forEach((value, key) => {
        if (key === 2) {
          map.delete(3);
        }
        result.push(value);
      });
      expect(result).assertDeepEquals(['one', 'two']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0012
     * @tc.name testMapForEach0012
     * @tc.desc Verify forEach processes values added during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>([[1, 'one']]);
      const result: string[] = [];
      map.forEach((value, key, currentMap) => {
        if (key === 1) {
          currentMap.set(2, 'two');
        }
        result.push(value);
      });
      expect(result).assertDeepEquals(['one', 'two']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0013
     * @tc.name testMapForEach0013
     * @tc.desc Verify forEach processes reinserted values during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const result: string[] = [];
      map.forEach((value, key, currentMap) => {
        if (key === 1) {
          currentMap.delete(2);
          currentMap.set(2, 'two-new');
        }
        result.push(value);
      });
      expect(result).assertDeepEquals(['one', 'two-new']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0014
     * @tc.name testMapForEach0014
     * @tc.desc Verify forEach with empty Map does nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapForEach0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<never, never>();
      let isCalled = false;
      map.forEach(() => {
        isCalled = true;
      });
      expect(isCalled).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0015
     * @tc.name testMapForEach0015
     * @tc.desc Verify callback handles null values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapForEach0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, null>([['a', null], ['b', null]]);
      const values: null[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([null, null]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0016
     * @tc.name testMapForEach0016
     * @tc.desc Verify callback handles object keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const key1: test0016 = { id: 1 };
      const key2: test0016 = { id: 2 };
      const map = new Map<test0016, string>([[key1, 'obj1'], [key2, 'obj2']]);
      const keys: test0016[] = [];
      map.forEach((_, key) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals([key1, key2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0017
     * @tc.name testMapForEach0017
     * @tc.desc Verify callback handles object values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const value1: test0017 = { data: 'x' };
      const value2: test0017 = { data: 'y' };
      const map = new Map<number, test0017>([[1, value1], [2, value2]]);
      const values: test0017[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([value1, value2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0019
     * @tc.name testMapForEach0019
     * @tc.desc Verify forEach with bigint values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, bigint>([['a', 10n], ['b', 20n]]);
      let sum = 0n;
      map.forEach((value) => {
        sum += value;
      });
      expect(sum).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0020
     * @tc.name testMapForEach0020
     * @tc.desc Verify callback modifies Map values during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 10], [2, 20]]);
      map.forEach((value, key, currentMap) => {
        currentMap.set(key, value * 2);
      });
      expect(map.get(1)).assertEqual(20);
      expect(map.get(2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0021
     * @tc.name testMapForEach0021
     * @tc.desc Verify forEach with callback that throws error stops iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      const result: string[] = [];
      try {
        map.forEach((value) => {
          if (value === 'two') {
            throw new Error('stop');
          }
          result.push(value);
        });
      } catch (e) {
        expect((e as Error).message).assertEqual('stop');
      }
      expect(result).assertDeepEquals(['one']);
    })       ;

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0027
     * @tc.name testMapForEach0027
     * @tc.desc Verify forEach with Map containing one entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapForEach0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<string, string>([['key', 'value']]);
      let count = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0028
     * @tc.name testMapForEach0028
     * @tc.desc Verify forEach with Map containing ten entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapForEach0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, number>();
      for (let i = 1; i <= 10; i++) {
        map.set(i, i);
      }
      let count = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0029
     * @tc.name testMapForEach0029
     * @tc.desc Verify callback parameters order (value first, then key)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 10]]);
      let params: [int, string] | null = null;
      map.forEach((value, key) => {
        params = [value, key];
      });
      expect(JSON.stringify(params)).assertDeepEquals(JSON.stringify([10, 'a']));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0030
     * @tc.name testMapForEach0030
     * @tc.desc Verify third parameter is the original Map (not copy)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>([[1, 'test']]);
      map.forEach((_, __, currentMap) => {
        currentMap.set(2, 'new');
      });
      expect(map.size).assertEqual(2);
      expect(map.get(2)).assertEqual('new');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0031
     * @tc.name testMapForEach0031
     * @tc.desc Verify forEach does not process entries added after iteration starts but not reached
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const result: string[] = [];
      map.forEach((value, key, currentMap) => {
        if (key === 1) {
          currentMap.set(3, 'three');
        }
        if (key === 3) {
          currentMap.set(4, 'four');
        }
        result.push(value);
      });
      expect(result).assertDeepEquals(['one', 'two', 'three', 'four']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0032
     * @tc.name testMapForEach0032
     * @tc.desc Verify forEach with callback that returns value (ignored)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, int>([[1, 1], [2, 2]]);
      const result: int[] = [];
      map.forEach((value) => {
        result.push(value);
      });
      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0033
     * @tc.name testMapForEach0033
     * @tc.desc Verify forEach with Map of Dates as keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-01-02');
      const map = new Map<Date, string>([[date1, 'day1'], [date2, 'day2']]);
      const keys: Date[] = [];
      map.forEach((_, key) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals([date1, date2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0034
     * @tc.name testMapForEach0034
     * @tc.desc Verify forEach with Map of RegExps as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const regex1 = new RegExp("a");
      const regex2 = new RegExp("b");
      const map = new Map<string, RegExp>([['a', regex1], ['b', regex2]]);
      const values: RegExp[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([regex1, regex2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0035
     * @tc.name testMapForEach0035
     * @tc.desc Verify forEach with nested Map as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const nestedMap1 = new Map<number, string>([[1, 'x']]);
      const nestedMap2 = new Map<number, string>([[2, 'y']]);
      const map = new Map<string, Map<number, string>>([['n1', nestedMap1], ['n2', nestedMap2]]);
      const values: Map<number, string>[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([nestedMap1, nestedMap2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0036
     * @tc.name testMapForEach0036
     * @tc.desc Verify forEach with Map containing NaN keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[NaN, 'nan1'], [NaN, 'nan2']]);
      const values: string[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['nan2']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0037
     * @tc.name testMapForEach0037
     * @tc.desc Verify forEach with Map containing 0 and -0 keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[0, 'zero'], [-0, 'negZero']]);
      const values: string[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['negZero']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0038
     * @tc.name testMapForEach0038
     * @tc.desc Verify forEach with callback that modifies its own closure
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<int, int>([[1, 10], [2, 20], [3, 30]]);
      let multiplier = 1;
      const result: int[] = [];
      map.forEach((value) => {
        result.push(value * multiplier);
        multiplier++;
      });
      expect(result).assertDeepEquals([10, 40, 90]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0041
     * @tc.name testMapForEach0041
     * @tc.desc Verify forEach does not iterate over prototype properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 1]]);
      let count = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0044
     * @tc.name testMapForEach0044
     * @tc.desc Verify forEach with empty callback (no operation)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testMapForEach0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      const map = new Map<number, number>([[1, 1], [2, 2]]);
      let threwError = false;

      try {
        map.forEach(() => {
        });
      } catch (e) {
        threwError = true;
      }

      expect(threwError).assertEqual(false);
      expect(map.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0046
     * @tc.name testMapForEach0046
     * @tc.desc Verify forEach with Map containing undefined keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<undefined, int>([[undefined, 10], [undefined, 20]]);
      const values: int[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([20]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0047
     * @tc.name testMapForEach0047
     * @tc.desc Verify forEach with Map containing null keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<null, string>([[null, 'a'], [null, 'b']]);
      const values: string[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals(['b']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0048
     * @tc.name testMapForEach0048
     * @tc.desc Verify forEach with Map of functions as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const func1 : ()=> number = () => 1;
      const func2: ()=> number  = () => 2;
      const map = new Map<string, () => number>([['f1', func1], ['f2', func2]]);
      const results: number[] = [];
      map.forEach((func) => {
        results.push(func());
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0049
     * @tc.name testMapForEach0049
     * @tc.desc Verify forEach with Map of functions as keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const key1 = () => 'a';
      const key2 = () => 'b';
      const map = new Map<() => string, number>([[key1, 1], [key2, 2]]);
      const keys: (() => string)[] = [];
      map.forEach((_, key) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals([key1, key2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0050
     * @tc.name testMapForEach0050
     * @tc.desc Verify forEach with large Map (100 entries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>();
      for (let i = 1; i <= 100; i++) {
        map.set(i, i * 2);
      }
      let sum = 0;
      map.forEach((value) => {
        sum += value;
      });
      expect(sum).assertEqual(10100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0051
     * @tc.name testMapForEach0051
     * @tc.desc Verify callback is called with correct parameters for each entry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      const params: [string, int][] = [];
      map.forEach((value, key) => {
        params.push([value, key]);
      });
      expect(JSON.stringify(params)).assertDeepEquals(JSON.stringify([['one', 1], ['two', 2], ['three', 3]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0053
     * @tc.name testMapForEach0053
     * @tc.desc Verify forEach with Map that has entries deleted and added multiple times
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      const result: string[] = [];
      map.forEach((value, key, currentMap) => {
        if (key === 1) {
          currentMap.delete(2);
          currentMap.set(4, 'd');
        }
        if (key === 4) {
          currentMap.delete(3);
          currentMap.set(5, 'e');
        }
        result.push(value);
      });
      expect(result).assertDeepEquals(['a', 'c', 'd', 'e']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0054
     * @tc.name testMapForEach0054
     * @tc.desc Verify forEach does not process entries deleted by previous callback calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c'], [4, 'd']]);
      const result: string[] = [];
      map.forEach((value, key, currentMap) => {
        result.push(value);
        if (key % 2 === 1) {
          currentMap.delete(key + 1);
        }
      });
      expect(result).assertDeepEquals(['a', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0055
     * @tc.name testMapForEach0055
     * @tc.desc Verify forEach processes entries added by previous callback calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'a']]);
      const result: string[] = [];
      map.forEach((value, key, currentMap) => {
        result.push(value);
        if (key < 3) {
          currentMap.set(key + 1, String.fromCharCode(97 + key));
        }
      });
      expect(result).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0056
     * @tc.name testMapForEach0056
     * @tc.desc Verify forEach with callback that uses all three parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>([['a', 1], ['b', 2]]);
      const result: string[] = [];
      map.forEach((value, key, currentMap) => {
        result.push(`${key}:${value}:${currentMap.size}`);
      });
      expect(result).assertDeepEquals(['a:1:2', 'b:2:2']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0060
     * @tc.name testMapForEach0060
     * @tc.desc Verify forEach with callback that returns undefined (no effect)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, int>([[1, 10], [2, 20]]);
      const result: int[] = [];
      map.forEach((value) => {
        result.push(value);
        return undefined;
      });
      expect(result).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0065
     * @tc.name testMapForEach0065
     * @tc.desc Verify forEach with Map that has been cleared during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      const result: string[] = [];
      map.forEach((value, key, currentMap) => {
        result.push(value);
        if (key === 2) {
          currentMap.clear();
        }
      });
      expect(result).assertDeepEquals(['a', 'b']);
      expect(map.size).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0066
     * @tc.name testMapForEach0066
     * @tc.desc Verify forEach with Map that has entries replaced during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'old1'], [2, 'old2']]);
      map.forEach((_, key, currentMap) => {
        currentMap.set(key, `new${key}`);
      });
      expect(map.get(1)).assertEqual('new1');
      expect(map.get(2)).assertEqual('new2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0068
     * @tc.name testMapForEach0068
     * @tc.desc Verify forEach with callback that uses nullish coalescing on values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string | null | undefined>([[1, 'foo'], [2, null], [3, undefined]]);
      const results: string[] = [];
      map.forEach((value) => {
        results.push(value ?? 'default');
      });
      expect(results).assertDeepEquals(['foo', 'default', 'default']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0070
     * @tc.name testMapForEach0070
     * @tc.desc Verify forEach with Map containing string keys with special characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>([['a@b', 1], ['c#d', 2], ['e$f', 3]]);
      const keys: string[] = [];
      map.forEach((_, key) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals(['a@b', 'c#d', 'e$f']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0071
     * @tc.name testMapForEach0071
     * @tc.desc Verify forEach with Map containing numeric keys as strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>([['1', 'one'], ['2', 'two'], ['3', 'three']]);
      const results: [string, string][] = [];
      map.forEach((value, key) => {
        results.push([key, value]);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([['1', 'one'], ['2', 'two'], ['3', 'three']]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0072
     * @tc.name testMapForEach0072
     * @tc.desc Verify forEach with Map containing boolean keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, int>([[true, 1], [false, 0]]);
      const results: [boolean, int][] = [];
      map.forEach((value, key) => {
        results.push([key, value]);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([[true, 1], [false, 0]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0074
     * @tc.name testMapForEach0074
     * @tc.desc Verify forEach with callback that uses destructuring on key (array key)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const key1 : int[]= [1, 2];
      const key2 : int[] = [3, 4];
      const map = new Map<int[], string>([[key1, 'a'], [key2, 'b']]);
      const keyValues: int[][] = [];
      map.forEach((value, key) => {
        keyValues.push([key[0], key[1]]);
      });
      expect(keyValues).assertDeepEquals([[1, 2], [3, 4]]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0075
     * @tc.name testMapForEach0075
     * @tc.desc Verify forEach with Map that has duplicate entries (overwritten)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, int>([['a', 1], ['a', 2], ['b', 3]]);
      const results: [string, int][] = [];
      map.forEach((value, key) => {
        results.push([key, value]);
      });
      expect(JSON.stringify(results)).assertDeepEquals(JSON.stringify([['a', 2], ['b', 3]]));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0076
     * @tc.name testMapForEach0076
     * @tc.desc Verify forEach with Map created from another Map
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const originalMap = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const newMap = new Map<number, string>(originalMap);
      const results: string[] = [];
      newMap.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(['one', 'two']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0077
     * @tc.name testMapForEach0077
     * @tc.desc Verify forEach with Map filtered via entries()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<int, int>([[1, 10], [2, 20], [3, 30]]);
      const filteredEntries = Array.from(map.entries()).filter((entry) => entry[0] % 2 === 0);
      const filteredMap = new Map<int, int>(filteredEntries);
      const results: int[] = [];
      filteredMap.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([20]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0080
     * @tc.name testMapForEach0080
     * @tc.desc Verify forEach with Map and callback that throws TypeError
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      try {
        map.forEach(() => {
          throw new TypeError('type error');
        });
        expect().assertFail();
      } catch (err) {
        expect((err as Error).name).assertEqual('TypeError');
        expect((err as Error).message).assertEqual('type error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0081
     * @tc.name testMapForEach0081
     * @tc.desc Verify forEach with Map and callback that throws ReferenceError
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one']]);
      try {
        map.forEach(() => {
          throw new ReferenceError('ref error');
        });
        expect().assertFail();
      } catch (err) {
        expect(err?.name).assertEqual('ReferenceError');
        expect(err?.message).assertEqual('ref error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0082
     * @tc.name testMapForEach0082
     * @tc.desc Verify forEach with Map and callback that throws custom error
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, string>([[1, 'one']]);
      try {
        map.forEach(() => {
          throw new CustomError('custom');
        });
        expect().assertFail();
      } catch (err) {
        expect(err?.name).assertEqual('CustomError');
        expect(err?.message).assertEqual('custom');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0084
     * @tc.name testMapForEach0084
     * @tc.desc Verify forEach with Map and callback that returns a promise
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, number>([[1, 10], [2, 20]]);
      const promises: Promise<number>[] = [];
      map.forEach((value) => {
        promises.push(Promise.resolve(value));
      });
      expect(promises.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0085
     * @tc.name testMapForEach0085
     * @tc.desc Verify forEach with Map containing undefined and null values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, undefined | null>([['a', undefined], ['b', null], ['c', undefined]]);
      const results: (undefined | null)[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([undefined, null, undefined]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0086
     * @tc.name testMapForEach0086
     * @tc.desc Verify forEach with Map containing empty string values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>([[1, ""], [2, ""], [3, "non-empty"]]);
      const results: string[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(["", "", "non-empty"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0087
     * @tc.name testMapForEach0087
     * @tc.desc Verify forEach with Map containing multi-line string values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>([[1, "line1\nline2"], [2, "single line"]]);
      const results: string[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(["line1\nline2", "single line"]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0088
     * @tc.name testMapForEach0088
     * @tc.desc Verify forEach with Map containing Unicode characters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>([['emoji', '😊'], ['symbol', '�?'], ['letter', 'ñ']]);
      const results: string[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals(['😊', '�?', 'ñ']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0089
     * @tc.name testMapForEach0089
     * @tc.desc Verify forEach with Map containing typed arrays as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr1 = new Uint8Array([1, 2, 3]);
      const arr2 = new Float32Array([4.5, 5.5]);
      const map = new Map<string, Uint8Array | Float32Array>([['uint8', arr1], ['float32', arr2]]);
      const results: (Uint8Array | Float32Array)[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([arr1, arr2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0090
     * @tc.name testMapForEach0090
     * @tc.desc Verify forEach with Map containing class instances as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const inst1 = new TestClass(1);
      const inst2 = new TestClass(2);
      const map = new Map<number, TestClass>([[1, inst1], [2, inst2]]);
      const results: TestClass[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([inst1, inst2]);
      expect(results[0].id).assertEqual(1);
      expect(results[1].id).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0092
     * @tc.name testMapForEach0092
     * @tc.desc Verify forEach with Map containing WeakSet as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const ws1 = new WeakSet<object>();
      const ws2 = new WeakSet<object>();
      const obj1: MapForEach01 = {};
      const obj2: MapForEach01 = {};
      ws1.add(obj1);
      ws2.add(obj2);

      const map = new Map<number, WeakSet<object>>([[1, ws1], [2, ws2]]);
      let ws1Found = false, ws2Found = false;

      map.forEach((value) => {
        if (value === ws1) {
          ws1Found = true;
        }
        if (value === ws2) {
          ws2Found = true;
        }
      });

      expect(ws1Found).assertEqual(true);
      expect(ws2Found).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0093
     * @tc.name testMapForEach0093
     * @tc.desc Verify forEach with Map containing DataView as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const buffer1 = new ArrayBuffer(8);
      const buffer2 = new ArrayBuffer(16);
      const dv1 = new DataView(buffer1);
      const dv2 = new DataView(buffer2);
      dv1.setInt32(0, 12345);
      dv2.setFloat64(8, 987.654);

      const map = new Map<string, DataView>([['dv1', dv1], ['dv2', dv2]]);
      const results: DataView[] = [];
      map.forEach((value) => {
        results.push(value);
      });

      expect(results).assertDeepEquals([dv1, dv2]);
      expect(results[0].getInt32(0)).assertEqual(12345);
      expect(results[1].getFloat64(8)).assertEqual(987.654);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0094
     * @tc.name testMapForEach0094
     * @tc.desc Verify forEach with Map containing ArrayBuffer as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const ab1 = new ArrayBuffer(10);
      const ab2 = new ArrayBuffer(20);
      const map = new Map<number, ArrayBuffer>([[1, ab1], [2, ab2]]);
      const results: ArrayBuffer[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([ab1, ab2]);
      expect(results[0].byteLength).assertEqual(10);
      expect(results[1].byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0095
     * @tc.name testMapForEach0095
     * @tc.desc Verify forEach with Map containing RegExp with flags as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const regex1 = new RegExp("test", "gi");
      const regex2 = new RegExp("pattern", "m");
      const map = new Map<string, RegExp>([['r1', regex1], ['r2', regex2]]);
      const results: RegExp[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([regex1, regex2]);
      expect(results[0].flags).assertEqual('gi');
      expect(results[1].flags).assertEqual('m');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0096
     * @tc.name testMapForEach0096
     * @tc.desc Verify forEach with Map containing Date objects as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2024-12-31');
      const map = new Map<number, Date>([[1, date1], [2, date2]]);
      const results: Date[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([date1, date2]);
      expect(results[0].getFullYear()).assertEqual(2023);
      expect(results[1].getFullYear()).assertEqual(2024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0097
     * @tc.name testMapForEach0097
     * @tc.desc Verify forEach with Map containing Error objects as values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const err1 = new Error('Error 1');
      const err2 = new TypeError('Type Error');
      const map = new Map<number, Error>([[1, err1], [2, err2]]);
      const results: Error[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([err1, err2]);
      expect(results[0].message).assertEqual('Error 1');
      expect(results[1].message).assertEqual('Type Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0098
     * @tc.name testMapForEach0098
     * @tc.desc Verify forEach with Map containing Map as keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const key1 = new Map<number, string>([[1, 'a']]);
      const key2 = new Map<number, string>([[2, 'b']]);
      const map = new Map<Map<number, string>, number>([[key1, 10], [key2, 20]]);
      const keys: Map<number, string>[] = [];
      map.forEach((_, key) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals([key1, key2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0099
     * @tc.name testMapForEach0099
     * @tc.desc Verify forEach with Map containing Set as keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const key1 = new Set<number>([1, 2, 3]);
      const key2 = new Set<number>([4, 5]);
      const map = new Map<Set<number>, string>([[key1, 'set1'], [key2, 'set2']]);
      const keys: Set<number>[] = [];
      map.forEach((_, key) => {
        keys.push(key);
      });
      expect(keys).assertDeepEquals([key1, key2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0100
     * @tc.name testMapForEach0100
     * @tc.desc Verify forEach with Map containing large number of entries (1000)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>();
      for (let i = 1; i <= 1000; i++) {
        map.set(i, i);
      }
      let count = 0;
      map.forEach(() => {
        count++;
      });
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0103
     * @tc.name testMapForEach0103
     * @tc.desc Verify forEach with Map where callback uses spread operator
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testMapForEach0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<int, int>([[1, 10], [2, 20]]);
      const arr: int[] = [];
      map.forEach((value) => {
        arr.push(...[value, value * 2]);
      });
      expect(arr).assertDeepEquals([10, 20, 20, 40]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0104
     * @tc.name testMapForEach0104
     * @tc.desc Verify forEach with Map where callback uses template literals
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>([['width', 100], ['height', 200]]);
      const results: string[] = [];
      map.forEach((value, key) => {
        results.push(`${key}: ${value}px`);
      });
      expect(results).assertDeepEquals(['width: 100px', 'height: 200px']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0105
     * @tc.name testMapForEach0105
     * @tc.desc Verify forEach with Map where callback uses optional parameters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two']]);
      const results: string[] = [];
      const callback = (value: string, key?: number) => {
        if (key) {
          results.push(`${key}:${value}`);
        }
      };
      map.forEach(callback);
      expect(results).assertDeepEquals(['1:one', '2:two']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0108
     * @tc.name testMapForEach0108
     * @tc.desc Verify forEach with Map containing Infinity and -Infinity values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>([['inf', Infinity], ['ninf', -Infinity]]);
      const results: number[] = [];
      map.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([Infinity, -Infinity]);
      expect(isFinite(results[0])).assertEqual(false);
      expect(isFinite(results[1])).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0109
     * @tc.name testMapForEach0109
     * @tc.desc Verify forEach with Map containing sparse array values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMapForEach0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [1,2,3];
      const arr2: number[] = [1,2,3,4,5,5];

      const map = new Map<number, number[]>([[1, arr1], [2, arr2]]);
      const results: number[][] = [];
      map.forEach((value) => {
        results.push(value);
      });

      expect(results).assertDeepEquals([arr1, arr2]);
      expect(results[0][0]).assertEqual(1);
      expect(results[0][2]).assertEqual(3);
      expect(results[1][5]).assertEqual(5);
    });

  })
}
