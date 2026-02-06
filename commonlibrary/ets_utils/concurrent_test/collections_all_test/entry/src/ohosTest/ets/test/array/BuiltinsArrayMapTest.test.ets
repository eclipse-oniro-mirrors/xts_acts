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
import { testMap as mapTimer2 } from '../../testability/pages/ArrayFunOpen'
import { sleep } from '../../testability/pages/Utils'
import { collections } from '@kit.ArkTS'

export default function builtinsArrayMapTest() {
  describe('BuiltinsArrayMapTest', () => {
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
     * @tc.name   buildinsArrayMapTest1001
     * @tc.number SUB_BUILDINS_ARRAY_MAP_TEST_0100
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayMapTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3])
      let result = array.map(element => element * 2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(4)
      expect(result[2]).assertEqual(6)
      Done()
    })

    /**
     * @tc.name   buildinsArrayMapTest1002
     * @tc.number SUB_BUILDINS_ARRAY_MAP_TEST_0200
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayMapTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([1, 2, 3])
      let result = array.map((element, index) => element + index)
      expect(result[0]).assertEqual(1)
      expect(result[1]).assertEqual(3)
      expect(result[2]).assertEqual(5)
      Done()
    })


    /**
     * @tc.name   buildinsArrayMapTest1003
     * @tc.number SUB_BUILDINS_ARRAY_MAP_TEST_0300
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayMapTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([1,3])
      let result = array.map((value) => value * 2)
      expect(result[0]).assertEqual(2)
      expect(result[1]).assertEqual(6)
      Done()
    })


    /**
     * @tc.name   buildinsArrayMapTest1004
     * @tc.number SUB_BUILDINS_ARRAY_MAP_TEST_0400
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayMapTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = collections.Array.from([])
      let result= array.map((value) => value * 2)
      expect(result.length).assertEqual(0)
      Done()
    })


  })
}