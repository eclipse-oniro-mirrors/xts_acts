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
import { describe, it, expect, } from '@ohos/hypium';

export default function FileSahre_DeactivatePermission_test() {
    describe('DeactivatePermission_test', function () {
      
      /**
      * @tc.number SUB_BASIC_FM_FileAPI_FileShare_DeactivatePermission_0100
      * @tc.name FileShare_deactivatePermission_001
      * @tc.desc Test deactivatePermission() interfaces
      * Test normal uri and OperationMode is READ_MODE.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
      it('FileShare_deactivatePermission_001', 0, async function (done) {
          try {
          let fileStr = "/data/storage/el2/base/haps/entry/files/FileShare_deactivatePermission_001.txt";
          let uriObject = new fileuri.FileUri(fileStr);
          let uri = uriObject.toString();
          let fd = await fs.open(uri,fs.OpenMode.CREATE);
          await fs.close(fd);
          let policyInfo = {
              uri: uri, 
              operationMode: fileShare.OperationMode.READ_MODE,
            };
            let policies = [policyInfo];
            fileShare.deactivatePermission(policies).then(() => {
              console.info("FileShare_deactivatePermission_001 successfully");
              expect(true).assertTrue();
              done();
            }).catch((err) => {
              console.info("FileShare_deactivatePermission_001 failed with error message: " + err.message + ", error code: " + err.code);
              expect(false).assertTrue();
              done();
            });
          } catch (e) {
            console.info('FileShare_deactivatePermission_001 has failed for ' + e.message + ", err code: " + e.code);
            if(e.code == 801){
              expect(e.message == "The device doesn't support this api").assertTrue();
            }
            done();
          }
      });

      /**
      * @tc.number SUB_BASIC_FM_FileAPI_FileShare_DeactivatePermission_0200
      * @tc.name FileShare_deactivatePermission_002
      * @tc.desc Test deactivatePermission() interfaces
      * Test normal uri and OperationMode is READ_MODE and WRITE_MODE .
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
      it('FileShare_deactivatePermission_002', 0, async function (done) {
          try {
          let fileStr = "/data/storage/el2/base/haps/entry/files/FileShare_deactivatePermission_002.txt";
          let uriObject = new fileuri.FileUri(fileStr);
          let uri = uriObject.toString();
          let fd = await fs.open(uri,fs.OpenMode.CREATE);
          await fs.close(fd);
          let policyInfo = {
              uri: uri, 
              operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
            };
            let policies = [policyInfo];
            fileShare.deactivatePermission(policies).then(() => {
              console.info("FileShare_deactivatePermission_002 successfully");
              expect(true).assertTrue();
              done();
            }).catch((err) => {
              console.info("FileShare_deactivatePermission_002 failed with error message: " + err.message + ", error code: " + err.code);
              expect(false).assertTrue();
              done();
            });
          } catch (e) {
            console.info('FileShare_deactivatePermission_002 has failed for ' + e.message + ", err code: " + e.code);
            if(e.code == 801){
              expect(e.message == "The device doesn't support this api").assertTrue();
            }
            done();
          }
      });

      /**
      * @tc.number SUB_BASIC_FM_FileAPI_FileShare_DeactivatePermission_0300
      * @tc.name FileShare_deactivatePermission_003
      * @tc.desc Test deactivatePermission() interfaces
      * Test INVALID_PATH uri and OperationMode is READ_MODE.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 3
      * @tc.require
      */
      it('FileShare_deactivatePermission_003', 3, async function (done) {
          try {
          let fileStr = "/data/storage/el2/base/haps/entry/files/FileShare_deactivatePermission_003.txt";
          let uriObject = new fileuri.FileUri(fileStr);
          let uri = uriObject.toString();
          let policyInfo = {
              uri: uri, 
              operationMode: -1,
            };
            let policies = [policyInfo];
            fileShare.deactivatePermission(policies).then(() => {
              console.info("FileShare_deactivatePermission_003 successfully");
              expect(false).assertTrue();
              done();
            }).catch((err) => {
              console.info("FileShare_deactivatePermission_003 failed with error message: " + err.message + ", error code: " + err.code);
              expect(err.code == 13900001 && err.message == 'Operation not permitted').assertTrue();
              if (err.code == 13900001 && err.data) {
                for (let i = 0; i < err.data.length; i++) {
                  console.log("FileShare.PolicyErrorResult PolicyErrorCode.INVALID_PATH : " + JSON.stringify(err.data[i].code));
                  console.log("FileShare.PolicyErrorResult uri : " + JSON.stringify(err.data[i].uri));
                  console.log("FileShare.PolicyErrorResult reason : " + JSON.stringify(err.data[i].message));
                  expect(err.data[i].code == 3).assertTrue();
                  done();
                }
              }
            });
          } catch (e) {
            console.info('FileShare_deactivatePermission_003 has failed for ' + e.message + ", err code: " + e.code);
            if(e.code == 801){
              expect(e.message == "The device doesn't support this api").assertTrue();
            }
            done();
          }
      });
    })
}