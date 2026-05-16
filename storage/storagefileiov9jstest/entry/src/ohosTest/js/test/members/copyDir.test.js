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
    fileIO, FILE_CONTENT, prepareFile, describe, it, expect, randomString, nextFileName
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIOCopyDir() {
  describe('fileIO_fs_copyDir', function () {
    const DIRMODE_FILE_COPY_THROW_ERR = 0;
    const DIRMODE_FILE_COPY_REPLACE = 1;
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
   * @tc.name   fileIO_test_copyDir_sync_000
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0000
   * @tc.desc   Test copyDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_000', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_000';
    let ddpath = dpath + '/srcDir_first';
    let ffpath = ddpath + '/srcFile_first_01';
    let ffpath2 = ddpath + '/srcFile_first_02';
    let dddpath = ddpath + '/srcDir_second';
    let fffpath = dddpath + '/srcFile_second_01';
    let ddpath2 = dpath + '/destDir_first';
    let ffpath3 = ddpath2 + '/destFile_first_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath);
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyDirSync(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
      let stat1 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
      expect(stat1.size == FILE_CONTENT.length).assertTrue();
      let stat2 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
      expect(stat2.size == FILE_CONTENT.length).assertTrue();
      expect(fileIO.accessSync(ddpath)).assertTrue();
      expect(fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
      let stat3 = fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
      expect(stat3.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_000 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_001
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0100
   * @tc.desc   Test copyDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_001', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_001';
    let ddpath = dpath + '/srcDir_first';
    let ffpath = ddpath + '/srcFile_first_01';
    let ffpath2 = ddpath + '/srcFile_first_02';
    let dddpath = ddpath + '/srcDir_second';
    let fffpath = dddpath + '/srcFile_second_01';
    let ddpath2 = dpath + '/destDir_first';
    let ffpath3 = ddpath2 + '/destFile_first_01';
    let dddpath2= ddpath2 + '/srcDir_first';
    let fffpath2 = dddpath2 + '/destFile_second_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath);
    fileIO.mkdirSync(dddpath2);
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath2, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyDirSync(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
      let stat1 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
      expect(stat1.size == FILE_CONTENT.length).assertTrue();
      let stat2 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
      expect(stat2.size == FILE_CONTENT.length).assertTrue();
      expect(fileIO.accessSync(ddpath)).assertTrue();
      expect(fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
      let stat3 = fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
      expect(stat3.size == FILE_CONTENT.length).assertTrue();
      let stat4 = fileIO.statSync(ddpath2 + '/srcDir_first/destFile_second_01');
      expect(stat4.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_001 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_002
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0200
   * @tc.desc   Test copyDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_copyDir_sync_002', Level.LEVEL0, async function () {
    let dpath = await readyFiles('fileIO_test_copyDir_sync_002');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      fileIO.copyDirSync(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_THROW_ERR);
      expect(false).assertTrue();
      } catch (err) {
      console.log('fileIO_test_copyDir_sync_002 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      expect(fileIO.accessSync(dpath.srcDir)).assertTrue();
      let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
      expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
      expect(err.data.length == 2).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_003
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0300
   * @tc.desc   Test copyDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_copyDir_sync_003', Level.LEVEL0, async function () {
    let dpath = await readyFiles('fileIO_test_copyDir_sync_003');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      let stat1 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      fileIO.copyDirSync(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_REPLACE);
      expect(fileIO.accessSync(dpath.srcDir)).assertTrue();
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_003 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_004
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0400
   * @tc.desc   Test copyDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_004', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_004';
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
      fileIO.copyDirSync(ddpath1, ddpath2, INVALIDE_MODE);
      expect(false).assertTrue();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_sync_004 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_005
   * @tc.number SUB_DF_FILEIO_COPYDIRSYNC_0500
   * @tc.desc   Test copyDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_005', Level.LEVEL3, async function () {
    let dpath = await nextFileName('fileIO_test_copyDir_sync_005');
    let fpath = dpath + '/file_000.txt';
    let ddpath = dpath + '/dir_000';
    let ffpath = ddpath + '/file_000.txt';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyDirSync(fpath, ffpath);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_sync_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_006
   * @tc.number SUB_DF_FILEIO_COPYDIRSYNC_0600
   * @tc.desc   Test copyDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_006', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_006';
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
      fileIO.copyDirSync(ddpath1, ddpath1, DIRMODE_FILE_COPY_THROW_ERR);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_007
   * @tc.number SUB_DF_FILEIO_COPYDIRSYNC_0700
   * @tc.desc   Test copyDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_007', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_007';
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
      fileIO.copyDirSync(ddpath1, dddpath1, DIRMODE_FILE_COPY_THROW_ERR);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_sync_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_008
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0800
   * @tc.desc   Test copyDirSync() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_008', Level.LEVEL3, async function () {
    let dpath = await readyFiles('fileIO_test_copyDir_sync_008');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      fileIO.copyDirSync(dpath.srcDir, dpath.destDir, undefined);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_008 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      expect(fileIO.accessSync(dpath.srcDir)).assertTrue();
      let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
      expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
      expect(err.data.length == 2).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_009
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0900
   * @tc.desc   Test copyDirSync() interface with src as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_009', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_009';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDirSync('', dpath, DIRMODE_FILE_COPY_REPLACE);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_009 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_010
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_1000
   * @tc.desc   Test copyDirSync() interface with src as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_010', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_010';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDirSync(null, dpath, DIRMODE_FILE_COPY_REPLACE);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_010 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_011
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_1100
   * @tc.desc   Test copyDirSync() interface with src as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_011', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_011';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDirSync(undefined, dpath, DIRMODE_FILE_COPY_REPLACE);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_011 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_012
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_1200
   * @tc.desc   Test copyDirSync() interface with dest as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_012', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_012';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDirSync(dpath, '', DIRMODE_FILE_COPY_REPLACE);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_012 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_013
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_1300
   * @tc.desc   Test copyDirSync() interface with dest as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_013', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_013';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDirSync(dpath, null, DIRMODE_FILE_COPY_REPLACE);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_013 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_014
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_1400
   * @tc.desc   Test copyDirSync() interface with dest as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_014', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_014';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDirSync(dpath, undefined, DIRMODE_FILE_COPY_REPLACE);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_014 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_015
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_1500
   * @tc.desc   Test copyDirSync() interface with mode as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_015', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_015';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDirSync(dpath, dpath + '_dest', '');
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_015 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_016
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_1600
   * @tc.desc   Test copyDirSync() interface with mode as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_016', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_016';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDirSync(dpath, dpath + '_dest', null);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_016 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_sync_017
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_1700
   * @tc.desc   Test copyDirSync() interface with mode as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_sync_017', Level.LEVEL3, async function () {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_sync_017';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDirSync(dpath, dpath + '_dest', undefined);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_sync_017 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code === 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_000
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0000
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_000', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_000';
    let ddpath = dpath + '/srcDir_first';
    let ffpath = ddpath + '/srcFile_first_01';
    let ffpath2 = ddpath + '/srcFile_first_02';
    let dddpath = ddpath + '/srcDir_second';
    let fffpath = dddpath + '/srcFile_second_01';
    let ddpath2 = dpath + '/destDir_first';
    let ffpath3 = ddpath2 + '/destFile_first_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath);
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
      let stat1 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
      expect(stat1.size == FILE_CONTENT.length).assertTrue();
      let stat2 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
      expect(stat2.size == FILE_CONTENT.length).assertTrue();
      expect(fileIO.accessSync(ddpath)).assertTrue();
      expect(fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
      let stat3 = fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
      expect(stat3.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_copyDir_async_000 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_001
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0100
   * @tc.desc   Test copyDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_001', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_001';
    let ddpath = dpath + '/srcDir_first';
    let ffpath = ddpath + '/srcFile_first_01';
    let ffpath2 = ddpath + '/srcFile_first_02';
    let dddpath = ddpath + '/srcDir_second';
    let fffpath = dddpath + '/srcFile_second_01';
    let ddpath2 = dpath + '/destDir_first';
    let ffpath3 = ddpath2 + '/destFile_first_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath);
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_001 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
        expect(stat1.size == FILE_CONTENT.length).assertTrue();
        let stat2 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
        expect(stat2.size == FILE_CONTENT.length).assertTrue();
        expect(fileIO.accessSync(ddpath)).assertTrue();
        expect(fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
        let stat3 = fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
        expect(stat3.size == FILE_CONTENT.length).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (err) {
      console.log('fileIO_test_copyDir_async_001 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_002
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0200
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_002', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_002';
    let ddpath = dpath + '/srcDir_first';
    let ffpath = ddpath + '/srcFile_first_01';
    let ffpath2 = ddpath + '/srcFile_first_02';
    let dddpath = ddpath + '/srcDir_second';
    let fffpath = dddpath + '/srcFile_second_01';
    let ddpath2 = dpath + '/destDir_first';
    let ffpath3 = ddpath2 + '/destFile_first_01';
    let dddpath2= ddpath2 + '/srcDir_first';
    let fffpath2 = dddpath2 + '/destFile_second_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath);
    fileIO.mkdirSync(dddpath2);
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath2, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE);
      let stat1 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
      expect(stat1.size == FILE_CONTENT.length).assertTrue();
      let stat2 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
      expect(stat2.size == FILE_CONTENT.length).assertTrue();
      expect(fileIO.accessSync(ddpath)).assertTrue();
      expect(fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
      let stat3 = fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
      expect(stat3.size == FILE_CONTENT.length).assertTrue();
      let stat4 = fileIO.statSync(ddpath2 + '/srcDir_first/destFile_second_01');
      expect(stat4.size == FILE_CONTENT.length).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (err) {
      console.log('fileIO_test_copyDir_async_002 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_003
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0300
   * @tc.desc   Test copyDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_003', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_003';
    let ddpath = dpath + '/srcDir_first';
    let ffpath = ddpath + '/srcFile_first_01';
    let ffpath2 = ddpath + '/srcFile_first_02';
    let dddpath = ddpath + '/srcDir_second';
    let fffpath = dddpath + '/srcFile_second_01';
    let ddpath2 = dpath + '/destDir_first';
    let ffpath3 = ddpath2 + '/destFile_first_01';
    let dddpath2= ddpath2 + '/srcDir_first';
    let fffpath2 = dddpath2 + '/destFile_second_01';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(ddpath2);
    fileIO.mkdirSync(dddpath);
    fileIO.mkdirSync(dddpath2);
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath2, FILE_CONTENT)).assertTrue();
    expect(prepareFile(ffpath3, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fffpath2, FILE_CONTENT)).assertTrue();

    try {
      fileIO.copyDir(ddpath, ddpath2, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_003 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_02');
        expect(stat1.size == FILE_CONTENT.length).assertTrue();
        let stat2 = fileIO.statSync(ddpath2 + '/srcDir_first/srcFile_first_01');
        expect(stat2.size == FILE_CONTENT.length).assertTrue();
        expect(fileIO.accessSync(ddpath)).assertTrue();
        expect(fileIO.accessSync(ddpath2 + '/srcDir_first/srcDir_second')).assertTrue();
        let stat3 = fileIO.statSync(ddpath2 + '/srcDir_first/srcDir_second/srcFile_second_01');
        expect(stat3.size == FILE_CONTENT.length).assertTrue();
        let stat4 = fileIO.statSync(ddpath2 + '/srcDir_first/destFile_second_01');
        expect(stat4.size == FILE_CONTENT.length).assertTrue();
        fileIO.rmdirSync(dpath);
        done();
      });
    } catch (err) {
      console.log('fileIO_test_copyDir_async_003 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_004
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0400
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_copyDir_async_004', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_004');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      await fileIO.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_THROW_ERR);
      expect(false).assertTrue();
      } catch (err) {
      console.log('fileIO_test_copyDir_async_004 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      expect(fileIO.accessSync(dpath.srcDir)).assertTrue();
      let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
      expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
      expect(err.data.length == 2).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_005
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0500
   * @tc.desc   Test copyDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_copyDir_async_005', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_005');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      fileIO.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_THROW_ERR, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_005 error:' + JSON.stringify(err));
          let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
          expect(dirent2.length == 8).assertTrue();
          expect(fileIO.accessSync(dpath.srcDir)).assertTrue();
          let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
          let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
          let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
          let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
          expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
          expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
          fileIO.rmdirSync(dpath.baseDir);
          expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
          expect(err.data.length == 2).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_006
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0600
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_copyDir_async_006', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_006');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      let stat1 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      await fileIO.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_REPLACE);
      expect(fileIO.accessSync(dpath.srcDir)).assertTrue();
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    } catch (err) {
      console.log('fileIO_test_copyDir_async_006 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_007
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0700
   * @tc.desc   Test copyDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_copyDir_async_007', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_007');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      let stat1 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      fileIO.copyDir(dpath.srcDir, dpath.destDir, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_007 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(dpath.srcDir)).assertTrue();
        let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
        expect(stat1.size != stat3.size && stat3.size == 10).assertTrue();
        let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
        expect(stat2.size != stat4.size && stat4.size == 30).assertTrue();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
        expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
        let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
        expect(dirent2.length == 8).assertTrue();
        fileIO.rmdirSync(dpath.baseDir);
        done();
      });
    } catch (err) {
      console.log('fileIO_test_copyDir_async_007 has failed for ' + err.message + ', code: ' + err.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_008
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0800
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_008', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_008');

    try {
      const INVALIDE_MODE = -1;
      await fileIO.copyDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_async_008 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_009
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0900
   * @tc.desc   Test copyDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_009', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_009');

    try {
      const INVALIDE_MODE = -1;
      fileIO.copyDir(dpath.srcDir, dpath.destDir, INVALIDE_MODE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_009 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_010
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1000
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_010', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_010');

    try {
      await fileIO.copyDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01');
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_async_010 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_011
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1100
   * @tc.desc   Test copyDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_011', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_011');

    try {
      fileIO.copyDir(dpath.srcDir + '/srcFile_first_01', dpath.destDir + 'srcDir/srcFile_first_01', (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_011 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_012
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1200
   * @tc.desc   Test copyDir() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_012', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_012');
  
    try {
      await fileIO.copyDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_COPY_REPLACE);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_async_012 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_013
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1300
   * @tc.desc   Test copyDir() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_013', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_013');
  
    try {
      fileIO.copyDir(dpath.srcDir, dpath.srcDir, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_013 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_014
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1400
   * @tc.desc   Test copyDir() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_014', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_014';
    let ddpath = dpath + '/srcDir_first';
    let dddpath = ddpath + '/srcDir_second';
    let ddddpath = dddpath + '/srcDir_third';
    let dddddpath = ddddpath + '/srcDir_fourth';
    let qfile = dddddpath + '/file.png';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dddpath);
    fileIO.mkdirSync(ddddpath);
    fileIO.mkdirSync(dddddpath);
    expect(prepareFile(qfile, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyDir(ddpath, dddddpath, DIRMODE_FILE_COPY_REPLACE);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_async_014 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_015
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1500
   * @tc.desc   Test copyDir() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_015', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_015';
    let ddpath = dpath + '/srcDir_first';
    let dddpath = ddpath + '/srcDir_second';
    let ddddpath = dddpath + '/srcDir_third';
    let dddddpath = ddddpath + '/srcDir_fourth';
    let qfile = dddddpath + '/file.png';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dddpath);
    fileIO.mkdirSync(ddddpath);
    fileIO.mkdirSync(dddddpath);
    expect(prepareFile(qfile, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.copyDir(ddpath, dddddpath, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_015 err package ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_016
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1600
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_016', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_016');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      await fileIO.copyDir(dpath.srcDir, dpath.destDir, undefined);
      expect(false).assertTrue();
    } catch (err) {
      console.log('fileIO_test_copyDir_async_016 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
      let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirent2.length == 8).assertTrue();
      expect(fileIO.accessSync(dpath.srcDir)).assertTrue();
      let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
      let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
      let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
      let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
      expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
      expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
      expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
      expect(err.data.length == 2).assertTrue();
      fileIO.rmdirSync(dpath.baseDir);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_017
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1700
   * @tc.desc   Test copyDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_017', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_017');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      fileIO.copyDir(dpath.srcDir, dpath.destDir, undefined, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_017 error:' + JSON.stringify(err));
          let dirent2 = fileIO.listFileSync(dpath.destDir, {recursion : true});
          expect(dirent2.length == 8).assertTrue();
          expect(fileIO.accessSync(dpath.srcDir)).assertTrue();
          let stat1 = fileIO.statSync(dpath.srcDir + '/srcFile_first_01');
          let stat2 = fileIO.statSync(dpath.srcDir + '/srcDir_first/srcFile_second_01');
          let stat3 = fileIO.statSync(dpath.destDir + '/srcDir/srcFile_first_01');
          let stat4 = fileIO.statSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01');
          expect(stat1.size != stat3.size && stat3.size == 20).assertTrue();
          expect(stat2.size != stat4.size && stat4.size == 50).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcFile_first_02')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_02')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/destFile_second_01')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/destFile_third_01')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcFile_second_01')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_01')).assertTrue();
          expect(fileIO.accessSync(dpath.destDir + '/srcDir/srcDir_first/srcDir_second/srcFile_third_02')).assertTrue();
          fileIO.rmdirSync(dpath.baseDir);
          expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
          expect(err.data.length == 2).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_017 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_018
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1800
   * @tc.desc   Test copyDir() interface.Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_018', Level.LEVEL3, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_018');

    try {
      let dirnet1 = fileIO.listFileSync(dpath.destDir, {recursion : true});
      expect(dirnet1.length == 4).assertTrue();
      fileIO.copyDir(dpath.srcDir, dpath.destDir, undefined, (ConflictFiles) => {
        if (ConflictFiles && ConflictFiles.code == 13900015 && ConflictFiles.data?.length !== undefined) {
          for (let i = 0; i < ConflictFiles.data.length; i++) {
            console.error("copy directory failed with conflicting files: " + ConflictFiles.data[i].srcFile + " " + ConflictFiles.data[i].destFile);
          }
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_019
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1900
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_019', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_019';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(null, dpath, DIRMODE_FILE_COPY_REPLACE);
      expect().assertFail();
      done();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_async_019 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_020
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2000
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_020', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_020';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(undefined, dpath, DIRMODE_FILE_COPY_REPLACE);
      expect().assertFail();
      done();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_async_020 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_021
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2100
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_021', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_021';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(dpath, null, DIRMODE_FILE_COPY_REPLACE);
      expect().assertFail();
      done();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_async_021 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_022
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2200
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_022', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_022';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(dpath, undefined, DIRMODE_FILE_COPY_REPLACE);
      expect().assertFail();
      done();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_async_022 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_023
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2300
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_copyDir_async_023', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_023');

    try {
      await fileIO.copyDir(dpath.srcDir, dpath.destDir, undefined);
      expect().assertFail();
      done();
      } catch (err) {
      console.log('fileIO_test_copyDir_async_023 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_024
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2400
   * @tc.desc   Test copyDir() interface.Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_copyDir_async_024', Level.LEVEL0, async function (done) {
    let dpath = await readyFiles('fileIO_test_copyDir_async_024');

    try {
      await fileIO.copyDir(dpath.srcDir, dpath.destDir, null);
      expect().assertFail();
      done();
      } catch (err) {
      console.log('fileIO_test_copyDir_async_024 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_025
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2500
   * @tc.desc   Test copyDir() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_025', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_025';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(null, dpath, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_025 err package ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_025 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_026
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2600
   * @tc.desc   Test copyDir() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_026', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_026';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(undefined, dpath, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_026 err package ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_026 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_027
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2700
   * @tc.desc   Test copyDir() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_027', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_027';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(dpath, null, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_027 err package ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_027 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

 /**
   * @tc.name   fileIO_test_copyDir_async_029
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2900
   * @tc.desc   Test copyDir() interface.Promise with src as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_029', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_029';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir('', dpath, DIRMODE_FILE_COPY_REPLACE);
      expect().assertFail();
      done();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_async_029 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_030
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_3000
   * @tc.desc   Test copyDir() interface.Promise with dest as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_030', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_030';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(dpath, '', DIRMODE_FILE_COPY_REPLACE);
      expect().assertFail();
      done();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_async_030 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_031
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_3100
   * @tc.desc   Test copyDir() interface.Promise with mode as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_031', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_031';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(dpath, dpath + '_dest', '');
      expect().assertFail();
      done();
    } catch (err) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_copyDir_async_031 has failed for ' + err.message + ', code: ' + err.code);
      expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_032
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_3200
   * @tc.desc   Test copyDir() interface.Callback with src as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_032', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_032';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir('', dpath, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_032 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_032 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_033
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_3300
   * @tc.desc   Test copyDir() interface.Callback with dest as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_033', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_033';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, '', DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_033 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_033 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_034
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_3400
   * @tc.desc   Test copyDir() interface.Callback with mode as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_034', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_034';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, dpath + '_dest', '', (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_034 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_034 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_035
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_3500
   * @tc.desc   Test copyDir() interface.Callback with mode as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_035', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_035';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, dpath + '_dest', null, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_035 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_035 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_036
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_3600
   * @tc.desc   Test copyDir() interface.Callback with mode as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_036', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_036';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, dpath + '_dest', undefined, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_036 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_036 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_037
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_3700
   * @tc.desc   Test copyDir() interface.Callback (3 params) with src as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_037', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_037';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir('', dpath, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_037 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_037 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_038
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_3800
   * @tc.desc   Test copyDir() interface.Callback (3 params) with dest as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_038', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_038';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, '', (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_038 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_038 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_042
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_4200
   * @tc.desc   Test copyDir() interface.Callback (ConflictFiles) with src as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_042', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_042';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir('', dpath, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_042 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_042 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_043
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_4300
   * @tc.desc   Test copyDir() interface.Callback (ConflictFiles) with src as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_043', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_043';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(null, dpath, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_043 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_043 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_044
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_4400
   * @tc.desc   Test copyDir() interface.Callback (ConflictFiles) with src as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_044', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_044';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(undefined, dpath, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_044 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_044 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_045
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_4500
   * @tc.desc   Test copyDir() interface.Callback (ConflictFiles) with dest as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_045', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_045';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, '', (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_045 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_045 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_046
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_4600
   * @tc.desc   Test copyDir() interface.Callback (ConflictFiles) with dest as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_046', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_046';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, null, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_046 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_046 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_047
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_4700
   * @tc.desc   Test copyDir() interface.Callback (ConflictFiles) with dest as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_047', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_047';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, undefined, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_047 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_047 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_051
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_5100
   * @tc.desc   Test copyDir() interface.Callback (4 params) with src as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_051', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_051';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir('', dpath, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_051 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_051 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_052
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_5200
   * @tc.desc   Test copyDir() interface.Callback (4 params) with src as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_052', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_052';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(null, dpath, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_052 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_052 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_053
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_5300
   * @tc.desc   Test copyDir() interface.Callback (4 params) with src as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_053', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_053';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(undefined, dpath, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_053 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_053 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_054
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_5400
   * @tc.desc   Test copyDir() interface.Callback (4 params) with dest as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_054', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_054';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, '', DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_054 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_054 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_055
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_5500
   * @tc.desc   Test copyDir() interface.Callback (4 params) with dest as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_055', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_055';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, null, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_055 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_055 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_056
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_5600
   * @tc.desc   Test copyDir() interface.Callback (4 params) with dest as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_056', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_056';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, undefined, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_056 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_056 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_057
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_5700
   * @tc.desc   Test copyDir() interface.Callback (4 params) with mode as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_057', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_057';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, dpath + '_dest', '', (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_057 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_057 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_058
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_5800
   * @tc.desc   Test copyDir() interface.Callback (4 params) with mode as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_058', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_058';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, dpath + '_dest', null, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_058 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_058 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_059
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_5900
   * @tc.desc   Test copyDir() interface.Callback (4 params) with mode as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_059', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_059';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, dpath + '_dest', undefined, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_059 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_059 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_060
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_6000
   * @tc.desc   Test copyDir() interface.Callback (4 params, ConflictFiles) with src as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_060', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_060';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir('', dpath, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_060 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_060 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_061
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_6100
   * @tc.desc   Test copyDir() interface.Callback (4 params, ConflictFiles) with src as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_061', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_061';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(null, dpath, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_061 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_061 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_062
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_6200
   * @tc.desc   Test copyDir() interface.Callback (4 params, ConflictFiles) with src as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_062', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_062';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(undefined, dpath, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_062 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_062 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_063
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_6300
   * @tc.desc   Test copyDir() interface.Callback (4 params, ConflictFiles) with dest as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_063', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_063';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, '', DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_063 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_063 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_064
   * @tc.number SUB_DF_FILEIO_COPY_DIR_ASYNC_6400
   * @tc.desc   Test copyDir() interface.Callback (4 params, ConflictFiles) with dest as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_064', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_064';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, null, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_064 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_064 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_065
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_6500
   * @tc.desc   Test copyDir() interface.Callback (4 params, ConflictFiles) with dest as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_065', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_065';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, undefined, DIRMODE_FILE_COPY_REPLACE, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_065 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_065 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_066
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_6600
   * @tc.desc   Test copyDir() interface.Callback (4 params, ConflictFiles) with mode as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_066', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_066';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, dpath + '_dest', '', (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_066 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_066 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_067
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_6700
   * @tc.desc   Test copyDir() interface.Callback (4 params, ConflictFiles) with mode as null.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_067', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_067';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, dpath + '_dest', null, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_067 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_067 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_068
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_6800
   * @tc.desc   Test copyDir() interface.Callback (4 params, ConflictFiles) with mode as undefined.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_068', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_068';
    fileIO.mkdirSync(dpath);

    try {
      fileIO.copyDir(dpath, dpath + '_dest', undefined, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_068 error: ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_068 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_copyDir_async_028
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_2800
   * @tc.desc   Test copyDir() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_copyDir_async_028', Level.LEVEL3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_test_copyDir_async_028';
    fileIO.mkdirSync(dpath);

    try {
      await fileIO.copyDir(dpath, undefined, (err) => {
        if (err) {
          console.log('fileIO_test_copyDir_async_028 err package ' + JSON.stringify(err));
          expect().assertFail();
        }
        done();
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_028 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    }
  });
});
}