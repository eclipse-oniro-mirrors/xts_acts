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
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0000
   * @tc.name fileIO_test_moveFile_sync_000
   * @tc.desc Test moveFileSync() interface.
   * Move a single file, shall work properly in normal case.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0100
   * @tc.name fileIO_test_moveFile_sync_001
   * @tc.desc Test moveFileSync() interface.
   * A file with the same name already exists under the destination path.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0200
   * @tc.name fileIO_test_moveFile_sync_002
   * @tc.desc Test moveFileSync() interface.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0400
   * @tc.name fileIO_test_moveFile_sync_004
   * @tc.desc Test moveFileSync() interface.
   * The path point to a directory, not a file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0500
   * @tc.name fileIO_test_moveFile_sync_005
   * @tc.desc Test moveFileSync() interface.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0600
   * @tc.name fileIO_test_moveFile_sync_006
   * @tc.desc Test moveFileSync() interface.
   * Entry parameters increase forced movement when mode = 0.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_MOVEFILE_SYNC_0700
   * @tc.name fileIO_test_moveFile_sync_007
   * @tc.desc Test moveFileSync() interface.
   * Undefined option arguments, use default mode = 0.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0000
   * @tc.name fileIO_test_moveFile_async_000
   * @tc.desc Test moveFile() interface. Promise.
   * Move a single file, shall work properly in normal case.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0100
   * @tc.name fileIO_test_moveFile_async_001
   * @tc.desc Test moveFile() interface. Callback.
   * Move a single file, shall work properly in normal case.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0200
   * @tc.name fileIO_test_moveFile_async_002
   * @tc.desc Test moveFile() interface. Promise.
   * A file with the same name already exists under the destination path.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
      done();
    }
  });

/**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0300
   * @tc.name fileIO_test_moveFile_async_003
   * @tc.desc Test moveFile() interface. Callback.
   * A file with the same name already exists under the destination path.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
          expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_moveFile_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0400
   * @tc.name fileIO_test_moveFile_async_004
   * @tc.desc Test moveFile() interface. Promise.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0500
   * @tc.name fileIO_test_moveFile_async_005
   * @tc.desc Test moveFile() interface. Callback.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_moveFile_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0600
   * @tc.name fileIO_test_moveFile_async_006
   * @tc.desc Test moveFile() interface. Promise.
   * The path point to a directory, not a file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0700
   * @tc.name fileIO_test_moveFile_async_007
   * @tc.desc Test moveFile() interface. Callback.
   * The path point to a directory, not a file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0800
   * @tc.name fileIO_test_moveFile_async_008
   * @tc.desc Test moveFile() interface. Promise.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_0900
   * @tc.name fileIO_test_moveFile_async_009
   * @tc.desc Test moveFile() interface. Promise.
   * Entry parameters increase forced movement when mode = 0.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1000
   * @tc.name fileIO_test_moveFile_async_010
   * @tc.desc Test moveFile() interface. Callback.
   * Entry parameters increase forced movement when mode = 0.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1100
   * @tc.name fileIO_test_moveFile_async_011
   * @tc.desc Test moveFile() interface. Promise.
   * Undefined option arguments, use default mode = 0.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_MOVEFILE_ASYNC_1200
   * @tc.name fileIO_test_moveFile_async_012
   * @tc.desc Test moveFile() interface. Callback.
   * Undefined option arguments, use default mode = 0.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
});
}