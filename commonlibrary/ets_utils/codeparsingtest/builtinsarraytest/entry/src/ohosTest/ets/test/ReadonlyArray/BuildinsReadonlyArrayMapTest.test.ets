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
import { testMapReadonly } from '../../testability/pages/ArrayFunOpen'
import { sleep } from '../../testability/pages/Utils'

export default function builtinsReadonlyArrayMapTest() {
  describe('BuiltinsReadonlyArrayMapTest', () => {
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
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_MAP_TEST_0100
     * @tc.name buildinsReadonlyArrayMapTest1001
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsReadonlyArrayMapTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3]
        let result = array.map(element => element * 2)
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertEqual(4)
        expect(result[2]).assertEqual(6)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_MAP_TEST_0200
     * @tc.name buildinsReadonlyArrayMapTest1002
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsReadonlyArrayMapTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3]
        let result = array.map((element, index) => element + index)
        expect(result[0]).assertEqual(1)
        expect(result[1]).assertEqual(3)
        expect(result[2]).assertEqual(5)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_MAP_TEST_0300
     * @tc.name buildinsReadonlyArrayMapTest1003
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsReadonlyArrayMapTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly (number | undefined)[] = [1, , 3]
        let result: (number | undefined)[] = testMapReadonly(array)
        expect(result[0]).assertEqual(2)
        expect(result[1]).assertUndefined()
        expect(result[2]).assertEqual(6)
        Done()

      })


    /**
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_MAP_TEST_0400
     * @tc.name buildinsReadonlyArrayMapTest1004
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsReadonlyArrayMapTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly [] = []
        let result: [] = testMapReadonly(array)
        expect(result.length).assertEqual(0)
        Done()

      })

    /**
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_MAP_TEST_0500
     * @tc.name buildinsReadonlyArrayMapTest1005
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildinsReadonlyArrayMapTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[][] = [[], [1], [2]]
        let result = array.map(element => element.length)
        expect(result[0]).assertEqual(0)
        expect(result[1]).assertEqual(1)
        expect(result[2]).assertEqual(1)
        Done()
      })
  })
}