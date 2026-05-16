/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { Level } from '@ohos/hypium';

export default function fileIOWrite() {
  describe('fileIO_fs_write', function () {

  /**
   * @tc.name   fileIO_test_write_sync_000
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0000
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten1 = fileIO.writeSync(file.fd, FILE_CONTENT);
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = fileIO.writeSync(file.fd, new ArrayBuffer(FILE_CONTENT.length));
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_001
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0100
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_sync_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = fileIO.writeSync(file.fd, FILE_CONTENT, {
        encoding: 'utf-8',
      })
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_002
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0200
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_sync_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = fileIO.writeSync(file.fd, FILE_CONTENT, {
        offset: 1,
      });
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_003
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0300
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_sync_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = fileIO.writeSync(file.fd, FILE_CONTENT, {
        length: 1,
      });
      expect(bytesWritten == 1).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_write_sync_004
    * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0400
    * @tc.desc   Test writeSync() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_sync_004', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = fileIO.writeSync(file.fd, FILE_CONTENT, {
        offset: 1,
        length: 1,
      });
      expect(bytesWritten == 1).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_write_sync_005
    * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0500
    * @tc.desc   Test writeSync() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_sync_005', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = fileIO.writeSync(file.fd, FILE_CONTENT, {
        offset: 1,
        length: 5,
        encoding: 'utf-8',
      });
      expect(bytesWritten == 5).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_006
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0600
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_sync_006', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
    const invalidLength = 9999;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.writeSync(file.fd, FILE_CONTENT, { length: invalidLength })
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_write_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_007
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0700
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_sync_007', Level.LEVEL0, function () {

    try {
      fileIO.writeSync(-1, FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_write_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_008
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0800
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_sync_008', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = fileIO.writeSync(file.fd, new ArrayBuffer(4096));
      expect(bytesWritten == 4096).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_009
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_0900
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_sync_009', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
    const invalidLength = 4097;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.writeSync(file.fd, new ArrayBuffer(4096), { length: invalidLength })
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_write_sync_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_010
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_1000
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_sync_010', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
    const invalidOffset = -1;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.writeSync(file.fd, FILE_CONTENT, { offset: invalidOffset });
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_write_sync_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_011
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_1100
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_write_sync_011', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten1 = fileIO.writeSync(file.fd, FILE_CONTENT, undefined);
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = fileIO.writeSync(file.fd, new ArrayBuffer(FILE_CONTENT.length), undefined);
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_sync_012
   * @tc.number SUB_DF_FILEIO_WRITE_SYNC_1200
   * @tc.desc   Test writeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_write_sync_012', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_write_sync_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten1 = fileIO.writeSync(file.fd, FILE_CONTENT, {
        offset: undefined,
        length: undefined,
        encoding: undefined,
      });
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = fileIO.writeSync(file.fd, new ArrayBuffer(FILE_CONTENT.length), {
        offset: undefined,
        length: undefined,
        encoding: undefined,
      });
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_write_sync_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_000
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0000
   * @tc.desc   Test write() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten1 = await fileIO.write(file.fd, FILE_CONTENT);
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = await fileIO.write(file.fd, new ArrayBuffer(FILE_CONTENT.length));
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_001
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0100
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, (err, bytesWritten1) => {
        if (err) {
          console.log('fileIO_test_write_async_001 err package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        fileIO.write(file.fd, new ArrayBuffer(FILE_CONTENT.length), (err, bytesWritten2) => {
          if (err) {
            console.log('fileIO_test_write_async_001 err package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
          let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
          expect(readLen == FILE_CONTENT.length * 2).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        });
      });
    } catch (e) {
      console.log('fileIO_test_write_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_002
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0200
   * @tc.desc   Test write() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      await fileIO.write(file.fd, FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_write_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_003
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0300
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_003', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_ONLY);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, (err) => {
        if(err) {
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          console.log('fileIO_test_write_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_write_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_004
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0400
   * @tc.desc   Test write() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = await fileIO.write(file.fd, FILE_CONTENT, {
        length: 3,
      });
      expect(bytesWritten == 3).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_write_async_005
    * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0500
    * @tc.desc   Test write() interfaces. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_async_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, {
        length: 3,
      }, (err, bytesWritten) => {
        if(err) {
          console.log('fileIO_test_write_async_005 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == 3).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_write_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_write_async_006
    * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0600
    * @tc.desc   Test write() interfaces. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_async_006', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = await fileIO.write(file.fd, FILE_CONTENT, {
        offset: 5,
      });
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_write_async_007
    * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0700
    * @tc.desc   Test write() interfaces. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_async_007', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, {
        offset: 5,
      }, (err, bytesWritten) => {
        if(err) {
          console.log('fileIO_test_write_async_007 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == FILE_CONTENT.length).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_write_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_008
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0800
   * @tc.desc   Test write() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_008', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = await fileIO.write(file.fd, FILE_CONTENT, {
        length: 3,
        offset: 5,
      });
      expect(bytesWritten == 3).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_009
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_0900
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_009', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, {
        length: 3,
        offset: 5,
      }, (err, bytesWritten) => {
        if(err) {
          console.log('fileIO_test_write_async_009 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == 3).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_write_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_write_async_010
    * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1000
    * @tc.desc   Test write() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_async_010', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = await fileIO.write(file.fd, FILE_CONTENT, {
        length: 4,
        offset: 5,
        encoding: 'utf-8',
      });
      expect(bytesWritten == 4).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_write_async_011
    * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1100
    * @tc.desc   Test write() interfaces. Callback.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_async_011', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, {
        length: 5,
        offset: 5,
        encoding: 'utf-8',
      }, (err, bytesWritten) => {
        if(err) {
          console.log('fileIO_test_write_async_011 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == 5).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_write_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_write_async_012
    * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1200
    * @tc.desc   Test write() interfaces. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_async_012', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = await fileIO.write(file.fd, new ArrayBuffer(4096));
      expect(bytesWritten == 4096).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_013
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1300
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_013', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, new ArrayBuffer(4096), (err, bytesWritten) => {
        if(err) {
          console.log('fileIO_test_write_async_013 err package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == 4096).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_write_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_014
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1400
   * @tc.desc   Test write() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_014', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten = await fileIO.write(file.fd, FILE_CONTENT, {});
      expect(bytesWritten == FILE_CONTENT.length).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_015
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1500
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_015', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, new ArrayBuffer(4096), {
      }, (err, bytesWritten) => {
        if(err) {
          console.log('fileIO_test_write_async_015 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten == 4096).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_write_async_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_write_async_016
    * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1600
    * @tc.desc   Test write() interfaces. Promise.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_write_async_016', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_016');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.write(-1, FILE_CONTENT);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_write_async_016 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_017
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1700
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_017', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_017');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.write(-1, FILE_CONTENT, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_write_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_018
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1800
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_018', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_018');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
    const invalidLength = 9999;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, {
        length: invalidLength,
      }, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_write_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_019
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_1900
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_019', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_019');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
    const invalidLength = 4097;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, new ArrayBuffer(4096), {
        length: invalidLength,
      }, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_write_async_019 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_020
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_2000
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_write_async_020', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_020');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.WRITE_ONLY);
    const invalidOffset = -1;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, {
        offset: invalidOffset,
      }, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_write_async_020 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_021
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_2100
   * @tc.desc   Test write() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_write_async_021', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_021');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten1 = await fileIO.write(file.fd, FILE_CONTENT, undefined);
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = await fileIO.write(file.fd, new ArrayBuffer(FILE_CONTENT.length), undefined);
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_021 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_022
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_2200
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_write_async_022', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_022');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, undefined, (err, bytesWritten1) => {
        if (err) {
          console.log('fileIO_test_write_async_022 err package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        fileIO.write(file.fd, new ArrayBuffer(FILE_CONTENT.length), undefined, (err, bytesWritten2) => {
          if (err) {
            console.log('fileIO_test_write_async_022 err package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
          let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
          expect(readLen == FILE_CONTENT.length * 2).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        });
      });
    } catch (e) {
      console.log('fileIO_test_write_async_022 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_023
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_2300
   * @tc.desc   Test write() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_write_async_023', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_023');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let bytesWritten1 = await fileIO.write(file.fd, FILE_CONTENT, {
        length: undefined,
        offset: undefined,
        encoding: undefined,
      });
      expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
      let bytesWritten2 = await fileIO.write(file.fd, new ArrayBuffer(FILE_CONTENT.length), {
        length: undefined,
        offset: undefined,
        encoding: undefined,
      });
      expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
      expect(readLen == FILE_CONTENT.length * 2).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_write_async_023 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_write_async_024
   * @tc.number SUB_DF_FILEIO_WRITE_ASYNC_2400
   * @tc.desc   Test write() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_write_async_024', Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('fileIO_test_write_async_024');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.write(file.fd, FILE_CONTENT, {
        length: undefined,
        offset: undefined,
        encoding: undefined,
      }, (err, bytesWritten1) => {
        if (err) {
          console.log('fileIO_test_write_async_011 err package1: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(bytesWritten1 == FILE_CONTENT.length).assertTrue();
        fileIO.write(file.fd, new ArrayBuffer(FILE_CONTENT.length), {
          length: undefined,
          offset: undefined,
          encoding: undefined,
        }, (err, bytesWritten2) => {
          if (err) {
            console.log('fileIO_test_write_async_005 err package2: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(bytesWritten2 == FILE_CONTENT.length).assertTrue();
          let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096), { offset: 0 });
          expect(readLen == FILE_CONTENT.length * 2).assertTrue();
          fileIO.closeSync(file);
          fileIO.unlinkSync(fpath);
          done();
        });
      });
    } catch (e) {
      console.log('fileIO_test_write_async_024 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
})
}
