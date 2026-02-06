/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { zlib } from '@kit.BasicServicesKit';

const TAG: string = 'BmsZlibChecksumTestTag';
const Domain: number = 0x0000;
const CODE_PARAMETER_ERROR: number = 401;

export default function bmsZlibChecksumCrc64Test() {
  let checksum: zlib.Checksum = zlib.createChecksumSync();
  let buf = new ArrayBuffer(12);
  let bufEmpty = new ArrayBuffer(12);
  let str = 'hello world!';
  describe('bmsZlibChecksumCrc64Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      let data = new Uint8Array(buf);
      for (let i = 0, j = str.length; i < j; i++) {
        data[i] = str.charCodeAt(i);
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
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_4800
     * @tc.number Sub_Bms_Zlib_Checksum_Check_4800
     * @tc.desc   test crc64(0,bufEmpty)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Sub_Bms_Zlib_Checksum_Check_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          let crc = 0;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4800 start`);
          let num: number = await checksum.crc64(crc, bufEmpty);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4800 crc ${crc} ret: ${num}`);
          expect(num >= 0).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_4800 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_4900
     * @tc.number Sub_Bms_Zlib_Checksum_Check_4900
     * @tc.desc   test crc64(-1,buf)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Sub_Bms_Zlib_Checksum_Check_4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let crc = -1;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4900 start`);
          let num: number = await checksum.crc64(crc, buf);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4900 crc ${crc} buf ${str} ret: ${num}`);
          expect(num > 0).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_4900 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_5000
     * @tc.number Sub_Bms_Zlib_Checksum_Check_5000
     * @tc.desc   test crc64(9223372036854775808,buf)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Sub_Bms_Zlib_Checksum_Check_5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let crc = 9223372036854775808;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_5000 start`);
          let num: number = await checksum.crc64(crc, buf);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_5000 crc ${crc} buf ${str} ret: ${num}`);
          expect(num > 0).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_5000 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_5200
     * @tc.number Sub_Bms_Zlib_Checksum_Check_5200
     * @tc.desc   test crc64(undefined,buf)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Sub_Bms_Zlib_Checksum_Check_5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let crc = undefined;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_5200 start`);
          let num: number = await checksum.crc64(crc, buf);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_5200 crc ${crc} buf ${str} ret: ${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_5200 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR)
        }
        done();
      });
    /**
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_5300
     * @tc.number Sub_Bms_Zlib_Checksum_Check_5300
     * @tc.desc   test crc64(0,null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Sub_Bms_Zlib_Checksum_Check_5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let crc = 0;
          let buf = null;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_5300 start`);
          let num: number = await checksum.crc64(crc, buf);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_5300 crc ${crc} buf null ret: ${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_5300 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR)
        }
        done();
      });
    /**
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_5400
     * @tc.number Sub_Bms_Zlib_Checksum_Check_5400
     * @tc.desc   test crc64(0,undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Sub_Bms_Zlib_Checksum_Check_5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let crc = 0;
          let buf = undefined;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_5400 start`);
          let num: number = await checksum.crc64(crc, buf);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_5400 crc ${crc} buf undefined ret: ${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_5400 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR)
        }
        done();
      });
  })
}