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
import { any, exportObj2, lastIndexOf } from '../../testability/pages/ArrayFunOpen'
import { sleep } from '../../testability/pages/Utils'

export default function builtinsArrayLastIndexOfTest() {
  describe('BuiltinsArrayLastIndexOfTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   buildinsArrayLastIndexOfTest1001
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_0100
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayLastIndexOfTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let array = [1, 2, 3, 2, 4]
      expect(array.lastIndexOf(2)).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1002
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_0200
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayLastIndexOfTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let array = [1, 2, 3, 2, 4];
      expect(array.lastIndexOf(4)).assertEqual(4);
      Done();
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1003
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_0300
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsArrayLastIndexOfTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let array = [1, 2, 3, 2, 4];
      expect(array.lastIndexOf(5)).assertEqual(-1);
      Done();
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1004
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_0400
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 2, 4]
      expect(array.lastIndexOf(2, 2)).assertEqual(1)
      Done()
    })


    /**
     * @tc.name   buildinsArrayLastIndexOfTest1005
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_0500
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 2, 4]
      expect(array.lastIndexOf(2, 3)).assertEqual(3)
      Done()
    })


    /**
     * @tc.name   buildinsArrayLastIndexOfTest1006
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_0600
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3, 2, 4]
      expect(array.lastIndexOf(2, 4)).assertEqual(3)
      Done()
    })


    /**
     * @tc.name   buildinsArrayLastIndexOfTest1007
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_0700
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, , 3]
      expect(any(array).lastIndexOf(undefined)).assertEqual(-1)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1008
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_0800
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, , 3]
      expect(array.lastIndexOf(2)).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   buildinsArrayLastIndexOfTest1009
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_0900
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [NaN]
      expect(array.lastIndexOf(NaN)).assertEqual(-1)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1010
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1000
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [0, -0]
      expect(array.lastIndexOf(0)).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1011
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1100
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [undefined]
      expect(lastIndexOf(array, undefined)).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1012
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1200
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3]
      expect(array.lastIndexOf(2, -1)).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1013
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1300
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3]
      expect(array.lastIndexOf(3, -1)).assertEqual(2)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1014
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1400
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3]
      expect(array.lastIndexOf(2, 5)).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1015
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1500
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, 2, 3]
      expect(array.lastIndexOf(2, -5)).assertEqual(-1)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1016
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1600
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = []
      expect(lastIndexOf(array, undefined)).assertEqual(-1)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1017
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1700
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let obj: number[] = []
      let array = [obj, [1], [2]]
      expect(array.lastIndexOf(obj)).assertEqual(0)
      expect(array.lastIndexOf([1])).assertEqual(-1)
      Done()
    })


    /**
     * @tc.name   buildinsArrayLastIndexOfTest1018
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1800
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = [1, null, 3, 4]
      expect(array.lastIndexOf(null)).assertEqual(1)
      Done()
    })


    /**
     * @tc.name   buildinsArrayLastIndexOfTest1019
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_1900
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let result: number = lastIndexOf([1, exportObj2, exportObj2, 3, 4], exportObj2)
      expect(result).assertEqual(2)
      Done()
    })


    /**
     * @tc.name   buildinsArrayLastIndexOfTest1020
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_2000
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = ["apple", "banana", "cherry"]
      expect(array.lastIndexOf("banana")).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1021
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_2100
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array = ["apple", "", "cherry"]
      expect(array.lastIndexOf("")).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   buildinsArrayLastIndexOfTest1022
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_2200
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: number[] = [Math.floor(1.5), -0]
      expect(array.lastIndexOf(Math.floor(1.5))).assertEqual(0)
      expect(array.lastIndexOf(-0)).assertEqual(1)
      Done()
    })


    /**
     * @tc.name   buildinsArrayLastIndexOfTest1023
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_2300
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: number[] = []
      array.lastIndexOf(Number.EPSILON)
      array.lastIndexOf(Number.MIN_VALUE)
      array.lastIndexOf(Number.MAX_VALUE)
      array.lastIndexOf(-Infinity)
      array.lastIndexOf(Infinity)
      Done()
    })


    /**
     * @tc.name   buildinsArrayLastIndexOfTest1024
     * @tc.number SUB_BUILDINS_ARRAY_LAST_INDEX_OF_TEST_2400
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsArrayLastIndexOfTest1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let array: number[] = [123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3]
      expect(array.lastIndexOf(123.456)).assertEqual(0)
      expect(array.lastIndexOf(0xcafebabe)).assertEqual(1)
      expect(array.lastIndexOf(0x0102)).assertEqual(2)
      expect(array.lastIndexOf(0x01020304)).assertEqual(3)
      expect(array.lastIndexOf(0x3)).assertEqual(4)
      Done()
    })
  })
}