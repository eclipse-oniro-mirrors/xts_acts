/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import environment from '@ohos.file.environment';
import { BusinessError } from '@ohos.base';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const FILE_CONTENT = 'hello world';

export default function getUserDir() {
  describe("environment_getUserDir_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'environment_getUserDir_test start');

    /**
     * @tc.name   environment_test_getUserDesktopDir_Static_001
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDesktopDir_0100
     * @tc.desc   Test getDesktopDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDesktopDir_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDesktopDir_Static_001 start');
      try {
        let path = environment.getUserDesktopDir();
        expect(await Utils.isString(path)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDesktopDir_Static_001 has failed for' + e.message + ' code: ' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        }else{
          expect(false).assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDocumentDir_Static_001
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDocumentDir_0100
     * @tc.desc   Test getUserDocumentDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDocumentDir_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDocumentDir_Static_001 start');
      try {
        let path = environment.getUserDocumentDir();
        expect(await Utils.isString(path)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDocumentDir_Static_001 has failed for' + e.message + ' code: ' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        }else{
          expect(false).assertTrue();
        }
      }
    });

    /**
     * @tc.name   environment_test_getUserDownloadDir_Static_001
     * @tc.number SUB_BASIC_FM_FileAPI_Environment_getUserDownloadDir_0100
     * @tc.desc   Test getUserDownloadDir() interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('environment_test_getUserDownloadDir_Static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDownloadDir_Static_001 start');
      try {
        let path = environment.getUserDownloadDir();
        expect(await Utils.isString(path)).assertTrue();
      } catch (e: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'environment_test_getUserDownloadDir_Static_001 has failed for' + e.message + ' code: ' + e.code);
        if (e.code == 801) {
          expect(e.code == 801 && e.message == "The device doesn't support this api").assertTrue();
        }else{
          expect(false).assertTrue();
        }
      }
    });
  })
  hilog.info(domain, tag, '%{public}s', 'environment_getUserDir_test end');

}