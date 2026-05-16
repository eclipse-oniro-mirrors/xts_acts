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

export default function fileIOMoveFile() {
  describe('fileIO_fs_moveFile', function () {

  /**
   * @tc.name   fileIO_test_moveFile_sync_000
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0000
   * @tc.desc   Test moveFileSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_sync_000', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_moveFile_sync_000');
    let fpath = dpath + '/file_000.txt';
    let ddpath = dpath + '/dir_000';
    let ffpath = ddpath + '/file_000.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.moveFileSync(fpath, ffpath);
      let stat = fileIO.statSync(ffpath);
      expect(stat.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_test_moveFile_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_sync_001
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0100
   * @tc.desc   Test moveFileSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_sync_001', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_moveFile_sync_001');
    let fpath = dpath + '/file_001.txt';
    let ddpath = dpath + '/dir_001';
    let ffpath = ddpath + '/file_001.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, ffpath);
      fileIO.moveFileSync(fpath, ffpath, 1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveFile_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900015 && e.message == 'File exists').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_sync_002
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0200
   * @tc.desc   Test moveFileSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_sync_002', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_moveFile_sync_002');
    let fpath = dpath + '/file_002.txt';
    let ddpath = dpath + '/dir_002';
    let ffpath = ddpath + '/file_002.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);

    try {
      fileIO.moveFileSync(fpath, ffpath);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveFile_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_sync_004
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0400
   * @tc.desc   Test moveFileSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_sync_004', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_moveFile_sync_004');
    let ddpath = dpath + '/dir_003';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.moveFileSync(dpath, ddpath);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveFile_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_sync_005
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0500
   * @tc.desc   Test moveFileSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_sync_005', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_moveFile_sync_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.moveFileSync(fpath);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_moveFile_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_sync_006
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0600
   * @tc.desc   Test moveFileSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_sync_006', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_moveFile_sync_006');
    let fpath = dpath + '/file_004.txt';
    let ddpath = dpath + '/dir_004';
    let ffpath = ddpath + '/file_004.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath, '')).assertTrue();

    try {
      fileIO.moveFileSync(fpath, ffpath, 0);
      let stat = fileIO.statSync(ffpath);
      expect(stat.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_test_moveFile_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_sync_007
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0700
   * @tc.desc   Test moveFileSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveFile_sync_007', Level.LEVEL3, async function () {
    let dpath = await nextFileName('fileIO_test_moveFile_sync_007');
    let fpath = dpath + '/file_015.txt';
    let ddpath = dpath + '/dir_015';
    let ffpath = ddpath + '/file_015.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.moveFileSync(fpath, ffpath, undefined);
      let stat = fileIO.statSync(ffpath);
      expect(stat.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_test_moveFile_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_000
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0000
   * @tc.desc   Test moveFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_000', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_000');
    let fpath = dpath + '/file_005.txt';
    let ddpath = dpath + '/dir_005';
    let ffpath = ddpath + '/file_005.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.moveFile(fpath, ffpath);
      let stat = fileIO.statSync(ffpath);
      expect(stat.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_test_moveFile_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_001
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0100
   * @tc.desc   Test moveFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_001');
    let fpath = dpath + '/file_006.txt';
    let ddpath = dpath + '/dir_006';
    let ffpath = ddpath + '/file_006.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.moveFile(fpath, ffpath, (err) => {
        if (err) {
          console.log('fileIO_test_moveFile_async_001 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat = fileIO.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_moveFile_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_002
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0200
   * @tc.desc   Test moveFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_002', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_002');
    let fpath = dpath + '/file_007.txt';
    let ddpath = dpath + '/dir_007';
    let ffpath = ddpath + '/file_007.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, ffpath);
      await fileIO.moveFile(fpath, ffpath, 1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveFile_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900015 && e.message == 'File exists').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_003
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0300
   * @tc.desc   Test moveFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_003', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_003');
    let fpath = dpath + '/file_008.txt';
    let ddpath = dpath + '/dir_008';
    let ffpath = ddpath + '/file_008.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyFileSync(fpath, ffpath);
      fileIO.moveFile(fpath, ffpath, 1, (err) => {
        if (err) {
          fileIO.rmdirSync(dpath);
          console.log('fileIO_test_moveFile_async_003 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code === 13900015 && err.message == 'File exists').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_moveFile_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_004
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0400
   * @tc.desc   Test moveFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_004', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_004');
    let fpath = dpath + '/file_009.txt';
    let ddpath = dpath + '/dir_009';
    let ffpath = ddpath + '/file_009.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);

    try {
      await fileIO.moveFile(fpath, ffpath);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveFile_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_005
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0500
   * @tc.desc   Test moveFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_005', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_005');
    let fpath = dpath + '/file_010.txt';
    let ddpath = dpath + '/dir_010';
    let ffpath = ddpath + '/file_010.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);

    try {
      fileIO.moveFile(fpath, ffpath, (err) => {
        if (err) {
          fileIO.rmdirSync(dpath);
          console.log('fileIO_test_moveFile_async_005 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code === 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_moveFile_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_006
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0600
   * @tc.desc   Test moveFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_006', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_006');
    let ddpath = dpath + '/dir_011';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.moveFile(dpath, ddpath);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveFile_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_007
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0700
   * @tc.desc   Test moveFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_007', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_007');
    let ddpath = dpath + '/dir_012';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.moveFile(dpath, ddpath, (err) => {
        if (err) {
          console.log('fileIO_test_moveFile_async_007 error package: ' + JSON.stringify(err));
        }
        expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveFile_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_008
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0800
   * @tc.desc   Test moveFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_008', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_moveFile_async_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.moveFile(fpath);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_moveFile_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code === 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_009
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0900
   * @tc.desc   Test moveFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_009', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_009');
    let fpath = dpath + '/file_013.txt';
    let ddpath = dpath + '/dir_013';
    let ffpath = ddpath + '/file_013.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath, '')).assertTrue();

    try {
      await fileIO.moveFile(fpath, ffpath, 0);
      let stat = fileIO.statSync(ffpath);
      expect(stat.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_test_moveFile_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_010
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1000
   * @tc.desc   Test moveFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveFile_async_010', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_010');
    let fpath = dpath + '/file_014.txt';
    let ddpath = dpath + '/dir_014';
    let ffpath = ddpath + '/file_014.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath, '')).assertTrue();

    try {
      fileIO.moveFile(fpath, ffpath, 0, (err) => {
        if (err) {
          console.log('fileIO_test_moveFile_async_010 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat = fileIO.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_moveFile_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_011
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1100
   * @tc.desc   Test moveFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveFile_async_011', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_011');
    let fpath = dpath + '/file_016.txt';
    let ddpath = dpath + '/dir_016';
    let ffpath = ddpath + '/file_016.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath, '')).assertTrue();

    try {
      await fileIO.moveFile(fpath, ffpath, undefined);
      let stat = fileIO.statSync(ffpath);
      expect(stat.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_test_moveFile_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveFile_async_012
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1200
   * @tc.desc   Test moveFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveFile_async_012', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveFile_async_012');
    let fpath = dpath + '/file_017.txt';
    let ddpath = dpath + '/dir_017';
    let ffpath = ddpath + '/file_017.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath, '')).assertTrue();

    try {
      fileIO.moveFile(fpath, ffpath, undefined, (err) => {
        if (err) {
          console.log('fileIO_test_moveFile_async_012 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat = fileIO.statSync(ffpath);
        expect(stat.size == FILE_CONTENT.length).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_moveFile_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_001
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_001
   * @tc.desc   Test moveFile() interface with empty string src. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_001', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFile_error_001');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      await fileIO.moveFile("", ffpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFile_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_002
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_002
   * @tc.desc   Test moveFile() interface with null src. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_002', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFile_error_002');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      await fileIO.moveFile(null, ffpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFile_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_003
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_003
   * @tc.desc   Test moveFile() interface with undefined src. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_003', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFile_error_003');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      await fileIO.moveFile(undefined, ffpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFile_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_004
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_004
   * @tc.desc   Test moveFile() interface with empty string dest. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_004', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFile_error_004');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileIO.moveFile(fpath, "");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFile_error_004: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_005
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_005
   * @tc.desc   Test moveFile() interface with null dest. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_005', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFile_error_005');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileIO.moveFile(fpath, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFile_error_005: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_006
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_006
   * @tc.desc   Test moveFile() interface with undefined dest. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_006', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFile_error_006');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileIO.moveFile(fpath, undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFile_error_006: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_007
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_007
   * @tc.desc   Test moveFile() interface with null mode. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_007', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFile_error_007');
    let fpath = dpath + '/file.txt';
    let ffpath = dpath + '/file2.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileIO.moveFile(fpath, ffpath, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFile_error_007: ' + e.message + ', code: ' + e.code);
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_008
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_008
   * @tc.desc   Test moveFile() interface with undefined mode. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_008', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFile_error_008');
    let fpath = dpath + '/file.txt';
    let ffpath = dpath + '/file2.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      await fileIO.moveFile(fpath, ffpath, undefined);
      let stat = fileIO.statSync(ffpath);
      expect(stat.size == FILE_CONTENT.length).assertTrue();
      fileIO.unlinkSync(ffpath);
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_moveFile_error_008: ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  // Test cases for moveFile(src: string, dest: string, callback: AsyncCallback<void>): void
  /**
   * @tc.name   fileIO_moveFile_error_009
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_009
   * @tc.desc     Test moveFile() interface with empty string src. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_009', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_009');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      fileIO.moveFile("", ffpath, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_009: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_009: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_010
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_010
   * @tc.desc   Test moveFile() interface with null src. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_010', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_010');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      fileIO.moveFile(null, ffpath, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_010: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid argument').assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_010: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_011
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_011
   * @tc.desc   Test moveFile() interface with undefined src. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_011', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_011');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      fileIO.moveFile(undefined, ffpath, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_011: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid argument').assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_011: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_012
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_012
   * @tc.desc   Test moveFile() interface with empty string dest. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_012', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_012');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFile(fpath, "", function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_012: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          fileIO.unlinkSync(fpath);
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_012: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_013
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_013
   * @tc.desc   Test moveFile() interface with null dest. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_013', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_013');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFile(fpath, null, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_013: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid argument').assertTrue();
          fileIO.unlinkSync(fpath);
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_013: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_014
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_014
   * @tc.desc   Test moveFile() interface with undefined dest. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_014', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_014');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFile(fpath, undefined, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_014: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid argument').assertTrue();
          fileIO.unlinkSync(fpath);
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_014: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  // Test cases for moveFile(src: string, dest: string, mode: number, callback: AsyncCallback<void>): void
  /**
   * @tc.name   fileIO_moveFile_error_015
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_015
   * @tc.desc   Test moveFile() interface with empty string src. Callback with mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_015', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_015');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      fileIO.moveFile("", ffpath, 0, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_015: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_015: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_016
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_016
   * @tc.desc   Test moveFile() interface with null src. Callback with mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_016', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_016');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      fileIO.moveFile(null, ffpath, 0, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_016: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid argument').assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_016: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_017
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_017
   * @tc.desc   Test moveFile() interface with undefined src. Callback with mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_017', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_017');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      fileIO.moveFile(undefined, ffpath, 0, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_017: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid argument').assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_017: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_018
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_018
   * @tc.desc   Test moveFile() interface with empty string dest. Callback with mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_018', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_018');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFile(fpath, "", 0, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_018: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'No such file or directory').assertTrue();
          fileIO.unlinkSync(fpath);
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_018: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_019
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_019
   * @tc.desc   Test moveFile() interface with null dest. Callback with mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_019', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_019');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFile(fpath, null, 0, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_019: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid argument').assertTrue();
          fileIO.unlinkSync(fpath);
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_019: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_moveFile_error_020
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ERROR_020
   * @tc.desc   Test moveFile() interface with undefined dest. Callback with mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFile_error_020', Level.LEVEL2, async function (done) {
    let dpath = await nextFileName('fileIO_moveFile_error_020');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFile(fpath, undefined, 0, function (err) {
        if (err) {
          console.log('fileIO_moveFile_error_020: ' + err.message + ', code: ' + err.code);
          expect(err.message == 'Invalid argument').assertTrue();
          fileIO.unlinkSync(fpath);
          fileIO.rmdirSync(dpath);
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_moveFile_error_020: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  // Test cases for moveFileSync(src: string, dest: string, mode?: number): void
  /**
   * @tc.name   fileIO_moveFileSync_error_001
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_ERROR_001
   * @tc.desc   Test moveFileSync() interface with empty string src.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFileSync_error_001', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFileSync_error_001');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      fileIO.moveFileSync("", ffpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFileSync_error_001: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFileSync_error_002
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_ERROR_002
   * @tc.desc   Test moveFileSync() interface with null src.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFileSync_error_002', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFileSync_error_002');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      fileIO.moveFileSync(null, ffpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFileSync_error_002: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFileSync_error_003
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_ERROR_003
   * @tc.desc   Test moveFileSync() interface with undefined src.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFileSync_error_003', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFileSync_error_003');
    let ffpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    try {
      fileIO.moveFileSync(undefined, ffpath);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFileSync_error_003: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFileSync_error_004
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_ERROR_004
   * @tc.desc   Test moveFileSync() interface with empty string dest.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFileSync_error_004', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFileSync_error_004');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFileSync(fpath, "");
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFileSync_error_004: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'No such file or directory').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFileSync_error_005
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_ERROR_005
   * @tc.desc   Test moveFileSync() interface with null dest.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFileSync_error_005', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFileSync_error_005');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFileSync(fpath, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFileSync_error_005: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFileSync_error_006
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_ERROR_006
   * @tc.desc   Test moveFileSync() interface with undefined dest.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFileSync_error_006', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFileSync_error_006');
    let fpath = dpath + '/file.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFileSync(fpath, undefined);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFileSync_error_006: ' + e.message + ', code: ' + e.code);
      expect(e.message == 'Invalid argument').assertTrue();
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFileSync_error_007
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_ERROR_007
   * @tc.desc   Test moveFileSync() interface with null mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFileSync_error_007', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFileSync_error_007');
    let fpath = dpath + '/file.txt';
    let ffpath = dpath + '/file2.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFileSync(fpath, ffpath, null);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_moveFileSync_error_007: ' + e.message + ', code: ' + e.code);
      fileIO.unlinkSync(fpath);
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_moveFileSync_error_008
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_ERROR_008
   * @tc.desc   Test moveFileSync() interface with undefined mode.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it('fileIO_moveFileSync_error_008', Level.LEVEL2, async function () {
    let dpath = await nextFileName('fileIO_moveFileSync_error_008');
    let fpath = dpath + '/file.txt';
    let ffpath = dpath + '/file2.txt';
    fileIO.mkdirSync(dpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    try {
      fileIO.moveFileSync(fpath, ffpath, undefined);
      let stat = fileIO.statSync(ffpath);
      expect(stat.size == FILE_CONTENT.length).assertTrue();
      fileIO.unlinkSync(ffpath);
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_moveFileSync_error_008: ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}