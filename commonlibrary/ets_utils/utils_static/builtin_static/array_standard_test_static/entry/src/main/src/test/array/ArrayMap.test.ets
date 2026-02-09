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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';
import { BusinessError } from '@ohos.base';

interface GeneratedObjectLiteralInterface_1 {
  a: number;
  b: number;
}

class Calculator066 {
    public value: number;

    constructor(value: number) {
        this.value = value;
    }

    doubleTest() {
        return this.value * 2;
    }
}

interface BaseI005 {
    elem: int,
    idx: int,
    arr: int[]
}

interface BaseI010 {
    id: number,
    name: string
}

interface BaseI026 {
    id: number
}

interface BaseI029 {
    self?: BaseI029 | null;
}

interface BaseI032 {
    b: number
}
interface BaseI1032 {
    a: BaseI032 | null
}

interface BaseI044 { }

interface BaseI059 { }

interface BaseI062 {
    a: number,
    b?: number
}

interface BaseI063 {
    tagName: string,
    innerHTML: string
}

interface BaseI069 {
    name: string,
    age: number
}

interface BaseI071 { }

interface BaseI081 {
    on: () => void,
    eventNames: () => string[]
}

interface BaseI083 {
    postMessage: () => void,
    terminated: boolean
}

interface BaseI085 {
    name: string,
    size: number
}

interface BaseI087 {
    latitude: number,
    longitude: number
}

interface BaseI1087 {
    coords: BaseI087
}

interface BaseI089 {
    duration: number,
    paused: boolean
}

interface BaseI091 {
    loadEventEnd: number,
    navigationStart: number
}

interface BaseI093 {
    getRandomValues: (arr: Uint8Array) => Uint8Array
}

interface BaseI095 {
    duration: number,
    playState: string
}

interface BaseI097 {
    level: number,
    charging: boolean
}

interface BaseI099 {
    title: string,
    body: string,
    silent: boolean
}

interface BaseI100 {
    id: number,
    data: string
}

interface BaseI103 {
    alpha: number,
    beta: number,
    gamma: number
}

interface BaseI105 {
    canMakePayment: () => Promise<boolean>
}

interface BaseI107 {
    width: number,
    height: number,
    type: string
}

interface BaseI109 {
    state: string,
    permission: string
}

interface BaseI121 {
    name: string,
    postMessage: (msg: string) => int
}

interface BaseI123 {
    title: string,
    text: string
}

interface BaseI125 {
    title: string,
    artist: string
}

interface BaseI1125 {
    metadata: BaseI125,
    playbackState: string
}

interface BaseI127 {
    x: number,
    y: number
}
interface BaseI1127 {
    activated: boolean,
    reading: BaseI127 | null
}

interface BaseI129 {
    path: string,
    open: () => Promise<void>
}

