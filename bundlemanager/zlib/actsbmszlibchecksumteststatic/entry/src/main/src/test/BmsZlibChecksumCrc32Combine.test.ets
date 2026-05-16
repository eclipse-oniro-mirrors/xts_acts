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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import zlib from '@ohos.zlib'
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

const TAG: string = 'BmsZlibChecksumTestTag';
const Domain: Int = 0x0000;

export default function bmsZlibChecksumCrc32CombineTest() {
  let checksum: zlib.Checksum = zlib.createChecksumSync();
  let crc1: long = 0;
  let crc2: long = 0;
  let buf1: ArrayBuffer = new ArrayBuffer(21);
  let buf2: ArrayBuffer = new ArrayBuffer(19);
  let str1: string = 'hello Crc32Combine1';
  let str2: string = 'hei Crc32Combine2';
  describe('bmsZlibChecksumCrc32CombineTest', () => {
    beforeAll(() => {
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
      crc1 = await checksum.crc32(0, buf1);
      hilog.info(Domain, TAG, `beforeEach Crc32:(${0},${str1})=>${crc1}`);
      crc2 = await checksum.crc32(1, buf2);
      hilog.info(Domain, TAG, `beforeEach Crc32:(${1},${str2})=>${crc2}`);
    })

    /**
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_static_3400
     * @tc.number Sub_Bms_Zlib_Checksum_Check_static_3400
     * @tc.desc   test Crc32Combine(crc1,crc2,123)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Sub_Bms_Zlib_Checksum_Check_static_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let len2: long = 123;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_3400 start`);
          let num: long = await checksum.crc32Combine(crc1, crc2, len2);
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_3400 Crc32Combine:(${crc1},${crc2},${len2})=>${num}`);
          expect(num).assertEqual(446674705);
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_static_3400 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
          done();
        }
      });
  })
}