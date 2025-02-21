/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import hilog from '@ohos.hilog';
import testNapi from 'libentry.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import systemDateTime from "@ohos.systemDateTime";

export default function timeNdkTest() {
  describe('timeNdkTestSuit', () => {
    let timeZone: string;
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((done: Function) => {
      try {
        timeZone = systemDateTime.getTimezoneSync();
        console.info("====>SUB_ndkTime_getTimezone_0100 timeZone: " + timeZone);
        done()
      } catch (err) {
        console.info("====>SUB_ndkTime_getTimezone_0100 err: " + JSON.stringify(err));
        done();
      }
    })
    beforeEach(() => {
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
     * @tc.number SUB_Time_TimeManagement_Obtaining_5700.
     * @tc.name Test testNapi getTimezone error.
     * @tc.desc get zone result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_Time_TimeManagement_Obtaining_5700', 0, async (done: Function) => {
      console.info("====>SUB_Time_TimeManagement_Obtaining_5700 start");
      let result: number = testNapi.getTimezone_0100();
      console.info('====>SUB_Time_TimeManagement_Obtaining_5700 result: ' + result);
      expect(result).assertEqual(13000002);
      done();
    });

    /**
     * @tc.number SUB_Time_TimeManagement_Obtaining_5500.
     * @tc.name Test testNapi getTimezone error.
     * @tc.desc get zone result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_Time_TimeManagement_Obtaining_5500', 0, async (done: Function) => {
      console.info("====>SUB_Time_TimeManagement_Obtaining_5500 start");
      let result: number = testNapi.getTimezone_0200();
      console.info('====>SUB_Time_TimeManagement_Obtaining_5500 result: ' + result);
      expect(result).assertEqual(13000002);
      done();
    });

    /**
     * @tc.number SUB_Time_TimeManagement_Obtaining_5800.
     * @tc.name Test testNapi getTimezone.
     * @tc.desc get zone result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_Time_TimeManagement_Obtaining_5800', 0, async (done: Function) => {
      console.info("====>SUB_Time_TimeManagement_Obtaining_5800 start");
      let result: string = testNapi.getTimezone_0300();
      console.info('====>SUB_Time_TimeManagement_Obtaining_5800 result: ' + result);
      expect(result).assertEqual(timeZone);
      done();
    });

    /**
     * @tc.number SUB_Time_TimeManagement_Obtaining_5600.
     * @tc.name Test testNapi getTimezone.
     * @tc.desc get zone result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_Time_TimeManagement_Obtaining_5600', 0, async (done: Function) => {
      console.info("====>SUB_Time_TimeManagement_Obtaining_5600 start");
      let result: string = testNapi.getTimezone_0400();
      console.info('====>SUB_Time_TimeManagement_Obtaining_5600 result: ' + result);
      expect(result).assertEqual(timeZone);
      done();
    });

  })
}