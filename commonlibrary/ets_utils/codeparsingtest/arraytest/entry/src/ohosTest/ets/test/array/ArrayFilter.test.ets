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
import { ArrayFilterTest011, ArrayFilterTest012, ArrayFilterTest013, ArrayFilterTest014,
  ArrayFilterTest019,
  ArrayFilterTest020,
  ArrayFilterTest024,
  ArrayFilterTest027,
  ArrayFilterTest028,
  ArrayFilterTest030,
  ArrayFilterTest038,
  ArrayFilterTest043,
  ArrayFilterTest045,
  ArrayFilterTest046,
  ArrayFilterTest047,
  ArrayFilterTest051,
  ArrayFilterTest052,
  ArrayFilterTest058,
  ArrayFilterTest059,
  ArrayFilterTest077,
  ArrayFilterTest084,
  ArrayFilterTest093,
  ArrayFilterTest094,
  ArrayFilterTest101,
  ArrayFilterTest102,
  ArrayFilterTest111,
  ArrayFilterTest112,
  ArrayFilterTest113,
  ArrayFilterTest115} from './ArrayFilter';
import { buffer } from '@kit.ArkTS';

function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function ArrayFilterTest() {
  describe('ArrayFilterTest', () => {
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
     * @tc.name   ArrayFilterTest001
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0100
     * @tc.desc   Filter numbers greater than 10, verify new array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [12, 5, 8, 130, 44];
      const callback = (num: number) => num >= 10;
      const result = arr.filter(callback);

      expect(result).assertDeepEquals([12, 130, 44]);
      expect(result.length).assertEqual(3);
      expect(arr).assertDeepEquals([12, 5, 8, 130, 44]);
    });

    /**
     * @tc.name   ArrayFilterTest002
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0200
     * @tc.desc   Filter strings with length > 5, verify new array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ["spray", "elite", "exuberant", "destruction", "present"];
      const result = arr.filter(str => str.length > 5);

      expect(result).assertDeepEquals(["exuberant", "destruction", "present"]);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayFilterTest003
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0300
     * @tc.desc   No elements pass test, return empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, 2, 3];
      const callback = (num: number) => num > 10;
      const result = arr.filter(callback);

      expect(result).assertDeepEquals([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ArrayFilterTest004
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0400
     * @tc.desc   Filter empty array, return empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [];
      let callbackCalled = false;
      const result = arr.filter(() => {
        callbackCalled = true;
        return true;
      });

      expect(result).assertDeepEquals([]);
      expect(callbackCalled).assertEqual(false);
    });

    /**
     * @tc.name   ArrayFilterTest005
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0500
     * @tc.desc   Callback receives all three parameters (element, index, array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface BaseI{
        elem: number,
        idx: number,
        arr: number[]
      }
      const arr = [10, 20];
      const paramsLog: BaseI[] = [];
      const callback = (elem: number, idx: number, arr: number[]) => {
        paramsLog.push({ elem, idx, arr });
        return true;
      };

      arr.filter(callback);

      expect(paramsLog.length).assertEqual(2);
      expect(paramsLog[0]).assertDeepEquals({ elem: 10, idx: 0, arr: arr });
      expect(paramsLog[1]).assertDeepEquals({ elem: 20, idx: 1, arr: arr });
    });

    /**
     * @tc.name   ArrayFilterTest006
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0600
     * @tc.desc   Filter single-element array, element passes test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ['only-element'];
      const result = arr.filter(str => str.length > 0);

      expect(result).assertDeepEquals(['only-element']);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   ArrayFilterTest007
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0700
     * @tc.desc   Filter single-element array, element fails test
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ['only-element'];
      const result = arr.filter(str => str.length > 20);

      expect(result).assertDeepEquals([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ArrayFilterTest008
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0800
     * @tc.desc   Filter array with null and undefined elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [null, undefined, 1, 'a'];
      const callback = (elem: null | number | undefined | string) => elem != null;
      const result = arr.filter(callback);

      expect(result).assertDeepEquals([1, 'a']);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ArrayFilterTest009
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_0900
     * @tc.desc   Filter array with boolean elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [true, false, true, false];
      const result = arr.filter(bool => bool);

      expect(result).assertDeepEquals([true, true]);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ArrayFilterTest010
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_1000
     * @tc.desc   Filter array of objects by property value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface BaseI{
        id: number,
        active: boolean
      }
      const arr: BaseI[] = [
        { id: 1, active: true },
        { id: 2, active: false },
        { id: 3, active: true }
      ];
      const result = arr.filter(obj => obj.active);

      expect(result).assertDeepEquals([{ id: 1, active: true }, { id: 3, active: true }]);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ArrayFilterTest011
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_1100
     * @tc.desc   Use thisArg to bind this in callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayFilterTest011()).assertDeepEquals([3, 4]);
    });

    /**
     * @tc.name   ArrayFilterTest012
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_1200
     * @tc.desc   No thisArg: this is undefined in strict mode callback
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayFilterTest012()).assertEqual(undefined);
    });

    /**
     * @tc.name   ArrayFilterTest013
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_1300
     * @tc.desc   Filter sparse array: empty slots are skipped
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, , 3, , 5];
      let callCount = 0;
      const callback = (elem: number| undefined) => {
        callCount++;
        return elem? elem % 2 === 1 : false;
      };
      const result = arr.filter(callback);

      expect(callCount).assertEqual(3);
      expect(result).assertDeepEquals([1, 3, 5]);
      expect(ArrayFilterTest013(result)).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest014
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_1400
     * @tc.desc   Filter non-array object (class array) via call()
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayFilterTest014() as string[];

      expect(result).assertDeepEquals(["a", "b"]);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ArrayFilterTest016
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_1600
     * @tc.desc   Callback uses index parameter to filter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [10, 20, 30, 40];
      const result = arr.filter((elem, idx) => idx % 2 === 0);

      expect(result).assertDeepEquals([10, 30]);
    });

    /**
     * @tc.name   ArrayFilterTest017
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_1700
     * @tc.desc   Callback uses original array parameter to filter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [5, 1, 3, 7, 2];
      const result = arr.filter((elem, _, originalArr) => elem > originalArr[0]);

      expect(result).assertDeepEquals([7]);
    });

    /**
     * @tc.name   ArrayFilterTest018
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_1800
     * @tc.desc   Filter array with BigInt elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1n, 2n, 10n, 5n];
      const callback = (big: bigint) => big > 5n;
      const result = arr.filter(callback);

      expect(result.toString()).assertEqual([10n].toString());
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   ArrayFilterTest019
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_1900
     * @tc.desc   Filter array with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayFilterTest019();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name   ArrayFilterTest020
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2000
     * @tc.desc   thisArg is primitive value (converted to object)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayFilterTest020()).assertDeepEquals([6]);
    });

    /**
     * @tc.name   ArrayFilterTest021
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2100
     * @tc.desc   Callback throws error during iteration, traversal interrupts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4];
      const result: number[] = [];
      let errorThrown = false;

      const callback = (elem: number) => {
        if (elem === 3) {
          throw new Error('Iteration interrupted');
        }
        const pass = elem % 2 === 0;
        if (pass) result.push(elem);
        return pass;
      };

      try {
        arr.filter(callback);
      } catch (e) {
        errorThrown = e.message === 'Iteration interrupted';
      }

      expect(errorThrown).assertEqual(true);
      expect(result).assertDeepEquals([2]);
    });

    /**
     * @tc.name   ArrayFilterTest022
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2200
     * @tc.desc   Filter array and modify original array during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      const result = arr.filter((elem, idx) => {
        if (idx === 0) {
          arr.push(4);
        }
        return elem > 1;
      });

      expect(result).assertDeepEquals([2, 3]);
      expect(result.length).assertEqual(2);
      expect(arr).assertDeepEquals([1, 2, 3, 4]);
    });

    /**
     * @tc.name   ArrayFilterTest023
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2300
     * @tc.desc   Filter large array (1000 elements), verify completeness
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest023', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL3, async () => {
      const arr: number[] = [];
      const expected: number[] = [];
      for (let i = 0; i < 1000; i++) {
        arr.push(i);
        if (i % 5 === 0) {
          expected.push(i);
        }
      }

      const result = arr.filter(elem => elem % 5 === 0);

      expect(result).assertDeepEquals(expected);
      expect(result.length).assertEqual(200);
      expect(result[199]).assertEqual(995);
    });

    /**
     * @tc.name   ArrayFilterTest024
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2400
     * @tc.desc   Callback is arrow function (ignores thisArg)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayFilterTest024();

      expect(result[0]).assertDeepEquals([4, 6]);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest025
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2500
     * @tc.desc   Filter array with function elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const func1 = () => 'a';
      const func2 = (x: number) => x * 2;
      const func3 = () => 'b';
      const arr = [func1, func2, func3];
      const result = arr.filter(fn => fn.length === 1);

      expect(result).assertDeepEquals([func2]);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   ArrayFilterTest026
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2600
     * @tc.desc   Filter array with nested objects, modify object in callback (shallow copy)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        id: number
      }
      const arr: BaseI[] = [{ id: 1 }, { id: 2 }, { id: 3 }];
      const result = arr.filter(obj => {
        obj.id *= 2;
        return obj.id > 3;
      });

      expect(result).assertDeepEquals([{ id: 4 }, { id: 6 }]);
      expect(arr).assertDeepEquals([{ id: 2 }, { id: 4 }, { id: 6 }]);
    });

    /**
     * @tc.name   ArrayFilterTest027
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2700
     * @tc.desc   Callback is non-function (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2];
      let errorThrown = false;

      try {
        ArrayFilterTest027(arr)
      } catch (e) {
        errorThrown = e instanceof TypeError;
      }

      expect(errorThrown).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest028
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2800
     * @tc.desc   Filter non-array object without length (returns empty array)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayFilterTest028() as string[];

      expect(result).assertDeepEquals([]);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   ArrayFilterTest029
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_2900
     * @tc.desc   Filter array with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        self?: BaseI | null,
        value: number
      }
      const obj = { self: null, value: 10 } as BaseI;
      obj.self = obj;
      const arr: (BaseI | number)[] = [obj, 5, { value: 15 }];

      const result = arr.filter(item => {
        if (typeof item === 'object') {
          return item.value > 5;
        }
        return false;
      });

      expect(result.length).assertEqual(2);
      expect((result[0] as BaseI).self).assertEqual(result[0]);
    });

    /**
     * @tc.name   ArrayFilterTest030
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3000
     * @tc.desc   Comprehensive test: mixed types + thisArg + sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = ArrayFilterTest030();

      expect(result[0]).assertEqual(true);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.name   ArrayFilterTest031
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3100
     * @tc.desc   Filter array with NaN values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [1, NaN, 3, NaN, 5];
      const result = arr.filter(num => !isNaN(num));

      expect(result).assertDeepEquals([1, 3, 5]);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayFilterTest032
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3200
     * @tc.desc   Filter array with negative numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [-5, 3, -2, 8, -1];
      const result = arr.filter(num => num < 0);

      expect(result).assertDeepEquals([-5, -2, -1]);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayFilterTest033
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3300
     * @tc.desc   Filter array of arrays by length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [[1], [1, 2], [1, 2, 3], []];
      const result = arr.filter(item => item.length > 1);

      expect(result).assertDeepEquals([[1, 2], [1, 2, 3]]);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ArrayFilterTest034
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3400
     * @tc.desc   Filter array with mixed case strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ["Apple", "banana", "Cherry", "date"];
      const result = arr.filter(str => str[0] === str[0].toUpperCase());

      expect(result).assertDeepEquals(["Apple", "Cherry"]);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   ArrayFilterTest035
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3500
     * @tc.desc   Filter array with zero values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [0, 1, 0, 2, 0, 3];
      const result = arr.filter(num => num !== 0);

      expect(result).assertDeepEquals([1, 2, 3]);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayFilterTest036
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3600
     * @tc.desc   Filter array with RegExp elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [/abc/, /def/, /abc/];
      const result = arr.filter(re => re.source === 'abc');

      expect(result.length).assertEqual(2);
      expect(result[0].source).assertEqual('abc');
      expect(result[1].source).assertEqual('abc');
    });

    /**
     * @tc.name   ArrayFilterTest037
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3700
     * @tc.desc   Filter array using callback with complex condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result = arr.filter(num => num % 2 === 0 && num > 5);

      expect(result).assertDeepEquals([6, 8, 10]);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   ArrayFilterTest038
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3800
     * @tc.desc   Filter array with dynamic thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayFilterTest038()).assertDeepEquals([20, 30]);
    });

    /**
     * @tc.name   ArrayFilterTest039
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_3900
     * @tc.desc   Filter array using index in complex condition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3, 4, 5, 6];
      const result = arr.filter((num, idx) => num > idx);

      expect(result).assertDeepEquals([1, 2, 3, 4, 5, 6]);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   ArrayFilterTest040
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4000
     * @tc.desc   Filter array and check reference equality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        a?: number
        b?: number
      }
      const obj1 = { a: 1 } as BaseI;
      const obj2 = { b: 2 } as BaseI;
      const obj3 = { a: 1 } as BaseI;
      const arr = [obj1, obj2, obj3];
      const result = arr.filter(obj => obj.a === 1);

      expect(result).assertDeepEquals([obj1, obj3]);
      expect(result[0]).assertEqual(obj1);
      expect(result[1]).assertEqual(obj3);
    });

    /**
     * @tc.name   ArrayFilterTest041
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4100
     * @tc.desc   Filter array with Date objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const date1 = new Date(2023, 0, 1);
      const date2 = new Date(2024, 0, 1);
      const date3 = new Date(2025, 0, 1);
      const cutoff = new Date(2024, 0, 1);

      const arr = [date1, date2, date3];
      const result = arr.filter(date => date >= cutoff);

      expect(result).assertDeepEquals([date2, date3]);
    });

    /**
     * @tc.name   ArrayFilterTest042
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4200
     * @tc.desc   Filter array using original array in callback logic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [5, 3, 8, 1, 9];
      const result = arr.filter((num, idx, original) => {
        return num > original[idx - 1] || idx === 0;
      });

      expect(result).assertDeepEquals([5, 8, 9]);
    });

    /**
     * @tc.name   ArrayFilterTest043
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4300
     * @tc.desc   Filter array with generator function elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayFilterTest043();

      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
      expect(result[3]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest044
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4400
     * @tc.desc   Filter array with promises
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const p1 = Promise.resolve(true);
      const p2 = Promise.reject(false);
      const p3 = Promise.resolve(true);
      const arr = [p1, p2, p3];

      const result = arr.filter(p => p instanceof Promise);

      expect(result).assertDeepEquals([p1, p2, p3]);
    });

    /**
     * @tc.name   ArrayFilterTest045
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4500
     * @tc.desc   Filter array using thisArg with dynamic properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayFilterTest045()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   ArrayFilterTest046
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4600
     * @tc.desc   Filter array and modify thisArg during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayFilterTest046()).assertDeepEquals([5]);
    });

    /**
     * @tc.name   ArrayFilterTest047
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4700
     * @tc.desc   Filter array and delete elements during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4, 5];
      const result = ArrayFilterTest047(arr) as (number | undefined)[];

      expect(result).assertDeepEquals([3, 4]);
      expect(arr).assertDeepEquals([1, 2, 3, 4, undefined]);
    });

    /**
     * @tc.name   ArrayFilterTest048
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4800
     * @tc.desc   Filter array with very large numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1e20, 1e10, 1e30, 1e5];
      const result = arr.filter(num => num > 1e15);

      expect(result).assertDeepEquals([1e20, 1e30]);
    });

    /**
     * @tc.name   ArrayFilterTest049
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_4900
     * @tc.desc   Filter array with typed array elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [
        new Uint8Array([1, 2, 3]),
        new Float32Array([4, 5]),
        new Uint8Array([6, 7, 8, 9])
      ];
      const result = arr.filter(typedArr => typedArr instanceof Uint8Array && typedArr.length > 3);

      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(arr[2]);
    });

    /**
     * @tc.name   ArrayFilterTest050
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5000
     * @tc.desc   Filter array with WeakMap and Map objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{}
      const map1 = new Map<string, string>();
      const wm1 = new WeakMap<object, string>();
      const map2 = new Map<string, string>();
      const arr = [map1, wm1, map2, {} as BaseI];

      const result = arr.filter(item => item instanceof Map);

      expect(result).assertDeepEquals([map1, map2]);
    });

    /**
     * @tc.name   ArrayFilterTest051
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5100
     * @tc.desc   Filter array with frozen objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        a: number
      }
      interface BaseI1{
        c: number
      }

      const result = ArrayFilterTest051();

      expect(result.length).assertEqual(2);
      expect((result[0] as BaseI).a).assertEqual(1);
      expect((result[1] as BaseI1).c).assertEqual(3);
    });

    /**
     * @tc.name   ArrayFilterTest052
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5200
     * @tc.desc   Filter array with non-writable properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      expect(ArrayFilterTest052()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   ArrayFilterTest053
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5300
     * @tc.desc   Filter array with getter properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      class Base{
        get value(){return 10;}
      }
      const obj1 = { get value() { return 10; } } as Base;
      const obj2 = { get value() { return 20; } } as Base;
      const obj3 = { get value() { return 5; } } as Base;
      const arr = [obj1, obj2, obj3];

      const result = arr.filter(obj => obj.value > 10);

      expect(result).assertDeepEquals([obj2]);
    });

    /**
     * @tc.name   ArrayFilterTest054
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5400
     * @tc.desc   Filter array using async callback (demonstrates non-waiting behavior)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4, 5];
      let callCount = 0;

      const result = arr.filter(async num => {
        callCount++;
        await new Promise<number>(resolve => setTimeout(resolve, 10));
        return num % 2 === 0;
      });

      expect(result.length).assertEqual(5);
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.name   ArrayFilterTest055
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5500
     * @tc.desc   Filter array with proxy objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        value: number
      }
      interface BaseI1{}
      const obj1 = new Proxy({ value: 5 } as BaseI, {} as BaseI1);
      const obj2 = new Proxy({ value: 15 } as BaseI, {} as BaseI1);
      const obj3 = new Proxy({ value: 10 } as BaseI, {} as BaseI1);
      const arr = [obj1, obj2, obj3];

      const result = arr.filter(proxy => proxy.value > 10);

      expect(result).assertDeepEquals([obj2]);
    });

    /**
     * @tc.name   ArrayFilterTest056
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5600
     * @tc.desc   Filter array with Error objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const err1 = new Error('Error 1');
      const err2 = new TypeError('Type Error');
      const err3 = new Error('Error 2');
      const arr = [err1, err2, err3, 'not an error'];

      const result = arr.filter(item => item instanceof TypeError);

      expect(result).assertDeepEquals([err2]);
    });

    /**
     * @tc.name   ArrayFilterTest057
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5700
     * @tc.desc   Filter array using callback that modifies itself
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4, 5];
      let callback = (num: number) => {
        if (num === 3) {
          callback = () => false;
        }
        return num % 2 === 0;
      };

      const result = arr.filter(callback);

      expect(result).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   ArrayFilterTest058
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5800
     * @tc.desc   Filter array with Symbol properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayFilterTest058();
      expect(result[0]).assertEqual(true)
      expect(result[1]).assertEqual(true)
    });

    /**
     * @tc.name   ArrayFilterTest059
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_5900
     * @tc.desc   Filter array with objects having configurable properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayFilterTest059();

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest060
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6000
     * @tc.desc   Filter array with elements that are arrays
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [[1, 2], [3], [], [4, 5, 6]];
      const result = arr.filter(item => item.length > 1);

      expect(result).assertDeepEquals([[1, 2], [4, 5, 6]]);
    });

    /**
     * @tc.name   ArrayFilterTest061
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6100
     * @tc.desc   Filter array with elements that are sets
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set1 = new Set([1, 2, 3]);
      const set2 = new Set([4]);
      const set3 = new Set([5, 6]);
      const arr = [set1, set2, set3];

      const result = arr.filter(set => set.size > 1);

      expect(result).assertDeepEquals([set1, set3]);
    });

    /**
     * @tc.name   ArrayFilterTest062
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6200
     * @tc.desc   Filter array with elements that are maps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const map1 = new Map<string, number>().set('a', 1);
      const map2 = new Map<string, number>().set('b', 2).set('c', 3);
      const map3 = new Map<string, number>();
      const arr = [map1, map2, map3];

      const result = arr.filter(map => map.size > 0);

      expect(result).assertDeepEquals([map1, map2]);
    });

    /**
     * @tc.name   ArrayFilterTest063
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6300
     * @tc.desc   Filter array using callback that returns different types of truthy values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{}
      const arr = [1, 2, 3, 4, 5];
      const callback = (idx: number) => {
        switch(idx) {
          case 0: return 1;
          case 1: return 'true';
          case 2: return {} as BaseI;
          case 3: return null;
          case 4: return undefined;
        }
        return undefined
      };

      const result = arr.filter(callback);

      expect(result).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.name   ArrayFilterTest064
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6400
     * @tc.desc   Filter array with Infinity and -Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [Infinity, 5, -Infinity, 10, Infinity];
      const result = arr.filter(num => num === Infinity);

      expect(result).assertDeepEquals([Infinity, Infinity]);
    });

    /**
     * @tc.name   ArrayFilterTest065
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6500
     * @tc.desc   Filter array with elements that are class instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      class MyClass {
        value: number
        constructor(value: number) {
          this.value = value;
        }
      }

      class OtherClass {}

      const arr = [new MyClass(5), new OtherClass(), new MyClass(10)];
      const result = arr.filter(item => item instanceof MyClass && item.value > 5);

      expect(result).assertDeepEquals([arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest066
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6600
     * @tc.desc   Filter array with elements that are regular expressions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [/abc/g, /def/, /abc/, /ghi/i];
      const result = arr.filter(re => re.source === 'abc');

      expect(result).assertDeepEquals([arr[0], arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest067
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6700
     * @tc.desc   Filter array and check for same reference in nested objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{
        value: number
      }
      interface BaseI1{
        id: number,
        nested: BaseI
      }
      const nested = { value: 5 } as BaseI;
      const arr: BaseI1[] = [
        { id: 1, nested },
        { id: 2, nested: { value: 10 } },
        { id: 3, nested }
      ];

      const result = arr.filter(item => item.nested === nested);

      expect(result).assertDeepEquals([arr[0], arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest068
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6800
     * @tc.desc   Filter array with elements added after filter starts
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3];
      let iterationCount = 0;

      const result = arr.filter(num => {
        iterationCount++;
        if (num === 2) {
          arr.push(4, 5);
        }
        return num > 2;
      });

      expect(result).assertDeepEquals([3]);
      expect(iterationCount).assertEqual(3);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5]);
    });

    /**
     * @tc.name   ArrayFilterTest069
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_6900
     * @tc.desc   Filter array with elements removed before processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4, 5];
      let iterationCount = 0;

      const result = arr.filter(num => {
        iterationCount++;
        if (num === 2) {
          arr.splice(3, 1);
        }
        return num > 2;
      });

      expect(result).assertDeepEquals([3, 5]);
      expect(iterationCount).assertEqual(4);
    });

    /**
     * @tc.name   ArrayFilterTest070
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_7000
     * @tc.desc   Filter array with element values changed during iteration
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, 2, 3, 4, 5];

      const result = arr.filter((num, idx) => {
        if (idx === 0) {
          arr[2] = 10;
        }
        return num > 3;
      });

      expect(result).assertDeepEquals([10, 4, 5]);
    });

    /**
     * @tc.name   ArrayFilterTest071
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_7100
     * @tc.desc   Filter array with empty strings and whitespace strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ["", "   ", "hello", "  world  ", "  "];
      const result = arr.filter(str => str.trim() !== "");

      expect(result).assertDeepEquals(["hello", "  world  "]);
    });

    /**
     * @tc.name   ArrayFilterTest072
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_7200
     * @tc.desc   Filter array with numbers and numeric strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = [10, "20", 30, "40", 50];
      const result = arr.filter(item => Number(item) > 25);

      expect(result).assertDeepEquals([30, "40", 50]);
    });

    /**
     * @tc.name   ArrayFilterTest073
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_7300
     * @tc.desc   Filter array of objects with nested properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface BaseI{
        age: number
      }
      interface BaseI1{
        user: BaseI
      }
      const arr: BaseI1[] = [
        { user: { age: 18 } },
        { user: { age: 25 } },
        { user: { age: 30 } },
        { user: { age: 22 } }
      ];

      const result = arr.filter(item => item.user.age >= 25);

      expect(result).assertDeepEquals([arr[1], arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest074
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_7400
     * @tc.desc   Filter array with elements that are functions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const func1 = () => 5;
      const func2 = () => 15;
      const func3 = () => 10;
      const arr = [func1, func2, func3];

      const result = arr.filter(fn => fn() > 10);

      expect(result).assertDeepEquals([func2]);
    });

    /**
     * @tc.name   ArrayFilterTest075
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_7500
     * @tc.desc   Filter array with boolean values and truthy/falsy values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface BaseI{}
      const arr = [true, false, 0, 1, "", "hello", null, undefined, {} as BaseI, []];
      const result = arr.filter(item => item);

      expect(result).assertDeepEquals([true, 1, "hello", {}, []]);
    });

    /**
     * @tc.name   ArrayFilterTest076
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_7600
     * @tc.desc   Filter array using callback that uses both index and element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [5, 2, 7, 1, 8];
      const result = arr.filter((num, idx) => num > idx * 2);

      expect(result).assertDeepEquals([5, 7]);
    });

    /**
     * @tc.name   ArrayFilterTest077
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_7700
     * @tc.desc   Filter array using thisArg that's an array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(ArrayFilterTest077()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.name   ArrayFilterTest079
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_7900
     * @tc.desc   Filter array with elements that are buffers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const buf1 = buffer.from('test1');
      const buf2 = buffer.from('longbuffer');
      const buf3 = buffer.from('test2');
      const arr = [buf1, buf2, buf3];

      const result = arr.filter(buf => buf.length > 5);

      expect(result).assertDeepEquals([buf2]);
    });

    /**
     * @tc.name   ArrayFilterTest080
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_8000
     * @tc.desc   Filter array with elements that are weak sets
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      interface BaseI{}
      const obj1 = {} as BaseI;
      const obj2 = {} as BaseI;

      const ws1 = new WeakSet();
      ws1.add(obj1);

      const ws2 = new WeakSet();

      const ws3 = new WeakSet();
      ws3.add(obj2);

      const arr = [ws1, ws2, ws3, 'not a weakset'];

      const result = arr.filter(item => item instanceof WeakSet);

      expect(result).assertDeepEquals([ws1, ws2, ws3]);
    });

    /**
     * @tc.name   ArrayFilterTest081
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_8100
     * @tc.desc   Filter array with negative indexes in sparse array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [1, , 3, , 5];
      const indexes: number[] = [];

      arr.filter((num, idx: number) => {
        indexes.push(idx);
        return true;
      });

      expect(indexes).assertDeepEquals([0, 2, 4]);
    });

    /**
     * @tc.name   ArrayFilterTest082
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_8200
     * @tc.desc   Filter array with non-consecutive indexes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr: string[] = [];
      arr[5] = 'a';
      arr[10] = 'b';
      arr[3] = 'c';
      arr.length = 15;

      const result = arr.filter(item => item === 'b' || item === 'c');

      expect(result).assertDeepEquals(['c', 'b']);
    });

    /**
     * @tc.name   ArrayFilterTest083
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_8300
     * @tc.desc   Filter array with elements that are promises (values after resolution)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const p1 = Promise.resolve(10);
      const p2 = Promise.resolve(5);
      const p3 = Promise.resolve(15);
      const arr = [p1, p2, p3];

      const resolved = await Promise.all(arr);
      const result = resolved.filter(num => num > 7);

      expect(result).assertDeepEquals([10, 15]);
    });

    /**
     * @tc.name   ArrayFilterTest084
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_8400
     * @tc.desc   Filter array with elements that are generators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayFilterTest084();

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest085
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_8500
     * @tc.desc   Filter array with elements that are iterators
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr1 = [1, 2, 3];
      const arr2 = [4];
      const arr3 = [5, 6];

      const iter1 = arr1[Symbol.iterator]();
      const iter2 = arr2[Symbol.iterator]();
      const iter3 = arr3[Symbol.iterator]();

      const arr = [iter1, iter2, iter3];

      const result = arr.filter(iterator => {
        const value = iterator.next().value as number;
        return value > 3;
      });

      expect(result).assertDeepEquals([iter2, iter3]);
    });

    /**
     * @tc.name   ArrayFilterTest089
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_8900
     * @tc.desc   Filter array with elements that are error objects with specific messages
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const err1 = new Error('Not found');
      const err2 = new Error('Permission denied');
      const err3 = new Error('Not found');
      const arr = [err1, err2, err3];

      const result = arr.filter(err => err.message === 'Not found');

      expect(result).assertDeepEquals([err1, err3]);
    });

    /**
     * @tc.name   ArrayFilterTest090
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9000
     * @tc.desc   Filter array with elements that are dates in a specific range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const start = new Date(2023, 0, 1);
      const end = new Date(2024, 0, 1);

      const date1 = new Date(2022, 11, 31);
      const date2 = new Date(2023, 6, 1);
      const date3 = new Date(2023, 11, 31);
      const date4 = new Date(2024, 0, 2);

      const arr = [date1, date2, date3, date4];
      const result = arr.filter(date => date >= start && date < end);

      expect(result).assertDeepEquals([date2, date3]);
    });

    /**
     * @tc.name   ArrayFilterTest091
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9100
     * @tc.desc   Filter array with elements that are maps containing specific keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const map1 = new Map<string, string|number>().set('id', 1).set('name', 'test1');
      const map2 = new Map<string, string>().set('name', 'test2');
      const map3 = new Map<string, number>().set('id', 3).set('value', 100);
      const arr = [map1, map2, map3];

      const result = arr.filter(map => map.has('id'));

      expect(result).assertDeepEquals([map1, map3]);
    });

    /**
     * @tc.name   ArrayFilterTest092
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9200
     * @tc.desc   Filter array with elements that are sets containing specific values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set1 = new Set([1, 2, 3]);
      const set2 = new Set([4, 5]);
      const set3 = new Set([1, 6, 7]);
      const arr = [set1, set2, set3];

      const result = arr.filter(set => set.has(1));

      expect(result).assertDeepEquals([set1, set3]);
    });

    /**
     * @tc.name   ArrayFilterTest093
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9300
     * @tc.desc   Filter array with elements that are objects with specific own properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayFilterTest093();

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest094
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9400
     * @tc.desc   Filter array with elements that are objects with specific prototype
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayFilterTest094();

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest095
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9500
     * @tc.desc   Filter array with elements that are typed arrays of specific type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const arr = [
        new Int8Array([1, 2, 3]),
        new Uint8Array([4, 5]),
        new Int8Array([6, 7, 8]),
        new Float32Array([9, 10])
      ];

      const result = arr.filter(typedArray => typedArray instanceof Int8Array);

      expect(result).assertDeepEquals([arr[0], arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest096
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9600
     * @tc.desc   Filter array with elements that are arrays with specific sum
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [
        [1, 2, 3],
        [4, 5],
        [6],
        [7, 8, 9]
      ];

      const result = arr.filter(subArr => {
        const sum = subArr.reduce((acc, val) => acc + val, 0);
        return sum > 5 && sum < 10;
      });

      expect(result).assertDeepEquals([arr[0], arr[1], arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest097
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9700
     * @tc.desc   Filter array with elements that are strings matching a regex
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = ["apple", "banana", "apricot", "cherry", "pineapple"];
      const result = arr.filter(str => /^app/.test(str));

      expect(result).assertDeepEquals(["apple"]);
    });

    /**
     * @tc.name   ArrayFilterTest098
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9800
     * @tc.desc   Filter array with elements that are numbers with specific digit count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [5, 12, 345, 67, 8901, 23];
      const result = arr.filter(num => num.toString().length === 2);

      expect(result).assertDeepEquals([12, 67, 23]);
    });

    /**
     * @tc.name   ArrayFilterTest099
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_9900
     * @tc.desc   Filter array with elements that are objects with nested arrays meeting criteria
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        id: number,
        items: number[]
      }
      const arr: BaseI[] = [
        { id: 1, items: [1, 2, 3] },
        { id: 2, items: [4] },
        { id: 3, items: [5, 6] },
        { id: 4, items: [] }
      ];

      const result = arr.filter(obj => obj.items.length > 1);

      expect(result).assertDeepEquals([arr[0], arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest100
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10000
     * @tc.desc   Filter array with elements that are functions with specific return values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const func1 = () => 10;
      const func2 = () => 20;
      const func3 = () => 5;
      const func4 = () => 30;
      const arr = [func1, func2, func3, func4];

      const result = arr.filter(fn => fn() > 15);

      expect(result).assertDeepEquals([func2, func4]);
    });

    /**
     * @tc.name   ArrayFilterTest101
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10100
     * @tc.desc   Filter array with elements that are objects with computed properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayFilterTest101();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest102
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10200
     * @tc.desc   Filter array with elements that are symbols with specific descriptions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const result = ArrayFilterTest102();

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest103
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10300
     * @tc.desc   Filter array with elements that are bigints within a range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [10n, 25n, 5n, 30n, 15n];
      const result = arr.filter(big => big > 10n && big < 30n);

      expect(result.toString()).assertEqual([25n, 15n].toString());
    });

    /**
     * @tc.name   ArrayFilterTest104
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10400
     * @tc.desc   Filter array with elements that are objects with specific method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        name: string,
        validate?: ()=>boolean
      }
      const obj1 = {
        name: 'obj1',
        validate: () => true
      } as BaseI;

      const obj2 = {
        name: 'obj2'
      } as BaseI;

      const obj3 = {
        name: 'obj3',
        validate: () => false
      } as BaseI;

      const arr = [obj1, obj2, obj3];

      const result = arr.filter(obj => typeof obj.validate === 'function');
      expect(result).assertDeepEquals([obj1, obj3]);
    });

    /**
     * @tc.name   ArrayFilterTest105
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10500
     * @tc.desc   Filter array with elements that are objects with method returning true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        name: string,
        isValid: ()=>boolean
      }
      const obj1 = {
        name: 'obj1',
        isValid: () => true
      } as BaseI;

      const obj2 = {
        name: 'obj2',
        isValid: () => false
      } as BaseI;

      const obj3 = {
        name: 'obj3',
        isValid: () => true
      } as BaseI;

      const arr = [obj1, obj2, obj3];

      const result = arr.filter(obj => obj.isValid());

      expect(result).assertDeepEquals([obj1, obj3]);
    });

    /**
     * @tc.name   ArrayFilterTest106
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10600
     * @tc.desc   Filter array with elements that are arrays containing specific element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [
        [1, 2, 3],
        [4, 5, 2],
        [6, 7, 8],
        [2, 9]
      ];

      const result = arr.filter(subArr => subArr.includes(2));

      expect(result).assertDeepEquals([arr[0], arr[1], arr[3]]);
    });

    /**
     * @tc.name   ArrayFilterTest107
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10700
     * @tc.desc   Filter array with elements that are strings with specific character count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ["a", "bb", "ccc", "dddd", "eeeee"];
      const result = arr.filter(str => str.length % 2 === 0);

      expect(result).assertDeepEquals(["bb", "dddd"]);
    });

    /**
     * @tc.name   ArrayFilterTest108
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10800
     * @tc.desc   Filter array with elements that are numbers that are primes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const isPrime = (num: number) => {
        if (num <= 1) return false;
        for (let i = 2; i < num; i++) {
          if (num % i === 0) return false;
        }
        return true;
      };

      const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result = arr.filter(isPrime);

      expect(result).assertDeepEquals([2, 3, 5, 7]);
    });

    /**
     * @tc.name   ArrayFilterTest109
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_10900
     * @tc.desc   Filter array with elements that are objects with nested objects meeting criteria
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        value?: number,
        other?: number
      }
      interface BaseI1{
        id: number,
        nested: BaseI
      }
      const arr: BaseI1[] = [
        { id: 1, nested: { value: 5 } },
        { id: 2, nested: { value: 15 } },
        { id: 3, nested: { value: 10 } },
        { id: 4, nested: { other: 20 } }
      ];

      const result = arr.filter(obj => obj.nested.value && obj.nested.value > 10);

      expect(result).assertDeepEquals([arr[1]]);
    });

    /**
     * @tc.name   ArrayFilterTest110
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11000
     * @tc.desc   Filter array with elements that are functions with specific parameter count
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const func1 = (a: number, b: number) => a + b;
      const func2 = (a: number) => a * 2;
      const func3 = () => 'hello';
      const func4 = (a: number, b: number, c: number) => a * b + c;
      const arr = [func1, func2, func3, func4];

      const result = arr.filter(fn => fn.length === 2);

      expect(result).assertDeepEquals([func1]);
    });

    /**
     * @tc.name   ArrayFilterTest111
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11100
     * @tc.desc   Filter array with elements that are objects with specific property descriptors
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayFilterTest111();

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest112
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11200
     * @tc.desc   Filter array with elements that are objects with non-enumerable properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayFilterTest112();

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest113
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11300
     * @tc.desc   Filter array with elements that are objects with symbols as properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const result = ArrayFilterTest113();

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
      expect(result[1]).assertEqual(true);
    });

    /**
     * @tc.name   ArrayFilterTest114
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11400
     * @tc.desc   Filter array with elements that are arrays with unique elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const hasUniqueElements = (arr: number[]) => new Set(arr).size === arr.length;

      const arr = [
        [1, 2, 3],
        [1, 2, 2],
        [4, 5, 6, 7],
        [8, 8, 8]
      ];

      const result = arr.filter(hasUniqueElements);

      expect(result).assertDeepEquals([arr[0], arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest115
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11500
     * @tc.desc   Filter array with elements that are objects with specific property values using thisArg
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        category: string,
        name: string
      }
      interface BaseI1{
        allowedCategories: string[]
      }
      const arr: BaseI[] = [
        { category: 'fruit', name: 'apple' },
        { category: 'vegetable', name: 'carrot' },
        { category: 'fruit', name: 'banana' },
        { category: 'meat', name: 'beef' }
      ];

      const thisArg = { allowedCategories: ['fruit', 'vegetable'] } as BaseI1;
      const result = ArrayFilterTest115(thisArg,arr) as BaseI[];

      expect(result).assertDeepEquals([arr[0], arr[1], arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest116
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11600
     * @tc.desc   Filter array with elements that are strings with specific substring
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('ArrayFilterTest116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr = ["hello", "world", "helloworld", "test", "shell"];
      const result = arr.filter(str => str.includes('hell'));

      expect(result).assertDeepEquals(["hello", "helloworld", "shell"]);
    });

    /**
     * @tc.name   ArrayFilterTest117
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11700
     * @tc.desc   Filter array with elements that are numbers that are even and greater than average
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const average = arr.reduce((sum, num) => sum + num, 0) / arr.length;

      const result = arr.filter(num => num % 2 === 0 && num > average);

      expect(result).assertDeepEquals([6, 8, 10]);
    });

    /**
     * @tc.name   ArrayFilterTest118
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11800
     * @tc.desc   Filter array with elements that are objects with dates in the past
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        id: number,
        date: Date
      }
      const now = new Date();

      const obj1 = { id: 1, date: new Date(now.getTime() - 86400000) } as BaseI;
      const obj2 = { id: 2, date: new Date(now.getTime() + 86400000) } as BaseI;
      const obj3 = { id: 3, date: new Date(now.getTime() - 604800000) } as BaseI;

      const arr = [obj1, obj2, obj3];
      const result = arr.filter(obj => obj.date < now);

      expect(result).assertDeepEquals([obj1, obj3]);
    });

    /**
     * @tc.name   ArrayFilterTest119
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_11900
     * @tc.desc   Filter array with elements that are maps with specific key-value pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const map1 = new Map<string, string | boolean>().set('type', 'user').set('active', true);
      const map2 = new Map<string, string | boolean>().set('type', 'admin').set('active', true);
      const map3 = new Map<string, string | boolean>().set('type', 'user').set('active', false);
      const map4 = new Map<string, string | boolean>().set('type', 'user').set('active', true);

      const arr = [map1, map2, map3, map4];
      const result = arr.filter(map => map.get('type') === 'user' && map.get('active'));

      expect(result).assertDeepEquals([map1, map4]);
    });

    /**
     * @tc.name   ArrayFilterTest120
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12000
     * @tc.desc   Filter array with elements that are sets with size within range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const set1 = new Set([1, 2]);
      const set2 = new Set([3]);
      const set3 = new Set([4, 5, 6]);
      const set4 = new Set([7, 8, 9, 10]);

      const arr = [set1, set2, set3, set4];
      const result = arr.filter(set => set.size > 1 && set.size < 4);

      expect(result).assertDeepEquals([set1, set3]);
    });

    /**
     * @tc.name   ArrayFilterTest121
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12100
     * @tc.desc   Filter array with elements that are arrays with all elements meeting criteria
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [
        [2, 4, 6],
        [1, 3, 5],
        [2, 3, 4],
        [6, 8, 10]
      ];

      const result = arr.filter(subArr => subArr.every(num => num % 2 === 0));

      expect(result).assertDeepEquals([arr[0], arr[3]]);
    });

    /**
     * @tc.name   ArrayFilterTest122
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12200
     * @tc.desc   Filter array with elements that are objects with any property meeting criteria
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        a: number,
        b: number
      }
      const arr: BaseI[] = [
        { a: 1, b: 3 },
        { a: 5, b: 2 },
        { a: 3, b: 4 },
        { a: 2, b: 1 }
      ];

      const result = arr.filter(obj => Object.values(obj).some((val: number) => val > 4));

      expect(result).assertDeepEquals([arr[1]]);
    });

    /**
     * @tc.name   ArrayFilterTest123
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12300
     * @tc.desc   Filter array with elements that are strings matching any of multiple regex patterns
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const patterns = [/^app/, /test$/];
      const arr = ["apple", "banana", "apricot", "test", "mytest", "application"];

      const result = arr.filter(str => patterns.some(pattern => pattern.test(str)));

      expect(result).assertDeepEquals(["apple", "test", "mytest", "application"]);
    });

    /**
     * @tc.name   ArrayFilterTest124
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12400
     * @tc.desc   Filter array with elements that are numbers that are perfect squares
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const isPerfectSquare = (num: number) => {
        const sqrt = Math.sqrt(num);
        return sqrt === Math.floor(sqrt);
      };

      const arr = [1, 2, 4, 5, 9, 10, 16, 25, 30];
      const result = arr.filter(isPerfectSquare);

      expect(result).assertDeepEquals([1, 4, 9, 16, 25]);
    });

    /**
     * @tc.name   ArrayFilterTest125
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12500
     * @tc.desc   Filter array with elements that are objects with nested arrays containing specific element
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        id: number,
        tags: string[]
      }
      const arr: BaseI[] = [
        { id: 1, tags: ['a', 'b', 'c'] },
        { id: 2, tags: ['d', 'e'] },
        { id: 3, tags: ['b', 'f', 'g'] },
        { id: 4, tags: ['h', 'i', 'b'] }
      ];

      const result = arr.filter(obj => obj.tags.includes('b'));

      expect(result).assertDeepEquals([arr[0], arr[2], arr[3]]);
    });

    /**
     * @tc.name   ArrayFilterTest126
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12600
     * @tc.desc   Filter array with elements that are functions returning promises that resolve to true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('ArrayFilterTest126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      const func1 = () => Promise.resolve(true);
      const func2 = () => Promise.resolve(false);
      const func3 = () => Promise.resolve(true);
      const func4 = () => Promise.reject(new Error('test'));

      const arr = [func1, func2, func3, func4];

      const promiseResults = await Promise.allSettled(arr.map((fn): Promise<boolean> => fn()));

      const result = arr.filter((_, index) => {
        const res = promiseResults[index];
        return res.status === 'fulfilled' && res.value === true;
      });

      expect(result).assertDeepEquals([func1, func3]);
    });

    /**
     * @tc.name   ArrayFilterTest127
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12700
     * @tc.desc   Filter array with elements that are objects with properties of specific type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        id: number,
        value: number | string | boolean
      }
      const arr: BaseI[] = [
        { id: 1, value: 10 },
        { id: 2, value: '20' },
        { id: 3, value: 30 },
        { id: 4, value: true },
        { id: 5, value: 50 }
      ];

      const result = arr.filter(obj => typeof obj.value === 'number');

      expect(result).assertDeepEquals([arr[0], arr[2], arr[4]]);
    });

    /**
     * @tc.name   ArrayFilterTest128
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12800
     * @tc.desc   Filter array with elements that are arrays with at least one element meeting criteria
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = [
        [1, 2, 3],
        [4, 5, 11],
        [6, 7, 8],
        [9, 10, 12]
      ];

      const result = arr.filter(subArr => subArr.some(num => num > 10));

      expect(result).assertDeepEquals([arr[1], arr[3]]);
    });

    /**
     * @tc.name   ArrayFilterTest129
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_12900
     * @tc.desc   Filter array with elements that are objects with computed property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      interface BaseI{
        a: number,
        b: number
      }
      const arr: BaseI[] = [
        { a: 5, b: 3 },
        { a: 2, b: 7 },
        { a: 8, b: 4 },
        { a: 1, b: 2 }
      ];

      const result = arr.filter(obj => obj.a + obj.b > 10);

      expect(result).assertDeepEquals([arr[2]]);
    });

    /**
     * @tc.name   ArrayFilterTest130
     * @tc.number SUB_BUILTINS_ARRAY_FILTER_TEST_13000
     * @tc.desc   Filter array with elements that are strings with specific case and content
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('ArrayFilterTest130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const arr = ["Apple", "BANANA", "cherry", "Date", "elderberry"];

      const result = arr.filter(str => {
        return str[0] === str[0].toUpperCase() && str.length > 5;
      });

      expect(result).assertDeepEquals(["BANANA"]);
    });

  });
}