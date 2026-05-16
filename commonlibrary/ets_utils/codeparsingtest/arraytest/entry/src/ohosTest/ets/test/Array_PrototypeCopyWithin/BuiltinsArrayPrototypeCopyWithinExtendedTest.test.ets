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
import * as CopyWithinMissing from './ArrayPrototypeCopyWithinMissingTest';

export default function BuiltinsArrayPrototypeCopyWithinExtendedTest(): void {
  describe("BuiltinsArrayPrototypeCopyWithinExtendedTest", () => {
    beforeAll(() => {
      // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async() => {
      await Utils.msSleep(10)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest0100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_0100
     * @tc.desc   Verify copyWithin() then splice() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      arr.splice(2, 1, 9);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest0200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_0200
     * @tc.desc   Verify copyWithin() then indexOf() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      expect(arr.indexOf(4)).assertEqual(0);
      expect(arr.indexOf(5)).assertEqual(1);
      expect(arr.indexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest0300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_0300
     * @tc.desc   Verify copyWithin() then includes() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      expect(arr.includes(4)).assertTrue();
      expect(arr.includes(5)).assertTrue();
      expect(arr.includes(1)).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest0400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_0400
     * @tc.desc   Verify copyWithin() then join() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      const joined: string = arr.join(',');
      expect(joined).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest0500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_0500
     * @tc.desc   Verify copyWithin() then reduce() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      const sum: number = arr.reduce((acc: number, x: number): number => acc + x, 0);
      expect(sum).assertEqual(21);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest0600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_0600
     * @tc.desc   Verify slice() then copyWithin() does not affect original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const sliced: Array<number> = arr.slice(1, 4);
      sliced.copyWithin(0, 1, 2);
      expect(sliced[0]).assertEqual(3);
      expect(sliced[1]).assertEqual(3);
      expect(sliced[2]).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest0700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_0700
     * @tc.desc   Verify concat() then copyWithin() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [4, 5];
      const result: Array<number> = arr1.concat(arr2);
      result.copyWithin(0, 3, 5);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest0800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_0800
     * @tc.desc   Verify copyWithin() then forEach() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      let sum: number = 0;
      arr.forEach((x: number): void => {
        sum = sum + x;
      });
      expect(sum).assertEqual(21);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest0900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_0900
     * @tc.desc   Verify filter() then copyWithin() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const filtered: Array<number> = arr.filter((x: number): boolean => x > 2);
      filtered.copyWithin(0, 1, 2);
      expect(filtered[0]).assertEqual(4);
      expect(filtered[1]).assertEqual(4);
      expect(filtered[2]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1000
     * @tc.desc   Verify copyWithin() then filter() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      const filtered: Array<number> = arr.filter((x: number): boolean => x > 3);
      expect(filtered.length).assertEqual(4);
      expect(filtered[0]).assertEqual(4);
      expect(filtered[1]).assertEqual(5);
      expect(filtered[2]).assertEqual(4);
      expect(filtered[3]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1100
     * @tc.desc   Verify copyWithin() with no arguments returns unchanged array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1200
     * @tc.desc   Verify copyWithin() with three parameters works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 3, 4);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1300
     * @tc.desc   Verify copyWithin() on string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      const result: Array<string> = arr.copyWithin(0, 3, 5);
      expect(result[0]).assertEqual('d');
      expect(result[1]).assertEqual('e');
      expect(result[2]).assertEqual('c');
      expect(result[3]).assertEqual('d');
      expect(result[4]).assertEqual('e');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1400
     * @tc.desc   Verify copyWithin() on Uint16Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const typedArr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      typedArr.copyWithin(0, 2, 4);
      expect(typedArr[0]).assertEqual(30);
      expect(typedArr[1]).assertEqual(40);
      expect(typedArr[2]).assertEqual(30);
      expect(typedArr[3]).assertEqual(40);
      expect(typedArr[4]).assertEqual(50);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1500
     * @tc.desc   Verify copyWithin() then map() returns new array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const mapped: Array<number> = arr.map((x: number): number => x * 2);
      mapped.copyWithin(0, 3, 5);
      expect(mapped[0]).assertEqual(8);
      expect(mapped[1]).assertEqual(10);
      expect(mapped[2]).assertEqual(6);
      expect(mapped[3]).assertEqual(8);
      expect(mapped[4]).assertEqual(10);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1600
     * @tc.desc   Verify copyWithin() copies undefined values in sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, 3];
      const result: Array<number | undefined> = arr.copyWithin(2, 1, 2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(undefined);
      expect(result[2]).assertEqual(undefined);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1700
     * @tc.desc   Verify copyWithin() copies values to positions that with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, 3, 4, 5];
      const result: Array<number | undefined> = arr.copyWithin(1, 3, 5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1800
     * @tc.desc   Verify copyWithin() copies source region containing undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number | undefined> = [1, undefined, 3, 4, 5];
      const result: Array<number | undefined> = arr.copyWithin(0, 1, 3);
      expect(result[0]).assertEqual(undefined);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest1900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_1900
     * @tc.desc   Verify copyWithin() preserves object reference identity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: Array<number> = [100];
      const arr: Array<Array<number>> = [obj, [200], [300], [400], [500]];
      const result: Array<Array<number>> = arr.copyWithin(1, 0, 1);
      expect(result[0] === obj).assertTrue();
      expect(result[1] === obj).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2000
     * @tc.desc   Verify copyWithin() preserves nested array reference identity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inner: Array<number> = [1, 2];
      const arr: Array<Array<number>> = [inner, [3], [4], [5], [6]];
      const result: Array<Array<number>> = arr.copyWithin(1, 0, 1);
      expect(result[0] === inner).assertTrue();
      expect(result[1] === inner).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2100
     * @tc.desc   Verify copyWithin() modifies array in place with before/after comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const before: Array<number> = arr.slice();
      arr.copyWithin(0, 3, 4);
      expect(before[0]).assertEqual(1);
      expect(before[1]).assertEqual(2);
      expect(before[3]).assertEqual(4);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2200
     * @tc.desc   Verify copyWithin() shallow copy: modifying original object affects array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: Array<number> = [1];
      const arr: Array<Array<number>> = [obj, [2], [3]];
      arr.copyWithin(1, 0, 1);
      obj[0] = 2;
      const copiedElement: Array<number> = arr[1];
      expect(copiedElement[0]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2300
     * @tc.desc   Verify copyWithin() shallow copy:modifying nested array affects array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const inner: Array<number> = [1, 2];
      const arr: Array<Array<number>> = [inner, [3], [4]];
      arr.copyWithin(1, 0, 1);
      inner.push(3);
      const copiedElement: Array<number> = arr[1];
      expect(copiedElement.length).assertEqual(3);
      expect(copiedElement[2]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2400
     * @tc.desc   Verify copyWithin() creates or modifies index properties correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 4);
      expect(arr[0]).assertEqual(4);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2500
     * @tc.desc   Verify copyWithin() with 0 target keeps array unchanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2600
     * @tc.desc   Verify copyWithin() with large target does nothing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(2147483647, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2700
     * @tc.desc   Verify copyWithin() with negative target converts to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(-2147483648, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2800
     * @tc.desc   Verify copyWithin() with Number.MAX_SAFE_INTEGER target does nothing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(2147483647, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest2900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_2900
     * @tc.desc   Verify copyWithin() then toString() interaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      const str: string = arr.toString();
      expect(str).assertEqual('4,5,3,4,5');
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3000
     * @tc.desc   Verify copyWithin() does not affect elements outside copy range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5, 6, 7, 8];
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
      expect(arr[5]).assertEqual(6);
      expect(arr[6]).assertEqual(7);
      expect(arr[7]).assertEqual(8);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3100
     * @tc.desc   Verify copyWithin() with 0 start copies from beginning
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(2, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3200
     * @tc.desc   Verify copyWithin() with 0 end does not copy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const arr: Array<number> = [1, 2, 3, 4, 5];
      const result: Array<number> = arr.copyWithin(0, 2, 0);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3300
     * @tc.desc   Verify copyWithin on array-like object with positive indices
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinArrayLikeTest0100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3400
     * @tc.desc   Verify copyWithin on array-like object with source after target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinArrayLikeTest0200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3500
     * @tc.desc   Verify copyWithin on array-like object preserving extra properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinArrayLikeTest0300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3600
     * @tc.desc   Verify copyWithin with string target parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest0400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3700
     * @tc.desc   Verify copyWithin with non-numeric string target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest0500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3800
     * @tc.desc   Verify copyWithin with string start parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest0600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest3900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_3900
     * @tc.desc   Verify copyWithin with NaN target parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest0700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4000
     * @tc.desc   Verify copyWithin with Infinity target parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest0800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4100
     * @tc.desc   Verify copyWithin with -Infinity target parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest0900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4200
     * @tc.desc   Verify copyWithin with boolean true target parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest1000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4300
     * @tc.desc   Verify copyWithin with boolean false target parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest1100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4400
     * @tc.desc   Verify copyWithin with null target parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest1200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4500
     * @tc.desc   Verify copyWithin with object target parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTypeConvTest1300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4600
     * @tc.desc   Verify copyWithin with no arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinArgsTest1400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4700
     * @tc.desc   Verify copyWithin with extra arguments beyond three
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinArgsTest1500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4800
     * @tc.desc   Verify copyWithin with null this context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinErrorTest1600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest4900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_4900
     * @tc.desc   Verify copyWithin with undefined this context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinErrorTest1700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5000
     * @tc.desc   Verify copyWithin on frozen array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinFrozenTest1800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5100
     * @tc.desc   Verify copyWithin on sealed array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinSealedTest1900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5200
     * @tc.desc   Verify copyWithin on object with readonly property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinReadonlyTest2000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5300
     * @tc.desc   Verify copyWithin on object without length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinNoLengthTest2100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5400
     * @tc.desc   Verify copyWithin on object with non-numeric length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinNoLengthTest2200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5500
     * @tc.desc   Verify copyWithin method length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinPropertyTest2300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5600
     * @tc.desc   Verify copyWithin method name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinPropertyTest2400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5700
     * @tc.desc   Verify copyWithin on arguments object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinArgumentsTest2500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5800
     * @tc.desc   Verify copyWithin on sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinSparseTest2600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest5900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_5900
     * @tc.desc   Verify copyWithin with target at last index
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinTargetTest2700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6000
     * @tc.desc   Verify copyWithin with object reference element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinObjRefTest2800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6100
     * @tc.desc   Verify copyWithin with nested array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinObjRefTest2900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6200
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6200
     * @tc.desc   Verify copyWithin with undefined start parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinDefaultTest3000();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6300
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6300
     * @tc.desc   Verify copyWithin with undefined end parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinDefaultTest3100();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6400
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6400
     * @tc.desc   Verify copyWithin with negative start parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinMixedTest3200();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6500
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6500
     * @tc.desc   Verify copyWithin with all negative parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinMixedTest3300();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6600
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6600
     * @tc.desc   Verify copyWithin with target exceeding negative bounds
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinNegBoundTest3400();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6700
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6700
     * @tc.desc   Verify copyWithin with target beyond array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinExtendTest3500();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6800
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6800
     * @tc.desc   Verify copyWithin on Proxy object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinProxyTest3600();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest6900
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_6900
     * @tc.desc   Verify copyWithin with null element value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinSpecialValTest3700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest7000
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_7000
     * @tc.desc   Verify copyWithin with undefined element value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinSpecialValTest3800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayPrototypeCopyWithinExtendedTest7100
     * @tc.number SUB_BUILTINS_ARRAY_PROTOTYPE_COPY_WITHIN_EXTENDED_TEST_7100
     * @tc.desc   Verify copyWithin with NaN element value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayPrototypeCopyWithinExtendedTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = CopyWithinMissing.CopyWithinSpecialValTest3900();
      expect(result).assertEqual(true);
    });
  });
}
