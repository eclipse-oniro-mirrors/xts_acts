/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

class Base128 {
    a: number = 10;
    b: number = 20;
    c?: number;
    get sum() {
        this.c = this.a + this.b;
        return this.c;
    }
}

interface BaseI005 {
    value: number
}

interface BaseI011 {
    acc: int,
    curr: int,
    idx: int,
    arr: int[]
}

interface BaseI012 {
    acc: int,
    curr: int,
    idx: int,
    arr: int[]
}

interface BaseI029 {
    self: BaseI029 | null,
    sum: int
}

interface BaseI065 { }

interface BaseI067 {
    value: int
}

interface BaseI074 {
    match: string | undefined,
    index: number
}

interface BaseI080 {
    value: number
}

interface BaseI082 {
    value: number
}
interface BaseI1082 {
    prop: BaseI082 | null
}

interface BaseI088 {
    name: string,
    score?: number | null
}

interface BaseI099 {
    add?: (a: number, b: number) => number,
    multiply?: (a: number, b: number) => number
}
interface BaseI1099 {
    exports: BaseI099
}
interface BaseI2099 {
    instance: BaseI1099
}

interface BaseI100 {
    id: number,
    value?: number
    children?: BaseI100[]
}

interface BaseI101 {
    source: string,
    flags: string
}

interface BaseI103 { }
interface BaseI1103 {
    hasObj1: boolean
    hasObj3: boolean
    hasObj2: boolean
}

interface BaseI106 {
    value: number
}

interface BaseI118 {
    width: number,
    height: number,
    close: () => void
}
interface BaseI1118 {
    totalArea: number
}

type numOrArr042 = (number | numOrArr042)[];

type numOrArr051 = (number | numOrArr051)[];


