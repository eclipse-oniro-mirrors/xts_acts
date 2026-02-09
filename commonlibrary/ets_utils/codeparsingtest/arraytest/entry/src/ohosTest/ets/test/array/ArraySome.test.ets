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
import { ArraySomeTest016, ArraySomeTest017, ArraySomeTest018, ArraySomeTest024, ArraySomeTest025,
  ArraySomeTest027,
  ArraySomeTest028,
  ArraySomeTest030,
  ArraySomeTest048,
  ArraySomeTest059,
  ArraySomeTest060,
  ArraySomeTest061,
  ArraySomeTest063,
  ArraySomeTest065,
  ArraySomeTest066,
  ArraySomeTest067,
  ArraySomeTest068,
  ArraySomeTest069,
  ArraySomeTest076,
  ArraySomeTest077,
  ArraySomeTest078,
  ArraySomeTest079,
  ArraySomeTest080,
  ArraySomeTest081,
  ArraySomeTest082,
  ArraySomeTest083,
  ArraySomeTest084,
  ArraySomeTest085,
  ArraySomeTest086,
  ArraySomeTest088,
  ArraySomeTest091,
  ArraySomeTest092,
  ArraySomeTest096,
  ArraySomeTest119,
  ArraySomeTest122} from './ArraySome';
