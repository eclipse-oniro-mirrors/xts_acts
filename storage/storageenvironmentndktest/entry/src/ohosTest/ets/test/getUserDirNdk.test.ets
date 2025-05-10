/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';
import environment from 'libenvironment.so';

export default function getUserDirNdkTest(){
  describe('getUserDirNdkTestCheck', () => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_NDK_Environment_0100
     * @tc.name environment_ndktest_getUserDownloadDir_001
     * @tc.desc function of API, Test getUserDownloadDir
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('environment_ndktest_getUserDownloadDir_001', Level.LEVEL0, async (done: Function) => {
      let data = environment.getUserDownloadDir();
      console.info("environment_ndktest_getUserDownloadDir_001 Test NAPI data= " + JSON.stringify(data));
      if (data == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(data).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_NDK_Environment_0200
     * @tc.name environment_ndktest_getUserDesktopDir_001
     * @tc.desc function of API, Test getUserDesktopDir
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('environment_ndktest_getUserDesktopDir_001', Level.LEVEL0, async (done: Function) => {
      let data = environment.getUserDesktopDir();
      console.info("environment_ndktest_getUserDesktopDir_001 Test NAPI data= " + JSON.stringify(data));
      if (data == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(data).assertEqual(0);
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_NDK_Environment_0300
     * @tc.name environment_ndktest_getUserDocumentDir_001
     * @tc.desc function of API, Test getUserDocumentDir
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('environment_ndktest_getUserDocumentDir_001', Level.LEVEL0, async (done: Function) => {
      let data = environment.getUserDocumentDir();
      console.info("environment_ndktest_getUserDocumentDir_001 Test NAPI data= " + JSON.stringify(data));
      if (data == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(data).assertEqual(0);
        done();
      }
    });
  });
}