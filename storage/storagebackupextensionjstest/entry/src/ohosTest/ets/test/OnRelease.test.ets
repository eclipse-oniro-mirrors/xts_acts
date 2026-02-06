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
import BackupExtensionContext from '@ohos.file.BackupExtensionContext';
import BackupExtensionAbility, { BundleVersion } from '@ohos.application.BackupExtensionAbility';
import contextConstant from '@ohos.app.ability.contextConstant';
import fileIo from '@ohos.fileio';

interface ProgressInfo {
  progressed: number,
  total: number
}

const SCENARIO_BACKUP: number = 1;
const SCENARIO_RESTORE: number = 2;
let filePath: string = '/data/storage/el2/base/.temp/';

export class MyBackupExtAbility extends BackupExtensionAbility {
   async onBackup() {
      console.log("onBackup begin");
      this.context.area = contextConstant.AreaMode.EL1;
      let dir = this.context.backupDir;
      console.log(`onBackup el1 dir: ${dir}`);
      this.context.area = contextConstant.AreaMode.EL2;
      dir = this.context.backupDir;
      console.log(`onBackup el2 dir: ${dir}`);
      console.log("onBackup end");
   }

   async onRestore() {
      console.log("onRestore begin");
      this.context.area = contextConstant.AreaMode.EL1;
      let dir = this.context.backupDir;
      console.log(`onRestore el1 dir: ${dir}`);
      this.context.area = contextConstant.AreaMode.EL2;
      dir = this.context.backupDir;
      console.log(`onRestore el2 dir: ${dir}`);
      console.log("onRestore end");
   }

   async onBackupEx() {
    console.log(`onBackupEx ok`);
    let info = "app diy info";
    return info;
  }

  async onRestoreEx() {
    let info = "app diy info";
    return info;
  }

  onProcess(): string {
    console.log(`onProcess begin`);
    let processInfo: ProgressInfo = {
      progressed: 100,
      total: 1000, 
    }
    console.log(`onProcess end`);
    return JSON.stringify(processInfo);
  }

  async onRelease(scenario: number): Promise<void> {
    try {
      if (scenario == SCENARIO_BACKUP) {
        console.info(`onRelease begin`);
        await fileIo.rmdir(filePath);
        console.info(`onRelease end, rmdir succeed`);
      }
      if (scenario == SCENARIO_RESTORE) {
        console.info(`onRelease begin`);
        await fileIo.rmdir(filePath);
        console.info(`onRelease end, rmdir succeed`);
      }
    } catch (error) {
      console.error(`onRelease failed with error. Code: ${error.code}, message: ${error.message}`);
    }
  }
}

export default function onreleaseTest(){
describe('onRelease_js_test',async () => {

   /**
    * @tc.name   test_Backup_onRelease_001
    * @tc.number SUB_BASIC_FM_FileAPI_onRelease_0100
    * @tc.desc   Test onRelease() interfaces
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("test_Backup_onRelease_001", Level.LEVEL1, () => {
      try {
         let backupext = new MyBackupExtAbility();
         backupext.onRelease(1);
         console.log('backup-onRelease run ok');
         expect(true).assertTrue();
      } catch (error) {
         console.info(`test_Backup_onRelease_001 error: ${JSON.stringify(error)}`);
         expect(false).assertTrue();
      }
   });

   /**
    * @tc.name   test_Backup_onRelease_002
    * @tc.number SUB_BASIC_FM_FileAPI_onRelease_0200
    * @tc.desc   Test onRelease() interfaces
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("test_Backup_onRelease_002", Level.LEVEL1, () => {
      try {
         let backupext = new MyBackupExtAbility();
         backupext.onRelease(2);
         console.log('restore-onRelease run ok');
         expect(true).assertTrue();
      } catch (error) {
         console.info(`test_Backup_onRelease_002 error: ${JSON.stringify(error)}`);
         expect(false).assertTrue();
      }
   });

   /**
    * @tc.name   test_Backup_onRelease_003
    * @tc.number SUB_BASIC_FM_FileAPI_onRelease_0300
    * @tc.desc   Test onRelease() interfaces
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
   it("test_Backup_onRelease_003", Level.LEVEL1, () => {
      try {
         let backupext = new MyBackupExtAbility();
         let ret = backupext.onRelease(20);
         console.log('test_Backup_onRelease_003 restore-onRelease run ok');
         expect(ret !== null).assertTrue();
      } catch (error) {
         console.info(`test_Backup_onRelease_003 error: ${JSON.stringify(error)}`);
         expect(false).assertTrue();
      }
   });
});
}