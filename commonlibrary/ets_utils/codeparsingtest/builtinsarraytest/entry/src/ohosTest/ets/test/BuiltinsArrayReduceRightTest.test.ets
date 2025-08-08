/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { myNull } from '../testability/pages/Data'
import { sleep } from '../testability/pages/Utils';

interface person {
  name: string;
  age: number;
  like: Array<number>;
}

export default function builtinsArrayReduceRightTest() {
  describe('BuiltinsArrayReduceRightTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1001
     * @tc.name builtinsArrayReduceRightTest1001
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [1, 2, 3];
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr, 0);
      expect(6).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1002
     * @tc.name builtinsArrayReduceRightTest1002
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [1, 2, 3];
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr);
      expect(6).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1003
     * @tc.name builtinsArrayReduceRightTest1003
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: number[] = [];
      try {
        let reducedRightValue = array.reduceRight((acc, curr) => acc + curr);
      } catch (error) {
        console.info('======', error)
        expect('out of range.').assertEqual(error.message);
        Done();
      }
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1004
     * @tc.name builtinsArrayReduceRightTest1004
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: number[] = [];
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr, 0);
      expect(0).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1005
     * @tc.name builtinsArrayReduceRightTest1005
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number | undefined> = [1, , 3];
      let reducedRightValue = array.reduceRight((acc, curr) => acc! + (curr !== undefined ? curr : 0), 0);
      expect(4).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1006
     * @tc.name builtinsArrayReduceRightTest1006
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [5];
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr, 0);
      expect(5).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1007
     * @tc.name builtinsArrayReduceRightTest1007
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number | undefined> = [,];
      let reducedRightValue = array.reduceRight((acc, curr) => acc! + (curr !== undefined ? curr : 0), 0);
      expect(0).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1008
     * @tc.name builtinsArrayReduceRightTest1008
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<Array<number>> = [[1, 2], [3, 4], [5, 6]];
      let reducedRightValue = array.reduceRight((acc, current) => acc.concat(current), []);
      expect('[5,6,3,4,1,2]').assertEqual(JSON.stringify(reducedRightValue));
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1009
     * @tc.name builtinsArrayReduceRightTest1009
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<Array<number | undefined> | null> = [null, [undefined, 3]];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, '');
      expect(',3null').assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1010
     * @tc.name builtinsArrayReduceRightTest1010
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<person> = [{
        name: 'hh', age: 10, like: [1, 2, 3, 4, 5]
      }];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, '');
      expect('[object Object]').assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1011
     * @tc.name builtinsArrayReduceRightTest1011
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<string> = ['a', 'b', 'c', 'd'];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, '');
      expect('dcba').assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1012
     * @tc.name builtinsArrayReduceRightTest1012
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [Math.floor(1.5)];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, 0);
      expect(1).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1013
     * @tc.name builtinsArrayReduceRightTest1013
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, Infinity);
      expect(Infinity).assertEqual(reducedRightValue);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1014
     * @tc.name builtinsArrayReduceRightTest1014
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayReduceRightTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [123.456, 0xcafebabe, 0x0102];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, 0x01020304);
      expect(3422601023.456).assertEqual(reducedRightValue);
      Done();
    })

  })
}