import { buffer } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function ArraySomeTest() {
  describe('ArraySomeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   ArraySomeTest001
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0100
     * @tc.desc   Array has element > 10, return true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [2, 5, 12, 8];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(arr).assertDeepEquals([2, 5, 12, 8]);
    });

    /**
     * @tc.name   ArraySomeTest002
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0200
     * @tc.desc   Array has no element > 10, return false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [2, 5, 8, 1];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArraySomeTest003
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0300
     * @tc.desc   Empty array, return false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [];
      let callbackCalled = false;
      const callback = () => {
        callbackCalled = true;
        return true;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
      expect(callbackCalled).assertEqual(false);
    });

    /**
     * @tc.name   ArraySomeTest004
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0400
     * @tc.desc   Single-element array, element passes test (return true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [15];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest005
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0500
     * @tc.desc   Single-element array, element fails test (return false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [5];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArraySomeTest006
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0600
     * @tc.desc   Check if any string has length > 5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ["spray", "elite", "exuberant"];
      const callback = (str: string) => str.length > 5;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest007
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0700
     * @tc.desc   Check if any object has active: true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface BaseI{
        id: number,
        active: boolean
      }
      const arr: BaseI[] = [
        { id: 1, active: false },
        { id: 2, active: true },
        { id: 3, active: false }
      ];
      const callback = (obj: BaseI) => obj.active;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest008
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0800
     * @tc.desc   Check if any boolean is true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [false, false, true, false];
      const callback = (bool: boolean) => bool;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest009
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0900
     * @tc.desc   Check if any element is null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, null, 3];
      const callback = (elem: number | null) => elem === null;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest010
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1000
     * @tc.desc   Check if any element is undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArraySomeTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, undefined, 3];
      const callback = (elem: number | undefined) => elem === undefined;
      const result = arr.some(callback);

      expect(result).assertEqual(true)
    });

    /**
     * @tc.name   ArraySomeTest011
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1100
     * @tc.desc   Eligible element at array start (short-circuit: 1 callback call)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArraySomeTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [15, 2, 8, 1];
      let callCount = 0;
      const callback = (num: number) => {
        callCount++;
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.name   ArraySomeTest012
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1200
     * @tc.desc   Eligible element in array middle (short-circuit: stop at middle)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArraySomeTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [2, 5, 12, 8, 1];
      let callCount = 0;
      const callback = (num: number) => {
        callCount++;
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.name   ArraySomeTest013
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1300
     * @tc.desc   No eligible elements (all callbacks called)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArraySomeTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [2, 5, 8, 1];
      let callCount = 0;
      const callback = (num: number) => {
        callCount++;
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.name   ArraySomeTest014
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1400
     * @tc.desc   Verify callback parameters (element, index, array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArraySomeTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        elem: number,
        idx: number,
        arr: number[]
      }
      const arr = [10, 20];
      const paramsLog: BaseI[] = [];
      const callback = (elem: number, idx: number, arr: number[]) => {
        paramsLog.push({ elem, idx, arr });
        return elem > 15;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(paramsLog.length).assertEqual(2);
      expect(paramsLog[0]).assertDeepEquals({ elem: 10, idx: 0, arr: arr });
      expect(paramsLog[1]).assertDeepEquals({ elem: 20, idx: 1, arr: arr });
    });

    /**
     * @tc.name   ArraySomeTest015
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1500
     * @tc.desc   Some() on sparse array (empty slots skipped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArraySomeTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, , 3, , 12];
      let callCount = 0;
      const callback = (num: number|undefined) => {
        callCount++;
        return num! > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.name   ArraySomeTest016
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1600
     * @tc.desc   Some() on non-array object (class array) via call()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArraySomeTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArraySomeTest016()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest017
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1700
     * @tc.desc   Use thisArg to bind this in callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArraySomeTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArraySomeTest017()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest018
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1800
     * @tc.desc   No thisArg: this is undefined in strict mode callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArraySomeTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArraySomeTest018()).assertEqual(undefined);
    });

    /**
     * @tc.name   ArraySomeTest020
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2000
     * @tc.desc   Some() with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArraySomeTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [5n, 15n, 8n];
      const callback = (big: bigint) => big > 10n;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest021
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2100
     * @tc.desc   Callback throws error during iteration (traversal interrupts)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 15, 8];
      let callCount = 0;
      let errorThrown = false;

      const callback = (num: number) => {
        callCount++;
        if (num === 15) {
          throw new Error('Iteration interrupted');
        }
        return num > 10;
      };

      try {
        arr.some(callback);
      } catch (e) {
        errorThrown = e.message === 'Iteration interrupted';
      }

      expect(errorThrown).assertEqual(true);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.name   ArraySomeTest022
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2200
     * @tc.desc   Modify array during iteration (add element beyond initial length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      const initialLength = arr.length;
      let callCount = 0;

      const callback = (num: number, idx: number) => {
        callCount++;
        if (idx === 0) {
          arr.push(15);
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
      expect(callCount).assertEqual(3);
      expect(arr).assertDeepEquals([2, 5, 8, 15]);
    });

    /**
     * @tc.name   ArraySomeTest023
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2300
     * @tc.desc   Modify unvisited element during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      let callCount = 0;

      const callback = (num: number, idx: number, array: number[]) => {
        callCount++;
        if (idx === 0) {
          array[2] = 15;
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.name   ArraySomeTest024
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2400
     * @tc.desc   Delete unvisited element during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArraySomeTest024();

      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(undefined);
    });

    /**
     * @tc.name   ArraySomeTest025
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2500
     * @tc.desc   Some() with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest025()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest026
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2600
     * @tc.desc   Some() with nested objects (check reference equality)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        id: number
      }
      const obj = { id: 1 } as BaseI;
      const arr: BaseI[] = [
        { id: 2 },
        obj,
        { id: 3 }
      ];
      const callback = (item: BaseI) => item === obj;

      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest027
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2700
     * @tc.desc   Callback is non-function (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2];
      let errorThrown = false;

      try {
        ArraySomeTest027(arr);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest028
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2800
     * @tc.desc   Some() on non-array object without length (returns false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest028()).assertEqual(false);
    });

    /**
     * @tc.name   ArraySomeTest029
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2900
     * @tc.desc   Some() with NaN elements (check if any NaN exists)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, NaN, 3];
      const callback = (num: number) => Number.isNaN(num);

      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest030
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3000
     * @tc.desc   Comprehensive test: mixed types + dynamic modification + thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = ArraySomeTest030();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name   ArraySomeTest031
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3100
     * @tc.desc   Some() with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [-5, -10, 3];
      const callback = (num: number) => num < 0;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest032
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3200
     * @tc.desc   Some() with zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 0, 3];
      const callback = (num: number) => num === 0;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest033
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3300
     * @tc.desc   Some() with empty strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = ['hello', '', 'world'];
      const callback = (str: string) => str === '';
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest034
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3400
     * @tc.desc   Some() with multi-line strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = ['line1', 'line1\nline2', 'line3'];
      const callback = (str: string) => str.includes('\n');
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest035
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3500
     * @tc.desc   Some() with function elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const func1 = () => 'hello';
      const func2 = () => 'world';
      const arr = [1, func1, 'text'];
      const callback = (item: number | (()=>string) | string) => typeof item === 'function';
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest036
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3600
     * @tc.desc   Some() with regex elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, /test/, 'text'];
      const callback = (item: number|RegExp|string) => item instanceof RegExp;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest037
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3700
     * @tc.desc   Some() with date objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, new Date(), 'text'];
      const callback = (item: number|Date|string) => item instanceof Date;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest038
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3800
     * @tc.desc   Some() with array elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, [1, 2], 'text'];
      const callback = (item: number|number[]|string) => Array.isArray(item);
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest039
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3900
     * @tc.desc   Some() with map objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, new Map<string, string>(), 'text'];
      const callback = (item: number|Map<string, string>|string) => item instanceof Map;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest040
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4000
     * @tc.desc   Some() with set objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, new Set<string>(), 'text'];
      const callback = (item: number|Set<string>|string) => item instanceof Set;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest041
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4100
     * @tc.desc   Some() with weakmap objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, new WeakMap<object, string>(), 'text'];
      const callback = (item: number|WeakMap<object, string>|string) => item instanceof WeakMap;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest042
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4200
     * @tc.desc   Some() with weakset objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, new WeakSet(), 'text'];
      const callback = (item: number|WeakSet<object>|string) => item instanceof WeakSet;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest043
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4300
     * @tc.desc   Some() with typed arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, new Uint8Array(), 'text'];
      const callback = (item: number| Uint8Array | string) => ArrayBuffer.isView(item);
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest044
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4400
     * @tc.desc   Some() with data views objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const buffer = new ArrayBuffer(16);
      const arr = [1, new DataView(buffer), 'text'];
      const callback = (item: number | DataView | string) => item instanceof DataView;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest045
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4500
     * @tc.desc   Some() with array buffers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, new ArrayBuffer(16), 'text'];
      const callback = (item: number | ArrayBuffer | string) => item instanceof ArrayBuffer;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest046
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4600
     * @tc.desc   Some() with promises
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, Promise.resolve(), 'text'];
      const callback = (item: number | Promise<void> | string) => item instanceof Promise;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest047
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4700
     * @tc.desc   Some() with error objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, new Error('test'), 'text'];
      const callback = (item: number | Error | string) => item instanceof Error;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest048
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4800
     * @tc.desc   Some() with symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest048()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest049
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4900
     * @tc.desc   Some() with bigint elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 10n, 'text'];
      const callback = (item: number | bigint | string) => typeof item === 'bigint';
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest050
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5000
     * @tc.desc   Some() with null elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, null, 'text'];
      const callback = (item: number | null | string) => item === null;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest051
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5100
     * @tc.desc   Some() with undefined elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, undefined, 'text'];
      const callback = (item: number | undefined | string) => item === undefined;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest052
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5200
     * @tc.desc   Some() with NaN elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, NaN, 'text'];
      const callback = (item: number | string) => Number.isNaN(item);
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest053
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5300
     * @tc.desc   Some() with Infinity elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, Infinity, 'text'];
      const callback = (item: number | string) => item === Infinity;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest054
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5400
     * @tc.desc   Some() with -Infinity elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, -Infinity, 'text'];
      const callback = (item: number | string) => item === -Infinity;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest055
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5500
     * @tc.desc   Some() with sparse arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, , 3];
      let callCount = 0;
      const callback = (item: number | undefined) => {
        callCount++;
        return item === 3;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.name   ArraySomeTest056
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5600
     * @tc.desc   Some() with empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [];
      let callbackCalled = false;
      const callback = () => {
        callbackCalled = true;
        return true;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
      expect(callbackCalled).assertEqual(false);
    });

    /**
     * @tc.name   ArraySomeTest057
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5700
     * @tc.desc   Some() with single element array (pass)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [15];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest058
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5800
     * @tc.desc   Some() with single element array (fail)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [5];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArraySomeTest059
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5900
     * @tc.desc   Some() with array-like objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest059()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest060
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6000
     * @tc.desc   Some() with strings (treated as array-like)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest060()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest061
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6100
     * @tc.desc   Some() with arguments object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest061()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest063
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6300
     * @tc.desc   Some() with thisArg binding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest063()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest064
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6400
     * @tc.desc   Some() with arrow function and thisArg (no binding)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        threshold: number
      }
      const arr = [5, 15, 8];
      const thisArg = { threshold: 10 } as BaseI;
      const callback = (num: number) => num > thisArg.threshold;
      const result = arr.some(callback, thisArg);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest065
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6500
     * @tc.desc   Some() with strict mode function and thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest065()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest066
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6600
     * @tc.desc   Some() with strict mode function without thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest066()).assertEqual(undefined);
    });

    /**
     * @tc.name   ArraySomeTest067
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6700
     * @tc.desc   Some() with non-strict mode function without thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest067()).assertEqual(undefined);
    });

    /**
     * @tc.name   ArraySomeTest068
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6800
     * @tc.desc   Some() with null thisArg in non-strict mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest068()).assertEqual(null);
    });

    /**
     * @tc.name   ArraySomeTest069
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6900
     * @tc.desc   Some() with null thisArg in strict mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest069()).assertEqual(null);
    });

    /**
     * @tc.name   ArraySomeTest070
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7000
     * @tc.desc   Some() with modified array during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      const callback = (num: number, index: number, array: number[]) => {
        if (index === 0) {
          array[2] = 15;
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest071
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7100
     * @tc.desc   Some() with array elements added during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      const callback = (num: number, index: number, array: number[]) => {
        if (index === 0) {
          array.push(15);
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
      expect(arr).assertDeepEquals([2, 5, 8, 15]);
    });

    /**
     * @tc.name   ArraySomeTest072
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7200
     * @tc.desc   Some() with elements removed during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 15, 8];
      const callback = (num: number, index: number, array: number[]) => {
        if (index === 0) {
          array.splice(1, 1);
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
      expect(arr).assertDeepEquals([2, 8]);
    });

    /**
     * @tc.name   ArraySomeTest073
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7300
     * @tc.desc   Some() with elements shifted during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 15];
      const callback = (num: number, index: number, array: number[]) => {
        if (index === 0) {
          array.shift();
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest074
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7400
     * @tc.desc   Some() with elements unshifted during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      const callback = (num: number, index: number, array: number[]) => {
        if (index === 0) {
          array.unshift(15);
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArraySomeTest075
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7500
     * @tc.desc   Some() with callback throwing exception
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      let callCount = 0;
      const callback = (num: number) => {
        callCount++;
        if (num === 5) {
          throw new Error('Test exception');
        }
        return num > 10;
      };

      let errorThrown = false;
      try {
        arr.some(callback);
      } catch (e) {
        errorThrown = e.message === 'Test exception';
      }

      expect(errorThrown).assertEqual(true);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.name   ArraySomeTest076
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7600
     * @tc.desc   Some() with non-function callback (TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      let errorThrown = false;

      try {
        ArraySomeTest076(arr);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest077
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7700
     * @tc.desc   Some() with null callback (TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      let errorThrown = false;

      try {
        ArraySomeTest077(arr);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest078
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7800
     * @tc.desc   Some() with undefined callback (TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      let errorThrown = false;

      try {
        ArraySomeTest078(arr);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest079
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7900
     * @tc.desc   Some() with number callback (TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      let errorThrown = false;

      try {
        ArraySomeTest079(arr);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest080
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8000
     * @tc.desc   Some() with object callback (TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [2, 5, 8];
      let errorThrown = false;

      try {
        ArraySomeTest080(arr);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest081
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8100
     * @tc.desc   Some() with proxy object as thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest081()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest082
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8200
     * @tc.desc   Some() with proxy object as array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest082()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest083
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8300
     * @tc.desc   Some() with frozen array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest083()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest084
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8400
     * @tc.desc   Some() with sealed array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest084()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest085
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8500
     * @tc.desc   Some() with non-writable array elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest085()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest086
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8600
     * @tc.desc   Some() with getter properties in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest086()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest087
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8700
     * @tc.desc   Some() with async callback (non-awaiting)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [5, 15, 8];
      const callback = async (num: number) => num > 10;

      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest088
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8800
     * @tc.desc   Some() with generator function callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest088()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest089
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8900
     * @tc.desc   Some() with recursive structure
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        value: number,
        self?: BaseI
      }
      const obj = { value: 5 } as BaseI;
      obj.self = obj;

      const arr: BaseI[] = [obj, { value: 15 }, { value: 8 }];
      const callback = (item: BaseI) => item.value > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest090
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9000
     * @tc.desc   Some() with very large array (performance)
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest090', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const arr = new Array<number>(1000000).fill(5);
      arr[500000] = 15;

      let callCount = 0;
      const callback = (num: number) => {
        callCount++;
        return num > 10;
      };

      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(500001);
    });

    /**
     * @tc.name   ArraySomeTest091
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9100
     * @tc.desc   Some() with typed array of large size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest091()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest092
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9200
     * @tc.desc   Some() with large string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest092()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest093
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9300
     * @tc.desc   Some() with array of dates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const pastDate = new Date('2020-01-01');
      const futureDate = new Date('2030-01-01');
      const arr = [pastDate, new Date(), futureDate];

      const result = arr.some(date => date > new Date());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest094
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9400
     * @tc.desc   Some() with array of regex patterns
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [/hello/, /world/, /test/];
      const result = arr.some(regex => regex.test('this is a test'));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest095
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9500
     * @tc.desc   Some() with array of class instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      class User {
        age: number;
        constructor(age: number) {
          this.age = age;
        }
      }

      const arr = [new User(15), new User(25), new User(18)];
      const result = arr.some(user => user.age > 21);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest096
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9600
     * @tc.desc   Some() with array of symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest096()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest097
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9700
     * @tc.desc   Some() with array of bigints
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [10n, 20n, 5n];
      const result = arr.some(num => num > 15n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest098
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9800
     * @tc.desc   Some() with array of maps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const map1 = new Map([['a', 1]]);
      const map2 = new Map([['b', 2]]);
      const map3 = new Map([['c', 3]]);

      const arr = [map1, map2, map3];
      const result = arr.some(map => map.has('b'));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest099
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9900
     * @tc.desc   Some() with array of sets
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set1 = new Set([1, 2]);
      const set2 = new Set([3, 4]);
      const set3 = new Set([5, 6]);

      const arr = [set1, set2, set3];
      const result = arr.some(set => set.has(4));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest100
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_10000
     * @tc.desc   Some() with mixed types array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        key: string
      }
      const arr = [1, 'text', true, null, { key: 'value' } as BaseI, [1, 2], new Date()];
      const result = arr.some(item => Array.isArray(item));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest101
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_10100
     * @tc.desc   Some() with deeply nested arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [
        [1, [2, [3]]],
        [4, [5, [6, [7, [15]]]]],
        [8, [9]]
      ];

      type numArr = (number | numArr)[]
      const hasValueGreaterThan10 = (value: number| numArr): boolean =>{
        if (Array.isArray(value)) {
          return value.some(item => hasValueGreaterThan10(item));
        }
        return value > 10;
      }

      const result = arr.some(outer => {
        return Array.isArray(outer) && outer.some(item => hasValueGreaterThan10(item));
      });

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest102
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_10200
     * @tc.desc   Some() with deeply nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        c: number
      }
      interface BaseI1{
        b: BaseI
      }
      interface BaseI2{
        a: BaseI1
      }
      const arr: BaseI2[] = [
        { a: { b: { c: 5 } } },
        { a: { b: { c: 15 } } },
        { a: { b: { c: 8 } } }
      ];

      const result = arr.some(obj => obj.a.b.c > 10);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest112
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11200
     * @tc.desc   Some() with array containing buffers (Node.js)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const buffer1 = buffer.from('test');
      const arr = [1, buffer1, 3];

      const result = arr.some(item => item instanceof buffer.Buffer);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest114
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11400
     * @tc.desc   Some() with array containing timers (Node.js)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const timeoutId = setTimeout(() => {}, 0);
      const arr = [1, timeoutId, 3];

      const result = arr.some(item => typeof item === 'number' && item > 0);

      clearTimeout(timeoutId);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest117
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11700
     * @tc.desc   Some() with array containing promises with different states
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const pendingPromise = new Promise<void>(() => {});
      const resolvedPromise = Promise.resolve(15);
      const rejectedPromise = Promise.reject(new Error('test'));

      const arr = [pendingPromise, resolvedPromise, rejectedPromise];

      const result = arr.some(item => item instanceof Promise);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest118
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11800
     * @tc.desc   Some() with array containing weak references
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        value: number
      }
      const obj = { value: 15 } as BaseI;
      const weakRef = new WeakRef(obj);

      const arr = [1, weakRef, 3];
      const result = arr.some(item => item instanceof WeakRef);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest119
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11900
     * @tc.desc   Some() with array containing finalization registries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest119()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest120
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_12000
     * @tc.desc   Some() with array containing atomics objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, Atomics, 3];

      const result = arr.some(item => item === Atomics);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest121
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_12100
     * @tc.desc   Some() with array containing intl objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const formatter = new Intl.DateTimeFormat('en-US');
      const arr = [1, formatter, 3];

      const result = arr.some(item => item instanceof Intl.DateTimeFormat);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest122
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_12200
     * @tc.desc   Some() with array containing reflection objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArraySomeTest122()).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest123
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_12300
     * @tc.desc   Some() with array containing typed array views
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);

      const arr = [1, view, 3];
      const result = arr.some(item => item instanceof DataView);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest143
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14300
     * @tc.desc   Some() with array containing RangeError objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new RangeError('Out of range');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof RangeError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest144
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14400
     * @tc.desc   Some() with array containing ReferenceError objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new ReferenceError('Variable not defined');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof ReferenceError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest145
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14500
     * @tc.desc   Some() with array containing SyntaxError objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new SyntaxError('Invalid syntax');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof SyntaxError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest146
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14600
     * @tc.desc   Some() with array containing TypeError objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new TypeError('Wrong type');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof TypeError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest147
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14700
     * @tc.desc   Some() with array containing URIError objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new URIError('Invalid URI');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof URIError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest148
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14800
     * @tc.desc   Some() with array containing EvalError objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      if (typeof EvalError === 'undefined') {
        return;
      }

      const error = new EvalError('Eval error');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof EvalError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest149
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14900
     * @tc.desc   Some() with array containing AggregateError objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      if (typeof AggregateError === 'undefined') {
        return;
      }

      const error = new AggregateError([new Error('Error 1'), new Error('Error 2')], 'Multiple errors');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof AggregateError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest150
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_15000
     * @tc.desc   Some() with array containing Intl objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const formatter = new Intl.DateTimeFormat('en-US');
      const arr = [1, formatter, 3];

      const result = arr.some(item => item instanceof Intl.DateTimeFormat);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest151
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_15100
     * @tc.desc   Some() with array containing RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const regex = /test/;
      const arr = [1, regex, 3];

      const result = arr.some(item => item instanceof RegExp);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest152
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_15200
     * @tc.desc   Some() with array containing Date objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const date = new Date();
      const arr = [1, date, 3];

      const result = arr.some(item => item instanceof Date);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArraySomeTest153
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_15300
     * @tc.desc   Some() with array containing Map objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArraySomeTest153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const map = new Map<string, string>();
      const arr = [1, map, 3];

      const result = arr.some(item => item instanceof Map);

      expect(result).assertEqual(true);
    });
  });
}