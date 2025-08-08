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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

function expectFalse() {
  try {
    expect().assertFail();
  } catch (err) {
    console.info('assertion failure');
  }
};

export default function abilityTest() {
  describe('NetworkMangerGetAllNetTest', () => {
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

    let error_number = -1;
    let success_number = 1111;

    /**
     * @tc.number   NETWORKMANAGER_CONNECTION_OHNetConnGetAllNets_0100
     * @tc.name    test_OHNetConnGetAllNets401
     * @tc.desc    check netConnection result
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Test_OHNetConnGetAllNets_0100', 0, async (done: Function) => {
      let caseName = "Test_OHNetConnGetAllNets_0100";
      let codeNumber = testNapi.OHNetConnGetAllNets(error_number);
      if (codeNumber != 401) {
        console.log(`${caseName} failed, err: ${JSON.stringify(codeNumber)}`)
        expectFalse();
        done();
      } else {
        console.log(`${caseName} success, data: ${JSON.stringify(codeNumber)}`)
        expect(codeNumber).assertEqual(401)
        done();
      }
    })

    /**
     * @tc.number   NETWORKMANAGER_CONNECTION_OHNetConnGetAllNets_0200
     * @tc.name    test_OHNetConnGetAllNets0
     * @tc.desc    check netConnection result
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('Test_OHNetConnGetAllNets_0200', 0, async (done: Function) => {
      let caseName = "Test_OHNetConnGetAllNets_0200";
      let codeNumber = testNapi.OHNetConnGetAllNets(success_number);
      if (codeNumber != 0) {
        console.log(`${caseName} failed, err: ${JSON.stringify(codeNumber)}`)
        expectFalse();
        done();
      } else {
        console.log(`${caseName} success, data: ${JSON.stringify(codeNumber)}`)
        expect(codeNumber).assertEqual(0)
        done();
      }
    })
  })
}
