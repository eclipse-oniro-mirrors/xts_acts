/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import myNumber2 from '../exports/ExportNumber2';
import exportObject, {
  aaExport,
  anotherObject,
  exportedNumberObj,
  exportObject2,
  myExport,
  myNumberObject
} from '../exports/ExportNumber3';
import myNumber, { myNumberType } from '../exports/ExportNumber';
import { sleep } from '../utils/Utils';

export default function exportNumberTest() {
  describe('ExportNumberTest', () => {
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
     * @tc.number EXPORT_NUMBER_TEST_0100
     * @tc.name exportNumberTest0100
     * @tc.desc test Default the number type is exported based on the default type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('exportNumberTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      let a: myNumber = 12;
      await sleep(100);
      expect(12).assertEqual(a);
      Done();
    })

    /**
     * @tc.number EXPORT_NUMBER_TEST_0200
     * @tc.name exportNumberTest0200
     * @tc.desc test Default define and export in a single statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportNumberTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let a = myNumber2.toString();
      await sleep(100);
      expect('43').assertEqual(a);
      Done();
    })

    /**
     * @tc.number EXPORT_NUMBER_TEST_0300
     * @tc.name exportNumberTest0300
     * @tc.desc test Default define first, then export the object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportNumberTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let a = exportObject.number;
      await sleep(100);
      expect(45).assertEqual(a);
      Done();
    })
    /**
     * @tc.number EXPORT_NUMBER_TEST_0400
     * @tc.name exportNumberTest0400
     * @tc.desc test Define and export in a single statement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportNumberTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let a = myExport.number;
      await sleep(100);
      expect(45).assertEqual(a);
      Done();
    })

    /**
     * @tc.number EXPORT_NUMBER_TEST_0500
     * @tc.name exportNumberTest0500
     * @tc.desc test Define first, then export the object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportNumberTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let a = exportObject2.number;
      await sleep(100);
      expect(46).assertEqual(a);
      Done();
    })

    /**
     * @tc.number EXPORT_NUMBER_TEST_0600
     * @tc.name exportNumberTest0600
     * @tc.desc test Define and export objects with aliases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportNumberTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let a = exportedNumberObj.number;
      await sleep(100);
      expect(46).assertEqual(a);
      Done();
    })

    /**
     * @tc.number EXPORT_NUMBER_TEST_0700
     * @tc.name exportNumberTest0700
     * @tc.desc test Exporting all files is equivalent to passing the export
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportNumberTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let a = myNumberObject.number;
      let b = anotherObject.number;
      await sleep(100);
      expect(99).assertEqual(a);
      await sleep(100);
      expect(100).assertEqual(b);
      Done();
    })

    /**
     * @tc.number EXPORT_NUMBER_TEST_0800
     * @tc.name exportNumberTest0800
     * @tc.desc test Export file aliases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportNumberTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let a = aaExport.myNumberObject.number;
      let b = aaExport.anotherObject.number;
      await sleep(100);
      expect(99).assertEqual(a);
      await sleep(100);
      expect(100).assertEqual(b);
      Done();
    })
    /**
     * @tc.number EXPORT_NUMBER_TEST_0900
     * @tc.name exportNumberTest0900
     * @tc.desc test Type export
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('exportNumberTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      let a: myNumberType = 1;
      await sleep(100);
      expect(1).assertEqual(a);
      Done();
    })

  })
}