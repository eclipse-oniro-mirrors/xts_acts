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

export default function fileioFchmod() {
describe('fileio_fchmod', function () {

  /**
   * @tc.name   fileio_test_fchmod_sync_000
   * @tc.number SUB_DF_FILEIO_FCHMOD_SYNC_0000
   * @tc.desc   Test fchmodSync() interfaces, mode = 0o660. Test file permissions modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fchmod_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_fchmod_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      fileio.fchmodSync(fd, 0o666);
      expect((fileio.statSync(fpath).mode & 0o777) == 0o664).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_fchmod_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_fchmod_async_000
   * @tc.number SUB_DF_FILEIO_FCHMOD_ASYNC_0000
   * @tc.desc   Test the fchmodAsync() interface with callback, mode = 1002. Test file permissions modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fchmod_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchmod_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o1, 0o0200);
      fileio.fchmod(fd, 1002, (err) => {
        if (err) {
          console.error('fileio_test_fchmod_async_000 has failed in callback: ' + err);
        }
        expect((fileio.statSync(fpath).mode & 0o777) == 0o664).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_fchmod_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_fchmod_async_001
   * @tc.number SUB_DF_FILEIO_FCHMOD_ASYNC_0100
   * @tc.desc   Test the fchmodAsync() interface with callback, mode = 0o100. Test file permissions modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_fchmod_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchmod_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o1, 0o020);
      await fileio.fchmod(fd, 0o100);
      expect((fileio.statSync(fpath).mode & 0o777) == 0o664).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_test_fchmod_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });
});
}
