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

import fileShare from '@ohos.fileshare';
import fileuri from '@ohos.file.fileuri';
import fs from '@ohos.file.fs';
import { describe, it, expect, Level } from '@ohos/hypium';
import { FILE_CONTENT, prepareFile, nextFileName } from './Common';

export default function File_Nopermission_test() {
  describe('nopermission_test', function () {

    /**
    * @tc.number SUB_BASIC_FM_FileAPI_FileShare_NoPermission_0100
    * @tc.name FileShare_NoPermission_001
    * @tc.desc Test persistPermission() interfaces
    * Test normal uri and OperationMode is READ_MODE.
    * @tc.size MEDIUM
    * @tc.type Function
    * @tc.level Level 0
    * @tc.require
    */
    it('FileShare_NoPermission_001', Level.LEVEL3, async function (done) {
      let fpath = await nextFileName('FileShare_NoPermission_001');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let uriObject = new fileuri.FileUri(fpath);
        let uri = uriObject.toString();
        let fd = await fs.open(uri, fs.OpenMode.CREATE);
        await fs.close(fd);
        let policyInfo = {
          uri: uri,
          operationMode: fileShare.OperationMode.READ_MODE,
        };
        let policies = [policyInfo];
        fileShare.persistPermission(policies).then(() => {
          console.info("FileShare_NoPermission_001 successfully");
          expect(true).assertTrue();
          done();
        }).catch((err) => {
          console.info("FileShare_NoPermission_001 failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code == 201 && err.message == "Permission verification failed").assertTrue();
          done();
        });
      } catch (e) {
        console.info('FileShare_NoPermission_001 has failed for ' + e.message + ", err code: " + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        }
        done();
      }
    });

    /**
      * @tc.number SUB_BASIC_FM_FileAPI_FileShare_NoPermission_0200
      * @tc.name FileShare_NoPermission_002
      * @tc.desc Test deactivatePermission() interfaces
      * Test normal uri and OperationMode is READ_MODE.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('FileShare_NoPermission_002', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('FileShare_NoPermission_002');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let uriObject = new fileuri.FileUri(fpath);
        let uri = uriObject.toString();
        let fd = await fs.open(uri, fs.OpenMode.CREATE);
        await fs.close(fd);
        let policyInfo = {
          uri: uri,
          operationMode: fileShare.OperationMode.READ_MODE,
        };
        let policies = [policyInfo];
        fileShare.deactivatePermission(policies).then(() => {
          console.info("FileShare_NoPermission_002 successfully");
          expect(true).assertTrue();
          done();
        }).catch((err) => {
          console.info("FileShare_NoPermission_002 failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code == 201 && err.message == "Permission verification failed").assertTrue();
          done();
        });
      } catch (e) {
        console.info('FileShare_NoPermission_002 has failed for ' + e.message + ", err code: " + e.code);
        if (e.code == 801) {
          expect(e.message == "The device doesn't support this api").assertTrue();
        }
        done();
      }
    });
    /**
      * @tc.number SUB_BASIC_FM_FileAPI_FileShare_NoPermission_0300
      * @tc.name FileShare_NoPermission_003
      * @tc.desc Test revokePermission() interfaces
      * Test normal uri and OperationMode is READ_MODE.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('FileShare_NoPermission_003', Level.LEVEL0, async function (done) {
      let fpath = await nextFileName('FileShare_NoPermission_003');
      expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
      let uriObject = new fileuri.FileUri(fpath);
      let uri = uriObject.toString();
      let fd = await fs.open(uri,fs.OpenMode.CREATE);
      await fs.close(fd);
      let policyInfo = {
          uri: uri, 
          operationMode: fileShare.OperationMode.READ_MODE,
        };
        let policies = [policyInfo];
        fileShare.revokePermission(policies).then(() => {
          console.info("FileShare_NoPermission_003 successfully");
          expect(true).assertTrue();
          done();
        }).catch((err) => {
          console.info("FileShare_NoPermission_003 failed with error message: " + err.message + ", error code: " + err.code);
          expect(err.code == 201 && err.message == "Permission verification failed").assertTrue();
          done();
        });
      } catch (e) {
        console.info('FileShare_NoPermission_003 has failed for ' + e.message + ", err code: " + e.code);
        if(e.code == 801){
          expect(e.message == "The device doesn't support this api").assertTrue();
        }
        done();
      }
  });

  /**
   * @tc.number SUB_BASIC_FM_FileAPI_FileShare_NoPermission_0400
   * @tc.name FileShare_NoPermission_004
   * @tc.desc Test activatePermission() interfaces
   * Test normal uri and OperationMode is READ_MODE.
   * @tc.size MEDIUM
   * @tc.type Function
   * @tc.level Level 0
   * @tc.require
   */
  it('FileShare_NoPermission_004', Level.LEVEL0, async function (done) {
    let fpath = await nextFileName('FileShare_NoPermission_004');
    expect(prepareFile(fpath, FILE_CONTENT)).assertTrue();

    try {
    let uriObject = new fileuri.FileUri(fpath);
    let uri = uriObject.toString();
    let fd = await fs.open(uri,fs.OpenMode.CREATE);
    await fs.close(fd);
    let policyInfo = {
        uri: uri, 
        operationMode: fileShare.OperationMode.READ_MODE,
      };
      let policies = [policyInfo];
      fileShare.activatePermission(policies).then(() => {
        console.info("FileShare_NoPermission_004 successfully");
        expect(true).assertTrue();
        done();
      }).catch((err) => {
        console.info("FileShare_NoPermission_004 failed with error message: " + err.message + ", error code: " + err.code);
        expect(err.code == 201 && err.message == "Permission verification failed").assertTrue();
        done();
      });
    } catch (e) {
      console.info('FileShare_NoPermission_004 has failed for ' + e.message + ", err code: " + e.code);
      if(e.code == 801){
        expect(e.message == "The device doesn't support this api").assertTrue();
      }else{
        expect(false).assertTrue();
      }
      done();
    }
  });
  })
}