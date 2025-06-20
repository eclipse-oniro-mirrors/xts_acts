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

import fileio from '@ohos.fileio';
import { describe, it, expect, Level }from '@ohos/hypium'
import {
  FILE_CONTENT,
  prepareFile,
  nextFileName,
  randomString,
  forceRemoveDir
}
  from './Common'

export default function fileIOTestDir() {
describe('fileIOTestDir', function () {

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_OpenSync_0000
   * @tc.name fileio_test_dir_open_sync_000
   * @tc.desc Function of API, opendirSync.
   */
  it('fileio_test_dir_open_sync_000', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_open_sync_000') + 'd'
    try {
      fileio.mkdirSync(dpath);
      let dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      dd.closeSync();
      fileio.rmdirSync(dpath);
    }
    catch (e) {
      console.info('fileio_test_dir_open_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_OpenSync_0100
   * @tc.name fileio_test_dir_open_sync_001
   * @tc.desc Function of API, not set parameter.
   */
  it('fileio_test_dir_open_sync_001', Level.LEVEL1, function () {
    try {
      fileio.opendirSync();
      throw new Error('No Parameter');
    } 
    catch (e) {
      console.info('fileio_test_dir_open_sync_001 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_OpenSync_0200
   * @tc.name fileio_test_dir_open_sync_002
   * @tc.desc Function of API, dpath value is not exist.
   */
  it('fileio_test_dir_open_sync_002', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_open_sync_002') + 'd'
    try {
      fileio.opendirSync(dpath);
      expect(null).assertFail();
    }
    catch (e) {
      console.info('fileio_test_dir_open_sync_002 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_OpenSync_0300
   * @tc.name fileio_test_dir_open_sync_003
   * @tc.desc Function of API, dpath too long.
   */
  it('fileio_test_dir_open_sync_003', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_open_sync_003');
    fileio.mkdirSync(dpath);
    try {
      for (let i = 0; i < 16; i++) {
        console.info('time' + i);
        dpath = dpath + '/d' + i;
        fileio.mkdirSync(dpath);
      }
      throw new Error('dpath too long');
    }
    catch (e) {
      console.info('fileio_test_dir_open_sync_003 has failed for ' + e);
      forceRemoveDir(dpath, 16);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_OpenSync_0400
   * @tc.name fileio_test_dir_open_sync_004
   * @tc.desc Function of API, filename too long.
   */
  it('fileio_test_dir_open_sync_004', Level.LEVEL1, async function () {
    let dpath = await nextFileName(randomString(256));
    try {
      fileio.mkdirSync(dpath);
      expect(null).assertFail();
    }
    catch (e) {
      console.info('fileio_test_dir_open_sync_004 has failed for ' + e);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_OpenSync_0500
   * @tc.name fileio_test_dir_open_sync_005
   * @tc.desc Function of API, uri dir too many layers.
   */
  it('fileio_test_dir_open_sync_005', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_open_sync_005');
    fileio.mkdirSync(dpath);
    try {
      for (let i = 0; i < 113; i++) {
        console.info('time' + i);
        dpath = dpath + '/d' + i
        fileio.mkdirSync(dpath);
      }
      throw new Error('dir too many layers');
    }
    catch (e) {
      console.info('fileio_test_dir_open_sync_005 has failed for ' + e);
      forceRemoveDir(dpath, 113);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_OpenSync_0600
   * @tc.name fileio_test_dir_open_sync_006
   * @tc.desc Function of API, file name contain special character.
   */
  it('fileio_test_dir_open_sync_006', Level.LEVEL1, async function () {
    let dpath = await nextFileName('?*:<>/|');
    try {
      fileio.mkdirSync(dpath);
      expect(null).assertFail();
    }
    catch (e) {
      console.info('fileio_test_dir_open_sync_006 has failed for ' + e);
      expect(e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_OpenASync_001
   * @tc.name fileio_test_dir_open_async_001
   * @tc.desc Function of API, file name contain special character.
   */
  it('fileio_test_dir_open_async_001', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_open_async_001') + 'd'
    fileio.mkdirSync(dpath);
    fileio.opendir(dpath, function (err, dir) {
      expect(dir !== null).assertTrue();
      dir.closeSync();
      fileio.rmdirSync(dpath);
    });
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_OpenASync_001
   * @tc.name fileio_test_dir_open_async_001
   * @tc.desc Function of API, file name contain special character.
   */
  it('fileio_test_dir_open_async_002', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_open_async_002') + 'd'
    fileio.mkdirSync(dpath);
    fileio.opendir(dpath).then((dir)=> {
      expect(dir !== null).assertTrue();
      dir.closeSync();
      fileio.rmdirSync(dpath);
      console.info('fileio opendir Success');
    }).catch((err) => {
      console.info("fileio opendir err: "  + JSON.stringify(err));
    });
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_ReadSync_0000
   * @tc.name fileio_test_dir_read_sync_000
   * @tc.desc Function of API, readSync. The dir contains 1 file.
   */
  it('fileio_test_dir_read_sync_000', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_read_sync_000') + 'd'
    let fpath = dpath + '/f0'
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      let dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      expect(dd.readSync() !== null).assertTrue();
      dd.closeSync();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
    }
    catch (e) {
      console.info('fileio_test_dir_read_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_ReadSync_0100
   * @tc.name fileio_test_dir_read_sync_001
   * @tc.desc Function of API, readSync. The dir contains more than 1 files.
   */
  it('fileio_test_dir_read_sync_001', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_read_sync_001') + 'd'
    let fpathArray = new Array(dpath + '/f1', dpath + '/f2', dpath + '/d3');
    try {
      fileio.mkdirSync(dpath);
      for (let i = 0; i < 3; i++) {
        if (i == 2) {
          fileio.mkdirSync(fpathArray[i])
        } else {
          expect(prepareFile(fpathArray[i], FILE_CONTENT)).assertTrue();
        }
      }
      let dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      for (let i = 0; i < 3; i++) {
        let bool = typeof (dd.readSync());
        expect(bool == 'object').assertTrue();
        console.info('---bool=' + bool);
      }
      dd.closeSync();
      for (let i = 0; i < 3; i++) {
        if (i == 2) {
          fileio.rmdirSync(fpathArray[i]);
        } else {
          fileio.unlinkSync(fpathArray[i]);
        }
      }
      fileio.rmdirSync(dpath);
    }
    catch (e) {
      console.info('fileio_test_dir_read_sync_001 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_ReadSync_0200
   * @tc.name fileio_test_dir_read_sync_002
   * @tc.desc Function of API, repeat read. The dir contains more than 1 files.
   */
  it('fileio_test_dir_read_sync_002', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_read_sync_002') + 'd'
    let fpathArray = new Array(dpath + '/f1', dpath + '/f2', dpath + '/d3');
    try {
      fileio.mkdirSync(dpath)
      for (let i = 0; i < 3; i++) {
        if (i == 2) {
          fileio.mkdirSync(fpathArray[i])
        } else {
          expect(prepareFile(fpathArray[i], FILE_CONTENT)).assertTrue();
        }
      }
      var dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      for (let i = 0; i < 3; i++) {
        expect(dd.readSync() !== null).assertTrue();
      }
      expect(dd.readSync() !== null).assertTrue();
      dd.closeSync();
      for (let i = 0; i < 3; i++) {
        if (i == 2) {
          fileio.rmdirSync(fpathArray[i]);
        } else {
          fileio.unlinkSync(fpathArray[i]);
        }
      }
      fileio.rmdirSync(dpath);
    }
    catch (e) {
      console.info('fileio_test_dir_read_sync_002 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_ReadSync_0300
   * @tc.name fileio_test_dir_read_sync_003
   * @tc.desc Function of API, readSync. The dir no any files.
   */
  it('fileio_test_dir_read_sync_003', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_read_sync_003') + 'd'
    let dd;
    try {
      fileio.mkdirSync(dpath);
      dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      expect(dd.readSync() !== null).assertTrue();
      dd.closeSync();
      fileio.rmdirSync(dpath);
    }
    catch (e) {
      console.info('fileio_test_dir_read_sync_003 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_ReadSync_0400
   * @tc.name fileio_test_dir_read_sync_004
   * @tc.desc Function of API, error parameter.
   */
  it('fileio_test_dir_read_sync_004', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_read_sync_004') + 'd'
    let fpath = dpath + '/f1'
    let dd
    try {
      fileio.mkdirSync(dpath);
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
      dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      expect(dd.readSync(-1) == null).assertTrue();
      expect(null).assertFail();
    }
    catch (e) {
      console.info('fileio_test_dir_read_sync_004 has failed for ' + e);
      expect(e.message == 'Number of arguments unmatched').assertTrue();
      dd.closeSync();
      fileio.unlinkSync(fpath);
      fileio.rmdirSync(dpath);
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_ReadSync_0500
   * @tc.name fileio_test_dir_read_sync_005
   * @tc.desc Function of API, excess files.
   */
  it('fileio_test_dir_read_sync_005', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_read_sync_005') + 'd'
    let fpath = dpath + '/f'
    try {
      fileio.mkdirSync(dpath);
      for (let i = 0; i < 10001; i++) {
        expect(prepareFile(fpath + i, 'test_text')).assertTrue();
      }
      let dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      expect(dd.readSync() !== null).assertTrue();
      dd.closeSync();
      for (let i = 0; i < 10001; i++) {
        fileio.unlinkSync(fpath + i);
      }
      fileio.rmdirSync(dpath);
    }
    catch (e) {
      console.info('fileio_test_dir_read_sync_005 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_CloseSync_0000
   * @tc.name fileio_test_dir_close_sync_000
   * @tc.desc Function of API, closeSync.
   */
  it('fileio_test_dir_close_sync_000', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_close_sync_000') + 'd'
    try {
      fileio.mkdirSync(dpath);
      let dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      dd.closeSync();
      fileio.rmdirSync(dpath);
    }
    catch (e) {
      console.info('fileio_test_dir_close_sync_000 has failed for ' + e);
      expect(null).assertFail();
    }
  });

  /**
   * @tc.number SUB_STORAGE_FileIO_dir_CloseSync_0100
   * @tc.name fileio_test_dir_close_sync_001
   * @tc.desc Function of API, closeSync. error parameter.
   */
  it('fileio_test_dir_close_sync_001', Level.LEVEL1, async function () {
    let dpath = await nextFileName('fileio_test_dir_close_sync_001') + 'd'
    try {
      fileio.mkdirSync(dpath);
      let dd = fileio.opendirSync(dpath);
      expect(dd !== null).assertTrue();
      dd.closeSync(-1);
      expect(null).assertFail();
    }
    catch (e) {
      console.info('fileio_test_dir_close_sync_001 has failed for ' + e);
      expect(e.message == 'Dir has been closed yet').assertTrue();
      fileio.rmdirSync(dpath);
    }
  });
});
}
