/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function bmsZlibChecksumAdler32Test() {
  let checksum: zlib.Checksum = zlib.createChecksumSync();
  let buf: ArrayBuffer = new ArrayBuffer(12);
  let bufEmpty: ArrayBuffer = new ArrayBuffer(12);
  let str: string = 'hello world!';
  describe('bmsZlibChecksumAdler32Test', () => {
    beforeAll(() => {
      let data = new Uint8Array(buf);
      for (let i = 0, j = str.length; i < j; i++) {
        data[i] = str.charCodeAt(i);
      }
    })

    /**
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_static_0400
     * @tc.number Sub_Bms_Zlib_Checksum_Check_static_0400
     * @tc.desc   test adler32(0,bufEmpty)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("Sub_Bms_Zlib_Checksum_Check_static_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let adler: long = 0;
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0400 start`);
        let num: number = await checksum.adler32(adler, bufEmpty);
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0400 adler ${adler} ret: ${num}`);
        expect(num).assertEqual(0);
        done();
      } catch (e: BusinessError) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0400 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
        done();
      }
    });
  })
}