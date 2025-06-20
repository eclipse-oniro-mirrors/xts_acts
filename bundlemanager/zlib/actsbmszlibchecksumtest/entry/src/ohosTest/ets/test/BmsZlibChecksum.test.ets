/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { zlib } from '@kit.BasicServicesKit';

const TAG: string = 'BmsZlibChecksumTestTag';
const Domain: number = 0x0000;

export default function bmsZlibChecksumTest() {
  describe('BmsZlibChecksumTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
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
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_0100
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_0100
     * @tc.desc: test createChecksum
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0100 start`);
        let checksum: zlib.Checksum = await zlib.createChecksum();
        expect(checksum).not().assertUndefined();
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0100 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_0200
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_0200
     * @tc.desc: test createChecksumSync
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0200 start`);
        let checksum: zlib.Checksum = zlib.createChecksumSync();
        expect(checksum).not().assertUndefined();
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0200 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
      }
      done();
    });
  })
}