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
    FILE_CONTENT, prepareFile, nextFileName, describe, it, expect
  } from '../Common';
import fs from '@ohos.file.fs';
import { TestType, Size, Level } from '@ohos/hypium';

export default function fileIOSetxattr() {
describe('fileIO_test_setxattr', function () {

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Async_0100
   * @tc.name test_FileIO_Setxattr_Async_001
   * @tc.desc Test setxattr() interface.
   * Set file extension properties.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('test_FileIO_Setxattr_Async_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('test_FileIO_Setxattr_Async_001');
    let attrKey = 'user.comment';
    let attrValue = 'Test file.';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      fs.setxattr(fpath, attrKey, attrValue).then(() => {
        console.info("Set extended attribute successfully.");
        expect(true).assertTrue();
      }).catch((err) => {
        console.error("test_FileIO_Setxattr_Async_001 Failed to set extended attribute: " + err.message + ", error code: " + err.code);
      });
      done();
    } catch (e) {
      console.log('test_FileIO_Setxattr_Async_001 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
   });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Sync_0200
   * @tc.name test_FileIO_Setxattr_Sync_002
   * @tc.desc Test setxattr() interface.
   * The test file is not exist.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('test_FileIO_Setxattr_Sync_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('test_FileIO_Setxattr_Sync_002');
    let attrKey = 'user.comment';
    let attrValue = 'Test file.';
    
    try {
      fs.setxattr(fpath, attrKey, attrValue).then(() => {
        console.info("Set extended attribute successfully.");
      }).catch((err) => {
        console.error("test_FileIO_Setxattr_Sync_002 Failed to set extended attribute: " + err.message + ", error code: " + err.code);
        expect(err.code == 13900002 && err.message == 'No such file or directory').assertTrue();
      });
      done();
    } catch (e) {
      console.log('test_FileIO_Setxattr_Sync_002 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Async_0300
   * @tc.name test_FileIO_Setxattr_Async_003
   * @tc.desc Test setxattr() interface.
   * Set file extension properties.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('test_FileIO_Setxattr_Async_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('test_FileIO_Setxattr_Async_003');
    let attrKey = 'user.comment';
    let attrValue = 'Test file.';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      fs.setxattrSync(fpath, attrKey, attrValue);
      expect(true).assertTrue();
    } catch (e) {
      console.log('test_FileIO_Setxattr_Async_003 has failed for ' + e.message + ', code: ' + e.code);
      expect(false).assertTrue();
    }
   });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Async_0400
   * @tc.name test_FileIO_Setxattr_Async_004
   * @tc.desc Test setxattr() interface.
   * No such file or directory.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('test_FileIO_Setxattr_Async_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('test_FileIO_Setxattr_Async_004');
    let attrKey = 'user.comment';
    let attrValue = 'Test file.';
    
    try {
      fs.setxattrSync(fpath, attrKey, attrValue);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileIO_Setxattr_Async_004 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900002 && e.message == 'No such file or directory').assertTrue();
    }
   });

   /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Async_0500
   * @tc.name test_FileIO_Setxattr_Async_005
   * @tc.desc Test setxattr() interface.
   * Invalid argument.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('test_FileIO_Setxattr_Async_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function () {
    let fpath = await nextFileName('test_FileIO_Setxattr_Async_005');
    let attrKey = 'user.comment';
    let attrValue = 'Test file.';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      fs.setxattrSync(fpath, attrKey);
      expect(false).assertTrue();
    } catch (e) {
      console.log('test_FileIO_Setxattr_Async_005 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
    }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileIo_SETXATTR_Sync_0600
   * @tc.name test_FileIO_Setxattr_Sync_006
   * @tc.desc Test setxattr() interface.
   * Invalid argument.
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 3
   * @tc.require
   */  
  it('test_FileIO_Setxattr_Sync_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
    let fpath = await nextFileName('test_FileIO_Setxattr_Sync_006');
    let attrKey = 'user.comment';
    let attrValue = 'Test file.';
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();
    
    try {
      fs.setxattr(fpath, attrKey, 1).then(() => {
        console.info("Set extended attribute successfully.");
      }).catch((err) => {
        console.error("test_FileIO_Setxattr_Sync_006 Failed to set extended attribute: " + err.message + ", error code: " + err.code);
        expect(false).assertTrue();
      });
    } catch (e) {
      console.log('test_FileIO_Setxattr_Sync_006 has failed for ' + e.message + ', code: ' + e.code);
      expect(e.code == 13900020 && e.message == 'Invalid argument').assertTrue();
      done();
    }
  });
});
}