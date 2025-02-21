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

  export default function fileIOTruncate() {
  describe('fileIO_fs_truncate', function () {

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0000
   * @tc.name fileIO_truncate_async_000
   * @tc.desc Test the truncate() interface. Promise.
   * Truncate the file with path and truncateLen = 5.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_truncate_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let truncateLen = 5;

    try {
      await fileIO.truncate(fpath, truncateLen);
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == truncateLen).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_truncate_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0100
   * @tc.name fileIO_truncate_async_001
   * @tc.desc Test the truncate() interface. Callback.
   * Truncate the file with fd and truncateLen = 5.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_truncate_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 5;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncate(file.fd, truncateLen, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_001 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0200
   * @tc.name fileIO_truncate_async_002
   * @tc.desc Test the truncate() interface. Promise.then().catch
   * Truncate the file with path and truncateLen = 2.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_truncate_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_002');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let truncateLen = 2;

    try {
      fileIO.truncate(fpath, truncateLen).then(() => {
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_truncate_async_002 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch(e) {
      console.log('fileIO_truncate_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0300
   * @tc.name fileIO_truncate_async_003
   * @tc.desc Test the truncate() interface. Promise.then().catch
   * Truncate the file with fd and truncateLen = 2.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_truncate_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_003');
    expect(prepareFile(fpath, 'truncate')).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 2;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncate(file.fd, truncateLen).then(() => {
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == truncateLen).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_truncate_async_003 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch(e) {
      console.log('fileIO_truncate_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0400
   * @tc.name fileIO_truncate_async_004
   * @tc.desc Test the truncate() interface. Callback.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_truncate_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_004');
    let truncateLen = 2;

    try {
      fileIO.truncate(fpath, truncateLen, (err) => {
        if (err) {
          console.log('fileIO_truncate_async_004 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_truncate_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0500
   * @tc.name fileIO_truncate_async_005
   * @tc.desc Test the truncate() interface. Promise.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_truncate_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_005');
    let truncateLen = 2;

    try {
      await fileIO.truncate(fpath, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_truncate_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0600
   * @tc.name fileIO_truncate_async_006
   * @tc.desc Test the truncate() interface. Callback.
   * Truncate the file with fd and truncateLen = 0.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_truncate_async_006', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncate(file.fd, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_006 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_006 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_ASYNC_0700
   * @tc.name fileIO_truncate_async_007
   * @tc.desc Test the truncate() interface. Callback.
   * Truncate the file with fd and truncateLen = 0.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_truncate_async_007', 0, async function (done) {
    let fpath = await nextFileName('fileIO_truncate_async_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.truncate(fpath, (err) => {
        if(err) {
          console.log('fileIO_truncate_async_007 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
        expect(isIntNum(file.fd)).assertTrue();
        let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
        expect(readLen == 0).assertTrue();
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_truncate_async_008 has failed for '  + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0000
   * @tc.name fileIO_test_truncate_sync_000
   * @tc.desc Test the truncateSync() interface.
   * Truncate the file with path.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_truncate_sync_000', 0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.truncateSync(fpath);
      expect(fileIO.statSync(fpath).size == 0).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0100
   * @tc.name fileIO_test_truncate_sync_001
   * @tc.desc Test the truncateSync() interface.
   * Truncate the file with fd and truncateLen = 5.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_truncate_sync_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    let truncateLen = 5;

    try {
      expect(isIntNum(file.fd)).assertTrue();
      fileIO.truncateSync(file.fd, truncateLen);
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == truncateLen).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_truncate_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0200
   * @tc.name fileIO_test_truncate_sync_002
   * @tc.desc Test the truncateSync() interface.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_truncate_sync_002', 0, async function () {
    let fpath = await nextFileName('fileIO_test_truncate_sync_002');

    try {
      fileIO.truncateSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0300
   * @tc.name fileIO_test_truncate_sync_003
   * @tc.desc Test the truncateSync() interface. Invalid parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_truncate_sync_003', 0, async function () {
    let truncateLen = 2;

    try {
      fileIO.truncateSync(-1, truncateLen);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_TRUNCATE_SYNC_0400
   * @tc.name fileIO_test_truncate_sync_004
   * @tc.desc Test truncateSync() interfaces. Missing parameters.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_truncate_sync_004', 0, function () {

    try {
      fileIO.truncateSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_truncate_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
})
}
