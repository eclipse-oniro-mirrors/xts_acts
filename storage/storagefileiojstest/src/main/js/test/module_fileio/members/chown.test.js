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

export default function fileioChown() {
describe('fileio_chown', function () {

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNSYNC_0000
   * @tc.name fileio_test_chown_sync_000
   * @tc.desc Test chownSync() interface. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_sync_000', 0, async function () {
    let fpath = await nextFileName('fileio_test_chown_sync_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.chmodSync(fpath, 0o777);
      let stat = fileio.statSync(fpath);
      fileio.chownSync(fpath, stat.uid, stat.gid);
      fileio.unlinkSync(fpath);
    } catch (e) {
      console.info('fileio_test_chown_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNSYNC_0100
   * @tc.name fileio_test_chown_sync_001
   * @tc.desc Test chownSync() interface, wrong uid, gid. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_sync_001', 0, async function () {
    let fpath = await nextFileName('fileio_test_chown_sync_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.chownSync(fpath, 0, 0);
    } catch (e) {
      console.info('fileio_test_chown_sync_001 has failed for ' + e);
      expect(e.message == "Operation not permitted").assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNSYNC_0200
   * @tc.name fileio_test_chown_sync_002
   * @tc.desc Test chownSync() interface, wrong owner. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_sync_002', 0, async function () {
    let fpath = await nextFileName('fileio_test_chown_sync_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      fileio.chownSync(fpath, null, stat.gid);
    } catch (e) {
      console.info('fileio_test_chown_sync_002 has failed for ' + e);
      expect(e.message == "Invalid owner").assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNSYNC_0300
   * @tc.name fileio_test_chown_sync_003
   * @tc.desc Test chownSync() interface, wrong group. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_sync_003', 0, async function () {
    let fpath = await nextFileName('fileio_test_chown_sync_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      fileio.chownSync(fpath, stat.uid, null);
    } catch (e) {
      console.info('fileio_test_chown_sync_003 has failed for ' + e);
      expect(e.message == "Invalid group").assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNSYNC_0400
   * @tc.name fileio_test_chown_sync_004
   * @tc.desc Test chownSync() interface, file does not exist. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_sync_004', 0, async function () {
    let fpath = await nextFileName('fileio_test_chown_sync_004');
    let ffpath = await nextFileName('fileio_test_chown_sync_004_1');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      fileio.chownSync(ffpath, stat.uid, stat.gid);
    } catch (e) {
      console.info('fileio_test_chown_sync_004 has failed for ' + e);
      expect(e.message == "No such file or directory").assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0000
   * @tc.name fileio_test_chown_async_00
   * @tc.desc Test the chownAsync() interface with promise. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_000');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.chmodSync(fpath, 0o777);
      let stat = fileio.statSync(fpath);
      await fileio.chown(fpath, stat.uid, stat.gid);
      fileio.unlinkSync(fpath);
      done();
    } catch (e) {
      console.info('fileio_test_chown_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0100
   * @tc.name fileio_test_chown_async_001
   * @tc.desc Test the chownAsync() interface with callback. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.chmodSync(fpath, 0o777);
      let stat = fileio.statSync(fpath);
      fileio.chown(fpath, stat.uid, stat.gid, function (error) {
        fileio.unlinkSync(fpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_chown_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0200
   * @tc.name fileio_test_chown_async_002
   * @tc.desc Test the chownAsync() interface with promise, wrong uid, gid. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileio.chown(fpath, 0, 0);
    } catch (e) {
      console.info('fileio_test_chown_async_002 has failed for ' + e);
      expect(e.message == "Operation not permitted").assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0300
   * @tc.name fileio_test_chown_async_003
   * @tc.desc Test the chownAsync() interface with promise, wrong owner. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      await fileio.chown(fpath, null, stat.gid);
    } catch (e) {
      console.info('fileio_test_chown_async_003 has failed for ' + e);
      expect(e.message == "Invalid owner").assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0400
   * @tc.name fileio_test_chown_async_004
   * @tc.desc Test the chownAsync() interface with callback, wrong group. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      fileio.chown(fpath, stat.uid, null, function (error) {
      });
    } catch (e) {
      console.info('fileio_test_chown_async_004 has failed for ' + e);
      expect(e.message == "Invalid group").assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_CHOWNASYNC_0500
   * @tc.name fileio_test_chown_async_005
   * @tc.desc Test the chownAsync() interface with promise, file does not exist. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_chown_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_chown_async_005');
    let ffpath = await nextFileName('fileio_test_chown_async_005_1');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      await fileio.chown(ffpath, stat.uid, stat.gid);
    } catch (e) {
      console.info('fileio_test_chown_async_005 has failed for ' + e);
      expect(e.message == "No such file or directory").assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });
});
}
