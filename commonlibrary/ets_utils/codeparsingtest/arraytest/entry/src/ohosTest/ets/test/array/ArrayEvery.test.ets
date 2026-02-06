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
  ArrayEveryTest016,
  ArrayEveryTest018,
  ArrayEveryTest019,
  ArrayEveryTest024,
  ArrayEveryTest025,
  ArrayEveryTest027,
  ArrayEveryTest028,
  ArrayEveryTest030,
  ArrayEveryTest041,
  ArrayEveryTest042,
  ArrayEveryTest043,
  ArrayEveryTest071,
  ArrayEveryTest072,
  ArrayEveryTest073,
  ArrayEveryTest074,
  ArrayEveryTest076,
  ArrayEveryTest077,
  ArrayEveryTest078,
  ArrayEveryTest079,
  ArrayEveryTest080,
  ArrayEveryTest081,
  ArrayEveryTest082,
  ArrayEveryTest083,
  ArrayEveryTest084,
  ArrayEveryTest085,
  ArrayEveryTest086,
  ArrayEveryTest088,
  ArrayEveryTest089,
  ArrayEveryTest093,
  ArrayEveryTest106,
  ArrayEveryTest121,
  ArrayEveryTest122,
  ArrayEveryTest123,
  ArrayEveryTest124,
  ArrayEveryTest126,
  ArrayEveryTest127,
  ArrayEveryTest128,
  ArrayEveryTest129,
  ArrayEveryTest130,
  ArrayEveryTest139,
  ArrayEveryTest143,
  ArrayEveryTest144,
  ArrayEveryTest149,
  ArrayEveryTest150
} from './ArrayEvery';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function ArrayEveryTest() {
  describe('ArrayEveryTest', () => {
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
     * @tc.name   ArrayEveryTest001
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0100
     * @tc.desc   All elements > 10, return true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [12, 15, 20, 18];
      const callback = (num: number) => num > 10;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
      expect(arr).assertDeepEquals([12, 15, 20, 18]);
    });

    /**
     * @tc.name   ArrayEveryTest002
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0200
     * @tc.desc   Exists element <= 10, return false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [12, 5, 20, 18];
      const callback = (num: number) => num > 10;
      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArrayEveryTest003
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0300
     * @tc.desc   Empty array, return true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [];
      let callbackCalled = false;
      const callback = () => {
        callbackCalled = true;
        return false;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(true);
      expect(callbackCalled).assertEqual(false);
    });

    /**
     * @tc.name   ArrayEveryTest004
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0400
     * @tc.desc   Single-element array, element passes test (return true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [15];
      const callback = (num: number) => num > 10;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest005
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0500
     * @tc.desc   Single-element array, element fails test (return false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [5];
      const callback = (num: number) => num > 10;
      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArrayEveryTest006
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0600
     * @tc.desc   All strings have length <= 6
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ["spray", "elite", "quick"];
      const callback = (str: string) => str.length <= 6;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest007
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0700
     * @tc.desc   All objects have active: true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface BaseI {
        id: number,
        active: boolean
      }

      const arr: BaseI[] = [
        { id: 1, active: true },
        { id: 2, active: true },
        { id: 3, active: true }
      ];
      const callback = (obj: BaseI) => obj.active;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest008
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0800
     * @tc.desc   Exists object with active: false, return false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface BaseI {
        id: number,
        active: boolean
      }

      const arr: BaseI[] = [
        { id: 1, active: true },
        { id: 2, active: false },
        { id: 3, active: true }
      ];
      const callback = (obj: BaseI) => obj.active;
      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArrayEveryTest009
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0900
     * @tc.desc   All elements are not null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, 2, 3];
      const callback = (elem: number) => elem !== null;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest010
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1000
     * @tc.desc   Exists null element, return false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayEveryTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, null, 3];
      const callback = (elem: number | null) => elem !== null;
      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArrayEveryTest011
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1100
     * @tc.desc   Invalid element at array start (short-circuit: 1 callback call)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayEveryTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [5, 12, 15, 18];
      let callCount = 0;
      const callback = (num: number) => {
        callCount++;
        return num > 10;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(false);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.name   ArrayEveryTest012
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1200
     * @tc.desc   Invalid element in array middle (short-circuit: stop at middle)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayEveryTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [12, 15, 5, 18];
      let callCount = 0;
      const callback = (num: number) => {
        callCount++;
        return num > 10;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(false);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.name   ArrayEveryTest013
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1300
     * @tc.desc   All elements valid (all callbacks called)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayEveryTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [12, 15, 18, 20];
      let callCount = 0;
      const callback = (num: number) => {
        callCount++;
        return num > 10;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(4);
    });

    /**
     * @tc.name   ArrayEveryTest014
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1400
     * @tc.desc   Verify callback parameters (element, index, array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayEveryTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI {
        elem: number,
        idx: number,
        arr: number[]
      }

      const arr = [10, 20, 30];
      const paramsLog: BaseI[] = [];
      const callback = (elem: number, idx: number, arr: number[]) => {
        paramsLog.push({ elem, idx, arr });
        return elem >= 10;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(true);
      expect(paramsLog.length).assertEqual(3);
      expect(paramsLog[0]).assertDeepEquals({ elem: 10, idx: 0, arr: arr });
      expect(paramsLog[1]).assertDeepEquals({ elem: 20, idx: 1, arr: arr });
      expect(paramsLog[2]).assertDeepEquals({ elem: 30, idx: 2, arr: arr });
    });

    /**
     * @tc.name   ArrayEveryTest015
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1500
     * @tc.desc   Every() on sparse array (empty slots skipped)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayEveryTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [12, , 15, , 18];
      let callCount = 0;
      const callback = (num: (number | undefined)) => {
        callCount++;
        return num ? num > 10 : false;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.name   ArrayEveryTest016
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1600
     * @tc.desc   Every() on non-array object (class array) via call()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayEveryTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayEveryTest016()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest018
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1800
     * @tc.desc   Use thisArg to bind this in callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayEveryTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayEveryTest018()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest019
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1900
     * @tc.desc   No thisArg: this is undefined in strict mode callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayEveryTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayEveryTest019()).assertEqual(undefined);
    });

    /**
     * @tc.name   ArrayEveryTest020
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2000
     * @tc.desc   Every() with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayEveryTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [12n, 15n, 18n];
      const callback = (big: bigint) => big > 10n;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest021
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2100
     * @tc.desc   Callback throws error during iteration (traversal interrupts)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [12, 15, 18];
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
        arr.every(callback);
      } catch (e) {
        errorThrown = e.message === 'Iteration interrupted';
      }

      expect(errorThrown).assertEqual(true);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.name   ArrayEveryTest022
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2200
     * @tc.desc   Modify array during iteration (add element beyond initial length)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [12, 15, 18];
      let callCount = 0;

      const callback = (num: number, idx: number) => {
        callCount++;
        if (idx === 0) {
          arr.push(5);
        }
        return num > 10;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(3);
      expect(arr).assertDeepEquals([12, 15, 18, 5]);
    });

    /**
     * @tc.name   ArrayEveryTest023
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2300
     * @tc.desc   Modify unvisited element during iteration (make it invalid)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [12, 15, 18];
      let callCount = 0;

      const callback = (num: number, idx: number, array: number[]) => {
        callCount++;
        if (idx === 0) {
          array[2] = 5;
        }
        return num > 10;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(false);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.name   ArrayEveryTest024
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2400
     * @tc.desc   Delete unvisited element during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayEveryTest024();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(undefined);
    });

    /**
     * @tc.name   ArrayEveryTest025
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2500
     * @tc.desc   Every() with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest025()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest026
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2600
     * @tc.desc   Every() with nested objects (check reference equality)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        id: number
      }

      const obj = { id: 1 } as BaseI;
      const arr = [
        obj,
        obj,
        obj
      ];
      const callback = (item: BaseI) => item === obj; // All elements are the same object

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest027
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2700
     * @tc.desc   Callback is non-function (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2];
      let errorThrown = false;

      try {
        ArrayEveryTest027(arr);
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest028
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2800
     * @tc.desc   Every() on non-array object without length (returns true)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest028()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest029
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2900
     * @tc.desc   Every() with NaN elements (check if all are not NaN)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [12, 15, 18];
      const callback = (num: number) => !Number.isNaN(num);

      const result = arr.every(callback);

      expect(result).assertEqual(true);

      const arrWithNaN = [12, NaN, 18];
      const resultWithNaN = arrWithNaN.every(callback);
      expect(resultWithNaN).assertEqual(false);
    });

    /**
     * @tc.name   ArrayEveryTest030
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3000
     * @tc.desc   Comprehensive test: mixed types + dynamic modification + thisArg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = ArrayEveryTest030();

      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.name   ArrayEveryTest031
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3100
     * @tc.desc   Every() with WeakMap elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const wm1 = new WeakMap<object, string>();
      const wm2 = new WeakMap<object, string>();
      const arr = [wm1, wm2];
      const callback = (item: WeakMap<object, string>) => item instanceof WeakMap;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest032
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3200
     * @tc.desc   Every() with WeakSet elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const ws1 = new WeakSet();
      const ws2 = new WeakSet();
      const arr = [ws1, ws2];
      const callback = (item: WeakSet<object>) => item instanceof WeakSet;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest033
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3300
     * @tc.desc   Every() with DataView elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const buffer = new ArrayBuffer(16);
      const dv1 = new DataView(buffer);
      const dv2 = new DataView(buffer, 8);
      const arr = [dv1, dv2];
      const callback = (item: DataView) => item instanceof DataView;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest034
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3400
     * @tc.desc   Every() with ArrayBuffer elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const ab1 = new ArrayBuffer(16);
      const ab2 = new ArrayBuffer(32);
      const arr = [ab1, ab2];
      const callback = (item: ArrayBuffer) => item instanceof ArrayBuffer;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest035
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3500
     * @tc.desc   Every() with TypedArray elements (Int32Array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const ta1 = new Int32Array([1, 2, 3]);
      const ta2 = new Int32Array([4, 5, 6]);
      const arr = [ta1, ta2];
      const callback = (item: Int32Array) => item instanceof Int32Array;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest036
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3600
     * @tc.desc   Every() with SharedArrayBuffer elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const sab1 = new SharedArrayBuffer(16);
      const sab2 = new SharedArrayBuffer(32);
      const arr = [sab1, sab2];
      const callback = (item: SharedArrayBuffer) => item instanceof SharedArrayBuffer;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest037
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3700
     * @tc.desc   Every() with Promise elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const p1 = Promise.resolve(1);
      const p2 = Promise.reject(new Error('test'));
      const arr = [p1, p2];
      const callback = (item: Promise<number>) => item instanceof Promise;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest038
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3800
     * @tc.desc   Every() with Error objects (various types)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const e1 = new Error('Generic error');
      const e2 = new TypeError('Type error');
      const e3 = new RangeError('Range error');
      const arr = [e1, e2, e3];
      const callback = (item: Error) => item instanceof Error;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest039
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3900
     * @tc.desc   Every() with Map elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const m1 = new Map<number, string>();
      const m2 = new Map([[1, 'a'], [2, 'b']]);
      const arr = [m1, m2];
      const callback = (item: Map<number, string>) => item instanceof Map;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest040
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4000
     * @tc.desc   Every() with Set elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const s1 = new Set<number>();
      const s2 = new Set([1, 2, 3]);
      const arr = [s1, s2];
      const callback = (item: Set<number>) => item instanceof Set;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest041
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4100
     * @tc.desc   Every() with generator function elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest041()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest042
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4200
     * @tc.desc   Every() with async function elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest042()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest043
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4300
     * @tc.desc   Every() with Proxy elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest043()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest044
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4400
     * @tc.desc   Every() with Reflect objects (methods)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [Reflect.get, Reflect.set, Reflect.has];
      const callback = (item: Function) => typeof item === 'function';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest045
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4500
     * @tc.desc   Every() with Math objects (methods)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [Math.sqrt, Math.abs, Math.floor];
      const callback = (item: Function) => typeof item === 'function';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest046
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4600
     * @tc.desc   Every() with JSON objects (methods)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [JSON.parse, JSON.stringify];
      const callback = (item: Function) => typeof item === 'function';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest047
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4700
     * @tc.desc   Every() with Intl objects (various types)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const df = new Intl.DateTimeFormat('en-US');
      const nf = new Intl.NumberFormat('en-US');
      const collator = new Intl.Collator('en-US');
      const arr = [df, nf, collator];
      const callback = (item: (Intl.DateTimeFormat | Intl.NumberFormat | Intl.Collator)) => item instanceof Object;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest048
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4800
     * @tc.desc   Every() with RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const r1 = /test/;
      const r2 = new RegExp('test', 'g');
      const arr = [r1, r2];
      const callback = (item: RegExp) => item instanceof RegExp;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest049
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4900
     * @tc.desc   Every() with Date objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const d1 = new Date();
      const d2 = new Date(2023, 0, 1);
      const arr = [d1, d2];
      const callback = (item: Date) => item instanceof Date;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest068
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_6800
     * @tc.desc   Every() with console objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [console.log, console.error, console.warn];
      const callback = (item: Function) => typeof item === 'function';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest071
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7100
     * @tc.desc   Every() with null prototype objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest071()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest072
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7200
     * @tc.desc   Every() with frozen objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest072()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest073
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7300
     * @tc.desc   Every() with sealed objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest073()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest074
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7400
     * @tc.desc   Every() with configurable: false properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest074()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest075
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7500
     * @tc.desc   Every() with getter-only properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      class Base {
        get value() {
          return 1;
        }
      }

      const obj1 = {
        get value() {
          return 1;
        }
      } as Base;

      const obj2 = {
        get value() {
          return 2;
        }
      } as Base;

      const arr = [obj1, obj2];
      const callback = (item: Base) => item.value > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest076
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7600
     * @tc.desc   Every() with setter-only properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest076()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest077
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7700
     * @tc.desc   Every() with non-writable properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest077()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest078
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7800
     * @tc.desc   Every() with enumerable: false properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest078()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest079
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7900
     * @tc.desc   Every() with inherited properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest079()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest080
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8000
     * @tc.desc   Every() with Symbols as property keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest080()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest081
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8100
     * @tc.desc   Every() with large integer keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest081()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest082
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8200
     * @tc.desc   Every() with negative integer keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest082()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest083
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8300
     * @tc.desc   Every() with string keys that look like numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest083()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest084
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8400
     * @tc.desc   Every() with empty string keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest084()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest085
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8500
     * @tc.desc   Every() with whitespace-only keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest085()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest086
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8600
     * @tc.desc   Every() with special character keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest086()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest087
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8700
     * @tc.desc   Every() with Unicode character keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        café: number
      }

      const obj1 = { café: 1 } as BaseI;
      const obj2 = { café: 2 } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.café > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest088
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8800
     * @tc.desc   Every() with emoji keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest088()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest089
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8900
     * @tc.desc   Every() with nested objects with Symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest089()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest090
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9000
     * @tc.desc   Every() with deeply nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        d: number
      }

      interface BaseI1 {
        c: BaseI
      }

      interface BaseI2 {
        b: BaseI1
      }

      interface BaseI3 {
        a: BaseI2
      }

      const obj1 = { a: { b: { c: { d: 1 } } } } as BaseI3;
      const obj2 = { a: { b: { c: { d: 2 } } } } as BaseI3;

      const arr = [obj1, obj2];
      const callback = (item: BaseI3) => item.a.b.c.d > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest091
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9100
     * @tc.desc   Every() with arrays as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        values: number[]
      }

      const obj1 = { values: [1, 2, 3] } as BaseI;
      const obj2 = { values: [4, 5, 6] } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.values.length > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest092
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9200
     * @tc.desc   Every() with functions as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        func: () => number
      }

      const obj1 = { func: () => 1 } as BaseI;
      const obj2 = { func: () => 2 } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => typeof item.func === 'function';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest093
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9300
     * @tc.desc   Every() with generator functions as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest093()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest094
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9400
     * @tc.desc   Every() with async functions as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        asyncFunc: () => Promise<number>
      }

      const obj1 = { asyncFunc: async () => 1 } as BaseI;
      const obj2 = { asyncFunc: async () => 2 } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => typeof item.asyncFunc === 'function';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest095
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9500
     * @tc.desc   Every() with Promises as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        promise: Promise<number>
      }

      const obj1 = { promise: Promise.resolve(1) } as BaseI;
      const obj2 = { promise: Promise.resolve(2) } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.promise instanceof Promise;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest096
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9600
     * @tc.desc   Every() with Maps as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        map: Map<number, string>
      }

      const obj1 = { map: new Map([[1, 'a']]) } as BaseI;
      const obj2 = { map: new Map([[2, 'b']]) } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.map instanceof Map;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest097
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9700
     * @tc.desc   Every() with Sets as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        set: Set<number>
      }

      const obj1 = { set: new Set([1, 2]) } as BaseI;
      const obj2 = { set: new Set([3, 4]) } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.set instanceof Set;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest098
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9800
     * @tc.desc   Every() with WeakMaps as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {}

      const key1 = {} as BaseI;
      const key2 = {} as BaseI;

      interface BaseI1 {
        weakMap: WeakMap<object, string>
      }

      const obj1 = { weakMap: new WeakMap([[key1, 'a']]) } as BaseI1;
      const obj2 = { weakMap: new WeakMap([[key2, 'b']]) } as BaseI1;

      const arr = [obj1, obj2];
      const callback = (item: BaseI1) => item.weakMap instanceof WeakMap;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest099
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9900
     * @tc.desc   Every() with WeakSets as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {}

      const key1 = {} as BaseI;
      const key2 = {} as BaseI;

      interface BaseI1 {
        weakSet: WeakSet<object>
      }

      const obj1 = { weakSet: new WeakSet([key1]) } as BaseI1;
      const obj2 = { weakSet: new WeakSet([key2]) } as BaseI1;

      const arr = [obj1, obj2];
      const callback = (item: BaseI1) => item.weakSet instanceof WeakSet;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest100
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10000
     * @tc.desc   Every() with regular expressions objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        regex: RegExp
      }

      const obj1 = { regex: /test1/ } as BaseI;
      const obj2 = { regex: /test2/g } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.regex instanceof RegExp;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest101
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10100
     * @tc.desc   Every() with Date objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        date: Date
      }

      const obj1 = { date: new Date() } as BaseI;
      const obj2 = { date: new Date(2023, 0, 1) } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.date instanceof Date;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest102
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10200
     * @tc.desc   Every() with Error objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        error: Error
      }

      const obj1 = { error: new Error('Error 1') } as BaseI;
      const obj2 = { error: new TypeError('Type Error 2') } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.error instanceof Error;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest103
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10300
     * @tc.desc   Every() with ArrayBuffer objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        buffer: ArrayBuffer
      }

      const obj1 = { buffer: new ArrayBuffer(16) } as BaseI;
      const obj2 = { buffer: new ArrayBuffer(32) } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.buffer instanceof ArrayBuffer;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest104
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10400
     * @tc.desc   Every() with DataView objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        view: DataView
      }

      const buffer = new ArrayBuffer(16);
      const obj1 = { view: new DataView(buffer) } as BaseI;
      const obj2 = { view: new DataView(buffer, 8) } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.view instanceof DataView;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest105
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10500
     * @tc.desc   Every() with TypedArray objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        typedArray: Int32Array | Float64Array
      }

      const obj1 = { typedArray: new Int32Array([1, 2, 3]) } as BaseI;
      const obj2 = { typedArray: new Float64Array([4.5, 5.5, 6.5]) } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => ArrayBuffer.isView(item.typedArray);

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest106
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10600
     * @tc.desc   Every() with Proxy objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest106()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest111
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_11100
     * @tc.desc   Every() with Intl.DateTimeFormat objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        formatter: Intl.DateTimeFormat
      }

      const obj1 = { formatter: new Intl.DateTimeFormat('en-US') } as BaseI;
      const obj2 = { formatter: new Intl.DateTimeFormat('fr-FR') } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.formatter instanceof Intl.DateTimeFormat;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest112
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_11200
     * @tc.desc   Every() with Intl.NumberFormat objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        formatter: Intl.NumberFormat
      }

      const obj1 = { formatter: new Intl.NumberFormat('en-US') } as BaseI;
      const obj2 = { formatter: new Intl.NumberFormat('de-DE') } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.formatter instanceof Intl.NumberFormat;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest113
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_11300
     * @tc.desc   Every() with Intl.Collator objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        collator: Intl.Collator
      }

      const obj1 = { collator: new Intl.Collator('en-US') } as BaseI;
      const obj2 = { collator: new Intl.Collator('es-ES') } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.collator instanceof Intl.Collator;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest121
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12100
     * @tc.desc   Every() with null prototype objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest121()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest122
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12200
     * @tc.desc   Every() with frozen objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest122()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest123
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12300
     * @tc.desc   Every() with sealed objects as property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest123()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest124
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12400
     * @tc.desc   Every() with configurable: false properties in nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest124()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest125
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12500
     * @tc.desc   Every() with getter-only properties in nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      class Base {
        get value() {
          return 1;
        }
      }

      interface BaseI {
        valueObj: Base
      }

      const obj1 = {
        valueObj: {
          get value() {
            return 1;
          }
        } as Base
      } as BaseI;

      const obj2 = {
        valueObj: {
          get value() {
            return 2;
          }
        } as Base
      } as BaseI;

      const arr = [obj1, obj2];
      const callback = (item: BaseI) => item.valueObj.value > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest126
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12600
     * @tc.desc   Every() with non-writable properties in nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest126()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest127
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12700
     * @tc.desc   Every() with enumerable: false properties in nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest127()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest128
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12800
     * @tc.desc   Every() with inherited properties in nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest128()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest129
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12900
     * @tc.desc   Every() with Symbols as property keys in nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest129()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest130
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13000
     * @tc.desc   Every() with deeply nested objects with various property descriptors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest130()).assertEqual(true);
    });

    // ==============================================
    // Level 3: Advanced Edge Scenarios (131-140)
    // ==============================================

    /**
     * @tc.name   ArrayEveryTest131
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13100
     * @tc.desc   Every() with elements that are null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [null, null, null];
      const callback = (item: null) => item === null;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest132
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13200
     * @tc.desc   Every() with elements that are undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [undefined, undefined, undefined];
      const callback = (item: undefined) => item === undefined;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest133
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13300
     * @tc.desc   Every() with elements that are NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [NaN, NaN, NaN];
      const callback = (item: number) => Number.isNaN(item);

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest134
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13400
     * @tc.desc   Every() with elements that are Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [Infinity, Infinity, Infinity];
      const callback = (item: number) => item === Infinity;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest135
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13500
     * @tc.desc   Every() with elements that are -Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [-Infinity, -Infinity, -Infinity];
      const callback = (item: number) => item === -Infinity;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest136
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13600
     * @tc.desc   Every() with mixed null and undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [null, undefined, null];
      const callback = (item: null | undefined) => item == null;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest137
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13700
     * @tc.desc   Every() with sparse array containing only truthy values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, , 3, , 5];
      const callback = (item: number | undefined) => item ? item > 0 : false;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest138
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13800
     * @tc.desc   Every() with sparse array containing falsy values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, , 0, , 5];
      const callback = (item: number | undefined) => item ? item > 0 : false;

      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArrayEveryTest139
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13900
     * @tc.desc   Every() with array-like object (arguments)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest139()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest143
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14300
     * @tc.desc   Every() with array-like object missing some indices
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest143()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest144
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14400
     * @tc.desc   Every() with array-like object containing undefined values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest144()).assertEqual(false);
    });

    /**
     * @tc.name   ArrayEveryTest145
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14500
     * @tc.desc   Every() with TypedArray
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const typedArray = new Int32Array([1, 2, 3, 4, 5]);
      const callback = (item: number) => item > 0;

      const result = typedArray.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest146
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14600
     * @tc.desc   Every() with DataView
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const buffer = new ArrayBuffer(16);
      const dataView = new DataView(buffer);

      for (let i = 0; i < 16; i += 2) {
        dataView.setInt16(i, i + 1);
      }

      const arr: number[] = [];
      for (let i = 0; i < 16; i += 2) {
        arr.push(dataView.getInt16(i));
      }

      const callback = (item: number) => item > 0;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest147
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14700
     * @tc.desc   Every() with Map values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const map = new Map([[1, 'a'], [2, 'b'], [3, 'c']]);
      const arr = Array.from(map.values());
      const callback = (item: string) => typeof item === 'string';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest148
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14800
     * @tc.desc   Every() with Set values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set([1, 2, 3, 4]);
      const arr = Array.from(set);
      const callback = (item: number) => item > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest149
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14900
     * @tc.desc   Every() with generator output
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayEveryTest149()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest150
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15000
     * @tc.desc   Every() with async generator output
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(await ArrayEveryTest150()).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest151
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15100
     * @tc.desc   Every() with Promise.all output
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const promises = [Promise.resolve(1), Promise.resolve(2), Promise.resolve(3)];
      const arr = await Promise.all(promises);
      const callback = (item: number) => item > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest152
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15200
     * @tc.desc   Every() with Promise.allSettled output
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const promises = [Promise.resolve(1), Promise.resolve(2), Promise.reject(new Error('test'))];
      const results = await Promise.allSettled(promises);
      const callback =
        (result: PromiseSettledResult<number>) => result.status === 'fulfilled' || result.status === 'rejected';

      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest153
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15300
     * @tc.desc   Every() with Promise.race output (wrapped in array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const promises = [Promise.resolve(1), new Promise<number>(resolve => setTimeout(() => resolve(2), 10))];
      const value = await Promise.race(promises);
      const arr = [value];
      const callback = (item: number) => item === 1;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest156
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15600
     * @tc.desc   Every() with Intl.Collator compare results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const collator = new Intl.Collator('en-US');
      const arr = ['apple', 'banana', 'cherry'];
      const results: number[] = [];

      for (let i = 0; i < arr.length - 1; i++) {
        results.push(collator.compare(arr[i], arr[i + 1]));
      }

      const callback = (result: number) => result < 0;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest157
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15700
     * @tc.desc   Every() with JSON.parse results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        a: number
      }

      const jsonStrings = ['{"a":1}', '{"b":2}', '{"c":3}'];
      const arr = jsonStrings.map(str => JSON.parse(str) as BaseI);
      const callback = (obj: BaseI) => typeof obj === 'object' && obj !== null;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest158
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15800
     * @tc.desc   Every() with Math operations results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const numbers = [4, 9, 16, 25];
      const arr = numbers.map(num => Math.sqrt(num));
      const callback = (value: number) => Number.isInteger(value);

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest159
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15900
     * @tc.desc   Every() with Reflect operations results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI {
        a: number,
        b: number,
        c: number
      }

      const obj = { a: 1, b: 2, c: 3 } as BaseI;
      const keys = ['a', 'b', 'c'];
      const results = keys.map(key => Reflect.has(obj, key));

      const callback = (result: boolean) => result === true;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest160
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16000
     * @tc.desc   Every() with Date objects' time values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const dates = [new Date(), new Date(2023, 0, 1), new Date(2024, 11, 31)];
      const arr = dates.map(date => date.getTime());
      const callback = (time: number) => typeof time === 'number' && time > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest161
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16100
     * @tc.desc   Every() with RegExp exec results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const regex = /(\d+)-(\w+)/;
      const strings = ['123-test', '456-example', '789-demo'];
      const results = strings.map(str => regex.exec(str));

      const callback = (result: (RegExpExecArray | null)) => result !== null && result.length === 3;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest162
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16200
     * @tc.desc   Every() with string match results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['test123', 'example456', 'demo789'];
      const results = strings.map(str => str.match(/\d+/));

      const callback = (result: (RegExpMatchArray | null)) => result !== null;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest163
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16300
     * @tc.desc   Every() with string split results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['a,b,c', '1,2,3', 'x,y,z'];
      const results = strings.map(str => str.split(','));

      const callback = (result: string[]) => Array.isArray(result) && result.length === 3;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest164
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16400
     * @tc.desc   Every() with string replace results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['Hello World', 'Good Morning', 'Happy Day'];
      const results = strings.map(str => str.replace(/ /g, '-'));

      const callback = (result: string) => !result.includes(' ');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest165
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16500
     * @tc.desc   Every() with string search results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['test string', 'example string', 'demo string'];
      const results = strings.map(str => str.search(/string/));

      const callback = (result: number) => result !== -1;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest166
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16600
     * @tc.desc   Every() with string indexOf results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['apple', 'application', 'aptitude'];
      const results = strings.map(str => str.indexOf('ap'));

      const callback = (result: number) => result === 0;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest167
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16700
     * @tc.desc   Every() with string lastIndexOf results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['banana', 'cucumber', 'elephant'];
      const results = strings.map(str => str.lastIndexOf('e'));

      const callback = (result: number) => result !== -1;
      const result = results.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   ArrayEveryTest168
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16800
     * @tc.desc   Every() with string includes results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['javascript', 'typescript', 'coffeescript'];
      const results = strings.map(str => str.includes('script'));

      const callback = (result: boolean) => result === true;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest169
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16900
     * @tc.desc   Every() with string startsWith results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['hello world', 'hello there', 'hello everyone'];
      const results = strings.map(str => str.startsWith('hello'));

      const callback = (result: boolean) => result === true;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest170
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17000
     * @tc.desc   Every() with string endsWith results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['test.txt', 'document.txt', 'image.txt'];
      const results = strings.map(str => str.endsWith('.txt'));

      const callback = (result: boolean) => result === true;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest171
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17100
     * @tc.desc   Every() with string repeat results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['a', 'b', 'c'];
      const results = strings.map(str => str.repeat(3));

      const callback = (result: string) => result.length === 3;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest172
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17200
     * @tc.desc   Every() with string padStart results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['1', '2', '3'];
      const results = strings.map(str => str.padStart(3, '0'));

      const callback = (result: string) => result.length === 3 && result.startsWith('0');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest173
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17300
     * @tc.desc   Every() with string padEnd results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['1', '2', '3'];
      const results = strings.map(str => str.padEnd(3, '0'));

      const callback = (result: string) => result.length === 3 && result.endsWith('0');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest174
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17400
     * @tc.desc   Every() with string trim results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['  test  ', '  example  ', '  demo  '];
      const results = strings.map(str => str.trim());

      const callback = (result: string) => !result.startsWith(' ') && !result.endsWith(' ');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest175
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17500
     * @tc.desc   Every() with string trimStart results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['  test', '  example', '  demo'];
      const results = strings.map(str => str.trimStart());

      const callback = (result: string) => !result.startsWith(' ');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest176
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17600
     * @tc.desc   Every() with string trimEnd results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['test  ', 'example  ', 'demo  '];
      const results = strings.map(str => str.trimEnd());

      const callback = (result: string) => !result.endsWith(' ');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest177
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17700
     * @tc.desc   Every() with string toUpperCase results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['hello', 'world', 'test'];
      const results = strings.map(str => str.toUpperCase());

      const callback = (result: string) => result === result.toUpperCase();
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest178
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17800
     * @tc.desc   Every() with string toLowerCase results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['HELLO', 'WORLD', 'TEST'];
      const results = strings.map(str => str.toLowerCase());

      const callback = (result: string) => result === result.toLowerCase();
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest179
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17900
     * @tc.desc   Every() with string charAt results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['apple', 'banana', 'cherry'];
      const results = strings.map(str => str.charAt(0));

      const callback = (result: string) => result.length === 1;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   ArrayEveryTest180
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_18000
     * @tc.desc   Every() with string charCodeAt results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayEveryTest180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['A', 'B', 'C'];
      const results = strings.map(str => str.charCodeAt(0));

      const callback = (result: number) => typeof result === 'number' && result >= 65 && result <= 90;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });
  });
}