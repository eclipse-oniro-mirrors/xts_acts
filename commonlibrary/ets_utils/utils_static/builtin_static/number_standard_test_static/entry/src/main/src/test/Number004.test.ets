/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from "../../../hypium/index";
import Utils from "./Util.test";


export default function BuiltinsNumberIsNaNTest() {
  describe('BuiltinsNumberIsNaNTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
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
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0200
     * @tc.name builtinsNumberIsNaNTest0200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('builtinsNumberIsNaNTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
    //   const caseName = 'builtinsNumberIsNaNTest0200';
    //   console.log(`${caseName} test start`);
    //   const num1 = Number.isNaN(undefined);
    //   console.log(`${num1}`);
    //   expect(false).assertEqual(num1);
    //   console.log(`${caseName} test end`);
    //   Done();
    // })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISNAN_TEST_0600
     * @tc.name builtinsNumberIsNaNTest0600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('builtinsNumberIsNaNTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
    //   const caseName = 'builtinsNumberIsNaNTest0600';
    //   console.log(`${caseName} test start`);
    //   const num5 = Number.isNaN(null);
    //   console.log(`${num5}`);
    //   expect(false).assertEqual(num5);
    //   console.log(`${caseName} test end`);
    //   Done();
    // })
  })
}