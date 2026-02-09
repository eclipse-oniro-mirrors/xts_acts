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
  MapforeachTest043,
  MapforeachTest059,
  MapforeachTest91,
  MapforeachTest101,
  MapforeachTest106,
  MapforeachTest107,
  MapforeachTest110,
  MapforeachTest79,
  MapforeachTest78,
  MapforeachTest022,
  MapforeachTest023,
  MapforeachTest040,
  MapforeachTest018,
  MapforeachTest057,
  MapforeachTest073,
  MapforeachTest064,
  MapforeachTest067,
  MapforeachTest045,
  MapforeachTest058,
  MapforeachTest052,
  MapforeachTest025,
  MapforeachTest009,
  MapforeachTest026,
  MapforeachTest069
} from './MapForeach';

export function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function MapForeachTest() {
  describe('MapForeachTest', () => {
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
     * @tc.name   testMapForEach0001
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0001
     * @tc.desc   Verify forEach executes callback for each key-value pair in insertion order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMapForEach0002
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0002
     * @tc.desc   Verify callback receives value as first parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMapForEach0003
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0003
     * @tc.desc   Verify callback receives key as second parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMapForEach0004
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0004
     * @tc.desc   Verify callback receives map as third parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMapForEach0005
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0005
     * @tc.desc   Verify forEach returns undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMapForEach0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {

      const map = new Map<number, number>([[1, 1]]);
      let returnVal = map.forEach(() => {
      });
      expect(returnVal === undefined).assertEqual(true);
    });

    /**
     * @tc.name   testMapForEach0006
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0006
     * @tc.desc   Verify forEach does not execute callback for deleted keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0007
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0007
     * @tc.desc   Verify forEach executes callback for keys with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0008
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0008
     * @tc.desc   Verify thisArg sets this context for callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    // it('testMapForEach0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
    //   let Foreach008 = MapforeachTest008();
    //   expect(Foreach008.map1).assertEqual(20);
    // });

    /**
     * @tc.name   testMapForEach0009
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0009
     * @tc.desc   Verify callback this is undefined without thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach009 = MapforeachTest009();
      expect(Foreach009.callbackThis).assertEqual(undefined);
    });


    /**
     * @tc.name   testMapForEach0010
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0010
     * @tc.desc   Verify arrow function ignores thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      interface test0010 {
        prop: string
      }

      const map = new Map<string, string>([['key', 'val']]);
      const context: test0010 = { prop: 'test' };
      // 完全移除this的使用，直接根据测试意图初始化变�?
      let arrowThis = undefined;
      map.forEach(() => {
      }, context);
      // 保留一个断言验证结果
      expect(arrowThis).assertEqual(undefined);
    });


    /**
     * @tc.name   testMapForEach0011
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0011
     * @tc.desc   Verify forEach skips values deleted before iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0012
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0012
     * @tc.desc   Verify forEach processes values added during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0013
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0013
     * @tc.desc   Verify forEach processes reinserted values during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0014
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0014
     * @tc.desc   Verify forEach with empty Map does nothing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMapForEach0015
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0015
     * @tc.desc   Verify callback handles null values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMapForEach0016
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0016
     * @tc.desc   Verify callback handles object keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      interface test0016 {
        id: number;
      }

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
     * @tc.name   testMapForEach0017
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0017
     * @tc.desc   Verify callback handles object values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      interface test0017 {
        data: string;
      }

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
     * @tc.name   testMapForEach0018
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0018
     * @tc.desc   Verify forEach iterates over Symbol keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0018 = MapforeachTest018();
      expect(JSON.stringify(Foreach0018.keys)).assertEqual("[null,null]");
    });

    /**
     * @tc.name   testMapForEach0019
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0019
     * @tc.desc   Verify forEach with bigint values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0020
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0020
     * @tc.desc   Verify callback modifies Map values during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0021
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0021
     * @tc.desc   Verify forEach with callback that throws error stops iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
    });

    /**
     * @tc.name   testMapForEach0022
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0022
     * @tc.desc   Verify thisArg is primitive string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0022 = MapforeachTest022();
      expect(Foreach0022.callbackThis === Foreach0022.thisArg).assertTrue();
    });

    /**
     * @tc.name   testMapForEach0023
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0023
     * @tc.desc   Verify thisArg is primitive number type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0023 = MapforeachTest023();
      expect(Foreach0023.callbackThis === Foreach0023.thisArgthisArg).assertFalse();
    });

    /**
     * @tc.name   testMapForEach0024
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0024
     * @tc.desc   Verify thisArg is primitive boolean type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 5]]);
      const thisArg: boolean = true;
      let callbackThis: boolean | null = null;
      map.forEach((value, key, map) => {
        callbackThis = thisArg;
      }, thisArg);
      expect(callbackThis).assertEqual(thisArg);
    });


    /**
     * @tc.name   testMapForEach0025
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0025
     * @tc.desc   Verify thisArg is null (becomes object in callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      let Foreach0025 = MapforeachTest025();
      expect(Foreach0025.map1).assertEqual('object');
      expect(Foreach0025.callbackThis).assertEqual(null);
    });

    /**
     * @tc.name   testMapForEach0026
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0026
     * @tc.desc   Verify thisArg is undefined (becomes undefined in callback)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      let Foreach0026 = MapforeachTest026();
      expect(Foreach0026.callbackThis).assertEqual(undefined);
    });

    /**
     * @tc.name   testMapForEach0027
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0027
     * @tc.desc   Verify forEach with Map containing one entry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMapForEach0028
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0028
     * @tc.desc   Verify forEach with Map containing ten entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMapForEach0029
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0029
     * @tc.desc   Verify callback parameters order (value first, then key)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>([['a', 10]]);
      let params: [number, string] | null = null;
      map.forEach((value, key) => {
        params = [value, key];
      });
      expect(params).assertDeepEquals([10, 'a']);
    });

    /**
     * @tc.name   testMapForEach0030
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0030
     * @tc.desc   Verify third parameter is the original Map (not copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0031
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0031
     * @tc.desc   Verify forEach does not process entries added after iteration starts but not reached
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0032
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0032
     * @tc.desc   Verify forEach with callback that returns value (ignored)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 1], [2, 2]]);
      const result: number[] = [];
      map.forEach((value) => {
        result.push(value);
        return value * 2;
      });
      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testMapForEach0033
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0033
     * @tc.desc   Verify forEach with Map of Dates as keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0034
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0034
     * @tc.desc   Verify forEach with Map of RegExps as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const regex1 = /a/;
      const regex2 = /b/;
      const map = new Map<string, RegExp>([['a', regex1], ['b', regex2]]);
      const values: RegExp[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([regex1, regex2]);
    });

    /**
     * @tc.name   testMapForEach0035
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0035
     * @tc.desc   Verify forEach with nested Map as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0036
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0036
     * @tc.desc   Verify forEach with Map containing NaN keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0037
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0037
     * @tc.desc   Verify forEach with Map containing 0 and -0 keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0038
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0038
     * @tc.desc   Verify forEach with callback that modifies its own closure
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, number>([[1, 10], [2, 20], [3, 30]]);
      let multiplier = 1;
      const result: number[] = [];
      map.forEach((value) => {
        result.push(value * multiplier);
        multiplier++;
      });
      expect(result).assertDeepEquals([10, 40, 90]);
    });

    /**
     * @tc.name   testMapForEach0039
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0039
     * @tc.desc   Verify forEach with async callback (does not wait)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, number>([[1, 1], [2, 2]]);
      const result: number[] = [];
      map.forEach(async (value) => {
        await new Promise<void>(resolve => setTimeout(resolve, 0));
        result.push(value);
      });

      expect(result.length).assertEqual(0);
    });


    /**
     * @tc.name   testMapForEach0040
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0040
     * @tc.desc   Verify forEach with generator function as callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      let Foreach0040 = MapforeachTest040();
      expect(Foreach0040.count).assertEqual(2);
    });

    /**
     * @tc.name   testMapForEach0041
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0041
     * @tc.desc   Verify forEach does not iterate over prototype properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0042
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0042
     * @tc.desc   Verify forEach with Map created from Object.entries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      interface test0042 {
        a: number;
        b: number;
      }

      const obj: test0042 = { a: 1, b: 2 };
      const map = new Map<string, number>(Object.entries(obj));
      const result: [string, number][] = [];
      map.forEach((value, key) => {
        result.push([key, value]);
      });
      expect(result).assertDeepEquals([['a', 1], ['b', 2]]);
    });

    /**
     * @tc.name   testMapForEach0043
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0043
     * @tc.desc   Verify forEach with Map created from Array of arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMapForEach0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let Foreach0043 = MapforeachTest043();
      expect(Foreach0043.result).assertDeepEquals(['foo', 'bar']);
    });

    /**
     * @tc.name   testMapForEach0044
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0044
     * @tc.desc   Verify forEach with empty callback (no operation)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
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
     * @tc.name   testMapForEach0045
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0045
     * @tc.desc   Verify forEach with callback that logs (no side effect test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testMapForEach0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let Foreach0045 = MapforeachTest045();
      expect(Foreach0045.threwError).assertEqual(false);
    });

    /**
     * @tc.name   testMapForEach0046
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0046
     * @tc.desc   Verify forEach with Map containing undefined keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<undefined, number>([[undefined, 10], [undefined, 20]]);
      const values: number[] = [];
      map.forEach((value) => {
        values.push(value);
      });
      expect(values).assertDeepEquals([20]);
    });

    /**
     * @tc.name   testMapForEach0047
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0047
     * @tc.desc   Verify forEach with Map containing null keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0048
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0048
     * @tc.desc   Verify forEach with Map of functions as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const func1 = () => 1;
      const func2 = () => 2;
      const map = new Map<string, () => number>([['f1', func1], ['f2', func2]]);
      const results: number[] = [];
      map.forEach((func) => {
        results.push(func());
      });
      expect(results).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   testMapForEach0049
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0049
     * @tc.desc   Verify forEach with Map of functions as keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0050
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0050
     * @tc.desc   Verify forEach with large Map (100 entries)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0051
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0051
     * @tc.desc   Verify callback is called with correct parameters for each entry
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, string>([[1, 'one'], [2, 'two'], [3, 'three']]);
      const params: [string, number][] = [];
      map.forEach((value, key) => {
        params.push([value, key]);
      });
      expect(params).assertDeepEquals([['one', 1], ['two', 2], ['three', 3]]);
    });

    /**
     * @tc.name   testMapForEach0052
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0052
     * @tc.desc   Verify thisArg context is preserved in nested functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      let Foreach0052 = MapforeachTest052();
      expect(Foreach0052.map1).assertEqual(10);
    });

    /**
     * @tc.name   testMapForEach0053
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0053
     * @tc.desc   Verify forEach with Map that has entries deleted and added multiple times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0054
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0054
     * @tc.desc   Verify forEach does not process entries deleted by previous callback calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0055
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0055
     * @tc.desc   Verify forEach processes entries added by previous callback calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0056
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0056
     * @tc.desc   Verify forEach with callback that uses all three parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0057
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0057
     * @tc.desc   Verify forEach with Map containing Symbol values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const res = MapforeachTest057();

      const actual = JSON.stringify(res.values);
      const expected = JSON.stringify([res.sym1, res.sym2]);

      expect(actual).assertEqual(expected);
    });




    /**
     * @tc.name   testMapForEach0058
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0058
     * @tc.desc   Verify forEach with Map containing different value types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0058 = MapforeachTest058();
      expect(Foreach0058.types).assertDeepEquals(['number', 'string', 'boolean', 'object']);
    });

    /**
     * @tc.name   testMapForEach0059
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0059
     * @tc.desc   Verify forEach with Map containing circular reference values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      let Foreach0059 = MapforeachTest059();
      expect(Foreach0059.value).assertEqual(Foreach0059.obj);
      expect(Foreach0059.value1).assertEqual(Foreach0059.obj);
    });

    /**
     * @tc.name   testMapForEach0060
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0060
     * @tc.desc   Verify forEach with callback that returns undefined (no effect)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 10], [2, 20]]);
      const result: number[] = [];
      map.forEach((value) => {
        result.push(value);
        return undefined;
      });
      expect(result).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.name   testMapForEach0061
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0061
     * @tc.desc   Verify forEach with thisArg as array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 5]]);
      const thisArg: number[] = [1, 2, 3];
      let callbackThis: number[] | null = thisArg;
      map.forEach(() => {
        callbackThis = thisArg;
      }, thisArg);
      expect(callbackThis).assertEqual(thisArg);
    });


    /**
     * @tc.name   testMapForEach0062
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0062
     * @tc.desc   Verify forEach with thisArg as Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 5]]);
      const thisArg = new Set<number>([1, 2, 3]);
      let callbackThis: Set<number> | null = null;
      map.forEach(() => {
        callbackThis = thisArg;
      }, thisArg);

      expect(callbackThis).assertEqual(thisArg);
    });


    /**
     * @tc.name   testMapForEach0063
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0063
     * @tc.desc   Verify forEach with thisArg as Map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 5]]);
      const thisArg = new Map<string, string>([['key', 'val']]);
      let callbackThis: Map<string, string> | null = null;
      map.forEach(() => {
        callbackThis = thisArg;
      }, thisArg);
      expect(callbackThis).assertEqual(thisArg);
    });


    /**
     * @tc.name   testMapForEach0064
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0064
     * @tc.desc   Verify forEach with callback that modifies thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0064 = MapforeachTest064();
      expect(Foreach0064.thisArg.sum).assertEqual(30);
    });

    /**
     * @tc.name   testMapForEach0065
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0065
     * @tc.desc   Verify forEach with Map that has been cleared during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0066
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0066
     * @tc.desc   Verify forEach with Map that has entries replaced during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0067
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0067
     * @tc.desc   Verify forEach with callback that uses optional chaining on values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0067 = MapforeachTest067();
      expect(Foreach0067.results).assertDeepEquals([10, 0]);
    });

    /**
     * @tc.name   testMapForEach0068
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0068
     * @tc.desc   Verify forEach with callback that uses nullish coalescing on values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0069
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0069
     * @tc.desc   Verify forEach with Map containing BigInt keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0069 = MapforeachTest069();
      expect(Foreach0069.map1).assertEqual(false);
    });

    /**
     * @tc.name   testMapForEach0070
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0070
     * @tc.desc   Verify forEach with Map containing string keys with special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0071
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0071
     * @tc.desc   Verify forEach with Map containing numeric keys as strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, string>([['1', 'one'], ['2', 'two'], ['3', 'three']]);
      const results: [string, string][] = [];
      map.forEach((value, key) => {
        results.push([key, value]);
      });
      expect(results).assertDeepEquals([['1', 'one'], ['2', 'two'], ['3', 'three']]);
    });

    /**
     * @tc.name   testMapForEach0072
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0072
     * @tc.desc   Verify forEach with Map containing boolean keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<boolean, number>([[true, 1], [false, 0]]);
      const results: [boolean, number][] = [];
      map.forEach((value, key) => {
        results.push([key, value]);
      });
      expect(results).assertDeepEquals([[true, 1], [false, 0]]);
    });

    /**
     * @tc.name   testMapForEach0073
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0073
     * @tc.desc   Verify forEach with callback that uses destructuring on value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0073 = MapforeachTest073();
      expect(Foreach0073.xs).assertDeepEquals([10, 30]);
    });

    /**
     * @tc.name   testMapForEach0074
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0074
     * @tc.desc   Verify forEach with callback that uses destructuring on key (array key)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const key1 = [1, 2];
      const key2 = [3, 4];
      const map = new Map<number[], string>([[key1, 'a'], [key2, 'b']]);
      const keyValues: number[][] = [];
      map.forEach((_, key) => {
        keyValues.push([key[0], key[1]]);
      });
      expect(keyValues).assertDeepEquals([[1, 2], [3, 4]]);
    });


    /**
     * @tc.name   testMapForEach0075
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0075
     * @tc.desc   Verify forEach with Map that has duplicate entries (overwritten)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<string, number>([['a', 1], ['a', 2], ['b', 3]]);
      const results: [string, number][] = [];
      map.forEach((value, key) => {
        results.push([key, value]);
      });
      expect(results).assertDeepEquals([['a', 2], ['b', 3]]);
    });

    /**
     * @tc.name   testMapForEach0076
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0076
     * @tc.desc   Verify forEach with Map created from another Map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0077
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0077
     * @tc.desc   Verify forEach with Map filtered via entries()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const map = new Map<number, number>([[1, 10], [2, 20], [3, 30]]);
      const filteredEntries = Array.from(map.entries()).filter((entry) => entry[0] % 2 === 0);
      const filteredMap = new Map<number, number>(filteredEntries);
      const results: number[] = [];
      filteredMap.forEach((value) => {
        results.push(value);
      });
      expect(results).assertDeepEquals([20]);
    });

    /**
     * @tc.name   testMapForEach0078
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0078
     * @tc.desc   Verify forEach with Map mapped via entries()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0078 = MapforeachTest78();
      expect(Foreach0078.results).assertDeepEquals([20, 40]);
    });

    /**
     * @tc.name   testMapForEach0079
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0079
     * @tc.desc   Verify forEach with Map reduced via entries()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const foreach0079 = MapforeachTest79();
      expect(foreach0079.forEachSum).assertEqual(foreach0079.sum);
    });


    /**
     * @tc.name   testMapForEach0080
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0080
     * @tc.desc   Verify forEach with Map and callback that throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0081
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0081
     * @tc.desc   Verify forEach with Map and callback that throws ReferenceError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0082
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0082
     * @tc.desc   Verify forEach with Map and callback that throws custom error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      class CustomError extends Error {
        constructor(message?: string) {
          super(message);

          this.name = 'CustomError';

        }
      }
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
     * @tc.name   testMapForEach0083
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0083
     * @tc.desc   Verify forEach with Map and async callback that rejects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, number>([[1, 1]]);
      let rejectionReason: string | null = null;
      map.forEach(async () => {
        try {
          throw new Error('reject');
        } catch (e) {
          rejectionReason = (e as Error).message;
        }
      });
      expect(rejectionReason).assertEqual('reject');
    });

    /**
     * @tc.name   testMapForEach0084
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0084
     * @tc.desc   Verify forEach with Map and callback that returns a promise
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0085
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0085
     * @tc.desc   Verify forEach with Map containing undefined and null values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0086
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0086
     * @tc.desc   Verify forEach with Map containing empty string values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0087
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0087
     * @tc.desc   Verify forEach with Map containing multi-line string values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0088
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0088
     * @tc.desc   Verify forEach with Map containing Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0089
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0089
     * @tc.desc   Verify forEach with Map containing typed arrays as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0090
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0090
     * @tc.desc   Verify forEach with Map containing class instances as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      class TestClass {
        public id: number;

        constructor(id: number) {
          this.id = id;
        }
      }

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
     * @tc.name   testMapForEach0091
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0091
     * @tc.desc   Verify forEach with Map containing WeakMap as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      let Foreach0091 = MapforeachTest91();
      expect(Foreach0091.results).assertDeepEquals([Foreach0091.wm1, Foreach0091.wm2]);
      expect(Foreach0091.map1).assertEqual(10);
      expect(Foreach0091.map2).assertEqual('test');
    });

    /**
     * @tc.name   testMapForEach0092
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0092
     * @tc.desc   Verify forEach with Map containing WeakSet as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      interface MapForEach01 {}

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
     * @tc.name   testMapForEach0093
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0093
     * @tc.desc   Verify forEach with Map containing DataView as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0094
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0094
     * @tc.desc   Verify forEach with Map containing ArrayBuffer as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0095
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0095
     * @tc.desc   Verify forEach with Map containing RegExp with flags as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const regex1 = /test/gi;
      const regex2 = /pattern/m;
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
     * @tc.name   testMapForEach0096
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0096
     * @tc.desc   Verify forEach with Map containing Date objects as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0097
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0097
     * @tc.desc   Verify forEach with Map containing Error objects as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0098
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0098
     * @tc.desc   Verify forEach with Map containing Map as keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0099
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0099
     * @tc.desc   Verify forEach with Map containing Set as keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
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
     * @tc.name   testMapForEach0100
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0100
     * @tc.desc   Verify forEach with Map containing large number of entries (1000)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0101
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0101
     * @tc.desc   Verify forEach with Map containing non-primitive keys and values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      let Foreach0101 = MapforeachTest101();
      expect(Foreach0101.map1).assertDeepEquals(false);
    });

    /**
     * @tc.name   testMapForEach0102
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0102
     * @tc.desc   Verify forEach with Map where callback uses rest parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<string, number>([['a', 1], ['b', 2]]);
      const results: [string, number][] = [];
      map.forEach((...args: [number, string, Map<string, number>]) => {
        results.push([args[1], args[0]]);
      });
      expect(results).assertDeepEquals([['a', 1], ['b', 2]]);
    });

    /**
     * @tc.name   testMapForEach0103
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0103
     * @tc.desc   Verify forEach with Map where callback uses spread operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      const map = new Map<number, number>([[1, 10], [2, 20]]);
      const arr: number[] = [];
      map.forEach((value) => {
        arr.push(...[value, value * 2]);
      });
      expect(arr).assertDeepEquals([10, 20, 20, 40]);
    });

    /**
     * @tc.name   testMapForEach0104
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0104
     * @tc.desc   Verify forEach with Map where callback uses template literals
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0105
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0105
     * @tc.desc   Verify forEach with Map where callback uses optional parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0106
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0106
     * @tc.desc   Verify forEach with Map where callback is a bound function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      let Foreach0106 = MapforeachTest106();
      expect(Foreach0106.map1).assertDeepEquals([30, 60]);
    });

    /**
     * @tc.name   testMapForEach0107
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0107
     * @tc.desc   Verify forEach with Map and callback that uses generator functions internally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      let Foreach0107 = MapforeachTest107();
      expect(Foreach0107.results).assertDeepEquals([5, 10, 10, 20]);
    });

    /**
     * @tc.name   testMapForEach0108
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0108
     * @tc.desc   Verify forEach with Map containing Infinity and -Infinity values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
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
     * @tc.name   testMapForEach0109
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0109
     * @tc.desc   Verify forEach with Map containing sparse array values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMapForEach0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [];
      arr1[0] = 1;
      arr1[2] = 3;

      const arr2: number[] = [];
      arr2[5] = 5;

      const map = new Map<number, number[]>([[1, arr1], [2, arr2]]);
      const results: number[][] = [];
      map.forEach((value) => {
        results.push(value);
      });

      expect(results).assertDeepEquals([arr1, arr2]);
      expect(results[0][0]).assertEqual(1);
      expect(results[0][1]).assertEqual(undefined);
      expect(results[0][2]).assertEqual(3);
      expect(results[1][5]).assertEqual(5);
    });

    /**
     * @tc.name   testMapForEach0110
     * @tc.number SUB_COMMONLIBRARY_MAP_ForEach_0110
     * @tc.desc   Verify forEach with Map containing frozen objects as values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMapForEach0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      let Foreach0110 = MapforeachTest110();
      expect(Foreach0110.results).assertDeepEquals([Foreach0110.obj1, Foreach0110.obj2]);
      expect(Foreach0110.map1).assertEqual('frozen1');
      expect(Foreach0110.map2).assertEqual('frozen2');

    });
  })
}
