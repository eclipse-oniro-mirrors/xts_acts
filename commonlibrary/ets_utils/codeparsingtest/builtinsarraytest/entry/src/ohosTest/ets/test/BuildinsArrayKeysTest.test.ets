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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { sleep } from '../testability/pages/Utils'

export default function builtinsArrayKeysTest() {
  describe('BuiltinsArrayKeysTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILDINS_ARRAY_KEYS_TEST_0100
     * @tc.name buildinsArrayKeysTest1001
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayKeysTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3]
      let keys = Array.from(array.keys())
      expect(keys[0]).assertEqual(0)
      expect(keys[1]).assertEqual(1)
      expect(keys[2]).assertEqual(2)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_KEYS_TEST_0200
     * @tc.name buildinsArrayKeysTest1002
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayKeysTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, , 3]
      let keys = Array.from(array.keys())
      expect(keys[0]).assertEqual(0)
      expect(keys[1]).assertEqual(1)
      expect(keys[2]).assertEqual(2)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_KEYS_TEST_0300
     * @tc.name buildinsArrayKeysTest1003
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayKeysTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = []
      let keys = Array.from(array.keys())
      expect(keys.length).assertEqual(0)
      Done()
    })
  })
}