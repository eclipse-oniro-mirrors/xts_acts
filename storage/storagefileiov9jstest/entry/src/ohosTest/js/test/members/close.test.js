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
  fileIO, FILE_CONTENT, nextFileName, prepareFile, describe, it, expect, 
} from '../Common';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOClose() {
describe('fileIO_fs_close', function () {

   /**
    * @tc.name   fileIO_test_close_sync_000
    * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0000
    * @tc.desc   Test closeSync() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_close_sync_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function () {
    let fpath = await nextFileName('fileIO_test_close_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.closeSync(file.fd);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_close_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_close_sync_001
   * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0100
   * @tc.desc   Test closeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_sync_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function () {
    let fpath = await nextFileName('fileIO_test_close_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_close_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
    * @tc.name   fileIO_test_close_sync_002
    * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0200
    * @tc.desc   Test closeSync() interfaces.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
   it('fileIO_test_close_sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function () {
    let fpath = await nextFileName('fileIO_test_close_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fd = file.fd;
      fileIO.closeSync(file);
      fileIO.closeSync(fd);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_close_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_close_sync_003
   * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0300
   * @tc.desc   Test closeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_sync_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function () {
    let fpath = await nextFileName('fileIO_test_close_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.closeSync(file);
      fileIO.closeSync(file);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_close_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_close_sync_004
   * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0400
   * @tc.desc   Test closeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_sync_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  function () {

    try {
      fileIO.closeSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_close_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_close_sync_005
   * @tc.number SUB_DF_FILEIO_CLOSE_SYNC_0500
   * @tc.desc   Test closeSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_sync_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  function () {

    try {
      fileIO.closeSync(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_close_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_000
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0000
   * @tc.desc   Test close() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {
    let fpath = await nextFileName('fileIO_test_close_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.close(file.fd, (err) => {
        if(err) {
          console.log('fileIO_test_close_async_000 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_close_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_001
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0100
   * @tc.desc   Test close() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {
    let fpath = await nextFileName('fileIO_test_close_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.close(file, (err) => {
        if (err) {
          console.log('fileIO_test_close_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_close_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_002
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0200
   * @tc.desc   Test close() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {
    let fpath = await nextFileName('fileIO_test_close_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      await fileIO.close(file.fd);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_close_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_003
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0300
   * @tc.desc   Test close() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {
    let fpath = await nextFileName('fileIO_test_close_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      await fileIO.close(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_close_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_004
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0400
   * @tc.desc   Test close() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {
    let fpath = await nextFileName('fileIO_test_close_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fd = file.fd;
      await fileIO.close(file);
      await fileIO.close(fd);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_close_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_005
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0500
   * @tc.desc   Test close() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {
    let fpath = await nextFileName('fileIO_test_close_async_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      await fileIO.close(file);
      await fileIO.close(file);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_close_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_006
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0600
   * @tc.desc   Test close() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {
    let fpath = await nextFileName('fileIO_test_close_async_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      await fileIO.close(file.fd, 2);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_close_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_007
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0700
   * @tc.desc   Test close() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {

    try {
      await fileIO.close(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_close_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_008
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0800
   * @tc.desc   Test close() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {

    try {
      await fileIO.close();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_close_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_close_async_009
   * @tc.number SUB_DF_FILEIO_CLOSE_ASYNC_0900
   * @tc.desc   Test close() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_close_async_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  async function (done) {
    let fpath = await nextFileName('fileIO_test_close_async_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fd = file.fd;
      fileIO.close(file, (err) => {
        if (err) {
          console.log('fileIO_test_close_async_009 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      })
      fileIO.close(fd, (err) => {
        if (err) {
          console.log('fileIO_test_close_async_009 close error: {message: ' + err.message + ', code: ' + err.code + '}');
          fileIO.unlinkSync(fpath);
          expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_close_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
