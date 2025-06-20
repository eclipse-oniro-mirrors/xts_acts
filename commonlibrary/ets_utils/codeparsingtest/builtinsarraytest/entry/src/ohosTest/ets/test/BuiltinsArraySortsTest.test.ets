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
import { sleep } from '../testability/pages/Utils';

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
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0100
     * @tc.name taskPoolTaskGroupTask0100
     * @tc.desc test ['banana', 'apple', 'cherry']sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const fruits: Array<string> = ['banana', 'apple', 'cherry'];
      fruits.sort();
      console.log(fruits.toString());
      let a = fruits.toString()
      expect('apple,banana,cherry').assertEqual(a);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0200
     * @tc.name taskPoolTaskGroupTask0200
     * @tc.desc test [10, 2, 30]sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: Array<number> = [10, 2, 30];
      numbers.sort((a, b) => a - b);
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('2,10,30').assertEqual(a);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0300
     * @tc.name taskPoolTaskGroupTask0300
     * @tc.desc test []sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      let numbers: string[] = []
      numbers.sort();
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('').assertEqual(a);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0400
     * @tc.name taskPoolTaskGroupTask0400
     * @tc.desc test [5]sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: Array<number> = [5];
      numbers.sort();
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('5').assertEqual(a);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0500
     * @tc.name taskPoolTaskGroupTask0500
     * @tc.desc test [5]sort()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
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
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0600
     * @tc.name taskPoolTaskGroupTask0600
     * @tc.desc test [3,1,2]sort((a, b) => a > b ? 1 : 0);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: Array<number> = [3, 1, 2];
      numbers.sort((a, b) => a > b ? 1 : -1);
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('1,2,3').assertEqual(a);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0700
     * @tc.name taskPoolTaskGroupTask0700
     * @tc.desc test [,,3,1,2]sort();
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: Array<number | undefined> = [, , 3, 1, 2];
      numbers.sort();
      console.log(numbers.toString());
      let a = numbers.toString()
      expect('1,2,3,,').assertEqual(a);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0800
     * @tc.name taskPoolTaskGroupTask0800
     * @tc.desc test [undefined, 3, undefined, 1]sort();
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: Array<number | undefined> = [undefined, 3, undefined, 1];
      numbers.sort();
      console.log(numbers.toString());
      let a = JSON.stringify(numbers)
      let b = JSON.stringify([1, 3, undefined, undefined])
      expect(b).assertEqual(a);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_0900
     * @tc.name taskPoolTaskGroupTask0900
     * @tc.desc test [100000, 1, 50000]sort();
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: Array<number> = [100000, 1, 50000];
      numbers.sort((a, b) => a - b);
      console.log(numbers.toString());
      let a = JSON.stringify(numbers)
      let b = JSON.stringify([1, 50000, 100000])
      expect(b).assertEqual(a);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_1000
     * @tc.name taskPoolTaskGroupTask1000
     * @tc.desc test [{ a: 2 }, { a: 1 }, { a: 3 }]sort((a, b) => a.a - b.a);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
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

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_1100
     * @tc.name taskPoolTaskGroupTask1100
     * @tc.desc test [[3], [1], [2]]sort((a, b) => a[0] - b[0]);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: Number[][] = [[3], [1], [2]];
      numbers.sort((a, b) => (a[0] as number) - (b[0] as number))
      console.log(numbers.toString());
      let a = JSON.stringify(numbers)
      let b = JSON.stringify([[1], [2], [3]])
      expect(b).assertEqual(a);
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_SORT_TEST_1200
     * @tc.name taskPoolTaskGroupTask1200
     * @tc.desc test [[3], [1], [2]]sort((a, b) => a[0] - b[0]);
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArraySort1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (Done: Function) => {
      const numbers: Number[][] = [[3], [1], [2]];
      numbers.sort((a, b) => (a[0] as number) - (b[0] as number))
      console.log(numbers.toString());
      let a = JSON.stringify(numbers)
      let b = JSON.stringify([[1], [2], [3]])
      expect(b).assertEqual(a);
      Done()
    })
  })
}