export default function ArrayReduceTest() {
  describe('ArrayReduceTest', () => {
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
     * @tc.name   ArrayReduceTest001
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0100
     * @tc.desc   Sum numbers without initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, 2, 3, 4];
      const callback = (acc: int, curr: int) => acc + curr;
      const result = arr.reduce(callback);

      expect(result).assertEqual(10);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3, 4]));
    });

    /**
     * @tc.name   ArrayReduceTest002
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0200
     * @tc.desc   Sum numbers with initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, 2, 3, 4];
      const initialValue = 10;
      const callback = (acc: int, curr: int) => acc + curr;
      const result = arr.reduce(callback, initialValue);

      expect(result).assertEqual(20);
    });

    /**
     * @tc.name   ArrayReduceTest003
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0300
     * @tc.desc   Concatenate strings without initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ['a', 'b', 'c'];
      const callback = (acc: string, curr: string) => acc + curr;
      const result = arr.reduce(callback);

      expect(result).assertEqual('abc');
    });

    /**
     * @tc.name   ArrayReduceTest004
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0400
     * @tc.desc   Concatenate strings with initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ['b', 'c'];
      const initialValue = 'a';
      const callback = (acc: string, curr: string) => acc + curr;
      const result = arr.reduce(callback, initialValue);

      expect(result).assertEqual('abc');
    });

    /**
     * @tc.name   ArrayReduceTest005
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0500
     * @tc.desc   Sum object properties with initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: BaseI005[] = [
        { value: 10 },
        { value: 20 },
        { value: 30 }
      ];
      const callback = (acc: number, curr: BaseI005) => acc + curr.value;
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest007
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0700
     * @tc.desc   Find maximum number without initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [5, 2, 9, 1];
      const callback = (acc: int, curr: int) => Math.max(acc, curr) as int;
      const result = arr.reduce(callback);

      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   ArrayReduceTest008
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0800
     * @tc.desc   Find minimum number with initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [5, 2, 9, 1];
      const initialValue = 10;
      const callback = (acc: int, curr: int) => Math.min(acc, curr) as int;
      const result = arr.reduce(callback, initialValue);

      expect(result).assertEqual(1);
    });

    /**
     * @tc.name   ArrayReduceTest009
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0900
     * @tc.desc   Single-element array without initialValue (no callback call)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ['only-element'];
      let callbackCalled = false;
      const callback = () => {
        callbackCalled = true;
        return 'modified';
      };
      const result = arr.reduce(callback);

      expect(result).assertEqual('only-element');
      expect(callbackCalled).assertEqual(false);
    });

    /**
     * @tc.name   ArrayReduceTest010
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1000
     * @tc.desc   Single-element array with initialValue (callback called once)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [5];
      let callCount = 0;
      const initialValue = 10;
      const callback = (acc: int, curr: int) => {
        callCount++;
        return acc + curr;
      };
      const result = arr.reduce(callback, initialValue);

      expect(callCount).assertEqual(1);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ArrayReduceTest011
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1100
     * @tc.desc   Verify callback parameters (index and array) without initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayReduceTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [10, 20, 30];
      const paramsLog: BaseI011[] = [];
      const callback = (acc: int, curr: int, idx: int, arr: int[]) => {
        paramsLog.push({ acc, curr, idx, arr });
        return acc + curr;
      };

      arr.reduce(callback);

      expect(paramsLog.length).assertEqual(2);
      expect(paramsLog[0]).assertDeepEquals({ acc: 10, curr: 20, idx: 1, arr: arr } as BaseI011);
      expect(paramsLog[1]).assertDeepEquals({ acc: 30, curr: 30, idx: 2, arr: arr } as BaseI011);
    });

    /**
     * @tc.name   ArrayReduceTest012
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1200
     * @tc.desc   Verify callback parameters (index and array) with initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayReduceTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [10, 20, 30];
      const initialValue = 5;
      const paramsLog: BaseI012[] = [];
      const callback = (acc: int, curr: int, idx: int, arr: int[]) => {
        paramsLog.push({ acc, curr, idx, arr });
        return acc + curr;
      };

      arr.reduce(callback, initialValue);

      expect(paramsLog.length).assertEqual(3);
      expect(paramsLog[0]).assertDeepEquals({ acc: 5, curr: 10, idx: 0, arr: arr } as BaseI012);
      expect(paramsLog[1]).assertDeepEquals({ acc: 15, curr: 20, idx: 1, arr: arr } as BaseI012);
      expect(paramsLog[2]).assertDeepEquals({ acc: 35, curr: 30, idx: 2, arr: arr } as BaseI012);
    });

    /**
     * @tc.name   ArrayReduceTest013
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1300
     * @tc.desc   Reduce sparse array (empty slots are skipped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayReduceTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, undefined, 3, undefined, 5];
      let callCount = arr[0]? 1 : 0;
      const callback = (acc: int | undefined, curr: (int | undefined)) => {
        callCount++;
        if (acc && curr) {
          return acc + curr;
        } else if (acc) {
          return acc;
        } else {
          return 0;
        }
      };
      const result = arr.reduce(callback);

      expect(callCount).assertEqual(5);
      expect(result).assertEqual(1 + 3 + 5);
    });

    /**
     * @tc.name   ArrayReduceTest016
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1600
     * @tc.desc   Reduce array with undefined values (not skipped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayReduceTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, undefined, 3, undefined, 5];
      let callCount = 0;
      const callback = (acc: int | undefined, curr: (int | undefined)) => {
        callCount++;
        if (acc !== undefined && curr) {
          return acc + curr;
        } else if (acc) {
          return acc;
        } else {
          return 0;
        }
      };
      const result = arr.reduce(callback, 0);

      expect(callCount).assertEqual(5);
      expect(result).assertEqual(1 + 0 + 3 + 0 + 5);
    });

    /**
     * @tc.name   ArrayReduceTest017
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1700
     * @tc.desc   Reduce array with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayReduceTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1n, 2n, 3n];
      const initialValue = 0n;
      const callback = (acc: bigint, curr: bigint) => acc + curr;
      const result = arr.reduce(callback, initialValue);

      expect(result).assertEqual(6n);
    });

    /**
     * @tc.name   ArrayReduceTest019
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1900
     * @tc.desc   Empty array with initialValue (no callback call)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayReduceTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: Array<string> = [];
      let callbackCalled = false;
      const initialValue = 'initial';
      const callback = () => {
        callbackCalled = true;
        return 'modified';
      };
      const result = arr.reduce(callback, initialValue);

      expect(result).assertEqual('initial');
      expect(callbackCalled).assertEqual(false);
    });

    /**
     * @tc.name   ArrayReduceTest021
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2100
     * @tc.desc   Callback throws error during iteration (traversal interrupts)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4];
      const accLog: int[] = [];
      let errorThrown = false;

      const callback = (acc: int, curr: int) => {
        const newAcc = acc + curr;
        accLog.push(newAcc);
        if (curr === 3) {
          throw new Error('Iteration interrupted');
        }
        return newAcc;
      };

      try {
        arr.reduce(callback, 0);
      } catch (e) {
        errorThrown = (e as Error).message === 'Iteration interrupted';
      }

      expect(errorThrown).assertEqual(true);
      expect(JSON.stringify(accLog)).assertDeepEquals(JSON.stringify([1, 3, 6]));
    });

    /**
     * @tc.name   ArrayReduceTest022
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2200
     * @tc.desc   Reduce array and modify original array during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      const callback = (acc: int, curr: int, idx: int) => {
        if (idx === 0) {
          arr.push(4);
        }
        return acc + curr;
      };
      const result = arr.reduce(callback);

      expect(result).assertEqual(1 + 2 + 3);
      expect(JSON.stringify(arr)).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   ArrayReduceTest023
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2300
     * @tc.desc   Reduce large array (1000 elements), verify completeness
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest023', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const arr: number[] = [];
      let expectedSum = 0;
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
        expectedSum += i;
      }

      const result = arr.reduce((acc: number, curr: number) => acc + curr);

      expect(result).assertEqual(expectedSum);
    });

    /**
     * @tc.name   ArrayReduceTest024
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2400
     * @tc.desc   Callback has no return value (accumulator becomes undefined)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      const accLog: (int | undefined)[] = [];
      const callback = (acc: int | undefined, curr: int) => {
        accLog.push(acc);
        return undefined
      };

      const result = arr.reduce(callback, 0);

      expect(JSON.stringify(accLog)).assertDeepEquals(JSON.stringify([0, undefined, undefined]));
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   ArrayReduceTest025
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2500
     * @tc.desc   Reduce array with function elements (execute and sum results)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const func1 = () => 10;
      const func2 = () => 20;
      const func3 = () => 30;
      const arr = [func1, func2, func3];
      const initialValue = 0;
      const callback = (acc: int, curr: ()=>int) => acc + curr();

      const result = arr.reduce(callback, initialValue);

      expect(result).assertEqual(0 + 10 + 20 + 30);
    });

    /**
     * @tc.name   ArrayReduceTest029
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2900
     * @tc.desc   Reduce array with circular reference object (accumulator)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = { self: null, sum: 0 } as BaseI029;
      obj.self = obj;
      const arr = [10, 20, 30];

      const callback = (acc: BaseI029, curr: int) => {
        acc.sum += curr;
        return acc;
      };
      const result = arr.reduce(callback, obj);

      expect(result.sum).assertEqual(60);
      expect(result.self).assertEqual(result);
    });

    /**
     * @tc.name   ArrayReduceTest031
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_3100
     * @tc.desc   Reduce with NaN values in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: Array<number> = [1, NaN, 3, NaN, 5];
      const callback = (acc: number, curr: number) => acc + (isNaN(curr) ? 0 : curr);
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   ArrayReduceTest032
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_3200
     * @tc.desc   Reduce with Infinity values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: Array<number> = [Infinity, 10, -Infinity];
      const callback = (acc: number, curr: number) => acc + curr;
      const result = arr.reduce(callback, 0);

      expect(Number.isNaN(result)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayReduceTest033
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_3300
     * @tc.desc   Reduce with zero and negative zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: Array<number> = [0, -0, 5];
      const callback = (acc: number, curr: number) => acc + curr;
      const result = arr.reduce(callback);

      expect(result).assertEqual(5);
      expect(1 / result).assertEqual(0.2);
    });

    /**
     * @tc.name   ArrayReduceTest034
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_3400
     * @tc.desc   Reduce with Date objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [
        new Date(2023, 0, 1),
        new Date(2023, 0, 2),
        new Date(2023, 0, 3)
      ];
      const callback = (acc: Date, curr: Date) => acc.getTime() < curr.getTime() ? curr : acc;
      const result = arr.reduce(callback);

      expect(result).assertDeepEquals(new Date(2023, 0, 3));
    });

    /**
     * @tc.name   ArrayReduceTest035
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_3500
     * @tc.desc   Reduce to create a function pipeline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    // todo
    // it('ArrayReduceTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const add2 = (x: number) => x + 2;
    //   const multiply3 = (x: number) => x * 3;
    //   const square = (x: number) => x * x;
    //   const pipeline: Array<(p1: number) => number> = [add2, multiply3, square];
    //
    //   const composed = pipeline.reduce((acc, fn: ((p1: number) => number)) => (x: number): number => fn(acc(x)), x => x);
    //   const result = composed(1);
    //
    //   expect(result).assertEqual(81);
    // });

    /**
     * @tc.name   ArrayReduceTest040
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4000
     * @tc.desc   Reduce with array that has modified length during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4];
      const callback = (acc: int, curr: int, idx: int, array: int[]) => {
        if (idx === 1) {
          array.length = 2;
        }
        return acc + curr;
      };
      const result = arr.reduce(callback);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   ArrayReduceTest042
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4200
     * @tc.desc   Reduce to flatten nested arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    // todo
    // it('ArrayReduceTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr: Array<int | Array<int> | Array<int | Array<int>>> = [1, [2, 3], [4, [5, 6]]];
    //   const flatten = (acc: number[], curr: (number | numOrArr042)): number[] =>{
    //     if (Array.isArray(curr)) {
    //       return acc.concat(...curr.map(item =>
    //       Array.isArray(item) ? flatten([], item) : item
    //       ));
    //     }
    //     return acc.concat(curr);
    //   };
    //
    //   const result = arr.reduce<number[]>(flatten, []);
    //   expect(result).assertDeepEquals([1, 2, 3, 4, 5, 6]);
    // });

    /**
     * @tc.name   ArrayReduceTest043
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4300
     * @tc.desc   Reduce with regexp elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [new RegExp('a'), new RegExp('b'), new RegExp('c')];
      const callback = (acc: string[], curr: RegExp) => {
        acc.push(curr.source);
        return acc;
      };
      let arr1: Array<string> = [];
      const result = arr.reduce(callback, arr1);

      expect(result).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ArrayReduceTest049
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4900
     * @tc.desc   Reduce with very large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: Array<number> = [Number.MAX_SAFE_INTEGER, 1, 2];
      const callback = (acc: number, curr: number) => acc + curr;
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(9007199254740991 + 1 + 2);
    });

    /**
     * @tc.name   ArrayReduceTest050
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5000
     * @tc.desc   Reduce with empty string elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = ['a', '', 'b', '', 'c'];
      const callback = (acc: string, curr: string) => acc + (curr || '_');
      const result = arr.reduce(callback, '');

      expect(result).assertEqual('a_b_c');
    });

    /**
     * @tc.name   ArrayReduceTest051
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5100
     * @tc.desc   Reduce with array containing itself
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: numOrArr051 = [1, 2];
      arr.push(arr);

      const callback = (acc: number, curr: (number | numOrArr051), idx: int) => {
        if (idx < 2) acc += curr as number;
        return acc;
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   ArrayReduceTest052
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5200
     * @tc.desc   Reduce with typed array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const typedArray = new Uint8Array([10, 20, 30]);
      const result = typedArray.reduce((acc: number, curr: number) => acc + curr, 0);

      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest053
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5300
     * @tc.desc   Reduce with accumulator as a Map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: Array<Array<string | int>> = [['a', 1], ['b', 2], ['a', 3]];
      const callback = (acc: Map<string, int>, curr: (string | int)[]): Map<string, int> => {
        acc.set(curr[0] as string, (acc.get(curr[0] as string) || 0) as int + (curr[1] as int));
        return acc;
      };
      const result = arr.reduce<Map<string, int>>(callback, new Map<string, int>());

      expect(result.get('a')).assertEqual(4);
      expect(result.get('b')).assertEqual(2);
    });

    /**
     * @tc.name   ArrayReduceTest054
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5400
     * @tc.desc   Reduce with accumulator as a Set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 2, 3, 3, 3];
      const callback = (acc: Set<int>, curr: int) => {
        acc.add(curr);
        return acc;
      };
      const result = arr.reduce(callback, new Set<int>());

      expect(JSON.stringify(Array.from(result))).assertDeepEquals(JSON.stringify([1, 2, 3]));
    });

    /**
     * @tc.name   ArrayReduceTest056
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5600
     * @tc.desc   Reduce with callback that returns different types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    // todo
    // it('ArrayReduceTest056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr: Array<number | string> = [1, '2', 3, '4'];
    //   const callback = (acc: number|string, curr: (number|string)): number|string => {
    //     if (typeof acc === 'number' && typeof curr === 'string') {
    //       return acc + Number(curr);
    //     } else if (typeof acc === 'number' && typeof curr === 'number') {
    //       return String(acc + curr);
    //     } else if (typeof acc === 'string' && typeof curr === 'number') {
    //       return Number(acc) + curr;
    //     }
    //     return (acc as string) + (curr as string);
    //   };
    //   const result = arr.reduce(callback);
    //
    //   expect(Number(result)).assertEqual(64);
    // });

    /**
     * @tc.name   ArrayReduceTest057
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5700
     * @tc.desc   Reduce with array of arrays, summing inner arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [[1, 2], [3, 4], [5, 6]];
      const callback = (acc: int, curr: int[]) => acc + curr.reduce((a: int, b: int) => a + b, 0);
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(21);
    });

    /**
     * @tc.name   ArrayReduceTest059
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5900
     * @tc.desc   Reduce with array where elements change type during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    // todo
    // it('ArrayReduceTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr: Array<number> = [1, 2, 3];
    //   const callback = (acc: number, curr: number, idx: int, array: (number | string)[]) => {
    //     if (idx === 1) {
    //       array[2] = '3';
    //     }
    //     return acc + Number(curr);
    //   };
    //   const result = arr.reduce(callback, 0);
    //
    //   expect(result).assertEqual(6);
    // });

    /**
     * @tc.name   ArrayReduceTest061
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_6100
     * @tc.desc   Reduce with BigInt accumulator and number elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [1, 2, 3];
      const callback = (acc: bigint, curr: int) => acc + BigInt(curr);
      const result = arr.reduce(callback, 0n);

      expect(result).assertEqual(6n);
    });

    /**
     * @tc.name   ArrayReduceTest064
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_6400
     * @tc.desc   Reduce with error objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [
        new Error('Error 1'),
        new TypeError('Error 2'),
        new SyntaxError('Error 3')
      ];
      const callback = (acc: string[], curr: Error) => {
        acc.push(curr.message);
        return acc;
      };
      let arr1: Array<string> = [];
      const result = arr.reduce(callback, arr1);

      expect(result).assertDeepEquals(['Error 1', 'Error 2', 'Error 3']);
    });

    /**
     * @tc.name   ArrayReduceTest065
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_6500
     * @tc.desc   Reduce with WeakMap accumulator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const obj1 = {} as BaseI065;
      const obj2 = {} as BaseI065;
      const arr: Array<Array<BaseI065 | int>> = [[obj1, 10], [obj2, 20], [obj1, 30]];
      const callback = (acc: WeakMap<BaseI065, int>, curr: (BaseI065 | int)[]) => {
        acc.set(curr[0] as BaseI065, (acc.get(curr[0] as BaseI065) || 0) as int + (curr[1] as int));
        return acc;
      };
      const result = arr.reduce(callback, new WeakMap<BaseI065, int>());

      expect(result.get(obj1)).assertEqual(40);
      expect(result.get(obj2)).assertEqual(20);
    });

    /**
     * @tc.name   ArrayReduceTest072
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_7200
     * @tc.desc   Reduce with array containing both numbers and strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: Array<number |string> = [1, '2', 3, '4', 5];
      const callback = (acc: number, curr: number|string) => acc + Number(curr);
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ArrayReduceTest074
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_7400
     * @tc.desc   Reduce with array of RegExp matches
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const text = 'JavaScript is fun, JavaScript is powerful';
      const regex = new RegExp('JavaScript', 'g');
      const matches: (RegExpExecArray | null)[] = [];
      let match: (RegExpExecArray | null) = null;

      while ((match = regex.exec(text)) !== null) {
        matches.push(match);
      }

      const arr: Array<BaseI074> = [];
      const result = matches.reduce((acc: BaseI074[], curr: (RegExpExecArray | null)) => {
        acc.push({ match: (curr as RegExpExecArray)[0], index: (curr as RegExpExecArray).index } as BaseI074);
        return acc;
      }, arr);

      expect(result.length).assertEqual(2);
      expect(result[0]?.index).assertEqual(0);
      expect(result[1]?.index).assertEqual(19);
    });

    /**
     * @tc.name   ArrayReduceTest077
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_7700
     * @tc.desc   Reduce with array containing non-serializable values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [() => 10, () => 20, () => 30];
      const callback = (acc: int, curr: ()=>int) => acc + curr();
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest078
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_7800
     * @tc.desc   Reduce with large initialValue (beyond safe integer)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: Array<number> = [1, 2, 3];
      const initialValue = Number.MAX_SAFE_INTEGER;
      const callback = (acc: number, curr: number) => acc + curr;
      const result = arr.reduce(callback, initialValue);

      expect(result).assertEqual(9007199254740991 + 6);
    });

    /**
     * @tc.name   ArrayReduceTest080
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8000
     * @tc.desc   Reduce with array containing both primitives and objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    // todo
    // it('ArrayReduceTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
    //   const arr: (number | BaseI080)[] = [10, { value: 20 } as BaseI080, 30, { value: 40 } as BaseI080];
    //   const callback = (acc: number, curr: (number|BaseI080)) => {
    //     return acc + (typeof curr !== 'number' ? curr.value : curr);
    //   };
    //   const result = arr.reduce(callback, 0);
    //
    //   expect(result).assertEqual(100);
    // });

    /**
     * @tc.name   ArrayReduceTest082
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8200
     * @tc.desc   Reduce with callback that uses optional chaining
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    // todo
    // it('ArrayReduceTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
    //   const arr: (BaseI1082 | null)[] = [
    //     { prop: { value: 10 } },
    //     { prop: null },
    //     { prop: { value: 30 } },
    //     null
    //   ];
    //   const callback = (acc: number, curr: (BaseI1082 | null)) => {
    //     return acc + (curr?.prop?.value || 0);
    //   };
    //   const result = arr.reduce(callback, 0);
    //
    //   expect(result).assertEqual(40);
    // });

    /**
     * @tc.name   ArrayReduceTest084
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8400
     * @tc.desc   Reduce with array containing Map objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const map1 = new Map<string, number>([['a', 10], ['b', 20]]);
      const map2 = new Map<string, number>([['c', 30], ['d', 40]]);
      const arr = [map1, map2];

      const callback = (acc: Map<string, number>, curr: Map<string, number>) => {
        curr.forEach((value, key): void => acc.set(key, value));
        return acc;
      };
      const result = arr.reduce(callback, new Map<string, number>());

      expect(result.get('a')).assertEqual(10);
      expect(result.get('d')).assertEqual(40);
      expect(result.size).assertEqual(4);
    });

    /**
     * @tc.name   ArrayReduceTest085
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8500
     * @tc.desc   Reduce with array of numbers where some are negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [10, -5, 20, -15, 30];
      const callback = (acc: int, curr: int) => acc + curr;
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(40);
    });

    /**
     * @tc.name   ArrayReduceTest086
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8600
     * @tc.desc   Reduce with callback that uses nullish coalescing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [0, 10, null, 20, undefined, 30];
      const callback = (acc: int, curr: (int|null|undefined)) => {
        return acc + (curr ?? 0);
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest088
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8800
     * @tc.desc   Reduce with array of objects with optional properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: BaseI088[] = [
        { name: 'A', score: 90 },
        { name: 'B' },
        { name: 'C', score: 85 },
        { name: 'D', score: null }
      ];
      const callback = (acc: number, curr: BaseI088) => {
        return acc + (curr.score ?? 0);
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(175);
    });

    /**
     * @tc.name   ArrayReduceTest090
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_9000
     * @tc.desc   Reduce with array containing Error objects and other values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [
        10,
        new Error('Something went wrong'),
        20,
        new TypeError('Invalid type'),
        30
      ];
      const callback = (acc: int, curr: Error|int) => {
        if (curr instanceof Error) {
          return acc + curr.message.length;
        }
        return acc + curr;
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(10 + 20 + 20 + 12 + 30);
    });

    /**
     * @tc.name   ArrayReduceTest091
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_9100
     * @tc.desc   Reduce with array containing Intl objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const date = new Date(2023, 0, 1);
      const formatters = [
        new Intl.DateTimeFormat('en-US'),
        new Intl.DateTimeFormat('fr-FR'),
        new Intl.DateTimeFormat('es-ES')
      ];

      const arr: Array<string> = [];
      const result = formatters.reduce((acc: string[], formatter: Intl.DateTimeFormat) => {
        acc.push(formatter.format(date));
        return acc;
      }, arr);

      expect(result.length).assertEqual(3);
      expect(result[0]).assertContain('/');
    });

    /**
     * @tc.name   ArrayReduceTest092
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_9200
     * @tc.desc   Reduce with array containing very large strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const largeStr1 = 'a'.repeat(1000);
      const largeStr2 = 'b'.repeat(1000);
      const arr = [largeStr1, largeStr2];

      const result = arr.reduce((acc: string, curr: string) => acc + curr, '');

      expect(result.length).assertEqual(2000);
      expect(result.startsWith('a')).assertEqual(true);
      expect(result.endsWith('b')).assertEqual(true);
    });

    /**
     * @tc.name   ArrayReduceTest096
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_9600
     * @tc.desc   Reduce with array containing DataView objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer1 = new ArrayBuffer(4);
      const view1 = new DataView(buffer1);
      view1.setInt32(0, 100);

      const buffer2 = new ArrayBuffer(4);
      const view2 = new DataView(buffer2);
      view2.setInt32(0, 200);

      const arr = [view1, view2];
      const result = arr.reduce((acc: long, view: DataView) => acc + view.getInt32(0), 0);

      expect(result).assertEqual(300);
    });

    /**
     * @tc.name   ArrayReduceTest098
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_9800
     * @tc.desc   Reduce with array containing SharedArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const sab1 = new ArrayBuffer(4);
      const int32a = new Int32Array(sab1);
      int32a[0] = 10;

      const sab2 = new ArrayBuffer(4);
      const int32b = new Int32Array(sab2);
      int32b[0] = 20;

      const arr = [int32a, int32b];
      const result = arr.reduce((acc: number, curr: Int32Array) => acc + curr[0], 0);

      expect(result).assertEqual(30);
    });

    /**
     * @tc.name   ArrayReduceTest099
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_9900
     * @tc.desc   Reduce with array containing WebAssembly modules (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const wasmModules: BaseI2099[] = [
        { instance: { exports: { add: (a: number, b: number) => a + b } } },
        { instance: { exports: { multiply: (a: number, b: number) => a * b } } }
      ];

      const callback = (acc: number, module: BaseI2099) => {
        if (module.instance.exports.add) {
          return module.instance.exports.add!(acc, 10);
        } else if (module.instance.exports.multiply) {
          return module.instance.exports.multiply!(acc, 2);
        }
        return acc;
      };

      const result = wasmModules.reduce(callback, 5);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name   ArrayReduceTest101
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_10100
     * @tc.desc   Reduce with array containing RegExp with flags
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const regexps = [
        new RegExp('abc'),
        new RegExp('def', 'g'),
        new RegExp('ghi', 'i'),
        new RegExp('jkl', 'm')
      ];

      let arr: Array<BaseI101> = [];
      const result = regexps.reduce((acc: BaseI101[], curr: RegExp) => {
        acc.push({ source: curr.source, flags: curr.flags });
        return acc;
      }, arr);

      expect(result.length).assertEqual(4);
      expect(result[1]?.flags).assertEqual('g');
      expect(result[2]?.flags).assertEqual('i');
    });

    /**
     * @tc.name   ArrayReduceTest103
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_10300
     * @tc.desc   Reduce with array containing WeakSet objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const obj1 = {} as BaseI103;
      const obj2 = {} as BaseI103;
      const obj3 = {} as BaseI103;

      const ws1 = new WeakSet<BaseI103>([obj1, obj2]);
      const ws2 = new WeakSet<BaseI103>([obj2, obj3]);

      const arr = [ws1, ws2];
      const arr1: Array<BaseI1103> = [];
      const result = arr.reduce((acc: BaseI1103[], ws) => {
        acc.push({
          hasObj1: ws.has(obj1),
          hasObj2: ws.has(obj2),
          hasObj3: ws.has(obj3)
        });
        return acc;
      }, arr1);

      expect(result[0]?.hasObj1).assertEqual(true);
      expect(result[0]?.hasObj3).assertEqual(false);
      expect(result[1]?.hasObj2).assertEqual(true);
      expect(result[1]?.hasObj3).assertEqual(true);
    });

    /**
     * @tc.name   ArrayReduceTest105
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_10500
     * @tc.desc   Reduce with array containing both positive and negative BigInt values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr = [10n, -5n, 20n, -15n, 30n];
      const callback = (acc: bigint, curr: bigint) => acc + curr;
      const result = arr.reduce(callback, 0n);

      expect(result).assertEqual(40n);
    });

    /**
     * @tc.name   ArrayReduceTest106
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_10600
     * @tc.desc   Reduce with array of functions that modify the accumulator by reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const functionsTest = [
        (acc: BaseI106) => { acc.value += 10; return acc; },
        (acc: BaseI106) => { acc.value *= 2; return acc; },
        (acc: BaseI106) => { acc.value -= 5; return acc; }
      ];

      const initialValue = { value: 0 } as BaseI106;
      const result = functionsTest.reduce((acc: BaseI106, fn): BaseI106 => fn(acc), initialValue);

      expect(result.value).assertEqual(15);
    });

    /**
     * @tc.name   ArrayReduceTest114
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_11400
     * @tc.desc   Reduce with array containing Intl.Collator objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const collators = [
        new Intl.Collator('en'),
        new Intl.Collator('de'),
        new Intl.Collator('fr')
      ];

      const words = ['apple', 'Banana', 'cherry'];
      const arr: Array<Array<string>> = [];
      const result = collators.reduce((acc: string[][], collator) => {
        acc.push([...words].sort((s1, s2) => collator.compare(s1, s2).toInt()));
        return acc;
      }, arr);

      expect(result.length).assertEqual(3);
      expect(result[0].length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayReduceTest118
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_11800
     * @tc.desc   Reduce with array containing ImageBitmap objects (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const createImageBitmap = async (width: number, height: number) => {
        return { width, height, close: () => {} } as BaseI118;
      };

      const bitmaps = await Promise.all([
        createImageBitmap(100, 200),
        createImageBitmap(300, 400)
      ]);

      const result = bitmaps.reduce((acc: BaseI1118, bmp: BaseI118) => {
        acc.totalArea += bmp.width * bmp.height;
        return acc;
      }, { totalArea: 0 } as BaseI1118);

      expect(result.totalArea).assertEqual(100*200 + 300*400);
    });

    /**
     * @tc.name   ArrayReduceTest120
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_12000
     * @tc.desc   Reduce with array containing both primitives and their object wrappers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const arr: Array<number|string> = [
        10,
        new Number(20),
        '30',
        new String('40')
      ];
      const callback = (acc: number, curr: number|string) => {
        return acc + Number(curr);
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(100);
    });
  });
}