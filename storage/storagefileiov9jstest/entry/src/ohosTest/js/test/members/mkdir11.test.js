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
    fileIO, nextFileName, describe, it, expect, prepareFile, FILE_CONTENT,
} from '../Common';
import { Level } from '@ohos/hypium';

export default function fileIOMkdir11() {
describe('fileIO_fs_mkdir11', function () {

  /**
   * @tc.name   fileIO_test_mkdir_sync_new_001
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0100
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_new_001', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdir_sync_new_001') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      fileIO.mkdirSync(dpath,false);
      expect(fileIO.accessSync(dpath)).assertTrue();
      fileIO.mkdirSync(dpath1,false);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_mkdir_sync_new_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_new_002
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0200
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_new_002', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdir_sync_new_002') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      fileIO.mkdirSync(dpath,true);
      expect(fileIO.accessSync(dpath)).assertTrue();
      fileIO.mkdirSync(dpath1,true);
      expect(fileIO.accessSync(dpath1)).assertTrue();
      fileIO.rmdirSync(dpath);
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_new_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_new_003
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0300
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_new_003', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdir_sync_new_003') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      fileIO.mkdirSync(dpath);
      expect(fileIO.accessSync(dpath)).assertTrue();
      fileIO.mkdirSync(dpath1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_mkdir_sync_new_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_new_004
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0400
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_new_004', Level.LEVEL0, async function () {
    let dpath = await nextFileName('fileIO_test_mkdir_sync_new_004') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      fileIO.mkdirSync(dpath,undefined);
      expect(fileIO.accessSync(dpath)).assertTrue();
      fileIO.mkdirSync(dpath1,undefined);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_mkdir_sync_new_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_new_005
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0500
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_new_005', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_mkdir_sync_new_005') + 'd';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.mkdirSync(fpath,true);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_mkdir_sync_new_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_new_006
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0600
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_new_006', Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync('/',false);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_new_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_sync_new_007
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIRSYNC_NEW_0700
   * @tc.desc   Test mkdirSync() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_sync_new_007', Level.LEVEL0, async function () {

    try {
      fileIO.mkdirSync('',false);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_sync_new_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_001
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0100
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_001', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_new_001') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      await fileIO.mkdir(dpath,false);
      expect(fileIO.accessSync(dpath)).assertTrue();
      await fileIO.mkdir(dpath1,false);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_mkdir_async_new_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_002
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0200
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_002', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_new_002') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      await fileIO.mkdir(dpath,true);
      expect(fileIO.accessSync(dpath)).assertTrue();
      await fileIO.mkdir(dpath1,true);
      expect(fileIO.accessSync(dpath1)).assertTrue();
      fileIO.rmdirSync(dpath);
      done();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_003
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0300
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_003', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_new_003') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      await fileIO.mkdir(dpath);
      expect(fileIO.accessSync(dpath)).assertTrue();
      await fileIO.mkdir(dpath1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_mkdir_async_new_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
      
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_004
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0400
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_004', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_new_004') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      await fileIO.mkdir(dpath,undefined);
      expect(fileIO.accessSync(dpath)).assertTrue();
      await fileIO.mkdir(dpath1,undefined);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.rmdirSync(dpath);
      console.log('fileIO_test_mkdir_async_new_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_005
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0500
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_005', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_mkdir_async_new_005') + 'd';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      await fileIO.mkdir(fpath,true);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_mkdir_async_new_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_006
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0600
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_006', Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir('/',false);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900015 && e.message == 'File exists').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_007
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0700
   * @tc.desc   Test mkdir() interfaces. Promise.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_007', Level.LEVEL0, async function (done) {

    try {
      await fileIO.mkdir('',false);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
      done();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_008
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0800
   * @tc.desc   Test mkdir() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_008', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_new_008') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      fileIO.mkdir(dpath, false,(err) => {
        if(err) {
          console.log('fileIO_test_mkdir_async_new_008 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.mkdir(dpath1, false,(err) => {
          if(err) {
            fileIO.rmdirSync(dpath);
            console.log('fileIO_test_mkdir_async_new_008 error package1: ' + JSON.stringify(err));
            expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_009
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_0900
   * @tc.desc   Test mkdir() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_009', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_new_009') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      fileIO.mkdir(dpath, true, (err) => {
        if(err) {
          console.log('fileIO_test_mkdir_async_new_009 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.mkdir(dpath1, true, (err) => {
          if(err) {
            console.log('fileIO_test_mkdir_async_new_009 error package1: ' + JSON.stringify(err));
            expect(false).assertTrue();
          }
          expect(fileIO.accessSync(dpath1)).assertTrue();
          fileIO.rmdirSync(dpath);
          done();
        });
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_010
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_1000
   * @tc.desc   Test mkdir() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_010', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_new_010') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      fileIO.mkdir(dpath, (err) => {
        if(err) {
          console.log('fileIO_test_mkdir_async_new_010 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.mkdir(dpath1, (err) => {
          if(err) {
            fileIO.rmdirSync(dpath);
            console.log('fileIO_test_mkdir_async_new_010 error package1: ' + JSON.stringify(err));
            expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_011
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_1100
   * @tc.desc   Test mkdir() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_011', Level.LEVEL0, async function (done) {
    let dpath = await nextFileName('fileIO_test_mkdir_async_new_011') + 'd';
    let dpath1 = dpath + '/d1/d2';

    try {
      fileIO.mkdir(dpath, undefined, (err) => {
        if(err) {
          console.log('fileIO_test_mkdir_async_new_011 error package: ' + JSON.stringify(err));
          expect(false).assertTrue();
        }
        expect(fileIO.accessSync(dpath)).assertTrue();
        fileIO.mkdir(dpath1, undefined, (err) => {
          if(err) {
            fileIO.rmdirSync(dpath);
            console.log('fileIO_test_mkdir_async_new_011 error package1: ' + JSON.stringify(err));
            expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
            done();
          }
        });
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_012
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_1200
   * @tc.desc   Test mkdir() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_012', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('fileIO_test_mkdir_async_new_012') + 'd';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      fileIO.mkdir(fpath, true, (err) => {
        if(err) {
          fileIO.unlinkSync(fpath);
          console.log('fileIO_test_mkdir_async_new_012 error package: ' + JSON.stringify(err));
          expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_013
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_1300
   * @tc.desc   Test mkdir() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_013', Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir('/', false, (err) => {
        if(err) {
          console.log('fileIO_test_mkdir_async_new_013 error package: ' + JSON.stringify(err));
          expect(err.code == 13900015 && err.message == 'File exists').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_mkdir_async_new_014
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_MKDIR_ASYNC_NEW_1400
   * @tc.desc   Test mkdir() interfaces. Callback.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_mkdir_async_new_014', Level.LEVEL0, async function (done) {

    try {
      fileIO.mkdir('', false, (err) => {
        if(err) {
          console.log('fileIO_test_mkdir_async_new_014 error package: ' + JSON.stringify(err));
          expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
          done();
        }
      });
    } catch (e) {
      console.log('fileIO_test_mkdir_async_new_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
})
}