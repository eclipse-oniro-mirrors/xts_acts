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

export default function fileioStream() {
describe('fileio_stream_1', function () {

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAMSYNC_0000
   * @tc.name fileio_test_stream_create_stream_sync_000
   * @tc.desc Test createStreamSync() interface, Open read-write file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_create_stream_sync_000', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_create_stream_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_stream_create_stream_sync_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAMSYNC_0100
   * @tc.name fileio_test_stream_create_stream_sync_001
   * @tc.desc Test createStreamSync() interface, When file does not exist.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_create_stream_sync_001', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_create_stream_sync_001');

    try {
      fileio.createStreamSync(fpath, 'r+');
    } catch (err) {
      console.info('fileio_test_stream_create_stream_sync_001 has failed for ' + err);
      expect(err.message == "No such file or directory").assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAMSYNC_0200
   * @tc.name fileio_test_stream_create_stream_sync_002
   * @tc.desc Test createStreamSync() interface, When mode is invalid.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_create_stream_sync_002', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_create_stream_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.createStreamSync(fpath, 'ohos');
    } catch (err) {
      console.info('fileio_test_stream_create_stream_sync_002 has failed for ' + err);
      expect(err.message == "Invalid argument").assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READSYNC_0000
   * @tc.name fileio_test_stream_read_sync_000
   * @tc.desc Test readSync() interface, read data from stream file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_sync_000', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_read_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      let len = ss.readSync(new ArrayBuffer(4096));
      expect(len == FILE_CONTENT.length).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_stream_read_sync_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READSYNC_0100
   * @tc.name fileio_test_stream_read_sync_001
   * @tc.desc Test the readSync method of class Stream,When offset equals buffer length..
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_sync_001', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_read_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      let len = ss.readSync(new ArrayBuffer(4096), {
        offset: 4096
      });
      expect(len == 0).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_stream_read_sync_001 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READSYNC_0200
   * @tc.name fileio_test_stream_read_sync_002
   * @tc.desc Test the readSync method of class Stream,When the length is 1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_sync_002', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_read_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      let len = ss.readSync(new ArrayBuffer(4096), {
        length: 1
      });
      expect(len == 1).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_stream_read_sync_002 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READSYNC_0300
   * @tc.name fileio_test_stream_read_sync_003
   * @tc.desc Test the readSync method of class Stream,When the position is 1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_sync_003', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_read_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      let len = ss.readSync(new ArrayBuffer(4096), {
        position: 1
      });
      expect(len == (FILE_CONTENT.length - 1)).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_stream_read_sync_003 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READSYNC_0400
   * @tc.name fileio_test_stream_read_sync_004
   * @tc.desc Test the readSync method of class Stream,When the offset is greater than the buffer length.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_sync_004', 0, async function () {
    let ss;
    let fpath = await nextFileName('fileio_test_stream_read_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      ss = fileio.createStreamSync(fpath, 'r+');
      ss.readSync(new ArrayBuffer(4096), {
        offset: 4097
      });
    } catch (err) {
      console.info('fileio_test_stream_read_sync_004 has failed for ' + err);
      expect(err.message == "Invalid option.offset, buffer limit exceeded").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READSYNC_0500
   * @tc.name fileio_test_stream_read_sync_005
   * @tc.desc Test the readSync method of class Stream, When the length is greater than the buffer length.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_sync_005', 0, async function () {
    let ss;
    let fpath = await nextFileName('fileio_test_stream_read_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      ss = fileio.createStreamSync(fpath, 'r+');
      ss.readSync(new ArrayBuffer(4096), {
        length: 4097
      });
    } catch (err) {
      console.info('fileio_test_stream_read_sync_005 has failed for ' + err);
      expect(err.message == "Invalid option.length").assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READSYNC_0600
   * @tc.name fileio_test_stream_read_sync_006
   * @tc.desc Test the readSync method of class Stream.
   * When position is equal to the length of the file content plus one.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_read_sync_006', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_read_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      let invalidPos = FILE_CONTENT.length + 1;
      let len = ss.readSync(new ArrayBuffer(4096), {
        position: invalidPos
      });
      expect(len == 0).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_stream_read_sync_006 has failed for ' + err);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITESYNC_0000
   * @tc.name fileio_test_stream_write_sync_000
   * @tc.desc Test writeSync() interface, Write data to stream file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_stream_write_sync_000', 0, async function () {
    let fpath = await nextFileName('fileio_test_stream_write_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let ss = fileio.createStreamSync(fpath, 'r+');
      expect(ss !== null).assertTrue();
      expect(ss.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      ss.closeSync();
      fileio.unlinkSync(fpath);
    } catch (err) {
      console.info('fileio_test_stream_write_sync_000 has failed for ' + err);
      expect(null).assertFail();
    }
  });
});}
