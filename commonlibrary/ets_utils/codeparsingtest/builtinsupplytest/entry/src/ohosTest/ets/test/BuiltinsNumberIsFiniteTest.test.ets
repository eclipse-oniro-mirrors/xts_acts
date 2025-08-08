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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/Utils';


export default function BuiltinsNumberIsFiniteTest() {
  describe('BuiltinsNumberIsFiniteTest', () => {
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
     * @tc.number SUB_BUILTINS_NUMBER_ISFINITE_TEST_0100
     * @tc.name builtinsNumberIsFiniteTest0100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsFiniteTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsFiniteTest0100';
      console.log(`${caseName} test start`);
      const num = Number.isFinite(0);
      console.log(`${num}`)
      expect(true).assertEqual(num)
      console.log(`${caseName} test end`);
      Done()
    })



    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISFINITE_TEST_0200
     * @tc.name builtinsNumberIsFiniteTest0200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsFiniteTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsFiniteTest0200';
      console.log(`${caseName} test start`);
      const num1 = Number.isFinite(2e64);
      console.log(`${num1}`)
      expect(true).assertEqual(num1)
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISFINITE_TEST_0300
     * @tc.name builtinsNumberIsFiniteTest0300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsFiniteTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsFiniteTest0300';
      console.log(`${caseName} test start`);
      const num2 = Number.isFinite(Infinity);
      console.log(`${num2}`)
      expect(false).assertEqual(num2)
      console.log(`${caseName} test end`);
      Done()
    })



    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISFINITE_TEST_0400
     * @tc.name builtinsNumberIsFiniteTest0400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsFiniteTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsFiniteTest0400';
      console.log(`${caseName} test start`);
      const num3 = Number.isFinite(-Infinity);
      console.log(`${num3}`)
      expect(false).assertEqual(num3)
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISFINITE_TEST_0500
     * @tc.name builtinsNumberIsFiniteTest0500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsFiniteTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsFiniteTest0500';
      console.log(`${caseName} test start`);
      const num4 = Number.isFinite(NaN);
      console.log(`${num4}`)
      expect(false).assertEqual(num4)
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISFINITE_TEST_0600
     * @tc.name builtinsNumberIsFiniteTest0600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsFiniteTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsFiniteTest0600';
      console.log(`${caseName} test start`);
      const num5 = Number.isFinite("0");
      console.log(`${num5}`)
      expect(false).assertEqual(num5)
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISFINITE_TEST_0700
     * @tc.name builtinsNumberIsFiniteTest0700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsFiniteTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsFiniteTest0700';
      console.log(`${caseName} test start`);
      const num6 = Number.isFinite(null);
      console.log(`${num6}`)
      expect(false).assertEqual(num6)
      console.log(`${caseName} test end`);
      Done()
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISFINITE_TEST_0800
     * @tc.name builtinsNumberIsFiniteTest0800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsFiniteTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsFiniteTest0800';
      console.log(`${caseName} test start`);
      const num7 = Number.isFinite(undefined);
      console.log(`${num7}`)
      expect(false).assertEqual(num7)
      console.log(`${caseName} test end`);
      Done()
    })
  })
}