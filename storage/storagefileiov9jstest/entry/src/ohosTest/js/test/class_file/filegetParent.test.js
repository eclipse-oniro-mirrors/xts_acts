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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, isIntNum, describe, it, expect,
} from '../Common';
import fileuri from '@ohos.file.fileuri';
import { Level } from '@ohos/hypium';

export default function fileIOFileGetParent() {
  describe('fileIO_fs_file_getParent', function () {

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0100
   * @tc.name fileIO_test_filegetParent_001
   * @tc.desc Test getParent() interfaces. 
   * Open the file, file getParent(),write content
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_filegetParent_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_filegetParent_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let index = fpath.lastIndexOf("\/");
    let str = fpath.substring(0, index+1);
    str = str.slice(0, -1);

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      expect(file.getParent() == str).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_filegetParent_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0200
   * @tc.name fileIO_test_filegetParent_002
   * @tc.desc Test getParent() interfaces. 
   * Open the file, file getParent(),without content
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_filegetParent_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_filegetParent_002');
    let index = fpath.lastIndexOf("\/");
    let str = fpath.substring(0, index+1);
    str = str.slice(0, -1);
  
    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE | fileIO.OpenMode.CREATE);
      expect(isIntNum(file.fd)).assertTrue();
      expect(file.getParent() == str).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_filegetParent_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0300
   * @tc.name fileIO_test_filegetParent_003
   * @tc.desc Test getParent() interfaces.argument is : true. 
   * Open the file, file getParent(true)
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filegetParent_003', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_filegetParent_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      file.getParent(true);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filegetParent_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0400
   * @tc.name fileIO_test_filegetParent_004
   * @tc.desc Test getParent() interfaces.argument is : false. 
   * Open the file, file getParent(false)
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filegetParent_004', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_filegetParent_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      file.getParent(false);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filegetParent_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0500
   * @tc.name fileIO_test_filegetParent_005
   * @tc.desc Test getParent() interfaces.argument is : -1. 
   * Open the file, file getParent(-1)
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filegetParent_005', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_filegetParent_005');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);

    try {
      expect(isIntNum(file.fd)).assertTrue();
      file.getParent(-1);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_filegetParent_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0600
   * @tc.name fileIO_test_filegetParent_006
   * @tc.desc Test getParent() interfaces. 
   * Open the file, file getParent(),fs.dup
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filegetParent_006', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_filegetParent_006');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      let filenew = fileIO.dup(file.fd);
      expect(file.getParent() == filenew.getParent()).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_filegetParent_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_FILEGETPARENT_0700
   * @tc.name fileIO_test_filegetParent_007
   * @tc.desc Test getParent() interfaces. 
   * Open the file, file getParent(),fileuri.getUriFromPath()
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_filegetParent_007', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_filegetParent_007');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let index = fpath.lastIndexOf("\/");
    let str = fpath.substring(0, index+1);
    str = str.slice(0, -1);

    try {
      let uri = fileuri.getUriFromPath(fpath);
      let file = fileIO.openSync(uri, fileIO.OpenMode.READ_WRITE);
      expect(isIntNum(file.fd)).assertTrue();
      expect(file.getParent() == str).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_filegetParent_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });
});
}
