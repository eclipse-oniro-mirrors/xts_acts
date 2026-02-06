/*
* Copyright (C) 2025-2026 HiHope Open Source Organization.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function Array_Sort_Stable_Test_static() {
  describe('Array_Sort_Stable_Test_static', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number ARRAY_SORT_STABLE_TEST_0100
     * @tc.name Array_Sort_Stable_Test_static_0100
     * @tc.desc test sort_stable<T>(arr: FixedArray<T>, startIndex: int, endIndex: int, comp: ((lhs: T, rhs: T)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Stable_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Stable_Test_static_0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<number> = [];
        sort_stable(arr, 0, 0, (a: number, b: number): int => (a - b).toInt());
        expect(arr.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_STABLE_TEST_0200
     * @tc.name Array_Sort_Stable_Test_static_0200
     * @tc.desc test sort_stable<T>(arr: FixedArray<T>, startIndex: int, endIndex: int, comp: ((lhs: T, rhs: T)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Stable_Test_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Stable_Test_static_0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [42];
        sort_stable(arr, 0, 0, (a: int, b: int): int => (a - b).toInt());
        const expected: FixedArray<int> = [42];
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(expected[0]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_STABLE_TEST_0300
     * @tc.name Array_Sort_Stable_Test_static_0300
     * @tc.desc test sort_stable<T>(arr: FixedArray<T>, startIndex: int, endIndex: int, comp: ((lhs: T, rhs: T)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Stable_Test_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Stable_Test_static_0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<string> = ['apple', 'orange', 'banana', 'pear'];
        sort_stable(arr, 0, 4, (a: string, b: string): int => a.localeCompare(b).toInt());
        const expected: FixedArray<string> = ['apple', 'banana', 'orange', 'pear'];
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number ARRAY_SORT_STABLE_TEST_0400
     * @tc.name Array_Sort_Stable_Test_static_0400
     * @tc.desc test sort_stable<T>(arr: FixedArray<T>, startIndex: int, endIndex: int, comp: ((lhs: T, rhs: T)=> number)) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('Array_Sort_Stable_Test_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void):Promise<void> => {
        const caseName = 'Array_Sort_Stable_Test_static_0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<string> = ['happiness', 'hi', 'hope', 'hello', 'house'];
        sort_stable(arr, 1, 4, (a: string, b: string): int => a.localeCompare(b).toInt());
        const expected: FixedArray<string> = ['happiness', 'hello', 'hi', 'hope', 'house'];
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(expected[0]);
        expect(arr[1]).assertEqual(expected[1]);
        expect(arr[2]).assertEqual(expected[2]);
        expect(arr[3]).assertEqual(expected[3]);
        expect(arr[4]).assertEqual(expected[4]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}