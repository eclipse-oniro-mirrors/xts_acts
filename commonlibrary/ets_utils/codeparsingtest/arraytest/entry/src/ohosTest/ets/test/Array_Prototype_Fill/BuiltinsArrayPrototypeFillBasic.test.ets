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
/**
 * @fileoverview Array.prototype.fill()
 * @author ArkTS Test Generator
 * @version 1.0.0
 */

interface TestObj {
  name?: string;
  x?: number;
  y?: number;
}

export default function BuiltinsArrayPrototypeFillTest(): void {
  describe('BuiltinsArrayPrototypeFillTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name     BuiltinsArrayPrototypeFillTest0100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_0100
     * @tc.desc     Verify fill with only value parameter (number)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFillTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0);

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(0);
      expect(arr).assertEqual(result);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest0200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_0200
     * @tc.desc     Verify fill with only value parameter (string)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFillTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: string[] = ["a", "b", "c", "d", "e"];
      let result: string[] = arr.fill("hello");

      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual("hello");
      expect(result[2]).assertEqual("hello");
      expect(result[3]).assertEqual("hello");
      expect(result[4]).assertEqual("hello");
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest0300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_0300
     * @tc.desc     Verify fill with only value parameter (boolean)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFillTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: boolean[] = [true, false, true, false, true];
      let result: boolean[] = arr.fill(true);

      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
      expect(result[3]).assertTrue();
      expect(result[4]).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest0400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_0400
     * @tc.desc     Verify fill with value and start parameters
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFillTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 2);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest0500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_0500
     * @tc.desc     Verify fill with start parameter as 0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFillTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(9, 0);

      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(9);
      expect(result[2]).assertEqual(9);
      expect(result[3]).assertEqual(9);
      expect(result[4]).assertEqual(9);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest0600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_0600
     * @tc.desc     Verify fill with start equal to array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFillTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(9, 5);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest0700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_0700
     * @tc.desc     Verify fill with value, start and end parameters
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFillTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 1, 4);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest0800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_0800
     * @tc.desc     Verify fill with start equal to end
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFillTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(9, 2, 2);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest0900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_0900
     * @tc.desc     Verify fill with end equal to array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL0
     */
    it('BuiltinsArrayPrototypeFillTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 2, 5);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1000
     * @tc.desc     Verify fill with start parameter as 0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 0, 3);

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1100
     * @tc.desc     Verify fill with null value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: (number | null)[] = [1, 2, 3, 4, 5];
      let result: (number | null)[] = arr.fill(null);

      expect(result[0]).assertNull();
      expect(result[1]).assertNull();
      expect(result[2]).assertNull();
      expect(result[3]).assertNull();
      expect(result[4]).assertNull();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1200
     * @tc.desc     Verify fill with undefined value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: (number | undefined)[] = [1, 2, 3, 4, 5];
      let result: (number | undefined)[] = arr.fill(undefined);

      expect(result[0]).assertEqual(undefined);
      expect(result[1]).assertEqual(undefined);
      expect(result[2]).assertEqual(undefined);
      expect(result[3]).assertEqual(undefined);
      expect(result[4]).assertEqual(undefined);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1300
     * @tc.desc     Verify fill with NaN value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(NaN);

      expect(Number.isNaN(result[0])).assertTrue();
      expect(Number.isNaN(result[1])).assertTrue();
      expect(Number.isNaN(result[2])).assertTrue();
      expect(Number.isNaN(result[3])).assertTrue();
      expect(Number.isNaN(result[4])).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1400
     * @tc.desc     Verify fill with Infinity value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(Infinity);

      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(Infinity);
      expect(result[2]).assertEqual(Infinity);
      expect(result[3]).assertEqual(Infinity);
      expect(result[4]).assertEqual(Infinity);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1500
     * @tc.desc     Verify fill with -Infinity value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(-Infinity);

      expect(result[0]).assertEqual(-Infinity);
      expect(result[1]).assertEqual(-Infinity);
      expect(result[2]).assertEqual(-Infinity);
      expect(result[3]).assertEqual(-Infinity);
      expect(result[4]).assertEqual(-Infinity);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1600
     * @tc.desc     Verify fill with empty object (shallow copy)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: TestObj[] = [{}, {}, {}];
      let obj: TestObj = {};
      let result: TestObj[] = arr.fill(obj);

      result[0].name = "test";
      expect(result[0].name).assertEqual("test");
      expect(result[1].name).assertEqual("test");
      expect(result[2].name).assertEqual("test");
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1700
     * @tc.desc     Verify fill with object properties
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: TestObj[] = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      let obj: TestObj = { x: 1, y: 2 };
      let result: TestObj[] = arr.fill(obj);

      expect(result[0].x).assertEqual(1);
      expect(result[0].y).assertEqual(2);
      expect(result[1].x).assertEqual(1);
      expect(result[1].y).assertEqual(2);
      expect(result[0] === result[1]).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1800
     * @tc.desc     Verify fill with array (shallow copy)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[][] = [[], [], []];
      let fillArr: number[] = [1, 2, 3];
      let result: number[][] = arr.fill(fillArr);

      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[0][2]).assertEqual(3);
      expect(result[0] === result[1]).assertTrue();
      expect(result[1] === result[2]).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest1900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_1900
     * @tc.desc     Verify fill with function reference
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: ((x: number) => number)[] = [() => 0, () => 0, () => 0];
      const fn = (x: number): number => x * 2;
      let result: ((x: number) => number)[] = arr.fill(fn);

      expect(result[0](5)).assertEqual(10);
      expect(result[1](5)).assertEqual(10);
      expect(result[0] === result[1]).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2000
     * @tc.desc     Verify fill with arrow function
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: (() => string)[] = [() => "", () => "", () => ""];
      let result: (() => string)[] = arr.fill(() => "hello");

      expect(result[0]()).assertEqual("hello");
      expect(result[1]()).assertEqual("hello");
      expect(result[2]()).assertEqual("hello");
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2100
     * @tc.desc     Verify fill with BigInt value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: bigint[] = [1n, 2n, 3n];
      let result: bigint[] = arr.fill(9007199254740991n);

      expect(result[0]).assertEqual(9007199254740991n);
      expect(result[1]).assertEqual(9007199254740991n);
      expect(result[2]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2200
     * @tc.desc     Verify fill with start parameter as -1
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -1);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2300
     * @tc.desc     Verify fill with start parameter as -2
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -2);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2400
     * @tc.desc     Verify fill with start parameter as -3 and array length is 3
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(9, -3);

      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(9);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2500
     * @tc.desc     Verify fill with start negative and absolute value greater than array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, -10);

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2600
     * @tc.desc     Verify fill with both start and end as negative
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -3, -1);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2700
     * @tc.desc     Verify fill with end parameter as -1
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 0, -1);

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2800
     * @tc.desc     Verify fill with end parameter as -2
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 0, -2);

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest2900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_2900
     * @tc.desc     Verify fill with end negative and absolute value greater than array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 0, -10);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest3000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3000
     * @tc.desc     Verify fill with end negative and less than start
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 2, -4);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest3100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3100
     * @tc.desc     Verify fill with start positive and end negative
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 1, -1);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest3200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3200
     * @tc.desc     Verify fill with start negative and end positive
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -3, 4);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest3300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3300
     * @tc.desc     Verify fill with both start and end negative
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -4, -2);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest3400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3400
     * @tc.desc     Verify fill with start equal to array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, 3);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest3500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3500
     * @tc.desc     Verify fill with start greater than array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, 100);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest3600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3600
     * @tc.desc     Verify fill with end equal to array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, 1, 3);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest3700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3700
     * @tc.desc     Verify fill with end greater than array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, 1, 100);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest3800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3800
     * @tc.desc     Verify fill with start parameter as 0
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 0, 3);

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest3900
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_3900
      * @tc.desc     Verify fill with start parameter as 1
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [1, 2, 3, 4, 5];
       let result: number[] = arr.fill(9, 1, 3);

       expect(result[0]).assertEqual(1);
       expect(result[1]).assertEqual(9);
       expect(result[2]).assertEqual(9);
       expect(result[3]).assertEqual(4);
       expect(result[4]).assertEqual(5);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4000
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4000
      * @tc.desc     Verify fill with start equal to array length
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [1, 2, 3];
       let result: number[] = arr.fill(0, 3);

       expect(result[0]).assertEqual(1);
       expect(result[1]).assertEqual(2);
       expect(result[2]).assertEqual(3);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4100
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4100
      * @tc.desc     Verify fill with start greater than array length
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [1, 2, 3];
       let result: number[] = arr.fill(0, 10);

       expect(result[0]).assertEqual(1);
       expect(result[1]).assertEqual(2);
       expect(result[2]).assertEqual(3);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4200
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4200
      * @tc.desc     Verify fill with end parameter as 0
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [1, 2, 3, 4, 5];
       let result: number[] = arr.fill(9, 0, 0);

       expect(result[0]).assertEqual(1);
       expect(result[1]).assertEqual(2);
       expect(result[2]).assertEqual(3);
       expect(result[3]).assertEqual(4);
       expect(result[4]).assertEqual(5);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4300
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4300
      * @tc.desc     Verify fill with end parameter as 1
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [1, 2, 3, 4, 5];
       let result: number[] = arr.fill(9, 0, 1);

       expect(result[0]).assertEqual(9);
       expect(result[1]).assertEqual(2);
       expect(result[2]).assertEqual(3);
       expect(result[3]).assertEqual(4);
       expect(result[4]).assertEqual(5);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4400
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4400
      * @tc.desc     Verify fill with end equal to array length
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [1, 2, 3, 4, 5];
       let result: number[] = arr.fill(0, 2, 5);

       expect(result[0]).assertEqual(1);
       expect(result[1]).assertEqual(2);
       expect(result[2]).assertEqual(0);
       expect(result[3]).assertEqual(0);
       expect(result[4]).assertEqual(0);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4500
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4500
      * @tc.desc     Verify fill with end greater than array length
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [1, 2, 3];
       let result: number[] = arr.fill(0, 1, 10);

       expect(result[0]).assertEqual(1);
       expect(result[1]).assertEqual(0);
       expect(result[2]).assertEqual(0);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4600
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4600
      * @tc.desc     Verify fill with end less than start
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [1, 2, 3, 4, 5];
       let result: number[] = arr.fill(9, 3, 1);

       expect(result[0]).assertEqual(1);
       expect(result[1]).assertEqual(2);
       expect(result[2]).assertEqual(3);
       expect(result[3]).assertEqual(4);
       expect(result[4]).assertEqual(5);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4700
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4700
      * @tc.desc     Verify fill on empty array with only value
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [];
       let result: number[] = arr.fill(0);

       expect(result.length).assertEqual(0);
       expect(arr.length).assertEqual(0);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4800
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4800
      * @tc.desc     Verify fill on empty array with all parameters
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: number[] = [];
       let result: number[] = arr.fill(0, 0, 5);

       expect(result.length).assertEqual(0);
     });

     /**
      * @tc.name     BuiltinsArrayPrototypeFillTest4900
      * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_4900
      * @tc.desc     Verify fill on array created with literal syntax
      * @tc.type     FUNCTION
      * @tc.size     SMALLTEST
      * @tc.level    LEVEL1
      */
     it('BuiltinsArrayPrototypeFillTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
       let arr: (number | undefined)[] = [undefined, undefined, undefined, undefined, undefined];
       let result: (number | undefined)[] = arr.fill(1);

       expect(result.length).assertEqual(5);
       expect(result[0]).assertEqual(1);
       expect(result[1]).assertEqual(1);
       expect(result[2]).assertEqual(1);
       expect(result[3]).assertEqual(1);
       expect(result[4]).assertEqual(1);
     });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5000
     * @tc.desc     Verify fill with start parameter as -1
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -1);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5100
     * @tc.desc     Verify fill with start parameter as -2
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -2);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5200
     * @tc.desc     Verify fill with start parameter as -3 and array length is 3
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(9, -3);

      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(9);
      expect(result[2]).assertEqual(9);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5300
     * @tc.desc     Verify fill with start negative and absolute value greater than array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, -10);

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5400
     * @tc.desc     Verify fill with both start and end as negative
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -3, -1);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5500
     * @tc.desc     Verify fill with end parameter as -1
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 0, -1);

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5600
     * @tc.desc     Verify fill with end parameter as -2
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 0, -2);

      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5700
     * @tc.desc     Verify fill with end negative and absolute value greater than array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 0, -10);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5800
     * @tc.desc     Verify fill with end negative and less than start
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 2, -4);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest5900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_5900
     * @tc.desc     Verify fill with start positive and end negative
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, 1, -1);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6000
     * @tc.desc     Verify fill with start negative and end positive
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -3, 4);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(0);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6100
     * @tc.desc     Verify fill with both start and end negative
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(0, -4, -2);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6200
     * @tc.desc     Verify fill with start equal to array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, 3);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6300
     * @tc.desc     Verify fill with start greater than array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, 100);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6400
     * @tc.desc     Verify fill with end equal to array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, 1, 3);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6500
     * @tc.desc     Verify fill with end greater than array length
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL2
     */
    it('BuiltinsArrayPrototypeFillTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let arr: number[] = [1, 2, 3];
      let result: number[] = arr.fill(0, 1, 100);

      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(0);
    });

      /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6600
     * @tc.desc     Verify fill with null value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: (number | null)[] = [1, 2, 3, 4, 5];
      let result: (number | null)[] = arr.fill(null);

      expect(result[0]).assertNull();
      expect(result[1]).assertNull();
      expect(result[2]).assertNull();
      expect(result[3]).assertNull();
      expect(result[4]).assertNull();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6700
     * @tc.desc     Verify fill with undefined value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: (number | undefined)[] = [1, 2, 3, 4, 5];
      let result: (number | undefined)[] = arr.fill(undefined);

      expect(result[0]).assertEqual(undefined);
      expect(result[1]).assertEqual(undefined);
      expect(result[2]).assertEqual(undefined);
      expect(result[3]).assertEqual(undefined);
      expect(result[4]).assertEqual(undefined);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6800
     * @tc.desc     Verify fill with NaN value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(NaN);

      expect(Number.isNaN(result[0])).assertTrue();
      expect(Number.isNaN(result[1])).assertTrue();
      expect(Number.isNaN(result[2])).assertTrue();
      expect(Number.isNaN(result[3])).assertTrue();
      expect(Number.isNaN(result[4])).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest6900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_6900
     * @tc.desc     Verify fill with Infinity value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(Infinity);

      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(Infinity);
      expect(result[2]).assertEqual(Infinity);
      expect(result[3]).assertEqual(Infinity);
      expect(result[4]).assertEqual(Infinity);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest7000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_7000
     * @tc.desc     Verify fill with -Infinity value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3, 4, 5];
      let result: number[] = arr.fill(-Infinity);

      expect(result[0]).assertEqual(-Infinity);
      expect(result[1]).assertEqual(-Infinity);
      expect(result[2]).assertEqual(-Infinity);
      expect(result[3]).assertEqual(-Infinity);
      expect(result[4]).assertEqual(-Infinity);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest7100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_7100
     * @tc.desc     Verify fill with empty object (shallow copy)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: TestObj[] = [{}, {}, {}];
      let obj: TestObj = {};
      let result: TestObj[] = arr.fill(obj);

      result[0].name = "test";
      expect(result[0].name).assertEqual("test");
      expect(result[1].name).assertEqual("test");
      expect(result[2].name).assertEqual("test");
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest7200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_7200
     * @tc.desc     Verify fill with object properties
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: TestObj[] = [{ x: 0, y: 0 }, { x: 0, y: 0 }, { x: 0, y: 0 }];
      let obj: TestObj = { x: 1, y: 2 };
      let result: TestObj[] = arr.fill(obj);

      expect(result[0].x).assertEqual(1);
      expect(result[0].y).assertEqual(2);
      expect(result[1].x).assertEqual(1);
      expect(result[1].y).assertEqual(2);
      expect(result[0] === result[1]).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest7300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_7300
     * @tc.desc     Verify fill with array (shallow copy)
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: number[][] = [[], [], []];
      let fillArr: number[] = [1, 2, 3];
      let result: number[][] = arr.fill(fillArr);

      expect(result[0][0]).assertEqual(1);
      expect(result[0][1]).assertEqual(2);
      expect(result[0][2]).assertEqual(3);
      expect(result[0] === result[1]).assertTrue();
      expect(result[1] === result[2]).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest7400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_7400
     * @tc.desc     Verify fill with function reference
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: ((x: number) => number)[] = [() => 0, () => 0, () => 0];
      const fn = (x: number): number => x * 2;
      let result: ((x: number) => number)[] = arr.fill(fn);

      expect(result[0](5)).assertEqual(10);
      expect(result[1](5)).assertEqual(10);
      expect(result[0] === result[1]).assertTrue();
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest7500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_7500
     * @tc.desc     Verify fill with arrow function
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: (() => string)[] = [() => "", () => "", () => ""];
      let result: (() => string)[] = arr.fill(() => "hello");

      expect(result[0]()).assertEqual("hello");
      expect(result[1]()).assertEqual("hello");
      expect(result[2]()).assertEqual("hello");
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFillTest7600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILL_TEST_7600
     * @tc.desc     Verify fill with BigInt value
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFillTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: bigint[] = [1n, 2n, 3n];
      let result: bigint[] = arr.fill(9007199254740991n);

      expect(result[0]).assertEqual(9007199254740991n);
      expect(result[1]).assertEqual(9007199254740991n);
      expect(result[2]).assertEqual(9007199254740991n);
    });

  });
}
