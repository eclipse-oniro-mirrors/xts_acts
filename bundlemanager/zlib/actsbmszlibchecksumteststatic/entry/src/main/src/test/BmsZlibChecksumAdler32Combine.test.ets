/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach } from "../../../hypium/index";
import zlib from '@ohos.zlib'
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

const TAG: string = 'BmsZlibChecksumTestTag';
const Domain: Int = 0x0000;

export default function bmsZlibChecksumAdler32CombineTest() {
  let checksum: zlib.Checksum = zlib.createChecksumSync();
  let adler1: long = 0;
  let adler2: long = 0;
  let buf1: ArrayBuffer = new ArrayBuffer(21);
  let buf2: ArrayBuffer = new ArrayBuffer(19);
  let str1: string = 'hello Adler32Combine1';
  let str2: string = 'hei Adler32Combine2';
  describe('bmsZlibChecksumAdler32CombineTest', () => {
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
      adler1 = await checksum.adler32(0, buf1);
      hilog.info(Domain, TAG, `beforeEach adler32:(${0},${str1})=>${adler1}`);
      adler2 = await checksum.adler32(1, buf2);
      hilog.info(Domain, TAG, `beforeEach adler32:(${1},${str2})=>${adler2}`);
    })

    /**
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_static_1200
     * @tc.number Sub_Bms_Zlib_Checksum_Check_static_1200
     * @tc.desc   test adler32Combine(adler1,adler2,123)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Sub_Bms_Zlib_Checksum_Check_static_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let len2: long = 123;
          hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_1200 start`);
          let num: long = await checksum.adler32Combine(adler1, adler2, len2);
          hilog.info(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_static_1200 adler32Combine:(${adler1},${adler2},${len2})=>${num}`);
          expect(num).assertEqual(648678913);
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(Domain, TAG,
            `Sub_Bms_Zlib_Checksum_Check_static_1200 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
          done();
        }
      });
  })
}