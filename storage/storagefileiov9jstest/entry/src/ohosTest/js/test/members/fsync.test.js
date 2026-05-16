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

export default function fileIOFsync() {
describe('fileIO_fs_fsync', function () {

  /**
   * @tc.name   fileIO_test_fsync_sync_000
   * @tc.number SUB_DF_FILEIO_FSYNC_SYNC_0000
   * @tc.desc   Test fsyncSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_sync_000', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_fsync_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.fsyncSync(file.fd);
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_fsync_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_sync_001
   * @tc.number SUB_DF_FILEIO_FSYNC_SYNC_0100
   * @tc.desc   Test fsyncSync() interface. Invalid fd parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_sync_001', Level.LEVEL0, function () {

    try {
      fileIO.fsyncSync(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fsync_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_sync_002
   * @tc.number SUB_DF_FILEIO_FSYNC_SYNC_0200
   * @tc.desc   Test fsyncSync() interface. Missing parameter.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_sync_002', Level.LEVEL0, function () {

    try {
      fileIO.fsyncSync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fsync_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_async_000
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0000
   * @tc.desc   Test fsync() interface. await Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_async_000', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fsync_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      await fileIO.fsync(file.fd);
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      done();
    } catch (e) {
      console.log('fileIO_test_fsync_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_async_001
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0100
   * @tc.desc   Test fsync() interface. Promise.then().catch()
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_async_001', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fsync_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.fsync(file.fd).then(() => {
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
        done();
      }).catch((err) => {
        console.log('fileIO_test_fsync_async_001 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_fsync_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_async_002
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0200
   * @tc.desc   Test fsync() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_async_002', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_fsync_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      fileIO.fsync(file.fd, (err) => {
        if (err) {
          console.log('fileIO_test_fsync_async_002 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        fileIO.closeSync(file);
        fileIO.unlinkSync(fpath);
      });
      done();
    } catch (e) {
      console.log('fileIO_test_fsync_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_async_003
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0300
   * @tc.desc   Test fsync() interface. await Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_async_003', Level.LEVEL0, async function (done) {

    try {
      await fileIO.fsync(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fsync_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_async_004
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0400
   * @tc.desc   Test fsync() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_async_004', Level.LEVEL0, async function (done) {

    try {
      fileIO.fsync(-1, (err) => {
        if (err) {
          console.log('fileIO_test_fsync_async_004 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_fsync_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_async_005
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0500
   * @tc.desc   Test fsync() interface. Promise.then().catch()
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_async_005', Level.LEVEL0, async function (done) {

    try {
      fileIO.fsync(-1).then(() => {
        expect(false).assertTrue();
      }).catch((err) => {
        console.log('fileIO_test_fsync_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
        expect(err.code == 13900008 && err.message == 'Bad file descriptor').assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_test_fsync_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_async_006
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0600
   * @tc.desc   Test fsync() interface. await Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_async_006', Level.LEVEL0, async function (done) {

    try {
      await fileIO.fsync();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_fsync_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_fsync_async_007
   * @tc.number SUB_DF_FILEIO_FSYNC_ASYNC_0700
   * @tc.desc   Test fsync() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_fsync_async_007', Level.LEVEL0, async function (done) {

    try {
      fileIO.fsync((err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_test_fsync_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
})
}
