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

export default function fileioStreamFlush() {
describe('fileio_stream_flush', function () {

  /**
   * @tc.name   fileio_test_stream_flush_sync_000
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSHSYNC_0000
   * @tc.desc   Test flushSync() interface, refresh file stream.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_flush_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_stream_flush_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      expect(ss.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      ss.flushSync();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_stream_flush_sync_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

   /**
    * @tc.name   fileio_test_stream_flush_sync_001
    * @tc.number SUB_DF_FILEIO_STREAM_FLUSHSYNC_0100
    * @tc.desc   Test flushSync() interface, When there are parameters.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileio_test_stream_flush_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileio_test_stream_flush_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    let ss = fileio.createStreamSync(fpath, 'r+');
    expect(ss !== null).assertTrue();
    expect(ss.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
    try {
      ss.flushSync(1);
    } catch (err) {
      console.info('fileio_test_stream_flush_sync_001 has failed for ' + err);
      expect(err.message == "Number of arguments unmatched").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.name   fileio_test_stream_flush_async_000
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSHASYNC_0000
   * @tc.desc   Test flush() interface, refresh the file stream and return in promise mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_flush_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_flush_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      expect(ss.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      ss.flush().then(
        function (err) {
          ss.closeSync();
          fileio.unlinkSync(fpath);
        })
      done();
    } catch (err) {
      console.info('fileio_test_stream_flush_async_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.name   fileio_test_stream_flush_async_001
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSHASYNC_0100
   * @tc.desc   Test flush() interface, refresh the file stream and return in callback mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileio_test_stream_flush_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileio_test_stream_flush_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      expect(ss.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      ss.flush(function (err) {
        ss.closeSync();
        fileio.unlinkSync(fpath);
        done();
      })
    } catch (err) {
      console.info('fileio_test_stream_flush_async_001 has failed for ' + err);
      expect(null).assertFail();
    }
  });

});
}