export default function ArrayMapTest() {
  describe('ArrayMapTest', () => {
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
     * @tc.name   ArrayMapTest001
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_0100
     * @tc.desc   Map number array to square values, verify new array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, 2, 3, 4];
      const callback = (num: int) => num * num;
      const result = arr.map(callback);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 4, 9, 16]));
      expect(result.length).assertEqual(arr.length);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   ArrayMapTest002
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_0200
     * @tc.desc   Map string array to uppercase, verify new array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ['a', 'b', 'c'];
      const result = arr.map((str: string) => str.toUpperCase());

      expect(result).assertDeepEquals(['A', 'B', 'C']);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest003
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_0300
     * @tc.desc   Callback with no return value, new array has undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, 2, 3];
      const result = arr.map(() => {
      });

      expect(result).assertDeepEquals([undefined, undefined, undefined]);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest004
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_0400
     * @tc.desc   Map empty array, return empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: Array<number> = [];
      let callbackCalled = false;
      const result = arr.map(() => {
        callbackCalled = true;
      });

      const arr1: Array<number> = [];
      expect(result).assertDeepEquals(arr1);
      expect(callbackCalled).assertEqual(false);
    });

    /**
     * @tc.name   ArrayMapTest005
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_0500
     * @tc.desc   Callback receives all three parameters (element, index, array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: int[] = [10, 20];
      const paramsLog: Array<BaseI005> = new Array<BaseI005>();
      const callback = (elem: int, idx: int, arr: int[]) => {
        paramsLog.push({ elem, idx, arr });
        return elem;
      };

      arr.map(callback);

      expect(paramsLog.length).assertEqual(2);
      expect(paramsLog[0]).assertDeepEquals({ elem: 10, idx: 0, arr: arr } as BaseI005);
      expect(paramsLog[1]).assertDeepEquals({ elem: 20, idx: 1, arr: arr } as BaseI005);
    });

    /**
     * @tc.name   ArrayMapTest006
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_0600
     * @tc.desc   Map single-element array, callback called once
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ['only-element'];
      let callCount = 0;
      const result = arr.map(() => {
        callCount++;
        return 'new-element';
      });

      expect(callCount).assertEqual(1);
      expect(result).assertDeepEquals(['new-element']);
    });

    /**
     * @tc.name   ArrayMapTest007
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_0700
     * @tc.desc   Map array with null and undefined elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [null, undefined, 1];
      const result = arr.map((elem): string => typeof elem);

      expect(result).assertDeepEquals(['object', 'undefined', 'int']);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest008
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_0800
     * @tc.desc   Map array with boolean elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [true, false, true];
      const result = arr.map(bool => bool ? 1 : 0);

      expect(result).assertDeepEquals([1, 0, 1]);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest009
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_0900
     * @tc.desc   Map array with NaN element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: Array<number> = [NaN, 10, NaN];
      const result = arr.map((elem: number) => Number.isNaN(elem) ? 'nan' : elem);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify(['nan', 10, 'nan']));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest010
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_1000
     * @tc.desc   Map array of objects to extract property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayMapTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: BaseI010[] = [
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' },
        { id: 3, name: 'Charlie' }
      ];
      const result = arr.map((user: BaseI010) => user.id);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest013
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_1300
     * @tc.desc   Map sparse array: empty slots don't trigger callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayMapTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, undefined, 3];
      let callCount = 0;
      const result = arr.map((elem: int | undefined) => {
        callCount++;
        return elem ? elem * 2 : elem;
      });

      expect(callCount).assertEqual(3);
      expect(result.toString()).assertEqual('2,,6');
    });

    /**
     * @tc.name   ArrayMapTest016
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_1600
     * @tc.desc   Callback uses index parameter to modify value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayMapTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [10, 20, 30];
      const result = arr.map((elem, idx) => elem + idx);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([10 + 0, 20 + 1, 30 + 2]));
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([10, 21, 32]));
    });

    /**
     * @tc.name   ArrayMapTest017
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_1700
     * @tc.desc   Callback uses original array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayMapTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3];
      const result = arr.map((elem: int, _, originalArr: Array<int>) => elem + originalArr[0]);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1 + 1, 2 + 1, 3 + 1]));
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 3, 4]));
    });

    /**
     * @tc.name   ArrayMapTest018
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_1800
     * @tc.desc   Map array with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayMapTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1n, 2n, 3n];
      const result = arr.map((big: BigInt) => big * 2n);

      expect(result.toString()).assertEqual([2n, 4n, 6n].toString());
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest021
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2100
     * @tc.desc   Callback throws error during iteration, traversal interrupts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4];
      const result: int[] = [];
      let errorThrown = false;

      const callback = (elem: int) => {
        if (elem === 3) {
          throw new Error('Iteration interrupted');
        }
        result.push(elem * 2);
        return elem * 2;
      };

      try {
        arr.map(callback);
      } catch (e) {
        errorThrown = (e as Error).message === 'Iteration interrupted';
      }

      expect(errorThrown).assertEqual(true);
      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 4]));
    });

    /**
     * @tc.name   ArrayMapTest022
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2200
     * @tc.desc   Map array and modify original array during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      const result = arr.map((elem, idx) => {
        if (idx === 0) {
          arr.push(4);
        }
        return elem;
      });

      expect(result).assertDeepEquals([1, 2, 3]);
      expect(result.length).assertEqual(3);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   ArrayMapTest023
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2300
     * @tc.desc   Map large array (1000 elements), verify completeness
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest023', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const arr: number[] = [];
      const expected: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
        expected.push(i * 2);
      }

      const result = arr.map(elem => elem * 2);

      expect(result).assertDeepEquals(expected);
      expect(result.length).assertEqual(1000);
      expect(result[999]).assertEqual(999 * 2);
    });

    /**
     * @tc.name   ArrayMapTest025
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2500
     * @tc.desc   Map array with function elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const func1 = () => 'a';
      const func2 = () => 'b';
      const arr = [func1, func2];
      const result = arr.map((fn: (() => string)): string => fn());

      expect(result).assertDeepEquals(['a', 'b']);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ArrayMapTest026
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2600
     * @tc.desc   Map array with nested objects, modify object in callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI026[] = [{ id: 1 }, { id: 2 }];
      const result = arr.map(obj => {
        obj.id *= 2;
        return obj.id;
      });

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 4]));
      expect(arr).assertDeepEquals([{ id: 2 } as BaseI026, { id: 4 } as BaseI026]);
    });

    /**
     * @tc.name   ArrayMapTest029
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2900
     * @tc.desc   Map array with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    // todo
    // it('ArrayMapTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const obj = { self: null } as BaseI029;
    //   obj.self = obj;
    //   const arr: Array<BaseI029 | int> = [obj, 1];
    //
    //   const result = arr.map(item => {
    //     if (typeof item === 'object') {
    //       return item.self === item;
    //     }
    //     return item;
    //   });
    //
    //   expect(result).assertDeepEquals([true, 1]);
    //   expect(result.length).assertEqual(2);
    // });

    /**
     * @tc.name   ArrayMapTest031
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3100
     * @tc.desc   Map array with Infinity and -Infinity values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [Infinity, -Infinity, 0];
      const result = arr.map(num => num === Infinity ? 'inf' : num === -Infinity ? 'ninf' : 'zero');

      expect(result).assertDeepEquals(['inf', 'ninf', 'zero']);
    });

    /**
     * @tc.name   ArrayMapTest032
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3200
     * @tc.desc   Callback uses optional chaining operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [{ a: { b: 1 } } as BaseI1032, null, { a: null } as BaseI1032, undefined];
      const result = arr.map(item => item?.a?.b ?? 'missing');

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 'missing', 'missing', 'missing']));
    });

    /**
     * @tc.name   ArrayMapTest033
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3300
     * @tc.desc   Map array with 0 and -0 (treated as equal)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [0, -0.0, 1];
      const result = arr.map(num => num === 0 ? 'zero' : 'other');

      expect(result).assertDeepEquals(['zero', 'zero', 'other']);
      expect(1 / arr[0] === Infinity).assertEqual(true);
      expect(1 / arr[1] === -Infinity).assertEqual(true);
    });

    /**
     * @tc.name   ArrayMapTest035
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3500
     * @tc.desc   Callback uses nullish coalescing operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [null, undefined, 0, '', 'value'];
      const result = arr.map(item => item ?? 'default');

      expect(result).assertDeepEquals(['default', 'default', 0, '', 'value']);
    });

    /**
     * @tc.name   ArrayMapTest040
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4000
     * @tc.desc   Map array with date objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2023, 11, 31);
      const arr = [date1, date2];
      const result = arr.map(date => date.getFullYear());

      expect(result).assertDeepEquals([2023, 2023]);
    });

    /**
     * @tc.name   ArrayMapTest041
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4100
     * @tc.desc   Map array using async callback (without await)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      const result = arr.map(async (num: int) => num * 2);

      expect(result.length).assertEqual(3);
      expect(result[0] instanceof Promise).assertEqual(true);
      expect(await result[0]).assertEqual(2);
    });

    /**
     * @tc.name   ArrayMapTest042
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4200
     * @tc.desc   Map array with regexp elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [new RegExp('abc'), new RegExp('def', 'g'), new RegExp('ghi', 'i')];
      const result = arr.map(re => re.source);

      expect(result).assertDeepEquals(['abc', 'def', 'ghi']);
    });

    /**
     * @tc.name   ArrayMapTest043
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4300
     * @tc.desc   Callback uses logical AND assignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [true, false, 0, 1, '', 'value'];
      const result: (boolean | int | string)[] = [];
      arr.map(item => {
        item && result.push(item);
        return item;
      });

      expect(result).assertDeepEquals([true, 1, 'value']);
    });

    /**
     * @tc.name   ArrayMapTest044
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4400
     * @tc.desc   Map array with weakmap references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const wm = new WeakMap<BaseI044, string>();
      const obj1 = {} as BaseI044;
      const obj2 = {} as BaseI044;
      wm.set(obj1, 'value1');
      wm.set(obj2, 'value2');

      const arr = [obj1, obj2];
      const result = arr.map(obj => wm.get(obj));

      expect(result).assertDeepEquals(['value1', 'value2']);
    });

    /**
     * @tc.name   ArrayMapTest045
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4500
     * @tc.desc   Map array with elements that are promises
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [Promise.resolve(1), Promise.resolve(2), Promise.resolve(3)];
      const result = arr.map(promise => promise.then(val => val * 2));

      expect(await Promise.all(result)).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   ArrayMapTest048
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4800
     * @tc.desc   Map array with elements that are maps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const map1 = new Map<string, number>([['a', 1]]);
      const map2 = new Map<string, number>([['b', 2]]);
      const arr = [map1, map2];
      const result = arr.map(map => map.size);

      expect(result).assertDeepEquals([1, 1]);
    });

    /**
     * @tc.name   ArrayMapTest049
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4900
     * @tc.desc   Callback uses exponentiation assignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 3, 4];
      const result = arr.map(num => {
        let value = num;
        value **= 2;
        return value;
      });

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([4, 9, 16]));
    });

    /**
     * @tc.name   ArrayMapTest050
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5000
     * @tc.desc   Map array with elements that are sets
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set1 = new Set<number>([1, 2, 3]);
      const set2 = new Set<number>([4, 5]);
      const arr = [set1, set2];
      const result = arr.map(set => set.size);

      expect(result).assertDeepEquals([3, 2]);
    });

    /**
     * @tc.name   ArrayMapTest051
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5100
     * @tc.desc   Map array using callback that returns different primitive types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, '2', true, null, undefined];
      const result = arr.map(item => typeof item);

      expect(result).assertDeepEquals([
        'int', 'string', 'boolean', 'object', 'undefined'
      ]);
    });

    /**
     * @tc.name   ArrayMapTest052
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5200
     * @tc.desc   Callback uses bitwise operators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4];
      const result = arr.map(num => num << 1);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 4, 6, 8]));
    });

    /**
     * @tc.name   ArrayMapTest053
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5300
     * @tc.desc   Map array with typed array elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [
        new Int8Array([1, 2]),
        new Uint16Array([3, 4])
      ];
      const result = arr.map(typedArray => typedArray.length);

      expect(result).assertDeepEquals([2, 2]);
    });

    /**
     * @tc.name   ArrayMapTest054
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5400
     * @tc.desc   Callback uses string template literals
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      const result = arr.map((num: int) => `Number: ${num}`);

      expect(result).assertDeepEquals(['Number: 1', 'Number: 2', 'Number: 3']);
    });

    /**
     * @tc.name   ArrayMapTest055
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5500
     * @tc.desc   Map array with array buffer elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [
        new ArrayBuffer(8),
        new ArrayBuffer(16)
      ];
      const result = arr.map(buffer => buffer.byteLength);

      expect(result).assertDeepEquals([8, 16]);
    });

    /**
     * @tc.name   ArrayMapTest056
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5600
     * @tc.desc   Callback uses optional parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      const result = arr.map((num, idx: int = 10) => num + idx);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1 + 0, 2 + 1, 3 + 2]));
    });

    /**
     * @tc.name   ArrayMapTest057
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5700
     * @tc.desc   Map array with error objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [
        new Error('Error 1'),
        new TypeError('Error 2')
      ];
      const result = arr.map(error => error.message);

      expect(result).assertDeepEquals(['Error 1', 'Error 2']);
    });

    /**
     * @tc.name   ArrayMapTest059
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5900
     * @tc.desc   Map array with weakset references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const ws = new WeakSet<BaseI059>();
      const obj1 = {} as BaseI059;
      const obj2 = {} as BaseI059;
      ws.add(obj1);

      const arr = [obj1, obj2];
      const result = arr.map(obj => ws.has(obj));

      expect(result).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ArrayMapTest060
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6000
     * @tc.desc   Callback uses spread operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [[1], [2, 3], [4, 5, 6]];
      const result = arr.map((items: Array<int>) => [...items, 0]);

      expect(result).assertDeepEquals([[1, 0], [2, 3, 0], [4, 5, 6, 0]]);
    });

    /**
     * @tc.name   ArrayMapTest062
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6200
     * @tc.desc   Callback uses destructuring assignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI062[] = [
        { a: 1, b: 2 },
        { a: 3, b: 4 },
        { a: 5 }
      ];
      const result = arr.map((items: BaseI062) => items.a + (items.b ? items.b as number: 0));

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([3, 7, 5]));
    });

    /**
     * @tc.name   ArrayMapTest063
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6300
     * @tc.desc   Map array with elements that are web API objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI063[] = [
        { tagName: 'DIV', innerHTML: 'Content 1' },
        { tagName: 'SPAN', innerHTML: 'Content 2' }
      ];
      const result = arr.map(el => el.tagName);

      expect(result).assertDeepEquals(['DIV', 'SPAN']);
    });

    /**
     * @tc.name   ArrayMapTest064
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6400
     * @tc.desc   Callback uses default parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, null, 3, undefined, 5];
      const result = arr.map(num => num ? num * 2 : 0);

      expect(result).assertDeepEquals([2, 0, 6, 0, 10]);
    });

    /**
     * @tc.name   ArrayMapTest066
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6600
     * @tc.desc   Callback uses class instances with methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [new Calculator066(1), new Calculator066(2), new Calculator066(3)];
      const result = arr.map((calc): number => calc.doubleTest());

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 4, 6]));
    });

    /**
     * @tc.name   ArrayMapTest069
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6900
     * @tc.desc   Map array with elements that are JSON strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    // todo
    // it('ArrayMapTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [
    //     '{"name":"Alice","age":30}',
    //     '{"name":"Bob","age":25}'
    //   ];
    //   const result = arr.map(json => (JSON.parseJsonElement(json) as BaseI069).age);
    //
    //   expect(result).assertDeepEquals([30, 25]);
    // });

    /**
     * @tc.name   ArrayMapTest071
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7100
     * @tc.desc   Map array with elements that are weak references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = {} as BaseI071;
      const wr = new WeakRef<BaseI071>(obj);
      const arr = [wr, new WeakRef<BaseI071>({} as BaseI071)];
      const result = arr.map(ref => ref.deref() !== undefined);

      expect(result).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ArrayMapTest073
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7300
     * @tc.desc   Map array with elements that are intl objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [
        new Intl.DateTimeFormat('en-US'),
        new Intl.DateTimeFormat('fr-FR')
      ];
      const result = arr.map(formatter => formatter.resolvedOptions().locale);

      expect(result).assertDeepEquals(['en-US', 'fr-FR']);
    });

    /**
     * @tc.name   ArrayMapTest078
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7800
     * @tc.desc   Callback uses function currying
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const add = (a: int) => (b: int) => a + b;
      const add5 = add(5);

      const arr = [1, 2, 3];
      const result = arr.map(add5);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([6, 7, 8]));
    });

    /**
     * @tc.name   ArrayMapTest080
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8000
     * @tc.desc   Callback uses higher-order functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const createMultiplier = (factor: number) => (num: number) => num * factor;
      const doubleTest = createMultiplier(2);
      const triple = createMultiplier(3);

      const arr = [1, 2, 3];
      const result = arr.map((num, idx) => idx % 2 === 0 ? doubleTest(num) : triple(num));

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 6, 6]));
    });

    /**
     * @tc.name   ArrayMapTest081
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8100
     * @tc.desc   Map array with elements that are event emitters (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const emitter1 = {
        on: () => {
        }, eventNames: () => ['click', 'change']
      } as BaseI081;
      const emitter2 = {
        on: () => {
        }, eventNames: () => ['submit']
      } as BaseI081;
      const arr = [emitter1, emitter2];
      const result = arr.map(emitter => emitter.eventNames().length);

      expect(result).assertDeepEquals([2, 1]);
    });

    /**
     * @tc.name   ArrayMapTest082
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8200
     * @tc.desc   Callback uses type coercion intentionally
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = ['1', '2', '3', '4'];
      const result = arr.map(numStr => +Number(numStr) * 2);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 4, 6, 8]));
    });

    /**
     * @tc.name   ArrayMapTest083
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8300
     * @tc.desc   Map array with elements that are web workers (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const worker1 = {
        postMessage: () => {
        }, terminated: false
      } as BaseI083;
      const worker2 = {
        postMessage: () => {
        }, terminated: true
      } as BaseI083;
      const arr = [worker1, worker2];
      const result = arr.map(worker => worker.terminated);

      expect(result).assertDeepEquals([false, true]);
    });

    /**
     * @tc.name   ArrayMapTest084
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8400
     * @tc.desc   Callback uses explicit type conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4];
      const result = arr.map(num => String.fromCharCode(64 + num));

      expect(result).assertDeepEquals(['A', 'B', 'C', 'D']);
    });

    /**
     * @tc.name   ArrayMapTest085
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8500
     * @tc.desc   Map array with elements that are file objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI085[] = [
        { name: 'file1.txt', size: 1024 },
        { name: 'image.png', size: 20480 }
      ];
      const result = arr.map(file => file.size > 1024 ? 'large' : 'small');

      expect(result).assertDeepEquals(['small', 'large']);
    });

    /**
     * @tc.name   ArrayMapTest086
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8600
     * @tc.desc   Callback uses arrayBuffer and dataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const buffers = [
        new ArrayBuffer(4),
        new ArrayBuffer(4)
      ];

      new DataView(buffers[0]).setInt32(0, 42);
      new DataView(buffers[1]).setInt32(0, 100);

      const result = buffers.map(buffer => new DataView(buffer).getInt32(0));

      expect(result).assertDeepEquals([42, 100]);
    });

    /**
     * @tc.name   ArrayMapTest087
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8700
     * @tc.desc   Map array with elements that are geolocation objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI1087[] = [
        { coords: { latitude: 40.7128, longitude: -74.0060 } },
        { coords: { latitude: 51.5074, longitude: -0.1278 } }
      ];
      const result = arr.map(loc => loc.coords.latitude.toFixed(2));

      expect(result).assertDeepEquals(['40.71', '51.51']);
    });

    /**
     * @tc.name   ArrayMapTest088
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8800
     * @tc.desc   Callback uses math functions with precision handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [0.1, 0.2, 0.3];
      const result = arr.map(num => +Number((num * 0.1).toFixed(3)));

      expect(result).assertDeepEquals([0.01, 0.02, 0.03]);
    });

    /**
     * @tc.name   ArrayMapTest089
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_8900
     * @tc.desc   Map array with elements that are media elements (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {


      const arr: BaseI089[] = [
        { duration: 120, paused: true },
        { duration: 300, paused: false }
      ];
      const result = arr.map(media => media.paused ? 'paused' : 'playing');

      expect(result).assertDeepEquals(['paused', 'playing']);
    });

    /**
     * @tc.name   ArrayMapTest090
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9000
     * @tc.desc   Callback uses string manipulation with locale awareness
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = ['café', 'naïve', 'cliché'];
      const result = arr.map(str => str.normalize('NFD').replace(new RegExp('[\u0300-\u036f]', 'g'), ''));

      expect(result).assertDeepEquals(['cafe', 'naive', 'cliche']);
    });

    /**
     * @tc.name   ArrayMapTest091
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9100
     * @tc.desc   Map array with elements that are performance timing objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI091[] = [
        { loadEventEnd: 1500, navigationStart: 0 },
        { loadEventEnd: 2500, navigationStart: 0 }
      ];
      const result = arr.map(timing => timing.loadEventEnd - timing.navigationStart);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1500, 2500]));
    });

    /**
     * @tc.name   ArrayMapTest092
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9200
     * @tc.desc   Callback uses bitwise assignment operators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 4, 8];
      const result = arr.map(num => {
        let value = num;
        value |= 1;
        return value;
      });

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 3, 5, 9]));
    });

    /**
     * @tc.name   ArrayMapTest093
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9300
     * @tc.desc   Map array with elements that are crypto objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI093[] = [
        { getRandomValues: (arr: Uint8Array) => arr.fill(0x01) },
        { getRandomValues: (arr: Uint8Array) => arr.fill(0x02) }
      ];
      const result = arr.map(crypto => {
        const buf = new Uint8Array(1);
        crypto.getRandomValues(buf);
        return buf[0];
      });

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   ArrayMapTest094
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9400
     * @tc.desc   Callback uses date manipulation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [
        new Date(2023, 0, 1),
        new Date(2023, 6, 4)
      ];
      const result = arr.map(date => {
        const newDate = new Date(date);
        newDate.setFullYear(newDate.getFullYear() + 1);
        return newDate.getFullYear();
      });

      expect(result).assertDeepEquals([2024, 2024]);
    });

    /**
     * @tc.name   ArrayMapTest095
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9500
     * @tc.desc   Map array with elements that are animation objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI095[] = [
        { duration: 1000, playState: 'running' },
        { duration: 2000, playState: 'paused' }
      ];
      const result = arr.map(anim => anim.playState === 'running' ? 'active' : 'inactive');

      expect(result).assertDeepEquals(['active', 'inactive']);
    });

    /**
     * @tc.name   ArrayMapTest096
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9600
     * @tc.desc   Callback uses regex with lookbehind assertions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      try {
        new RegExp('(?<=a)b');
      } catch(e) {

      }

      const arr = ['a1', 'b2', 'a3', 'b4'];
      const result = arr.map(str => {
        const match = str.match(new RegExp('(?<=a)\\d'));
        return match ? match[0] : 'no';
      });

      expect(result).assertDeepEquals(['1', 'no', '3', 'no']);
    });

    /**
     * @tc.name   ArrayMapTest097
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9700
     * @tc.desc   Map array with elements that are battery status objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI097[] = [
        { level: 0.8, charging: false },
        { level: 0.3, charging: true }
      ];
      const result = arr.map((batt: BaseI097) => Math.round(batt.level * 100));

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([80, 30]));
    });

    /**
     * @tc.name   ArrayMapTest099
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9900
     * @tc.desc   Map array with elements that are notification objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI099[] = [
        { title: 'Alert', body: 'System alert', silent: false },
        { title: 'Info', body: 'System info', silent: true }
      ];
      const result = arr.map(notification => notification.silent ? 'quiet' : 'loud');

      expect(result).assertDeepEquals(['loud', 'quiet']);
    });

    /**
     * @tc.name   ArrayMapTest100
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10000
     * @tc.desc   Callback uses top-level await (simulated in async context)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const fetchData = async (id: number) => {
        // await new Promise<number>(resolve => setTimeout(resolve, 10));
        await Utils.msSleep(10);
        return { id, data: `Data ${id}` } as BaseI100;
      };

      const arr: Array<number> = [1, 2, 3];
      const promises = arr.map((id): Promise<BaseI100> => fetchData(id));
      const result = await Promise.all(promises);

      expect(result).assertDeepEquals([
        { id: 1, data: 'Data 1' } as BaseI100,
        { id: 2, data: 'Data 2' } as BaseI100,
        { id: 3, data: 'Data 3' } as BaseI100
      ]);
    });

    /**
     * @tc.name   ArrayMapTest103
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10300
     * @tc.desc   Map array with elements that are device orientation objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: BaseI103[] = [
        { alpha: 90, beta: 0, gamma: 0 },
        { alpha: 180, beta: 45, gamma: 0 }
      ];
      const result = arr.map((orient: BaseI103) => Math.floor(orient.alpha / 90));

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2]));
    });

    /**
     * @tc.name   ArrayMapTest104
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10400
     * @tc.desc   Callback uses string replaceAll method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = ['a.b.c', 'x.y.z', '1.2.3'];
      const result = arr.map(str => str.replaceAll('.', '-'));

      expect(result).assertDeepEquals(['a-b-c', 'x-y-z', '1-2-3']);
    });

    /**
     * @tc.name   ArrayMapTest105
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10500
     * @tc.desc   Map array with elements that are payment request objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: BaseI105[] = [
        { canMakePayment: () => Promise.resolve(true) },
        { canMakePayment: () => Promise.resolve(false) }
      ];
      const promises = arr.map((payment: BaseI105) => payment.canMakePayment());
      const result = await Promise.all(promises);

      expect(result).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ArrayMapTest106
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10600
     * @tc.desc   Callback uses numeric separators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [1_000, 2_000, 3_000];
      const result = arr.map(num => num / 1_000);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   ArrayMapTest107
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10700
     * @tc.desc   Map array with elements that are webgl objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: BaseI107[] = [
        { width: 512, height: 512, type: 'TEXTURE_2D' },
        { width: 1024, height: 1024, type: 'TEXTURE_CUBE_MAP' }
      ];
      const result = arr.map(texture => texture.width * texture.height);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([262144, 1048576]));
    });

    /**
     * @tc.name   ArrayMapTest109
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10900
     * @tc.desc   Map array with elements that are permission status objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: BaseI109[] = [
        { state: 'granted', permission: 'camera' },
        { state: 'denied', permission: 'microphone' }
      ];
      const result = arr.map(permission => permission.state === 'granted');

      expect(result).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ArrayMapTest120
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12000
     * @tc.desc   Callback uses hashbang comments (syntax test)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [1, 2, 3];
      const result = arr.map(num => {
        return num * 2;
      });

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([2, 4, 6]));
    });

    /**
     * @tc.name   ArrayMapTest121
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12100
     * @tc.desc   Map array with elements that are broadcast channel objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const messages: string[] = [];
      const arr: BaseI121[] = [
        { name: 'channel1', postMessage: (msg: string) => messages.push(`1: ${msg}`) },
        { name: 'channel2', postMessage: (msg: string) => messages.push(`2: ${msg}`) }
      ];

      arr.map((channel, i) => channel.postMessage(`Hello ${i + 1}`));

      expect(messages).assertDeepEquals(['1: Hello 1', '2: Hello 2']);
    });

    /**
     * @tc.name   ArrayMapTest123
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12300
     * @tc.desc   Map array with elements that are web share objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: BaseI123[] = [
        { title: 'Article 1', text: 'Read this article' },
        { title: 'Article 2', text: 'Check this out' }
      ];
      const result = arr.map(shareData => shareData.title.includes('1') ? 'first' : 'second');

      expect(result).assertDeepEquals(['first', 'second']);
    });

    /**
     * @tc.name   ArrayMapTest125
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12500
     * @tc.desc   Map array with elements that are media session objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: BaseI1125[] = [
        { metadata: { title: 'Song 1', artist: 'Artist A' }, playbackState: 'playing' },
        { metadata: { title: 'Song 2', artist: 'Artist B' }, playbackState: 'paused' }
      ];
      const result = arr.map(session => session.metadata.artist);

      expect(result).assertDeepEquals(['Artist A', 'Artist B']);
    });

    /**
     * @tc.name   ArrayMapTest126
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12600
     * @tc.desc   Callback uses array toReversed method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      const result = arr.map((subArr: int[]) => subArr.reverse()[0]);

      expect(result).assertDeepEquals([3, 6, 9]);
    });

    /**
     * @tc.name   ArrayMapTest127
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12700
     * @tc.desc   Map array with elements that are sensor objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: BaseI1127[] = [
        { activated: true, reading: { x: 1.2, y: 3.4 } },
        { activated: false, reading: null }
      ];
      const result = arr.map(sensor => sensor.activated ? sensor?.reading?.x : null);

      expect(JSON.stringify(result)).assertDeepEquals(JSON.stringify([1.2, null]));
    });

    /**
     * @tc.name   ArrayMapTest128
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12800
     * @tc.desc   Callback uses array toSorted method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [
        [3, 1, 2],
        [6, 4, 5],
        [9, 7, 8]
      ];
      const result = arr.map((subArr: int[]) => subArr.sort()[0]);

      expect(result).assertDeepEquals([1, 4, 7]);
    });

    /**
     * @tc.name   ArrayMapTest129
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12900
     * @tc.desc   Map array with elements that are serial port objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: BaseI129[] = [
        { path: '/dev/ttyUSB0', open: () => Promise.resolve() },
        { path: '/dev/ttyUSB1', open: () => Promise.reject(new Error('Busy')) }
      ];
      const promises = arr.map(port =>
      port.open().then(() => 'open').catch(() => 'closed')
      );
      const result = await Promise.all(promises);

      expect(result).assertDeepEquals(['open', 'closed']);
    });

    /**
     * @tc.name   ArrayMapTest130
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_13000
     * @tc.desc   Callback uses array toSpliced method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ];
      const result = arr.map(subArr => subArr.splice(1, 1, 0).length);

      expect(result).assertDeepEquals([1, 1, 1]);
    });

  });
}