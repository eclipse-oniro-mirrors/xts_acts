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

export default function fileIOStreamWrite() {
describe('fileIO_fs_stream_write', function () {

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0000
   * @tc.name fileIO_test_stream_write_sync_000
   * @tc.desc Test the writeSync() interface of class Stream.
   * Create a file stream in r+ mode, writing an ArrayBuffer.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = sr.writeSync(new ArrayBuffer(4096));
      expect(bytesWritten == 4096).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_write_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0100
   * @tc.name fileIO_test_stream_write_sync_001
   * @tc.desc Test the writeSync() interface of class Stream.
   * Create a file stream in r+ mode, writing a string.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = sr.writeSync(FILE_CONTENT);
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_write_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0200
   * @tc.name fileIO_test_stream_write_sync_002
   * @tc.desc Test the writeSync() interface of class Stream.
   * Create a file stream in r+ mode, writing a string with offset = 1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_002', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = sr.writeSync(FILE_CONTENT, { offset: 1 });
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_write_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0300
   * @tc.name fileIO_test_stream_write_sync_003
   * @tc.desc Test the writeSync() interface of class Stream.
   * Write a string with invalide offset = -1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_003', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');
    const invalidOffset = -1;

    try {
      expect(sr !== null).assertTrue();
      sr.writeSync(new ArrayBuffer(4096), { offset: invalidOffset });
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_write_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0400
   * @tc.name fileIO_test_stream_write_sync_004
   * @tc.desc Test the writeSync() interface of class Stream.
   * Create a file stream in r+ mode, writing a string with encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_004', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = sr.writeSync(FILE_CONTENT, { encoding: 'utf-8' });
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_write_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0500
   * @tc.name fileIO_test_stream_write_sync_005
   * @tc.desc Test the writeSync() interface of class Stream.
   * Create a file stream in r+ mode, writing a string with length = 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_005', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = sr.writeSync(FILE_CONTENT, { length: 5 });
      expect(bytesWritten == 5).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_write_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0600
   * @tc.name fileIO_test_stream_write_sync_006
   * @tc.desc Test the writeSync() interface of class Stream.
   * Write an ArrayBuffer with invalid length > size of ArrayBuffer(4096).
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_006', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      const invalidLength = 4097;
      sr.writeSync(new ArrayBuffer(4096), { length: invalidLength });
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_write_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0700
   * @tc.name fileIO_test_stream_write_sync_007
   * @tc.desc Test the writeSync() interface of class Stream.
   * Write a string with invalid length = 9999.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_007', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');
    const invalidLength = 9999;

    try {
      expect(sr !== null).assertTrue();
      sr.writeSync(FILE_CONTENT, { length: invalidLength });
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_write_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0800
   * @tc.name fileIO_test_stream_write_sync_008
   * @tc.desc Test the writeSync() interface of class Stream.
   * Create a file stream in r+ mode, writing an ArrayBuffer with offset = 1, length = 4096 and encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_008', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = sr.writeSync(new ArrayBuffer(4096), {
        offset: 1,
        length: 4096,
        encoding: 'utf-8'
      });
      expect(bytesWritten == 4096).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_write_sync_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_0900
   * @tc.name fileIO_test_stream_write_sync_009
   * @tc.desc Test the writeSync() interface of class Stream.
   * Create a file stream in r+ mode, writing a string with offset = 1, length = 11 and encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_009', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = sr.writeSync(FILE_CONTENT, {
        offset: 1,
        length: FILE_CONTENT.length,
        encoding: 'utf-8'
      });
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_write_sync_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_1000
   * @tc.name fileIO_test_stream_write_sync_010
   * @tc.desc Test the writeSync() interface of class Stream.
   * Create a file stream in r+ mode, writing a string with empty option.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_010', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = sr.writeSync(FILE_CONTENT, {});
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_write_sync_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_SYNC_1100
   * @tc.name fileIO_test_stream_write_sync_011
   * @tc.desc Test the writeSync() interface of class Stream.
   * There are no parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_sync_011', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_write_sync_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      sr.writeSync();
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_write_sync_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0000
   * @tc.name fileIO_test_stream_write_async_000
   * @tc.desc Test the write() interface of class Stream. Promise.
   * Create a file stream in r+ mode, writing an ArrayBuffer.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 1
   * @tc.require
   */
  it('fileIO_test_stream_write_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = await sr.write(new ArrayBuffer(4096));
      expect(bytesWritten == 4096).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_write_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0100
   * @tc.name fileIO_test_stream_write_async_001
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Create a file stream in r+ mode, writing an ArrayBuffer.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 1
   * @tc.require
   */
  it('fileIO_test_stream_write_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(new ArrayBuffer(4096), (err, bytesWritten) => {
        if (err) {
          console.log('fileIO_test_stream_write_async_001 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_write_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0200
   * @tc.name fileIO_test_stream_write_async_002
   * @tc.desc Test the write() interface of class Stream. Promise.
   * Create a file stream in r+ mode, writing a string.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = await sr.write(FILE_CONTENT);
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_write_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0300
   * @tc.name fileIO_test_stream_write_async_003
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Create a file stream in r+ mode, writing a string.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(FILE_CONTENT, (err, bytesWritten) => {
        if (err) {
          console.log('fileIO_test_stream_write_async_003 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_write_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0400
   * @tc.name fileIO_test_stream_write_async_004
   * @tc.desc Test the write() interface of class Stream. Promise.
   * Create a file stream in r+ mode, writing a string with offset = 1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = await sr.write(FILE_CONTENT, { offset: 1 });
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_write_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0500
   * @tc.name fileIO_test_stream_write_async_005
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Create a file stream in r+ mode, writing a string with offset = 1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(FILE_CONTENT, {
        offset: 1
      }, (err, bytesWritten) => {
        if (err) {
          console.log('fileIO_test_stream_write_async_005 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_write_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0600
   * @tc.name fileIO_test_stream_write_async_006
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Write a string with invalide offset = -1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_006', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');
    const invalidOffset = -1;

    try {
      expect(sr !== null).assertTrue();
      sr.write(new ArrayBuffer(4096), {
        offset: invalidOffset
      }, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_write_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0700
   * @tc.name fileIO_test_stream_write_async_007
   * @tc.desc Test the write() interface of class Stream. Promise.
   * Create a file stream in r+ mode, writing a string with encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_007', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = await sr.write(FILE_CONTENT, { encoding: 'utf-8' });
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_write_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0800
   * @tc.name fileIO_test_stream_write_async_008
   * @tc.desc Test the write() interface of class Stream. Promise.
   * Create a file stream in r+ mode, writing a string with encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_008', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(FILE_CONTENT, {
        encoding: 'utf-8'
      }, (err, bytesWritten) => {
        if (err) {
          console.log('fileIO_test_stream_write_async_008 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_write_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_0900
   * @tc.name fileIO_test_stream_write_async_009
   * @tc.desc Test the write() interface of class Stream. Promise.
   * Create a file stream in r+ mode, writing a string with length = 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_009', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = await sr.write(FILE_CONTENT, { length: 5 });
      expect(bytesWritten == 5).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_write_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1000
   * @tc.name fileIO_test_stream_write_async_010
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Create a file stream in r+ mode, writing a string with length = 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_010', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(FILE_CONTENT, {
        length: 5
      }, (err, bytesWritten) => {
        if (err) {
          console.log('fileIO_test_stream_write_async_010 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == 5).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_write_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1100
   * @tc.name fileIO_test_stream_write_async_011
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Write an ArrayBuffer with invalid length > size of ArrayBuffer(4096).
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_011', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');
    const invalidLength = 4097;

    try {
      expect(sr !== null).assertTrue();
      sr.write(new ArrayBuffer(4096), {
        length: invalidLength
      }, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_write_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1200
   * @tc.name fileIO_test_stream_write_async_012
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Write a string with invalid length = 9999.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_012', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');
    const invalidLength = 9999;

    try {
      expect(sr !== null).assertTrue();
      sr.write(FILE_CONTENT, {
        length: invalidLength
      }, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_write_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1300
   * @tc.name fileIO_test_stream_write_async_013
   * @tc.desc Test the write() interface of class Stream. Promise.
   * Create a file stream in r+ mode, writing an ArrayBuffer with offset = 1, length = 4096 and encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_013', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = await sr.write(new ArrayBuffer(4096), {
        offset: 1,
        length: 4096,
        encoding: 'utf-8'
      });
      expect(bytesWritten == 4096).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_write_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1400
   * @tc.name fileIO_test_stream_write_async_014
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Create a file stream in r+ mode, writing an ArrayBuffer with offset = 1, length = 4096 and encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_014', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(new ArrayBuffer(4096), {
        offset: 1,
        length: 4096,
        encoding: 'utf-8'
      }, (err, bytesWritten) => {
        if (err) {
          console.log('fileIO_test_stream_write_async_014 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == 4096).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_write_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1500
   * @tc.name fileIO_test_stream_write_async_015
   * @tc.desc Test the write() interface of class Stream. Promise.
   * Create a file stream in r+ mode, writing a string with offset = 1, length = 4096 and encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_015', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = await sr.write(FILE_CONTENT, {
        offset: 1,
        length: FILE_CONTENT.length,
        encoding: 'utf-8'
      });
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_write_async_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1600
   * @tc.name fileIO_test_stream_write_async_016
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Create a file stream in r+ mode, writing a string with offset = 1, length = 4096 and encoding = 'utf-8'.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_016', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(FILE_CONTENT, {
        offset: 1,
        length: FILE_CONTENT.length,
        encoding: 'utf-8'
      }, (err, bytesWritten) => {
        if (err) {
          console.log('fileIO_test_stream_write_async_016 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_write_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1700
   * @tc.name fileIO_test_stream_write_async_017
   * @tc.desc Test the write() interface of class Stream. Promise.
   * Create a file stream in r+ mode, writing a string with empty option.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_017', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_017');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let bytesWritten = await sr.write(FILE_CONTENT, {});
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_write_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1800
   * @tc.name fileIO_test_stream_write_async_018
   * @tc.desc Test the write() interface of class Stream. Callback.
   * Create a file stream in r+ mode, writing a string with empty option.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_write_async_018', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_018');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.write(FILE_CONTENT, {
      }, (err, bytesWritten) => {
        if (err) {
          console.log('fileIO_test_stream_write_async_018 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_write_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_WRITE_ASYNC_1900
   * @tc.name fileIO_test_stream_write_async_019
   * @tc.desc Test the write() interface of class Stream. Promise.
   * There are no parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_test_stream_write_async_019', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_write_async_019');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      await sr.write();
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_write_async_019 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
})
}
