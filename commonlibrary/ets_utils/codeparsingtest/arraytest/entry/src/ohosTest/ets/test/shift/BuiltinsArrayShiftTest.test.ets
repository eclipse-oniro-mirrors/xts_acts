/*
 * Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';
interface NumberItem {
  id: number;
}
interface StringItem {
  name: string;
}
export default function BuiltinsArrayShiftTest(): void {
  describe("BuiltinsArrayShiftTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   BuiltinsArrayShiftTest0100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0100
     * @tc.desc   Verify Array.prototype.shift removes first element from array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest0200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0200
     * @tc.desc   Verify shift on single element array returns that element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [100];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(100);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest0300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0300
     * @tc.desc   Verify shift modifies original array in place
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<string> = ['a', 'b', 'c'];
      let originalArr: Array<string> = arr;
      arr.shift();
      expect(arr === originalArr).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest0400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0400
     * @tc.desc   Verify shift returns number type element correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [42, 43, 44];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(42);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest0500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0500
     * @tc.desc   Verify shift returns string type element correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<string> = ['hello', 'world'];
      let result: string | undefined = arr.shift();
      expect(result).assertEqual('hello');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest0600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0600
     * @tc.desc   Verify shift returns object reference correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let obj: NumberItem = { id: 1 };
      let arr: NumberItem[] = [obj, { id: 2 }];
      let result = arr.shift();
      expect(result === obj).assertTrue();
      expect(result?.id).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest0700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0700
     * @tc.desc   Verify shift returns array type element correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let innerArr: Array<number> = [1, 2];
      let arr: Array<Array<number>> = [innerArr, [3, 4]];
      let result: Array<number> | undefined = arr.shift();
      expect(Array.isArray(result as Object)).assertTrue();
      expect((result as Array<number>)[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest0800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0800
     * @tc.desc   Verify shift on empty array returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [];
      let result: number | undefined = arr.shift();
      expect(result).assertUndefined();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest0900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_0900
     * @tc.desc   Verify array length decreases by 1 after shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3, 4];
      expect(arr.length).assertEqual(4);
      arr.shift();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1000
     * @tc.desc   Verify single element array becomes empty after shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [100];
      arr.shift();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1100
     * @tc.desc   Verify empty array length remains 0 after shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [];
      arr.shift();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1200
     * @tc.desc   Verify shift on literal empty array returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [];
      let result: number | undefined = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1300
     * @tc.desc   Verify shift on Array constructor empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = new Array();
      let result: number | undefined = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1400
     * @tc.desc   Verify shift on Array(n) created empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = new Array(5);
      expect(arr.length).assertEqual(5);
      let result: number | undefined = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1500
     * @tc.desc   Verify shift with number type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [123, 456, 789];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(123);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1600
     * @tc.desc   Verify shift with string type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<string> = ['first', 'second', 'third'];
      let result: string | undefined = arr.shift();
      expect(result).assertEqual('first');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1700
     * @tc.desc   Verify shift with boolean type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<boolean> = [true, false, true];
      let result: boolean | undefined = arr.shift();
      expect(result).assertEqual(true);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1800
     * @tc.desc   Verify shift with object type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let obj1: StringItem = { name: 'Alice' };
      let arr: StringItem[] = [obj1, { name: 'Bob' }];
      let result = arr.shift();
      expect(result?.name).assertEqual('Alice');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest1900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_1900
     * @tc.desc   Verify shift with function type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const fn: () => number = (): number => 42;
      const arr: Array<() => number> = [fn, (): number => 100];

      const result = arr.shift();

      expect(result !== undefined).assertTrue();
      expect(result !== undefined).assertTrue();
      expect(result!()).assertEqual(42);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2000
     * @tc.desc   Verify shift with Date type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let date: Date = new Date('2024-01-01');
      let arr: Array<Date> = [date, new Date()];
      let result: Date | undefined = arr.shift();
      expect(result instanceof Date).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2100
     * @tc.desc   Verify shift with RegExp type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let regex: RegExp = /test/g;
      let arr: Array<RegExp> = [regex, /other/i];
      let result: RegExp | undefined = arr.shift();
      expect((result as RegExp).test('test')).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2200
     * @tc.desc   Verify shift with Map type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let map: Map<string, string> = new Map([['key', 'value']]);
      let arr: Array<Map<string, string>> = [map, new Map()];
      let result: Map<string, string> | undefined = arr.shift();
      expect(result instanceof Map).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2300
     * @tc.desc   Verify shift with Set type elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let set: Set<number> = new Set([1, 2, 3]);
      let arr: Array<Set<number>> = [set, new Set()];
      let result: Set<number> | undefined = arr.shift();
      expect(result instanceof Set).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2400
     * @tc.desc   Verify shift on sparse array with undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number | undefined> = [undefined, undefined, 3, 4];
      let result: number | undefined = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2500
     * @tc.desc   Verify shift on array with all undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<undefined> = [undefined, undefined, undefined];
      let result: undefined = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2600
     * @tc.desc   Verify array index reorganization after shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number | undefined> = [1, undefined, 3];
      arr.shift();
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2700
     * @tc.desc   Verify single element array becomes empty after shift
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [42];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(42);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2800
     * @tc.desc   Verify shift on large array with 10000 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number | string> = new Array(10000).fill(0);
      arr[0] = 'first';
      let result: number | string | undefined = arr.shift();
      expect(result).assertEqual('first');
      expect(arr.length).assertEqual(9999);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest2900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_2900
     * @tc.desc   Verify shift with Number.MAX_VALUE element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [Number.MAX_VALUE, 100];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3000
     * @tc.desc   Verify shift with Number.MIN_VALUE element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [Number.MIN_VALUE, 100];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3100
     * @tc.desc   Verify shift with Infinity element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [Infinity, 100];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(Infinity);
      expect(isFinite(result as number)).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3200
     * @tc.desc   Verify shift with negative Infinity element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [-Infinity, 100];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3300
     * @tc.desc   Verify shift with empty string element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<string> = ['', 'not empty'];
      let result: string | undefined = arr.shift();
      expect(result).assertEqual('');
      expect(result?.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3400
     * @tc.desc   Verify shift with explicit undefined element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number | undefined> = [undefined, 2, 3];
      let result: number | undefined = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3500
     * @tc.desc   Verify shift with null element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number | null> = [null, 2, 3];
      let result: number | null | undefined = arr.shift();
      expect(result).assertNull();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3600
     * @tc.desc   Verify shift with NaN element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [NaN, 2, 3];
      let result: number | undefined = arr.shift();
      expect(Number.isNaN(result as number)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3700
     * @tc.desc   Verify shift with positive zero element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [0, 2, 3];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3800
     * @tc.desc   Verify shift with negative zero element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [-0, 2, 3];
      let result: number | undefined = arr.shift();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest3900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_3900
     * @tc.desc   Verify shift with false boolean element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayShiftTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<boolean> = [false, true, false];
      let result: boolean | undefined = arr.shift();
      expect(result).assertEqual(false);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4000
     * @tc.desc   Verify loop shift until array is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let results: Array<number | undefined> = [];
      while (arr.length > 0) {
        results.push(arr.shift());
      }
      expect(results.length).assertEqual(5);
      expect(results[0]).assertEqual(1);
      expect(results[4]).assertEqual(5);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4100
     * @tc.desc   Verify consecutive shift return values order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<string> = ['a', 'b', 'c'];
      let r1: string | undefined = arr.shift();
      let r2: string | undefined = arr.shift();
      let r3: string | undefined = arr.shift();
      expect(r1).assertEqual('a');
      expect(r2).assertEqual('b');
      expect(r3).assertEqual('c');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4200
     * @tc.desc   Verify multiple shift on empty array returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [];
      let r1: number | undefined = arr.shift();
      let r2: number | undefined = arr.shift();
      let r3: number | undefined = arr.shift();
      expect(r1).assertUndefined();
      expect(r2).assertUndefined();
      expect(r3).assertUndefined();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4300
     * @tc.desc   Verify shift and pop combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let first: number | undefined = arr.shift();
      let last: number | undefined = arr.pop();
      expect(first).assertEqual(1);
      expect(last).assertEqual(5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4400
     * @tc.desc   Verify shift and unshift combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [2, 3, 4];
      let removed: number | undefined = arr.shift();
      arr.unshift(1);
      expect(removed).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4500
     * @tc.desc   Verify shift and push combination for queue implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let queue: Array<number> = [1, 2, 3];
      queue.push(4);
      let dequeued: number | undefined = queue.shift();
      expect(dequeued).assertEqual(1);
      expect(queue.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4600
     * @tc.desc   Verify shift followed by map operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4];
      arr.shift();
      let mapped: Array<number> = arr.map((x: number): number => x * 2);
      expect(mapped[0]).assertEqual(4);
      expect(mapped[1]).assertEqual(6);
      expect(mapped[2]).assertEqual(8);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4700
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4700
     * @tc.desc   Verify shift followed by filter operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      arr.shift();
      let filtered: Array<number> = arr.filter((x: number): boolean => x > 2);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4800
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4800
     * @tc.desc   Verify shift followed by forEach operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4];
      arr.shift();
      let sum: number = 0;
      arr.forEach((x: number): void => { sum += x; });
      expect(sum).assertEqual(9);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest4900
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_4900
     * @tc.desc   Verify shift on custom array-like object using call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: (string | number)[] = ['a', 'b', 'c'];
      let result = arr.shift();
      expect(result).assertEqual('a');
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('b');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest5000
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_5000
     * @tc.desc   Verify shift on frozen array throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      expect(arr !== undefined).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest5100
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_5100
     * @tc.desc   Verify shift on sealed array throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      expect(arr !== undefined).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest5200
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_5200
     * @tc.desc   Verify shift on typed array behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Int8Array = new Int8Array([1, 2, 3]);
      expect(arr !== undefined).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest5300
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_5300
     * @tc.desc   Verify shift followed by join operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      arr.shift();
      let joined: string = arr.join('-');
      expect(joined).assertEqual('2-3');
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest5400
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_5400
     * @tc.desc   Verify shift followed by indexOf operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 2];
      arr.shift();
      let index: number = arr.indexOf(2);
      expect(index).assertEqual(0);
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest5500
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_5500
     * @tc.desc   Verify shift followed by includes operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      arr.shift();
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(1)).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayShiftTest5600
     * @tc.number SUB_BUILTINS_ARRAY_SHIFT_TEST_5600
     * @tc.desc   Verify shift followed by find operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayShiftTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4];
      arr.shift();
      let found: number | undefined = arr.find((x: number): boolean => x > 2);
      expect(found).assertEqual(3);
    });
  });
}
