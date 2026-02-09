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
  fileio, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
  describe, it, expect,
} from '../../Common';
import { Level } from '@ohos/hypium';

export default function fileioLchown() {
describe('fileio_lchown', function () {

  /**
   * @tc.name   fileio_test_lchown_sync_000
   * @tc.number SUB_DF_FILEIO_LCHOWN_SYNC_0000
   * @tc.desc   Test lchownSync() interface, invalid path. The test file was modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lchown_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      fileio.lchownSync(fpath, stat.uid + 1, stat.gid + 1);
      let stat1 = fileio.statSync(fpath);
      expect(stat.uid == stat1.uid).assertTrue();
      expect(stat.gid == stat1.gid).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_lchown_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lchown_async_000
   * @tc.number SUB_DF_FILEIO_LCHOWN_ASYNC_0000
   * @tc.desc   Test the lchownASync() interface with promise,
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lchown_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      await fileio.lchown(fpath, stat.uid + 1, stat.gid + 1);
      let stat1 = fileio.statSync(fpath);
      expect(stat.uid == stat1.uid).assertTrue();
      expect(stat.gid == stat1.gid).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_test_lchown_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_lchown_async_001
   * @tc.number SUB_DF_FILEIO_LCHOWNASYNC_0100
   * @tc.desc   Test the chownAsync() interface with callback. The test file was modified successfully.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_lchown_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      fileio.lchown(fpath, stat.uid + 1, stat.gid + 1, (err) => {
        if (err) {
          console.error('fileio_test_lchmod_async_000 has failed in callback: ' + err);
        }
        let stat1 = fileio.statSync(fpath);
        expect(stat.uid == stat1.uid).assertTrue();
        expect(stat.gid == stat1.gid).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_lchown_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });
});
}
