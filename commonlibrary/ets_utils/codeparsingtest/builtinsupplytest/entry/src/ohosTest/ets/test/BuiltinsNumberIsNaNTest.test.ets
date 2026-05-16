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


export default function BuiltinsNumberIsNaNTest() {
  describe('BuiltinsNumberIsNaNTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
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
     * @tc.name   builtinsNumberIsNaNTest0100
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0100
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest0100';
      console.log(`${caseName} test start`);
      const num = Number.isNaN("NaN");
      console.log(`${num}`);
      expect(false).assertEqual(num);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   builtinsNumberIsNaNTest0200
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0200
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest0200';
      console.log(`${caseName} test start`);
      const num1 = Number.isNaN(undefined);
      console.log(`${num1}`);
      expect(false).assertEqual(num1);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   builtinsNumberIsNaNTest0300
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0300
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest0300';
      console.log(`${caseName} test start`);
      interface OBJ{};
      const obj:OBJ = {};
      const num2 = Number.isNaN(obj);
      console.log(`${num2}`);
      expect(false).assertEqual(num2);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   builtinsNumberIsNaNTest0400
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0400
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest0400';
      console.log(`${caseName} test start`);
      const num3 = Number.isNaN("blabla");
      console.log(`${num3}`);
      expect(false).assertEqual(num3);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   builtinsNumberIsNaNTest0500
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0500
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest0500';
      console.log(`${caseName} test start`);
      const num4 = Number.isNaN(true);
      console.log(`${num4}`);
      expect(false).assertEqual(num4);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   builtinsNumberIsNaNTest0600
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0600
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest0600';
      console.log(`${caseName} test start`);
      const num5 = Number.isNaN(null);
      console.log(`${num5}`);
      expect(false).assertEqual(num5);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   builtinsNumberIsNaNTest0700
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0700
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest0700';
      console.log(`${caseName} test start`);
      const num6 = Number.isNaN("37");
      console.log(`${num6}`);
      expect(false).assertEqual(num6);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   builtinsNumberIsNaNTest0800
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0800
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest0800';
      console.log(`${caseName} test start`);
      const num7 = Number.isNaN("37.37");
      console.log(`${num7}`);
      expect(false).assertEqual(num7);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   builtinsNumberIsNaNTest0900
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0900
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest0900';
      console.log(`${caseName} test start`);
      const num8 = Number.isNaN("");
      console.log(`${num8}`);
      expect(false).assertEqual(num8);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   builtinsNumberIsNaNTest1000
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_1000
     * @tc.desc   Testing Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsNumberIsNaNTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsNumberIsNaNTest1000';
      console.log(`${caseName} test start`);
      const num9 = Number.isNaN(" ");
      console.log(`${num9}`);
      expect(false).assertEqual(num9);
      console.log(`${caseName} test end`);
      Done();
    })
  })
}