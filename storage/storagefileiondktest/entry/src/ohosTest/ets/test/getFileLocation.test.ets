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
import fileio from 'libfileio.so';
import fs from '@ohos.file.fs';
import { fileUri } from '@kit.CoreFileKit';

export default function getFileLocationNdkTest(){
  describe('getFileLocation_test', async () => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_NDK_Environment_0400
     * @tc.name getfilelocation_ndktest_001
     * @tc.desc function of API, Test getUserDocumentDir, normal function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('getfilelocation_ndktest_001', Level.LEVEL0, async (done: Function) => {
      let filepath = '/data/storage/el2/base/files/fileio_location.txt';
      fs.openSync(filepath,0o102);
      let uri = fileUri.getUriFromPath(filepath);
      console.info("getfilelocation_ndktest_001 Test uri= " + JSON.stringify(uri));
      let data = fileio.GetFileLocation();
      console.info("getfilelocation_ndktest_001 Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_NDK_Environment_0500
     * @tc.name getfilelocation_ndktest_002
     * @tc.desc function of API, Test getUserDocumentDir, file is not exist
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('getfilelocation_ndktest_002', Level.LEVEL0, async (done: Function) => {
      let data = fileio.GetFileLocation_noexist();
      console.info("getfilelocation_ndktest_002 Test NAPI data= " + JSON.stringify(data));
      expect(data).assertEqual(13900002);
      done();
    });
  });
}