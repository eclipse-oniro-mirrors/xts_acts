/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
import zlib from '@ohos.zlib'
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

const TAG: string = 'BmsZlibChecksumTestTag';
const Domain: int = 0x0000;

export default function bmsZlibChecksumCrc64Test() {
  let checksum: zlib.Checksum = zlib.createChecksumSync();
  let buf: ArrayBuffer = new ArrayBuffer(12);
  let bufEmpty: ArrayBuffer = new ArrayBuffer(12);
  let str: string = 'hello world!';
  describe('bmsZlibChecksumCrc64Test', () => {
    beforeAll(() => {
      let data = new Uint8Array(buf);
      for (let i = 0, j = str.length; i < j; i++) {
        data[i] = str.charCodeAt(i);
      }
    })

    /**
     * @tc.number  Sub_Bms_Zlib_Checksum_Check_static_4800
     * @tc.name    Sub_Bms_Zlib_Checksum_Check_static_4800
     * @tc.desc    test crc64(0,bufEmpty)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   LEVEL0
     */
    it("Sub_Bms_Zlib_Checksum_Check_static_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let crc: long = 0;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_4800 start`);
          let num: number = await checksum.crc64(crc, bufEmpty);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_4800 crc ${crc} ret: ${num}`);
          expect(num).assertEqual(0);
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_static_4800 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.number  Sub_Bms_Zlib_Checksum_Check_static_0500
     * @tc.name    Sub_Bms_Zlib_Checksum_Check_static_0500
     * @tc.desc    test crc64(0,bufEmpty)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_static_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0500 start`);
          await checksum.getCrc64Table().then((data: Array<long>): Promise<Array<long>> => {
            hilog.info(Domain, TAG, 'Sub_Bms_Zlib_Checksum_Check_static_0500 getCrc64Table success' + JSON.stringify(data));
            expect(data[0]).assertEqual(0);
            done();
          }).catch((errData: Error): void => {
            hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0500 errData is errCode:${errData.code}  message:${errData.message}`);
            expect().assertFail();
            done();
          })
        } catch (e) {
          e = e as BusinessError;
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_static_0500 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
          done();
        }
      });

  })
}