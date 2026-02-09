/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { sleep } from '../../testability/pages/Utils';
import { collections } from '@kit.ArkTS'

interface NumberObj {
  a: number;
}

function customStringify(arr: NumberObj[]): string {
  return '[' + arr.map(item => `{a:${item.a}}`).join(',') + ']';
}


export default function builtinsArraySortTest() {
  describe('builtinsArraySortTest', () => {
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
     * @tc.name   builtinsArraySort0100
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0100
     * @tc.desc   test ['banana', 'apple', 'cherry']sort()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArraySort0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (Done: Function) => {
      const fruits = collections.Array.from(['banana', 'apple', 'cherry']);
      fruits.sort();
      console.log(fruits.toString());
      let a = fruits.toString()
      expect('apple,banana,cherry').assertEqual(a);
      Done()
    })

    /**
     * @tc.name   builtinsArraySort0200
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0200
     * @tc.desc   test [10, 2, 30]sort()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArraySort0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers = collections.Array.from([10, 2, 30]);
      numbers.sort((a, b) => a - b);
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('2,10,30').assertEqual(a);
      Done()
    })

    /**
     * @tc.name   builtinsArraySort0300
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0300
     * @tc.desc   test []sort()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArraySort0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let numbers = collections.Array.from([])
      numbers.sort();
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('').assertEqual(a);
      Done()
    })

    /**
     * @tc.name   builtinsArraySort0400
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0400
     * @tc.desc   test [5]sort()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArraySort0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers = collections.Array.from([5]);
      numbers.sort();
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('5').assertEqual(a);
      Done()
    })

    /**
     * @tc.name   builtinsArraySort0500
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0500
     * @tc.desc   test [5]sort()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArraySort0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const mixedArray: [Record<string, never>, [], () => void] = [{}, [], () => {
      }];
      mixedArray.sort();
      console.log(mixedArray.toString());
      let a = JSON.stringify(mixedArray)
      let b = JSON.stringify([[], () => {
      }, {}])
      expect(b).assertEqual(a);
      Done()
    })
    /**
     * @tc.name   builtinsArraySort0600
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0600
     * @tc.desc   test [3,1,2]sort((a, b) => a > b ? 1 : 0);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArraySort0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers = collections.Array.from([3, 1, 2]);
      numbers.sort((a, b) => a > b ? 1 : -1);
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('1,2,3').assertEqual(a);
      Done()
    })

    /**
     * @tc.name   builtinsArraySort0700
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0700
     * @tc.desc   test [,,3,1,2]sort();
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArraySort0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers = collections.Array.from([, , 3, 1, 2]);
      numbers.sort();
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('1,2,3,,').assertEqual(a);
      Done()
    })

    /**
     * @tc.name   builtinsArraySort0800
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0800
     * @tc.desc   test [undefined, 3, undefined, 1]sort();
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArraySort0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers = collections.Array.from([undefined, 3, undefined, 1]);
      numbers.sort();
      console.log(numbers.toString());
      let a = JSON.stringify(numbers)
      let b = JSON.stringify([1, 3, undefined, undefined])
      expect(b).assertEqual(a);
      Done()
    })

    /**
     * @tc.name   builtinsArraySort0900
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0900
     * @tc.desc   test [100000, 1, 50000]sort();
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArraySort0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers = collections.Array.from([100000, 1, 50000]);
      numbers.sort((a, b) => a - b);
      console.log(numbers.toString());
      let a = JSON.stringify(numbers)
      let b = JSON.stringify([1, 50000, 100000])
      expect(b).assertEqual(a);
      Done()
    })

    /**
     * @tc.name   builtinsArraySort1000
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_1000
     * @tc.desc   test [{ a: 2 }, { a: 1 }, { a: 3 }]sort((a, b) => a.a - b.a);
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArraySort1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: NumberObj[] = [{
        a: 2
      }, {
        a: 1
      }, {
        a: 3
      }];
      numbers.sort((a, b) => a.a - b.a);
      console.log(numbers.toString());
      let a = customStringify(numbers);
      expect('[{a:1},{a:2},{a:3}]').assertEqual(a);
      Done()
    })


  })
}