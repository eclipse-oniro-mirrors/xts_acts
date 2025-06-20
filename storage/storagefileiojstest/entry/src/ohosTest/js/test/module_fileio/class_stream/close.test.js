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

export default function fileioStreamClose() {
describe('fileio_stream_close', function () {

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_CLOSESYNC_0000
   * @tc.name fileio_test_stream_close_sync_000
   * @tc.desc Test closeSync() interface,Close file stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_close_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_stream_close_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      let ss = fileio.fdopenStreamSync(fd, 'r+');
      expect(ss !== null).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_stream_close_sync_000 has failed for ' + err);
      expect(null).assertFail();
    }
  })

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_CLOSESYNC_0100
   * @tc.name fileio_test_stream_close_sync_001
   * @tc.desc Test closeSync() interface,When there are parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_close_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_stream_close_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath, 0o2);
      let ss = fileio.fdopenStreamSync(fd, 'r+');
      expect(ss !== null).assertTrue();
      ss.closeSync(1);
    } catch (err) {
      console.info('fileio_test_stream_close_sync_001 has failed for ' + err);
      expect(err.message == "Number of arguments unmatched").assertTrue();
      fileio.unlinkSync(fpath);
    }
  })

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_CLOSEASYNC_0000
   * @tc.name fileio_test_stream_close_async_000
   * @tc.desc Test close() interface,return in promise mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_close_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_close_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      let ss = fileio.fdopenStreamSync(fd, 'r+');
      expect(ss !== null).assertTrue();
      await ss.close();
      fileio.unlinkSync(fpath);
      done();
    } catch (err) {
      console.info('fileio_test_stream_close_async_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_CLOSEASYNC_0100
   * @tc.name fileio_test_stream_close_async_001
   * @tc.desc Test close() interface,return in callback mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_close_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_close_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      let ss = fileio.fdopenStreamSync(fd, 'r+');
      expect(ss !== null).assertTrue();
      ss.close(function (err) {
        fileio.unlinkSync(fpath);
      })
      done();
    } catch (err) {
      console.info('fileio_test_stream_close_async_001 has failed for ' + err);
      expect(null).assertFail();
    }
  });
});}
