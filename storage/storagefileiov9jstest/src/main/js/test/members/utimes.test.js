/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.expect
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
  
export default function fileIOUtimes() {
  describe('fileIO_fileIO_utimes', function () {

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0100
   * @tc.name fileIO_test_utimes_async_001
   * @tc.desc Test utimes() interfaces.
   * Modify File Last Access Time attribute,verify normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_utimes_async_001', 0, async function () {
    let fpath = await nextFileName('fileIO_test_utimes_async_001');
    expect(prepareFile(fpath,FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime();
      fileIO.utimes(fpath, time);
      let stat = fileIO.statSync(fpath);
      let setime = Math.floor(time / 1000);
      expect(stat.mtime == setime).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_utimes_async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0200
   * @tc.name fileIO_test_utimes_async_002
   * @tc.desc Test utimes() interfaces.
   * Modify the time(minus 10s) of the file,Verify normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_utimes_async_002', 3, async function () {
    let fpath = await nextFileName('fileIO_test_utimes_async_002');
    expect(prepareFile(fpath,FILE_CONTENT)).assertTrue();
    
    try {
      let time = new Date().getTime() - 10000;
      fileIO.utimes(fpath, time);
      let stat = fileIO.statSync(fpath);
      let setime = Math.floor(time / 1000);
      expect(stat.mtime == setime).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_utimes_async_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0300
   * @tc.name fileIO_test_utimes_async_003
   * @tc.desc Test utimes() interfaces.
   * Modify the time(add 3s) of the file, verify normal function.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 0
   * @tc.require
   */
  it('fileIO_test_utimes_async_003', 0, async function () {
    let fpath = await nextFileName('fileIO_test_utimes_async_003');
    expect(prepareFile(fpath,FILE_CONTENT)).assertTrue();

    try {
      let time = new Date().getTime() + 3000;
      fileIO.utimes(fpath, time);
      let stat = fileIO.statSync(fpath); 
      let setime = Math.floor(time / 1000);
      expect(stat.mtime == setime).assertTrue();
      fileIO.unlinkSync(fpath);
    } catch (e) {
      console.log('fileIO_test_utimes_async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0400
   * @tc.name fileIO_test_utimes_async_004
   * @tc.desc Test utimes() interfaces.
   * The path point to nothing, no such file.   
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_utimes_async_004', 3, async function () {
    let fpath = await nextFileName('fileIO_test_utimes_async_004');

    try {
      fileIO.utimes(fpath,new Date().getTime());
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_utimes_async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0500
   * @tc.name fileIO_test_utimes_async_005
   * @tc.desc Test utimes() interfaces.
   * Missing parameter.
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_utimes_async_005', 3, async function () {
    let fpath = await nextFileName('fileIO_test_utimes_async_005');
    expect(prepareFile(fpath,FILE_CONTENT)).assertTrue();

    try {
      fileIO.utimes();
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_utimes_async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0600
   * @tc.name fileIO_test_utimes_async_006
   * @tc.desc Test utimes() interfaces.
   * Invalid parameter -1
   * @tc.size MEDIUM
   * @tc.type Functoin
   * @tc.level Level 3
   * @tc.require
   */
  it('fileIO_test_utimes_async_006', 3, async function () {
    let fpath = await nextFileName('fileIO_test_utimes_async_006');
    expect(prepareFile(fpath,FILE_CONTENT)).assertTrue();

    try {
      fileIO.utimes(fpath,-1);
      expect(false).assertTrue();
    } catch (e) {
      console.log('fileIO_test_utimes_async_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  }); 
});
}