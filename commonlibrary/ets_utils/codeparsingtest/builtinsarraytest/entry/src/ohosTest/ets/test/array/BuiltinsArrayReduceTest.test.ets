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
import { myNull } from '../../testability/pages/Data'
import { sleep } from '../../testability/pages/Utils';

interface person {
  name: string;
  age: number;
  like: Array<number>;
}

export default function builtinsArrayReduceTest() {
  describe('BuiltinsArrayReduceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);;
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
     * @tc.name   builtinsArrayReduceTest1001
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1001
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayReduceTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let array: Array<number> = [1, 2, 3];
      let reducedValue = array.reduce((acc, curr) => acc + curr, 0);
      expect(6).assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1002
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1002
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [1, 2, 3];
      let reducedValue = array.reduce((acc, curr) => acc + curr);
      expect(6).assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1003
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1003
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: number[] = [];
      try {
        let reducedValue = array.reduce((acc, curr) => acc + curr);
      } catch (error) {
        console.info('======', error)
        expect('TypeError').assertEqual(error.name);
        Done();
      }
    })

    /**
     * @tc.name   builtinsArrayReduceTest1004
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1004
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: number[] = [];
      let reducedValue = array.reduce((acc, curr) => acc + curr, 0);
      expect(0).assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1005
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1005
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number | undefined> = [1, , 3];
      let reducedValue = array.reduce((acc, curr) => acc! + (curr !== undefined ? curr : 0), 0);
      expect(4).assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1006
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1006
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [5];
      let reducedValue = array.reduce((acc, curr) => acc + curr, 0);
      expect(5).assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1007
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1007
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number | undefined> = [,];
      let reducedValue = array.reduce((acc, curr) => acc! + (curr !== undefined ? curr : 0), 0);
      expect(0).assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1008
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1008
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<Array<number>> = [[1, 2], [3, 4], [5, 6]];
      let reducedValue = array.reduce((acc, current) => acc.concat(current), []);
      expect('[1,2,3,4,5,6]').assertEqual(JSON.stringify(reducedValue));
      Done();
    })


    /**
     * @tc.name   builtinsArrayReduceTest1009
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1009
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<Array<number | undefined> | null> = [null, [undefined, 3]];
      let reducedValue = array.reduce((acc, current) => acc + current, '');
      expect('null,3').assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1010
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1010
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<person> = [{
        name: 'hh', age: 10, like: [1, 2, 3, 4, 5]
      }];
      let reducedValue = array.reduce((acc, current) => acc + current, '');
      expect('[object Object]').assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1011
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1011
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<string> = ['a', 'b', 'c', 'd'];
      let reducedValue = array.reduce((acc, current) => acc + current, '');
      expect('abcd').assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1012
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1012
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [Math.floor(1.5)];
      let reducedValue = array.reduce((acc, current) => acc + current, 0);
      expect(1).assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1013
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1013
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE];
      let reducedValue = array.reduce((acc, current) => acc + current, Infinity);
      expect(Infinity).assertEqual(reducedValue);
      Done();
    })

    /**
     * @tc.name   builtinsArrayReduceTest1014
     * @tc.number SUB_BUILTINS_ARRAY_REDUCE_TEST_1014
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: Array<number> = [123.456, 0xcafebabe, 0x0102];
      let reducedValue = array.reduce((acc, current) => acc + current, 0x01020304);
      expect(3422601023.456).assertEqual(reducedValue);
      Done();
    })

  })
}