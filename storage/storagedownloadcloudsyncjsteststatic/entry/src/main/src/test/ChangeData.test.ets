/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from './Util.test';
import cloudSync from '@ohos.file.cloudSync';
import fileUri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function changeDatetest() {
  describe('ChangeData_test', (): void => {

    /**
     * @tc.name   cloudSync_test_ChangeData_IsDirectory_static_001
     * @tc.number SUB_STORAGE_DOWNLOAD_CHANGEDATA_TEST_0100
     * @tc.desc   function of API, Test ChangeData isDirectory interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('cloudSync_test_ChangeData_IsDirectory_static_001', Level.LEVEL3, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('cloudSync_test_ChangeData_IsDirectory_static_001');
      let uri = fileUri.getUriFromPath(fpath);
      try {
        let onCallback1 = (changeData: cloudSync.ChangeData) => {
          hilog.info(domain, tag, '%{public}s', 'cloudSync_test_ChangeData_IsDirectory_static_001 changedata:' + changeData.isDirectory);
        }
        cloudSync.registerChange(uri, false, onCallback1);
        cloudSync.unregisterChange(uri);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'cloudSync_test_ChangeData_IsDirectory_static_001 has failed for ' + e.message + ', code: ' + e.code)
        expect((e as BusinessError).code == 401 && (e as BusinessError).message == 'The input parameter is invalid').assertTrue();
      }
    });

    /**
     * @tc.name   cloudSync_test_ChangeData_IsDirectory_static_002
     * @tc.number SUB_STORAGE_DOWNLOAD_CHANGEDATA_TEST_0200
     * @tc.desc   function of API, Test ChangeData isDirectory interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('cloudSync_test_ChangeData_IsDirectory_static_002', Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('cloudSync_test_ChangeData_IsDirectory_static_002');
      fs.mkdirSync(dpath);
      let uri = fileUri.getUriFromPath(dpath);
      try {
        let onCallback1 = (changeData: cloudSync.ChangeData) => {
          hilog.info(domain, tag, '%{public}s', 'cloudSync_test_ChangeData_IsDirectory_static_002 changedata:' + changeData.isDirectory);
        }
        cloudSync.registerChange(uri, false, onCallback1);
        cloudSync.unregisterChange(uri);
        fs.rmdirSync(dpath);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'cloudSync_test_ChangeData_IsDirectory_static_002 has failed for ' + e.message + ', code: ' + e.code);
        fs.rmdirSync(dpath);
        expect((e as BusinessError).code == 401 && (e as BusinessError).message == 'The input parameter is invalid').assertTrue();
      }
    });

    /**
     * @tc.name   cloudSync_test_ChangeData_Uris_static_003
     * @tc.number SUB_STORAGE_DOWNLOAD_CHANGEDATA_TEST_0300
     * @tc.desc   function of API, Test ChangeData Uris interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('cloudSync_test_ChangeData_Uris_static_003', Level.LEVEL3, async (): Promise<void> => {
      let dpath = await Utils.nextFileName('cloudSync_test_ChangeData_Uris_static_003');
      fs.mkdirSync(dpath);
      let uri = fileUri.getUriFromPath(dpath);
      fs.rmdirSync(dpath);
      try {
        let onCallback1 = (changeData: cloudSync.ChangeData) => {
          if (changeData.type == cloudSync.NotifyType.NOTIFY_ADDED) {
            hilog.info(domain, tag, '%{public}s', 'cloudSync_test_ChangeData_Uris_static_003 added changeData:' + changeData.uris);
          } else if (changeData.type== cloudSync.NotifyType.NOTIFY_DELETED) {
            hilog.info(domain, tag, '%{public}s', 'cloudSync_test_ChangeData_Uris_static_003 removed changeData:' + changeData.uris);
          }
        }
        cloudSync.registerChange(uri, false, onCallback1);
        cloudSync.unregisterChange(uri);
        expect(false).assertTrue();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'cloudSync_test_ChangeData_Uris_static_003 has failed for ' + e.message + ', code: ' + e.code);
        expect((e as BusinessError).code == 401 && (e as BusinessError).message == 'The input parameter is invalid').assertTrue();
      }
    });

  });
}