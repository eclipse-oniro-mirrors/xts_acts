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

export default function fileIOStreamRead() {
describe('fileIO_fs_stream_read', function () {

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0000
   * @tc.name fileIO_test_stream_read_sync_000
   * @tc.desc Test the readSync() interface of class Stream.
   * Create a file stream in r+ mode, reading data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_stream_read_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_read_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen = sr.readSync(new ArrayBuffer(4096));
      expect(readLen == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_read_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0100
   * @tc.name fileIO_test_stream_read_sync_001
   * @tc.desc Test the readSync() interface of class Stream.
   * Create a file stream in r+ mode, reading data with length = 2.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_read_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen =  sr.readSync(new ArrayBuffer(4096), { length: 2 });
      expect(readLen == 2).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_read_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0200
   * @tc.name fileIO_test_stream_read_sync_002
   * @tc.desc Test the readSync() interface of class Stream.
   * Create a file stream in r+ mode, reading data with offset = 2.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_sync_002', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_read_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen =  sr.readSync(new ArrayBuffer(4096), { offset: 2 });
      expect(readLen == FILE_CONTENT.length - 2).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_read_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0300
   * @tc.name fileIO_test_stream_read_sync_003
   * @tc.desc Test the readSync() interface of class Stream.
   * Create a file stream in r+ mode, reading data with offset = 1 and length = 11.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_sync_003', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_read_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen = sr.readSync(new ArrayBuffer(4096), {
        offset: 1,
        length: FILE_CONTENT.length
      });
      expect(readLen == FILE_CONTENT.length - 1).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_stream_read_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0400
   * @tc.name fileIO_test_stream_read_sync_004
   * @tc.desc Test the readSync() interface of class Stream.
   * Read data with invalid type of parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_sync_004', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_read_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      sr.readSync("");
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_read_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0500
   * @tc.name fileIO_test_stream_read_sync_005
   * @tc.desc Test the readSync() interface of class Stream.
   * Read data with invalid length > size of ArrayBuffer(4096).
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_sync_005', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_read_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');
    const invalidLength = 4097;

    try {
      expect(sr !== null).assertTrue();
      sr.readSync(new ArrayBuffer(4096), { length: invalidLength });
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_read_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_SYNC_0600
   * @tc.name fileIO_test_stream_read_sync_006
   * @tc.desc Test the readSync() interface of class Stream.
   * Read data with invalid offset = -1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_sync_006', 0, async function () {
    let fpath = await nextFileName('fileIO_test_stream_read_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');
    const invalidOffset = -1;

    try {
      expect(sr !== null).assertTrue();
      sr.readSync(new ArrayBuffer(4096), { offset: invalidOffset });
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_read_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0000
   * @tc.name fileIO_test_stream_read_async_000
   * @tc.desc Test read() interface, Promise.
   * Create a file stream in r+ mode, reading data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 1
   * @tc.require
   */
  it('fileIO_test_stream_read_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen = await sr.read(new ArrayBuffer(4096));
      expect(readLen == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_read_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0100
   * @tc.name fileIO_test_stream_read_async_001
   * @tc.desc Test read() interface, Callback.
   * Create a file stream in r+ mode, reading data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 1
   * @tc.require
   */
  it('fileIO_test_stream_read_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.read(new ArrayBuffer(4096), (err, readLen) => {
        if (err) {
          console.log('fileIO_test_stream_read_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(readLen == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_read_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0200
   * @tc.name fileIO_test_stream_read_async_002
   * @tc.desc Test the read() interface of class Stream. Promise.
   * Create a file stream in r+ mode, reading data with length = 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_test_stream_read_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen = await sr.read(new ArrayBuffer(4096), {
        length: 5
      });
      expect(readLen == 5).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_read_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0300
   * @tc.name fileIO_test_stream_read_async_003
   * @tc.desc Test the read() interface of class Stream. Callback.
   * Create a file stream in r+ mode, reading data with length = 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.read(new ArrayBuffer(4096), {
        length: 5
      }, (err, readLen) => {
        if (err) {
          console.log('fileIO_test_stream_read_async_003 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(readLen == 5).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_read_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0400
   * @tc.name fileIO_test_stream_read_async_004
   * @tc.desc Test the read() interface of class Stream. Promise.
   * Create a file stream in r+ mode, reading data with offset = 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_test_stream_read_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen = await sr.read(new ArrayBuffer(4096), {
        offset: 5
      });
      expect(readLen == FILE_CONTENT.length - 5).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_read_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0500
   * @tc.name fileIO_test_stream_read_async_005
   * @tc.desc Test the read() interface of class Stream. Callback.
   * Create a file stream in r+ mode, reading data with offset = 5.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.read(new ArrayBuffer(4096), {
        offset: 5
      }, (err, readLen) => {
        if (err) {
          console.log('fileIO_test_stream_read_async_005 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(readLen == FILE_CONTENT.length - 5).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_read_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0600
   * @tc.name fileIO_test_stream_read_async_006
   * @tc.desc Test the read() interface of class Stream. Promise.
   * Read data with invalid length > size of ArrayBuffer(4096).
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_test_stream_read_async_006', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      const invalidLength = 4097;
      await sr.read(new ArrayBuffer(4096), { length: invalidLength });
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_read_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0700
   * @tc.name fileIO_test_stream_read_async_007
   * @tc.desc Test the read() interface of class Stream. Callback.
   * Read data with invalid offset = -1.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_test_stream_read_async_007', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      const invalidOffset = -1;
      sr.read(new ArrayBuffer(4096), {
        offset: invalidOffset
      }, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_read_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0800
   * @tc.name fileIO_test_stream_read_async_008
   * @tc.desc Test the read() interface of class Stream. Promise.
   * Create a file stream in r+ mode, reading data with offset = 1 and length = 11.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_async_008', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen = await sr.read(new ArrayBuffer(4096), {
        offset: 1,
        length: FILE_CONTENT.length
      });
      expect(readLen == FILE_CONTENT.length - 1).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_read_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_0900
   * @tc.name fileIO_test_stream_read_async_009
   * @tc.desc Test the read() interface of class Stream. Callback.
   * Create a file stream in r+ mode, reading data with offset = 1 and length = 11.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_async_009', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.read(new ArrayBuffer(4096), {
        offset: 1,
        length: FILE_CONTENT.length
      }, (err, readLen) => {
        if (err) {
          console.log('fileIO_test_stream_read_async_009 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(readLen == FILE_CONTENT.length - 1).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_read_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1000
   * @tc.name fileIO_test_stream_read_async_010
   * @tc.desc Test the read() interface of class Stream. Promise.
   * Create a file stream in r+ mode, reading data with empty option.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_async_010', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      let readLen = await sr.read(new ArrayBuffer(4096), {});
      expect(readLen == FILE_CONTENT.length).assertTrue();
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_stream_read_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1100
   * @tc.name fileIO_test_stream_read_async_011
   * @tc.desc Test the read() interface of class Stream. Callback.
   * Create a file stream in r+ mode, reading data with empty option.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_async_011', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let sr = fileIO.createStreamSync(fpath, 'r+');
      expect(sr !== null).assertTrue();
      sr.read(new ArrayBuffer(4096), {
      }, (err, readLen) => {
        if (err) {
          console.log('fileIO_test_stream_read_async_011 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(readLen == FILE_CONTENT.length).assertTrue();
        sr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_stream_read_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

    /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1200
   * @tc.name fileIO_test_stream_read_async_012
   * @tc.desc Test the read() interface of class Stream. Promise. Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_async_012', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      await sr.read();
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_read_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1300
   * @tc.name fileIO_test_stream_read_async_013
   * @tc.desc Test the read() interface of class Stream. Promise.
   * Read data with invalid type of parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_async_013', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      await sr.read("");
      expect(false).assertTrue();
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_read_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_STREAM_READ_ASYNC_1400
   * @tc.name fileIO_test_stream_read_async_014
   * @tc.desc Test the read() interface of class Stream. Callback.
   * Read data with invalid type of parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_stream_read_async_014', 0, async function (done) {
    let fpath = await nextFileName('fileIO_test_stream_read_async_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let sr = fileIO.createStreamSync(fpath, 'r+');

    try {
      expect(sr !== null).assertTrue();
      sr.read("", (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      sr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_stream_read_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
});
}