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
import Utils from '../Util.test';
import { buffer } from '@kit.ArkTS';
import { BusinessError } from '@ohos.base';

interface BaseI7{
  id: number,
  active: boolean
}

interface BaseI14{
    elem: Int,
  idx: Int,
  arr: Int[]
}

interface BaseI26{
  id: number
}

interface BaseI64{
  threshold: number
}

interface BaseI89{
  value: number,
  self?: BaseI89
}

interface BaseI100{
  key: string
}

interface BaseI102{
  c: number
}
interface BaseI1102{
  b: BaseI102
}
interface BaseI2102{
  a: BaseI1102
}

interface BaseI118{
  value: number
}

class User {
  age: number;
  constructor(age: number) {
    this.age = age;
  }
}

export default function ArraySomeTest() {
  describe('ArraySomeTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0100
     * @tc.name ArraySomeTest001
     * @tc.desc Array has element > 10, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: number[] = [2, 5, 12, 8];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([2, 5, 12, 8]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0200
     * @tc.name ArraySomeTest002
     * @tc.desc Array has no element > 10, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: number[] = [2, 5, 8, 1];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0300
     * @tc.name ArraySomeTest003
     * @tc.desc Empty array, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: boolean[] = [];
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0400
     * @tc.name ArraySomeTest004
     * @tc.desc Single-element array, element passes test (return true)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: number[] = [15];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0500
     * @tc.name ArraySomeTest005
     * @tc.desc Single-element array, element fails test (return false)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: number[] = [5];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0600
     * @tc.name ArraySomeTest006
     * @tc.desc Check if any string has length > 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ["spray", "elite", "exuberant"];
      const callback = (str: string) => str.length > 5;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0700
     * @tc.name ArraySomeTest007
     * @tc.desc Check if any object has active: true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: BaseI7[] = [
        { id: 1, active: false },
        { id: 2, active: true },
        { id: 3, active: false }
      ];
      const callback = (obj: BaseI7) => obj.active;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0800
     * @tc.name ArraySomeTest008
     * @tc.desc Check if any boolean is true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [false, false, true, false];
      const callback = (bool: boolean) => bool;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_0900
     * @tc.name ArraySomeTest009
     * @tc.desc Check if any element is null
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: (number | null)[] = [1, null, 3];
      const callback = (elem: number | null) => elem === null;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1000
     * @tc.name ArraySomeTest010
     * @tc.desc Check if any element is undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArraySomeTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      const callback = (elem: number | undefined) => elem === undefined;
      const result = arr.some(callback);

      expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1100
     * @tc.name ArraySomeTest011
     * @tc.desc Eligible element at array start (short-circuit: 1 callback call)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArraySomeTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: number[] = [15, 2, 8, 1];
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1200
     * @tc.name ArraySomeTest012
     * @tc.desc Eligible element in array middle (short-circuit: stop at middle)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArraySomeTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: number[] = [2, 5, 12, 8, 1];
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1300
     * @tc.name ArraySomeTest013
     * @tc.desc No eligible elements (all callbacks called)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArraySomeTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: number[] = [2, 5, 8, 1];
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1400
     * @tc.name ArraySomeTest014
     * @tc.desc Verify callback parameters (element, index, array)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArraySomeTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: Int[] = [10, 20];
      const paramsLog: BaseI14[] = [];
      const callback = (elem: Int, idx: Int, arr: Int[]): boolean => {
        paramsLog.push({ elem, idx, arr });
        return elem > 15;
      };
      const result: boolean = arr.some(callback);

      expect(result).assertEqual(true);
      expect(paramsLog.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1500
     * @tc.name ArraySomeTest015
     * @tc.desc Some() on sparse array (empty slots skipped)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArraySomeTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: (number|undefined)[] = [1, undefined, 3, undefined, 12];
      let callCount = 0;
      const callback = (num: number|undefined) => {
        callCount++;
        return num!== undefined && num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1600
     * @tc.name ArraySomeTest016
     * @tc.desc Some() on non-array object (class array) via call()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ArraySomeTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
    //   expect(ArraySomeTest016()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1700
     * @tc.name ArraySomeTest017
     * @tc.desc Use thisArg to bind this in callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ArraySomeTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
    //   expect(ArraySomeTest017()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_1800
     * @tc.name ArraySomeTest018
     * @tc.desc No thisArg: this is undefined in strict mode callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ArraySomeTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
    //   expect(ArraySomeTest018()).assertEqual(undefined);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2000
     * @tc.name ArraySomeTest020
     * @tc.desc Some() with BigInt elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArraySomeTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [5n, 15n, 8n];
      const callback = (big: bigint) => big > 10n;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2100
     * @tc.name ArraySomeTest021
     * @tc.desc Callback throws error during iteration (traversal interrupts)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [2, 15, 8];
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2200
     * @tc.name ArraySomeTest022
     * @tc.desc Modify array during iteration (add element beyond initial length)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: Int[] = [2, 5, 8];
      const initialLength = arr.length;
      let callCount = 0;

      const callback = (num: Int, idx: Int) => {
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2300
     * @tc.name ArraySomeTest023
     * @tc.desc Modify unvisited element during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: Int[] = [2, 5, 8];
      let callCount = 0;

      const callback = (num: Int, idx: Int, array: Int[]) => {
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2400
     * @tc.name ArraySomeTest024
     * @tc.desc Delete unvisited element during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const result = ArraySomeTest024();
    //
    //   expect(result[0]).assertEqual(false);
    //   expect(result[1]).assertEqual(2);
    //   expect(result[2]).assertEqual(undefined);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2500
     * @tc.name ArraySomeTest025
     * @tc.desc Some() with Symbol elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest025()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2600
     * @tc.name ArraySomeTest026
     * @tc.desc Some() with nested objects (check reference equality)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = { id: 1 } as BaseI26;
      const arr: BaseI26[] = [
        { id: 2 },
        obj,
        { id: 3 }
      ];
      const callback = (item: BaseI26) => item === obj;

      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2700
     * @tc.name ArraySomeTest027
     * @tc.desc Callback is non-function (throws TypeError)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [1, 2];
    //   let errorThrown = false;
    //
    //   try {
    //     ArraySomeTest027(arr);
    //   } catch (e) {
    //     errorThrown = e instanceof TypeError;
    //   }
    //
    //   expect(errorThrown).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2800
     * @tc.name ArraySomeTest028
     * @tc.desc Some() on non-array object without length (returns false)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest028()).assertEqual(false);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_2900
     * @tc.name ArraySomeTest029
     * @tc.desc Some() with NaN elements (check if any NaN exists)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [1, NaN, 3];
      const callback = (num: number) => Number.isNaN(num);

      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3000
     * @tc.name ArraySomeTest030
     * @tc.desc Comprehensive test: mixed types + dynamic modification + thisArg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
    //   const result = ArraySomeTest030();
    //
    //   expect(result[0]).assertEqual(true);
    //   expect(result[1]).assertEqual(2);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3100
     * @tc.name ArraySomeTest031
     * @tc.desc Some() with negative numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [-5, -10, 3];
      const callback = (num: number) => num < 0;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3200
     * @tc.name ArraySomeTest032
     * @tc.desc Some() with zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [1, 0, 3];
      const callback = (num: number) => num === 0;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3300
     * @tc.name ArraySomeTest033
     * @tc.desc Some() with empty strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = ['hello', '', 'world'];
      const callback = (str: string) => str === '';
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3400
     * @tc.name ArraySomeTest034
     * @tc.desc Some() with multi-line strings
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = ['line1', 'line1\nline2', 'line3'];
      const callback = (str: string) => str.includes('\n');
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3500
     * @tc.name ArraySomeTest035
     * @tc.desc Some() with function elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const func1 = () => 'hello';
      const func2 = () => 'world';
      const arr: (number | (()=>string) | string)[] = [1, func1, 'text'];
      const callback = (item: number | (()=>string) | string) => typeof item === 'function';
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3600
     * @tc.name ArraySomeTest036
     * @tc.desc Some() with regex elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const r = new RegExp('test');
      const arr: (number|RegExp|string)[] = [1, r, 'text'];
      const callback = (item: number|RegExp|string) => item instanceof RegExp;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3700
     * @tc.name ArraySomeTest037
     * @tc.desc Some() with date objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number|Date|string)[] = [1, new Date(), 'text'];
      const callback = (item: number|Date|string) => item instanceof Date;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3800
     * @tc.name ArraySomeTest038
     * @tc.desc Some() with array elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number|number[]|string)[] = [1, [1, 2], 'text'];
      const callback = (item: number|number[]|string) => Array.isArray(item);
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_3900
     * @tc.name ArraySomeTest039
     * @tc.desc Some() with map objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number|Map<string, string>|string)[] = [1, new Map<string, string>(), 'text'];
      const callback = (item: number|Map<string, string>|string) => item instanceof Map;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4000
     * @tc.name ArraySomeTest040
     * @tc.desc Some() with set objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number|Set<string>|string)[] = [1, new Set<string>(), 'text'];
      const callback = (item: number|Set<string>|string) => item instanceof Set;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4100
     * @tc.name ArraySomeTest041
     * @tc.desc Some() with weakmap objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number|WeakMap<object, string>|string)[] = [1, new WeakMap<object, string>(), 'text'];
      const callback = (item: number|WeakMap<object, string>|string) => item instanceof WeakMap;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4200
     * @tc.name ArraySomeTest042
     * @tc.desc Some() with weakset objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number|WeakSet<object>|string)[] = [1, new WeakSet<object>(), 'text'];
      const callback = (item: number|WeakSet<object>|string) => item instanceof WeakSet;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4300
     * @tc.name ArraySomeTest043
     * @tc.desc Some() with typed arrays
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number| Uint8Array | string)[] = [1, new Uint8Array(), 'text'];
      const callback = (item: number| Uint8Array | string) => ArrayBuffer.isView(item);
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4400
     * @tc.name ArraySomeTest044
     * @tc.desc Some() with data views objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const buffer = new ArrayBuffer(16);
      const arr: (number | DataView | string)[] = [1, new DataView(buffer), 'text'];
      const callback = (item: number | DataView | string) => item instanceof DataView;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4500
     * @tc.name ArraySomeTest045
     * @tc.desc Some() with array buffers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | ArrayBuffer | string)[] = [1, new ArrayBuffer(16), 'text'];
      const callback = (item: number | ArrayBuffer | string) => item instanceof ArrayBuffer;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4600
     * @tc.name ArraySomeTest046
     * @tc.desc Some() with promises
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | Promise<void> | string)[] = [1, Promise.resolve(), 'text'];
      const callback = (item: number | Promise<void> | string) => item instanceof Promise;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4700
     * @tc.name ArraySomeTest047
     * @tc.desc Some() with error objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | Error | string)[] = [1, new Error('test'), 'text'];
      const callback = (item: number | Error | string) => item instanceof Error;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4800
     * @tc.name ArraySomeTest048
     * @tc.desc Some() with symbol elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest048()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_4900
     * @tc.name ArraySomeTest049
     * @tc.desc Some() with bigint elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | bigint | string)[] = [1, 10n, 'text'];
      const callback = (item: number | bigint | string) => typeof item === 'bigint';
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5000
     * @tc.name ArraySomeTest050
     * @tc.desc Some() with null elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | null | string)[] = [1, null, 'text'];
      const callback = (item: number | null | string) => item === null;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5100
     * @tc.name ArraySomeTest051
     * @tc.desc Some() with undefined elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | undefined | string)[] = [1, undefined, 'text'];
      const callback = (item: number | undefined | string) => item === undefined;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5200
     * @tc.name ArraySomeTest052
     * @tc.desc Some() with NaN elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | string)[] = [1, NaN, 'text'];
      const callback = (item: number | string) => Number.isNaN(item as number);
      const result: boolean = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5300
     * @tc.name ArraySomeTest053
     * @tc.desc Some() with Infinity elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | string)[] = [1, Infinity, 'text'];
      const callback = (item: number | string) => item === Infinity;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5400
     * @tc.name ArraySomeTest054
     * @tc.desc Some() with -Infinity elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | string)[] = [1, -Infinity, 'text'];
      const callback = (item: number | string) => item === -Infinity;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5500
     * @tc.name ArraySomeTest055
     * @tc.desc Some() with sparse arrays
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | undefined)[] = [1, undefined, 3];
      let callCount = 0;
      const callback = (item: number | undefined) => {
        callCount++;
        return item === 3;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5600
     * @tc.name ArraySomeTest056
     * @tc.desc Some() with empty array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: boolean[] = [];
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5700
     * @tc.name ArraySomeTest057
     * @tc.desc Some() with single element array (pass)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [15];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5800
     * @tc.name ArraySomeTest058
     * @tc.desc Some() with single element array (fail)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [5];
      const callback = (num: number) => num > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_5900
     * @tc.name ArraySomeTest059
     * @tc.desc Some() with array-like objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest059()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6000
     * @tc.name ArraySomeTest060
     * @tc.desc Some() with strings (treated as array-like)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest060()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6100
     * @tc.name ArraySomeTest061
     * @tc.desc Some() with arguments object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest061()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6300
     * @tc.name ArraySomeTest063
     * @tc.desc Some() with thisArg binding
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest063()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6400
     * @tc.name ArraySomeTest064
     * @tc.desc Some() with arrow function and thisArg (no binding)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [5, 15, 8];
      const thisArg = { threshold: 10 } as BaseI64;
      const callback = (num: number) => num > thisArg.threshold;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6500
     * @tc.name ArraySomeTest065
     * @tc.desc Some() with strict mode function and thisArg
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest065()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6600
     * @tc.name ArraySomeTest066
     * @tc.desc Some() with strict mode function without thisArg
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest066()).assertEqual(undefined);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6700
     * @tc.name ArraySomeTest067
     * @tc.desc Some() with non-strict mode function without thisArg
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest067()).assertEqual(undefined);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6800
     * @tc.name ArraySomeTest068
     * @tc.desc Some() with null thisArg in non-strict mode
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest068()).assertEqual(null);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_6900
     * @tc.name ArraySomeTest069
     * @tc.desc Some() with null thisArg in strict mode
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest069()).assertEqual(null);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7000
     * @tc.name ArraySomeTest070
     * @tc.desc Some() with modified array during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [2, 5, 8];
      const callback = (num: number, index: Int, array: number[]) => {
        if (index === 0) {
          array[2] = 15;
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7100
     * @tc.name ArraySomeTest071
     * @tc.desc Some() with array elements added during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [2, 5, 8];
      const callback = (num: number, index: Int, array: number[]) => {
        if (index === 0) {
          array.push(15);
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([2, 5, 8, 15]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7200
     * @tc.name ArraySomeTest072
     * @tc.desc Some() with elements removed during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [2, 15, 8];
      const callback = (num: number, index: Int, array: number[]) => {
        if (index === 0) {
          array.splice(1, 1);
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([2, 8]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7300
     * @tc.name ArraySomeTest073
     * @tc.desc Some() with elements shifted during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [2, 5, 15];
      const callback = (num: number, index: Int, array: number[]) => {
        if (index === 0) {
          array.shift();
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7400
     * @tc.name ArraySomeTest074
     * @tc.desc Some() with elements unshifted during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [2, 5, 8];
      const callback = (num: number, index: Int, array: number[]) => {
        if (index === 0) {
          array.unshift(15);
        }
        return num > 10;
      };
      const result = arr.some(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7500
     * @tc.name ArraySomeTest075
     * @tc.desc Some() with callback throwing exception
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [2, 5, 8];
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7600
     * @tc.name ArraySomeTest076
     * @tc.desc Some() with non-function callback (TypeError)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [2, 5, 8];
    //   let errorThrown = false;
    //
    //   try {
    //     ArraySomeTest076(arr);
    //   } catch (e) {
    //     errorThrown = e instanceof TypeError;
    //   }
    //
    //   expect(errorThrown).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7700
     * @tc.name ArraySomeTest077
     * @tc.desc Some() with null callback (TypeError)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [2, 5, 8];
    //   let errorThrown = false;
    //
    //   try {
    //     ArraySomeTest077(arr);
    //   } catch (e) {
    //     errorThrown = e instanceof TypeError;
    //   }
    //
    //   expect(errorThrown).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7800
     * @tc.name ArraySomeTest078
     * @tc.desc Some() with undefined callback (TypeError)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [2, 5, 8];
    //   let errorThrown = false;
    //
    //   try {
    //     ArraySomeTest078(arr);
    //   } catch (e) {
    //     errorThrown = e instanceof TypeError;
    //   }
    //
    //   expect(errorThrown).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_7900
     * @tc.name ArraySomeTest079
     * @tc.desc Some() with number callback (TypeError)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [2, 5, 8];
    //   let errorThrown = false;
    //
    //   try {
    //     ArraySomeTest079(arr);
    //   } catch (e) {
    //     errorThrown = e instanceof TypeError;
    //   }
    //
    //   expect(errorThrown).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8000
     * @tc.name ArraySomeTest080
     * @tc.desc Some() with object callback (TypeError)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [2, 5, 8];
    //   let errorThrown = false;
    //
    //   try {
    //     ArraySomeTest080(arr);
    //   } catch (e) {
    //     errorThrown = e instanceof TypeError;
    //   }
    //
    //   expect(errorThrown).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8100
     * @tc.name ArraySomeTest081
     * @tc.desc Some() with proxy object as thisArg
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest081()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8200
     * @tc.name ArraySomeTest082
     * @tc.desc Some() with proxy object as array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest082()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8300
     * @tc.name ArraySomeTest083
     * @tc.desc Some() with frozen array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest083()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8400
     * @tc.name ArraySomeTest084
     * @tc.desc Some() with sealed array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest084()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8500
     * @tc.name ArraySomeTest085
     * @tc.desc Some() with non-writable array elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest085()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8600
     * @tc.name ArraySomeTest086
     * @tc.desc Some() with getter properties in array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest086()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8700
     * @tc.name ArraySomeTest087
     * @tc.desc Some() with async callback (non-awaiting)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [5, 15, 8];
      const callback = (num: number) => num > 10;

      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8800
     * @tc.name ArraySomeTest088
     * @tc.desc Some() with generator function callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest088()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_8900
     * @tc.name ArraySomeTest089
     * @tc.desc Some() with recursive structure
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = { value: 5 } as BaseI89;
      obj.self = obj;

      const arr: BaseI89[] = [obj, { value: 15 }, { value: 8 }];
      const callback = (item: BaseI89) => item.value > 10;
      const result = arr.some(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9000
     * @tc.name ArraySomeTest090
     * @tc.desc Some() with very large array (performance)
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9100
     * @tc.name ArraySomeTest091
     * @tc.desc Some() with typed array of large size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest091()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9200
     * @tc.name ArraySomeTest092
     * @tc.desc Some() with large string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest092()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9300
     * @tc.name ArraySomeTest093
     * @tc.desc Some() with array of dates
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const pastDate = new Date('2020-01-01');
      const futureDate = new Date('2030-01-01');
      const arr = [pastDate, new Date(), futureDate];

      const result = arr.some(date => date.getTime() > new Date().getTime());
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9400
     * @tc.name ArraySomeTest094
     * @tc.desc Some() with array of regex patterns
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const a = new RegExp('hello');
      const b = new RegExp('world');
      const c = new RegExp('test');
      const arr = [a, b, c];
      const result = arr.some(regex => regex.test('this is a test'));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9500
     * @tc.name ArraySomeTest095
     * @tc.desc Some() with array of class instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [new User(15), new User(25), new User(18)];
      const result = arr.some(user => user.age > 21);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9600
     * @tc.name ArraySomeTest096
     * @tc.desc Some() with array of symbols
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest096()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9700
     * @tc.name ArraySomeTest097
     * @tc.desc Some() with array of bigints
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [10n, 20n, 5n];
      const result = arr.some(num => num > 15n);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9800
     * @tc.name ArraySomeTest098
     * @tc.desc Some() with array of maps
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const map1 = new Map<string, number>([['a', 1]]);
      const map2 = new Map<string, number>([['b', 2]]);
      const map3 = new Map<string, number>([['c', 3]]);

      const arr = [map1, map2, map3];
      const result = arr.some(map => map.has('b'));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_9900
     * @tc.name ArraySomeTest099
     * @tc.desc Some() with array of sets
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set1 = new Set<number>([1, 2]);
      const set2 = new Set<number>([3, 4]);
      const set3 = new Set<number>([5, 6]);

      const arr = [set1, set2, set3];
      const result = arr.some(set => set.has(4));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_10000
     * @tc.name ArraySomeTest100
     * @tc.desc Some() with mixed types array
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 'text', true, null, { key: 'value' } as BaseI100, [1, 2], new Date()];
      const result = arr.some(item => Array.isArray(item));
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_10100
     * @tc.name ArraySomeTest101
     * @tc.desc Some() with deeply nested arrays
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // todo
    // it('ArraySomeTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [
    //     [1, [2, [3]]],
    //     [4, [5, [6, [7, [15]]]]],
    //     [8, [9]]
    //   ];
    //
    //   type numArr = (number | numArr)[]
    //   const hasValueGreaterThan10 = (value: number| numArr): boolean =>{
    //     if (Array.isArray(value)) {
    //       return value.some(item => hasValueGreaterThan10(item));
    //     }
    //     return value > 10;
    //   }
    //
    //   const result = arr.some(outer => {
    //     return Array.isArray(outer) && outer.some(item => hasValueGreaterThan10(item));
    //   });
    //
    //   expect(result).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_10200
     * @tc.name ArraySomeTest102
     * @tc.desc Some() with deeply nested objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: BaseI2102[] = [
        { a: { b: { c: 5 } } },
        { a: { b: { c: 15 } } },
        { a: { b: { c: 8 } } }
      ];

      const result = arr.some(obj => obj.a.b.c > 10);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11200
     * @tc.name ArraySomeTest112
     * @tc.desc Some() with array containing buffers (Node.js)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {

      const buffer1: buffer.Buffer = buffer.from('test');
      const arr = [1, buffer1, 3];

      const result = arr.some(item => item instanceof buffer.Buffer);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11400
     * @tc.name ArraySomeTest114
     * @tc.desc Some() with array containing timers (Node.js)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const timeoutId = setTimeout(() => {}, 0);
      const arr = [1, timeoutId, 3];

      const result = arr.some(item => typeof item === 'int' && item > 0);

      clearTimeout(timeoutId);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11700
     * @tc.name ArraySomeTest117
     * @tc.desc Some() with array containing promises with different states
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11800
     * @tc.name ArraySomeTest118
     * @tc.desc Some() with array containing weak references
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = { value: 15 } as BaseI118;
      const weakRef = new WeakRef<object>(obj);

      const arr = [1, weakRef, 3];
      const result = arr.some(item => item instanceof WeakRef);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_11900
     * @tc.name ArraySomeTest119
     * @tc.desc Some() with array containing finalization registries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest119()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_12000
     * @tc.name ArraySomeTest120
     * @tc.desc Some() with array containing atomics objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];

      const result = arr.some(item => item === 2);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_12100
     * @tc.name ArraySomeTest121
     * @tc.desc Some() with array containing intl objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const formatter = new Intl.DateTimeFormat('en-US');
      const arr = [1, formatter, 3];

      const result = arr.some(item => item instanceof Intl.DateTimeFormat);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_12200
     * @tc.name ArraySomeTest122
     * @tc.desc Some() with array containing reflection objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArraySomeTest122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArraySomeTest122()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_12300
     * @tc.name ArraySomeTest123
     * @tc.desc Some() with array containing typed array views
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const buffer = new ArrayBuffer(16);
      const view = new DataView(buffer);

      const arr = [1, view, 3];
      const result = arr.some(item => item instanceof DataView);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14300
     * @tc.name ArraySomeTest143
     * @tc.desc Some() with array containing RangeError objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new RangeError('Out of range');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof RangeError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14400
     * @tc.name ArraySomeTest144
     * @tc.desc Some() with array containing ReferenceError objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new ReferenceError('Variable not defined');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof ReferenceError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14500
     * @tc.name ArraySomeTest145
     * @tc.desc Some() with array containing SyntaxError objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new SyntaxError('Invalid syntax');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof SyntaxError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14600
     * @tc.name ArraySomeTest146
     * @tc.desc Some() with array containing TypeError objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new TypeError('Wrong type');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof TypeError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14700
     * @tc.name ArraySomeTest147
     * @tc.desc Some() with array containing URIError objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new URIError('Invalid URI');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof URIError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14800
     * @tc.name ArraySomeTest148
     * @tc.desc Some() with array containing EvalError objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new EvalError('Eval error');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof EvalError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_14900
     * @tc.name ArraySomeTest149
     * @tc.desc Some() with array containing AggregateError objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const error = new AggregateError([new Error('Error 1'), new Error('Error 2')], 'Multiple errors');
      const arr = [1, error, 3];

      const result = arr.some(item => item instanceof AggregateError);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_15000
     * @tc.name ArraySomeTest150
     * @tc.desc Some() with array containing Intl objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const formatter = new Intl.DateTimeFormat('en-US');
      const arr = [1, formatter, 3];

      const result = arr.some(item => item instanceof Intl.DateTimeFormat);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_15100
     * @tc.name ArraySomeTest151
     * @tc.desc Some() with array containing RegExp objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const regex = new RegExp('test');
      const arr = [1, regex, 3];

      const result = arr.some(item => item instanceof RegExp);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_15200
     * @tc.name ArraySomeTest152
     * @tc.desc Some() with array containing Date objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const date = new Date();
      const arr = [1, date, 3];

      const result = arr.some(item => item instanceof Date);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SOME_TEST_15300
     * @tc.name ArraySomeTest153
     * @tc.desc Some() with array containing Map objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArraySomeTest153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const map = new Map<string, string>();
      const arr = [1, map, 3];

      const result = arr.some(item => item instanceof Map);

      expect(result).assertEqual(true);
    });
  });
}