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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from '@ohos/hypium';
import DefTupleType from '../export_tuple/DefTypeExport';
import { sleep } from '../utils/Utils';


export default function exportTupleTest() {
  describe('ExportTupleTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(200)
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
     * @tc.name   exportTupleTest1001
     * @tc.number SUB_EXPORT_TUPLE_TEST_0100
     * @tc.desc   test EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('exportTupleTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let tupleObj: DefTupleType = ["def_export_type1", 1]

      expect(tupleObj[0]).assertEqual("def_export_type1")

      expect(tupleObj[1]).assertEqual(1)

      Done()

    })

    /**
     * @tc.name   exportTupleTest1002
     * @tc.number SUB_EXPORT_TUPLE_TEST_0200
     * @tc.desc   test EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportTupleTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let defObj: DefTupleType = (await import('../export_tuple/DefObjExport1')).default

      expect(defObj[0]).assertEqual("def_export_type1")

      expect(defObj[1]).assertEqual(1)

      Done()

    })

    /**
     * @tc.name   exportTupleTest1003
     * @tc.number SUB_EXPORT_TUPLE_TEST_0300
     * @tc.desc   test EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportTupleTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let defObj: DefTupleType = (await import('../export_tuple/DefObjExport2')).default

      expect(defObj[0]).assertEqual("def_export_type2")

      expect(defObj[1]).assertEqual(2)

      Done()

    })

    /**
     * @tc.name   exportTupleTest1004
     * @tc.number SUB_EXPORT_TUPLE_TEST_0400
     * @tc.desc   test EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportTupleTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      type ITupleType1 = import('../export_tuple/TypeExport').TupleType1
      type ITupleType2 = import('../export_tuple/TypeExport').TupleType2

      let tupleObj: ITupleType1 = ["def_export_type1", "def_export_type1"]
      let tupleObj2: ITupleType2 = [1, 1]

      expect(tupleObj[0]).assertEqual("def_export_type1")
      expect(tupleObj[1]).assertEqual("def_export_type1")

      expect(tupleObj2[0]).assertEqual(1)
      expect(tupleObj2[1]).assertEqual(1)

      Done()
    })


    /**
     * @tc.name   exportTupleTest1005
     * @tc.number SUB_EXPORT_TUPLE_TEST_0500
     * @tc.desc   test EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportTupleTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let tupleObj3 = (await import('../export_tuple/ObjExport1')).tupleObj3
      let tupleObj4 = (await import('../export_tuple/ObjExport1')).tupleObj4
      let tupleObj5 = (await import('../export_tuple/ObjExport1')).tupleObj5

      expect(tupleObj3[0]).assertEqual("export_type3")
      expect(tupleObj3[1]).assertEqual(3)

      expect(tupleObj4[0]).assertEqual("export_type4")
      expect(tupleObj4[1]).assertEqual(4)

      expect(tupleObj5[0]).assertEqual("export_type5")
      expect(tupleObj5[1]).assertEqual(5)

      Done()
    })

    /**
     * @tc.name   exportTupleTest1006
     * @tc.number SUB_EXPORT_TUPLE_TEST_0600
     * @tc.desc   test EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportTupleTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let tupleObj6 = (await import('../export_tuple/ObjExport2')).tupleObj6

      expect(tupleObj6[0]).assertEqual("export_type6")
      expect(tupleObj6[1]).assertEqual(6)

      Done()
    })

    /**
     * @tc.name   exportTupleTest1007
     * @tc.number SUB_EXPORT_TUPLE_TEST_0700
     * @tc.desc   test EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportTupleTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let tupleObj7Alias = (await import('../export_tuple/ObjExport3')).tupleObj7Alias

      expect(tupleObj7Alias[0]).assertEqual("export_type7")
      expect(tupleObj7Alias[1]).assertEqual(7)

      Done()
    })

    /**
     * @tc.name   exportTupleTest1008
     * @tc.number SUB_EXPORT_TUPLE_TEST_0800
     * @tc.desc   test EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportTupleTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let all = (await import('../export_tuple/Index'))

      expect(all.tupleObj3[0]).assertEqual("export_type3")
      expect(all.tupleObj3[1]).assertEqual(3)

      expect(all.tupleObj4[0]).assertEqual("export_type4")
      expect(all.tupleObj4[1]).assertEqual(4)

      expect(all.tupleObj5[0]).assertEqual("export_type5")
      expect(all.tupleObj5[1]).assertEqual(5)

      Done()
    })

    /**
     * @tc.name   exportTupleTest1009
     * @tc.number SUB_EXPORT_TUPLE_TEST_0900
     * @tc.desc   test EXPORT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('exportTupleTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      console.info('testTag', '%{public}s', 'it begin');

      let all = (await import('../export_tuple/Index2'))

      expect(all.tupleObj3Alias[0]).assertEqual("export_type3")
      expect(all.tupleObj3Alias[1]).assertEqual(3)

      expect(all.tupleObj4Alias[0]).assertEqual("export_type4")
      expect(all.tupleObj4Alias[1]).assertEqual(4)

      expect(all.tupleObj5Alias[0]).assertEqual("export_type5")
      expect(all.tupleObj5Alias[1]).assertEqual(5)

      Done()
    })
  })
}

