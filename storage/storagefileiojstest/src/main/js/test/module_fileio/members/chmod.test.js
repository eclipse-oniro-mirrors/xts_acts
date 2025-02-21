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

export default function fileioChmod() {
describe('fileio_chmod', function () {

  /**
   * @tc.number SUB_DF_FILEIO_CHMODSYNC_0000
   * @tc.name fileio_test_chmod_sync_000
   * @tc.desc Test chmodSync() interfaces, mode = 0o660. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chmod_sync_000', 0, async function () {
    let fpath = await nextFileName('fileio_test_chmod_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.chmodSync(fpath, 0o660);
      expect((fileio.statSync(fpath).mode & 0o777) == 0o660).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_chmod_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHMODSYNC_0100
   * @tc.name fileio_test_chmod_sync_001
   * @tc.desc Test chmodSync() interfaces, mode = 0o0700. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chmod_sync_001', 0, async function () {
    let fpath = await nextFileName('fileio_test_chmod_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.chmodSync(fpath, 0o0700);
      expect((fileio.statSync(fpath).mode & 0o777) == 0o0700).assertTrue();
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_chmod_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHMODSYNC_0200
   * @tc.name fileio_test_chmod_sync_002
   * @tc.desc Test chmodSync() interfaces, invalid path. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chmod_sync_002', 0, async function () {
    let fpath = await nextFileName('fileio_test_chmod_sync_002');

    try {
      fileio.chmodSync(fpath, 0o0700);
    } catch (e) {
      console.info('fileio_test_chmod_sync_002 has failed for ' + e);
      expect(e.message == "No such file or directory").assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHMODASYNC_0000
   * @tc.name fileio_test_chmod_async_000
   * @tc.desc Test the chmodAsync() interface with promise, mode = 0o660. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chmod_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chmod_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio
        .chmod(fpath, 0o660)
        .then(function (err) {
          expect((fileio.statSync(fpath).mode & 0o777) == 0o660).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        })
        .catch(function (e) {
          console.info(e);
        });
      done();
    } catch (e) {
      console.info('fileio_test_chmod_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHMODASYNC_0100
   * @tc.name fileio_test_chmod_async_001
   * @tc.desc Test the chmodAsync() interface with promise, mode = 0o0700. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chmod_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chmod_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio
        .chmod(fpath, 0o0700)
        .then(function (err) {
          expect((fileio.statSync(fpath).mode & 0o777) == 0o0700).assertTrue();
          fileio.unlinkSync(fpath);
          done();
        })
        .catch(function (e) {
          console.info(e);
        });
      done();
    } catch (e) {
      console.info('fileio_test_chmod_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHMODASYNC_0200
   * @tc.name fileio_test_chmod_async_002
   * @tc.desc Test the chmodAsync() interface with callback, mode = 0o660. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chmod_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chmod_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.chmod(fpath, 0o660, function () {
        expect((fileio.statSync(fpath).mode & 0o777) == 0o660).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_chmod_async_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHMODASYNC_0300
   * @tc.name fileio_test_chmod_async_003
   * @tc.desc Test the chmodAsync() interface with callback, mode = 0o0700. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chmod_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chmod_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileio.chmod(fpath, 0o0700, function () {
        expect((fileio.statSync(fpath).mode & 0o777) == 0o0700).assertTrue();
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_chmod_async_003 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHMODASYNC_0400
   * @tc.name fileio_test_chmod_async_004
   * @tc.desc Test the chmodAsync() interface with promise, invalid path. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chmod_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chmod_async_004');

    try {
      await fileio.chmod(fpath, 0o660);
    } catch (e) {
      console.info('fileio_test_chmod_async_004 has failed for ' + e);
      expect(e.message == "No such file or directory").assertTrue();
      done();
    }
  });
});
}
