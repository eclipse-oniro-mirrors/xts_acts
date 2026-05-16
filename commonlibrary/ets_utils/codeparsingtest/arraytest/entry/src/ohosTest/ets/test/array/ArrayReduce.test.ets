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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { ArrayReduceTest006, ArrayReduceTest014, ArrayReduceTest018, ArrayReduceTest020,
  ArrayReduceTest026,
  ArrayReduceTest027,
  ArrayReduceTest028,
  ArrayReduceTest030,
  ArrayReduceTest037,
  ArrayReduceTest038,
  ArrayReduceTest044,
  ArrayReduceTest045,
  ArrayReduceTest046,
  ArrayReduceTest047,
  ArrayReduceTest048,
  ArrayReduceTest058,
  ArrayReduceTest060,
  ArrayReduceTest062,
  ArrayReduceTest066,
  ArrayReduceTest068,
  ArrayReduceTest070,
  ArrayReduceTest071,
  ArrayReduceTest073,
  ArrayReduceTest076,
  ArrayReduceTest081,
  ArrayReduceTest089,
  ArrayReduceTest094,
  ArrayReduceTest095,
  ArrayReduceTest097,
  ArrayReduceTest104,
  ArrayReduceTest108,
  ArrayReduceTest110,
  ArrayReduceTest112,
  ArrayReduceTest113,
  ArrayReduceTest115,
  ArrayReduceTest119,
  ArrayReduceTest122,
  ArrayReduceTest123,
  ArrayReduceTest124,
  ArrayReduceTest125,
  ArrayReduceTest126,
  ArrayReduceTest130} from './ArrayReduce';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function ArrayReduceTest() {
  describe('ArrayReduceTest', () => {
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
     * @tc.name   ArrayReduceTest001
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0100
     * @tc.desc   Sum numbers without initialValue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, 2, 3, 4];
      const callback = (acc: number, curr: number) => acc + curr;
      const result = arr.reduce(callback);

      expect(result).assertEqual(10);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
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
      const callback = (acc: number, curr: number) => acc + curr;
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
      interface BaseI{
        value: number
      }
      const arr: BaseI[] = [
        { value: 10 },
        { value: 20 },
        { value: 30 }
      ];
      const callback = (acc: number, curr: BaseI) => acc + curr.value;
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest006
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_0600
     * @tc.desc   Count occurrences of values with initialValue (object accumulator)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayReduceTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(ArrayReduceTest006()).assertDeepEquals({ a: 3, b: 1, c: 1 });
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
      const callback = (acc: number, curr: number) => Math.max(acc, curr);
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
      const callback = (acc: number, curr: number) => Math.min(acc, curr);
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
      const callback = (acc: number, curr: number) => {
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
      interface BaseI{
        acc: number,
        curr: number,
        idx: number,
        arr: number[]
      }
      const arr = [10, 20, 30];
      const paramsLog: BaseI[] = [];
      const callback = (acc: number, curr: number, idx: number, arr: number[]) => {
        paramsLog.push({ acc, curr, idx, arr });
        return acc + curr;
      };

      arr.reduce(callback);

      expect(paramsLog.length).assertEqual(2);
      expect(paramsLog[0]).assertDeepEquals({ acc: 10, curr: 20, idx: 1, arr: arr });
      expect(paramsLog[1]).assertDeepEquals({ acc: 30, curr: 30, idx: 2, arr: arr });
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
      interface BaseI{
        acc: number,
        curr: number,
        idx: number,
        arr: number[]
      }
      const arr = [10, 20, 30];
      const initialValue = 5;
      const paramsLog: BaseI[] = [];
      const callback = (acc: number, curr: number, idx: number, arr: number[]) => {
        paramsLog.push({ acc, curr, idx, arr });
        return acc + curr;
      };

      arr.reduce(callback, initialValue);

      expect(paramsLog.length).assertEqual(3);
      expect(paramsLog[0]).assertDeepEquals({ acc: 5, curr: 10, idx: 0, arr: arr });
      expect(paramsLog[1]).assertDeepEquals({ acc: 15, curr: 20, idx: 1, arr: arr });
      expect(paramsLog[2]).assertDeepEquals({ acc: 35, curr: 30, idx: 2, arr: arr });
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
      const arr = [1, , 3, , 5];
      let callCount = arr[0]? 1 : 0;
      const callback = (acc: number | undefined, curr: (number | undefined)) => {
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

      expect(callCount).assertEqual(3);
      expect(result).assertEqual(1 + 3 + 5);
    });

    /**
     * @tc.name   ArrayReduceTest014
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1400
     * @tc.desc   Reduce non-array object (class array) via call()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayReduceTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayReduceTest014()).assertEqual(0 + 1 + 2 + 3);
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
      const callback = (acc: number | undefined, curr: (number | undefined)) => {
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
     * @tc.name   ArrayReduceTest018
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1800
     * @tc.desc   Reduce array with Symbol elements (count occurrences)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayReduceTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayReduceTest018() as number[];

      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
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
      const arr = [];
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
     * @tc.name   ArrayReduceTest020
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2000
     * @tc.desc   Empty array without initialValue (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayReduceTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [];
      let errorThrown = false;
      const callback = () => {};

      try {
        ArrayReduceTest020(arr, callback);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
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
      const accLog: number[] = [];
      let errorThrown = false;

      const callback = (acc: number, curr: number) => {
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
        errorThrown = e.message === 'Iteration interrupted';
      }

      expect(errorThrown).assertEqual(true);
      expect(accLog).assertDeepEquals([1, 3, 6]);
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
      const callback = (acc: number, curr: number, idx: number) => {
        if (idx === 0) {
          arr.push(4);
        }
        return acc + curr;
      };
      const result = arr.reduce(callback);

      expect(result).assertEqual(1 + 2 + 3);
      expect(arr).assertDeepEquals([1, 2, 3]);
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
      const accLog: (number | undefined)[] = [];
      const callback = (acc: number | undefined, curr: number) => {
        accLog.push(acc);
        return undefined
      };

      const result = arr.reduce(callback, 0);

      expect(accLog).assertDeepEquals([0, undefined, undefined]);
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
      const callback = (acc: number, curr: ()=>number) => acc + curr();

      const result = arr.reduce(callback, initialValue);

      expect(result).assertEqual(0 + 10 + 20 + 30);
    });

    /**
     * @tc.name   ArrayReduceTest026
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2600
     * @tc.desc   Reduce array with nested objects (immutable accumulator)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayReduceTest026();

      expect(result[0]).assertDeepEquals({ sum: 30, items: [1, 2] });
      expect(result[1]).assertDeepEquals({ sum: 0, items: [] });
    });

    /**
     * @tc.name   ArrayReduceTest027
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2700
     * @tc.desc   Callback is non-function (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2];
      let errorThrown = false;

      try {
        ArrayReduceTest027(arr);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArrayReduceTest028
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_2800
     * @tc.desc   Reduce non-array object without length (returns initialValue)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayReduceTest028()).assertEqual('initial');
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
      interface BaseI{
        self: BaseI | null,
        sum: number
      }
      const obj = { self: null, sum: 0 } as BaseI;
      obj.self = obj;
      const arr = [10, 20, 30];

      const callback = (acc: BaseI, curr: number) => {
        acc.sum += curr;
        return acc;
      };
      const result = arr.reduce(callback, obj);

      expect(result.sum).assertEqual(60);
      expect(result.self).assertEqual(result);
    });

    /**
     * @tc.name   ArrayReduceTest030
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_3000
     * @tc.desc   Comprehensive test: mixed types + async tasks + initialValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      interface BaseI{
        value: number
      }
      const result = await ArrayReduceTest030() as (number | string[] | (number | string | boolean | BaseI)[])[];

      expect(result[0]).assertEqual(60);

      expect(result[1]).assertDeepEquals(['number', 'string', 'boolean', 'object']);
      expect(result[2]).assertDeepEquals([1, 'a', true, { value: 5 }]);
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
      const arr = [1, NaN, 3, NaN, 5];
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
      const arr = [Infinity, 10, -Infinity];
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
      const arr = [0, -0, 5];
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
    it('ArrayReduceTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const add2 = (x: number) => x + 2;
      const multiply3 = (x: number) => x * 3;
      const square = (x: number) => x * x;
      const pipeline = [add2, multiply3, square];

      const composed = pipeline.reduce((acc, fn) => (x: number): number => fn(acc(x)), x => x);
      const result = composed(1);

      expect(result).assertEqual(81);
    });

    /**
     * @tc.name   ArrayReduceTest036
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_3600
     * @tc.desc   Reduce with non-integer array indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [];
      arr[0] = 1;
      arr[2.5] = 2;
      arr[3] = 3;
      arr.length = 4;

      const callback = (acc: number, curr: number) => acc + curr;
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(4);
    });

    /**
     * @tc.name   ArrayReduceTest037
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_3700
     * @tc.desc   Reduce with array-like object that has non-number length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(await ArrayReduceTest037()).assertEqual('ab');
    });

    /**
     * @tc.name   ArrayReduceTest038
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_3800
     * @tc.desc   Reduce with getter properties in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayReduceTest038()).assertEqual(6);
    });

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
      const callback = (acc: number, curr: number, idx: number, array: number[]) => {
        if (idx === 1) {
          array.length = 2;
        }
        return acc + curr;
      };
      const result = arr.reduce(callback);

      expect(result).assertEqual(3);
    });

    /**
     * @tc.name   ArrayReduceTest041
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4100
     * @tc.desc   Reduce with promise-based accumulator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      const callback = async (acc: Promise<number>, curr: number) => {
        const prev = await acc;
        return prev + curr;
      };

      const result = await arr.reduce(callback, Promise.resolve(0));
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   ArrayReduceTest042
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4200
     * @tc.desc   Reduce to flatten nested arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      type numOrArr = (number | numOrArr)[];
      const arr = [1, [2, 3], [4, [5, 6]]];
      const flatten = (acc: number[], curr: (number | numOrArr)): number[] =>{
        if (Array.isArray(curr)) {
          return acc.concat(...curr.map(item =>
          Array.isArray(item) ? flatten([], item) : item
          ));
        }
        return acc.concat(curr);
      };

      const result = arr.reduce<number[]>(flatten, []);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5, 6]);
    });

    /**
     * @tc.name   ArrayReduceTest043
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4300
     * @tc.desc   Reduce with regexp elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [/a/, /b/, /c/];
      const callback = (acc: string[], curr: RegExp) => {
        acc.push(curr.source);
        return acc;
      };
      const result = arr.reduce(callback, []);

      expect(result).assertDeepEquals(['a', 'b', 'c']);
    });

    /**
     * @tc.name   ArrayReduceTest044
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4400
     * @tc.desc   Reduce with generator function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayReduceTest044()).assertEqual(6);
    });

    /**
     * @tc.name   ArrayReduceTest045
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4500
     * @tc.desc   Reduce with Proxy object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayReduceTest045()).assertEqual(12);
    });

    /**
     * @tc.name   ArrayReduceTest046
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4600
     * @tc.desc   Reduce with non-writable array elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayReduceTest046()).assertEqual(6);
    });

    /**
     * @tc.name   ArrayReduceTest047
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4700
     * @tc.desc   Reduce with frozen array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayReduceTest047()).assertEqual(6);
    });

    /**
     * @tc.name   ArrayReduceTest048
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_4800
     * @tc.desc   Reduce with array where elements are deleted during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayReduceTest048()).assertEqual(6);
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
      const arr = [Number.MAX_SAFE_INTEGER, 1, 2];
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
      type numOrArr = (number | numOrArr)[];
      const arr: numOrArr = [1, 2];
      arr.push(arr);

      const callback = (acc: number, curr: (number | numOrArr), idx: number) => {
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
      const arr = [['a', 1], ['b', 2], ['a', 3]];
      const callback = (acc: Map<string, number>, curr: (string | number)[]): Map<string, number> => {
        acc.set(curr[0] as string, (acc.get(curr[0] as string) || 0) + (curr[1] as number));
        return acc;
      };
      const result = arr.reduce<Map<string, number>>(callback, new Map());

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
      const callback = (acc: Set<number>, curr: number) => {
        acc.add(curr);
        return acc;
      };
      const result = arr.reduce(callback, new Set());

      expect(Array.from(result)).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.name   ArrayReduceTest055
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5500
     * @tc.desc   Reduce with async/await in callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [100, 200, 300];
      const delay = (ms: number) => new Promise<number>(resolve => setTimeout(resolve, ms));

      const callback = async (acc: Promise<number>, curr: number) => {
        await delay(10);
        const prev = await acc;
        return prev + curr;
      };

      const result = await arr.reduce(callback, Promise.resolve(0));
      expect(result).assertEqual(600);
    });

    /**
     * @tc.name   ArrayReduceTest056
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5600
     * @tc.desc   Reduce with callback that returns different types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, '2', 3, '4'];
      const callback = (acc: number|string, curr: (number|string)): number|string => {
        if (typeof acc === 'number' && typeof curr === 'string') {
          return acc + Number(curr);
        } else if (typeof acc === 'number' && typeof curr === 'number') {
          return String(acc + curr);
        } else if (typeof acc === 'string' && typeof curr === 'number') {
          return Number(acc) + curr;
        }
        return (acc as string) + (curr as string);
      };
      const result = arr.reduce(callback);

      expect(Number(result)).assertEqual(64);
    });

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
      const callback = (acc: number, curr: number[]) => acc + curr.reduce((a, b) => a + b, 0);
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(21);
    });

    /**
     * @tc.name   ArrayReduceTest058
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5800
     * @tc.desc   Reduce with null prototype objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayReduceTest058()).assertEqual(30);
    });

    /**
     * @tc.name   ArrayReduceTest059
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_5900
     * @tc.desc   Reduce with array where elements change type during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      const callback = (acc: number, curr: number, idx: number, array: (number | string)[]) => {
        if (idx === 1) {
          array[2] = '3';
        }
        return acc + Number(curr);
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(6);
    });

    /**
     * @tc.name   ArrayReduceTest060
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_6000
     * @tc.desc   Reduce with array-like object that has negative length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayReduceTest060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayReduceTest060()).assertEqual('');
    });

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
      const callback = (acc: bigint, curr: number) => acc + BigInt(curr);
      const result = arr.reduce(callback, 0n);

      expect(result).assertEqual(6n);
    });

    /**
     * @tc.name   ArrayReduceTest062
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_6200
     * @tc.desc   Reduce to count character occurrences in array of strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI{
        a?: number,
        e?: number,
        p?: number
      }
      const result = ArrayReduceTest062() as BaseI;

      expect(result.a).assertEqual(4);
      expect(result.e).assertEqual(2);
      expect(result.p).assertEqual(2);
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
      const result = arr.reduce(callback, []);

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
      interface BaseI{}
      const obj1 = {} as BaseI;
      const obj2 = {} as BaseI;
      const arr = [[obj1, 10], [obj2, 20], [obj1, 30]];

      const callback = (acc: WeakMap<BaseI, number>, curr: (BaseI | number)[]) => {
        acc.set(curr[0], (acc.get(curr[0] as BaseI) || 0) + (curr[1] as number));
        return acc;
      };
      const result = arr.reduce(callback, new WeakMap());

      expect(result.get(obj1)).assertEqual(40);
      expect(result.get(obj2)).assertEqual(20);
    });

    /**
     * @tc.name   ArrayReduceTest066
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_6600
     * @tc.desc   Reduce with array containing Symbol.iterator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest066()).assertEqual(12);
    });

    /**
     * @tc.name   ArrayReduceTest067
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_6700
     * @tc.desc   Reduce with dynamic import in callback (simulated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI{
        value: number
      }
      const modules = [
        () => Promise.resolve({ value: 10 } as BaseI),
        () => Promise.resolve({ value: 20 } as BaseI),
        () => Promise.resolve({ value: 30 } as BaseI)
      ];

      const callback = async (acc: Promise<number>, moduleLoader: () =>Promise<BaseI>) => {
        const module = await moduleLoader();
        const prev = await acc;
        return prev + module.value;
      };

      const result = await modules.reduce(callback, Promise.resolve(0));
      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest068
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_6800
     * @tc.desc   Reduce with array-like object that has accessor properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest068()).assertEqual(3);
    });

    /**
     * @tc.name   ArrayReduceTest069
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_6900
     * @tc.desc   Reduce with array of functions that return promises
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const asyncFunctions = [
        () => Promise.resolve(10),
        () => Promise.resolve(20),
        () => Promise.resolve(30)
      ];

      const callback = async (acc: Promise<number>, fn: ()=>Promise<number>) => {
        const value = await fn();
        const awaitAcc = await acc;
        return awaitAcc + value;
      };

      const result = await asyncFunctions.reduce(callback, Promise.resolve(0));
      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest070
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_7000
     * @tc.desc   Reduce with array where elements are defined with Object.defineProperty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest070()).assertEqual(30);
    });

    /**
     * @tc.name   ArrayReduceTest071
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_7100
     * @tc.desc   Reduce with non-enumerable properties in array-like object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest071()).assertEqual(6);
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
      const arr = [1, '2', 3, '4', 5];
      const callback = (acc: number, curr: number|string) => acc + Number(curr);
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(15);
    });

    /**
     * @tc.name   ArrayReduceTest073
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_7300
     * @tc.desc   Reduce to create nested objects from flat data
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI{
        id?: number,
        parent?: number | null,
        name?: string
      }
      interface BaseI1{
        id?: number,
        children: BaseI[]
      }
      const result = ArrayReduceTest073() as BaseI1;

      expect(result.id).assertEqual(1);
      expect(result.children.length).assertEqual(2);
      expect(result.children[0].name).assertEqual('Child 1');
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
      interface BaseI{
        match: string,
        index: number
      }
      const text = 'JavaScript is fun, JavaScript is powerful';
      const regex = /JavaScript/g;
      const matches: (RegExpExecArray | null)[] = [];
      let match: (RegExpExecArray | null) = null;

      while ((match = regex.exec(text)) !== null) {
        matches.push(match);
      }

      const result = matches.reduce((acc: BaseI[], curr: (RegExpExecArray | null)) => {
        acc.push({ match: (curr as RegExpExecArray)[0], index: (curr as RegExpExecArray).index });
        return acc;
      }, []);

      expect(result.length).assertEqual(2);
      expect(result[0].index).assertEqual(0);
      expect(result[1].index).assertEqual(19);
    });

    /**
     * @tc.name   ArrayReduceTest075
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_7500
     * @tc.desc   Reduce with array where elements are promises
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const promises = [
        Promise.resolve(10),
        Promise.resolve(20),
        Promise.resolve(30)
      ];

      const callback = async (acc: Promise<number>, currPromise: Promise<number>) => {
        const curr = await currPromise;
        const awaitAcc = await acc;
        return awaitAcc + curr;
      };

      const result = await promises.reduce(callback, Promise.resolve(0));
      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest076
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_7600
     * @tc.desc   Reduce with array-like object that has Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest076()).assertEqual(3);
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
      const callback = (acc: number, curr: ()=>number) => acc + curr();
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
      const arr = [1, 2, 3];
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
    it('ArrayReduceTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI{
        value: number
      }
      const arr: (number | BaseI)[] = [10, { value: 20 }, 30, { value: 40 }];
      const callback = (acc: number, curr: (number|BaseI)) => {
        return acc + (typeof curr !== 'number' ? curr.value : curr);
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(100);
    });

    /**
     * @tc.name   ArrayReduceTest081
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8100
     * @tc.desc   Reduce with array-like object that has own and inherited properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest081()).assertEqual(6);
    });

    /**
     * @tc.name   ArrayReduceTest082
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8200
     * @tc.desc   Reduce with callback that uses optional chaining
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI{
        value: number
      }
      interface BaseI1{
        prop: BaseI | null
      }
      const arr: (BaseI1 | null)[] = [
        { prop: { value: 10 } },
        { prop: null },
        { prop: { value: 30 } },
        null
      ];
      const callback = (acc: number, curr: (BaseI1 | null)) => {
        return acc + (curr?.prop?.value || 0);
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(40);
    });

    /**
     * @tc.name   ArrayReduceTest084
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8400
     * @tc.desc   Reduce with array containing Map objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const map1 = new Map([['a', 10], ['b', 20]]);
      const map2 = new Map([['c', 30], ['d', 40]]);
      const arr = [map1, map2];

      const callback = (acc: Map<string, number>, curr: Map<string, number>) => {
        curr.forEach((value, key) => acc.set(key, value));
        return acc;
      };
      const result = arr.reduce(callback, new Map());

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
      const callback = (acc: number, curr: number) => acc + curr;
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
      const callback = (acc: number, curr: (number|null|undefined)) => {
        return acc + (curr ?? 0);
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest087
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8700
     * @tc.desc   Reduce with array containing both synchronous and asynchronous functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const functions = [
        () => 10,
        () => Promise.resolve(20),
        () => 30,
        () => Promise.resolve(40)
      ];

      const callback = async (acc: Promise<number>, fn: (()=>number)|(()=>Promise<number>)) => {
        const value = await fn();
        const awaitAcc = await acc;
        return awaitAcc + value;
      };

      const result = await functions.reduce(callback, Promise.resolve(0));
      expect(result).assertEqual(100);
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
      interface BaseI{
        name: string,
        score?: number | null
      }
      const arr: BaseI[] = [
        { name: 'A', score: 90 },
        { name: 'B' },
        { name: 'C', score: 85 },
        { name: 'D', score: null }
      ];
      const callback = (acc: number, curr: BaseI) => {
        return acc + (curr.score ?? 0);
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(175);
    });

    /**
     * @tc.name   ArrayReduceTest089
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_8900
     * @tc.desc   Reduce with array-like object that has length exceeding actual properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest089()).assertEqual(3);
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
      const callback = (acc: number, curr: Error|number) => {
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

      const result = formatters.reduce((acc: string[], formatter: Intl.DateTimeFormat) => {
        acc.push(formatter.format(date));
        return acc;
      }, []);

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
     * @tc.name   ArrayReduceTest094
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_9400
     * @tc.desc   Reduce with array-like object that has getter throwing errors
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest094()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayReduceTest095
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_9500
     * @tc.desc   Reduce with array containing both synchronous and asynchronous iterators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result: Promise<number> = await ArrayReduceTest095();
      expect((await result).toString()).assertEqual('[object Promise]3040');
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
      const result = arr.reduce((acc, view) => acc + view.getInt32(0), 0);

      expect(result).assertEqual(300);
    });

    /**
     * @tc.name   ArrayReduceTest097
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_9700
     * @tc.desc   Reduce with array where elements are revoked proxies
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest097()).assertEqual(true);
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
      if (typeof SharedArrayBuffer === 'undefined') {
        return;
      }

      const sab1 = new SharedArrayBuffer(4);
      const int32a = new Int32Array(sab1);
      int32a[0] = 10;

      const sab2 = new SharedArrayBuffer(4);
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
      interface BaseI{
        add?: (a: number, b: number) => number,
        multiply?: (a: number, b: number) => number
      }
      interface BaseI1{
        exports: BaseI
      }
      interface BaseI2{
        instance: BaseI1
      }
      const wasmModules: BaseI2[] = [
        { instance: { exports: { add: (a, b) => a + b } } },
        { instance: { exports: { multiply: (a, b) => a * b } } }
      ];

      const callback = (acc: number, module: BaseI2) => {
        if (module.instance.exports.add) {
          return module.instance.exports.add(acc, 10);
        } else if (module.instance.exports.multiply) {
          return module.instance.exports.multiply(acc, 2);
        }
        return acc;
      };

      const result = wasmModules.reduce(callback, 5);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.name   ArrayReduceTest100
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_10000
     * @tc.desc   Reduce with array containing complex nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      interface BaseI{
        id: number,
        value?: number
        children?: BaseI[]
      }
      const data: BaseI[] = [
        {
          id: 1,
          children: [
            { id: 11, value: 10 },
            { id: 12, value: 20 }
          ]
        },
        {
          id: 2,
          children: [
            { id: 21, value: 30 },
            {
              id: 22,
              children: [
                { id: 221, value: 40 },
                { id: 222, value: 50 }
              ]
            }
          ]
        }
      ];

      const sumValues = (acc: number, item: BaseI) => {
        if (item.value) {
          acc += item.value;
        }
        if (item.children) {
          acc = item.children.reduce(sumValues, acc);
        }
        return acc;
      };

      const result = data.reduce(sumValues, 0);
      expect(result).assertEqual(150);
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
      interface BaseI{
        source: string,
        flags: string
      }
      const regexps = [
        /abc/,
        /def/g,
        /ghi/i,
        /jkl/m
      ];

      const result = regexps.reduce((acc: BaseI[], curr: RegExp) => {
        acc.push({ source: curr.source, flags: curr.flags });
        return acc;
      }, []);

      expect(result.length).assertEqual(4);
      expect(result[1].flags).assertEqual('g');
      expect(result[2].flags).assertEqual('i');
    });

    /**
     * @tc.name   ArrayReduceTest102
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_10200
     * @tc.desc   Reduce with array of promises that resolve at different times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const delayedValue = (value: number, delay: number) =>
      new Promise<number>(resolve => setTimeout(() => resolve(value), delay));

      const promises = [
        delayedValue(10, 30),
        delayedValue(20, 10),
        delayedValue(30, 20)
      ];

      const callback = async (acc: Promise<number>, currPromise: Promise<number>) => {
        const value = await currPromise;
        const awaitAcc = await acc;
        return awaitAcc + value;
      };

      const result = await promises.reduce(callback, Promise.resolve(0));
      expect(result).assertEqual(60);
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
      interface BaseI{}
      const obj1 = {} as BaseI;
      const obj2 = {} as BaseI;
      const obj3 = {} as BaseI;

      const ws1 = new WeakSet([obj1, obj2]);
      const ws2 = new WeakSet([obj2, obj3]);

      interface BaseI1{
        hasObj1: boolean
        hasObj3: boolean
        hasObj2: boolean
      }
      const arr = [ws1, ws2];
      const result = arr.reduce((acc: BaseI1[], ws) => {
        acc.push({
          hasObj1: ws.has(obj1),
          hasObj2: ws.has(obj2),
          hasObj3: ws.has(obj3)
        });
        return acc;
      }, []);

      expect(result[0].hasObj1).assertEqual(true);
      expect(result[0].hasObj3).assertEqual(false);
      expect(result[1].hasObj2).assertEqual(true);
      expect(result[1].hasObj3).assertEqual(true);
    });

    /**
     * @tc.name   ArrayReduceTest104
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_10400
     * @tc.desc   Reduce with array-like object that has changing properties during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = ArrayReduceTest104() as number[];
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertEqual(4);
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
      interface BaseI{
        value: number
      }
      const functions = [
        (acc: BaseI) => { acc.value += 10; return acc; },
        (acc: BaseI) => { acc.value *= 2; return acc; },
        (acc: BaseI) => { acc.value -= 5; return acc; }
      ];

      const initialValue = { value: 0 } as BaseI;
      const result = functions.reduce((acc: BaseI, fn): BaseI => fn(acc), initialValue);

      expect(result.value).assertEqual(15);
    });

    /**
     * @tc.name   ArrayReduceTest108
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_10800
     * @tc.desc   Reduce with array containing Proxy objects that override get
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest108()).assertEqual(120);
    });

    /**
     * @tc.name   ArrayReduceTest110
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_11000
     * @tc.desc   Reduce with array containing both real and symbolic values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest110()).assertEqual(120);
    });

    /**
     * @tc.name   ArrayReduceTest112
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_11200
     * @tc.desc   Reduce with array of objects where properties are symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest112()).assertEqual(60);
    });

    /**
     * @tc.name   ArrayReduceTest113
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_11300
     * @tc.desc   Reduce with array containing both resolved and rejected promises
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = await ArrayReduceTest113() as number;
      expect(result).assertEqual(40);
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
      const result = collators.reduce((acc: string[][], collator) => {
        acc.push([...words].sort(collator.compare));
        return acc;
      }, []);

      expect(result.length).assertEqual(3);
      expect(result[0].length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayReduceTest115
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_11500
     * @tc.desc   Reduce with array containing objects with getter/setter pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest115()).assertEqual(120);
    });

    /**
     * @tc.name   ArrayReduceTest117
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_11700
     * @tc.desc   Reduce with array containing complex error objects with custom properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      class CustomError extends Error {
        code: number;
        constructor(message: string, code: number) {
          super(message);
          this.code = code;
        }
      }

      const arr = [
        new CustomError('Error 1', 400),
        new CustomError('Error 2', 500),
        new CustomError('Error 3', 404)
      ];

      const result = arr.reduce((acc: string[], err) => {
        acc[err.code] = err.message;
        return acc;
      }, []);

      expect(result[400]).assertEqual('Error 1');
      expect(result[500]).assertEqual('Error 2');
      expect(result[404]).assertEqual('Error 3');
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
      interface BaseI{
        width: number,
        height: number,
        close: ()=>void
      }
      const createImageBitmap = async (width: number, height: number) => {
        return { width, height, close: () => {} } as BaseI;
      };

      const bitmaps = await Promise.all([
        createImageBitmap(100, 200),
        createImageBitmap(300, 400)
      ]);

      interface BaseI1{
        totalArea: number
      }

      const result = bitmaps.reduce((acc, bmp) => {
        acc.totalArea += bmp.width * bmp.height;
        return acc;
      }, { totalArea: 0 } as BaseI1);

      expect(result.totalArea).assertEqual(100*200 + 300*400);
    });

    /**
     * @tc.name   ArrayReduceTest119
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_11900
     * @tc.desc   Reduce with array containing objects with enumerable and non-enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest119()).assertEqual(40);
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
      const arr = [
        10,
        new Number(20),
        '30',
        new String('40'),
        true,
        new Boolean(false)
      ];

      const callback = (acc: number, curr: number|string|boolean|Number|String|Boolean) => {
        return acc + Number(curr);
      };
      const result = arr.reduce(callback, 0);

      expect(result).assertEqual(101);
    });

    /**
     * @tc.name   ArrayReduceTest122
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_12200
     * @tc.desc   Reduce with array containing Map objects with complex keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = ArrayReduceTest122() as number[];

      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(50);
      expect(result[2]).assertEqual(40);
    });

    /**
     * @tc.name   ArrayReduceTest123
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_12300
     * @tc.desc   Reduce with array containing objects with Symbol.toStringTag
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = ArrayReduceTest123() as (string| number)[];

      expect(result[0]).assertEqual('[object CustomType1]');
      expect(result[1]).assertEqual('[object CustomType2]');
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.name   ArrayReduceTest124
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_12400
     * @tc.desc   Reduce with array containing objects with varying prototype chains
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest124()).assertEqual(100);
    });

    /**
     * @tc.name   ArrayReduceTest125
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_12500
     * @tc.desc   Reduce with array containing both sync and async generators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = ArrayReduceTest125();
      expect(await result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayReduceTest126
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_12600
     * @tc.desc   Reduce with array containing objects with configurable properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(ArrayReduceTest126()).assertEqual(20);
    });

    /**
     * @tc.name   ArrayReduceTest128
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_12800
     * @tc.desc   Reduce with array containing objects with getters that modify other properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      class Base{
        a: number = 10;
        b: number = 20;
        c?: number;
        get sum() {
          this.c = this.a + this.b;
          return this.c;
        }
      }
      const obj1 = {
        a: 10,
        b: 20,
        get sum() {
          obj1.c = obj1.a + obj1.b;
          return obj1.c;
        }
      } as Base;

      const obj2 = {
        a: 30,
        b: 40,
        get sum() {
          obj2.c = obj2.a + obj2.b;
          return obj2.c;
        }
      } as Base;

      const arr = [obj1, obj2];
      const result = arr.reduce((acc: number, curr: Base) => {
        return acc + curr.sum;
      }, 0);

      expect(result).assertEqual(100);
      expect(obj1.c).assertEqual(30);
      expect(obj2.c).assertEqual(70);
    });

    /**
     * @tc.name   ArrayReduceTest130
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_13000
     * @tc.desc   Ultimate comprehensive reduce test with mixed types and operations
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL4
     */
    it('ArrayReduceTest130', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL4, async () => {
      const result = await ArrayReduceTest130() as number[];

      expect(result[0]).assertEqual(16);

      const expectedSum = 10 + 20 + 1 + (30+40) + 50 + 20 + 100 + 60 + 50 + 100 + (70+80) + 90 + 100;
      expect(result[1]).assertEqual(expectedSum);
    });

  });
}