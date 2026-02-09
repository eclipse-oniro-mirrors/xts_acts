/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000 //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function fileIODfsConnect() {
  describe('fileIO_test_DfsConnect', (): void => {

  /**
   * @tc.name   fileIO_test_connectDfs_static_001
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_connectDfs_0100
   * @tc.desc   Test connectDfs() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_connectDfs_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
     async (done:()=>void): Promise<void> => {
    let testNum: string = 'fileIO_test_connectDfs_static_001';
    let networkId: string = '3dfgfh2yhytrg9rebgk4893fnio34fn4edrg';
    let DFSListener: fs.DfsListeners = {
      onStatus(networkId: string, status: int) {
        hilog.info(domain, tag, '%{public}s', testNum + "connectDfs onStatus");
      }
    }
    try {
      fs.connectDfs(networkId, DFSListener).then(() => {
         hilog.info(domain, tag, '%{public}s', testNum + "Success to connectDfs");
      }).catch((err: Error) => {
        hilog.error(domain, tag, '%{public}s', testNum + 'connectDfs failed with error code: ' 
          + err.code + 'message: ' + err.message);
        expect(err.code == 13900004 && err.message == 'Interrupted system call').assertTrue();
        done();
      });
    } catch (e) {
      hilog.error(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   fileIO_test_connectDfs_static_002
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_connectDfs_0200
   * @tc.desc   Test disconnectDfs() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_connectDfs_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
     async (done:()=>void): Promise<void> => {
    let testNum: string = 'fileIO_test_connectDfs_static_002';
    let networkId: string = '3dfgfh2yhytrg9rebgk4893fnio34fn4edrg';
    try {
      fs.disconnectDfs(networkId).then(() => {
        hilog.info(domain, tag, '%{public}s', testNum + "Success to disconnectDfs");
        done();
      }).catch((err: Error) => {
        hilog.info(domain, tag, '%{public}s', testNum + 'disconnectDfs failed with error code: ' 
          + err.code + 'message: ' + err.message);
        expect(err.code == 13900004 && err.message == 'Interrupted system call').assertTrue();
        done();
      });
    } catch (e) {
      hilog.info(domain, tag, '%{public}s', testNum + ' has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });
});
}
