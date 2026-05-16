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

export default function fileIOCreateStream() {
describe('fileIO_fs_createStream', function () {

  /**
   * @tc.name   fileIO_test_create_stream_sync_000
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0000
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_000', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r');

    try {
      expect(sr !== null).assertTrue();
      expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      sr.writeSync(FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_create_stream_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_001
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0100
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_001', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_001');

    try {
      fileIO.createStreamSync(fpath, 'r');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_002
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0200
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_002', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      expect(sr.writeSync(FILE_CONTENT, { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_003
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0300
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_003', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_003');

    try {
      fileIO.createStreamSync(fpath, 'r+');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_004
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0400
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_004', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.createStreamSync(fpath, 'ohos');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.unlinkSync(fpath);
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_005
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0500
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_005', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_005');

    try {
      fileIO.createStreamSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_006
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0600
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_006', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sw = fileIO.createStreamSync(fpath, 'w');

    try {
      expect(sw !== null).assertTrue();
      expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sw.readSync(new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      sw.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_create_stream_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_007
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0700
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_007', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sw = fileIO.createStreamSync(fpath, 'w');
      expect(sw !== null).assertTrue();
      expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sw.closeSync();

      let sr = fileIO.createStreamSync(fpath, 'r');
      expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_008
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0800
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_008', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_008');

    try {
      let sw = fileIO.createStreamSync(fpath, 'w');
      expect(sw !== null).assertTrue();
      expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sw.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_009
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_0900
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_009', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sw = fileIO.createStreamSync(fpath, 'w+');
      expect(sw !== null).assertTrue();
      expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(sw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      sw.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_010
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1000
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_010', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_010');

    try {
      let sw = fileIO.createStreamSync(fpath, 'w+');
      expect(sw !== null).assertTrue();
      expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(sw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      sw.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_011
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1100
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_011', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sa = fileIO.createStreamSync(fpath, 'a');
      expect(sa !== null).assertTrue();
      expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sa.closeSync();

      let sr = fileIO.createStreamSync(fpath, 'r');
      expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length * 2).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_012
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1200
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_012', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_012');

    try {
      let sa = fileIO.createStreamSync(fpath, 'a');
      expect(sa !== null).assertTrue();
      expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sa.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_013
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1300
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_013', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sa = fileIO.createStreamSync(fpath, 'a');

    try {
      expect(sa !== null).assertTrue();
      expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sa.readSync(new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      sa.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_create_stream_sync_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_014
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1400
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_014', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sa = fileIO.createStreamSync(fpath, 'a+');
      expect(sa !== null).assertTrue();
      expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(sa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
      sa.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_sync_015
   * @tc.number SUB_DF_FILEIO_STREAM_CREATESTREAM_SYNC_1500
   * @tc.desc   Test createStreamSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_sync_015', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_create_stream_sync_015');

    try {
      let sa = fileIO.createStreamSync(fpath, 'a+');
      expect(sa !== null).assertTrue();
      expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(sa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      sa.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_create_stream_sync_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_000
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0000
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_000', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = await fileIO.createStream(fpath, 'r');

    try {
      expect(sr !== null).assertTrue();
      expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      sr.writeSync(FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_create_stream_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_001
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0100
   * @tc.desc   Test createStream() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_001', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.createStream(fpath, 'r', (err, sr) => {
        if (err) {
          console.log('fileIO_test_create_stream_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(sr !== null).assertTrue();
        expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        sr.write(FILE_CONTENT, (err) => {
          if (err) {
            sr.closeSync();
            fileIO.unlinkSync(fpath);
            console.log(
              'fileIO_test_create_stream_async_001 error: {message: ' + err.message + ', code: ' + err.code + '}'
            );
            expect(err.code == 13900005 && err.message == 'I/O error').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
          }
        });
      });
    } catch (e) {
      console.log('fileIO_test_create_stream_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_002
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0200
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_002', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_002');

    try {
      await fileIO.createStream(fpath, 'r');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_003
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0300
   * @tc.desc   Test createStream() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_003', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_003');

    try {
      fileIO.createStream(fpath, 'r', (err) => {
        if (err) {
          console.log('fileIO_test_create_stream_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_create_stream_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_004
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0400
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_004', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = await fileIO.createStream(fpath, 'r+');
      expect(sr !== null).assertTrue();
      expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      expect(sr.writeSync(FILE_CONTENT, { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_005
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0500
   * @tc.desc   Test createStream() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_005', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.createStream(fpath, 'r+', (err, sr) => {
        if (err) {
          console.log('fileIO_test_create_stream_async_005 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(sr !== null).assertTrue();
        expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        expect(sr.writeSync(FILE_CONTENT, { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_create_stream_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_006
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0600
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_006', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_006');

    try {
      await fileIO.createStream(fpath, 'r+');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_007
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0700
   * @tc.desc   Test createStream() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_007', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_007');

    try {
      fileIO.createStream(fpath, 'r+', (err) => {
        console.log('fileIO_test_create_stream_async_007 error: {message: ' + err.message + ', code: ' + err.code + '}');
        expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_test_create_stream_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_008
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0800
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_008', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_008');

    try {
      await fileIO.createStream(fpath, 'ohos');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_009
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_0900
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_009', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_009');

    try {
      await fileIO.createStream(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });


  /**
   * @tc.name   fileIO_test_create_stream_async_010
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1000
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_010', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sw = await fileIO.createStream(fpath, 'w');
      expect(sw !== null).assertTrue();
      expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sw.closeSync();

      let sr = fileIO.createStreamSync(fpath, 'r');
      expect(sr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_011
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1100
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_011', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_011');
    let sw = await fileIO.createStream(fpath, 'w');

    try {
      expect(sw !== null).assertTrue();
      expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sw.readSync(new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      sw.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_create_stream_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_012
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1200
   * @tc.desc   Test createStream() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_012', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_012');

    try {
      fileIO.createStream(fpath, 'w', (err, sw) => {
        if (err) {
          console.log('fileIO_test_create_stream_async_012 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sw.read(new ArrayBuffer(4096), (err) => {
          if (err) {
            sw.closeSync();
            fileIO.unlinkSync(fpath);
            console.log(
              'fileIO_test_create_stream_async_012 error: {message: ' + err.message + ', code: ' + err.code + '}'
            );
            expect(err.code == 13900005 && err.message == 'I/O error').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
          }
        });
      });
    } catch (e) {
      console.log('fileIO_test_create_stream_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_013
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1300
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_013', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sw = await fileIO.createStream(fpath, 'w+');
      expect(sw !== null).assertTrue();
      expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(sw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      sw.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_014
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1400
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_014', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_014');

    try {
      let sw = await fileIO.createStream(fpath, 'w+');
      expect(sw !== null).assertTrue();
      expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(sw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      sw.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_015
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1500
   * @tc.desc   Test createStream() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_015', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.createStream(fpath, 'w+', (err, sw) => {
        if (err) {
          console.log('fileIO_test_create_stream_async_015 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(sw !== null).assertTrue();
        expect(sw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        sw.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_create_stream_async_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_016
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1600
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_016', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sa = await fileIO.createStream(fpath, 'a');
      expect(sa !== null).assertTrue();
      expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sa.closeSync();

      let sr = fileIO.createStreamSync(fpath, 'r');
      expect(sr.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_017
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1700
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_017', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_017');
    let sa = await fileIO.createStream(fpath, 'a');

    try {
      expect(sa !== null).assertTrue();
      expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      sa.readSync(new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      sa.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_create_stream_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_018
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1800
   * @tc.desc   Test createStream() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_018', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_018');
    
    try {
      fileIO.createStream(fpath, 'a', (err, sa) => {
        if (err) {
          console.log('fileIO_test_create_stream_async_018 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        sa.read(new ArrayBuffer(4096), (err) => {
          if (err) {
            sa.closeSync();
            fileIO.unlinkSync(fpath);
            console.log(
              'fileIO_test_create_stream_async_018 error: {message: ' + err.message + ', code: ' + err.code + '}'
              );
            expect(err.code == 13900005 && err.message == 'I/O error').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
          }
        })
      });
    } catch (e) {
      console.log('fileIO_test_create_stream_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_019
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_1900
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_019', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_019');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sa = await fileIO.createStream(fpath, 'a+');
      expect(sa !== null).assertTrue();
      expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(sa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
      sa.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_019 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_020
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_2000
   * @tc.desc   Test createStream() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_020', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_019');

    try {
      let sa = await fileIO.createStream(fpath, 'a+');
      expect(sa !== null).assertTrue();
      expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(sa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      sa.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_create_stream_async_020 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_create_stream_async_021
   * @tc.number SUB_DF_FILEIO_CREATE_CREATESTREAM_ASYNC_2100
   * @tc.desc   Test createStream() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_create_stream_async_021', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_create_stream_async_021');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.createStream(fpath, 'a+', (err, sa) => {
        if (err) {
          console.log('fileIO_test_create_stream_async_021 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(sa !== null).assertTrue();
        expect(sa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(sa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
        sa.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_create_stream_async_021 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
