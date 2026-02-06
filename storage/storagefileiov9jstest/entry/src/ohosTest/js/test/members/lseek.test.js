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
  fileIO, FILE_CONTENT, prepareFile, nextFileName, 
  describe, it, expect,
} from '../Common';
import { Level } from '@ohos/hypium';
  
export default function fileIOLseek() {
describe('fileIO_fs_lseek', function () {

  /**
   * @tc.name   fileIO_test_lseek_001
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0100
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_lseek_001', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_001');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let pnumber = fileIO.lseek(file.fd, 5);
      expect(pnumber == 5).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_lseek_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_002
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0200
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_lseek_002', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_002');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let pnumber = fileIO.lseek(file.fd, 3, fileIO.WhenceType.SEEK_SET);
      expect(pnumber == 3).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == FILE_CONTENT.length - 3).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_lseek_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_003
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0300
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_lseek_003', Level.LEVEL0, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_003');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let pnumber = fileIO.lseek(file.fd, 3, fileIO.WhenceType.SEEK_CUR);
      expect(pnumber == 3).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == FILE_CONTENT.length - 3).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_lseek_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_004
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0400
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_004', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let pnumber = fileIO.lseek(file.fd, 3, fileIO.WhenceType.SEEK_END);
      expect(pnumber == FILE_CONTENT.length + 3).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_lseek_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_005
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0500
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_005', Level.LEVEL3, async function () {
    try {
      fileIO.lseek();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_lseek_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_006
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0600
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_006', Level.LEVEL3, async function () {
    try {
      fileIO.lseek(-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_lseek_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_007
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0700
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_007', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_007');

    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE|fileIO.OpenMode.READ_WRITE);
      let pnumber =  fileIO.lseek(file.fd, 5);
      expect(pnumber == 5).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == 0).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_lseek_007 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }   
  });

  /**
   * @tc.name   fileIO_test_lseek_008
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0800
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_008', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_008');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
      let file = fileIO.openSync(fpath,fileIO.OpenMode.READ_WRITE);
      let pnumber =  fileIO.lseek(file.fd, 3);
      expect(pnumber == 3).assertTrue();
      let pnumber1 =  fileIO.lseek(file.fd, 5,fileIO.WhenceType.SEEK_CUR);
      expect(pnumber1 == 8).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == FILE_CONTENT.length - 8).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_lseek_008 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }   
  });

  /**
   * @tc.name   fileIO_test_lseek_009
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_0900
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_009', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_009');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let pnumber =  fileIO.lseek(file.fd, 3, undefined);
      expect(pnumber == 3).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_lseek_009 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_010
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1000
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_010', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_010');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    
    try {
      fileIO.lseek(file.fd, -1, fileIO.WhenceType.SEEK_SET);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_lseek_010 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_011
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1100
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_011', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_011');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let pnumber0 = fileIO.lseek(file.fd, 5);
      expect(pnumber0 == 5).assertTrue();
      let pnumber =  fileIO.lseek(file.fd, -1, fileIO.WhenceType.SEEK_CUR);
      expect(pnumber == 4).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == FILE_CONTENT.length - 4).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_lseek_011 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_012
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1200
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_012', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_012');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let pnumber =  fileIO.lseek(file.fd, -2, fileIO.WhenceType.SEEK_END);
      expect(pnumber == FILE_CONTENT.length - 2).assertTrue();
      let readLen = fileIO.readSync(file.fd, new ArrayBuffer(4096));
      expect(readLen == FILE_CONTENT.length - pnumber).assertTrue();
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_lseek_012 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_013
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1300
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_013', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_013');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
      let fd = file.fd;
      fileIO.closeSync(file);
      fileIO.lseek(fd, 5, fileIO.WhenceType.SEEK_CUR);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_lseek_013 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900008 && e.message == 'Bad file descriptor').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_014
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1400
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_014', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_014');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    
    try {
      fileIO.lseek(file.fd, -100, fileIO.WhenceType.SEEK_CUR);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_lseek_014 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.name   fileIO_test_lseek_015
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_LSEEK_1500
   * @tc.desc   Test lseek() interface.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_lseek_015', Level.LEVEL3, async function () {
    let fpath = await nextFileName('fileIO_test_lseek_015');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    let file = fileIO.openSync(fpath, fileIO.OpenMode.READ_WRITE);
    
    try {
      fileIO.lseek(file.fd, 5, 3);
      expect(false).assertTrue();
    } catch (e) {
      fileIO.closeSync(file);
      fileIO.unlinkSync(fpath);
      console.log('fileIO_test_lseek_015 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });
})
}