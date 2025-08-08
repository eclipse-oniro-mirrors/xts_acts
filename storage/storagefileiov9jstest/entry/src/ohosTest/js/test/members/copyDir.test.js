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
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0000
   * @tc.name fileIO_test_copyDir_sync_000
   * @tc.desc Test copyDirSync() interface.
   * There is no target folder(src) under path dest. Mode is DIRMODE_FILE_COPY_REPLACE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0100
   * @tc.name fileIO_test_copyDir_sync_001
   * @tc.desc Test copyDirSync() interface.
   * There is a file with a different name from the source folder in the target folder. Mode is DIRMODE_FILE_COPY_REPLACE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0200
   * @tc.name fileIO_test_copyDir_sync_002
   * @tc.desc Test copyDirSync() interface.
   * There is a file with the same name as the source folder in the target folder. Mode is DIRMODE_FILE_COPY_THROW_ERR.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0300
   * @tc.name fileIO_test_copyDir_sync_003
   * @tc.desc Test copyDirSync() interface.
   * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_COPY_REPLACE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0400
   * @tc.name fileIO_test_copyDir_sync_004
   * @tc.desc Test copyDirSync() interface.
   * Invalid mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIRSYNC_0500
   * @tc.name fileIO_test_copyDir_sync_005
   * @tc.desc Test copyDirSync() interface.
   * The path point to a file, not a directory.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIRSYNC_0600
   * @tc.name fileIO_test_copyDir_sync_006
   * @tc.desc Test copyDirSync() interface.
   * Invalid path. Can not move the same path.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIRSYNC_0700
   * @tc.name fileIO_test_copyDir_sync_007
   * @tc.desc Test copyDirSync() interface.
   * Invalid path. Can not move subPath.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_SYNC_0800
   * @tc.name fileIO_test_copyDir_sync_008
   * @tc.desc Test copyDirSync() interface.
   * There is no target folder(src) under path dest. Mode is undefined.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0000
   * @tc.name fileIO_test_copyDir_async_000
   * @tc.desc Test copyDir() interface.Promise.
   * There is no target folder(src) under path dest. Mode is DIRMODE_FILE_COPY_REPLACE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0100
   * @tc.name fileIO_test_copyDir_async_001
   * @tc.desc Test copyDir() interface.Callback.
   * There is no target folder(src) under path dest. Mode is DIRMODE_FILE_COPY_REPLACE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0200
   * @tc.name fileIO_test_copyDir_async_002
   * @tc.desc Test copyDir() interface.Promise.
   * There is a file with a different name from the source folder in the target folder. Mode is DIRMODE_FILE_COPY_REPLACE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0300
   * @tc.name fileIO_test_copyDir_async_003
   * @tc.desc Test copyDir() interface.Callback.
   * There is a file with a different name from the source folder in the target folder. Mode is DIRMODE_FILE_COPY_REPLACE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0400
   * @tc.name fileIO_test_copyDir_async_004
   * @tc.desc Test copyDir() interface.Promise.
   * There is a file with the same name as the source folder in the target folder. Mode is DIRMODE_FILE_COPY_THROW_ERR.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0500
   * @tc.name fileIO_test_copyDir_async_005
   * @tc.desc Test copyDir() interface.Callback.
   * There is a file with the same name as the source folder in the target folder. Mode is DIRMODE_FILE_COPY_THROW_ERR.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0600
   * @tc.name fileIO_test_copyDir_async_006
   * @tc.desc Test copyDir() interface.Promise.
   * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_COPY_REPLACE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0700
   * @tc.name fileIO_test_copyDir_async_007
   * @tc.desc Test copyDir() interface.Callback.
   * There is a target folder(src) under path dest and it is not empty. Mode is DIRMODE_FILE_COPY_REPLACE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0800
   * @tc.name fileIO_test_copyDir_async_008
   * @tc.desc Test copyDir() interface.Promise.
   * Invalid mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_0900
   * @tc.name fileIO_test_copyDir_async_009
   * @tc.desc Test copyDir() interface.Callback.
   * Invalid mode.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1000
   * @tc.name fileIO_test_copyDir_async_010
   * @tc.desc Test copyDir() interface.Promise.
   * The path point to a file, not a directory.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1100
   * @tc.name fileIO_test_copyDir_async_011
   * @tc.desc Test copyDir() interface.Callback.
   * The path point to a file, not a directory.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1200
   * @tc.name fileIO_test_copyDir_async_012
   * @tc.desc Test copyDir() interface.
   * Invalid path.Can not move the same path.Promise.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1300
   * @tc.name fileIO_test_copyDir_async_013
   * @tc.desc Test copyDir() interface.
   * Invalid path.Can not move the same path.Callback.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1400
   * @tc.name fileIO_test_copyDir_async_014
   * @tc.desc Test copyDir() interface.
   * Invalid path.Can not move subPath.Promise.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1500
   * @tc.name fileIO_test_copyDir_async_015
   * @tc.desc Test copyDir() interface.
   * Invalid path.Can not move subPath.Callback.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1600
   * @tc.name fileIO_test_copyDir_async_016
   * @tc.desc Test copyDir() interface.Promise.
   * There is no target folder(src) under path dest. Mode is undefined.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1700
   * @tc.name fileIO_test_copyDir_async_017
   * @tc.desc Test copyDir() interface.Callback.
   * There is no target folder(src) under path dest. Mode is undefined.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
   * @tc.number SUB_DF_FILEIO_COPYDIR_ASYNC_1800
   * @tc.name fileIO_test_copyDir_async_018
   * @tc.desc Test copyDir() interface.Callback.
   * There is no target folder(src) under path dest. ConflictFiles.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
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
          expect(true).assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_copyDir_async_018 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
  });
  }