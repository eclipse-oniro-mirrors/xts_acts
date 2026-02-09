/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import fs from '@ohos.file.fs';
import fileUri from '@ohos.file.fileuri';
import fileShare from '@ohos.fileshare';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import wantConstant from '@ohos.app.ability.wantConstant';


let domain: int = 0x0000;
let tag: string = 'testTag'; 
const FILE_CONTENT = 'hello world';

export default function FileShare_test() {
  let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  let data = context.filesDir;
  describe("FileShare_test", (): void => {
    hilog.info(domain, tag, '%{public}s', 'FileShare_test start');

    beforeAll(() => {
      try {
        fs.mkdirSync("/data/storage/el2/base/haps/entry/files", true);
      }catch(e) {
        hilog.info(domain, tag, `FileShare test has failed for ${JSON.stringify(e)}`);
      }
    })

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_ActivatePermission_0100
     * @tc.name FileShare_activatePermission_static_001
     * @tc.desc Test activatePermission() interfaces
     * Test normal uri and OperationMode is READ_MODE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_activatePermission_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const fileStr: String = data + "/FileShare_activatePermission_static_001.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_static_001 START');

        try {
          const uri = fileUri.getUriFromPath(fileStr);
          hilog.info(domain, tag, '%{public}s', `Created test file and closed. URI: ${uri}`);
          const fd = await fs.open(uri, fs.OpenMode.CREATE);
          await fs.close(fd);
          hilog.info(domain, tag, '%{public}s', `Created test file and closed. URI: ${uri}`);
          let policyInfo: fileShare.PolicyInfo = {
            uri: uri,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          let policies: Array<fileShare.PolicyInfo> = [policyInfo];
          await fileShare.activatePermission(policies);
          hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_static_001: activatePermission success');
          done();
        } catch (e) {
          hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_static_001 has failed for ' + e);
          let err = e as BusinessError;
          if (err.code === 801) {
            expect(err.message === "The device doesn't support this api").assertTrue();
          }
          if (err.code == 13900001) {
            expect(err.message == 'Operation not permitted').assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_static_001 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_ActivatePermission_0200
     * @tc.name FileShare_activatePermission_static_002
     * @tc.desc Test activatePermission() interfaces
     * Test normal uri and OperationMode is READ_MODE and WRITE_MODE .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_activatePermission_static_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const fileStr: String = data + "/FileShare_activatePermission_static_002.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_static_002 START');

        try {
          const uri = fileUri.getUriFromPath(fileStr);
          hilog.info(domain, tag, '%{public}s', `Constructed URI: ${uri}`);
          const fd = await fs.open(uri, fs.OpenMode.CREATE);
          await fs.close(fd);
          let policyInfo: fileShare.PolicyInfo = {
            uri: uri,
            operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
          };
          let policies: Array<fileShare.PolicyInfo> = [policyInfo];
          await fileShare.activatePermission(policies);
          hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_static_002 success');
          done();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag,
            'FileShare_activatePermission_static_002 failed: code = %{public}d, message = %{public}s',
            err.code, err.message);
          if (err.code === 801) {
            expect(err.message === "The device doesn't support this api").assertTrue();
          }
          if (err.code == 13900001) {
            expect(err.message == 'Operation not permitted').assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }

        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_static_002 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_ActivatePermission_0300
     * @tc.name FileShare_activatePermission_static_003
     * @tc.desc Test activatePermission() interfaces
     * Test INVALID_PATH uri and OperationMode is READ_MODE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('FileShare_activatePermission_static_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const fileStr1: String = data + "/FileShare_activatePermission_static_003_1.txt";
        const fileStr2: String = data + "/FileShare_activatePermission_static_003_2.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_static_003 START');

        try {
          const uri1 = fileUri.getUriFromPath(fileStr1);
          const policyInfo1: fileShare.PolicyInfo = {
            uri: uri1,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          const uri2 = fileUri.getUriFromPath(fileStr2);
          const fd = await fs.open(uri2, fs.OpenMode.CREATE);
          await fs.close(fd);
          const policyInfo2: fileShare.PolicyInfo = {
            uri: uri2,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          const policies: Array<fileShare.PolicyInfo> = [policyInfo1, policyInfo2];
          await fileShare.activatePermission(policies);
          hilog.error(domain, tag, 'Unexpected success: activatePermission should have failed');
          expect(false).assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, 'Expected failure: code = %{public}d, message = %{public}s',
            error.code, error.message);
          if (error.code === 801) {
            expect(error.message === "The device doesn't support this api").assertTrue();
          }
          if (error.code == 13900001) {
            expect(error.message == 'Operation not permitted').assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'FileShare_activatePermission_static_003 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_DeactivatePermission_0100
     * @tc.name FileShare_deactivatePermission_static_001
     * @tc.desc Test deactivatePermission() interfaces
     * Test normal uri and OperationMode is READ_MODE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_deactivatePermission_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const fileStr: String = data + "/FileShare_deactivatePermission_static_001.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_static_001 START');

        try {
          const uri = fileUri.getUriFromPath(fileStr);
          hilog.info(domain, tag, '%{public}s', `Created test file and closed. URI: ${uri}`);
          const fd = await fs.open(uri, fs.OpenMode.CREATE);
          await fs.close(fd);
          hilog.info(domain, tag, '%{public}s', `Created test file and closed. URI: ${uri}`);
          let policyInfo: fileShare.PolicyInfo = {
            uri: uri,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          let policies: Array<fileShare.PolicyInfo> = [policyInfo];
          await fileShare.deactivatePermission(policies);
          hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_static_001: deactivatePermission success');
          done();
        } catch (e) {
          hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_static_001 has failed for ' + e);
          let err = e as BusinessError;
          if (err.code === 801) {
            expect(err.message === "The device doesn't support this api").assertTrue();
          }
          if (err.code == 13900001) {
            expect(err.message == 'Operation not permitted').assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_static_001 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_DeactivatePermission_0200
     * @tc.name FileShare_deactivatePermission_static_002
     * @tc.desc Test deactivatePermission() interfaces
     * Test normal uri and OperationMode is READ_MODE and WRITE_MODE .
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_deactivatePermission_static_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const fileStr: String = data + "/FileShare_deactivatePermission_static_002.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_static_002 START');

        try {
          const uri = fileUri.getUriFromPath(fileStr);
          hilog.info(domain, tag, '%{public}s', `Constructed URI: ${uri}`);
          const fd = await fs.open(uri, fs.OpenMode.CREATE);
          await fs.close(fd);
          let policyInfo: fileShare.PolicyInfo = {
            uri: uri,
            operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
          };
          let policies: Array<fileShare.PolicyInfo> = [policyInfo];
          await fileShare.deactivatePermission(policies);
          hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_static_002 success');
          done();
        } catch (e) {
          const err = e as BusinessError;
          hilog.info(domain, tag,
            'FileShare_deactivatePermission_static_002 failed: code = %{public}d, message = %{public}s',
            err.code, err.message);
          if (err.code === 801) {
            expect(err.message === "The device doesn't support this api").assertTrue();
          }
          if (err.code == 13900001) {
            expect(err.message == 'Operation not permitted').assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }

        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_static_002 END');
      });


    /**
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_DeactivatePermission_0300
     * @tc.name FileShare_deactivatePermission_static_003
     * @tc.desc Test deactivatePermission() interfaces
     * Test INVALID_PATH uri and OperationMode is READ_MODE.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it('FileShare_deactivatePermission_static_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const fileStr1: String = data + "/FileShare_deactivatePermission_static_003_1.txt";
        const fileStr2: String = data + "/FileShare_deactivatePermission_static_003_2.txt";
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_static_003 START');

        try {
          const uri1 = fileUri.getUriFromPath(fileStr1);
          const policyInfo1: fileShare.PolicyInfo = {
            uri: uri1,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          const uri2 = fileUri.getUriFromPath(fileStr2);
          const fd = await fs.open(uri2, fs.OpenMode.CREATE);
          await fs.close(fd);
          const policyInfo2: fileShare.PolicyInfo = {
            uri: uri2,
            operationMode: fileShare.OperationMode.READ_MODE,
          };
          const policies: Array<fileShare.PolicyInfo> = [policyInfo1, policyInfo2];
          await fileShare.deactivatePermission(policies);
          hilog.error(domain, tag, 'Unexpected success: deactivatePermission should have failed');
          expect(false).assertTrue();
          done();
        } catch (err) {
          const error = err as BusinessError;
          hilog.info(domain, tag, 'Expected failure: code = %{public}d, message = %{public}s',
            error.code, error.message);
          if (error.code === 801) {
            expect(error.message === "The device doesn't support this api").assertTrue();
          }

          if (error.code == 13900001) {
            expect(error.message == 'Operation not permitted').assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        }
        hilog.info(domain, tag, '%{public}s', 'FileShare_deactivatePermission_static_003 END');
      });

    /**
     * @tc.name   FileShare_revokePermission_static_001
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_RevokePermission_0100
     * @tc.desc   Test revokePermission() interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FileShare_revokePermission_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        const fileStr1: String = data + "/FileShare_revokePermission_static_001.txt";
        let uriObject = new fileUri.FileUri(fileStr1);
        let uri = uriObject.toString();
        let fd = await fs.open(uri,fs.OpenMode.CREATE);
        await fs.close(fd);
        let policyInfo: fileShare.PolicyInfo = {
          uri: uri, 
          operationMode: fileShare.OperationMode.READ_MODE,
        };
        let policies: Array<fileShare.PolicyInfo> = [policyInfo];
        fileShare.revokePermission(policies).then(() => {
          hilog.info(domain, tag, "FileShare_revokePermission_static_001 successfully");
          done();
        }).catch((err: Error) => {
          hilog.info(domain, tag, "FileShare_revokePermission_static_001 failed with error message: " 
            + err.message + ", error code: " + err.code);
          expect(err.code == 13900001 && err.message == 'Operation not permitted').assertTrue();
          done();
        });
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, '%{public}s', 'FileShare_revokePermission_static_001 has failed for '
         + e.message + ", err code: " + e.code);
        expect(false).assertTrue();
        if(e.code === 801){
          expect(e.message == "The device doesn't support this api").assertTrue();
        }
        done();
      }
    });

    /**
     * @tc.name   FileShare_revokePermission_static_002
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_RevokePermission_0200
     * @tc.desc   Test revokePermission() interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FileShare_revokePermission_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          const fileStr1: String = data + "/FileShare_revokePermission_static_002.txt";
          let uriObject = new fileUri.FileUri(fileStr1);
          let uri = uriObject.toString();
          let fd = await fs.open(uri,fs.OpenMode.CREATE);
          await fs.close(fd);
          let policyInfo: fileShare.PolicyInfo = {
              uri: uri, 
              operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
          };
          let policies: Array<fileShare.PolicyInfo> = [policyInfo];
          fileShare.revokePermission(policies).then(() => {
            hilog.info(domain, tag, "FileShare_revokePermission_static_001 successfully");
            done();
          }).catch((err: Error) => {
            hilog.info(domain, tag, "FileShare_revokePermission_static_001 failed with error message: " 
              + err.message + ", error code: " + err.code);
            expect(err.code == 13900001 && err.message == 'Operation not permitted').assertTrue();
            done();
          });
        } catch (e) {
          e = e as BusinessError;
          hilog.info(domain, tag, '%{public}s', 'FileShare_revokePermission_static_002 has failed for '
           + e.message + ", err code: " + e.code);
          expect(false).assertTrue();
          if(e.code === 801){
            expect(e.message == "The device doesn't support this api").assertTrue();
          }
          done();
        }
    });

    /**
     * @tc.name   FileShare_checkPersistentPermission_static_001
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_CheckPersistentPermission_test_0100
     * @tc.desc   Test checkPersistentPermission() interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FileShare_checkPersistentPermission_static_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        const fileStr1: String = data + "/FileShare_checkPersistentPermission_static_001.txt";
        let uriObject1 = new fileUri.FileUri(fileStr1);
        let uri1 = uriObject1.toString();
        let fd1 = await fs.open(uri1,fs.OpenMode.CREATE);
        await fs.close(fd1);
        let policyInfo1: fileShare.PolicyInfo = {
            uri: uri1, 
            operationMode: fileShare.OperationMode.READ_MODE,
        };
        const fileStr2: String = data + "/FileShare_checkPersistentPermission_static_00101.txt";
        let uriObject2 = new fileUri.FileUri(fileStr2);
        let uri2 = uriObject2.toString();
        let fd2 = await fs.open(uri2,fs.OpenMode.CREATE);
        await fs.close(fd2);
        let policyInfo2: fileShare.PolicyInfo = {
            uri: uri2, 
            operationMode: fileShare.OperationMode.READ_MODE,
        };
        let policies: Array<fileShare.PolicyInfo> = [policyInfo1, policyInfo2];
        let result = fileShare.checkPersistentPermission(policies);
        hilog.info(domain, tag, "FileShare_checkPersistentPermission_static_001 successfully" + result);
        expect(result !== null).assertTrue();
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, 'FileShare_checkPersistentPermission_static_001 has failed for '
         + e.message + ", err code: " + e.code);
        expect(false).assertTrue();
        if(e.code === 801){
          expect(e.message == "The device doesn't support this api").assertTrue();
        }
        done();
      }
    });
    
    /**
     * @tc.name   FileShare_checkPersistentPermission_static_002
     * @tc.number SUB_BASIC_FM_FileAPI_FileShare_CheckPersistentPermission_test_0200
     * @tc.desc   Test checkPersistentPermission() interfaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('FileShare_checkPersistentPermission_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      try {
        const fileStr1: String = data + "/FileShare_checkPersistentPermission_static_002.txt";
        let uriObject1 = new fileUri.FileUri(fileStr1);
        let uri1 = uriObject1.toString();
        let fd1 = await fs.open(uri1,fs.OpenMode.CREATE);
        await fs.close(fd1);
        let policyInfo1: fileShare.PolicyInfo = {
            uri: uri1, 
            operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
        };
        const fileStr2: String = data + "/FileShare_checkPersistentPermission_static_00201.txt";
        let uriObject2 = new fileUri.FileUri(fileStr2);
        let uri2 = uriObject2.toString();
        let fd2 = await fs.open(uri2,fs.OpenMode.CREATE);
        await fs.close(fd2);
        let policyInfo2: fileShare.PolicyInfo = {
            uri: uri2, 
            operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
        };
        let policies: Array<fileShare.PolicyInfo> = [policyInfo1, policyInfo2];
        let result = fileShare.checkPersistentPermission(policies);
        hilog.info(domain, tag, "FileShare_checkPersistentPermission_static_002 successfully" + result);
        expect(result !== null).assertTrue();
        done();
      } catch (e) {
        e = e as BusinessError;
        hilog.info(domain, tag, 'FileShare_checkPersistentPermission_static_002 has failed for '
         + e.message + ", err code: " + e.code);
        expect(false).assertTrue();
        if(e.code === 801){
          expect(e.message == "The device doesn't support this api").assertTrue();
        }
        done();
      }
    });

  })
  hilog.info(domain, tag, '%{public}s', 'FileShare_test end');

}