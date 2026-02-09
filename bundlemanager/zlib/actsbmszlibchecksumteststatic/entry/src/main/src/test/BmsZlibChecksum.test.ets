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
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_static_0100
     * @tc.number Sub_Bms_Zlib_Checksum_Check_static_0100
     * @tc.desc   test createChecksum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Sub_Bms_Zlib_Checksum_Check_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0100 start`);
        zlib.createChecksum().then<void, void>((data: zlib.Checksum): void => {
          hilog.info(Domain, TAG, 'createChecksum success');
          hilog.info(Domain, TAG, 'createChecksum data : ' + JSON.stringify(data));
          expect(data).not().assertUndefined();
          expect(data != null).assertTrue();
          done();
        }, (err: Error): void => {
          hilog.info(Domain, TAG, 'createChecksum filed');
          hilog.info(Domain, TAG, 'createChecksum err：' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0100 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   Sub_Bms_Zlib_Checksum_Check_static_0200
     * @tc.number Sub_Bms_Zlib_Checksum_Check_static_0200
     * @tc.desc   test createChecksumSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Sub_Bms_Zlib_Checksum_Check_static_0200", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        hilog.info(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0200 start`);
        let checksum: zlib.Checksum = zlib.createChecksumSync();
        expect(checksum).not().assertUndefined();
        expect(checksum != null).assertTrue();
        done();
      } catch (e) {
        hilog.error(Domain, TAG, `Sub_Bms_Zlib_Checksum_Check_static_0200 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ACTS_ChecksumTest_static_06
     * @tc.number ACTS_ChecksumTest_static_06
     * @tc.desc   test getCrcTable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("ACTS_ChecksumTest_static_06", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_06 start`);
        let checksum: zlib.Checksum = zlib.createChecksumSync();
        checksum.getCrcTable().then((data: Array<long>): Promise<Array<long>> =>{
          hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_06 getCrcTable data : ` + JSON.stringify(data));
          expect(checksum).not().assertUndefined();
          done();
        }).catch((e: Error): void =>{
          hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_06 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect().assertFail();
          done();
        })
      } catch (e) {
        hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_06 error, error code is: ${e.code}, error message is: ${e.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   ACTS_ChecksumTest_static_08
     * @tc.number ACTS_ChecksumTest_static_08
     * @tc.desc   test getCrcTable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("ACTS_ChecksumTest_static_08", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_08 start`);
          let checksum: zlib.Checksum = zlib.createChecksumSync();
          await checksum.getCrcTable().then((data: Array<long>): Promise<Array<long>> => {
            hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_08 getCrcTable data : ` + JSON.stringify(data));
            expect(data.length > 0).assertTrue();
            done();
          }).catch((e: Error): void => {
            hilog.info(Domain, TAG,
              `ACTS_ChecksumTest_static_08 error, error code is: ${e.code}, error message is: ${e.message}`);
            expect().assertFail();
            done();
          })
        } catch (e) {
          hilog.info(Domain, TAG,
            `ACTS_ChecksumTest_static_08 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e).assertFail();
          done();
        }
      });
    /**
     * @tc.name   ACTS_ChecksumTest_static_07
     * @tc.number ACTS_ChecksumTest_static_07
     * @tc.desc   test getCrcTable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("ACTS_ChecksumTest_static_07", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_07 start`);
          let checksum: zlib.Checksum = zlib.createChecksumSync();
          await checksum.getCrcTable().then((data: Array<long>): Promise<Array<long>> => {
            hilog.info(Domain, TAG, `ACTS_ChecksumTest_static_07 getCrcTable data : ` + JSON.stringify(data));
            expect(data.length !== 0).assertTrue();
            done();
          }).catch((e: Error): void => {
            hilog.info(Domain, TAG,
              `ACTS_ChecksumTest_static_07 error, error code is: ${e.code}, error message is: ${e.message}`);
            expect().assertFail();
            done();
          })
        } catch (e) {
          hilog.info(Domain, TAG,
            `ACTS_ChecksumTest_static_07 error, error code is: ${e.code}, error message is: ${e.message}`);
          expect(e).assertFail();
          done();
        }
      });

  })
}