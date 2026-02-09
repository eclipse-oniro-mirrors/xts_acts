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
import { Level } from '@ohos/hypium';
  
export default function fileIOUtimes() {
  describe('fileIO_fileIO_utimes', function () {

  /**
   * @tc.name   fileIO_test_utimes_async_001
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0100
   * @tc.desc   Test utimes() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_utimes_async_001', Level.LEVEL0, async function () {
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
   * @tc.name   fileIO_test_utimes_async_002
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0200
   * @tc.desc   Test utimes() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_utimes_async_002', Level.LEVEL3, async function () {
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
   * @tc.name   fileIO_test_utimes_async_003
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0300
   * @tc.desc   Test utimes() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL0
   */
  it('fileIO_test_utimes_async_003', Level.LEVEL0, async function () {
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
   * @tc.name   fileIO_test_utimes_async_004
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0400
   * @tc.desc   Test utimes() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_utimes_async_004', Level.LEVEL3, async function () {
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
   * @tc.name   fileIO_test_utimes_async_005
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0500
   * @tc.desc   Test utimes() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_utimes_async_005', Level.LEVEL3, async function () {
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
   * @tc.name   fileIO_test_utimes_async_006
   * @tc.number SUB_BASIC_FM_FileAPI_FileIOV9_FILEIO_UTIMES_0600
   * @tc.desc   Test utimes() interfaces.
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
  it('fileIO_test_utimes_async_006', Level.LEVEL3, async function () {
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