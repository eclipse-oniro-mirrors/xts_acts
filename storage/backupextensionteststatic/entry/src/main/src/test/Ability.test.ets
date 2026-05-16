/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import BackupExtensionAbility from '@ohos.application.BackupExtensionAbility';
import { BundleVersion } from '@ohos.application.BackupExtensionAbility';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import BackupExtensionContext from '@ohos.file.BackupExtensionContext';
import contextConstant from '@ohos.app.ability.contextConstant';

let id: int = 1;
let domain: int = 0x0000;
let tag: string = 'testTag';
interface ErrorInfo {
    type: string,
    errorCode: number,
    errorInfo: string
  }

interface ProgressInfo {
  progressed: number,
  total: number
}


export class BackupExt extends BackupExtensionAbility {
    onRestore(ver: BundleVersion) {
        hilog.info(domain, tag, '%{public}s', 'do restore ' + JSON.stringify(ver));
    }

    onBackup() {
        hilog.info(domain, tag, '%{public}s', 'do backup.');
    }

    async backupDir() {
      hilog.info(domain, tag, '%{public}s', "onBackup begin");
      this.context.area = contextConstant.AreaMode.EL1;
      let dir = this.context.backupDir;
      hilog.info(domain, tag, '%{public}s', `onBackup el1 dir: ${dir}`);
      this.context.area = contextConstant.AreaMode.EL2;
      dir = this.context.backupDir;
      hilog.info(domain, tag, '%{public}s', `onBackup el2 dir: ${dir}`);
      hilog.info(domain, tag, '%{public}s', "onBackup end");
   }

    onBackupEx(backupInfo: string): string {
        try {
          if (backupInfo == "") {
            console.info("backupInfo is empty");
          }
          console.info(`onBackupEx ok`);
          let errorInfo: ErrorInfo = {
            type: "ErrorInfo",
            errorCode: 0,
            errorInfo: "app customized error info"
          }
          return JSON.stringify(errorInfo);
        } catch (err) {
          console.error(`BackupExt error. Code:${err.code}, message:${err.message}`);
        }
        return "";
      }
  
      async onBackupExAsync(backupInfo: string): Promise<string> {
        try {
          if (backupInfo == "") {
            console.info("backupInfo is empty");
          }
          console.info(`onBackupEx ok`);
          let errorInfo: ErrorInfo = {
            type: "ErrorInfo",
            errorCode: 0,
            errorInfo: "app customized error info"
          }
          return JSON.stringify(errorInfo);
        } catch (err) {
          console.error(`BackupExt error. Code:${err.code}, message:${err.message}`);
        }
        return "";
      }
  
      async onRelease(scenario: number): Promise<void> {
        try {
          hilog.info(domain, tag, '%{public}s', 'onRelease scenario: ' + scenario);
        } catch (error) {
          hilog.error(domain, tag, '%{public}s', 'onRelease error: ' + JSON.stringify(error));
        }
      }

      onProcess(): string {
        hilog.info(domain, tag, '%{public}s', `onProcess begin`);
        let processInfo: ProgressInfo = {
        progressed: 100,
        total: 1000, 
        }
        hilog.info(domain, tag, '%{public}s', `onProcess end`);
        return JSON.stringify(processInfo);
      }
};

