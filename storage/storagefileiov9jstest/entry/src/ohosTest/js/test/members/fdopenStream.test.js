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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, describe, it, expect,
} from '../Common';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOFdOpenStream() {
describe('fileIO_fs_FdOpenStream', async function () {

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0000
   * @tc.name fileIO_test_fdopenstream_sync_000
   * @tc.desc Test fdopenStreamSync() interface.
   * Create a file stream in 'r' mode and read data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    expect(isIntNum(file.fd)).assertTrue();
    let fpr = fileIO.fdopenStreamSync(file.fd, 'r');

    try {
      expect(fpr !== null).assertTrue();
      expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      fpr.writeSync(FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      fpr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0010
   * @tc.name fileIO_test_fdopenstream_sync_001
   * @tc.desc Test fdopenStreamSync() interface.
   * Invalid file descriptor.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

    try {
      fileIO.fdopenStreamSync(-1, 'r');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fdopenstream_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0200
   * @tc.name fileIO_test_fdopenstream_sync_002
   * @tc.desc Test fdopenStreamSync() interface.
   * Create a file stream in 'r+' mode, reading and writing data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    
    try {
      expect(isIntNum(file.fd)).assertTrue();
      let fpr = fileIO.fdopenStreamSync(file.fd, 'r+');
      expect(fpr !== null).assertTrue();
      expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      expect(fpr.writeSync(FILE_CONTENT, { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      fpr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_fdopenstream_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0300
   * @tc.name fileIO_test_fdopenstream_sync_003
   * @tc.desc Test fdopenStreamSync() interface.
   * Invalid file descriptor.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {

    try {
      fileIO.fdopenStreamSync(-1, 'r+');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fdopenstream_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0400
   * @tc.name fileIO_test_fdopenstream_sync_004
   * @tc.desc Test fdopenStreamSync() interface.
   * Invalid mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.fdopenStreamSync(file.fd, 'ohos');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0500
   * @tc.name fileIO_test_fdopenstream_sync_005
   * @tc.desc Test fdopenStreamSync() interface.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.fdopenStreamSync(file.fd);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0600
   * @tc.name fileIO_test_fdopenstream_sync_006
   * @tc.desc Test fdopenStreamSync() interface.
   * Create a file stream in 'w' mode, writing data to file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    expect(isIntNum(file.fd)).assertTrue();
    let fpw = fileIO.fdopenStreamSync(file.fd, 'w');

    try {
      expect(fpw !== null).assertTrue();
      expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fpw.readSync(new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      fpw.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0700
   * @tc.name fileIO_test_fdopenstream_sync_007
   * @tc.desc Test fdopenStreamSync() interface.
   * Create a file stream in 'w' mode and empty contents.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      let file1 = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file1.fd)).assertTrue();
      let fpw = fileIO.fdopenStreamSync(file1.fd, 'w');
      expect(fpw !== null).assertTrue();
      expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fpw.closeSync();

      let file2 = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);
      let fpr = fileIO.fdopenStreamSync(file2.fd, 'r');
      expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      fpr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_fdopenstream_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0800
   * @tc.name fileIO_test_fdopenstream_sync_008
   * @tc.desc Test fdopenStreamSync() interface.
   * Create a file stream in 'w+' mode and empty contents.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    
    try {
      expect(isIntNum(file.fd)).assertTrue();
      let fpw = fileIO.fdopenStreamSync(file.fd, 'w+');
      expect(fpw !== null).assertTrue();
      expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(fpw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      fpw.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_fdopenstream_sync_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0900
   * @tc.name fileIO_test_fdopenstream_sync_009
   * @tc.desc Test fdopenStreamSync() interface.
   * Create a file stream in 'a' mode and append contents.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file1 = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file1.fd)).assertTrue();
      let fpa = fileIO.fdopenStreamSync(file1.fd, 'a');
      expect(fpa !== null).assertTrue();
      expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fpa.closeSync();

      let file2 = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fpr = fileIO.fdopenStreamSync(file2.fd, 'r');
      expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length * 2).assertTrue();
      fpr.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_fdopenstream_sync_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0100
   * @tc.name fileIO_test_fdopenstream_sync_010
   * @tc.desc Test fdopenStreamSync() interface.
   * Create a file stream in 'a' mode and write data to file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    expect(isIntNum(file.fd)).assertTrue();
    let fpa = fileIO.fdopenStreamSync(file.fd, 'a');

    try {
      expect(fpa !== null).assertTrue();
      expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fpa.readSync(new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      fpa.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_sync_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_0110
   * @tc.name fileIO_test_fdopenstream_sync_011
   * @tc.desc Test fdopenStreamSync() interface.
   * Create a file stream in 'a+' mode and append contents.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      let fpa = fileIO.fdopenStreamSync(file.fd, 'a+');
      expect(fpa !== null).assertTrue();
      expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(fpa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
      fpa.closeSync();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_fdopenstream_sync_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_SYNC_1200
   * @tc.name fileIO_test_fdopenstream_sync_012
   * @tc.desc Test fdopenStreamSync() interface.
   * Bad file descriptor.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_sync_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdopenstream_sync_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.closeSync(file.fd);
      fileIO.fdopenStreamSync(file.fd, 'r');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_sync_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0000
   * @tc.name fileIO_test_fdopenstream_async_000
   * @tc.desc Test fdopenStream() interface. Promise.
   * Create a file stream in 'r' mode and read data from stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let fpr = await fileIO.fdopenStream(file.fd, 'r');

    try {
      expect(isIntNum(file.fd)).assertTrue();
      expect(fpr !== null).assertTrue();
      expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
      fpr.writeSync(FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      fpr.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0100
   * @tc.name fileIO_test_fdopenstream_async_001
   * @tc.desc Test fdopenStream() interface. Callback.
   * Create a file stream in 'r' mode and read data from stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    
    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.fdopenStream(file.fd, 'r', (err, fpr) => {
        if (err) {
          console.log('fileIO_test_fdopenstream_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fpr !== null).assertTrue();
        expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length).assertTrue();
        fpr.write(FILE_CONTENT, (err) => {
          if (err) {
            fpr.closeSync();
            fileIO.unlinkSync(fpath);
            console.log(
              'fileIO_test_fdopenstream_async_001 error: {message: ' + err.message + ', code: ' + err.code + '}'
            );
            expect(err.code == 13900005 && err.message == 'I/O error').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
          }
        });
      });
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0200
   * @tc.name fileIO_test_fdopenstream_async_002
   * @tc.desc Test fdopenStream() interface.
   * Invalid file descriptor.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      await fileIO.fdopenStream(-1, 'r');
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0300
   * @tc.name fileIO_test_fdopenstream_async_003
   * @tc.desc Test fdopenStream() interface.
   * Invalid file descriptor.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {

    try {
      fileIO.fdopenStream(-1, 'r', (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0400
   * @tc.name fileIO_test_fdopenstream_async_004
   * @tc.desc Test fdopenStream() interface. Promise.
   * Create a file stream in 'r+' mode, reading and writing data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 1
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      let fpr = await fileIO.fdopenStream(file.fd, 'r+');
      expect(fpr !== null).assertTrue();
      expect(fpr.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(fpr.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      fpr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0500
   * @tc.name fileIO_test_fdopenstream_async_005
   * @tc.desc Test fdopenStream() interface. Callback.
   * Create a file stream in 'r+' mode, reading and writing data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 1
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.fdopenStream(file.fd, 'r+', (err, fpr) => {
        if (err) {
          console.log('fileIO_test_fdopenstream_async_005 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fpr !== null).assertTrue();
        expect(fpr.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(fpr.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        fpr.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0600
   * @tc.name fileIO_test_fdopenstream_async_006
   * @tc.desc Test fdopenStream() interface. Promise.
   * Invalid mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await fileIO.fdopenStream(file.fd, 'ohos');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0700
   * @tc.name fileIO_test_fdopenstream_async_007
   * @tc.desc Test fdopenStream() interface. Promise.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await fileIO.fdopenStream(file.fd);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0800
   * @tc.name fileIO_test_fdopenstream_async_008
   * @tc.desc Test fdopenStream() interface. Promise.
   * Create a file stream in 'w' mode, can't to read data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    expect(isIntNum(file.fd)).assertTrue();
    let fpw = await fileIO.fdopenStream(file.fd, 'w');

    try {
      expect(fpw !== null).assertTrue();
      expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fpw.readSync(new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      fpw.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_0900
   * @tc.name fileIO_test_fdopenstream_async_009
   * @tc.desc Test fdopenStream() interface. Callback.
   * Create a file stream in 'w' mode, can't to read data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    
    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.fdopenStream(file.fd, 'w', (err, fpw) => {
        if (err) {
          console.log('fileIO_test_fdopenstream_async_009 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fpw !== null).assertTrue();
        expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpw.read(new ArrayBuffer(4096), (err) => {
          if (err) {
            fpw.closeSync();
            fileIO.unlinkSync(fpath);
            console.log(
              'fileIO_test_fdopenstream_async_009 error: {message: ' + err.message + ', code: ' + err.code + '}'
            );
            expect(err.code == 13900005 && err.message == 'I/O error').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
          }
        });
      });
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1000
   * @tc.name fileIO_test_fdopenstream_async_010
   * @tc.desc Test fdopenStream() interface. Promise.
   * Create a file stream in 'w' mode and write data to file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file1 = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fpw = await fileIO.fdopenStream(file1.fd, 'w');
      expect(fpw !== null).assertTrue();
      expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fpw.closeSync();

      let file2 = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fpr = await fileIO.fdopenStream(file2.fd, 'r');
      expect(fpr.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      fpr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1100
   * @tc.name fileIO_test_fdopenstream_async_011
   * @tc.desc Test fdopenStream() interface. Promise.
   * Create a file stream in 'w+' mode and write/read data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    
    try {
      expect(isIntNum(file.fd)).assertTrue();
      let fpw = await fileIO.fdopenStream(file.fd, 'w+');
      expect(fpw !== null).assertTrue();
      expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(fpw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
      fpw.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1200
   * @tc.name fileIO_test_fdopenstream_async_012
   * @tc.desc Test fdopenStream() interface. Callback.
   * Create a file stream in 'w+' mode and write/read data from this stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    
    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.fdopenStream(file.fd, 'w+', (err, fpw) => {
        if (err) {
          console.log('fileIO_test_fdopenstream_async_012 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fpw !== null).assertTrue();
        expect(fpw.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(fpw.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length).assertTrue();
        fpw.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1300
   * @tc.name fileIO_test_fdopenstream_async_013
   * @tc.desc Test fdopenStream() interface. Promise.
   * Create a file stream in 'a' mode and append content to file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file1 = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fpa = await fileIO.fdopenStream(file1.fd, 'a');
      expect(fpa !== null).assertTrue();
      expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fpa.closeSync();

      let file2 = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fpr = await fileIO.fdopenStream(file2.fd, 'r');
      expect(fpr.readSync(new ArrayBuffer(4096)) == FILE_CONTENT.length * 2).assertTrue();
      fpr.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1400
   * @tc.name fileIO_test_fdopenstream_async_014
   * @tc.desc Test fdopenStream() interface. Promise.
   * Create a file stream in 'a' mode and can't to read data from stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    expect(isIntNum(file.fd)).assertTrue();
    let fpa = await fileIO.fdopenStream(file.fd, 'a');

    try {
      expect(fpa !== null).assertTrue();
      expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      fpa.readSync(new ArrayBuffer(4096));
      expect(false).assertTrue();
    } catch (e) {
      fpa.closeSync();
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900005 && e.message == 'I/O error').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1500
   * @tc.name fileIO_test_fdopenstream_async_015
   * @tc.desc Test fdopenStream() interface. Callback.
   * Create a file stream in 'a' mode and can't to read data from stream.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    expect(isIntNum(file.fd)).assertTrue();
    
    try {
      fileIO.fdopenStream(file.fd, 'a', (err, fpa) => {
        if (err) {
          console.log('fileIO_test_fdopenstream_async_015 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fpa !== null).assertTrue();
        expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        fpa.read(new ArrayBuffer(4096), (err) => {
          if (err) {
            fpa.closeSync();
            fileIO.unlinkSync(fpath);
            console.log(
              'fileIO_test_fdopenstream_async_015 error: {message: ' + err.message + ', code: ' + err.code + '}'
            );
            expect(err.code == 13900005 && err.message == 'I/O error').assertTrue();
            done();
          } else {
            expect(false).assertTrue();
          }
        });
      });
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1600
   * @tc.name fileIO_test_fdopenstream_async_016
   * @tc.desc Test fdopenStream() interface. Promise.
   * Create a file stream in 'a+' mode and append content to file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      let fpa = await fileIO.fdopenStream(file.fd, 'a+');
      expect(fpa !== null).assertTrue();
      expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
      expect(fpa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
      fpa.closeSync();
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1700
   * @tc.name fileIO_test_fdopenstream_async_017
   * @tc.desc Test fdopenStream() interface. Callback.
   * Create a file stream in 'a+' mode and append content to file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_017');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.fdopenStream(file.fd, 'a+', (err, fpa) => {
        if (err) {
          console.log('fileIO_test_fdopenstream_async_017 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fpa !== null).assertTrue();
        expect(fpa.writeSync(FILE_CONTENT) == FILE_CONTENT.length).assertTrue();
        expect(fpa.readSync(new ArrayBuffer(4096), { offset: 0 }) == FILE_CONTENT.length * 2).assertTrue();
        fpa.closeSync();
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1800
   * @tc.name fileIO_test_fdopenstream_async_018
   * @tc.desc Test fdopenStream() interface. Promise.
   * Invalid mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_fdopenstream_async_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_018');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.closeSync(file.fd);
      await fileIO.fdopenStream(file.fd, 'r');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_fdopenstream_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

   /**
   * @tc.number SUB_DF_FILEIO_FDOPENSTREAM_ASYNC_1900
   * @tc.name fileIO_test_fdopenstream_async_019
   * @tc.desc Test fdopenStream() interface. Callback.
   * Bad file descriptor.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_test_fdopenstream_async_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdopenstream_async_019');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    expect(isIntNum(file.fd)).assertTrue();
    
    try {
      fileIO.closeSync(file.fd);
      fileIO.fdopenStream(file.fd, 'a', (err) => {
        if (err) {
          console.log('fileIO_test_fdopenstream_async_019 error package: ' + + err.message + ', code: ' + err.code);
          expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_fdopenstream_async_019 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
