/*
* Copyright (C) 2025 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import addBigInt from '../exports/ExportBigInt'
import bigIntTypeDefault from '../exports/ExportBigInt'
import toResult from '../exports/NewExportBigInt'
import { BigIntType } from '../exports/ExportBigInt'
import { BigIntModule, toAdd } from '../exports/TestExport';
import { addBigIntUll, resultAddBigIntUll, sad } from '../exports/ExportBigInt'
import { sleep } from '../utils/Utils';

export default function exportBigIntTest() {
  describe('ExportBigIntTest', () => {
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
     * @tc.name   exportBigIntTest_0100
     * @tc.number SUB_EXPORT_BIG_INT_TEST_0100
     * @tc.desc   test default type export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportBigIntTest_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (Done: Function) => {
      const bigNumber1 = 1234567890123456789012345678901234567890n;
      const result = bigIntTypeDefault(bigNumber1);
      expect(result).assertEqual(1234567890123456789012345678901234567890n)
      Done();
    })
    /**
     * @tc.name   exportBigIntTest_0200
     * @tc.number SUB_EXPORT_BIG_INT_TEST_0200
     * @tc.desc   test the default export is defined and exported in a single statement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportBigIntTest_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const bigInt1 = 1234567890123456789012345678901234567890n;
      const result = addBigInt(bigInt1);
      expect(result).assertEqual(1234567890123456789012345678901234567890n);
      Done();
    })

    /**
     * @tc.name   exportBigIntTest_0300
     * @tc.number SUB_EXPORT_BIG_INT_TEST_0300
     * @tc.desc   test define, then export the object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportBigIntTest_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      expect(toResult).assertEqual(1234567890123456789012345678901234567890n);
      Done();
    })

    /**
     * @tc.name   exportBigIntTest_0400
     * @tc.number SUB_EXPORT_BIG_INT_TEST_0400
     * @tc.desc   test type derive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportBigIntTest_0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const obj1: BigIntType = {
        bigIntValue: 1234567890123456789012345678901234567890n
      };
      expect(obj1.bigIntValue).assertEqual(1234567890123456789012345678901234567890n);
      Done();
    })
    /**
     * @tc.name   exportBigIntTest_0500
     * @tc.number SUB_EXPORT_BIG_INT_TEST_0500
     * @tc.desc   test the default export is defined and exported in a single statement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportBigIntTest_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const bigInt1 = 1234567890123456789012345678901234567890n;
      const result = addBigIntUll(bigInt1);
      expect(result).assertEqual(1234567890123456789012345678901234567890n);
      Done();
    })
    /**
     * @tc.name   exportBigIntTest_0600
     * @tc.number SUB_EXPORT_BIG_INT_TEST_0600
     * @tc.desc   test define, then export the object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportBigIntTest_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      expect(resultAddBigIntUll).assertEqual(1234567890123456789012345678901234567890n);
      Done();
    })
    /**
     * @tc.name   exportBigIntTest_0700
     * @tc.number SUB_EXPORT_BIG_INT_TEST_0700
     * @tc.desc   test define, export, and alias the object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportBigIntTest_0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      expect(sad).assertEqual(1234567890123456789012345678901234567890n);
      Done();
    })
    /**
     * @tc.name   exportBigIntTest_0800
     * @tc.number SUB_EXPORT_BIG_INT_TEST_0800
     * @tc.desc   test export all files, equivalent to transfer export
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportBigIntTest_0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const bigInt1 = 1234567890123456789012345678901234567890n;
      const result = BigIntModule.addBigIntUll(bigInt1);
      expect(result).assertEqual(1234567890123456789012345678901234567890n);
      Done();
    })
    /**
     * @tc.name   exportBigIntTest_0900
     * @tc.number SUB_EXPORT_BIG_INT_TEST_0900
     * @tc.desc   test export file alias
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportBigIntTest_0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const bigInt1 = 1234567890123456789012345678901234567890n;
      const result = toAdd(bigInt1);
      expect(result).assertEqual(1234567890123456789012345678901234567890n);
      Done();
    })
  })
}

