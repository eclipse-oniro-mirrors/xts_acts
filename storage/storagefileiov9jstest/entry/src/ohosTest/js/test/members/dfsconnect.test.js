/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  fileIO, describe, it, expect,
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIODfsConnect() {
  describe('fileIO_test_DfsConnect', function () {

  /**
   * @tc.name   fileIO_test_connectDfs_001
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_connectDfs_0100
   * @tc.desc   Test connectDfs() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_connectDfs_001', Level.LEVEL3, async function (done) {
    let testNum = 'fileIO_test_connectDfs_001';
    let networkId = '3dfgfh2yhytrg9rebgk4893fnio34fn4edrg';
    let DFSListener = {
      onStatus: function (networkId, status) {
        console.log(testNum + 'connectDfs onStatus');
      }
    }
    try {
      fileIO.connectDfs(networkId, DFSListener).then(() => {
        console.log(testNum + "Success to connectDfs");
      }).catch((err) => {
        console.log(testNum + 'connectDfs failed with error code: ' + err.code + 'message: ' + err.message);
        expect(true).assertTrue();
        done();
      });
    } catch (e) {
      console.log(testNum + ' has failed for ' + e.message + ', code: ' + e.code);
      expect(true).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_connectDfs_002
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_connectDfs_0200
   * @tc.desc   Test disconnectDfs() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_connectDfs_002', Level.LEVEL3, async function (done) {
    let testNum = 'fileIO_test_connectDfs_002';
    let networkId = '3dfgfh2yhytrg9rebgk4893fnio34fn4edrg';
    try {
      fileIO.disconnectDfs(networkId).then(() => {
        console.log(testNum + "Success to disconnectDfs");
      }).catch((err) => {
        console.log(testNum + 'disconnectDfs failed with error code: ' + err.code + 'message: ' + err.message);
        expect(true).assertTrue();
        done();
      });
    } catch (e) {
      console.log(testNum + ' has failed for ' + e.message + ', code: ' + e.code);
      expect(true).assertTrue();
      done();
    }
  });
});
}
