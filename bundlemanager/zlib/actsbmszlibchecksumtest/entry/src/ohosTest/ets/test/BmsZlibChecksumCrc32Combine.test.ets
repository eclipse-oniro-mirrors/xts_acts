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

export default function bmsZlibChecksumCrc32CombineTest() {
  let checksum: zlib.Checksum = zlib.createChecksumSync();
  let crc1 = 0;
  let crc2 = 0;
  let buf1 = new ArrayBuffer(21);
  let buf2 = new ArrayBuffer(19);
  let str1 = 'hello Crc32Combine1';
  let str2 = 'hei Crc32Combine2';
  let len2 = buf2.byteLength;
  describe('bmsZlibChecksumCrc32CombineTest', () => {
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
      crc1 = await checksum.crc32(0, buf1);
      hilog.info(Domain, TAG, `beforeEach Crc32:(${0},${str1})=>${crc1}`);
      crc2 = await checksum.crc32(1, buf2);
      hilog.info(Domain, TAG, `beforeEach Crc32:(${1},${str2})=>${crc2}`);
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
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_3400
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_3400
     * @tc.desc: test Crc32Combine(crc1,crc2,123)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          len2 = 123;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3400 start`);
          let num: number = await checksum.crc32Combine(crc1, crc2, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3400 Crc32Combine:(${crc1},${crc2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_3400 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_3500
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_3500
     * @tc.desc: test Crc32Combine(-1,crc2,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          crc1 = -1;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3500 start`);
          let num: number = await checksum.crc32Combine(crc1, crc2, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3500 Crc32Combine:(${crc1},${crc2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_3500 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_3600
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_3600
     * @tc.desc: test Crc32Combine(9223372036854775808,crc2,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          crc1 = 9223372036854775808;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3600 start`);
          let num: number = await checksum.crc32Combine(crc1, crc2, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3600 Crc32Combine:(${crc1},${crc2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_3600 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_3700
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_3700
     * @tc.desc: test Crc32Combine(crc1,-1,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          crc2 = -1;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3700 start`);
          let num: number = await checksum.crc32Combine(crc1, crc2, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3700 Crc32Combine:(${crc1},${crc2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_3700 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_3800
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_3800
     * @tc.desc: test Crc32Combine(crc1,9223372036854775808,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          crc2 = 9223372036854775808;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3800 start`);
          let num: number = await checksum.crc32Combine(crc1, crc2, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3800 Crc32Combine:(${crc1},${crc2},${len2})=>${num}`);
          expect(true).assertTrue();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_3800 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_3900
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_3900
     * @tc.desc: test Crc32Combine(crc1,crc2,-1)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          len2 = -1;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3900 start`);
          let num: number = await checksum.crc32Combine(crc1, crc2, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_3900 Crc32Combine:(${crc1},${crc2},${len2})=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_3900 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_4200
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_4200
     * @tc.desc: test Crc32Combine(undefined,crc2,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4200 start`);
          let num: number = await checksum.crc32Combine(undefined, crc2, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4200 Crc32Combine:(undefined,${crc2},${len2})=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_4200 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_4300
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_4300
     * @tc.desc: test Crc32Combine(crc1,null,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4300 start`);
          let num: number = await checksum.crc32Combine(crc1, null, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4300 Crc32Combine:(${crc1},null,${len2})=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_4300 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_4400
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_4400
     * @tc.desc: test Crc32Combine(crc1,undefined,len2)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4400 start`);
          let num: number = await checksum.crc32Combine(crc1, undefined, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4400 Crc32Combine:(${crc1},undefined,${len2})=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_4400 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_4500
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_4500
     * @tc.desc: test Crc32Combine(crc1,crc2,null)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4500 start`);
          let num: number = await checksum.crc32Combine(crc1, crc2, null);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4500 Crc32Combine:(${crc1},${crc2},null)=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_4500 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_4600
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_4600
     * @tc.desc: test Crc32Combine(crc1,crc2,undefined)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4600 start`);
          let num: number = await checksum.crc32Combine(crc1, crc2, undefined);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_4600 Crc32Combine:(${crc1},${crc2},undefined)=>${num}`);
          expect(num).assertFail();
        } catch (e) {
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_4600 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e.code).assertEqual(CODE_PARAMETER_ERROR);
        }
        done();
      });
  })
}