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

export default function fileioLchown() {
describe('fileio_lchown', function () {

  /**
   * @tc.number SUB_DF_FILEIO_LSEEK_SYNC_0000
   * @tc.name fileio_test_lchown_sync_000
   * @tc.desc Test lchownSync() interface. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_sync_000', 0, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_000');
    let ffpath = fpath + 'aaaa';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.symlinkSync(fpath, ffpath);
      let stat = fileio.statSync(fpath);
      fileio.lchownSync(ffpath, stat.uid, stat.gid);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(ffpath);
    } catch (e) {
      console.info('fileio_test_lchown_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSEEK_SYNC_0100
   * @tc.name fileio_test_lchown_sync_001
   * @tc.desc Test lchownSync() interface, invalid path. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_sync_001', 0, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_001');
    let ffpath = await nextFileName('fileio_test_lchown_sync_001_1');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      fileio.lchownSync(ffpath, stat.uid, stat.gid);
    } catch (e) {
      console.info('fileio_test_lchown_sync_001 has failed for ' + e);
      expect(e.message == "No such file or directory").assertTrue();
      fileio.unlinkSync(fpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSEEK_SYNC_0200
   * @tc.name fileio_test_lchown_sync_002
   * @tc.desc Test lchownSync() interface, wrong uid, gid. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_sync_002', 0, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_002');
    let ffpath = fpath + 'aaaa';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.symlinkSync(fpath, ffpath);
      fileio.lchownSync(ffpath, 0, 0);
    } catch (e) {
      console.info('fileio_test_lchown_sync_002 has failed for ' + e);
      expect(e.message == "Operation not permitted").assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(ffpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSEEK_SYNC_0300
   * @tc.name fileio_test_lchown_sync_003
   * @tc.desc Test lchownSync() interface, wrong owner. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_sync_003', 0, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_003');
    let ffpath = fpath + 'aaaa';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.symlinkSync(fpath, ffpath);
      let stat = fileio.statSync(fpath);
      fileio.lchownSync(ffpath, null, stat.gid);
    } catch (e) {
      console.info('fileio_test_lchown_sync_003 has failed for ' + e);
      expect(e.message == "Invalid owner").assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(ffpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LSEEK_SYNC_0400
   * @tc.name fileio_test_lchown_sync_004
   * @tc.desc Test lchownSync() interface, wrong group. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_sync_004', 0, async function () {
    let fpath = await nextFileName('fileio_test_lchown_sync_004');
    let ffpath = fpath + 'aaaa';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.symlinkSync(fpath, ffpath);
      let stat = fileio.statSync(fpath);
      fileio.lchownSync(ffpath, stat.uid, null);
    } catch (e) {
      console.info('fileio_test_lchown_sync_004 has failed for ' + e);
      expect(e.message == "Invalid group").assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(ffpath);
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LCHOWN_ASYNC_0000
   * @tc.name fileio_test_lchown_async_000
   * @tc.desc Test the lchownASync() interface with promise. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_async_000', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_async_000');
    let ffpath = fpath + 'aaaa';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.symlinkSync(fpath, ffpath);
      let stat = fileio.statSync(fpath);
      await fileio.lchown(ffpath, stat.uid, stat.gid);
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(ffpath);
      done();
    } catch (e) {
      console.info('fileio_test_lchown_async_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LCHOWN_ASYNC_0100
   * @tc.name fileio_test_lchown_async_001
   * @tc.desc Test the lchownASync() interface with callback. The test file was modified successfully.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_async_001');
    let ffpath = fpath + 'aaaa';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.symlinkSync(fpath, ffpath);
      let stat = fileio.statSync(fpath);
      fileio.lchown(ffpath, stat.uid, stat.gid, function (error) {
        fileio.unlinkSync(fpath);
        fileio.unlinkSync(ffpath);
        done();
      });
    } catch (e) {
      console.info('fileio_test_lchown_async_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LCHOWN_ASYNC_0200
   * @tc.name fileio_test_lchown_async_002
   * @tc.desc Test the lchownASync() interface with promise, invalid path. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_async_002');
    let ffpath = await nextFileName('fileio_test_lchown_sync_001_1');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      let stat = fileio.statSync(fpath);
      await fileio.lchown(ffpath, stat.uid, stat.gid);
    } catch (e) {
      console.info('fileio_test_lchown_async_002 has failed for ' + e);
      expect(e.message == "No such file or directory").assertTrue();
      fileio.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LCHOWN_ASYNC_0300
   * @tc.name fileio_test_lchown_async_003
   * @tc.desc Test the lchownASync() interface with promise, wrong uid, gid. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_async_003', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_async_003');
    let ffpath = fpath + 'aaaa';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.symlinkSync(fpath, ffpath);
      await fileio.lchown(ffpath, 0, 0);
    } catch (e) {
      console.info('fileio_test_lchown_async_003 has failed for ' + e);
      expect(e.message == "Operation not permitted").assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(ffpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LCHOWN_ASYNC_0400
   * @tc.name fileio_test_lchown_async_004
   * @tc.desc Test the lchownASync() interface with promise, wrong owner. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_async_004', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_async_004');
    let ffpath = fpath + 'aaaa';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.symlinkSync(fpath, ffpath);
      let stat = fileio.statSync(fpath);
      await fileio.lchown(ffpath, null, stat.gid);
    } catch (e) {
      console.info('fileio_test_lchown_async_004 has failed for ' + e);
      expect(e.message == "Invalid owner").assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(ffpath);
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_LCHOWN_ASYNC_0500
   * @tc.name fileio_test_lchown_async_005
   * @tc.desc Test the lchownASync() interface with promise, wrong group. Test file modification failed.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileio_test_lchown_async_005', 0, async function (done) {
    let fpath = await nextFileName('fileio_test_lchown_async_005');
    let ffpath = fpath + 'aaaa';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileio.symlinkSync(fpath, ffpath);
      let stat = fileio.statSync(fpath);
      await fileio.lchown(ffpath, stat.uid, null);
    } catch (e) {
      console.info('fileio_test_lchown_async_005 has failed for ' + e);
      expect(e.message == "Invalid group").assertTrue();
      fileio.unlinkSync(fpath);
      fileio.unlinkSync(ffpath);
      done();
    }
  });
});
}
