/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

const myNull = null;

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
      await Utils.msSleep(30);
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
     * @tc.name   builtinsArrayReduceRightTest1001
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1001
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayReduceRightTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
      let array: Array<number> = [1, 2, 3];
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr, 0.);
      expect(6).assertEqual(reducedRightValue);
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1002
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1002
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayReduceRightTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void) => {
      let array: Array<number> = [1, 2, 3];
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr);
      expect(6).assertEqual(reducedRightValue);
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1003
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1003
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: number[] = [];
      try {
        let reducedRightValue = array.reduceRight((acc, curr) => acc + curr);
      } catch (error) {
        console.info('======', error)
        expect('Reduce of empty array with no initial value').assertEqual(error.message);
        done();
      }
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1004
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1004
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: number[] = [];
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr, 0.);
      expect(0).assertEqual(reducedRightValue);
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1005
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1005
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: Array<number | undefined> = [1, undefined, 3];
      let reducedRightValue = array.reduceRight((acc, curr) => acc! + (curr !== undefined ? curr : 0), 0.);
      expect(4).assertEqual(reducedRightValue);
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1006
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1006
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: Array<number> = [5];
      let reducedRightValue = array.reduceRight((acc, curr) => acc + curr, 0.);
      expect(5).assertEqual(reducedRightValue);
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1007
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1007
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: Array<number | undefined> = [undefined,];
      let reducedRightValue = array.reduceRight((acc, curr) => acc! + (curr !== undefined ? curr : 0), 0.);
      expect(0).assertEqual(reducedRightValue);
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1008
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1008
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: Array<Array<number>> = [[1, 2], [3, 4], [5, 6]];
      let reducedRightValue = array.reduceRight(
        (acc: number[], current: number[]) => {
          return acc.concat(current);
        }, [] as number[]
      );
      expect('[5,6,3,4,1,2]').assertEqual(JSON.stringify(reducedRightValue));
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1011
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1011
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: Array<string> = ['a', 'b', 'c', 'd'];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, '');
      expect('dcba').assertEqual(reducedRightValue);
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1012
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1012
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: Array<number> = [Math.floor(1.5)];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, 0.);
      expect(1).assertEqual(reducedRightValue);
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1013
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1013
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: Array<number> = [Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, Infinity);
      expect(Infinity).assertEqual(reducedRightValue);
      done();
    })

    /**
     * @tc.name   builtinsArrayReduceRightTest1014
     * @tc.number SUB_BUILTINS_ARRAY_REDUCERIGHT_TEST_1014
     * @tc.desc   test builtins
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayReduceRightTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:() => void) => {
      let array: Array<number> = [123.456, 0x0102];
      let reducedRightValue = array.reduceRight((acc, current) => acc + current, 0x01020304.toDouble());
      expect(16909441.456).assertEqual(reducedRightValue);
      done();
    })

  })
}
