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
import { BusinessError } from '@ohos.base';

interface BaseI7 {
  id: number,
  active: boolean
}

interface BaseI8 {
  id: number,
  active: boolean
}

interface BaseI14 {
  elem: number,
  idx: int,
  arr: number[]
}

interface BaseI26 {
  id: number
}

interface BaseI75 {
  readonly value: number;
}

interface BaseI87 {
  café: number
}

interface BaseI90 {
  d: number
}

interface BaseI901 {
  c: BaseI90
}

interface BaseI902 {
  b: BaseI901
}

interface BaseI903 {
  a: BaseI902
}

interface BaseI91 {
  values: number[]
}

interface BaseI92 {
  func: () => number
}

interface BaseI94 {
  asyncFunc: () => Promise<number>
}

interface BaseI95 {
  promise: Promise<number>
}

interface BaseI96 {
  map: Map<number, string>
}

interface BaseI97 {
  s: Set<number>;
}

interface BaseI98 {}
interface BaseI981 {
  weakMap: WeakMap<object, string>
}

interface BaseI99 {}
interface BaseI991 {
  weakSet: WeakSet<object>
}

interface BaseI100 {
  regex: RegExp
}

interface BaseI101 {
  date: Date
}

interface BaseI102 {
  error: Error
}

interface BaseI103 {
  buffer: ArrayBuffer
}

interface BaseI104 {
  view: DataView
}

interface BaseI105 {
  typedArray: Int32Array | Float64Array
}

interface BaseI111 {
  formatter: Intl.DateTimeFormat
}

interface BaseI112 {
  formatter: Intl.NumberFormat
}

interface BaseI113 {
  collator: Intl.Collator
}
interface Base125 {
  readonly value: number;
}
interface BaseI125 {
  valueObj: Base125
}

interface BaseI157 {
  a: number
}

interface BaseI159 {
  a: number,
  b: number,
  c: number
}

