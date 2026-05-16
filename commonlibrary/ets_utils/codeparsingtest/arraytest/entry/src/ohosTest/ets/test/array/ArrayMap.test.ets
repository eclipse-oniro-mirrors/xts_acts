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
  ArrayMapTest011,
  ArrayMapTest012,
  ArrayMapTest013,
  ArrayMapTest014,
  ArrayMapTest019,
  ArrayMapTest020,
  ArrayMapTest024,
  ArrayMapTest027,
  ArrayMapTest028,
  ArrayMapTest030,
  ArrayMapTest036,
  ArrayMapTest037,
  ArrayMapTest038,
  ArrayMapTest039,
  ArrayMapTest046,
  ArrayMapTest047,
  ArrayMapTest058,
  ArrayMapTest061,
  ArrayMapTest065,
  ArrayMapTest067,
  ArrayMapTest068,
  ArrayMapTest070,
  ArrayMapTest072,
  ArrayMapTest074,
  ArrayMapTest075,
  ArrayMapTest077,
  ArrayMapTest079,
  ArrayMapTest098,
  ArrayMapTest101,
  ArrayMapTest102,
  ArrayMapTest108,
  ArrayMapTest110,
  ArrayMapTest112,
  ArrayMapTest113,
  ArrayMapTest114,
  ArrayMapTest115,
  ArrayMapTest116,
  ArrayMapTest117,
  ArrayMapTest118,
  ArrayMapTest119,
  ArrayMapTest122,
  ArrayMapTest124
} from './ArrayMap';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

interface GeneratedObjectLiteralInterface_1 {
  a: number;
  b: number;
}

