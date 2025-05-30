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

import { describe, it, expect, Level } from '@ohos/hypium';
import fileshare from 'libfileshare.so';
import { fileUri } from '@kit.CoreFileKit';
import { common, UIAbility } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';

export default function permissionNdkTest(){
  describe('permissionNdktest',async () => {

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Fileshare_0100
     * @tc.name FileShare_PersistPermission_001
     * @tc.desc Test persistPermission() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_PersistPermission_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/data/storage/el2/base/files/test1.txt";
      console.info("FileShare_PersistPermission_001: " + filepath);
      fs.openSync(filepath,0o102);
      new fileUri.FileUri(filepath);
      let ret = fileshare.FileShare_001();
      console.info("FileShare_PersistPermission_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(ret).assertEqual(0);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Fileshare_0200
     * @tc.name FileShare_PersistPermission_002
     * @tc.desc Test persistPermission() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_PersistPermission_002', Level.LEVEL0, async (done: Function) => {
      let filepath = "/data/storage/el2/base/files/test2.txt";
      fs.openSync(filepath,0o102);
      new fileUri.FileUri(filepath);
      let filepath1 = "/data/storage/el2/base/files/test201.txt";
      fs.openSync(filepath1,0o102);
      new fileUri.FileUri(filepath);
      let ret = fileshare.FileShare_002();
      console.info("FileShare_PersistPermission_002 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(ret).assertEqual(0);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Fileshare_0300
     * @tc.name FileShare_ActivatePermission_001
     * @tc.desc Test activatePermission() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_ActivatePermission_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/data/storage/el2/base/files/test3.txt";
      fs.openSync(filepath,0o102);
      new fileUri.FileUri(filepath);
      let ret = fileshare.FileShare_003();
      console.info("FileShare_ActivatePermission_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(ret).assertEqual(0);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Fileshare_0400
     * @tc.name FileShare_DeactivatePermission_001
     * @tc.desc Test deactivatePermission() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_DeactivatePermission_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/data/storage/el2/base/files/test4.txt";
      fs.openSync(filepath,0o102);
      new fileUri.FileUri(filepath);
      let ret = fileshare.FileShare_004();
      console.info("FileShare_DeactivatePermission_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(ret).assertEqual(0);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Fileshare_0500
     * @tc.name FileShare_RevokePermission_001
     * @tc.desc Test revokePermission() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_RevokePermission_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/data/storage/el2/base/files/test5.txt";
      fs.openSync(filepath,0o102);
      new fileUri.FileUri(filepath);
      let ret = fileshare.FileShare_005();
      console.info("FileShare_RevokePermission_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(ret).assertEqual(0);
        done();
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_FileAPI_Fileshare_0600
     * @tc.name FileShare_CheckPersistentPermission_001
     * @tc.desc Test checkPersistentPermission() interfaces
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('FileShare_CheckPersistentPermission_001', Level.LEVEL0, async (done: Function) => {
      let filepath = "/data/storage/el2/base/files/test6.txt";
      fs.openSync(filepath,0o102);
      new fileUri.FileUri(filepath);
      let ret = fileshare.FileShare_006();
      console.info("FileShare_CheckPersistentPermission_001 Test NAPI ret= " + JSON.stringify(ret));
      if (ret == 801) {
        expect(true).assertTrue();
        done();
      } else {
        expect(ret).assertEqual(0);
        done();
      }
      done();
    });
  });
}