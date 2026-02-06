/*
* Copyright (C) 2025 HiHope Open Source Organization.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium"
import { isArrayArrayEqual, isArrayEqual, isObjectEqual, sleep } from "../../testability/pages/UtilAnys";


export default function builtinsReadonlyArraySliceTest() {
  describe('BuiltinsReadonlyArraySliceTest', () => {
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
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_0100
     * @tc.name BuiltinsReadonlyArraySliceTest0100
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('BuiltinsReadonlyArraySliceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const res: Array<number> = inputArray.slice(1, 3);
        console.log("res:" + JSON.stringify(res));
        expect(isArrayEqual(res, [2, 3])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_0200
     * @tc.name BuiltinsReadonlyArraySliceTest0200
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const res = inputArray.slice(2);
        console.log("res: " + res);
        expect(isArrayEqual(res, [3, 4, 5])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_0300
     * @tc.name BuiltinsReadonlyArraySliceTest0300
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const res = inputArray.slice(-3, -1);
        console.log("res: " + res);
        expect(isArrayEqual(res, [3, 4])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_0400
     * @tc.name BuiltinsReadonlyArraySliceTest0400
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly (number | undefined)[] = [1, , 3];
        const res = inputArray.slice(0, 2);
        console.log("res: " + res);
        expect(isArrayEqual(res, [1, undefined])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_0500
     * @tc.name BuiltinsReadonlyArraySliceTest0500
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3];
        const res = inputArray.slice(5, 10);
        console.log("res: " + res);
        expect(isArrayEqual(res, [])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_0600
     * @tc.name BuiltinsReadonlyArraySliceTest0600
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3];
        const res = inputArray.slice(2, 2);
        console.log("res: " + res);
        expect(isArrayEqual(res, [])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_0700
     * @tc.name BuiltinsReadonlyArraySliceTest0700
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const res = inputArray.slice(3, 1);
        console.log("res: " + res);
        expect(isArrayEqual(res, [])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_0800
     * @tc.name BuiltinsReadonlyArraySliceTest0800
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const res = inputArray.slice(undefined);
        console.log("res: " + res);
        expect(isArrayEqual(res, [1, 2, 3, 4, 5])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_0900
     * @tc.name BuiltinsReadonlyArraySliceTest0900
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const res = inputArray.slice(1, undefined);
        console.log("res: " + res);
        expect(isArrayEqual(res, [2, 3, 4, 5])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1000
     * @tc.name BuiltinsReadonlyArraySliceTest1000
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const res = inputArray.slice(NaN);
        console.log("res: " + res);
        expect(isArrayEqual(res, [1, 2, 3, 4, 5])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1100
     * @tc.name BuiltinsReadonlyArraySliceTest1100
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly string[] = ['a', 'b', 'c', 'd'];
        const res = inputArray.slice(2);
        console.log("res: " + res);
        expect(isArrayEqual(res, ['c', 'd'])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1200
     * @tc.name BuiltinsReadonlyArraySliceTest1200
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        interface obj {
          a: number
        };

        interface obj1 {
          b: number
        };

        interface obj2 {
          c: number
        };
        const inputArray: readonly (obj | number | obj1 | obj2)[] = [{
          a: 1
        }, {
          b: 2
        }, {
          c: 3
        }];
        const res = inputArray.slice(0, 2);
        console.log("res: " + res);
        expect(isObjectEqual(res, [{
          a: 1
        }, {
          b: 2
        }])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1300
     * @tc.name BuiltinsReadonlyArraySliceTest1300
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[][] = [[1, 2], [3, 4], [5, 6]];
        const res = inputArray.slice(1, 3);
        console.log("res: " + res);
        expect(isArrayArrayEqual(res, [[3, 4], [5, 6]])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1400
     * @tc.name BuiltinsReadonlyArraySliceTest1400
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(Math.floor(1.5));
        console.log("res:" + res);
        expect(isArrayEqual(res, [2, 3, 4, 5, 6])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1500
     * @tc.name BuiltinsReadonlyArraySliceTest1500
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(-0);
        console.log("res:" + res);
        expect(isArrayEqual(res, [1, 2, 3, 4, 5, 6])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1600
     * @tc.name BuiltinsReadonlyArraySliceTest1600
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(Number.EPSILON);
        console.log("res:" + res);
        expect(isArrayEqual(res, [1, 2, 3, 4, 5, 6])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1700
     * @tc.name BuiltinsReadonlyArraySliceTest1700
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(Number.MIN_VALUE);
        console.log("res:" + res);
        expect(isArrayEqual(res, [1, 2, 3, 4, 5, 6])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1800
     * @tc.name BuiltinsReadonlyArraySliceTest1800
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(Number.MAX_VALUE);
        console.log("res:" + res);
        expect(isArrayEqual(res, [])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_1900
     * @tc.name BuiltinsReadonlyArraySliceTest1900
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(-Infinity);
        console.log("res:" + res);
        expect(isArrayEqual(res, [1, 2, 3, 4, 5, 6])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_2000
     * @tc.name BuiltinsReadonlyArraySliceTest2000
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(Infinity);
        console.log("res:" + res);
        expect(isArrayEqual(res, [])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_2100
     * @tc.name BuiltinsReadonlyArraySliceTest2100
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(123.456);
        console.log("res:" + res);
        expect(isArrayEqual(res, [])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_2200
     * @tc.name BuiltinsReadonlyArraySliceTest2200
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(0xcafebabe);
        console.log("res:" + res);
        expect(isArrayEqual(res, [])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_2300
     * @tc.name BuiltinsReadonlyArraySliceTest2300
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(0x0102);
        console.log("res:" + res);
        expect(isArrayEqual(res, [])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_2400
     * @tc.name BuiltinsReadonlyArraySliceTest2400
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(0x01020304);
        console.log("res:" + res);
        expect(isArrayEqual(res, [])).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SLICE_TEST_2500
     * @tc.name BuiltinsReadonlyArraySliceTest2500
     * @tc.desc test Slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySliceTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.slice(0x3);
        console.log("res:" + res);
        expect(isArrayEqual(res, [4, 5, 6])).assertTrue();
        Done();
      });

  })
}