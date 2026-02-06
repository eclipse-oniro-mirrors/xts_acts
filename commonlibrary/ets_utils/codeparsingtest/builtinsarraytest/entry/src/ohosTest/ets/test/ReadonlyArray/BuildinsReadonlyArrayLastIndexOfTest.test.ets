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
import { any, ExportObj2, exportObj2 } from '../../testability/pages/ArrayFunOpen'
import { sleep } from '../../testability/pages/Utils'

export default function builtinsReadonlyArrayLastIndexOfTest() {
  describe('BuiltinsReadonlyArrayLastIndexOfTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1001
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_0100
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsReadonlyArrayLastIndexOfTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3, 2, 4]
        expect(array.lastIndexOf(2)).assertEqual(3)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1002
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_0200
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('buildinsReadonlyArrayLastIndexOfTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3, 2, 4]
        expect(array.lastIndexOf(4)).assertEqual(4)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1003
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_0300
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3, 2, 4]
        expect(array.lastIndexOf(5)).assertEqual(-1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1004
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_0400
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3, 2, 4]
        expect(array.lastIndexOf(2, 2)).assertEqual(1)
        Done()

      })


    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1005
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_0500
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3, 2, 4]
        expect(array.lastIndexOf(2, 3)).assertEqual(3)
        Done()

      })


    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1006
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_0600
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3, 2, 4]
        expect(array.lastIndexOf(2, 4)).assertEqual(3)
        Done()

      })


    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1007
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_0700
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly (undefined | number)[] = [1, , 3]
        expect(any(array).lastIndexOf(undefined)).assertEqual(-1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1008
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_0800
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly (undefined | number)[] = [1, , 3]
        expect(array.lastIndexOf(2)).assertEqual(-1)
        Done()

      })


    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1009
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_0900
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [NaN]
        expect(array.lastIndexOf(NaN)).assertEqual(-1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1010
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1000
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [0, -0]
        expect(array.lastIndexOf(0)).assertEqual(1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1011
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1100
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly (undefined | number)[] = [undefined]
        expect(array.lastIndexOf(undefined)).assertEqual(0)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1012
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1200
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3]
        expect(array.lastIndexOf(2, -1)).assertEqual(1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1013
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1300
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3]
        expect(array.lastIndexOf(3, -1)).assertEqual(2)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1014
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1400
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3]
        expect(array.lastIndexOf(2, 5)).assertEqual(1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1015
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1500
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [1, 2, 3]
        expect(array.lastIndexOf(2, -5)).assertEqual(-1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1016
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1600
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly (undefined | number)[] = []
        expect(array.lastIndexOf(undefined)).assertEqual(-1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1017
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1700
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let obj: readonly number[] = []
        let array = [obj, [1], [2]]
        expect(array.lastIndexOf(obj)).assertEqual(0)
        expect(array.lastIndexOf([1])).assertEqual(-1)
        Done()

      })


    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1018
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1800
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly (number | null)[] = [1, null, 3, 4]
        expect(array.lastIndexOf(null)).assertEqual(1)
        Done()

      })


    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1019
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_1900
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly (number | ExportObj2)[] = [1, exportObj2, exportObj2, 3, 4]
        let result = array.lastIndexOf(exportObj2)
        expect(result).assertEqual(2)
        Done()

      })


    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1020
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_2000
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly string[] = ["apple", "banana", "cherry"]
        expect(array.lastIndexOf("banana")).assertEqual(1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1021
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_2100
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly string[] = ["apple", "", "cherry"]
        expect(array.lastIndexOf("")).assertEqual(1)
        Done()

      })

    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1022
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_2200
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [Math.floor(1.5), -0]
        expect(array.lastIndexOf(Math.floor(1.5))).assertEqual(0)
        expect(array.lastIndexOf(-0)).assertEqual(1)
        Done()

      })


    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1023
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_2300
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = []
        array.lastIndexOf(Number.EPSILON)
        array.lastIndexOf(Number.MIN_VALUE)
        array.lastIndexOf(Number.MAX_VALUE)
        array.lastIndexOf(-Infinity)
        array.lastIndexOf(Infinity)
        Done()

      })


    /**
     * @tc.name   buildinsReadonlyArrayLastIndexOfTest1024
     * @tc.number SUB_BUILDINS_READONLY_ARRAY_LAST_INDEX_OF_TEST_2400
     * @tc.desc   test Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('buildinsReadonlyArrayLastIndexOfTest1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {

        console.info('testTag', '%{public}s', 'it begin');
        let array: readonly number[] = [123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3]
        expect(array.lastIndexOf(123.456)).assertEqual(0)
        expect(array.lastIndexOf(0xcafebabe)).assertEqual(1)
        expect(array.lastIndexOf(0x0102)).assertEqual(2)
        expect(array.lastIndexOf(0x01020304)).assertEqual(3)
        expect(array.lastIndexOf(0x3)).assertEqual(4)
        Done()
      })
  })
}