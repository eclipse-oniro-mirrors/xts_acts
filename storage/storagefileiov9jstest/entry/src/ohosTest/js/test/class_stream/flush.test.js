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

import {
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect,
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIOStreamFlush() {
describe('fileIO_fs_stream_flush', function () {

  /**
   * @tc.name   fileIO_test_stream_flush_sync_000
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSH_SYNC_0000
   * @tc.desc   Test the flushSync() interface of class Stream.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_stream_flush_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_flush_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      expect(sr.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sr.flushSync();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_flush_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_stream_flush_sync_001
    * @tc.number SUB_DF_FILEIO_STREAM_FLUSH_SYNC_0100
    * @tc.desc   Test the flushSync() interface of class Stream.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_stream_flush_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_flush_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      sr.flushSync(1);
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_flush_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_stream_flush_async_000
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSH_ASYNC_0000
   * @tc.desc   Test the flush() interface of class Stream. Promise.then().catch()
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_stream_flush_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_flush_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = await fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      expect(sr.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sr.flush().then(() => {
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_test_stream_flush_async_000 error package' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_stream_flush_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_stream_flush_async_001
   * @tc.number SUB_DF_FILEIO_STREAM_FLUSH_ASYNC_0100
   * @tc.desc   Test the flush() interface of class Stream. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_stream_flush_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_flush_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = await fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      expect(sr.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sr.flush((err) => {
        if (err) {
          console.log('fileIO_test_stream_flush_async_001 error package' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      })
    } catch (e) {
      console.log('fileIO_test_stream_flush_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });


  /**
   * @tc.name   fileIO_test_stream_flush_async_002
   * @tc.number fileIO_test_stream_flush_async_002
   * @tc.desc   fileIO_test_stream_flush_async_002
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_stream_flush_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_flush_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      await sr.flush(1);
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_flush_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
});
}
