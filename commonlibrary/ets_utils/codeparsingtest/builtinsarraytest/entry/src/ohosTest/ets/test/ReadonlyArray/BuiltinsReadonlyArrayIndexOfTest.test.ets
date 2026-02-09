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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from "@ohos/hypium";
import { sleep } from "../../testability/pages/Utils";


export default function builtinsReadonlyArrayIndexOfTest() {
  describe('BuiltinsReadonlyArrayIndexOfTest', () => {
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
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest0100
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_0100
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsReadonlyArrayIndexOfTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3];
        const callbackFn = (ele: number) => {
          return inputArray.indexOf(ele);
        };
        const res = callbackFn(2);
        console.log("res: " + res);
        expect(res).assertEqual(1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest0200
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_0200
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsReadonlyArrayIndexOfTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3];
        const callbackFn = (ele: number) => {
          return inputArray.indexOf(ele);
        };
        const res = callbackFn(4);
        console.log("res: " + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest0300
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_0300
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('BuiltinsReadonlyArrayIndexOfTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 2, 4];
        const callbackFn = (ele1: number, ele2: number) => {
          return inputArray.indexOf(ele1, ele2);
        };
        const res = callbackFn(2, 2);
        console.log("res: " + res);
        expect(res).assertEqual(3);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest0400
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_0400
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 2, 4];
        const callbackFn = (ele1: number, ele2: number) => {
          return inputArray.indexOf(ele1, ele2);
        };
        const res = callbackFn(2, 3);
        console.log("res: " + res);
        expect(res).assertEqual(3);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest0500
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_0500
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 2, 4];
        const callbackFn = (ele1: number, ele2: number) => {
          return inputArray.indexOf(ele1, ele2);
        };
        const res = callbackFn(2, 4);
        console.log("res: " + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest0600
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_0600
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly (number | undefined)[] = [1, , 3];
        const res = inputArray.indexOf(undefined);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest0700
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_0700
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly (number | undefined)[] = [1, , 3];
        const res = inputArray.indexOf(2);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest0800
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_0800
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly (number | undefined)[] = [NaN];
        const res = inputArray.indexOf(NaN);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest0900
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_0900
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [0, -0];
        const res = inputArray.indexOf(0);
        console.log("res:" + res);
        expect(res).assertEqual(0);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1000
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1000
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly undefined[] = [undefined];
        const res = inputArray.indexOf(undefined);
        console.log("res:" + res);
        expect(res).assertEqual(0);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1100
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1100
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3];
        const res = inputArray.indexOf(2, -1);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1200
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1200
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3];
        const res = inputArray.indexOf(3, -1);
        console.log("res:" + res);
        expect(res).assertEqual(2);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1300
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1300
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3];
        const res = inputArray.indexOf(2, 5);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1400
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1400
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3];
        const res = inputArray.indexOf(2, -5);
        console.log("res:" + res);
        expect(res).assertEqual(1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1500
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1500
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly undefined[] = [];
        const res = inputArray.indexOf(undefined);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1600
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1600
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly (number[] | undefined)[] = [[], [1], [2]];
        const res = inputArray.indexOf([]);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1700
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1700
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly (number | null)[] = [1, null, 3, 4];
        const res = inputArray.indexOf(null);
        console.log("res:" + res);
        expect(res).assertEqual(1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1800
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1800
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        interface obj {
          a: number
        };
        let inputArray: readonly (number | obj)[] = [1, {
          a: 1
        }, 3, 4];
        const res = inputArray.indexOf({
          a: 1
        });
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest1900
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_1900
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly string[] = ['apple', 'banana', 'cherry'];
        const res = inputArray.indexOf('banana');
        console.log("res:" + res);
        expect(res).assertEqual(1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2000
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2000
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly string[] = ['apple', '', 'cherry'];
        const res = inputArray.indexOf('');
        console.log("res:" + res);
        expect(res).assertEqual(1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2100
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2100
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(Math.floor(1.5));
        console.log("res:" + res);
        expect(res).assertEqual(0);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2200
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2200
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(-0);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2300
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2300
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(Number.EPSILON);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2400
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2400
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(Number.MIN_VALUE);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2500
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2500
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(Number.MAX_VALUE);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2600
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2600
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(-Infinity);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2700
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2700
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(Infinity);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2800
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2800
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(123.456);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest2900
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_2900
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(0xcafebabe);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest3000
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_3000
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(0x0102);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest3100
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_3100
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(0x01020304);
        console.log("res:" + res);
        expect(res).assertEqual(-1);
        Done();
      });


    /**
     * @tc.name   BuiltinsReadonlyArrayIndexOfTest3200
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_INDEXOF_TEST_3200
     * @tc.desc   test IndexOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyArrayIndexOfTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        let inputArray: readonly number[] = [1, 2, 3, 4, 5, 6];
        const res = inputArray.indexOf(0x3);
        console.log("res:" + res);
        expect(res).assertEqual(2);
        Done();
      });

  })
}