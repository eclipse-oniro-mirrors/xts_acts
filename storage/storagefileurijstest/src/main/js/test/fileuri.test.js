/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import fileUri from '@ohos.file.fileuri';
import {
  describe,
  it,
  expect
}
from '@ohos/hypium'

export default function fileuri_test() {
describe('file_uri_test', function () {

  /**
   * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0000
   * @tc.name FileUri_GetUriFromPath_000
   * @tc.desc Function of API, get Uri from Path. Test normal function.
   */
  it('FileUri_GetUriFromPath_000', 0, async function () {
    try {
      let path = "/data/storage/el2/base/haps/entry/files/sync.jpg";
      let uri = fileUri.getUriFromPath(path);
      let result = "file://ohos.acts.storage.fileuri/data/storage/el2/base/haps/entry/files/sync.jpg"
      console.log("FileUri_GetUriFromPath_000 uri:" + uri);
      console.log("FileUri_GetUriFromPath_000 result:" + result);
      expect(uri != "").assertTrue();
      expect(uri == result).assertTrue();
    } catch (e) {
      console.log('FileUri_GetUriFromPath_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0100
   * @tc.name FileUri_GetUriFromPath_001
   * @tc.desc Function of API, get Uri from Path. Test path is empty.
   */
  it('FileUri_GetUriFromPath_001', 0, async function () {
    try {
      let uri = fileUri.getUriFromPath("");
      let result = "file://ohos.acts.storage.fileuri"
      console.log("FileUri_GetUriFromPath_001 uri:" + uri);
      console.log("FileUri_GetUriFromPath_001 result:" + result);
      expect(uri != "").assertTrue();
      expect(uri == result).assertTrue();
    } catch (e) {
      console.log('FileUri_GetUriFromPath_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0200
   * @tc.name FileUri_GetUriFromPath_002
   * @tc.desc Function of API, get Uri from Path. Test argument is empty.
   */
  it('FileUri_GetUriFromPath_002', 0, async function () {
    try {
      fileUri.getUriFromPath();
      expect(false).assertTrue();
    } catch (e) {
      console.log('FileUri_GetUriFromPath_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileUri_GetUriFromPath_0300
   * @tc.name FileUri_GetUriFromPath_003
   * @tc.desc Function of API, get Uri from Path. Test argument is number.
   */
  it('FileUri_GetUriFromPath_003', 0, async function () {
    try {
      fileUri.getUriFromPath(5);
      expect(false).assertTrue();
    } catch (e) {
      console.log('FileUri_GetUriFromPath_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

})
}
