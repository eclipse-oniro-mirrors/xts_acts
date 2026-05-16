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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, describe, it, expect, prepare200MFile
} from '../Common';
import fileUri from '@ohos.file.fileuri';
import featureAbility from '@ohos.ability.featureAbility';
import fs from '@ohos.file.fs';
import { TestType, Size, Level } from '@ohos/hypium';
const CONTENT = 'hello!!!';

let fpath2G;
export function prepare2GFile(fpath) {
try {
  let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE)
  fileIO.truncateSync(file.fd)
  let bf = new ArrayBuffer(1024 * 1024 * 20);
  for (let i = 0; i < 100; i++) {
    let offset = bf.byteLength * i;
    let writeLen = fileIO.writeSync(file.fd, bf, { offset: offset, length: bf.byteLength, encoding: 'utf-8' });
  }
  fileIO.fsyncSync(file.fd)
  fileIO.closeSync(file)
  return true
}
catch (e) {
  console.log('Failed to prepare200MFile for ' + e)
  return false
}
}

export default function fileIOCopy() {
describe('fileIO_fs_copy', function () {

beforeAll(async () => {
  fpath2G = await nextFileName('test2G');
  expect(prepare2GFile(fpath2G)).assertTrue();
})

/**
 * @tc.name   fileIO_copy_async_001
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0100
 * @tc.desc   Test copy() interfaces.Promise.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
 * @tc.name   fileIO_copy_async_002
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0200
 * @tc.desc   Test copy() interfaces.Promise.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
 * @tc.name   fileIO_copy_async_003
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0300
 * @tc.desc   Test copy() interfaces.Promise.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_003', Level.LEVEL3, async function (done) {
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
 * @tc.name   fileIO_copy_async_004
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0400
 * @tc.desc   Test copy() interfaces.Promise.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_004', Level.LEVEL3, async function (done) {
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
  * @tc.name   fileIO_copy_async_005
  * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0500
  * @tc.desc   Test copy() interfaces.Promise.
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL3
  */
 it('fileIO_copy_async_005', Level.LEVEL3, async function (done) {
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
 * @tc.name   fileIO_copy_async_006
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_0600
 * @tc.desc   Test copy() interfaces.Promise.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_006', Level.LEVEL3, async function (done) {
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
 * @tc.name   fileIO_copy_async_007
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_0700
 * @tc.desc   Test copy() interfaces.callback.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
 * @tc.name   fileIO_copy_async_008
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_0800
 * @tc.desc   Test copy() interfaces.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
 * @tc.name   fileIO_copy_async_009
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_0900
 * @tc.desc   Test copy() interfaces.callback.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_009', Level.LEVEL3, async function (done) {
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
 * @tc.name   fileIO_copy_async_010
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1000
 * @tc.desc   Test copy() interfaces.callback.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_010', Level.LEVEL3, async function (done) {
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
 * @tc.name   fileIO_copy_async_011
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1100
 * @tc.desc   Test copy() interfaces.callback
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_011', Level.LEVEL3, async function (done) {
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
 * @tc.name   fileIO_copy_async_012
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1200
 * @tc.desc   Test copy() interfaces.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_012', Level.LEVEL3, async function (done) {
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
  * @tc.name   fileIO_copy_async_013
  * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1300
  * @tc.desc   Test copy() interfaces.Promise.
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL3
  */
 it('fileIO_copy_async_013', Level.LEVEL3, async function (done) {
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
 * @tc.name   fileIO_copy_async_014
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1400
 * @tc.desc   Test copy() interfaces.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_014', Level.LEVEL3, async function (done) {
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

/**
 * @tc.name   fileIO_copy_async_015
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1500
 * @tc.desc   Test copy() interfaces.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_015', Level.LEVEL3, async function (done) {
 let destpath = fpath2G + 'dest';
 let srcDirUri = fileUri.getUriFromPath(fpath2G);
 let dstDirUri = fileUri.getUriFromPath(destpath);
 let copySignal = new fs.TaskSignal;
 copySignal.onCancel();
 let stat1 = fileIO.statSync(fpath2G);
 console.log('fileIO_copy_async_015 stat1: ' + stat1.size);
 let progressListener = (progress) => {
   console.info(`progressSize15: ${progress.processedSize}, totalSize15: ${progress.totalSize}`);
   if (progress.processedSize / progress.totalSize > 0.1) {
     copySignal.cancel();
   }
 }; 

 let options = {
   "progressListener" : progressListener,
   "copySignal" : copySignal,
 };
 try {
   await fs.copy(srcDirUri, dstDirUri, options);
   expect(false).assertTrue();
   
 } catch (e) {
   console.log('fileIO_copy_async_015 has failed for ' + e.message + ', code: ' + e.code);
   let stat2 = fileIO.statSync(destpath);
   console.log('fileIO_copy_async_015 stat2: ' + stat2.size);
   expect(stat2.size < stat1.size).assertTrue();
   expect(e.code == 13900049 && e.message == 'Operation canceled').assertTrue();
   fs.unlinkSync(destpath);
   done();
 }
}); 

/**
 * @tc.name   fileIO_copy_async_016
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1600
 * @tc.desc   Test copy() interfaces.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_016', Level.LEVEL3, async function (done) {
  let destpath = fpath2G + 'dest';
  let srcDirUri = fileUri.getUriFromPath(fpath2G);
  let dstDirUri = fileUri.getUriFromPath(destpath);
  let copySignal = new fs.TaskSignal;
  copySignal.onCancel();
  let stat1 = fileIO.statSync(fpath2G);
  console.log('fileIO_copy_async_016 stat1: ' + stat1.size);
  let progressListener = (progress) => {
    console.info(`progressSize16: ${progress.processedSize}, totalSize16: ${progress.totalSize}`);
    if (progress.processedSize / progress.totalSize > 0.1) {
      copySignal.cancel();
    }
  }; 

  let options = {
    "progressListener" : progressListener,
    "copySignal" : copySignal,
  };
  try {
    fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
      if (err) {
        console.log('fileIO_copy_async_016 error package: ' + JSON.stringify(err));
        let stat2 = fileIO.statSync(destpath);
        console.log('fileIO_copy_async_016 stat2: ' + stat2.size);
        expect(err.code == 13900049 && err.message == 'Operation canceled').assertTrue();
        expect(stat2.size < stat1.size).assertTrue();
        fs.unlinkSync(destpath);
      }
      done();
    });
  } catch (e) {
    console.log('fileIO_copy_async_016 has failed for ' + e.message + ', code: ' + e.code);
    expect(false).assertTrue();
  }
});

/**
 * @tc.name   fileIO_copy_async_017
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1700
 * @tc.desc   Test copy() interfaces.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_017');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  let srcDirUri = fileUri.getUriFromPath(fpath);
  let dstDirUri = 1;

  try {
    fileIO.copy(srcDirUri, dstDirUri, (err) => {
      if (err) {
        console.log('fileIO_copy_async_017 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });
  } catch (e) {
    fileIO.unlinkSync(fpath);
    console.log('fileIO_copy_async_017 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_018
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1800
 * @tc.desc   Test copy() interfaces.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_018');
  let destpath = fpath + 'dest';
  let srcDirUri = fileUri.getUriFromPath(fpath);
  let dstDirUri = fileUri.getUriFromPath(destpath);

  try {
    fileIO.copy(srcDirUri, dstDirUri, (err) => {
      if (err) {
        console.log('fileIO_copy_async_018 error: {message: ' + err.message + ', code: ' + err.code + '}');
        expect(err.code == 13900020 && err.message == 'Invalid argument').assertTrue();
        done();
      }
    });
  } catch (e) {
    console.log('fileIO_copy_async_018 has failed for ' + e.message + ', code: ' + e.code);
    expect(false).assertTrue();
  }
});

/**
 * @tc.name   fileIO_copy_async_019
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_1900
 * @tc.desc   Test copy() interfaces.callback
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL3
 */
it('fileIO_copy_async_019', Level.LEVEL3, async function (done) {
  let dpath = await nextFileName('fileIO_copy_async_019');
  let ddpath = dpath + '/srcDir_first';
  let dmpath = dpath + '/srcDir_second';
  fileIO.mkdirSync(dpath);
  fileIO.mkdirSync(ddpath);
  let fpath1 = ddpath + 'test.txt';
  let fpath2 = dmpath + 'test.txt';
  let file1 = fs.openSync(fpath1, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let file2 = fs.openSync(fpath2, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  fs.writeSync(file1.fd, 'aaaaaaaaaaaaa');
  fs.writeSync(file2.fd, 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
  let stat1 = fs.statSync(fpath1);
  console.info("fileIO_copy_async_019 file1 size is: " + stat1.size);
  let stat2 = fs.statSync(fpath2);
  console.info("fileIO_copy_async_019 file2 size is: " + stat2.size);
  let srcDirUri = fileUri.getUriFromPath(fpath1);
  let dstDirUri = fileUri.getUriFromPath(fpath2);

  try {
    let progressListener = (progress) => {
      console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
    };
    let options = {
      "progressListener" : progressListener
    }
    fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
      if (err) {
        console.log('fileIO_copy_async_019 error package: ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      let stat3 = fs.statSync(fpath2);
      let str = fs.readTextSync(fpath2);
      console.info("fileIO_copy_async_019 copy end file2 size context is: " + stat3.size + ',context: ' + str);
      expect(stat3.size == stat1.size).assertTrue();
      done();
    });
  } catch (e) {
    console.log('fileIO_copy_async_019 has failed for ' + e.message + ', code: ' + e.code);
    expect(false).assertTrue();
  }
});

/**
 * @tc.name   fileIO_copy_async_020
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2000
 * @tc.desc   Test copy() interfaces.Promise.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_020');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();
  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  let progressListener = (progress) => {
    console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
  };
  let options = {
    "progressListener" : progressListener
  }
  try {
    await fileIO.copy(null, dstDirUriLocal, options);
    expect().assertFail();
    done();
  } catch (e) {
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_020 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
    done();
  }
 });

 /**
 * @tc.name   fileIO_copy_async_021
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2100
 * @tc.desc   Test copy() interfaces.Promise.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_021');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();
  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  let progressListener = (progress) => {
    console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
  };
  let options = {
    "progressListener" : progressListener
  }
  try {
    await fileIO.copy(undefined, dstDirUriLocal, options);
    expect().assertFail();
    done();
  } catch (e) {
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_021 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
    done();
  }
});

 /**
 * @tc.name   fileIO_copy_async_022
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2200
 * @tc.desc   Test copy() interfaces.Promise.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_022');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  let progressListener = (progress) => {
    console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
  };
  let options = {
    "progressListener" : progressListener
  }
  try {
    await fileIO.copy(srcDirUriLocal, null, options);
    expect().assertFail();
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    console.log('fileIO_copy_async_022 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_023
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2300
 * @tc.desc   Test copy() interfaces.Promise.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_023');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  let progressListener = (progress) => {
    console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
  };
  let options = {
    "progressListener" : progressListener
  }
   try {
     await fileIO.copy(srcDirUriLocal, undefined, options);
     expect().assertFail();
     done();
   } catch (e) {
     fileIO.unlinkSync(fpath);
     console.log('fileIO_copy_async_023 has failed for ' + e.message + ', code: ' + e.code);
     expect(e.code == 401 && e.message == 'The input parameter is invalid').assertTrue();
     done();
   }
 });

/**
 * @tc.name   fileIO_copy_async_024
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2400
 * @tc.desc   Test copy() interface. SrcUri is empty string.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_024');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);
  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    await fileIO.copy("", dstDirUriLocal);
    expect(false).assertTrue();
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_024 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_025
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2500
 * @tc.desc   Test copy() interface. SrcUri is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_025');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    await fileIO.copy(null, dstDirUriLocal);
    expect(false).assertTrue();
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_025 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_026
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2600
 * @tc.desc   Test copy() interface. SrcUri is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_026');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    await fileIO.copy(undefined, dstDirUriLocal);
    expect(false).assertTrue();
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_026 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_027
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2700
 * @tc.desc   Test copy() interface. DestUri is empty string.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_027');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  try {
    await fileIO.copy(srcDirUriLocal, "");
    expect(false).assertTrue();
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_027 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_028
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2800
 * @tc.desc   Test copy() interface. DestUri is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_028');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  try {
    await fileIO.copy(srcDirUriLocal, null);
    expect(false).assertTrue();
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_028 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_029
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_2900
 * @tc.desc   Test copy() interface. DestUri is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_029');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  try {
    await fileIO.copy(srcDirUriLocal, undefined);
    expect(false).assertTrue();
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_029 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_030
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_3000
 * @tc.desc   Test copy() interface. Options is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_030');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);
  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    await fileIO.copy(srcDirUriLocal, dstDirUriLocal, null);
    let stat1 = fileIO.statSync(fpath);
    let stat2 = fileIO.statSync(fpathTarget);
    console.log('fileIO_copy_async_030 has failed for stat1.size' + stat1.size + ', stat2.size: ' + stat2.size);
    expect(stat1.size == stat2.size).assertTrue();
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    expect(false).assertTrue();
    console.log('fileIO_copy_async_030 has failed for ' + e.message + ', code: ' + e.code);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_031
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_3100
 * @tc.desc   Test copy() interface. Options is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_031');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);
  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    await fileIO.copy(srcDirUriLocal, dstDirUriLocal, undefined);
    let stat1 = fileIO.statSync(fpath);
    let stat2 = fileIO.statSync(fpathTarget);
    expect(stat1.size == stat2.size).assertTrue();
    console.log('fileIO_copy_async_031 has failed for stat1.size' + stat1.size + ', stat2.size: ' + stat2.size);
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    expect(false).assertTrue();
    console.log('fileIO_copy_async_031 has failed for ' + e.message + ', code: ' + e.code);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_032
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_3200
 * @tc.desc   Test copy() interface. Callback. SrcUri is empty string.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_032');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    fileIO.copy("", dstDirUriLocal, null, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_032 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_033
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_3300
 * @tc.desc   Test copy() interface. Callback. SrcUri is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_033');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    fileIO.copy(null, dstDirUriLocal, null, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_033 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_034
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_3400
 * @tc.desc   Test copy() interface. Callback. SrcUri is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_034');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    fileIO.copy(undefined, dstDirUriLocal, null, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_034 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_035
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_3500
 * @tc.desc   Test copy() interface. Callback. DestUri is empty string.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_035');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  try {
    fileIO.copy(srcDirUriLocal, "", null, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_035 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_036
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_3600
 * @tc.desc   Test copy() interface. Callback. DestUri is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_036');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  try {
    fileIO.copy(srcDirUriLocal, null, null, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_036 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_async_037
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_3700
 * @tc.desc   Test copy() interface. Callback. DestUri is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_037');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  try {
    fileIO.copy(srcDirUriLocal, undefined, null, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_037 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_copy_040
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_4000
 * @tc.desc   Test copy() interface. Callback. SrcUri is empty string.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_copy_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_copy_040');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    fileIO.copy("", dstDirUriLocal, (err) => {
    console.log('fileIO_copy_copy_040 has err for ' + err.message + ', code: ' + err.code);
    done();
    });
    console.log('fileIO_copy_copy_040 has err for 2222');
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_copy_040 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_copy_041
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_4100
 * @tc.desc   Test copy() interface. Callback. SrcUri is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_copy_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_copy_041');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    fileIO.copy(null, dstDirUriLocal, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_copy_041 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_copy_042
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_4200
 * @tc.desc   Test copy() interface. Callback. SrcUri is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_copy_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_copy_042');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  try {
    fileIO.copy(undefined, dstDirUriLocal, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_copy_042 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_copy_043
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_4300
 * @tc.desc   Test copy() interface. Callback. DestUri is empty string.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_copy_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_copy_043');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  try {
    fileIO.copy(srcDirUriLocal, "", (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_copy_043 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_copy_044
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_4400
 * @tc.desc   Test copy() interface. Callback. DestUri is null.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_copy_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_copy_044');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  try {
    fileIO.copy(srcDirUriLocal, null, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_copy_044 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
 * @tc.name   fileIO_copy_copy_045
 * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_4500
 * @tc.desc   Test copy() interface. Callback. DestUri is undefined.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_copy_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_copy_045');
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();

  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  try {
    fileIO.copy(srcDirUriLocal, undefined, (err) => {
      expect(false).assertTrue();
    });
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_copy_045 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code).assertEqual(401);
    done();
  }
});

/**
   * @tc.name   fileIO_copy_async_046
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_4600
   * @tc.desc   Test copy() interfaces.Promise with srcUri as empty string.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
it('fileIO_copy_async_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpathTarget = await nextFileName('dst');
  expect(prepareFile(fpathTarget, CONTENT)).assertTrue();
  let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);

  let progressListener = (progress) => {
    console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
  };
  let options = {
    "progressListener" : progressListener
  }
  try {
    await fileIO.copy('', dstDirUriLocal, options);
    expect().assertFail();
    done();
  } catch (e) {
    fileIO.unlinkSync(fpathTarget);
    console.log('fileIO_copy_async_046 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 401 && e.message == 'The input parameter is invalid').assertTrue();
    done();
  }
 });

/**
 * @tc.name   fileIO_copy_async_047
 * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_4700
 * @tc.desc   Test copy() interfaces.Promise with destUri as empty string.
 * @tc.type   FUNCTION
 * @tc.size   MEDIUMTEST
 * @tc.level  LEVEL0
 */
it('fileIO_copy_async_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
  let fpath = await nextFileName('fileIO_copy_async_025');
  expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
  let srcDirUriLocal = fileUri.getUriFromPath(fpath);

  let progressListener = (progress) => {
    console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
  };
  let options = {
    "progressListener" : progressListener
  }
  try {
    await fileIO.copy(srcDirUriLocal, '', options);
    expect().assertFail();
    done();
  } catch (e) {
    fileIO.unlinkSync(fpath);
    console.log('fileIO_copy_async_047 has failed for ' + e.message + ', code: ' + e.code);
    expect(e.code === 401 && e.message == 'The input parameter is invalid').assertTrue();
    done();
  }
 });

/**
     * @tc.name   fileIO_copy_async_048
     * @tc.number SUB_BASIC_FM_FileAPI_FileIo_Copy_ASYNC_4800
     * @tc.desc   Test copy() interfaces.Promise with srcUri as empty string.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('fileIO_copy_async_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let fpathTarget = await nextFileName('dst');
      expect(prepareFile(fpathTarget, CONTENT)).assertTrue();
      let dstDirUriLocal = fileUri.getUriFromPath(fpathTarget);
  
      let progressListener = (progress) => {
        console.info(`progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      try {
        await fileIO.copy('', dstDirUriLocal, options);
        expect().assertFail();
        done();
      } catch (e) {
        fileIO.unlinkSync(fpathTarget);
        console.log('fileIO_copy_async_048 has failed for ' + e.message + ', code: ' + e.code);
        expect(e.code === 401 && e.message == 'The input parameter is invalid').assertTrue();
        done();
      }
     });

  /**
   * @tc.name   fileIO_copy_async_049
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_4900
   * @tc.desc   Test copy() file interfaces.callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_copy_async_049', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_copy_async_049');
    fileIO.mkdirSync(dpath);
    let fpath1 = dpath + '/srcDir_firsttest.txt';
    let fpath2 = dpath + '/srcDir_secondtest.txt';
    let file1 = fs.openSync(fpath1, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let file2 = fs.openSync(fpath2, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fs.writeSync(file1.fd, 'aaaaaaaaaaaaa');
    fs.writeSync(file2.fd, 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
    let stat1 = fs.statSync(fpath1);
    console.info("fileIO_copy_async_049 file1 size is: " + stat1.size);
    let stat2 = fs.statSync(fpath2);
    console.info("fileIO_copy_async_049 file2 size is: " + stat2.size);
    let srcDirUri = fileUri.getUriFromPath(fpath1);
    let dstDirUri = fileUri.getUriFromPath(fpath2);

    try {
      let progressListener = (progress) => {
        console.info(`fileIO_copy_async_049 progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_049 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let stat3 = fs.statSync(fpath2);
        let str = fs.readTextSync(fpath2);
        console.info("fileIO_copy_async_049 copy end file2 size context is: " + stat3.size + ',context: ' + str);
        expect(stat3.size == stat1.size).assertTrue();
        let filenames1 = fs.listFileSync(dpath);
        console.log('fileIO_copy_async_049 filenames1: ' + filenames1);
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_049 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_copy_async_050
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_5000
   * @tc.desc   Test copy() dir interfaces.callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_copy_async_050', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_copy_async_050');
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
        console.info(`fileIO_copy_async_050 progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_050 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let filenames1 = fs.listFileSync(ddpath);
        console.log('fileIO_copy_async_050 filenames1: ' + filenames1);
        let filenames2 = fs.listFileSync(dmpath);
        console.log('fileIO_copy_async_050 filenames2: ' + filenames2);
        expect(filenames1.length == filenames2.length).assertTrue();
        expect(fileIO.accessSync(dmpath + '/srcDir_first/srcFile_first_01')).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_050 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_copy_async_051
   * @tc.number SUB_BASIC_FM_FileAPI_FileIO_Copy_ASYNC_5100
   * @tc.desc   Test copy() interfaces.callback
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_copy_async_051', Level.LEVEL3, async function (done) {
    let dpath = await nextFileName('fileIO_copy_async_051');
    let ddpath = dpath + '/A/';
    let dd1path = dpath + '/A/srcDir';
    let dd2path = dpath + '/A/srcDir/srcDir_first';
    let dmpath = dpath + '/srcDir_second/';
    fileIO.mkdirSync(dpath);
    fileIO.mkdirSync(ddpath);
    fileIO.mkdirSync(dd1path);
    fileIO.mkdirSync(dd2path);
    fileIO.mkdirSync(dmpath);
    let ffpath = dd2path + '/srcFile_first_01.txt';
    expect(prepareFile(ffpath, FILE_CONTENT)).assertTrue();
    let ffpath1 = dd1path + '/srcFile_first_02.txt';
    expect(prepareFile(ffpath1, FILE_CONTENT)).assertTrue();
    let srcDirUri = fileUri.getUriFromPath(ddpath);
    let dstDirUri = fileUri.getUriFromPath(dmpath);

    try {
      let progressListener = (progress) => {
        console.info(`fileIO_copy_async_051 progressSize: ${progress.processedSize}, totalSize: ${progress.totalSize}`);
      };
      let options = {
        "progressListener" : progressListener
      }
      fileIO.copy(srcDirUri, dstDirUri, options, (err) => {
        if (err) {
          console.log('fileIO_copy_async_051 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        let filenames1 = fs.listFileSync(ddpath);
        console.log('fileIO_copy_async_051 filenames1: ' + filenames1);
        let filenames2 = fs.listFileSync(dmpath);
        console.log('fileIO_copy_async_051 filenames2: ' + filenames2);
        expect(filenames1.length == filenames2.length).assertTrue();
        expect(fileIO.accessSync(dmpath + '/A/srcDir/srcDir_first/srcFile_first_01.txt')).assertTrue();
        done();
      });
    } catch (e) {
      console.log('fileIO_copy_async_051 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
      done();
    }
  });
});
}