/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import testNapi from 'libtestNetConnectionNdk.so'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';

export default function abilityTest() {
  describe('NetworkMangerNetConnectionTest', () => {
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
    });
    /**
     * @tc.name   test_OHNetConnGetDefaultNet401
     * @tc.number NETWORKMANAGER_CONNECTION_OHNetConnGetDefaultNet_0100
     * @tc.desc   check netConnection result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_OHNetConnGetDefaultNet401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let testNumber = -1;
      let codeNumber = testNapi.OHNetConnGetDefaultNet(testNumber);
      expect(codeNumber).assertEqual(401)
      console.log("Test testNumber 401(param error)" + codeNumber);
    })

    /**
     * @tc.name   test_OHNetConnGetDefaultNet0
     * @tc.number NETWORKMANAGER_CONNECTION_OHNetConnGetDefaultNet_0200
     * @tc.desc   check netConnection result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('test_OHNetConnGetDefaultNet0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let testNumber = 111111111;
      let codeNumber = testNapi.OHNetConnGetDefaultNet(testNumber);
      expect(codeNumber).assertEqual(0)
      console.log("Test testNumber 0(SUCCESS)" + codeNumber);
    })
  })
}
