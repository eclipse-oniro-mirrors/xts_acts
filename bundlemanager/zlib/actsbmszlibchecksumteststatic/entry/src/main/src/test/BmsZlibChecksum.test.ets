/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach} from "../../../hypium/index";
import zlib from '@ohos.zlib'
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';

const TAG: string = 'BmsZlibChecksumTestTag';
const Domain: Int = 0x0000;

export default function bmsZlibChecksumTest() {
  describe('BmsZlibChecksumTest', () => {

    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_static_0100
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_static_0100
     * @tc.desc: test createChecksum
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0100 start`);
        zlib.createChecksum().then<void, void>((data: zlib.Checksum): void => {
          hilog.info(0x0000, 'testTag', 'createChecksum success');
          hilog.info(0x0000, 'testTag', 'createChecksum data : ' + JSON.stringify(data));
          expect(data).not().assertUndefined();
          expect(data != null).assertTrue();
          done();
        }, (err: BusinessError<void>): void => {
          hilog.info(0x0000, 'testTag', 'createChecksum filed');
          hilog.info(0x0000, 'testTag', 'createChecksum err：' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (e: BusinessError) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0100 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number: Sub_Bms_Zlib_Checksum_Check_static_0200
     * @tc.name: Sub_Bms_Zlib_Checksum_Check_static_0200
     * @tc.desc: test createChecksumSync
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level2
     */
    it("Sub_Bms_Zlib_Checksum_Check_static_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0200 start`);
        let checksum: zlib.Checksum = zlib.createChecksumSync();
        expect(checksum).not().assertUndefined();
        expect(checksum != null).assertTrue();
        done();
      } catch (e: BusinessError) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0200 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : ACTS_ChecksumTest_static_06
     * @tc.name       : ACTS_ChecksumTest_static_06
     * @tc.desc       : test getCrcTable
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("ACTS_ChecksumTest_static_06", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_06 start`);
        let checksum: zlib.Checksum = zlib.createChecksumSync();
        checksum.getCrcTable().then((data: Array<long>): Promise<Array<long>> =>{
          hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_06 getCrcTable data : ` + JSON.stringify(data));
          expect(checksum).not().assertUndefined();
          done();
        }).catch((e: BusinessError): void =>{
          hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_06 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
          done();
        })
      } catch (e: BusinessError) {
        hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_06 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
        done();
      }
    });

  })
}