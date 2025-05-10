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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '@ohos/hypium';
import { at, atUnDefinition, checkInnerCalculate1, checkInnerCalculate2 } from '../../testability/pages/ArrayFunOpen';
import { sleep } from '../../testability/pages/Utils';


export default function builtinsArrayAtTest() {
  describe('BuiltinsArrayAtTest', () => {
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
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_0100
     * @tc.name buildinsArrayAtTest1001
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, 0)).assertEqual(1)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_0200
     * @tc.name buildinsArrayAtTest1002
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, 2)).assertEqual(3)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_0300
     * @tc.name buildinsArrayAtTest1003
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, -1)).assertEqual(5)
      Done()
    })


    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_0400
     * @tc.name buildinsArrayAtTest1004
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, -3)).assertEqual(3)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_0500
     * @tc.name buildinsArrayAtTest1005
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, 5)).assertUndefined()
      Done()
    })


    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_0600
     * @tc.name buildinsArrayAtTest1006
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, 10)).assertUndefined()
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_0700
     * @tc.name buildinsArrayAtTest1007
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, -6)).assertUndefined()
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_0800
     * @tc.name buildinsArrayAtTest1008
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, -10)).assertUndefined()
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_0900
     * @tc.name buildinsArrayAtTest1009
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = []
      expect(at(array, 0)).assertUndefined()
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_1000
     * @tc.name buildinsArrayAtTest1010
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = []
      expect(at(array, -1)).assertUndefined()
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_01100
     * @tc.name buildinsArrayAtTest1011
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, 2.5)).assertEqual(3)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_01200
     * @tc.name buildinsArrayAtTest1012
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, -2.5)).assertEqual(4)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_01300
     * @tc.name buildinsArrayAtTest1013
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, "2")).assertEqual(3)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_01400
     * @tc.name buildinsArrayAtTest1014
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 4, 5]
      expect(at(array, "-1")).assertEqual(5)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_01500
     * @tc.name buildinsArrayAtTest1015
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      try {
        atUnDefinition()
      } catch (e) {
        expect(e.name).assertContain(TypeError.name)
      }
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_01600
     * @tc.name buildinsArrayAtTest1016
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = undefined
      try {
        at(array, 0)
      } catch (e) {
        expect(e.name).assertContain(TypeError.name)
      }
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_01700
     * @tc.name buildinsArrayAtTest1017
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = []
      at(array, Number.EPSILON)
      at(array, Number.MIN_VALUE)
      at(array, Number.MAX_VALUE)
      at(array, -Infinity)
      at(array, Infinity)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_01800
     * @tc.name buildinsArrayAtTest1018
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = []
      let x = Math.PI
      checkInnerCalculate1(array, x)
      Done()
    })

    /**
     * @tc.number SUB_BUILDINS_ARRAY_AT_TEST_01900
     * @tc.name buildinsArrayAtTest1019
     * @tc.desc test Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('buildinsArrayAtTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = []
      let x = Math.PI
      checkInnerCalculate2(array, x)
      Done()
    })
  })
}