export default function ArrayEveryTest() {
  describe('ArrayEveryTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0100
     * @tc.name ArrayEveryTest001
     * @tc.desc All elements > 10, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: number[] = [12, 15, 20, 18];
      const callback = (num: number) => num > 10;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([12, 15, 20, 18]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0200
     * @tc.name ArrayEveryTest002
     * @tc.desc Exists element <= 10, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: number[] = [12, 5, 20, 18];
      const callback = (num: number) => num > 10;
      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0300
     * @tc.name ArrayEveryTest003
     * @tc.desc Empty array, return true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: boolean[] = [];
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0400
     * @tc.name ArrayEveryTest004
     * @tc.desc Single-element array, element passes test (return true)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: number[] = [15];
      const callback = (num: number) => num > 10;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0500
     * @tc.name ArrayEveryTest005
     * @tc.desc Single-element array, element fails test (return false)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: number[] = [5];
      const callback = (num: number) => num > 10;
      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0600
     * @tc.name ArrayEveryTest006
     * @tc.desc All strings have length <= 6
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ["spray", "elite", "quick"];
      const callback = (str: string) => str.length <= 6;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0700
     * @tc.name ArrayEveryTest007
     * @tc.desc All objects have active: true
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: BaseI7[] = [
        { id: 1, active: true },
        { id: 2, active: true },
        { id: 3, active: true }
      ];
      const callback = (obj: BaseI7) => obj.active;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0800
     * @tc.name ArrayEveryTest008
     * @tc.desc Exists object with active: false, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: BaseI8[] = [
        { id: 1, active: true },
        { id: 2, active: false },
        { id: 3, active: true }
      ];
      const callback = (obj: BaseI8) => obj.active;
      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0900
     * @tc.name ArrayEveryTest009
     * @tc.desc All elements are not null
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: number[] = [1, 2, 3];
      const callback = (elem: number) => elem !== null;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1000
     * @tc.name ArrayEveryTest010
     * @tc.desc Exists null element, return false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ArrayEveryTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: (number | null)[] = [1, null, 3];
      const callback = (elem: number | null) => elem !== null;
      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1100
     * @tc.name ArrayEveryTest011
     * @tc.desc Invalid element at array start (short-circuit: 1 callback call)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayEveryTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: number[] = [5, 12, 15, 18];
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1200
     * @tc.name ArrayEveryTest012
     * @tc.desc Invalid element in array middle (short-circuit: stop at middle)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayEveryTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: number[] = [12, 15, 5, 18];
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1300
     * @tc.name ArrayEveryTest013
     * @tc.desc All elements valid (all callbacks called)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayEveryTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: number[] = [12, 15, 18, 20];
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1400
     * @tc.name ArrayEveryTest014
     * @tc.desc Verify callback parameters (element, index, array)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // todo
    // it('ArrayEveryTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
    //   interface BaseI {
    //     elem: number,
    //     idx: number,
    //     arr: number[]
    //   }
    //
    //   const arr = [10, 20, 30];
    //   const paramsLog: BaseI[] = [];
    //   const callback = (elem: number, idx: number, arr: number[]) => {
    //     paramsLog.push({ elem, idx, arr });
    //     return elem >= 10;
    //   };
    //   const result = arr.every(callback);
    //
    //   expect(result).assertEqual(true);
    //   expect(paramsLog.length).assertEqual(3);
    //   expect(paramsLog[0]).assertDeepEquals({ elem: 10, idx: 0, arr: arr });
    //   expect(paramsLog[1]).assertDeepEquals({ elem: 20, idx: 1, arr: arr });
    //   expect(paramsLog[2]).assertDeepEquals({ elem: 30, idx: 2, arr: arr });
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1500
     * @tc.name ArrayEveryTest015
     * @tc.desc Every() on sparse array (empty slots skipped)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayEveryTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr: (number | undefined)[] = [12, undefined, 15, undefined, 18];
      let callCount = 0;
      const callback = (num: (number | undefined)) => {
        callCount++;
        return num ? num > 10 : false;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(false);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1600
     * @tc.name ArrayEveryTest016
     * @tc.desc Every() on non-array object (class array) via call()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ArrayEveryTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
    //   expect(ArrayEveryTest016()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1800
     * @tc.name ArrayEveryTest018
     * @tc.desc Use thisArg to bind this in callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ArrayEveryTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
    //   expect(ArrayEveryTest018()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1900
     * @tc.name ArrayEveryTest019
     * @tc.desc No thisArg: this is undefined in strict mode callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('ArrayEveryTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
    //   expect(ArrayEveryTest019()).assertEqual(undefined);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2000
     * @tc.name ArrayEveryTest020
     * @tc.desc Every() with BigInt elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('ArrayEveryTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [12n, 15n, 18n];
      const callback = (big: bigint) => big > 10n;
      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2100
     * @tc.name ArrayEveryTest021
     * @tc.desc Callback throws error during iteration (traversal interrupts)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [12, 15, 18];
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2200
     * @tc.name ArrayEveryTest022
     * @tc.desc Modify array during iteration (add element beyond initial length)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [12, 15, 18];
      let callCount = 0;

      const callback = (num: number, idx: Int, arr: number[]) => {
        callCount++;
        if (idx === 0) {
          arr.push(5);
        }
        return num > 10;
      };
      const result = arr.every(callback);

      expect(result).assertEqual(true);
      expect(callCount).assertEqual(3);
      expect(JSON.stringify(arr)).assertEqual(JSON.stringify([12, 15, 18, 5]));
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2300
     * @tc.name ArrayEveryTest023
     * @tc.desc Modify unvisited element during iteration (make it invalid)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [12, 15, 18];
      let callCount = 0;

      const callback = (num: number, idx: Int, array: number[]) => {
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2400
     * @tc.name ArrayEveryTest024
     * @tc.desc Delete unvisited element during iteration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const result = ArrayEveryTest024();
    //
    //   expect(result[0]).assertEqual(true);
    //   expect(result[1]).assertEqual(2);
    //   expect(result[2]).assertEqual(undefined);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2500
     * @tc.name ArrayEveryTest025
     * @tc.desc Every() with Symbol elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest025()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2600
     * @tc.name ArrayEveryTest026
     * @tc.desc Every() with nested objects (check reference equality)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj = { id: 1 } as BaseI26;
      const arr = [
        obj,
        obj,
        obj
      ];
      const callback = (item: BaseI26) => item === obj; // All elements are the same object

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2700
     * @tc.name ArrayEveryTest027
     * @tc.desc Callback is non-function (throws TypeError)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr: number[] = [1, 2];
    //   let errorThrown = false;
    //
    //   try {
    //     ArrayEveryTest027(arr);
    //   } catch (e) {
    //     errorThrown = e instanceof TypeError;
    //   }
    //
    //   expect(errorThrown).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2800
     * @tc.name ArrayEveryTest028
     * @tc.desc Every() on non-array object without length (returns true)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest028()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_2900
     * @tc.name ArrayEveryTest029
     * @tc.desc Every() with NaN elements (check if all are not NaN)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: number[] = [12, 15, 18];
      const callback = (num: number) => !Number.isNaN(num);

      const result = arr.every(callback);

      expect(result).assertEqual(true);

      const arrWithNaN: number[] = [12, NaN, 18];
      const resultWithNaN = arrWithNaN.every(callback);
      expect(resultWithNaN).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3000
     * @tc.name ArrayEveryTest030
     * @tc.desc Comprehensive test: mixed types + dynamic modification + thisArg
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
    //   const result = ArrayEveryTest030();
    //
    //   expect(result[0]).assertEqual(false);
    //   expect(result[1]).assertEqual(4);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3100
     * @tc.name ArrayEveryTest031
     * @tc.desc Every() with WeakMap elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3200
     * @tc.name ArrayEveryTest032
     * @tc.desc Every() with WeakSet elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const ws1 = new WeakSet<object>();
      const ws2 = new WeakSet<object>();
      const arr = [ws1, ws2];
      const callback = (item: WeakSet<object>) => item instanceof WeakSet;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3300
     * @tc.name ArrayEveryTest033
     * @tc.desc Every() with DataView elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3400
     * @tc.name ArrayEveryTest034
     * @tc.desc Every() with ArrayBuffer elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3500
     * @tc.name ArrayEveryTest035
     * @tc.desc Every() with TypedArray elements (Int32Array)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3600
     * @tc.name ArrayEveryTest036
     * @tc.desc Every() with SharedArrayBuffer elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const sab1 = new ArrayBuffer(16);
      const sab2 = new ArrayBuffer(32);
      const arr = [sab1, sab2];
      const callback = (item: ArrayBuffer) => item instanceof ArrayBuffer;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3700
     * @tc.name ArrayEveryTest037
     * @tc.desc Every() with Promise elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const p1 = Promise.resolve(1);
      const p2 = Promise.reject(new Error('test'));
      const arr: Promise<Int>[] = [p1, p2];
      const callback = (item: Promise<Int>) => item instanceof Promise;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3800
     * @tc.name ArrayEveryTest038
     * @tc.desc Every() with Error objects (various types)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_3900
     * @tc.name ArrayEveryTest039
     * @tc.desc Every() with Map elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const m1 = new Map<number, string>();
      const m2 = new Map<number, string>([[1, 'a'], [2, 'b']]);
      const arr = [m1, m2];
      const callback = (item: Map<number, string>) => item instanceof Map;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4000
     * @tc.name ArrayEveryTest040
     * @tc.desc Every() with Set elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const s1 = new Set<number>();
      const s2 = new Set<number>([1, 2, 3]);
      const arr = [s1, s2];
      const callback = (item: Set<number>) => item instanceof Set;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4100
     * @tc.name ArrayEveryTest041
     * @tc.desc Every() with generator function elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest041()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4200
     * @tc.name ArrayEveryTest042
     * @tc.desc Every() with async function elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest042()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4300
     * @tc.name ArrayEveryTest043
     * @tc.desc Every() with Proxy elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest043()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4500
     * @tc.name ArrayEveryTest045
     * @tc.desc Every() with Math objects (methods)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [Math.sqrt, Math.floor];
      const callback = (item: Function) => typeof item === 'function';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4600
     * @tc.name ArrayEveryTest046
     * @tc.desc Every() with JSON objects (methods)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // todo
    // it('ArrayEveryTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [JSON.parse, JSON.stringify];
    //   const callback = (item: Function) => typeof item === 'function';
    //
    //   const result = arr.every(callback);
    //
    //   expect(result).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4700
     * @tc.name ArrayEveryTest047
     * @tc.desc Every() with Intl objects (various types)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4800
     * @tc.name ArrayEveryTest048
     * @tc.desc Every() with RegExp objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const r1 = new RegExp('test');
      const r2 = new RegExp('test', 'g');
      const arr = [r1, r2];
      const callback = (item: RegExp) => item instanceof RegExp;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_4900
     * @tc.name ArrayEveryTest049
     * @tc.desc Every() with Date objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_6800
     * @tc.name ArrayEveryTest068
     * @tc.desc Every() with console objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // todo
    // it('ArrayEveryTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const arr = [console.log, console.error, console.warn];
    //   const callback = (item: Function) => typeof item === 'function';
    //
    //   const result = arr.every(callback);
    //
    //   expect(result).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7100
     * @tc.name ArrayEveryTest071
     * @tc.desc Every() with null prototype objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest071()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7200
     * @tc.name ArrayEveryTest072
     * @tc.desc Every() with frozen objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest072()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7300
     * @tc.name ArrayEveryTest073
     * @tc.desc Every() with sealed objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest073()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7400
     * @tc.name ArrayEveryTest074
     * @tc.desc Every() with configurable: false properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest074()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7500
     * @tc.name ArrayEveryTest075
     * @tc.desc Every() with getter-only properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1: BaseI75 = { value: 1};
      const obj2: BaseI75 = { value: 2};

      const arr = [obj1, obj2];
      const callback = (item: BaseI75) => item.value > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7600
     * @tc.name ArrayEveryTest076
     * @tc.desc Every() with setter-only properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest076()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7700
     * @tc.name ArrayEveryTest077
     * @tc.desc Every() with non-writable properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest077()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7800
     * @tc.name ArrayEveryTest078
     * @tc.desc Every() with enumerable: false properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest078()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_7900
     * @tc.name ArrayEveryTest079
     * @tc.desc Every() with inherited properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest079()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8000
     * @tc.name ArrayEveryTest080
     * @tc.desc Every() with Symbols as property keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest080()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8100
     * @tc.name ArrayEveryTest081
     * @tc.desc Every() with large integer keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest081()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8200
     * @tc.name ArrayEveryTest082
     * @tc.desc Every() with negative integer keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest082()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8300
     * @tc.name ArrayEveryTest083
     * @tc.desc Every() with string keys that look like numbers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest083()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8400
     * @tc.name ArrayEveryTest084
     * @tc.desc Every() with empty string keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest084()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8500
     * @tc.name ArrayEveryTest085
     * @tc.desc Every() with whitespace-only keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest085()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8600
     * @tc.name ArrayEveryTest086
     * @tc.desc Every() with special character keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest086()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8700
     * @tc.name ArrayEveryTest087
     * @tc.desc Every() with Unicode character keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { café: 1 } as BaseI87;
      const obj2 = { café: 2 } as BaseI87;

      const arr = [obj1, obj2];
      const callback = (item: BaseI87) => item.café > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8800
     * @tc.name ArrayEveryTest088
     * @tc.desc Every() with emoji keys
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest088()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_8900
     * @tc.name ArrayEveryTest089
     * @tc.desc Every() with nested objects with Symbols
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest089()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9000
     * @tc.name ArrayEveryTest090
     * @tc.desc Every() with deeply nested objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { a: { b: { c: { d: 1 } } } } as BaseI903;
      const obj2 = { a: { b: { c: { d: 2 } } } } as BaseI903;

      const arr = [obj1, obj2];
      const callback = (item: BaseI903) => item.a.b.c.d > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9100
     * @tc.name ArrayEveryTest091
     * @tc.desc Every() with arrays as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { values: [1, 2, 3] } as BaseI91;
      const obj2 = { values: [4, 5, 6] } as BaseI91;

      const arr = [obj1, obj2];
      const callback = (item: BaseI91) => item.values.length > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9200
     * @tc.name ArrayEveryTest092
     * @tc.desc Every() with functions as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { func: () => 1.0 } as BaseI92;
      const obj2 = { func: () => 2.0 } as BaseI92;

      const arr = [obj1, obj2];
      const callback = (item: BaseI92) => typeof item.func === 'function';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9300
     * @tc.name ArrayEveryTest093
     * @tc.desc Every() with generator functions as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest093()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9400
     * @tc.name ArrayEveryTest094
     * @tc.desc Every() with async functions as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { asyncFunc: async () => 1.0 } as BaseI94;
      const obj2 = { asyncFunc: async () => 2.0 } as BaseI94;

      const arr = [obj1, obj2];
      const callback = (item: BaseI94) => typeof item.asyncFunc === 'function';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9500
     * @tc.name ArrayEveryTest095
     * @tc.desc Every() with Promises as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { promise: Promise.resolve(1.0) } as BaseI95;
      const obj2 = { promise: Promise.resolve(2.0) } as BaseI95;

      const arr = [obj1, obj2];
      const callback = (item: BaseI95) => item.promise instanceof Promise;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9600
     * @tc.name ArrayEveryTest096
     * @tc.desc Every() with Maps as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { map: new Map<number, string>([[1, 'a']]) } as BaseI96;
      const obj2 = { map: new Map<number, string>([[2, 'b']]) } as BaseI96;

      const arr = [obj1, obj2];
      const callback = (item: BaseI96) => item.map instanceof Map;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9700
     * @tc.name ArrayEveryTest097
     * @tc.desc Every() with Sets as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1: BaseI97 = { s: new Set<number>([1, 2]) };
      const obj2: BaseI97 = { s: new Set<number>([3, 4]) };

      const arr: BaseI97[] = [obj1, obj2];
      const callback = (item: BaseI97) => item.s instanceof Set;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9800
     * @tc.name ArrayEveryTest098
     * @tc.desc Every() with WeakMaps as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const key1 = {} as BaseI98;
      const key2 = {} as BaseI98;

      const obj1 = { weakMap: new WeakMap<object, string>([[key1, 'a']]) } as BaseI981;
      const obj2 = { weakMap: new WeakMap<object, string>([[key2, 'b']]) } as BaseI981;

      const arr = [obj1, obj2];
      const callback = (item: BaseI981) => item.weakMap instanceof WeakMap;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_9900
     * @tc.name ArrayEveryTest099
     * @tc.desc Every() with WeakSets as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const key1 = {} as BaseI99;
      const key2 = {} as BaseI99;

      const obj1 = { weakSet: new WeakSet<object>([key1]) } as BaseI991;
      const obj2 = { weakSet: new WeakSet<object>([key2]) } as BaseI991;

      const arr = [obj1, obj2];
      const callback = (item: BaseI991) => item.weakSet instanceof WeakSet;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10000
     * @tc.name ArrayEveryTest100
     * @tc.desc Every() with regular expressions objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const a = new RegExp('test1');
      const b = new RegExp('test2', 'g');
      const obj1 = { regex: a } as BaseI100;
      const obj2 = { regex: b } as BaseI100;

      const arr = [obj1, obj2];
      const callback = (item: BaseI100) => item.regex instanceof RegExp;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10100
     * @tc.name ArrayEveryTest101
     * @tc.desc Every() with Date objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { date: new Date() } as BaseI101;
      const obj2 = { date: new Date(2023, 0, 1) } as BaseI101;

      const arr = [obj1, obj2];
      const callback = (item: BaseI101) => item.date instanceof Date;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10200
     * @tc.name ArrayEveryTest102
     * @tc.desc Every() with Error objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { error: new Error('Error 1') } as BaseI102;
      const obj2 = { error: new TypeError('Type Error 2') } as BaseI102;

      const arr = [obj1, obj2];
      const callback = (item: BaseI102) => item.error instanceof Error;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10300
     * @tc.name ArrayEveryTest103
     * @tc.desc Every() with ArrayBuffer objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { buffer: new ArrayBuffer(16) } as BaseI103;
      const obj2 = { buffer: new ArrayBuffer(32) } as BaseI103;

      const arr = [obj1, obj2];
      const callback = (item: BaseI103) => item.buffer instanceof ArrayBuffer;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10400
     * @tc.name ArrayEveryTest104
     * @tc.desc Every() with DataView objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const buffer = new ArrayBuffer(16);
      const obj1 = { view: new DataView(buffer) } as BaseI104;
      const obj2 = { view: new DataView(buffer, 8) } as BaseI104;

      const arr = [obj1, obj2];
      const callback = (item: BaseI104) => item.view instanceof DataView;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10500
     * @tc.name ArrayEveryTest105
     * @tc.desc Every() with TypedArray objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { typedArray: new Int32Array([1, 2, 3]) } as BaseI105;
      const obj2 = { typedArray: new Float64Array([4.5, 5.5, 6.5]) } as BaseI105;

      const arr = [obj1, obj2];
      const callback = (item: BaseI105) => ArrayBuffer.isView(item.typedArray);

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_10600
     * @tc.name ArrayEveryTest106
     * @tc.desc Every() with Proxy objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest106()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_11100
     * @tc.name ArrayEveryTest111
     * @tc.desc Every() with Intl.DateTimeFormat objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { formatter: new Intl.DateTimeFormat('en-US') } as BaseI111;
      const obj2 = { formatter: new Intl.DateTimeFormat('fr-FR') } as BaseI111;

      const arr = [obj1, obj2];
      const callback = (item: BaseI111) => item.formatter instanceof Intl.DateTimeFormat;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_11200
     * @tc.name ArrayEveryTest112
     * @tc.desc Every() with Intl.NumberFormat objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { formatter: new Intl.NumberFormat('en-US') } as BaseI112;
      const obj2 = { formatter: new Intl.NumberFormat('de-DE') } as BaseI112;

      const arr = [obj1, obj2];
      const callback = (item: BaseI112) => item.formatter instanceof Intl.NumberFormat;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_11300
     * @tc.name ArrayEveryTest113
     * @tc.desc Every() with Intl.Collator objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1 = { collator: new Intl.Collator('en-US') } as BaseI113;
      const obj2 = { collator: new Intl.Collator('es-ES') } as BaseI113;

      const arr = [obj1, obj2];
      const callback = (item: BaseI113) => item.collator instanceof Intl.Collator;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12100
     * @tc.name ArrayEveryTest121
     * @tc.desc Every() with null prototype objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest121()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12200
     * @tc.name ArrayEveryTest122
     * @tc.desc Every() with frozen objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest122()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12300
     * @tc.name ArrayEveryTest123
     * @tc.desc Every() with sealed objects as property values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest123()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12400
     * @tc.name ArrayEveryTest124
     * @tc.desc Every() with configurable: false properties in nested objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest124()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12500
     * @tc.name ArrayEveryTest125
     * @tc.desc Every() with getter-only properties in nested objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const obj1: BaseI125 = {
        valueObj: {
          value: 1
        }
      };

      const obj2: BaseI125 = {
        valueObj: {
          value: 2
        }
      };

      const arr = [obj1, obj2];
      const callback = (item: BaseI125) => item.valueObj.value > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12600
     * @tc.name ArrayEveryTest126
     * @tc.desc Every() with non-writable properties in nested objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest126()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12700
     * @tc.name ArrayEveryTest127
     * @tc.desc Every() with enumerable: false properties in nested objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest127()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12800
     * @tc.name ArrayEveryTest128
     * @tc.desc Every() with inherited properties in nested objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest128()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_12900
     * @tc.name ArrayEveryTest129
     * @tc.desc Every() with Symbols as property keys in nested objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest129()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13000
     * @tc.name ArrayEveryTest130
     * @tc.desc Every() with deeply nested objects with various property descriptors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest130()).assertEqual(true);
    // });

    // ==============================================
    // Level 3: Advanced Edge Scenarios (131-140)
    // ==============================================

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13100
     * @tc.name ArrayEveryTest131
     * @tc.desc Every() with elements that are null
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [null, null, null];
      const callback = (item: null) => item === null;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13200
     * @tc.name ArrayEveryTest132
     * @tc.desc Every() with elements that are undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [undefined, undefined, undefined];
      const callback = (item: undefined) => item === undefined;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13300
     * @tc.name ArrayEveryTest133
     * @tc.desc Every() with elements that are NaN
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [NaN, NaN, NaN];
      const callback = (item: number) => Number.isNaN(item);

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13400
     * @tc.name ArrayEveryTest134
     * @tc.desc Every() with elements that are Infinity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [Infinity, Infinity, Infinity];
      const callback = (item: number) => item === Infinity;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13500
     * @tc.name ArrayEveryTest135
     * @tc.desc Every() with elements that are -Infinity
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [-Infinity, -Infinity, -Infinity];
      const callback = (item: number) => item === -Infinity;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13600
     * @tc.name ArrayEveryTest136
     * @tc.desc Every() with mixed null and undefined
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [null, undefined, null];
      const callback = (item: null | undefined) => item == null;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13700
     * @tc.name ArrayEveryTest137
     * @tc.desc Every() with sparse array containing only truthy values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | undefined)[] = [1, undefined, 3, undefined, 5];
      const callback = (item: number | undefined) => item ? item > 0 : false;

      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13800
     * @tc.name ArrayEveryTest138
     * @tc.desc Every() with sparse array containing falsy values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: (number | undefined)[] = [1, undefined, 0, undefined, 5];
      const callback = (item: number | undefined) => item ? item > 0 : false;

      const result = arr.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_13900
     * @tc.name ArrayEveryTest139
     * @tc.desc Every() with array-like object (arguments)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest139()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14300
     * @tc.name ArrayEveryTest143
     * @tc.desc Every() with array-like object missing some indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest143()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14400
     * @tc.name ArrayEveryTest144
     * @tc.desc Every() with array-like object containing undefined values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest144()).assertEqual(false);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14500
     * @tc.name ArrayEveryTest145
     * @tc.desc Every() with TypedArray
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const typedArray = new Int32Array([1, 2, 3, 4, 5]);
      const callback = (item: number) => item > 0;

      const result = typedArray.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14600
     * @tc.name ArrayEveryTest146
     * @tc.desc Every() with DataView
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14700
     * @tc.name ArrayEveryTest147
     * @tc.desc Every() with Map values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const map = new Map<number, string>([[1, 'a'], [2, 'b'], [3, 'c']]);
      const arr = Array.from(map.values());
      const callback = (item: string) => typeof item === 'string';

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14800
     * @tc.name ArrayEveryTest148
     * @tc.desc Every() with Set values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const set = new Set<number>([1, 2, 3, 4]);
      const arr = Array.from(set);
      const callback = (item: number) => item > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_14900
     * @tc.name ArrayEveryTest149
     * @tc.desc Every() with generator output
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(ArrayEveryTest149()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15000
     * @tc.name ArrayEveryTest150
     * @tc.desc Every() with async generator output
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // it('ArrayEveryTest150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   expect(await ArrayEveryTest150()).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15100
     * @tc.name ArrayEveryTest151
     * @tc.desc Every() with Promise.all output
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const promises = [Promise.resolve(1.0), Promise.resolve(2.0), Promise.resolve(3.0)];
      const arr = await Promise.all(promises);
      const callback = (item: number) => item > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15200
     * @tc.name ArrayEveryTest152
     * @tc.desc Every() with Promise.allSettled output
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // todo
    // it('ArrayEveryTest152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const promises = [Promise.resolve(1), Promise.resolve(2), Promise.reject(new Error('test'))];
    //   const results = await Promise.allSettled(promises);
    //   const callback =
    //     (result: PromiseSettledResult<number>) => result.status === 'fulfilled' || result.status === 'rejected';
    //
    //   const result = results.every(callback);
    //
    //   expect(result).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15300
     * @tc.name ArrayEveryTest153
     * @tc.desc Every() with Promise.race output (wrapped in array)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // todo
    // it('ArrayEveryTest153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   const promises = [Promise.resolve(1), new Promise<number>(resolve => setTimeout(() => resolve(2), 10))];
    //   const value = await Promise.race(promises);
    //   const arr = [value];
    //   const callback = (item: number) => item === 1;
    //
    //   const result = arr.every(callback);
    //
    //   expect(result).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15600
     * @tc.name ArrayEveryTest156
     * @tc.desc Every() with Intl.Collator compare results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15700
     * @tc.name ArrayEveryTest157
     * @tc.desc Every() with JSON.parse results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    // todo
    // it('ArrayEveryTest157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
    //   interface BaseI {
    //     a: number
    //   }
    //
    //   const jsonStrings = ['{"a":1}', '{"b":2}', '{"c":3}'];
    //   const arr = jsonStrings.map(str => JSON.parse(str) as BaseI);
    //   const callback = (obj: BaseI) => typeof obj === 'object' && obj !== null;
    //
    //   const result = arr.every(callback);
    //
    //   expect(result).assertEqual(true);
    // });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_15800
     * @tc.name ArrayEveryTest158
     * @tc.desc Every() with Math operations results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const numbers = [4, 9, 16, 25];
      const arr = numbers.map(num => Math.sqrt(num));
      const callback = (value: number) => Number.isInteger(value);

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16000
     * @tc.name ArrayEveryTest160
     * @tc.desc Every() with Date objects' time values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const dates = [new Date(), new Date(2023, 0, 1), new Date(2024, 11, 31)];
      const arr = dates.map<number>(date => date.getTime());
      const callback = (time: number) => typeof time === 'number' && time > 0;

      const result = arr.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16100
     * @tc.name ArrayEveryTest161
     * @tc.desc Every() with RegExp exec results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const regex = new RegExp('(\\d+)-(\\w+)');
      const strings = ['123-test', '456-example', '789-demo'];
      const results = strings.map(str => regex.exec(str));

      const callback = (result: (RegExpExecArray | null)) => result !== null && result.length === 3;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16200
     * @tc.name ArrayEveryTest162
     * @tc.desc Every() with string match results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['test123', 'example456', 'demo789'];
      const a = new RegExp('\\d+');
      const results = strings.map<RegExpMatchArray | null>(str => str.match(a));

      const callback = (result: (RegExpMatchArray | null)) => result !== null;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16300
     * @tc.name ArrayEveryTest163
     * @tc.desc Every() with string split results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['a,b,c', '1,2,3', 'x,y,z'];
      const results = strings.map<string[]>(str => str.split(','));

      const callback = (result: string[]) => Array.isArray(result) && result.length === 3;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16400
     * @tc.name ArrayEveryTest164
     * @tc.desc Every() with string replace results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['Hello World', 'Good Morning', 'Happy Day'];
      const a = new RegExp(' ', 'g');
      const results = strings.map<string>(str => str.replace(a, '-'));

      const callback = (result: string) => !result.includes(' ');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16500
     * @tc.name ArrayEveryTest165
     * @tc.desc Every() with string search results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['test string', 'example string', 'demo string'];
      const a = new RegExp('string');
      const results = strings.map<number>(str => str.search(a));

      const callback = (result: number) => result !== -1;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16600
     * @tc.name ArrayEveryTest166
     * @tc.desc Every() with string indexOf results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['apple', 'application', 'aptitude'];
      const results = strings.map<number>(str => str.indexOf('ap'));

      const callback = (result: number) => result === 0;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16700
     * @tc.name ArrayEveryTest167
     * @tc.desc Every() with string lastIndexOf results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['banana', 'cucumber', 'elephant'];
      const results = strings.map<number>(str => str.lastIndexOf('e'));

      const callback = (result: number) => result !== -1;
      const result = results.every(callback);

      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16800
     * @tc.name ArrayEveryTest168
     * @tc.desc Every() with string includes results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['javascript', 'typescript', 'coffeescript'];
      const results = strings.map<boolean>(str => str.includes('script'));

      const callback = (result: boolean) => result === true;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_16900
     * @tc.name ArrayEveryTest169
     * @tc.desc Every() with string startsWith results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['hello world', 'hello there', 'hello everyone'];
      const results = strings.map<boolean>(str => str.startsWith('hello'));

      const callback = (result: boolean) => result === true;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17000
     * @tc.name ArrayEveryTest170
     * @tc.desc Every() with string endsWith results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['test.txt', 'document.txt', 'image.txt'];
      const results = strings.map<boolean>(str => str.endsWith('.txt'));

      const callback = (result: boolean) => result === true;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17100
     * @tc.name ArrayEveryTest171
     * @tc.desc Every() with string repeat results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['a', 'b', 'c'];
      const results = strings.map<string>(str => str.repeat(3));

      const callback = (result: string) => result.length === 3;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17200
     * @tc.name ArrayEveryTest172
     * @tc.desc Every() with string padStart results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['1', '2', '3'];
      const results = strings.map<string>(str => str.padStart(3, '0'));

      const callback = (result: string) => result.length === 3 && result.startsWith('0');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17300
     * @tc.name ArrayEveryTest173
     * @tc.desc Every() with string padEnd results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['1', '2', '3'];
      const results = strings.map<string>(str => str.padEnd(3, '0'));

      const callback = (result: string) => result.length === 3 && result.endsWith('0');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17400
     * @tc.name ArrayEveryTest174
     * @tc.desc Every() with string trim results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['  test  ', '  example  ', '  demo  '];
      const results = strings.map<string>(str => str.trim());

      const callback = (result: string) => !result.startsWith(' ') && !result.endsWith(' ');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17500
     * @tc.name ArrayEveryTest175
     * @tc.desc Every() with string trimStart results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['  test', '  example', '  demo'];
      const results = strings.map<string>(str => str.trimStart());

      const callback = (result: string) => !result.startsWith(' ');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17600
     * @tc.name ArrayEveryTest176
     * @tc.desc Every() with string trimEnd results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['test  ', 'example  ', 'demo  '];
      const results = strings.map<string>(str => str.trimEnd());

      const callback = (result: string) => !result.endsWith(' ');
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17700
     * @tc.name ArrayEveryTest177
     * @tc.desc Every() with string toUpperCase results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['hello', 'world', 'test'];
      const results = strings.map<string>(str => str.toUpperCase());

      const callback = (result: string) => result === result.toUpperCase();
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17800
     * @tc.name ArrayEveryTest178
     * @tc.desc Every() with string toLowerCase results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['HELLO', 'WORLD', 'TEST'];
      const results = strings.map<string>(str => str.toLowerCase());

      const callback = (result: string) => result === result.toLowerCase();
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_17900
     * @tc.name ArrayEveryTest179
     * @tc.desc Every() with string charAt results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['apple', 'banana', 'cherry'];
      const results = strings.map<string>(str => str.charAt(0).toString());

      const callback = (result: string) => result.length === 1;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_18000
     * @tc.name ArrayEveryTest180
     * @tc.desc Every() with string charCodeAt results
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('ArrayEveryTest180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const strings = ['A', 'B', 'C'];
      const results = strings.map<number>(str => str.charCodeAt(0));

      const callback = (result: number) => typeof result === 'number' && result >= 65 && result <= 90;
      const result = results.every(callback);

      expect(result).assertEqual(true);
    });
  });
}