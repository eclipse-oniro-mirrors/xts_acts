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

export default function fileIOFdatasync() {
  describe('fileIO_fs_fdatasync', async function () {

  /**
   * @tc.name   fileIO_test_fdatasync_sync_000
   * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0000
   * @tc.desc   Test fdatasyncSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fdatasync_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.fdatasyncSync(file.fd);
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_fdatasync_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_sync_001
   * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0100
   * @tc.desc   Test fdatasyncSync() interfaces. Invalid fd parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_sync_001', Level.LEVEL0, async function () {

    try {
      fileIO.fdatasyncSync(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fdatasync_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_sync_002
   * @tc.number SUB_DF_FILEIO_FDATASYNC_SYNC_0200
   * @tc.desc   Test fdatasyncSync() interfaces. Missing parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_sync_002', Level.LEVEL0, async function () {

    try {
      fileIO.fdatasyncSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fdatasync_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_async_000
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0000
   * @tc.desc   Test fdatasync() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdatasync_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.fdatasync(file.fd, (err) => {
        if (err) {
          console.log('fileIO_test_fdatasync_async_000 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_fdatasync_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_async_001
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0100
   * @tc.desc   Test fdatasync() interfaces. Promise.then().catch().
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdatasync_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.fdatasync(file.fd).then(() => {
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_test_fdatasync_async_001 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_fdatasync_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_async_002
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0200
   * @tc.desc   Test fdatasync() interfaces. await Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fdatasync_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      await fileIO.fdatasync(file.fd);
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_fdatasync_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_async_003
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0300
   * @tc.desc   Test fdatasync() interfaces. await Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_async_003', Level.LEVEL0, async function (done) {

    try {
      await fileIO.fdatasync(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fdatasync_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_async_004
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0400
   * @tc.desc   Test fdatasync() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_async_004', Level.LEVEL0, async function (done) {

    try {
      fileIO.fdatasync(-1, (err) => {
        if (err) {
          console.log('fileIO_test_fdatasync_async_004 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_fdatasync_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_async_005
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0500
   * @tc.desc   Test fdatasync() interfaces. Promise.then().catch()
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_async_005', Level.LEVEL0, async function (done) {

    try {
      fileIO.fdatasync(-1).then(() => {
        expect(false).assertTrue();
      }).catch((err) => {
        console.log('fileIO_test_fdatasync_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
        expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_test_fdatasync_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_async_006
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0600
   * @tc.desc   Test fdatasync() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_async_006', Level.LEVEL0, async function (done) {

    try {
      await fileIO.fdatasync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fdatasync_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_fdatasync_async_007
   * @tc.number SUB_DF_FILEIO_FDATASYNC_ASYNC_0700
   * @tc.desc   Test fdatasync() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fdatasync_async_007', Level.LEVEL0, async function (done) {

    try {
      fileIO.fdatasync((err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_fdatasync_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
})
}
