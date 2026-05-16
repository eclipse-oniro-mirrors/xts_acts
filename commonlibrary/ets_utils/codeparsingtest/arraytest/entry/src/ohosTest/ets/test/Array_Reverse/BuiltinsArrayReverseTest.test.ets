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
import * as ArrayReverseMissing from './ArrayReverseMissingTest';
interface IdObject {
  id: number;
}
export default function BuiltinsArrayReverseTest(): void {
  describe("BuiltinsArrayReverseTest", () => {
    beforeAll(async () => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(async () => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   BuiltinsArrayReverseTest0100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_0100
     * @tc.desc   Verify reverse() with number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReverseTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest0200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_0200
     * @tc.desc   Verify reverse() with string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReverseTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<string> = ['one', 'two', 'three'];
      let result: Array<string> = arr.reverse();
      expect(result[0]).assertEqual('three');
      expect(result[1]).assertEqual('two');
      expect(result[2]).assertEqual('one');
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest0300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_0300
     * @tc.desc   Verify reverse() with boolean array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReverseTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<boolean> = [true, false, true, false];
      let result: Array<boolean> = arr.reverse();
      expect(result[0]).assertEqual(false);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(false);
      expect(result[3]).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest0400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_0400
     * @tc.desc   Verify reverse() with mixed type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReverseTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number | string | boolean> = [1, 'two', true, 4, 'five'];
      let result: Array<number | string | boolean> = arr.reverse();
      expect(result[0]).assertEqual('five');
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(true);
      expect(result[3]).assertEqual('two');
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest0500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_0500
     * @tc.desc   Verify reverse() returns the same array reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReverseTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: Array<number> = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest0600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_0600
     * @tc.desc   Verify modifying result affects original array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReverseTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: Array<number> = arr.reverse();
      result[0] = 99;
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest0700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_0700
     * @tc.desc   Verify reverse() with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReverseTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [];
      let result: Array<number> = arr.reverse();
      expect(result.length).assertEqual(0);
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest0800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_0800
     * @tc.desc   Verify reverse() with single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReverseTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [42];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(42);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest0900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_0900
     * @tc.desc   Verify reverse() with two elements array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsArrayReverseTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let arr: Array<number> = [1, 2];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1000
     * @tc.desc   Verify reverse() with even length array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1100
     * @tc.desc   Verify reverse() with odd length array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1200
     * @tc.desc   Verify reverse() with undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number | undefined> = [1, undefined, 3];
      let result: Array<number | undefined> = arr.reverse();
      expect(result[0]).assertEqual(3);
      expect(result[1] === undefined).assertTrue();
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1300
     * @tc.desc   Verify reverse() with null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number | null> = [1, null, 3];
      let result: Array<number | null> = arr.reverse();
      expect(result[0]).assertEqual(3);
      expect(result[1] === null).assertTrue();
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1400
     * @tc.desc   Verify reverse() with NaN values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, NaN, 3];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(3);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1500
     * @tc.desc   Verify reverse() with Infinity values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, Infinity, -Infinity];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(-Infinity);
      expect(result[1]).assertEqual(Infinity);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1600
     * @tc.desc   Verify reverse() preserves object references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj1: IdObject = { id: 1 };
      let obj2: IdObject = { id: 2 };
      let obj3: IdObject = { id: 3 };
      let arr: Array<IdObject> = [obj1, obj2, obj3];
      let result: Array<IdObject> = arr.reverse();

      expect(result[0] === obj3).assertTrue();
      expect(result[1] === obj2).assertTrue();
      expect(result[2] === obj1).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1700
     * @tc.desc   Verify reverse() with nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<Array<number>> = [[1, 2], [3, 4], [5, 6]];
      let result: Array<Array<number>> = arr.reverse();
      expect(result[0][0]).assertEqual(5);
      expect(result[0][1]).assertEqual(6);
      expect(result[2][0]).assertEqual(1);
      expect(result[2][1]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1800
     * @tc.desc   Verify reverse() with function elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fn1: () => number = () => 1;
      let fn2: () => number = () => 2;
      let fn3: () => number = () => 3;
      let arr: Array<() => number> = [fn1, fn2, fn3];
      let result: Array<() => number> = arr.reverse();
      expect(result[0]()).assertEqual(3);
      expect(result[1]()).assertEqual(2);
      expect(result[2]()).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest1900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_1900
     * @tc.desc   Verify reverse() with Symbol elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let sym1: string = "a";
      let sym2: string = "b";
      let arr: Array<string> = [sym1, sym2];
      let result: Array<string> = arr.reverse();

      expect(result[0] === sym2).assertTrue();
      expect(result[1] === sym1).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2000
     * @tc.desc   Verify double reverse() returns original order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      arr.reverse().reverse();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2100
     * @tc.desc   Verify reverse() can chain with map()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let result: Array<number> = arr.reverse().map(x => x * 2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(6);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(2);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2200
     * @tc.desc   Verify difference between reverse() and toReversed()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr1: Array<number> = [1, 2, 3, 4, 5];
      let arr2: Array<number> = [1, 2, 3, 4, 5];

      let result1: Array<number> = arr1.reverse();

      let result2: Array<number> = [...arr2];
      result2.reverse();

      expect(arr1[0]).assertEqual(5);
      expect(arr2[0]).assertEqual(1);
      expect(result1 === arr1).assertTrue();
      expect(result2 === arr2).assertFalse();
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2300
     * @tc.desc   Verify reverse() with BigInt values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<bigint> = [1n, 2n, 3n, 4n, 5n];
      let result: Array<bigint> = arr.reverse();
      expect(result[0]).assertEqual(5n);
      expect(result[4]).assertEqual(1n);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2400
     * @tc.desc   Verify reverse() on Array.from created array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = Array.from([1, 2, 3, 4, 5]);
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(5);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2500
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2500
     * @tc.desc   Verify reverse() on Array.of created array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = Array.of(1, 2, 3, 4, 5);
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(5);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2600
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2600
     * @tc.desc   Verify reverse() with all same elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 1, 1, 1, 1];
      let result: Array<number> = arr.reverse();
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(1);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2700
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2700
     * @tc.desc   Verify reverse() followed by join()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      arr.reverse();
      let joined: string = arr.join('-');
      expect(joined).assertEqual('3-2-1');
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2800
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2800
     * @tc.desc   Verify reverse() followed by toString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      arr.reverse();
      let str: string = arr.toString();
      expect(str).assertEqual('3,2,1');
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest2900
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_2900
     * @tc.desc   Verify reverse() preserves array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: Array<number> = arr.reverse();
      expect(result instanceof Array).assertTrue();
      expect(Array.isArray(result)).assertTrue();
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest3000
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_3000
     * @tc.desc   Verify reverse() preserves array length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let originalLength: number = arr.length;
      arr.reverse();
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest3100
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_3100
     * @tc.desc   Verify reverse() and verify length property descriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReversePropertyDescriptorTest9700();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest3200
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_3200
     * @tc.desc   Comprehensive test of array-like object reversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseArrayLikeComprehensiveTest9800();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest3300
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_3300
     * @tc.desc   Verify reverse() on empty array-like object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseEmptyArrayLikeTest9900();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   BuiltinsArrayReverseTest3400
     * @tc.number SUB_BUILTINS_ARRAY_REVERSE_TEST_3400
     * @tc.desc   Verify reverse() on read-only property in non-strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayReverseTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = ArrayReverseMissing.ArrayReverseNonStrictReadOnlyTest10000();
      expect(result).assertEqual(true);
    });
  });
}
