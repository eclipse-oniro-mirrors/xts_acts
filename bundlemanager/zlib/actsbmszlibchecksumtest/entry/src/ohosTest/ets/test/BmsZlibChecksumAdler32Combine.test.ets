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
const CODE_PARAMETER_ERROR: number = 401;

export default function bmsZlibChecksumAdler32CombineTest() {
  let checksum: zlib.Checksum = zlib.createChecksumSync();
  let adler1 = 0;
  let adler2 = 0;
  let buf1 = new ArrayBuffer(21);
  let buf2 = new ArrayBuffer(19);
  let str1 = 'hello Adler32Combine1';
  let str2 = 'hei Adler32Combine2';
  let len2 = buf2.byteLength;
  describe('bmsZlibChecksumAdler32CombineTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      let data1 = new Uint8Array(buf1);
      for (let i = 0, j = str1.length; i < j; i++) {
        data1[i] = str1.charCodeAt(i);
      }
      let data2 = new Uint8Array(buf2);
      for (let i = 0, j = str2.length; i < j; i++) {
        data2[i] = str2.charCodeAt(i);
      }
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      adler1 = await checksum.adler32(0, buf1);
      hilog.info(Domain, TAG, `beforeEach adler32:(${0},${str1})=>${adler1}`);
      adler2 = await checksum.adler32(1, buf2);
      hilog.info(Domain, TAG, `beforeEach adler32:(${1},${str2})=>${adler2}`);
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
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_1200
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_1200
     * @tc.desc: test adler32Combine(adler1,adler2,123)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          len2 = 123;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1200 start`);
          let num: number = await checksum.adler32Combine(adler1, adler2, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1200 adler32Combine:(${adler1},${adler2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1200 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_1300
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_1300
     * @tc.desc: test adler32Combine(-1,adler2,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          adler1 = -1;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1300 start`);
          let num: number = await checksum.adler32Combine(adler1, adler2, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1300 adler32Combine:(${adler1},${adler2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1300 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_1400
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_1400
     * @tc.desc: test adler32Combine(9223372036854775808,adler2,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          adler1 = 9223372036854775808;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1400 start`);
          let num: number = await checksum.adler32Combine(adler1, adler2, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1400 adler32Combine:(${adler1},${adler2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1400 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_1500
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_1500
     * @tc.desc: test adler32Combine(adler1,-1,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          adler2 = -1;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1500 start`);
          let num: number = await checksum.adler32Combine(adler1, adler2, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1500 adler32Combine:(${adler1},${adler2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1500 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_1600
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_1600
     * @tc.desc: test adler32Combine(adler1,9223372036854775808,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          adler2 = 9223372036854775808;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1600 start`);
          let num: number = await checksum.adler32Combine(adler1, adler2, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1600 adler32Combine:(${adler1},${adler2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1600 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_1700
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_1700
     * @tc.desc: test adler32Combine(adler1,adler2,-1)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          len2 = -1;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1700 start`);
          let num: number = await checksum.adler32Combine(adler1, adler2, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1700 adler32Combine:(${adler1},${adler2},${len2})=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1700 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_1800
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_1800
     * @tc.desc: test adler32Combine(adler1,adler2,9223372036854775808)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          len2 = 9223372036854775808;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_1800 start`);
          let num: number = await checksum.adler32Combine(adler1, adler2, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1800 adler32Combine:(${adler1},${adler2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_1800 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_2000
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_2000
     * @tc.desc: test adler32Combine(undefined,adler2,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_2000 start`);
          let num: number = await checksum.adler32Combine(undefined, adler2, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_2000 adler32Combine:(undefined,${adler2},${len2})=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_2000 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_2100
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_2100
     * @tc.desc: test adler32Combine(adler1,null,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_2100 start`);
          let num: number = await checksum.adler32Combine(adler1, null, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_2100 adler32Combine:(${adler1},null,${len2})=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_2100 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_2200
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_2200
     * @tc.desc: test adler32Combine(adler1,undefined,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_2200 start`);
          let num: number = await checksum.adler32Combine(adler1, undefined, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_2200 adler32Combine:(${adler1},undefined,${len2})=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_2200 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_2300
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_2300
     * @tc.desc: test adler32Combine(adler1,adler2,null)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_2300 start`);
          let num: number = await checksum.adler32Combine(adler1, adler2, null);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_2300 adler32Combine:(${adler1},${adler2},null)=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_2300 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_2400
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_2400
     * @tc.desc: test adler32Combine(adler1,adler2,undefined)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_2400 start`);
          let num: number = await checksum.adler32Combine(adler1, adler2, undefined);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_2400 adler32Combine:(${adler1},${adler2},undefined)=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_2400 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
  })
}