export default function abilityTest() {
    let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    describe("backupExtension", (): void => {
        hilog.info(domain, tag, '%{public}s', 'backupExtension start');
        /**
         * @tc.name   backup_extension_test_call_static_000
         * @tc.number SUB_BACKUP_EXTENSION_CALL_0000
         * @tc.desc   select with option
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("backup_extension_test_call_static_000", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
            try {
                hilog.info(domain, tag, '%{public}s', 'backup-extension run start');
                let backupExt = new BackupExt()
                backupExt.onBackup()
                let ver: BundleVersion = {
                    code: 1,
                    name: '1.0.0.0',
                }
                backupExt.onRestore(ver)
                hilog.info(domain, tag, '%{public}s', 'backup-extension run ok');
                expect(true).assertTrue()
                done()
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'backupextension error:'+ JSON.stringify(error));
                expect(false).assertTrue()
                done()
            }
        })

        /**
 	          * @tc.name   test_Backup_onBackupEx_empty_string_001
 	          * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0100
 	          * @tc.desc   Test onBackupEx() with empty string
 	          * @tc.type   FUNCTION
 	          * @tc.size   MEDIUMTEST
 	          * @tc.level  LEVEL2
 	          */
        it("test_Backup_onBackupEx_empty_string_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let result = backupExt.onBackupEx("");
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_empty_string_001 run ok');
                expect(result !== null).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_empty_string_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onBackupEx_valid_string_001
         * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0200
         * @tc.desc   Test onBackupEx() with valid string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onBackupEx_valid_string_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let result = backupExt.onBackupEx("valid_backup_info");
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_valid_string_001 run ok');
                expect(result !== null).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_valid_string_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });


        /**
         * @tc.name   test_Backup_onBackupEx_long_string_001
         * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0400
         * @tc.desc   Test onBackupEx() with long string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onBackupEx_long_string_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let longString = "a".repeat(1000);
                let result = backupExt.onBackupEx(longString);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_long_string_001 run ok');
                expect(result !== null).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_long_string_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onBackupEx_special_string_001
         * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0500
         * @tc.desc   Test onBackupEx() with special characters string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onBackupEx_special_string_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let specialString = "!@#$%^&*()_+-=[]{}|;:',.<>?/~`";
                let result = backupExt.onBackupEx(specialString);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_special_string_001 run ok');
                expect(result !== null).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_special_string_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onBackupEx_unicode_string_001
         * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0600
         * @tc.desc   Test onBackupEx() with unicode string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onBackupEx_unicode_string_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let unicodeString = "测试中文🎉🎊";
                let result = backupExt.onBackupEx(unicodeString);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_unicode_string_001 run ok');
                expect(result !== null).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupEx_unicode_string_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onBackupExAsync_empty_string_001
         * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0700
         * @tc.desc   Test onBackupEx() async with empty string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onBackupExAsync_empty_string_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let backupExt = new BackupExt();
                let result = await backupExt.onBackupExAsync("");
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupExAsync_empty_string_001 run ok');
                expect(result !== null).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupExAsync_empty_string_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onBackupExAsync_valid_string_001
         * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0800
         * @tc.desc   Test onBackupEx() async with valid string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onBackupExAsync_valid_string_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let backupExt = new BackupExt();
                let result = await backupExt.onBackupExAsync("valid_backup_info");
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupExAsync_valid_string_001 run ok');
                expect(result !== null).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onBackupExAsync_valid_string_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });


        /**
         * @tc.name   test_Backup_onRestore_code_zero_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRestore_0200
         * @tc.desc   Test onRestore() with BundleVersion.code as 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRestore_code_zero_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let bundleVersion: BundleVersion = {
                    code: 0,
                    name: "valid_name"
                };
                backupExt.onRestore(bundleVersion);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_code_zero_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_code_zero_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRestore_code_positive_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRestore_0300
         * @tc.desc   Test onRestore() with BundleVersion.code as positive number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRestore_code_positive_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let bundleVersion: BundleVersion = {
                    code: 100,
                    name: "valid_name"
                };
                backupExt.onRestore(bundleVersion);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_code_positive_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_code_positive_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRestore_code_negative_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRestore_0400
         * @tc.desc   Test onRestore() with BundleVersion.code as negative number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRestore_code_negative_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let bundleVersion: BundleVersion = {
                    code: -1,
                    name: "valid_name"
                };
                backupExt.onRestore(bundleVersion);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_code_negative_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_code_negative_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRestore_name_valid_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRestore_0500
         * @tc.desc   Test onRestore() with valid BundleVersion.name
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRestore_name_valid_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let bundleVersion: BundleVersion = {
                    code: 1,
                    name: "1.0.0.0"
                };
                backupExt.onRestore(bundleVersion);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_name_valid_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_name_valid_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRestore_name_special_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRestore_0600
         * @tc.desc   Test onRestore() with special characters in BundleVersion.name
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRestore_name_special_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let bundleVersion: BundleVersion = {
                    code: 1,
                    name: "1.0.0-beta"
                };
                backupExt.onRestore(bundleVersion);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_name_special_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_name_special_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRestore_name_unicode_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRestore_0700
         * @tc.desc   Test onRestore() with unicode characters in BundleVersion.name
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRestore_name_unicode_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let bundleVersion: BundleVersion = {
                    code: 1,
                    name: "测试版本1.0"
                };
                backupExt.onRestore(bundleVersion);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_name_unicode_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_name_unicode_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRestore_name_long_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRestore_0800
         * @tc.desc   Test onRestore() with long string in BundleVersion.name
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRestore_name_long_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let longName = "v" + ".".repeat(100);
                let bundleVersion: BundleVersion = {
                    code: 1,
                    name: longName
                };
                backupExt.onRestore(bundleVersion);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_name_long_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestore_name_long_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRestoreEx_name_empty_string_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRestoreEx_1000
         * @tc.desc   Test onRestoreEx() with BundleVersion.name as empty string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRestoreEx_name_empty_string_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, (done: () => void): void => {
            try {
                let backupExt = new BackupExt();
                let bundleVersion: BundleVersion = {
                    code: 1,
                    name: ""
                };
                let restoreInfo: string = "valid_info";
                let result = backupExt.onRestoreEx(bundleVersion, restoreInfo);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestoreEx_name_empty_string_001 run ok');
                expect(result !== null).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRestoreEx_name_empty_string_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRelease_scenario_backup_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRelease_0100
         * @tc.desc   Test onRelease() with scenario as backup (1)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRelease_scenario_backup_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let backupExt = new BackupExt();
                const SCENARIO_BACKUP: number = 1;
                await backupExt.onRelease(SCENARIO_BACKUP);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_backup_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_backup_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRelease_scenario_restore_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRelease_0200
         * @tc.desc   Test onRelease() with scenario as restore (2)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRelease_scenario_restore_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let backupExt = new BackupExt();
                const SCENARIO_RESTORE: number = 2;
                await backupExt.onRelease(SCENARIO_RESTORE);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_restore_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_restore_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRelease_scenario_zero_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRelease_0300
         * @tc.desc   Test onRelease() with scenario as 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRelease_scenario_zero_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let backupExt = new BackupExt();
                await backupExt.onRelease(0);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_zero_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_zero_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRelease_scenario_negative_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRelease_0400
         * @tc.desc   Test onRelease() with scenario as negative number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRelease_scenario_negative_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let backupExt = new BackupExt();
                await backupExt.onRelease(-1);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_negative_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_negative_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.name   test_Backup_onRelease_scenario_positive_001
         * @tc.number SUB_BASIC_FM_FileAPI_onRelease_0500
         * @tc.desc   Test onRelease() with scenario as positive number
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("test_Backup_onRelease_scenario_positive_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let backupExt = new BackupExt();
                await backupExt.onRelease(100);
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_positive_001 run ok');
                expect(id === 1).assertTrue();
                done();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', 'test_Backup_onRelease_scenario_positive_001 error: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done();
            }
        });

        /**
            * @tc.name   test_Backup_OnProcess_static_001
            * @tc.number SUB_BASIC_FM_FileAPI_OnProcess_static_0300
            * @tc.desc   Test onRestoreEx() interfaces
            * @tc.type   FUNCTION
            * @tc.size   MEDIUMTEST
            * @tc.level  LEVEL3
            */
        it("test_Backup_OnProcess_static_001", Level.LEVEL3, () => {
            try {
                let BackupExtensionAbility = new BackupExt();
                BackupExtensionAbility.onProcess();
                hilog.info(domain, tag, '%{public}s', 'test_Backup_OnProcess_static_001 run ok');
                expect(id === 1).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', `test_Backup_OnProcess_static_001 error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
            }
        });

        /**
            * @tc.name   test_Backup_Backupdir_static_001
            * @tc.number SUB_BASIC_FM_FileAPI_BackupDir_static_0100
            * @tc.desc   Test backupdir() interfaces
            * @tc.type   FUNCTION
            * @tc.size   MEDIUMTEST
            * @tc.level  LEVEL1
            */
        it("test_Backup_Backupdir_static_001", Level.LEVEL1, () => {
            try {
                let backupdir = new BackupExt();
                backupdir.backupDir();
                hilog.info(domain, tag, '%{public}s', 'backup-onBackup run ok');
                expect(id === 1).assertTrue();
            } catch (error) {
                hilog.info(domain, tag, '%{public}s', `test_Backup_Backupdir_static_001 error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
            }
        });
    })
    hilog.info(domain, tag, '%{public}s', 'backupExtension end');
}