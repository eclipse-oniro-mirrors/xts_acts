/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import brightness from '@ohos.brightness';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function BrightnessTest() {
  describe('BrightnessTest', function () {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.name   System_API_Test_brightness_Manager_0100
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.desc   Test the third-party application call setValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('System_API_Test_brightness_Manager_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async function (done) {
        let TAG = 'System_API_Test_brightness_Manager_0100';
        try {
          brightness.setValue(128);
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   System_API_Test_brightness_Manager_0200
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0050
     * @tc.desc   Test the third-party application call setValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_brightness_Manager_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_brightness_Manager_0200';
        try {
          brightness.setValue(128, true);
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })

    /**
     * @tc.name   System_API_Test_brightness_Manager_0300
     * @tc.number SUB_PowerSystem_ErrorCodeTest_JSTest_0060
     * @tc.desc   Test the third-party application call setValue will be blocked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('System_API_Test_brightness_Manager_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async function (done) {
        let TAG = 'System_API_Test_brightness_Manager_0300';
        try {
          brightness.setValue(255, false);
        } catch (error) {
          console.error(`${TAG} error: ${JSON.stringify(error)}`);
          expect(error.code).assertEqual(202);
          done();
        }
      })
  })
}
