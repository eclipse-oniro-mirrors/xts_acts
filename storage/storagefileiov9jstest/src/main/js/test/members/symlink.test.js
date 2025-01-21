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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect,
} from '../Common';

export default function fileIOSymlink() {
describe('fileIO_fs_symlink', function () {

  /**
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0000
   * @tc.name fileIO_test_symlink_sync_000
   * @tc.desc Test symlinkSync() interfaces.
   * Create a symbolic link to verify normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_symlink_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_symlink_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlinkSync(fpath, fpath + 'link0');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_symlink_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Permission denied').assertTrue();
      fileIO.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0100
   * @tc.name fileIO_test_symlink_async_001
   * @tc.desc Test SymlinkAsync interfaces. await Promise.
   * Create a symbolic link to verify normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_symlink_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.symlink(fpath, fpath + 'link2');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_symlink_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Permission denied').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0200
   * @tc.name fileIO_test_symlink_async_002
   * @tc.desc Test SymlinkAsync interfaces. 
   * Create a symbolic link to verify normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_symlink_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_symlink_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.symlink(fpath,  fpath + 'link3', (err) => {
        if (err) {
          fileIO.unlinkSync(fpath);
          console.log('fileIO_test_symlink_async_002 error: message: ' + err.message );
          expect(err.message == 'Permission denied').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_symlink_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
