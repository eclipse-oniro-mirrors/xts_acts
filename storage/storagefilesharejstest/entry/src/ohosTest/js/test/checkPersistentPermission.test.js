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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function FileSahre_CheckPersistentPermission_test() {
    describe('CheckPersistentPermission_test', function () {
      
      /**
       * @tc.name   FileShare_checkPersistentPermission_001
       * @tc.number SUB_BASIC_FM_FileAPI_FileShare_CheckPersistentPermission_test_0100
       * @tc.desc   Test checkPersistentPermission() interfaces
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('FileShare_checkPersistentPermission_001', Level.LEVEL0, async function (done) {
        try {
        let fileStr1 = "/data/storage/el2/base/haps/entry/files/FileShare_checkPersistentPermission_001.txt";
        let uriObject1 = new fileuri.FileUri(fileStr1);
        let uri1 = uriObject1.toString();
        let fd1 = await fs.open(uri1,fs.OpenMode.CREATE);
        await fs.close(fd1);
        let policyInfo1 = {
            uri: uri1, 
            operationMode: fileShare.OperationMode.READ_MODE,
        };
        let fileStr2 = "/data/storage/el2/base/haps/entry/files/FileShare_checkPersistentPermission_00101.txt";
        let uriObject2 = new fileuri.FileUri(fileStr2);
        let uri2 = uriObject2.toString();
        let fd2 = await fs.open(uri2,fs.OpenMode.CREATE);
        await fs.close(fd2);
        let policyInfo2 = {
            uri: uri2, 
            operationMode: fileShare.OperationMode.READ_MODE,
        };
        let policies = [policyInfo1, policyInfo2];
        fileShare.checkPersistentPermission(policies).then((data) => {
            let result = data;
            for (let i = 0; i < result.length; i++) {
                console.log("FileShare_checkPersistentPermission_001 result: " + JSON.stringify(result[i]));
                if(!result[i]){
                    let info =  {
                        uri: policies[i].uri,
                        operationMode: policies[i].operationMode,
                    };
                    let policy = [info];
                    fileShare.persistPermission(policy);
                }
            }
            console.info("FileShare_checkPersistentPermission_001 successfully");
            expect(fileShare.OperationMode.READ_MODE === 0b1).assertTrue();
            done();
        }).catch((err) => {
            console.info("FileShare_checkPersistentPermission_001 failed with error message: " + err.message + ", error code: " + err.code);
            expect(false).assertTrue();
            done();
        });
        } catch (e) {
          console.info('FileShare_checkPersistentPermission_001 has failed for ' + e.message + ", err code: " + e.code);
          if(e.code == 801){
            expect(e.message == "The device doesn't support this api").assertTrue();
          }
          done();
        }
      });
      
      /**
       * @tc.name   FileShare_checkPersistentPermission_002
       * @tc.number SUB_BASIC_FM_FileAPI_FileShare_CheckPersistentPermission_test_0200
       * @tc.desc   Test checkPersistentPermission() interfaces
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('FileShare_checkPersistentPermission_002', Level.LEVEL0, async function (done) {
        try {
        let fileStr1 = "/data/storage/el2/base/haps/entry/files/FileShare_checkPersistentPermission_002.txt";
        let uriObject1 = new fileuri.FileUri(fileStr1);
        let uri1 = uriObject1.toString();
        let fd1 = await fs.open(uri1,fs.OpenMode.CREATE);
        await fs.close(fd1);
        let policyInfo1 = {
            uri: uri1, 
            operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
        };
        let fileStr2 = "/data/storage/el2/base/haps/entry/files/FileShare_checkPersistentPermission_00201.txt";
        let uriObject2 = new fileuri.FileUri(fileStr2);
        let uri2 = uriObject2.toString();
        let fd2 = await fs.open(uri2,fs.OpenMode.CREATE);
        await fs.close(fd2);
        let policyInfo2 = {
            uri: uri2, 
            operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
        };
        let policies = [policyInfo1, policyInfo2];
        fileShare.checkPersistentPermission(policies).then((data) => {
            let result = data;
            for (let i = 0; i < result.length; i++) {
                console.log("FileShare_checkPersistentPermission_002 result: " + JSON.stringify(result[i]));
                if(!result[i]){
                    let info =  {
                        uri: policies[i].uri,
                        operationMode: policies[i].operationMode,
                    };
                    let policy = [info];
                    fileShare.persistPermission(policy);
                }
            }
            console.info("FileShare_checkPersistentPermission_002 successfully");
            expect(fileShare.OperationMode.READ_MODE === 0b1).assertTrue();
            done();
        }).catch((err) => {
            console.info("FileShare_checkPersistentPermission_002 failed with error message: " + err.message + ", error code: " + err.code);
            expect(false).assertTrue();
            done();
        });
        } catch (e) {
          console.info('FileShare_checkPersistentPermission_002 has failed for ' + e.message + ", err code: " + e.code);
          if(e.code == 801){
            expect(e.message == "The device doesn't support this api").assertTrue();
          }
          done();
        }
      });
      
      /**
       * @tc.name   FileShare_checkPersistentPermission_003
       * @tc.number SUB_BASIC_FM_FileAPI_FileShare_CheckPersistentPermission_test_0300
       * @tc.desc   Test checkPersistentPermission() interfaces
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('FileShare_checkPersistentPermission_003', Level.LEVEL3, async function (done) {
        try {
        let fileStr1 = "/data/storage/el2/base/haps/entry/files/FileShare_checkPersistentPermission_003.txt";
        let uriObject1 = new fileuri.FileUri(fileStr1);
        let uri1 = uriObject1.toString();
        let fd1 = await fs.open(uri1,fs.OpenMode.CREATE);
        await fs.close(fd1);
        let policyInfo1 = {
            uri: uri1, 
            operationMode: fileShare.OperationMode.READ_MODE,
        };
        let fileStr2 = "/data/storage/el2/base/haps/entry/files/FileShare_checkPersistentPermission_00301.txt";
        let uriObject2 = new fileuri.FileUri(fileStr2);
        let uri2 = uriObject2.toString();
        let fd2 = await fs.open(uri2,fs.OpenMode.CREATE);
        await fs.close(fd2);
        let policyInfo2 = {
            uri: uri2, 
            operationMode: fileShare.OperationMode.READ_MODE,
        };
        let policies = [policyInfo1, policyInfo2];
        fileShare.checkPersistentPermission(policies).then((data) => {
            console.info("FileShare_checkPersistentPermission_003 successfully");
            expect(false).assertTrue();
            done();
        }).catch((err) => {
            console.info("FileShare_checkPersistentPermission_003 failed with error message: " + err.message + ", error code: " + err.code);
            expect(err.code == 13900001 && err.message == 'Operation not permitted').assertTrue();
            if (err.code == 13900001 && err.data) {
                console.log("FileShare.PolicyErrorResult PERMISSION_NOT_PERSISTED : " + JSON.stringify(err.data[0].code));
                console.log("FileShare.PolicyErrorResult uri : " + JSON.stringify(err.data[0].uri));
                console.log("FileShare.PolicyErrorResult reason : " + JSON.stringify(err.data[0].message));
                expect(err.data[0].code == 4 && err.data[0].message == "PERMISSION_NOT_PERSISTED").assertTrue();
                expect(err.data[0].code == fileShare.PolicyErrorCode.PERMISSION_NOT_PERSISTED).assertTrue();
                done();
              }
        });
        } catch (e) {
          console.info('FileShare_checkPersistentPermission_003 has failed for ' + e.message + ", err code: " + e.code);
          if(e.code == 801){
            expect(e.message == "The device doesn't support this api").assertTrue();
          }
          done();
        }
      });

      /**
 	        * @tc.name   FileShare_checkPersistentPermission_004
 	        * @tc.number SUB_BASIC_FM_FileAPI_FileShare_CheckPersistentPermission_test_0400
 	        * @tc.desc   Test checkPersistentPermission() interfaces with null parameter
 	        * @tc.type   FUNCTION
 	        * @tc.size   MEDIUMTEST
 	        * @tc.level  LEVEL3
 	        */
 	       it('FileShare_checkPersistentPermission_004', Level.LEVEL3, async function (done) {
 	         try {
 	           fileShare.checkPersistentPermission(null).then(() => {
 	             console.info("FileShare_checkPersistentPermission_004 should not succeed");
 	             expect(false).assertTrue();
 	             done();
 	           }).catch((err) => {
 	             console.info("FileShare_checkPersistentPermission_004 failed with error message: " + err.message + ", error code: " + err.code);
 	             expect(err.code === 401).assertTrue();
 	             done();
 	           });
 	         } catch (e) {
 	           console.info('FileShare_checkPersistentPermission_004 has failed for ' + e.message + ", err code: " + e.code);
 	           expect(e.code === 401).assertTrue();
 	           done();
 	         }
 	       });
 	 
 	       /**
 	        * @tc.name   FileShare_checkPersistentPermission_005
 	        * @tc.number SUB_BASIC_FM_FileAPI_FileShare_CheckPersistentPermission_test_0500
 	        * @tc.desc   Test checkPersistentPermission() interfaces with undefined parameter
 	        * @tc.type   FUNCTION
 	        * @tc.size   MEDIUMTEST
 	        * @tc.level  LEVEL3
 	        */
 	       it('FileShare_checkPersistentPermission_005', Level.LEVEL3, async function (done) {
 	         try {
 	           fileShare.checkPersistentPermission(undefined).then(() => {
 	             console.info("FileShare_checkPersistentPermission_005 should not succeed");
 	             expect(false).assertTrue();
 	             done();
 	           }).catch((err) => {
 	             console.info("FileShare_checkPersistentPermission_005 failed with error message: " + err.message + ", error code: " + err.code);
 	             expect(err.code === 401).assertTrue();
 	             done();
 	           });
 	         } catch (e) {
 	           console.info('FileShare_checkPersistentPermission_005 has failed for ' + e.message + ", err code: " + e.code);
 	           expect(e.code === 401).assertTrue();
 	           done();
 	         }
 	       });
 	 
 	       /**
 	        * @tc.name   FileShare_checkPersistentPermission_006
 	        * @tc.number SUB_BASIC_FM_FileAPI_FileShare_CheckPersistentPermission_test_0600
 	        * @tc.desc   Test checkPersistentPermission() interfaces with empty array parameter
 	        * @tc.type   FUNCTION
 	        * @tc.size   MEDIUMTEST
 	        * @tc.level  LEVEL3
 	        */
 	       it('FileShare_checkPersistentPermission_006', Level.LEVEL3, async function (done) {
 	         try {
 	           let policies = [];
 	           fileShare.checkPersistentPermission(policies).then((data) => {
 	             console.info("FileShare_checkPersistentPermission_006 successfully");
 	             expect(false).assertTrue();
 	             done();
 	           }).catch((err) => {
 	             console.info("FileShare_checkPersistentPermission_006 failed with error message: " + err.message + ", error code: " + err.code);
 	             expect(err.code === 401).assertTrue();
 	             done();
 	           });
 	         } catch (e) {
 	           console.info('FileShare_checkPersistentPermission_006 has failed for ' + e.message + ", err code: " + e.code);
 	           if(e.code === 801){
 	             expect(e.message == "The device doesn't support this api").assertTrue();
 	           }
 	           done();
 	         }
 	       });
    })
}