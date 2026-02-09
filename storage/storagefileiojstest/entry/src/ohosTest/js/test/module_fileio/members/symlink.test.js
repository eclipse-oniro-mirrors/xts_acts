/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import {
  fileio, FILE_CONTENT, prepareFile, nextFileName,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioSymlink() {
describe('fileio_symlink', function () {

  /**
   * @tc.name   fileio_test_symlink_sync_000
   * @tc.number SUB_DF_FILEIO_SYMLINK_SYNC_0000
   * @tc.desc   Test SymlinkSync interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_symlink_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_symlink_sync_000');

    try {
      fileio.symlinkSync(fpath, fpath + 'aaaa');
      expect(true).assertTrue();
    } catch (e) {
      console.info('fileio_test_symlink_sync_000 has failed for ' + e);
      expect(e.message == 'Permission denied').assertTrue();
    }
  });

  /**
   * @tc.name   fileio_test_symlink_async_000
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0000
   * @tc.desc   Test SymlinkAsync interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_symlink_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_symlink_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileio.symlink(fpath, fpath + '1067');
      expect(true).assertTrue();
      done();
    } catch (e) {
      console.info('fileio_test_symlink_async_000 has failed for ' + e);
      expect(e.message == 'Permission denied').assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });
  
  /**
   * @tc.name   fileio_test_symlink_async_001
   * @tc.number SUB_DF_FILEIO_SYMLINK_ASYNC_0010
   * @tc.desc   Test SymlinkAsync interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_symlink_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_symlink_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.symlink(fpath, fpath + 'pass2', (err) => {
        if (err) {
          console.log('fileio_test_symlink_async_001 error: message: ' + err.message );
          expect(err.message == 'Permission denied').assertTrue();
          fileio.unlinkSync(fpath);
          done();
        }
        expect(true).assertTrue();
        done();
      });
    } catch (e) {
      console.info('fileio_test_symlink_async_001 has failed for ' + e);
      expect(false).assertTrue();
    }
  });
});
}
