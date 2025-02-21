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
  fileio, FILE_CONTENT, prepareFile, nextFileName, isIntNum,
  describe, it, expect,
} from '../../Common';

export default function fileioFchown() {
describe('fileio_fchown', async function () {

  /**
   * @tc.number SUB_DF_FILEIO_FCHOWN_ASYNC_0000
   * @tc.name fileio_test_fchown_async_000
   * @tc.desc Test the fchownAsync() interface with callback. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchown_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchown_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.uid)).assertTrue();
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      fileio.fchmodSync(fd, 0o777);
      fileio.fchown(fd, stat.uid, stat.gid, function (err) {
        fileio.closeSync(fd);
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_fchown_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHOWN_ASYNC_0100
   * @tc.name fileio_test_fchown_async_001
   * @tc.desc Test the fchownAsync() interface with promise. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchown_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchown_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.uid)).assertTrue();
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      fileio.fchmodSync(fd, 0o777);
      await fileio.fchown(fd, stat.uid, stat.gid);
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_test_fchown_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHOWN_ASYNC_0200
   * @tc.name fileio_test_fchown_async_002
   * @tc.desc Test the fchownAsync() interface with promise, invalid fd. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
   it('fileio_test_fchown_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchown_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      await fileio.fchown(-1, stat.uid, stat.gid);
    } catch (e) {
      console.info('fileio_test_fchown_async_002 has failed for ' + e);
      expect(e.message == "Bad file descriptor").assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHOWN_ASYNC_0300
   * @tc.name fileio_test_fchown_async_003
   * @tc.desc Test the fchownAsync() interface with promise, wrong uid, gid. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchown_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_fchown_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath);
      await fileio.fchown(fd, 0, 0);
    } catch (e) {
      console.info('fileio_test_fchown_async_003 has failed for ' + e);
      expect(e.message == "Operation not permitted").assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHOWN_SYNC_0000
   * @tc.name fileio_test_fchown_sync_000
   * @tc.desc Test fchownSync() interface. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchown_sync_000', 0, async function () {
    let fpath = await nextFileName('fileio_test_fchown_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      expect(isIntNum(stat.uid)).assertTrue();
      let fd = fileio.openSync(fpath, 0o102, 0o666);
      fileio.fchmodSync(fd, 0o777);
      fileio.fchownSync(fd, stat.uid, stat.gid);
      fileio.closeSync(fd);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_fchown_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHOWN_SYNC_0100
   * @tc.name fileio_test_fchown_sync_001
   * @tc.desc Test fchownSync() interface, invalid fd. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchown_sync_001', 0, async function () {
    let fpath = await nextFileName('fileio_test_fchown_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      fileio.fchownSync(-1, stat.uid, stat.gid);
    } catch (e) {
      console.info('fileio_test_fchown_sync_001 has failed for ' + e);
      expect(e.message == "Bad file descriptor").assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHOWN_SYNC_0200
   * @tc.name fileio_test_fchown_sync_002
   * @tc.desc Test fchownSync() interface, wrong uid, gid. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchown_sync_002', 0, async function () {
    let fpath = await nextFileName('fileio_test_fchown_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath);
      fileio.fchownSync(fd, 0, 0);
    } catch (e) {
      console.info('fileio_test_fchown_sync_002 has failed for ' + e);
      expect(e.message == "Operation not permitted").assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_FCHOWN_SYNC_0300
   * @tc.name fileio_test_fchown_sync_003
   * @tc.desc Test fchownSync() interface, wrong owner. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_fchown_sync_003', 0, async function () {
    let fpath = await nextFileName('fileio_test_fchown_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let fd = fileio.openSync(fpath);
      let stat = fileio.statSync(fpath);
      fileio.fchownSync(fd, null, stat.gid);
    } catch (e) {
      console.info('fileio_test_fchown_sync_003 has failed for ' + e);
      expect(e.message == "Invalid owner").assertTrue();
      fileio.unlinkSync(fpath);
    }
  });
});
}
