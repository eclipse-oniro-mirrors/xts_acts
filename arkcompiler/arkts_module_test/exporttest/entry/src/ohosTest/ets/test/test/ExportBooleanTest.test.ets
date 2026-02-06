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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import appConfig from '../Bool/BoolExport';
import appConfig1 from '../Bool/BoolExport1';
import appConfig2 from '../Bool/BoolExport2';
import { appConfig3, appConfig4, appConfig5, appConfig6Name } from '../Bool/BoolExport3';
import { appConfig7 } from "../Bool/BoolExport5";
import * as appConfig8 from "../Bool/BoolExport4";
import { sleep } from "../utils/Utils";


export default function ExportBooleanTest() {
  describe('ExportBooleanTest', () => {
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
     * @tc.number SUB_EXPORT_BOOLEAN_TEST_0100
     * @tc.name ExportBooleanTest0100
     * @tc.desc test Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('ExportBooleanTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      expect(appConfig).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_BOOLEAN_TEST_0200
     * @tc.name ExportBooleanTest0200
     * @tc.desc test Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportBooleanTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(appConfig1.bool).assertTrue();
      expect(appConfig1.bool1).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_BOOLEAN_TEST_0300
     * @tc.name ExportBooleanTest0300
     * @tc.desc test Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportBooleanTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(appConfig2.bool).assertTrue();
      expect(appConfig2.bool1).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_BOOLEAN_TEST_0400
     * @tc.name ExportBooleanTest0400
     * @tc.desc test Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportBooleanTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let appConfig3: appConfig3 = true;
      expect(appConfig3).assertTrue();
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_BOOLEAN_TEST_0500
     * @tc.name ExportBooleanTest0500
     * @tc.desc test Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportBooleanTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(appConfig4.bool).assertTrue();
      expect(appConfig4.bool1).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_BOOLEAN_TEST_0600
     * @tc.name ExportBooleanTest0600
     * @tc.desc test Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportBooleanTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(appConfig5.bool).assertTrue();
      expect(appConfig5.bool1).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_BOOLEAN_TEST_0700
     * @tc.name ExportBooleanTest0700
     * @tc.desc test Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportBooleanTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(appConfig6Name.bool).assertTrue();
      expect(appConfig6Name.bool1).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_BOOLEAN_TEST_0800
     * @tc.name ExportBooleanTest0800
     * @tc.desc test Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportBooleanTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(appConfig7.bool).assertTrue();
      expect(appConfig7.bool1).assertFalse();
      Done();
    });


    /**
     * @tc.number SUB_EXPORT_BOOLEAN_TEST_0900
     * @tc.name ExportBooleanTest0900
     * @tc.desc test Boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ExportBooleanTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      expect(appConfig8.appConfig7.bool).assertTrue();
      expect(appConfig8.appConfig7.bool1).assertFalse();
      Done();
    });

  })
}