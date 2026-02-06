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

export default function fileioChown() {
describe('fileio_chown', function () {

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNSYNC_0000
   * @tc.name fileio_test_chown_sync_000
   * @tc.desc Test chownSync() interface. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_chown_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      fileio.chownSync(fpath, stat.uid + 1, stat.gid + 1);
      let stat1 = fileio.statSync(fpath);
      expect(stat.uid == stat1.uid).assertTrue();
      expect(stat.gid == stat1.gid).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_chown_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0000
   * @tc.name fileio_test_chown_async_000
   * @tc.desc Test the chownAsync() interface with promise. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      await fileio.chown(fpath, stat.uid + 1, stat.gid + 1);
      let stat1 = fileio.statSync(fpath);
      expect(stat.uid == stat1.uid).assertTrue();
      expect(stat.gid == stat1.gid).assertTrue();
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_test_chown_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0100
   * @tc.name fileio_test_chown_async_001
   * @tc.desc Test the chownAsync() interface with callback. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let stat = fileio.statSync(fpath);
      fileio.chown(fpath, stat.uid, stat.gid, (err) => {
        if (err) {
          console.error('fileio_test_chown_async_001 has failed in callback: ' + err);
        }
        let stat1 = fileio.statSync(fpath);
        expect(stat.uid == stat1.uid).assertTrue();
        expect(stat.gid == stat1.gid).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_chown_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });
});
}
