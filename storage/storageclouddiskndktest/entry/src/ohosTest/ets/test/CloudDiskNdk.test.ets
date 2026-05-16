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

import { describe, it, expect, Level } from '@ohos/hypium';
import clouddisk from 'libclouddisk.so';
import { fileUri } from '@kit.CoreFileKit';
import { common, UIAbility } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';

const CloudDisk_ErrorCode = new Map<string, number>([
  ['CLOUD_DISK_OK', 0],
  ['CLOUD_DISK_NOT_SUPPORTED', 801],
  ['CLOUD_DISK_INVALID_ARG', 34400001],
  ['CLOUD_DISK_SYNC_FOLDER_PATH_UNAUTHORIZED', 34400002],
  ['CLOUD_DISK_SYNC_FOLDER_NOT_REGISTERED', 34400008],
  ['CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST', 34400010]
]);

export default function CloudDiskNdkTest(){
  describe('CloudDiskNdkTest',async () => {

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolder_0100
     * @tc.name CloudDisk_RegisterSyncFolder_001
     * @tc.desc Test RegisterSyncFolder() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_RegisterSyncFolder_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_RegisterSyncFolder_001: " + filepath);
      let ret = clouddisk.RegisterSyncFolder(filepath);
      console.info("CloudDisk_RegisterSyncFolder_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400002);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolder_0200
     * @tc.name CloudDisk_RegisterSyncFolder_002
     * @tc.desc Test RegisterSyncFolder() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_RegisterSyncFolder_002', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/appdata/";
      console.info("CloudDisk_RegisterSyncFolder_002: " + filepath);
      let ret = clouddisk.RegisterSyncFolder(filepath);
      console.info("CloudDisk_RegisterSyncFolder_002 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == CloudDisk_ErrorCode.get('CLOUD_DISK_NOT_SUPPORTED')) {
        expect(ret).assertEqual(CloudDisk_ErrorCode.get('CLOUD_DISK_NOT_SUPPORTED'));
        done();
      } else {
        expect(ret).assertEqual(CloudDisk_ErrorCode.get('CLOUD_DISK_INVALID_ARG'));
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolder_0300
     * @tc.name CloudDisk_RegisterSyncFolder_003
     * @tc.desc Test RegisterSyncFolder() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
     it('CloudDisk_RegisterSyncFolder_003', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/test003";
      console.info("CloudDisk_RegisterSyncFolder_003: " + filepath);
      let ret = clouddisk.RegisterSyncFolder(filepath);
      console.info("CloudDisk_RegisterSyncFolder_003 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == CloudDisk_ErrorCode.get('CLOUD_DISK_NOT_SUPPORTED')) {
        expect(ret).assertEqual(CloudDisk_ErrorCode.get('CLOUD_DISK_NOT_SUPPORTED'));
        done();
      } else {
        expect(ret).assertEqual(CloudDisk_ErrorCode.get('CLOUD_DISK_SYNC_FOLDER_PATH_NOT_EXIST'));
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolder_0400
     * @tc.name CloudDisk_RegisterSyncFolder_004
     * @tc.desc Test RegisterSyncFolder() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_RegisterSyncFolder_004', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_RegisterSyncFolder_004: " + filepath);
      let ret = clouddisk.RegisterSyncFolder(filepath);
      console.info("CloudDisk_RegisterSyncFolder_004 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == CloudDisk_ErrorCode.get('CLOUD_DISK_NOT_SUPPORTED')) {
        expect(ret).assertEqual(CloudDisk_ErrorCode.get('CLOUD_DISK_NOT_SUPPORTED'));
        done();
      } else {
        expect(ret).assertEqual(CloudDisk_ErrorCode.get('CLOUD_DISK_SYNC_FOLDER_PATH_UNAUTHORIZED'));
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnregisterSyncFolder_0100
     * @tc.name CloudDisk_UnregisterSyncFolder_001
     * @tc.desc Test UnregisterSyncFolder() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_UnregisterSyncFolder_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_UnregisterSyncFolder_001: " + filepath);
      let ret = clouddisk.UnregisterSyncFolder(filepath);
      console.info("CloudDisk_UnregisterSyncFolder_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(0);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_ActiveSyncFolder_0100
     * @tc.name CloudDisk_ActiveSyncFolder_001
     * @tc.desc Test ActiveSyncFolder() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_ActiveSyncFolder_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_ActiveSyncFolder_001: " + filepath);
      let ret = clouddisk.ActiveSyncFolder(filepath);
      console.info("CloudDisk_ActiveSyncFolder_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400008);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_DeactiveSyncFolder_0100
     * @tc.name CloudDisk_DeactiveSyncFolder_001
     * @tc.desc Test DeactiveSyncFolder() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_DeactiveSyncFolder_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_DeactiveSyncFolder_001: " + filepath);
      let ret = clouddisk.DeactiveSyncFolder(filepath);
      console.info("CloudDisk_DeactiveSyncFolder_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400008);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetSyncFolders_0100
     * @tc.name CloudDisk_GetSyncFolders_001
     * @tc.desc Test GetSyncFolders() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_GetSyncFolders_001', Level.LEVEL0, async (done: Function) => {
      let ret = clouddisk.GetSyncFolders();
      console.info("CloudDisk_GetSyncFolders_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(0);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdateCustomAlias_0100
     * @tc.name CloudDisk_UpdateCustomAlias_001
     * @tc.desc Test UpdateCustomAlias() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_UpdateCustomAlias_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_UpdateCustomAlias_001: " + filepath);
      let ret = clouddisk.UpdateCustomAlias(filepath);
      console.info("CloudDisk_UpdateCustomAlias_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400008);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolderChanges_0100
     * @tc.name CloudDisk_RegisterSyncFolderChanges_001
     * @tc.desc Test RegisterSyncFolderChanges() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_RegisterSyncFolderChanges_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_RegisterSyncFolderChanges_001: " + filepath);
      let ret = clouddisk.ReFolderChanges(filepath);
      console.info("CloudDisk_RegisterSyncFolderChanges_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400008);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnregisterSyncFolderChanges_0100
     * @tc.name CloudDisk_UnregisterSyncFolderChanges_001
     * @tc.desc Test UnregisterSyncFolderChanges() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_UnregisterSyncFolderChanges_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_UnregisterSyncFolderChanges_001: " + filepath);
      let ret = clouddisk.UnReFolderChanges(filepath);
      console.info("CloudDisk_UnregisterSyncFolderChanges_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400008);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetSyncFolderChanges_0100
     * @tc.name CloudDisk_GetSyncFolderChanges_001
     * @tc.desc Test GetSyncFolderChanges() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_GetSyncFolderChanges_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_GetSyncFolderChanges_001: " + filepath);
      let ret = clouddisk.GetSyncFolderChanges(filepath);
      console.info("CloudDisk_GetSyncFolderChanges_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400008);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SetFileSyncStates_0100
     * @tc.name CloudDisk_SetFileSyncStates_001
     * @tc.desc Test SetFileSyncStates() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_SetFileSyncStates_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_SetFileSyncStates_001: " + filepath);
      let ret = clouddisk.SetFileSyncStates(filepath);
      console.info("CloudDisk_SetFileSyncStates_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400008);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetFileSyncStates_0100
     * @tc.name CloudDisk_GetFileSyncStates_001
     * @tc.desc Test GetFileSyncStates() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_GetFileSyncStates_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/storage/Users/currentUser/Documents/";
      console.info("CloudDisk_GetFileSyncStates_001: " + filepath);
      let ret = clouddisk.GetFileSyncStates(filepath);
      console.info("CloudDisk_GetFileSyncStates_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(ret).assertEqual(801);
        done();
      } else {
        expect(ret).assertEqual(34400008);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_ErrorCode_0100
     * @tc.name CloudDisk_ErrorCode_ENUM_001
     * @tc.desc Test ErrorCode_ENUM() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_ErrorCode_ENUM_001', Level.LEVEL0, async () => {
      try {
        let ret = clouddisk.Tset_CloudDisk_ErrorCode_ENUM();
        console.info("CloudDisk_ErrorCode_ENUM_001 Test NAPI ret= " + JSON.stringify(ret));
        expect(ret).assertEqual(1);
      } catch (e) {
        console.log('CloudDisk_ErrorCode_ENUM_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_OperationType_0100
     * @tc.name CloudDisk_OperationType_ENUM_001
     * @tc.desc Test OperationType_ENUM() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_OperationType_ENUM_001', Level.LEVEL0, async () => {
      try {
        let ret = clouddisk.Tset_CloudDisk_OperationType_ENUM();
        console.info("CloudDisk_OperationType_ENUM_001 Test NAPI ret= " + JSON.stringify(ret));
        expect(ret).assertEqual(1);
      } catch (e) {
        console.log('CloudDisk_OperationType_ENUM_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_ErrorReason_0100
     * @tc.name CloudDisk_ErrorReason_ENUM_001
     * @tc.desc Test ErrorReason_ENUM() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('CloudDisk_ErrorReason_ENUM_001', Level.LEVEL0, async () => {
      try {
        let ret = clouddisk.Tset_CloudDisk_ErrorReason_ENUM();
        console.info("CloudDisk_ErrorReason_ENUM_001 Test NAPI ret= " + JSON.stringify(ret));
        expect(ret).assertEqual(1);
      } catch (e) {
        console.log('CloudDisk_ErrorReason_ENUM_001 has failed for ' + e.message + ', code: ' + e.code);
        expect(false).assertTrue();
      }
    });
  });
}