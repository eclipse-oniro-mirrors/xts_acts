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

export default function fileioFchmod() {
describe('fileio_fchmod', function () {

  /**
   * @tc.number SUB_DF_FILEIO_FCHMOD_SYNC_0000
   * @tc.name fileio_test_fchmod_sync_000
   * @tc.desc Test fchmodSync() interfaces, mode = 0o660. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchmod_sync_000', 0, async function () {
    let fpath = await nextFileName('fileio_test_fchmod_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o2);
      fileio.fchmodSync(fd, 0o660);
      expect((fileio.statSync(fpath).mode & 0o777) == 0o660).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_fchmod_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHMOD_SYNC_0100
   * @tc.name fileio_test_fchmod_sync_001
   * @tc.desc Test fchmodSync() interfaces, invalid fd. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchmod_sync_001', 0, function () {
    try {
      fileio.fchmodSync(-1, 0o660);
    } catch (e) {
      console.info('fileio_test_fchmod_sync_001 has failed for ' + e);
      expect(e.message == "Bad file descriptor").assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHMOD_ASYNC_0000
   * @tc.name fileio_test_fchmod_async_000
   * @tc.desc Test the fchmodAsync() interface with callback, mode = 1002. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchmod_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchmod_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let fd = fileio.openSync(fpath, 0o1, 0o0200);
      fileio.fchmod(fd, 1002, function (err) {
        expect((fileio.statSync(fpath).mode & 0o777) == 0o752).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_fchmod_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHMOD_ASYNC_0100
   * @tc.name fileio_test_fchmod_async_001
   * @tc.desc Test the fchmodAsync() interface with callback, mode = 1003. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchmod_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchmod_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath, 0o0, 0o0200);
      fileio.fchmod(fd, 1003).then(function (err) {
        expect((fileio.statSync(fpath).mode & 0o777) == 0o753).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        done();
      })
    } catch (e) {
      console.info('fileio_test_fchmod_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHMOD_ASYNC_0200
   * @tc.name fileio_test_fchmod_async_002
   * @tc.desc Test the fchmodAsync() interface with callback, mode = 0o100. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchmod_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchmod_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath, 0o1, 0o020);
      fileio.fchmod(fd, 0o100, function (err) {
        expect((fileio.statSync(fpath).mode & 0o777) == 0o100).assertTrue();
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_fchmod_async_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHMOD_ASYNC_0300
   * @tc.name fileio_test_fchmod_async_003
   * @tc.desc Test the fchmodAsync() interface with promise, mode = 0o400. Test file permissions modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchmod_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchmod_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath, 0o1, 0o020);
      await fileio.fchmod(fd, 0o400);
      expect((fileio.statSync(fpath).mode & 0o777) == 0o400).assertTrue();
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_test_fchmod_async_003 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHMOD_ASYNC_0400
   * @tc.name fileio_test_fchmod_async_004
   * @tc.desc Test the fchmodAsync() interface with promise, invalid fd. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchmod_async_004', 0, async function (done) {
    try {
      await fileio.fchmod(-1, 0o666);
    } catch (e) {
      console.info('fileio_test_fchmod_async_004 has failed for ' + e);
      expect(e.message == "Bad file descriptor").assertTrue();
      done();
    }
  });
});
}
