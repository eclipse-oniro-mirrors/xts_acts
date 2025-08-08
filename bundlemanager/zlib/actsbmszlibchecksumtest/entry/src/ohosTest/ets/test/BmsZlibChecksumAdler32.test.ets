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

export default function bmsZlibChecksumAdler32Test() {
  let checksum: zlib.Checksum = zlib.createChecksumSync();
  let buf = new ArrayBuffer(12);
  let bufEmpty = new ArrayBuffer(12);
  let str = 'hello world!';
  describe('bmsZlibChecksumAdler32Test', () => {
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
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_0400
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_0400
     * @tc.desc: test adler32(0,bufEmpty)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let adler = 0;
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0400 start`);
        let num: number = await checksum.adler32(adler, bufEmpty);
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0400 adler ${adler} ret: ${num}`);
        expect(true).assertTrue();
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0400 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_0500
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_0500
     * @tc.desc: test adler32(-1,buf)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let adler = -1;
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0500 start`);
        let num: number = await checksum.adler32(adler, buf);
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0500 adler=${adler} buf=${str}, ret=${num}`);
        expect(true).assertTrue();
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0500 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_0600
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_0600
     * @tc.desc: test adler32(9223372036854775808,buf)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let adler = 9223372036854775808;
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0600 start`);
        let num: number = await checksum.adler32(adler, buf);
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0600 adler=${adler} buf=${str}, ret=${num}`);
        expect(true).assertTrue();
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0600 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_0800
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_0800
     * @tc.desc: test adler32(undefined,buf)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let adler = undefined;
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0800 start`);
        let num: number = await checksum.adler32(adler, buf);
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0800 adler=${adler} buf=${str}, ret=${num}`);
        expect(num).assertFail();
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0800 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
      }
      done();
    });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_0900
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_0900
     * @tc.desc: test adler32(0,null)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let adler = 0;
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0900 start`);
        let num: number = await checksum.adler32(adler, null);
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0900 adler=${adler} buf=null, ret=${num}`);
        expect(num).assertFail();
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_0900 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
      }
      done();
    });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_1000
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_1000
     * @tc.desc: test adler32(0,undefined)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let adler = 0;
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1000 start`);
        let num: number = await checksum.adler32(adler, undefined);
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1000 adler=${adler} buf=undefined, ret=${num}`);
        expect(num).assertFail();
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1000 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
      }
      done();
    });

  })
}