export default function ArrayMapTest() {
  describe('ArrayMapTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
      const callback = (num: number) => num * num;
      const result = arr.map(callback);

      expect(result).assertDeepEquals([1, 4, 9, 16]);
      expect(result.length).assertEqual(arr.length);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
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
      const result = arr.map(str => str.toUpperCase());

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
      const arr = [];
      let callbackCalled = false;
      const result = arr.map(() => {
        callbackCalled = true;
      });

      expect(result).assertDeepEquals([]);
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
      interface BaseI {
        elem: number,
        idx: number,
        arr: number[]
      }

      const arr = [10, 20];
      const paramsLog: BaseI[] = [];
      const callback = (elem: number, idx: number, arr: number[]) => {
        paramsLog.push({ elem, idx, arr });
        return elem;
      };

      arr.map(callback);

      expect(paramsLog.length).assertEqual(2);
      expect(paramsLog[0]).assertDeepEquals({ elem: 10, idx: 0, arr: arr });
      expect(paramsLog[1]).assertDeepEquals({ elem: 20, idx: 1, arr: arr });
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
      const result = arr.map(elem => typeof elem);

      expect(result).assertDeepEquals(['object', 'undefined', 'number']);
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
      const arr = [NaN, 10, NaN];
      const result = arr.map(elem => Number.isNaN(elem) ? 'nan' : elem);

      expect(result).assertDeepEquals(['nan', 10, 'nan']);
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
      interface BaseI {
        id: number,
        name: string
      }

      const arr: BaseI[] = [
        { id: 1, name: 'Alice' },
        { id: 2, name: 'Bob' },
        { id: 3, name: 'Charlie' }
      ];
      const result = arr.map(user => user.id);

      expect(result).assertDeepEquals([1, 2, 3]);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest011
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_1100
     * @tc.desc   Use thisArg to bind this in callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayMapTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayMapTest011()).assertDeepEquals([10, 20, 30]);
    });

    /**
     * @tc.name   ArrayMapTest012
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_1200
     * @tc.desc   No thisArg: this is undefined in strict mode callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayMapTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayMapTest012()).assertEqual(undefined);
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
      const arr = [1, , 3];
      let callCount = 0;
      const result = arr.map(elem => {
        callCount++;
        return elem ? elem * 2 : elem;
      });

      expect(callCount).assertEqual(2);
      expect(result.toString()).assertEqual('2,,6');
      expect(ArrayMapTest013(result)).assertEqual(false);
    });

    /**
     * @tc.name   ArrayMapTest014
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_1400
     * @tc.desc   Map non-array object (class array) via call()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayMapTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayMapTest014() as string[];

      expect(result).assertDeepEquals(['A', 'B', 'C']);
      expect(result.length).assertEqual(3);
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

      expect(result).assertDeepEquals([10 + 0, 20 + 1, 30 + 2]);
      expect(result).assertDeepEquals([10, 21, 32]);
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
      const result = arr.map((elem, _, originalArr) => elem + originalArr[0]);

      expect(result).assertDeepEquals([1 + 1, 2 + 1, 3 + 1]);
      expect(result).assertDeepEquals([2, 3, 4]);
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
      const result = arr.map(big => big * 2n);

      expect(result.toString()).assertEqual([2n, 4n, 6n].toString());
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest019
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_1900
     * @tc.desc   Map array with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayMapTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayMapTest019();

      expect(result).assertDeepEquals(['a', 'b']);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ArrayMapTest020
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2000
     * @tc.desc   thisArg is primitive value (converted to object)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayMapTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayMapTest020();

      expect(result).assertDeepEquals([2 * 5]);
      expect(result).assertDeepEquals([10]);
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
      const result: number[] = [];
      let errorThrown = false;

      const callback = (elem: number) => {
        if (elem === 3) {
          throw new Error('Iteration interrupted');
        }
        result.push(elem * 2);
        return elem * 2;
      };

      try {
        arr.map(callback);
      } catch (e) {
        errorThrown = e.message === 'Iteration interrupted';
      }

      expect(errorThrown).assertEqual(true);
      expect(result).assertDeepEquals([2, 4]);
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
     * @tc.name   ArrayMapTest024
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2400
     * @tc.desc   Callback is arrow function (ignores thisArg)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayMapTest024();

      expect(result[0]).assertDeepEquals([4]);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
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
      const result = arr.map((fn): string => fn());

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
      interface BaseI {
        id: number
      }

      const arr: BaseI[] = [{ id: 1 }, { id: 2 }];
      const result = arr.map(obj => {
        obj.id *= 2;
        return obj.id;
      });

      expect(result).assertDeepEquals([2, 4]);
      expect(arr).assertDeepEquals([{ id: 2 }, { id: 4 }]);
    });

    /**
     * @tc.name   ArrayMapTest027
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2700
     * @tc.desc   Callback is non-function (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2];
      let errorThrown = false;

      try {
        ArrayMapTest027(arr);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArrayMapTest028
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2800
     * @tc.desc   Map non-array object without length (returns empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayMapTest028() as string[];

      expect(result).assertDeepEquals([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ArrayMapTest029
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_2900
     * @tc.desc   Map array with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        self?: BaseI | null;
      }

      const obj = { self: null } as BaseI;
      obj.self = obj;
      const arr = [obj, 1];

      const result = arr.map(item => {
        if (typeof item === 'object') {
          return item.self === item;
        }
        return item;
      });

      expect(result).assertDeepEquals([true, 1]);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ArrayMapTest030
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3000
     * @tc.desc   Comprehensive test: mixed types + thisArg + sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = ArrayMapTest030() as (number | null | string | bigint | undefined)[];

      expect(result.toString()).assertEqual([
        20,
        40,
        null,
        null,
      ,
        100,
        'test',
        120n
      ].toString());
      expect(result.length).assertEqual(8);
    });

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
      interface BaseI {
        b: number
      }

      interface BaseI1 {
        a: BaseI | null
      }

      const arr = [{ a: { b: 1 } } as BaseI1, null, { a: null } as BaseI1, undefined];
      const result = arr.map(item => item?.a?.b ?? 'missing');

      expect(result).assertDeepEquals([1, 'missing', 'missing', 'missing']);
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
      const arr = [0, -0, 1];
      const result = arr.map(num => num === 0 ? 'zero' : 'other');

      expect(result).assertDeepEquals(['zero', 'zero', 'other']);
      expect(1 / arr[0] === Infinity).assertEqual(true);
      expect(1 / arr[1] === -Infinity).assertEqual(true);
    });

    /**
     * @tc.name   ArrayMapTest034
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3400
     * @tc.desc   Map array of functions with different arity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const func0 = () => 'zero';
      const func1 = (a: number) => 'one';
      const func2 = (a: number, b: number) => 'two';
      const arr = [func0, func1, func2];
      const result = arr.map(fn => fn.length);

      expect(result).assertDeepEquals([0, 1, 2]);
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
     * @tc.name   ArrayMapTest036
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3600
     * @tc.desc   Map array with frozen objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest036()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   ArrayMapTest037
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3700
     * @tc.desc   Map array using generator function as callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest037()).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   ArrayMapTest038
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3800
     * @tc.desc   Map array with getter properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest038()).assertDeepEquals([10, 20]);
    });

    /**
     * @tc.name   ArrayMapTest039
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_3900
     * @tc.desc   Callback modifies own prototype chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest039()).assertDeepEquals([2, 4]);
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
      const result = arr.map(async num => num * 2);

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
      const arr = [/abc/, /def/g, /ghi/i];
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
      const result: (boolean | number | string)[] = [];
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
      interface BaseI {}

      const wm = new WeakMap<BaseI, string>();
      const obj1 = {} as BaseI;
      const obj2 = {} as BaseI;
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
     * @tc.name   ArrayMapTest046
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4600
     * @tc.desc   Callback uses logical OR assignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest046()).assertDeepEquals([0, '', false, 1, 'value', true]);
    });

    /**
     * @tc.name   ArrayMapTest047
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_4700
     * @tc.desc   Map array with proxy objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest047()).assertDeepEquals([20, 20]);
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
      const map1 = new Map([['a', 1]]);
      const map2 = new Map([['b', 2]]);
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

      expect(result).assertDeepEquals([4, 9, 16]);
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
      const set1 = new Set([1, 2, 3]);
      const set2 = new Set([4, 5]);
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
        'number', 'string', 'boolean', 'object', 'undefined'
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

      expect(result).assertDeepEquals([2, 4, 6, 8]);
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
      const result = arr.map(num => `Number: ${num}`);

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
      const result = arr.map((num, idx = 10) => num + idx);

      expect(result).assertDeepEquals([1 + 0, 2 + 1, 3 + 2]);
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
     * @tc.name   ArrayMapTest058
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_5800
     * @tc.desc   Callback uses rest parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest058()).assertDeepEquals([1, 1, 1]);
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
      interface BaseI {}

      const ws = new WeakSet();
      const obj1 = {} as BaseI;
      const obj2 = {} as BaseI;
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
      const result = arr.map(items => [...items, 0]);

      expect(result).assertDeepEquals([[1, 0], [2, 3, 0], [4, 5, 6, 0]]);
    });

    /**
     * @tc.name   ArrayMapTest061
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6100
     * @tc.desc   Map array with elements that are module names (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest061()).assertDeepEquals(['1.0', '2.0']);
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
      interface BaseI {
        a: number,
        b?: number
      }

      const arr: BaseI[] = [
        { a: 1, b: 2 },
        { a: 3, b: 4 },
        { a: 5 }
      ];
      const result = arr.map((items) => items.a + (items.b ? items.b : 0));

      expect(result).assertDeepEquals([3, 7, 5]);
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
      interface BaseI {
        tagName: string,
        innerHTML: string
      }

      const arr: BaseI[] = [
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
     * @tc.name   ArrayMapTest065
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6500
     * @tc.desc   Map array with elements that are promises (mixed resolved/rejected)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(await Promise.all(ArrayMapTest065())).assertDeepEquals([1, 'error', 3]);
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
      class Calculator {
        public value: number;

        constructor(value: number) {
          this.value = value;
        }

        double() {
          return this.value * 2;
        }
      }

      const arr = [new Calculator(1), new Calculator(2), new Calculator(3)];
      const result = arr.map((calc): number => calc.double());

      expect(result).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   ArrayMapTest067
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6700
     * @tc.desc   Map array with elements that are reflection objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj: GeneratedObjectLiteralInterface_1 = { a: 1, b: 2 };
      const arr = [Reflect.get, Reflect.has, Reflect.deleteProperty];
      const result = arr.map(method => method(obj, 'a'));

      expect(result).assertDeepEquals([1, true, true]);
      expect(ArrayMapTest067(obj)).assertEqual(false);
    });

    /**
     * @tc.name   ArrayMapTest068
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6800
     * @tc.desc   Callback uses dynamic property names
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        value?: number;
        other?: number
      }

      const prop = 'value';
      const arr: BaseI[] = [
        { value: 10 },
        { value: 20 },
        { other: 30 }
      ];

      expect(ArrayMapTest068(arr, prop)).assertDeepEquals([10, 20, 0]);
    });

    /**
     * @tc.name   ArrayMapTest069
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_6900
     * @tc.desc   Map array with elements that are JSON strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        name: string,
        age: number
      }

      const arr = [
        '{"name":"Alice","age":30}',
        '{"name":"Bob","age":25}'
      ];
      const result = arr.map(json => (JSON.parse(json) as BaseI).age);

      expect(result).assertDeepEquals([30, 25]);
    });

    /**
     * @tc.name   ArrayMapTest070
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7000
     * @tc.desc   Callback uses function binding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest070()).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.name   ArrayMapTest071
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7100
     * @tc.desc   Map array with elements that are weak references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {}

      if (typeof WeakRef === 'undefined') {
        return;
      }

      const obj = {} as BaseI;
      const wr = new WeakRef(obj);
      const arr = [wr, new WeakRef({} as BaseI)];
      const result = arr.map(ref => ref.deref() !== undefined);

      expect(result).assertDeepEquals([true, true]);
    });

    /**
     * @tc.name   ArrayMapTest072
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7200
     * @tc.desc   Callback uses function composition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest072()).assertDeepEquals([3, 5, 7]);
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
     * @tc.name   ArrayMapTest074
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7400
     * @tc.desc   Callback uses memoization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayMapTest074() as (Map<number, number> | number[])[];

      expect(result[1]).assertDeepEquals([2, 4, 2, 6, 4]);
      expect((result[0] as Map<number, number>).size).assertEqual(3);
    });

    /**
     * @tc.name   ArrayMapTest075
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7500
     * @tc.desc   Map array with elements that are generators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest075()).assertDeepEquals([3, 7]);
    });

    /**
     * @tc.name   ArrayMapTest076
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7600
     * @tc.desc   Callback uses recursion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const factorial = (n: number): number => n <= 1 ? 1 : n * factorial(n - 1);
      const arr = [1, 2, 3, 4, 5];
      const result = arr.map(factorial);

      expect(result).assertDeepEquals([1, 2, 6, 24, 120]);
    });

    /**
     * @tc.name   ArrayMapTest077
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7700
     * @tc.desc   Map array with elements that are iterators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayMapTest077()).assertDeepEquals([1, 3]);
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
      const add = (a: number) => (b: number) => a + b;
      const add5 = add(5);

      const arr = [1, 2, 3];
      const result = arr.map(add5);

      expect(result).assertDeepEquals([6, 7, 8]);
    });

    /**
     * @tc.name   ArrayMapTest079
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_7900
     * @tc.desc   Map array with elements that are async iterators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(await Promise.all(ArrayMapTest079())).assertDeepEquals([2, 4]);
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
      const double = createMultiplier(2);
      const triple = createMultiplier(3);

      const arr = [1, 2, 3];
      const result = arr.map((num, idx) => idx % 2 === 0 ? double(num) : triple(num));

      expect(result).assertDeepEquals([2, 6, 6]);
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
      interface BaseI {
        on: () => void,
        eventNames: () => string[]
      }

      const emitter1 = {
        on: () => {
        }, eventNames: () => ['click', 'change']
      } as BaseI;
      const emitter2 = {
        on: () => {
        }, eventNames: () => ['submit']
      } as BaseI;
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

      expect(result).assertDeepEquals([2, 4, 6, 8]);
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
      interface BaseI {
        postMessage: () => void,
        terminated: boolean
      }

      const worker1 = {
        postMessage: () => {
        }, terminated: false
      } as BaseI;
      const worker2 = {
        postMessage: () => {
        }, terminated: true
      } as BaseI;
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
      interface BaseI {
        name: string,
        size: number
      }

      const arr: BaseI[] = [
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
      interface BaseI {
        latitude: number,
        longitude: number
      }

      interface BaseI1 {
        coords: BaseI
      }

      const arr: BaseI1[] = [
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
      interface BaseI {
        duration: number,
        paused: boolean
      }

      const arr: BaseI[] = [
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
      const result = arr.map(str => str.normalize('NFD').replace(/[\u0300-\u036f]/g, ''));

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
      interface BaseI {
        loadEventEnd: number,
        navigationStart: number
      }

      const arr: BaseI[] = [
        { loadEventEnd: 1500, navigationStart: 0 },
        { loadEventEnd: 2500, navigationStart: 0 }
      ];
      const result = arr.map(timing => timing.loadEventEnd - timing.navigationStart);

      expect(result).assertDeepEquals([1500, 2500]);
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

      expect(result).assertDeepEquals([1, 3, 5, 9]);
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
      interface BaseI {
        getRandomValues: (arr: Uint8Array) => Uint8Array
      }

      const arr: BaseI[] = [
        { getRandomValues: (arr: Uint8Array) => arr.fill(0x01) },
        { getRandomValues: (arr: Uint8Array) => arr.fill(0x02) }
      ];
      const result = arr.map(crypto => {
        const buf = new Uint8Array(1);
        crypto.getRandomValues(buf);
        return buf[0];
      });

      expect(result).assertDeepEquals([1, 2]);
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
      interface BaseI {
        duration: number,
        playState: string
      }

      const arr: BaseI[] = [
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
      } catch {
        return;
      }

      const arr = ['a1', 'b2', 'a3', 'b4'];
      const result = arr.map(str => {
        const match = str.match(/(?<=a)\d/);
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
      interface BaseI {
        level: number,
        charging: boolean
      }

      const arr: BaseI[] = [
        { level: 0.8, charging: false },
        { level: 0.3, charging: true }
      ];
      const result = arr.map(batt => Math.round(batt.level * 100));

      expect(result).assertDeepEquals([80, 30]);
    });

    /**
     * @tc.name   ArrayMapTest098
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_9800
     * @tc.desc   Callback uses dynamic import (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayMapTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(await Promise.all(ArrayMapTest098())).assertDeepEquals([5, 'TEST']);
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
      interface BaseI {
        title: string,
        body: string,
        silent: boolean
      }

      const arr: BaseI[] = [
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
      interface BaseI {
        id: number,
        data: string
      }

      const fetchData = async (id: number) => {
        await new Promise<number>(resolve => setTimeout(resolve, 10));
        return { id, data: `Data ${id}` } as BaseI;
      };

      const arr = [1, 2, 3];
      const promises = arr.map((id): Promise<BaseI> => fetchData(id));
      const result = await Promise.all(promises);

      expect(result).assertDeepEquals([
        { id: 1, data: 'Data 1' },
        { id: 2, data: 'Data 2' },
        { id: 3, data: 'Data 3' }
      ]);
    });

    /**
     * @tc.name   ArrayMapTest101
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10100
     * @tc.desc   Map array with elements that are cache objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayMapTest101()).assertDeepEquals([200, 404]);
    });

    /**
     * @tc.name   ArrayMapTest102
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10200
     * @tc.desc   Callback uses array groupBy polyfill
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        odd?: number[],
        even: number[]
      }

      const result = ArrayMapTest102() as BaseI[];
      expect(result.length).assertEqual(3);
      expect(result[0]).assertDeepEquals({ odd: [1, 3], even: [2] });
      expect(result[1]).assertDeepEquals({ odd: [5], even: [4] });
      expect(result[2]).assertDeepEquals({ even: [6] });
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
      interface BaseI {
        alpha: number,
        beta: number,
        gamma: number
      }

      const arr: BaseI[] = [
        { alpha: 90, beta: 0, gamma: 0 },
        { alpha: 180, beta: 45, gamma: 0 }
      ];
      const result = arr.map(orient => Math.floor(orient.alpha / 90));

      expect(result).assertDeepEquals([1, 2]);
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
      interface BaseI {
        canMakePayment: () => Promise<boolean>
      }

      const arr: BaseI[] = [
        { canMakePayment: () => Promise.resolve(true) },
        { canMakePayment: () => Promise.resolve(false) }
      ];
      const promises = arr.map(payment => payment.canMakePayment());
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

      expect(result).assertDeepEquals([1, 2, 3]);
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
      interface BaseI {
        width: number,
        height: number,
        type: string
      }

      const arr: BaseI[] = [
        { width: 512, height: 512, type: 'TEXTURE_2D' },
        { width: 1024, height: 1024, type: 'TEXTURE_CUBE_MAP' }
      ];
      const result = arr.map(texture => texture.width * texture.height);

      expect(result).assertDeepEquals([262144, 1048576]);
    });

    /**
     * @tc.name   ArrayMapTest108
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_10800
     * @tc.desc   Callback uses logical assignment operators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayMapTest108()).assertDeepEquals(['default', 1, 'default', 'hello', 'default', 'default']);
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
      interface BaseI {
        state: string,
        permission: string
      }

      const arr: BaseI[] = [
        { state: 'granted', permission: 'camera' },
        { state: 'denied', permission: 'microphone' }
      ];
      const result = arr.map(permission => permission.state === 'granted');

      expect(result).assertDeepEquals([true, false]);
    });

    /**
     * @tc.name   ArrayMapTest110
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_11000
     * @tc.desc   Callback uses top-level await with dynamic import (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(await ArrayMapTest110()).assertDeepEquals(['TEST', 12]);
    });

    /**
     * @tc.name   ArrayMapTest112
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_11200
     * @tc.desc   Callback uses array findLast method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayMapTest112()).assertDeepEquals([3, 6, 12]);
    });

    /**
     * @tc.name   ArrayMapTest113
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_11300
     * @tc.desc   Map array with elements that are scheduler objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(await ArrayMapTest113()).assertDeepEquals([0, 1]);
    });

    /**
     * @tc.name   ArrayMapTest114
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_11400
     * @tc.desc   Callback uses string at method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayMapTest114()).assertDeepEquals(['o', 'd', 't']);
    });

    /**
     * @tc.name   ArrayMapTest115
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_11500
     * @tc.desc   Map array with elements that are web assembly modules (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayMapTest115()).assertDeepEquals([5, 6]);
    });

    /**
     * @tc.name   ArrayMapTest116
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_11600
     * @tc.desc   Callback uses array findLastIndex method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayMapTest116()).assertDeepEquals([2, 1, 3]);
    });

    /**
     * @tc.name   ArrayMapTest117
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_11700
     * @tc.desc   Map array with elements that are background fetch objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayMapTest117()).assertDeepEquals([100, 50]);
    });

    /**
     * @tc.name   ArrayMapTest118
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_11800
     * @tc.desc   Callback uses array with() method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayMapTest118()).assertDeepEquals([[1, 0, 3], [4, 0, 6], [7, 0, 9]]);
    });

    /**
     * @tc.name   ArrayMapTest119
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_11900
     * @tc.desc   Map array with elements that are content index objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(await ArrayMapTest119()).assertDeepEquals(['article1', 'article2']);
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

      expect(result).assertDeepEquals([2, 4, 6]);
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
      interface BaseI {
        name: string,
        postMessage: (msg: string) => number
      }

      const messages: string[] = [];
      const arr: BaseI[] = [
        { name: 'channel1', postMessage: (msg: string) => messages.push(`1: ${msg}`) },
        { name: 'channel2', postMessage: (msg: string) => messages.push(`2: ${msg}`) }
      ];

      arr.map((channel, i) => channel.postMessage(`Hello ${i + 1}`));

      expect(messages).assertDeepEquals(['1: Hello 1', '2: Hello 2']);
    });

    /**
     * @tc.name   ArrayMapTest122
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12200
     * @tc.desc   Callback uses array groupByToMap method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        odd: number,
        even: number
      }

      const result = ArrayMapTest122() as BaseI[];
      expect(result.length).assertEqual(3);
      expect(result[0]).assertDeepEquals({ odd: 2, even: 1 });
      expect(result[1]).assertDeepEquals({ odd: 1, even: 1 });
      expect(result[2]).assertDeepEquals({ odd: 0, even: 1 });
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
      interface BaseI {
        title: string,
        text: string
      }

      const arr: BaseI[] = [
        { title: 'Article 1', text: 'Read this article' },
        { title: 'Article 2', text: 'Check this out' }
      ];
      const result = arr.map(shareData => shareData.title.includes('1') ? 'first' : 'second');

      expect(result).assertDeepEquals(['first', 'second']);
    });

    /**
     * @tc.name   ArrayMapTest124
     * @tc.number SUB_BUILTINS_ARRAY_MAP_TEST_12400
     * @tc.desc   Callback uses Temporal API (simulated if not available)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayMapTest124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayMapTest124()).assertDeepEquals([2024, 2024]);
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
      interface BaseI {
        title: string,
        artist: string
      }

      interface BaseI1 {
        metadata: BaseI,
        playbackState: string
      }

      const arr: BaseI1[] = [
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
      const result = arr.map((subArr: number[]) => subArr.reverse()[0]);

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
      interface BaseI {
        x: number,
        y: number
      }

      interface BaseI1 {
        activated: boolean,
        reading: BaseI | null
      }

      const arr: BaseI1[] = [
        { activated: true, reading: { x: 1.2, y: 3.4 } },
        { activated: false, reading: null }
      ];
      const result = arr.map(sensor => sensor.activated ? sensor.reading?.x : null);

      expect(result).assertDeepEquals([1.2, null]);
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
      const result = arr.map((subArr: number[]) => subArr.sort()[0]);

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
      interface BaseI {
        path: string,
        open: () => Promise<void>
      }

      const arr: BaseI[] = [
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