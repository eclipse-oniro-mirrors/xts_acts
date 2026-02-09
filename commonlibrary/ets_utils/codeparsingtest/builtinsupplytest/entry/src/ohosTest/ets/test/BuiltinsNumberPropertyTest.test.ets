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


export default function BuiltinsNumberPropertyTest() {
  describe('BuiltinsNumberPropertyTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   builtinsNumberPropertyTest0100
     * @tc.number SUB_BUILTINS_NUMBER_PROPERTY_TEST_0100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPropertyTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberPropertyTest0100';
      console.log(`${caseName} test start`);
      const num1 = Number.EPSILON;
      console.log(`${num1}`);
      expect(2.220446049250313e-16).assertEqual(num1);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   builtinsNumberPropertyTest0200
     * @tc.number SUB_BUILTINS_NUMBER_PROPERTY_TEST_0200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPropertyTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberPropertyTest0200';
      console.log(`${caseName} test start`);
      const num2 = Number.MAX_SAFE_INTEGER;
      console.log(`${num2}`);
      expect(9007199254740991).assertEqual(num2);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   builtinsNumberPropertyTest0300
     * @tc.number SUB_BUILTINS_NUMBER_PROPERTY_TEST_0300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPropertyTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberPropertyTest0300';
      console.log(`${caseName} test start`);
      const num3 = Number.MAX_VALUE;
      console.log(`${num3}`);
      expect(1.7976931348623157e+308).assertEqual(num3);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   builtinsNumberPropertyTest0400
     * @tc.number SUB_BUILTINS_NUMBER_PROPERTY_TEST_0400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPropertyTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberPropertyTest0400';
      console.log(`${caseName} test start`);
      const num4 = Number.MIN_SAFE_INTEGER;
      console.log(`${num4}`);
      expect(-9007199254740991).assertEqual(num4);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsNumberPropertyTest0500
     * @tc.number SUB_BUILTINS_NUMBER_PROPERTY_TEST_0500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPropertyTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberPropertyTest0500';
      console.log(`${caseName} test start`);
      const num5 = Number.MIN_VALUE;
      console.log(`${num5}`);
      expect(5e-324).assertEqual(num5);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   builtinsNumberPropertyTest0600
     * @tc.number SUB_BUILTINS_NUMBER_PROPERTY_TEST_0600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPropertyTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberPropertyTest0600';
      console.log(`${caseName} test start`);
      const num6 = Number.NaN;
      console.log(`${num6}`);
      expect(JSON.stringify(NaN)).assertEqual(JSON.stringify(num6));
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsNumberPropertyTest0700
     * @tc.number SUB_BUILTINS_NUMBER_PROPERTY_TEST_0700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPropertyTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberPropertyTest0700';
      console.log(`${caseName} test start`);
      const num7 = Number.NEGATIVE_INFINITY;
      console.log(`${num7}`);
      expect(-Infinity).assertEqual(num7);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsNumberPropertyTest0800
     * @tc.number SUB_BUILTINS_NUMBER_PROPERTY_TEST_0800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberPropertyTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberPropertyTest0800';
      console.log(`${caseName} test start`);
      const num8 = Number.POSITIVE_INFINITY;
      console.log(`${num8}`);
      expect(Infinity).assertEqual(num8);
      console.log(`${caseName} test end`);
      Done();
    })
  })
}