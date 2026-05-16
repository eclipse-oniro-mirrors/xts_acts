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

import featureAbility from '@ohos.ability.featureAbility';
import {
    fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect, randomString
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIOMoveDir() {
  describe('fileIO_fs_moveDir', function () {
    const DIRMODE_DIRECTORY_THROW_ERR  = 0;
    const DIRMODE_FILE_THROW_ERR = 1;
    const DIRMODE_FILE_REPLACE = 2;
    const DIRMODE_DIRECTORY_REPLACE = 3;
    let readyFiles = async (testNum) => {
      let dpath = await featureAbility.getContext().getFilesDir() + '/' + testNum;
      try {
        let ddpath1 = dpath + '/srcDir';
        let ddpath2 = dpath + '/destDir';
        let dddpath1 = ddpath1 + '/srcDir_first';
        let dddpath2 = ddpath2 + '/srcDir';
        let fpath1 = ddpath1 + '/srcFile_first_01';
        let fpath2 = ddpath1 + '/srcFile_first_02';
        let fpath3 = dddpath2 + '/srcFile_first_01';
        let fpath4 = dddpath2 + '/destFile_second_01';
        let ffpath1 = dddpath1 + '/srcFile_second_01';
        let ffpath2 = dddpath1 + '/srcFile_second_02';
        let ddddpath1 = dddpath1 + '/srcDir_second';
        let ddddpath2 = dddpath2 + '/srcDir_first';
        let fffpath1 = ddddpath1 + '/srcFile_third_01';
        let fffpath2 = ddddpath1 + '/srcFile_third_02';
        let fffpath3 = ddddpath2 + '/srcFile_second_01';
        let fffpath4 = ddddpath2 + '/destFile_third_01';
        fileIO.mkdirSync(dpath);
        fileIO.mkdirSync(ddpath1);
        fileIO.mkdirSync(ddpath2);
        fileIO.mkdirSync(dddpath1);
        fileIO.mkdirSync(dddpath2);
        fileIO.mkdirSync(ddddpath1);
        fileIO.mkdirSync(ddddpath2);
        expect(prepareFile(fpath1, randomString(10))).assertTrue();
        expect(prepareFile(fpath2, randomString(15))).assertTrue();
        expect(prepareFile(fpath3, randomString(20))).assertTrue();
        expect(prepareFile(fpath4, randomString(25))).assertTrue();
        expect(prepareFile(ffpath1, randomString(30))).assertTrue();
        expect(prepareFile(ffpath2, randomString(35))).assertTrue();
        expect(prepareFile(fffpath1, randomString(40))).assertTrue();
        expect(prepareFile(fffpath2, randomString(45))).assertTrue();
        expect(prepareFile(fffpath3, randomString(50))).assertTrue();
        expect(prepareFile(fffpath4, randomString(55))).assertTrue();
        return {
          baseDir: dpath,
          srcDir: ddpath1,
          destDir: ddpath2
        };
      } catch (e) {
        console.log(testNum + 'failed to readyFiles for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
        return {
          baseDir: dpath,
          srcDir: null,
          destDir: null
        }
      }
    }

  /**
   * @tc.name   fileIO_test_moveDir_sync_000
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0000
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_sync_000', Level.LEVEL0, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_sync_000';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    let fpath2 = ddpath1 + '/srcFile_first_02';
    let dddpath = ddpath1 + '/srcDir_first';
    let ffpath1 = dddpath + '/srcFile_second_01';
    let ffpath2 = dddpath + '/srcFile_second_02';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();
    expect(prepareFile(fpath2, randomString(15))).assertTrue();
    expect(prepareFile(ffpath1, randomString(20))).assertTrue();
    expect(prepareFile(ffpath2, randomString(25))).assertTrue();

    try {
      let stat1 = fileIO.statSync(fpath1);
      let stat2 = fileIO.statSync(ffpath1);
      fileIO.moveDirSync(ddpath1, ddpath2);
      expect(fileIO.accessSync(ddpath1)).assertFalse();
      expect(fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
      expect(fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      let stat3 = fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
      expect(stat1.size == stat3.size).assertTrue();
      let stat4 = fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size == stat4.size).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_test_moveDir_sync_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_001
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0100
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_sync_001', Level.LEVEL0, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_sync_001';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let dddpath2 = ddpath2 + '/srcDir';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    let fpath2 = ddpath1 + '/srcFile_first_02';
    let dddpath1 = ddpath1 + '/srcDir_first';
    let ffpath1 = dddpath1 + '/srcFile_second_01';
    let ffpath2 = dddpath1 + '/srcFile_second_02';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath1);
    fileIO.mkdirSync(dddpath2);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();
    expect(prepareFile(fpath2, randomString(15))).assertTrue();
    expect(prepareFile(ffpath1, randomString(20))).assertTrue();
    expect(prepareFile(ffpath2, randomString(25))).assertTrue();

    try {
      let stat1 = fileIO.statSync(fpath1);
      let stat2 = fileIO.statSync(ffpath1);
      fileIO.moveDirSync(ddpath1, ddpath2);
      expect(fileIO.accessSync(ddpath1)).assertFalse();
      expect(fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
      expect(fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      let stat3 = fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
      expect(stat1.size == stat3.size).assertTrue();
      let stat4 = fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size == stat4.size).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_test_moveDir_sync_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_002
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0200
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_sync_002', Level.LEVEL0, async function () {
    let dpath = await readyFiles('fileIO_test_moveDir_sync_002');

    try {
      let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
      let dirent1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent1.length == 4).assertTrue();
      fileIO.moveDirSync(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_REPLACE);
      expect(fileIO.accessSync(dpath.srcDir)).assertFalse();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertFalse();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertFalse();
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      expect(stat1.size == stat3.size).assertTrue();
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size == stat4.size).assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 6).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
    } catch (e) {
      console.log('fileIO_test_moveDir_sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_003
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0300
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_sync_003', Level.LEVEL0, async function () {
    let dpath = await readyFiles('fileIO_test_moveDir_sync_003');

    try {
      let stat1 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      let dirent1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent1.length == 4).assertTrue();
      fileIO.moveDirSync(dpath.srcDir, dpath.destDir, DIRMODE_FILE_REPLACE);
      expect(fileIO.accessSync(dpath.srcDir)).assertFalse();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
    } catch (e) {
      console.log('fileIO_test_moveDir_sync_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_004
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0400
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_sync_004', Level.LEVEL0, async function () {
    let dpath = await readyFiles('fileIO_test_moveDir_async_008');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      fileIO.moveDirSync(dpath.srcDir, dpath.destDir, DIRMODE_FILE_THROW_ERR);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_moveDir_sync_004 has failed for ' + e.message + ', code: ' + e.code);
      let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
      expect(e.data.length == 2).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_005
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0500
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_sync_005', Level.LEVEL0, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_sync_005';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let dddpath1 = ddpath1 + '/srcDir_first';
    let dddpath2 = ddpath2 + '/srcDir';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    let fpath2 = ddpath1 + '/srcFile_first_02';
    let fpath3 = dddpath2 + '/srcFile_first_01';
    let fpath4 = dddpath2 + '/destFile_first_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath1);
    fileIO.mkdirSync(dddpath2);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();
    expect(prepareFile(fpath2, randomString(15))).assertTrue();
    expect(prepareFile(fpath3, randomString(20))).assertTrue();
    expect(prepareFile(fpath4, randomString(25))).assertTrue();

    try {
      fileIO.moveDirSync(ddpath1, ddpath2, DIRMODE_DIRECTORY_THROW_ERR);
      expect(false).assertTrue();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveDir_sync_005 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900032 && err.message == 'Directory not empty').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_006
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0600
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_sync_006', Level.LEVEL3, async function () {
    let dpath = await nextFileName('fileIO_test_moveDir_sync_006');
    let fpath = dpath + '/file_006.txt';
    let ddpath = dpath + '/dir_006';
    let ddpath2 = dpath + '/dir2_006';
    let ffpath3 = ddpath2 + '/new.txt';
    let dddpath3= ddpath2 + '/dir_006';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath3);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();

    try {
      fileIO.moveDirSync(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
      expect(fileIO.accessSync(ddpath)).assertFalse();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_test_moveDir_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_007
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0700
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_sync_007', Level.LEVEL3, async function () {
    let dpath = await nextFileName('fileIO_test_moveDir_sync_007');
    let fpath = dpath + '/file_007.txt';
    let ddpath = dpath + '/dir_007';
    let ddpath2 = dpath + '/dir2_007';
    let ffpath3 = ddpath2 + '/new.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();

    try {
      fileIO.moveDirSync(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
      expect(fileIO.accessSync(ddpath)).assertFalse();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_test_moveDir_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_008
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0800
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_sync_008', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_sync_008';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let dddpath1 = ddpath1 + '/srcDir_first';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath1);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();

    try {
      const INVALIDE_MODE = -1;
      fileIO.moveDirSync(ddpath1, ddpath2, INVALIDE_MODE);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveDir_sync_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_009
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0900
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_sync_009', Level.LEVEL3, async function () {
    let dpath = await nextFileName('fileIO_test_moveDir_sync_009');
    let fpath = dpath + '/file_000.txt';
    let ddpath = dpath + '/dir_000';
    let ffpath = ddpath + '/file_000.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.moveDirSync(fpath, ffpath);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveDir_sync_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_010
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1000
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_sync_010', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_sync_010';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let dddpath1 = ddpath1 + '/srcDir_first';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath1);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();

    try {
      fileIO.moveDirSync(ddpath1, ddpath1, DIRMODE_FILE_THROW_ERR);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveDir_sync_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_011
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1100
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_sync_011', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_sync_011';
    let ddpath1 = dpath + '/srcDir';
    let dddpath1 = ddpath1 + '/srcDir_first';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    let fpath2 = ddpath1 + '/srcFile_first_02';
    let ffpath1 = dddpath1 + '/srcFile_second_01';
    let ffpath2 = dddpath1 + '/srcFile_second_02';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(dddpath1);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();
    expect(prepareFile(fpath2, randomString(15))).assertTrue();
    expect(prepareFile(ffpath1, randomString(20))).assertTrue();
    expect(prepareFile(ffpath2, randomString(25))).assertTrue();

    try {
      fileIO.moveDirSync(ddpath1, dddpath1, DIRMODE_FILE_THROW_ERR);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveDir_sync_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_sync_012
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1200
   * @tc.desc   Test moveDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_sync_012', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_sync_012';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let dddpath1 = ddpath1 + '/srcDir_first';
    let dddpath2 = ddpath2 + '/srcDir';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    let fpath2 = ddpath1 + '/srcFile_first_02';
    let fpath3 = dddpath2 + '/srcFile_first_01';
    let fpath4 = dddpath2 + '/destFile_first_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath1);
    fileIO.mkdirSync(dddpath2);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();
    expect(prepareFile(fpath2, randomString(15))).assertTrue();
    expect(prepareFile(fpath3, randomString(20))).assertTrue();
    expect(prepareFile(fpath4, randomString(25))).assertTrue();

    try {
      fileIO.moveDirSync(ddpath1, ddpath2, DIRMODE_DIRECTORY_THROW_ERR);
      expect(false).assertTrue();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_moveDir_sync_012 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900032 && err.message == 'Directory not empty').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_000
   * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0000
   * @tc.desc   Test moveDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_000', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_async_000';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    let fpath2 = ddpath1 + '/srcFile_first_02';
    let dddpath = ddpath1 + '/srcDir_first';
    let ffpath1 = dddpath + '/srcFile_second_01';
    let ffpath2 = dddpath + '/srcFile_second_02';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();
    expect(prepareFile(fpath2, randomString(15))).assertTrue();
    expect(prepareFile(ffpath1, randomString(20))).assertTrue();
    expect(prepareFile(ffpath2, randomString(25))).assertTrue();

    try {
      let stat1 = fileIO.statSync(fpath1);
      let stat2 = fileIO.statSync(ffpath1);
      await fileIO.moveDir(ddpath1, ddpath2);
      expect(fileIO.accessSync(ddpath1)).assertFalse();
      expect(fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
      expect(fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      let stat3 = fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
      expect(stat1.size == stat3.size).assertTrue();
      let stat4 = fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size == stat4.size).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_test_moveDir_async_000 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_001
   * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0100
   * @tc.desc   Test moveDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_001', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_async_001';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    let fpath2 = ddpath1 + '/srcFile_first_02';
    let dddpath = ddpath1 + '/srcDir_first';
    let ffpath1 = dddpath + '/srcFile_second_01';
    let ffpath2 = dddpath + '/srcFile_second_02';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();
    expect(prepareFile(fpath2, randomString(15))).assertTrue();
    expect(prepareFile(ffpath1, randomString(20))).assertTrue();
    expect(prepareFile(ffpath2, randomString(25))).assertTrue();

    try {
      let stat1 = fileIO.statSync(fpath1);
      let stat2 = fileIO.statSync(ffpath1);
      fileIO.moveDir(ddpath1, ddpath2, (err) => {
        if (err) {
          console.log('fileIO_test_moveDir_async_001 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(ddpath1)).assertFalse();
        expect(fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
        expect(fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let stat3 = fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
        expect(stat1.size == stat3.size).assertTrue();
        let stat4 = fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size == stat4.size).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_002
   * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0200
   * @tc.desc   Test moveDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_002', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_async_002';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let dddpath2 = ddpath2 + '/srcDir';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    let fpath2 = ddpath1 + '/srcFile_first_02';
    let dddpath1 = ddpath1 + '/srcDir_first';
    let ffpath1 = dddpath1 + '/srcFile_second_01';
    let ffpath2 = dddpath1 + '/srcFile_second_02';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath1);
    fileIO.mkdirSync(dddpath2);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();
    expect(prepareFile(fpath2, randomString(15))).assertTrue();
    expect(prepareFile(ffpath1, randomString(20))).assertTrue();
    expect(prepareFile(ffpath2, randomString(25))).assertTrue();

    try {
      let stat1 = fileIO.statSync(fpath1);
      let stat2 = fileIO.statSync(ffpath1);
      await fileIO.moveDir(ddpath1, ddpath2);
      expect(fileIO.accessSync(ddpath1)).assertFalse();
      expect(fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
      expect(fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      let stat3 = fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
      expect(stat1.size == stat3.size).assertTrue();
      let stat4 = fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size == stat4.size).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_test_moveDir_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_003
   * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0300
   * @tc.desc   Test moveDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_003', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_moveDir_async_003';
    let ddpath1 = dpath + '/srcDir';
    let ddpath2 = dpath + '/destDir';
    let dddpath2 = ddpath2 + '/srcDir';
    let fpath1 = ddpath1 + '/srcFile_first_01';
    let fpath2 = ddpath1 + '/srcFile_first_02';
    let dddpath1 = ddpath1 + '/srcDir_first';
    let ffpath1 = dddpath1 + '/srcFile_second_01';
    let ffpath2 = dddpath1 + '/srcFile_second_02';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath1);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath1);
    fileIO.mkdirSync(dddpath2);
    expect(prepareFile(fpath1, randomString(10))).assertTrue();
    expect(prepareFile(fpath2, randomString(15))).assertTrue();
    expect(prepareFile(ffpath1, randomString(20))).assertTrue();
    expect(prepareFile(ffpath2, randomString(25))).assertTrue();

    try {
      let stat1 = fileIO.statSync(fpath1);
      let stat2 = fileIO.statSync(ffpath1);
      fileIO.moveDir(ddpath1, ddpath2, (err) => {
        if (err) {
          console.log('fileIO_test_moveDir_async_003 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(ddpath1)).assertFalse();
        expect(fileIO.accessSync(ddpath2 + '/srcDir/srcFile_first_01')).assertTrue();
        expect(fileIO.accessSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        let stat3 = fileIO.statSync(ddpath2 + '/srcDir/srcFile_first_01');
        expect(stat1.size == stat3.size).assertTrue();
        let stat4 = fileIO.statSync(ddpath2 + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size == stat4.size).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_004
   * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0400
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_async_004', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_004');

    try {
      let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
      let dirent1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent1.length == 4).assertTrue();
      await fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_REPLACE);
      expect(fileIO.accessSync(dpath.srcDir)).assertFalse();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertFalse();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertFalse();
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      expect(stat1.size == stat3.size).assertTrue();
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size == stat4.size).assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 6).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    } catch (e) {
      console.log('fileIO_test_moveDir_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_005
   * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0500
   * @tc.desc   Test moveFile() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_async_005', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_005');

    try {
      let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
      let dirent1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent1.length == 4).assertTrue();
      fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_moveDir_async_005 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(dpath.srcDir)).assertFalse();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertFalse();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertFalse();
        let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size == stat3.size).assertTrue();
        let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size == stat4.size).assertTrue();
        let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 6).assertTrue();
        fileIO.rmdirSync(dpath.baseDir);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_006
   * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0600
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_async_006', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_006');

    try {
      let stat1 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      let dirent1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent1.length == 4).assertTrue();
      await fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_REPLACE);
      expect(fileIO.accessSync(dpath.srcDir)).assertFalse();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
      } catch (e) {
        console.log('fileIO_test_moveDir_async_006 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_007
   * @tc.number SUB_DF_FILEIO_MOVEDIR_ASYNC_0700
   * @tc.desc   Test moveFile() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_async_007', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_007');

    try {
      let stat1 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      let dirent1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent1.length == 4).assertTrue();
      fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_moveDir_async_007 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(dpath.srcDir)).assertFalse();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
        let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
        let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        fileIO.rmdirSync(dpath.baseDir);
        done();
      });
      } catch (e) {
        console.log('fileIO_test_moveDir_async_007 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_008
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0800
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_async_008', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_008');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      await fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_THROW_ERR);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_moveDir_async_008 has failed for ' + err.message + ', code: ' + err.code);
      let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
      expect(err.data.length == 2).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_009
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_0900
   * @tc.desc   Test moveFile() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_async_009', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_009');

    try {
      let dirent1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent1.length == 4).assertTrue();
      fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_THROW_ERR, (err) => {
        if (err) {
          console.log('fileIO_test_moveDir_async_009 error:' + JSON.stringify(err));
          let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
          let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
          let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
          expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
          let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
          expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
          let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
          expect(dirent2.length == 8).assertTrue();
          fileIO.rmdirSync(dpath.baseDir);
          expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
          expect(err.data.length == 2).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_010
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1000
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_async_010', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_010');

    try {
      await fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_THROW_ERR);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath.baseDir);
      console.log('fileIO_test_moveDir_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900032 && e.message == 'Directory not empty').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_011
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1100
   * @tc.desc   Test moveFile() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_moveDir_async_011', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_011');

    try {
      fileIO.moveDir(dpath.srcDir, dpath.destDir, DIRMODE_DIRECTORY_THROW_ERR, (err) => {
        if (err) {
          fileIO.rmdirSync(dpath.baseDir);
          console.log('fileIO_test_moveDir_async_011 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900032 && err.message == 'Directory not empty').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_012
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1200
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_012', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveDir_async_012');
    let fpath = dpath + '/file_006.txt';
    let ddpath = dpath + '/dir_006';
    let ddpath2 = dpath + '/dir2_006';
    let ffpath3 = ddpath2 + '/new.txt';
    let dddpath3= ddpath2 + '/dir_006';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath3);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
      expect(fileIO.accessSync(ddpath)).assertFalse();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_test_moveDir_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_013
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1300
   * @tc.desc   Test moveFile() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_013', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveDir_async_013');
    let fpath = dpath + '/file_006.txt';
    let ddpath = dpath + '/dir_006';
    let ddpath2 = dpath + '/dir2_006';
    let ffpath3 = ddpath2 + '/new.txt';
    let dddpath3= ddpath2 + '/dir_006';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath3);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();

    try {
      fileIO.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_moveDir_async_013 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(ddpath)).assertFalse();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_014
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1400
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_014', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveDir_async_014');
    let fpath = dpath + '/file_007.txt';
    let ddpath = dpath + '/dir_007';
    let ddpath2 = dpath + '/dir2_007';
    let ffpath3 = ddpath2 + '/new.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE);
      expect(fileIO.accessSync(ddpath)).assertFalse();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_test_moveDir_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_015
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1500
   * @tc.desc   Test moveFile() interface.CallBack.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_015', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_test_moveDir_async_015');
    let fpath = dpath + '/file_007.txt';
    let ddpath = dpath + '/dir_007';
    let ddpath2 = dpath + '/dir2_007';
    let ffpath3 = ddpath2 + '/new.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();

    try {
      fileIO.moveDir(ddpath, ddpath2, DIRMODE_FILE_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_moveDir_async_015 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(ddpath)).assertFalse();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_016
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1600
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_016', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_016');

    try {
      const INVALIDE_MODE = -1;
      await fileIO.moveDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE);
      expect(false).assertTrue();
    } catch (err) {
      fileIO.rmdirSync(dpath.baseDir);
      console.log('fileIO_test_moveDir_async_016 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_017
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1700
   * @tc.desc   Test moveFile() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_017', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_017');

    try {
      const INVALIDE_MODE = 4;
      fileIO.moveDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.rmdirSync(dpath.baseDir);
      console.log('fileIO_test_moveDir_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_018
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1800
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_018', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_018');

    try {
      await fileIO.moveDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01');
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath.baseDir);
      console.log('fileIO_test_moveDir_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_019
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_1900
   * @tc.desc   Test moveFile() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_019', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_019');

    try {
      fileIO.moveDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01', (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      fileIO.rmdirSync(dpath.baseDir);
      console.log('fileIO_test_moveDir_async_019 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_020
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_2000
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_020', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_020');

    try {
      await fileIO.moveDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_THROW_ERR);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath.baseDir);
      console.log('fileIO_test_moveDir_async_020 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_021
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_2100
   * @tc.desc   Test moveFile() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_021', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_021');

    try {
      fileIO.moveDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_THROW_ERR, (err) => {
        if (err) {
          fileIO.rmdirSync(dpath.baseDir);
          console.log('fileIO_test_moveDir_async_021 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_021 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_022
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_2200
   * @tc.desc   Test moveFile() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_022', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_023');

    try {
      await fileIO.moveDir(dpath.srcDir, dpath.srcDir + '/srcDir_first', DIRMODE_FILE_THROW_ERR);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath.baseDir);
      console.log('fileIO_test_moveDir_async_022 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_023
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_2300
   * @tc.desc   Test moveFile() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_023', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_023');

    try {
      fileIO.moveDir(dpath.srcDir, dpath.srcDir + '/srcDir_first', DIRMODE_FILE_THROW_ERR, (err) => {
        if (err) {
          fileIO.rmdirSync(dpath.baseDir);
          console.log('fileIO_test_moveDir_async_023 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_023 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_024
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_2400
   * @tc.desc   Test moveFile() interface. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_024', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_024');

    try {
      await fileIO.moveDir(dpath.srcDir, dpath.destDir, undefined);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath.baseDir);
      console.log('fileIO_test_moveDir_async_024 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900032 && e.message == 'Directory not empty').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_moveDir_async_025
   * @tc.number SUB_DF_FILEIO_MOVEDIRSYNC_2500
   * @tc.desc   Test moveFile() interface. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_moveDir_async_025', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_moveDir_async_025');

    try {
      fileIO.moveDir(dpath.srcDir, dpath.destDir, undefined, (err) => {
        if (err) {
          fileIO.rmdirSync(dpath.baseDir);
          console.log('fileIO_test_moveDir_async_025 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900032 && err.message == 'Directory not empty').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_moveDir_async_025 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}