/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import featureAbility from '@ohos.ability.featureAbility';
import {
  fileIO, FILE_CONTENT, prepareFile, isIntNum, describe, it, expect,
} from '../Common';

export default function fileIOFileProperties() {
  describe('fileIO_file_properties', function () {

  /**
   * @tc.number SUB_DF_FILEIO_FILE_0000
   * @tc.name fileIO_test_open_file_000
   * @tc.desc Test the properties of the File object.
   * The File object is obtained through the open interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_open_file_000', 0, async function () {
    let filesDir = await featureAbility.getContext().getFilesDir();
    let fpath = filesDir + '/fileIO_test_open_file_000';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      expect(file.path === fpath).assertTrue();
      expect(file.name === 'fileIO_test_open_file_000').assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_open_file_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FILE_0100
   * @tc.name fileIO_test_dup_file_001
   * @tc.desc Test the properties of the File object.
   * The File object is obtained through the dup interface.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_dup_file_001', 0, async function () {
    let filesDir = await featureAbility.getContext().getFilesDir();
    let fpath = filesDir + '/fileIO_test_dup_file_001';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      let newFile = fileIO.dup(file.fd);
      expect(isIntNum(newFile.fd)).assertTrue();
      expect(newFile.path == fpath).assertTrue();
      expect(file.name === 'fileIO_test_dup_file_001').assertTrue();
      fileIO.closeSync(file);
      fileIO.closeSync(newFile);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_dup_file_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
