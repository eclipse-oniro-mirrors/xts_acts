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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Size, TestType, Level } from "@ohos/hypium";
import { sleep } from "../../testability/pages/UtilAnys";


export default function builtinsReadonlyArraySomeTest() {
  describe('BuiltinsReadonlyArraySomeTest', () => {
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
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_0100
     * @tc.name BuiltinsReadonlyArraySomeTest0100
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('BuiltinsReadonlyArraySomeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5]
        const even = (num: number) => num > 3;
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_0200
     * @tc.name BuiltinsReadonlyArraySomeTest0200
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const even = (num: number) => {
          return num > 3 && num > 2;
        };
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_0300
     * @tc.name BuiltinsReadonlyArraySomeTest0300
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const even = (num: number) => {
          const threshold = null;
          const actualThreshold = threshold !== null ? threshold : 0;
          return num > 3 && num > actualThreshold;
        };
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_0400
     * @tc.name BuiltinsReadonlyArraySomeTest0400
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: number[] = [1, 2, 3, 4, 5];
        const even = (num: number) => num === 3;
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_0500
     * @tc.name BuiltinsReadonlyArraySomeTest0500
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [];
        const even = (num: number) => num > 0;
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertFalse();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_0600
     * @tc.name BuiltinsReadonlyArraySomeTest0600
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [5];
        const even = (num: number) => num > 3;
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_0700
     * @tc.name BuiltinsReadonlyArraySomeTest0700
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [2];
        const even = (num: number) => num > 3;
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertFalse();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_0800
     * @tc.name BuiltinsReadonlyArraySomeTest0800
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly [Record<string, never>, [], () => void] = [
          {},
          [],
          () => {
          }
        ];
        const even = (element: Record<string, never> | [] | (() => void)): boolean => {
          return typeof element === 'function';
        };
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_0900
     * @tc.name BuiltinsReadonlyArraySomeTest0900
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const even = (num: number) => num > 10;
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertFalse();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_1000
     * @tc.name BuiltinsReadonlyArraySomeTest1000
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[] = [1, 2, 3, 4, 5];
        const even = (num: number) => num === 3;
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_1100
     * @tc.name BuiltinsReadonlyArraySomeTest1100
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
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
        const even = (element: obj | number | obj1 | obj2): boolean => {
          if (typeof element === 'object' && element !== null) {
            return (element as obj).a === 1;
          }
          ;
          return false;
        };
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_1200
     * @tc.name BuiltinsReadonlyArraySomeTest1200
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly number[][] = [[1, 2], [3, 4], [5, 6]];
        const even = (e: number[]) => e.includes(4);
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_1300
     * @tc.name BuiltinsReadonlyArraySomeTest1300
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly (number | undefined | null)[] = [1, null, 3, undefined, 4];
        const even = (e: number | undefined | null) => e === null;
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });


    /**
     * @tc.number SUB_BUILTINS_READONLY_ARRAY_SOME_TEST_1400
     * @tc.name BuiltinsReadonlyArraySomeTest1400
     * @tc.desc test Some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArraySomeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const inputArray: readonly string[] = ['apple', '', 'banana', 'cherry'];
        const even = (e: string) => e === '';
        const res = inputArray.some(even);
        console.log("res:" + JSON.stringify(res));
        expect(res).assertTrue();
        Done();
      });

  })
}