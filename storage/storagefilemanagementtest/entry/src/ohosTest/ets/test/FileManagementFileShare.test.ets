/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { fileUri } from '@kit.CoreFileKit';
import filemanagement from 'libfilemanagement.so';
import fs from '@ohos.file.fs';

const ERR_OK = 0;
const ERR_PERMISSION_ERROR = 201;
const ERR_DEVICE_NOT_SUPPORTED = 801;

export default function FileManagementFileShare(){
  describe('FileManagementFileShare', async () => {

    beforeAll(async () => {
      let filepath1 = "/data/storage/el2/base/files/test1.txt";
      let filepath2 = "/data/storage/el2/base/files/test2.txt";
      fs.openSync(filepath1,0o100);
      fs.openSync(filepath2,0o100);
      new fileUri.FileUri(filepath1);
      new fileUri.FileUri(filepath2);
    })

    /**
     * @tc.name   FileShareErrCodeErrOk001
     * @tc.number SUB_FILESHARE_ERRCODE_ERR_OK_0100
     * @tc.desc   test ERR_OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareErrCodeErrOk001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareErrCodeErrOk001 start====");
        let result : number = filemanagement.FileShareErrCodeErrOk();
        console.info("====>FileShareErrCodeErrOk001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareErrCodeErrOk001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareErrCodeErrEperm001
     * @tc.number SUB_FILESHARE_ERRCODE_ERR_EPERM_0100
     * @tc.desc   test ERR_EPERM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareErrCodeErrEperm001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareErrCodeErrEperm001 start====");
        let result : number = filemanagement.FileShareErrCodeErrEperm();
        console.info("====>FileShareErrCodeErrEperm001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareErrCodeErrEperm001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareErrCodeErrDeviceNotSupport001
     * @tc.number SUB_FILESHARE_ERRCODE_ERR_DEVICENOTSUPPORTED_0100
     * @tc.desc   test ERR_DEVICE_NOT_SUPPORTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareErrCodeErrDeviceNotSupport001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareErrCodeErrDeviceNotSupport001 start====");
        let result : number = filemanagement.FileShareErrCodeErrDeviceNotSupport();
        console.info("====>FileShareErrCodeErrDeviceNotSupport001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareErrCodeErrDeviceNotSupport001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareErrCodeErrPermissionError001
     * @tc.number SUB_FILESHARE_ERRCODE_ERR_PERMISSIONERROR_0100
     * @tc.desc   test ERR_PERMISSION_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareErrCodeErrPermissionError001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareErrCodeErrPermissionError001 start====");
        let result : number = filemanagement.FileShareErrCodeErrPermissionError();
        console.info("====>FileShareErrCodeErrPermissionError001 result: " + result);
        expect([ERR_OK, ERR_PERMISSION_ERROR, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareErrCodeErrPermissionError001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareErrCodeErrInvalidParameter001
     * @tc.number SUB_FILESHARE_ERRCODE_ERR_INVALIDPARAMETER_0100
     * @tc.desc   test ERR_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareErrCodeErrInvalidParameter001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareErrCodeErrInvalidParameter001 start====");
        let result : number = filemanagement.FileShareErrCodeErrInvalidParameter();
        console.info("====>FileShareErrCodeErrInvalidParameter001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareErrCodeErrInvalidParameter001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePolicyErrorCodePersistenceForbidden001
     * @tc.number SUB_FILESHARE_POLICYERRCODE_PERSISTENCE_FORBIDDEN_0100
     * @tc.desc   test PERSISTENCE_FORBIDDEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePolicyErrorCodePersistenceForbidden001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePolicyErrorCodePersistenceForbidden001 start====");
        let result : number = filemanagement.FileSharePolicyErrorCodePersistenceForbidden();
        console.info("====>FileSharePolicyErrorCodePersistenceForbidden001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePolicyErrorCodePersistenceForbidden001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePolicyErrorCodeInvalidMode001
     * @tc.number SUB_FILESHARE_POLICYERRCODE_INVALID_MODE_0100
     * @tc.desc   test INVALID_MODE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePolicyErrorCodeInvalidMode001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePolicyErrorCodeInvalidMode001 start====");
        let result : number = filemanagement.FileSharePolicyErrorCodeInvalidMode();
        console.info("====>FileSharePolicyErrorCodeInvalidMode001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePolicyErrorCodeInvalidMode001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePolicyErrorCodeInvalidPath001
     * @tc.number SUB_FILESHARE_POLICYERRCODE_INVALID_PATH_0100
     * @tc.desc   test INVALID_PATH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePolicyErrorCodeInvalidPath001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePolicyErrorCodeInvalidPath001 start====");
        let result : number = filemanagement.FileSharePolicyErrorCodeInvalidPath();
        console.info("====>FileSharePolicyErrorCodeInvalidPath001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePolicyErrorCodeInvalidPath001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePolicyErrorCodePermissionNotPersisted001
     * @tc.number SUB_FILESHARE_POLICYERRCODE_PERMISSION_NOT_PERSISTED_0100
     * @tc.desc   test PERMISSION_NOT_PERSISTED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePolicyErrorCodePermissionNotPersisted001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePolicyErrorCodePermissionNotPersisted001 start====");
        let result : number = filemanagement.FileSharePolicyErrorCodePermissionNotPersisted();
        console.info("====>FileSharePolicyErrorCodePermissionNotPersisted001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePolicyErrorCodePermissionNotPersisted001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePolicyErrorResultUri001
     * @tc.number SUB_FILESHARE_POLICYERRORRESULT_URI_0100
     * @tc.desc   test FileShare_PolicyErrorResult.uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePolicyErrorResultUri001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePolicyErrorResultUri001 start====");
        let result : number = filemanagement.FileSharePolicyErrorResultUri();
        console.info("====>FileSharePolicyErrorResultUri001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePolicyErrorResultUri001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePolicyErrorResultCode001
     * @tc.number SUB_FILESHARE_POLICYERRORRESULT_CODE_0100
     * @tc.desc   test FileShare_PolicyErrorResult.code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePolicyErrorResultCode001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePolicyErrorResultCode001 start====");
        let result : number = filemanagement.FileSharePolicyErrorResultCode();
        console.info("====>FileSharePolicyErrorResultCode001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePolicyErrorResultCode001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePolicyErrorResultMessage001
     * @tc.number SUB_FILESHARE_POLICYERRORRESULT_MESSAGE_0100
     * @tc.desc   test FileShare_PolicyErrorResult.message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePolicyErrorResultMessage001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePolicyErrorResultMessage001 start====");
        let result : number = filemanagement.FileSharePolicyErrorResultMessage();
        console.info("====>FileSharePolicyErrorResultMessage001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePolicyErrorResultMessage001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePersistPermission001
     * @tc.number SUB_FILESHARE_PERSISTPERMISSION_0100
     * @tc.desc   test OH_FileShare_PersistPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePersistPermission001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePersistPermission001 start====");
        let result : number = filemanagement.FileShareErrCodeErrOk();
        console.info("====>FileSharePersistPermission001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePersistPermission001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePersistPermission002
     * @tc.number SUB_FILESHARE_PERSISTPERMISSION_0200
     * @tc.desc   test OH_FileShare_PersistPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePersistPermission002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePersistPermission002 start====");
        let result : number = filemanagement.FileShareErrCodeErrPermissionError();
        console.info("====>FileSharePersistPermission002 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePersistPermission002 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePersistPermission003
     * @tc.number SUB_FILESHARE_PERSISTPERMISSION_0300
     * @tc.desc   test OH_FileShare_PersistPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePersistPermission003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePersistPermission003 start====");
        let result : number = filemanagement.FileShareErrCodeErrInvalidParameter();
        console.info("====>FileSharePersistPermission003 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePersistPermission003 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePersistPermission004
     * @tc.number SUB_FILESHARE_PERSISTPERMISSION_0400
     * @tc.desc   test OH_FileShare_PersistPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePersistPermission004', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePersistPermission004 start====");
        let result : number = filemanagement.FileShareErrCodeErrDeviceNotSupport();
        console.info("====>FileSharePersistPermission004 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePersistPermission004 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileSharePersistPermission005
     * @tc.number SUB_FILESHARE_PERSISTPERMISSION_0500
     * @tc.desc   test OH_FileShare_PersistPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileSharePersistPermission005', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileSharePersistPermission005 start====");
        let result : number = filemanagement.FileShareErrCodeErrEperm();
        console.info("====>FileSharePersistPermission005 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileSharePersistPermission005 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareRevokePermission001
     * @tc.number SUB_FILESHARE_REVOKEPERMISSION_0100
     * @tc.desc   test OH_FileShare_RevokePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareRevokePermission001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareRevokePermission001 start====");
        let result : number = filemanagement.FileShareRevokePermission("ERR_OK");
        console.info("====>FileShareRevokePermission001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareRevokePermission001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareRevokePermission002
     * @tc.number SUB_FILESHARE_REVOKEPERMISSION_0200
     * @tc.desc   test OH_FileShare_RevokePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareRevokePermission002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareRevokePermission002 start====");
        let result : number = filemanagement.FileShareRevokePermission("ERR_PERMISSION_ERROR");
        console.info("====>FileShareRevokePermission002 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareRevokePermission002 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareRevokePermission003
     * @tc.number SUB_FILESHARE_REVOKEPERMISSION_0300
     * @tc.desc   test OH_FileShare_RevokePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareRevokePermission003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareRevokePermission003 start====");
        let result : number = filemanagement.FileShareRevokePermission("ERR_DEVICE_NOT_SUPPORTED");
        console.info("====>FileShareRevokePermission003 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareRevokePermission003 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareRevokePermission004
     * @tc.number SUB_FILESHARE_REVOKEPERMISSION_0400
     * @tc.desc   test OH_FileShare_RevokePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareRevokePermission004', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareRevokePermission004 start====");
        let result : number = filemanagement.FileShareRevokePermissionErrInvalidParameter();
        console.info("====>FileShareRevokePermission004 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareRevokePermission004 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareRevokePermission005
     * @tc.number SUB_FILESHARE_REVOKEPERMISSION_0500
     * @tc.desc   test OH_FileShare_RevokePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareRevokePermission005', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareRevokePermission005 start====");
        let result : number = filemanagement.FileShareRevokePermissionErrEperm();
        console.info("====>FileShareRevokePermission005 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareRevokePermission005 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareActivatePermission001
     * @tc.number SUB_FILESHARE_ACTIVATEPERMISSION_0100
     * @tc.desc   test OH_FileShare_ActivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareActivatePermission001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareActivatePermission001 start====");
        let result : number = filemanagement.FileShareActivatePermission("ERR_OK");
        console.info("====>FileShareActivatePermission001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareActivatePermission001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareActivatePermission002
     * @tc.number SUB_FILESHARE_ACTIVATEPERMISSION_0200
     * @tc.desc   test OH_FileShare_ActivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareActivatePermission002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareActivatePermission002 start====");
        let result : number = filemanagement.FileShareActivatePermission("ERR_PERMISSION_ERROR");
        console.info("====>FileShareActivatePermission002 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareActivatePermission002 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareActivatePermission003
     * @tc.number SUB_FILESHARE_ACTIVATEPERMISSION_0300
     * @tc.desc   test OH_FileShare_ActivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareActivatePermission003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareActivatePermission003 start====");
        let result : number = filemanagement.FileShareActivatePermission("ERR_DEVICE_NOT_SUPPORTED");
        console.info("====>FileShareActivatePermission003 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareActivatePermission003 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareActivatePermission004
     * @tc.number SUB_FILESHARE_ACTIVATEPERMISSION_0400
     * @tc.desc   test OH_FileShare_ActivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareActivatePermission004', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareActivatePermission004 start====");
        let result : number = filemanagement.FileShareActivatePermissionErrInvalidParameter();
        console.info("====>FileShareActivatePermission004 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareActivatePermission004 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareActivatePermission005
     * @tc.number SUB_FILESHARE_ACTIVATEPERMISSION_0500
     * @tc.desc   test OH_FileShare_ActivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareActivatePermission005', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareActivatePermission005 start====");
        let result : number = filemanagement.FileShareActivatePermissionErrEperm();
        console.info("====>FileShareActivatePermission005 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareActivatePermission005 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareDeactivatePermission001
     * @tc.number SUB_FILESHARE_DEACTIVATEPERMISSION_0100
     * @tc.desc   test OH_FileShare_DeactivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareDeactivatePermission001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareDeactivatePermission001 start====");
        let result : number = filemanagement.FileShareDeactivatePermission("ERR_OK");
        console.info("====>FileShareDeactivatePermission001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareDeactivatePermission001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareDeactivatePermission002
     * @tc.number SUB_FILESHARE_DEACTIVATEPERMISSION_0200
     * @tc.desc   test OH_FileShare_DeactivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareDeactivatePermission002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareDeactivatePermission002 start====");
        let result : number = filemanagement.FileShareDeactivatePermission("ERR_PERMISSION_ERROR");
        console.info("====>FileShareDeactivatePermission002 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareDeactivatePermission002 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareDeactivatePermission003
     * @tc.number SUB_FILESHARE_DEACTIVATEPERMISSION_0300
     * @tc.desc   test OH_FileShare_DeactivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareDeactivatePermission003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareDeactivatePermission003 start====");
        let result : number = filemanagement.FileShareDeactivatePermission("ERR_DEVICE_NOT_SUPPORTED");
        console.info("====>FileShareDeactivatePermission003 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareDeactivatePermission003 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareDeactivatePermission004
     * @tc.number SUB_FILESHARE_DEACTIVATEPERMISSION_0400
     * @tc.desc   test OH_FileShare_DeactivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareDeactivatePermission004', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareDeactivatePermission004 start====");
        let result : number = filemanagement.FileShareDeactivatePermissionErrInvalidParameter();
        console.info("====>FileShareDeactivatePermission004 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareDeactivatePermission004 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareDeactivatePermission005
     * @tc.number SUB_FILESHARE_DEACTIVATEPERMISSION_0500
     * @tc.desc   test OH_FileShare_DeactivatePermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareDeactivatePermission005', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareDeactivatePermission005 start====");
        let result : number = filemanagement.FileShareDeactivatePermissionErrEperm();
        console.info("====>FileShareDeactivatePermission005 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareDeactivatePermission005 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareCheckPersistentPermission001
     * @tc.number SUB_FILESHARE_CHECKPERSISTENTPERMISSSION_0100
     * @tc.desc   test OH_FileShare_CheckPersistentPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareCheckPersistentPermission001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareCheckPersistentPermission001 start====");
        let result : number = filemanagement.FileShareCheckPersistentPermission("ERR_OK");
        console.info("====>FileShareCheckPersistentPermission001 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareCheckPersistentPermission001 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareCheckPersistentPermission002
     * @tc.number SUB_FILESHARE_CHECKPERSISTENTPERMISSSION_0200
     * @tc.desc   test OH_FileShare_CheckPersistentPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareCheckPersistentPermission002', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareCheckPersistentPermission002 start====");
        let result : number = filemanagement.FileShareCheckPersistentPermission("ERR_PERMISSION_ERROR");
        console.info("====>FileShareCheckPersistentPermission002 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareCheckPersistentPermission002 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareCheckPersistentPermission003
     * @tc.number SUB_FILESHARE_CHECKPERSISTENTPERMISSSION_0300
     * @tc.desc   test OH_FileShare_CheckPersistentPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareCheckPersistentPermission003', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareCheckPersistentPermission003 start====");
        let result : number = filemanagement.FileShareCheckPersistentPermission("ERR_DEVICE_NOT_SUPPORTED");
        console.info("====>FileShareCheckPersistentPermission003 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareCheckPersistentPermission003 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareCheckPersistentPermission004
     * @tc.number SUB_FILESHARE_CHECKPERSISTENTPERMISSSION_0400
     * @tc.desc   test OH_FileShare_CheckPersistentPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareCheckPersistentPermission004', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareCheckPersistentPermission004 start====");
        let result : number = filemanagement.FileShareCheckPersistentPermissionErrInvalidParameter();
        console.info("====>FileShareCheckPersistentPermission004 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareCheckPersistentPermission004 catch err: " + err);
      }
    });

    /**
     * @tc.name   FileShareCheckPersistentPermission005
     * @tc.number SUB_FILESHARE_CHECKPERSISTENTPERMISSSION_0500
     * @tc.desc   test OH_FileShare_CheckPersistentPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('FileShareCheckPersistentPermission005', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>FileShareCheckPersistentPermission005 start====");
        let result : number = filemanagement.FileShareCheckPersistentPermissionErrEperm();
        console.info("====>FileShareCheckPersistentPermission005 result: " + result);
        expect([ERR_OK, ERR_DEVICE_NOT_SUPPORTED]).assertContain(result);
        done()
      } catch (err) {
        console.error("====>FileShareCheckPersistentPermission005 catch err: " + err);
      }
    });
  });
}
