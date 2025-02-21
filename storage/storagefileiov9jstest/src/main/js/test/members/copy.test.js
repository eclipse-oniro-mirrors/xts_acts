/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
    fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect
  } from '../Common';
import fileUri from '@ohos.file.fileuri';
import featureAbility from '@ohos.ability.featureAbility';
const CONTENT = 'hello!!!';

export default function fileIOCopy() {
describe('fileIO_fs_copy', function () {

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0100
   * @tc.name fileIO_copy_async_001
   * @tc.desc Test copy() interfaces.Promise.
   * Test file copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */  
  it('fileIO_copy_async_001', 0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_001');
    let fpathTarget = await nextFileName('dst');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

    let progressListener = (progress) => {
      console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
    };
    let options = {
      "progressListener" : progressListener
    }
    try {
      await fileIO.copy(srcDirUriLocal, dstDirUriLocal, options);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue(); 
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0200
   * @tc.name fileIO_copy_async_002
   * @tc.desc Test copy() interfaces.Promise.
   * Test file copied successfully by path.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */  
  it('fileIO_copy_async_002', 0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_002');
    let fpathTarget = fpath + 'dst';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    expect(prepareFile(fpathTarget, CONTENT)).assertTrue();
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

    try {
      await fileIO.copy(srcDirUriLocal, dstDirUriLocal);
      let stat1 = fileIO.statSync(fpath);
      let stat2 = fileIO.statSync(fpathTarget);
      expect(stat1.size == stat2.size).assertTrue(); 
      fileIO.unlinkSync(fpath);
      fileIO.unlinkSync(fpathTarget);
      done();
    } catch (e) {
      console.log('fileIO_copy_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0300
   * @tc.name fileIO_copy_async_003
   * @tc.desc Test copy() interfaces.Promise.
   * The path point to nothing, no such file.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('fileIO_copy_async_003', 3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_003');
    let fpathTarget = fpath + 'dst';
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

    let progressListener = (progress) => {
      console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
    };
    let options = {
      "progressListener" : progressListener
    }

    try {
      await fileIO.copy(srcDirUriLocal, dstDirUriLocal, options);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0400
   * @tc.name fileIO_copy_async_004
   * @tc.desc Test copy() interfaces.Promise.
   * The path point to nothing, no such file.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('fileIO_copy_async_004', 3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_004');
    let fpathTarget = fpath + 'dst';
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

    try {
      await fileIO.copy(srcDirUriLocal, dstDirUriLocal);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0500
   * @tc.name fileIO_copy_async_005
   * @tc.desc Test copy() interfaces.Promise.
   * Missing Parameter.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
   it('fileIO_copy_async_005', 3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_005');
    let fpathTarget = fpath + 'dst';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);
    let progressListener = (progress) => {
      console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
    };
    let options = {
      "progressListener" : progressListener
    }
    try {
      await fileIO.copy(srcDirUriLocal, options);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0600
   * @tc.name fileIO_copy_async_006
   * @tc.desc Test copy() interfaces.Promise.
   * Missing Parameter.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('fileIO_copy_async_006', 3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_006');
    let fpathTarget = fpath + 'dst';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUriLocal = fileUri.getUriFromPath(fpath);

    try {
      await fileIO.copy(srcDirUriLocal);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_copy_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_0700
   * @tc.name fileIO_copy_async_007
   * @tc.desc Test copy() interfaces.callback.
   * Test file copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_copy_async_007', 0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_007');
    let destpath = fpath + 'dest';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(fpath);
    let dstDirUri = fileUri.getUriFromPath(destpath);
 
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_007 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(fpath);
        let stat2 = fileIO.statSync(destpath);
        expect(stat1.size == stat2.size).assertTrue();
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(destpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_0800
   * @tc.name fileIO_copy_async_008
   * @tc.desc Test copy() interfaces.
   * Test file copied successfully by path.callback without options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_copy_async_008', 0, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_008');
    let destpath = fpath + 'dest';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(fpath);
    let dstDirUri = fileUri.getUriFromPath(destpath);
  
    try {
      fileIO.copy(srcDirUri, dstDirUri, (err) => {
        if (err) {
          console.log('fileIO_copy_async_008 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat1 = fileIO.statSync(fpath);
        let stat2 = fileIO.statSync(destpath);
        expect(stat1.size == stat2.size).assertTrue();
        fileIO.unlinkSync(fpath);
        fileIO.unlinkSync(destpath);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_0900
   * @tc.name fileIO_copy_async_009
   * @tc.desc Test copy() interfaces.callback.
   * The path point to nothing, no such file.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_009', 3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_009');
    let destpath = fpath + 'dest';
    let srcDirUri = fileUri.getUriFromPath(fpath);
    let dstDirUri = fileUri.getUriFromPath(destpath);
  
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_009 error: {message: ' + err.message + ', code: ' + err.code + '}');
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_copy_async_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1000
   * @tc.name fileIO_copy_async_010
   * @tc.desc Test copy() interfaces.callback.
   * Missing Parameter.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_010', 3, async function (done) {
    let fpath = await nextFileName('fileIO_copy_async_010');
    let destpath = fpath + 'dest';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(fpath);
  
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, options, (err) => {
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('fileIO_copy_async_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
      fileIO.unlinkSync(fpath);
      done();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1100
   * @tc.name fileIO_copy_async_011
   * @tc.desc Test copy() interfaces.callback
   * Test directory copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_011', 3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_011';
    let ddpath = dpath + '/srcDir_first';
    let dmpath = dpath + '/srcDir_second';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dmpath);
    let ffpath = ddpath + '/srcFile_first_01';
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(ddpath);
    let dstDirUri = fileUri.getUriFromPath(dmpath);
  
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_011 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let result1 = fileIO.listFileSync(ddpath);
        let result2 = fileIO.listFileSync(dmpath);
        expect(result1.length == result2.length).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1200
   * @tc.name fileIO_copy_async_012
   * @tc.desc Test copy() interfaces.
   * Test directory copied successfully by path.callback without options.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_012', 3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_012';
    let ddpath = dpath + '/srcDir_first';
    let dmpath = dpath + '/srcDir_second';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dmpath);
    let ffpath = ddpath + '/srcFile_first_01';
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(ddpath);
    let dstDirUri = fileUri.getUriFromPath(dmpath);
  
    try {
      fileIO.copy(srcDirUri, dstDirUri, (err) => {
        if (err) {
          console.log('fileIO_copy_async_012 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let result1 = fileIO.listFileSync(ddpath);
        let result2 = fileIO.listFileSync(dmpath);
        expect(result1.length == result2.length).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
  
  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1300
   * @tc.name fileIO_copy_async_013
   * @tc.desc Test copy() interfaces.Promise.
   * Test directory copied successfully by path.Contains progressListener, processedSize, and totalSize parameters.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
   it('fileIO_copy_async_013', 3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_013';
    let ddpath = dpath + '/srcDir_first';
    let dmpath = dpath + '/srcDir_second';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dmpath);
    let ffpath = ddpath + '/srcFile_first_01';
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(ddpath);
    let dstDirUri = fileUri.getUriFromPath(dmpath);
  
    try {
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      await fileIO.copy(srcDirUri, dstDirUri, options);
      let result1 = fileIO.listFileSync(ddpath);
      let result2 = fileIO.listFileSync(dmpath);
      expect(result1.length == result2.length).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_copy_async_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1400
   * @tc.name fileIO_copy_async_014
   * @tc.desc Test copy() interfaces.
   * Test directory copied successfully by path.Promise.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_copy_async_014', 3, async function (done) {
    let dpath = await featureAbility.getContext().getFilesDir() + '/fileIO_copy_async_014';
    let ddpath = dpath + '/srcDir_first';
    let dmpath = dpath + '/srcDir_second';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dmpath);
    let ffpath = ddpath + '/srcFile_first_01';
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(ddpath);
    let dstDirUri = fileUri.getUriFromPath(dmpath);
    try {
      await fileIO.copy(srcDirUri, dstDirUri);
      let result1 = fileIO.listFileSync(ddpath);
      let result2 = fileIO.listFileSync(dmpath);
      expect(result1.length == result2.length).assertTrue();
      done();
    } catch (e) {
      console.log('fileIO_copy_async_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}