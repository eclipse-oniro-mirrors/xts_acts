/*
 	  * Copyright (C) 2026 Huawei Device Co., Ltd.
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
 	 import BackupExtensionAbility, { BundleVersion } from '@ohos.application.BackupExtensionAbility';
 	 
 	 interface ErrorInfo {
 	   type: string,
 	   errorCode: number,
 	   errorInfo: string
 	 }
 	 
 	 export class MyBackupExtAbilityBoundary extends BackupExtensionAbility {

 	    async onRestore(bundleVersion : BundleVersion) {
 	       console.log("onRestore begin");
 	       console.info(`onRestore ok ${JSON.stringify(bundleVersion)}`);
 	       console.log("onRestore end");
 	    }
 	 
 	    onBackupEx(backupInfo: string | undefined | null): string {
 	      try {
 	        if (backupInfo == "") {
 	          console.info("backupInfo is empty");
 	        } 	        
			if (backupInfo == undefined || backupInfo == null) {
 	          console.info("backupInfo is undefined or null");
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
 	 
 	    onRestoreEx(bundleVersion: BundleVersion, restoreInfo: string): string {
 	      try {
 	        if (restoreInfo == "") {
 	          console.info("restoreInfo is empty");
 	        }
 	        console.info(`onRestoreEx ok ${JSON.stringify(bundleVersion)}`);
 	        let errorInfo: ErrorInfo = {
 	          type: "ErrorInfo",
 	          errorCode: 0,
 	          errorInfo: "app customized error info"
 	        }
 	        return JSON.stringify(errorInfo);
 	      } catch (err) {
 	        console.error(`onRestoreEx error. Code:${err.code}, message:${err.message}`);
 	      }
 	      return "";
 	    }
 	 
 	    async onRelease(scenario: number): Promise<void> {
 	      console.info(`onRelease scenario: ${scenario}`);
 	    }
 	 }
 	 
 	 export default function boundaryTest(){
 	 describe('BackupExtensionAbility_boundary_test',async () => {
 	 
 	    /**
 	     * @tc.name   test_Backup_onBackupEx_empty_string_001
 	     * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0100
 	     * @tc.desc   Test onBackupEx() with empty string
 	     * @tc.type   FUNCTION
 	     * @tc.size   MEDIUMTEST
 	     * @tc.level  LEVEL2
 	     */
 	    it("test_Backup_onBackupEx_empty_string_001", Level.LEVEL2, () => {
 	       try {
 	          let backupext = new MyBackupExtAbilityBoundary();
 	          let result = backupext.onBackupEx("");
 	          console.log('test_Backup_onBackupEx_empty_string_001 run ok');
 	          expect(result !== null).assertTrue();
 	       } catch (error) {
 	          console.info(`test_Backup_onBackupEx_empty_string_001 error: ${JSON.stringify(error)}`);
 	          expect(false).assertTrue();
 	       }
 	    });

 	    /**
 	     * @tc.name   test_Backup_onBackupEx_empty_string_002
 	     * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0200
 	     * @tc.desc   Test onBackupEx() with null
 	     * @tc.type   FUNCTION
 	     * @tc.size   MEDIUMTEST
 	     * @tc.level  LEVEL2
 	     */
 	    it("test_Backup_onBackupEx_empty_string_002", Level.LEVEL2, () => {
 	       try {
 	          let backupext = new MyBackupExtAbilityBoundary();
 	          let result = backupext.onBackupEx(null);
 	          console.log('test_Backup_onBackupEx_empty_string_002 run ok');
 	          expect(result !== null).assertTrue();
 	       } catch (error) {
 	          console.info(`test_Backup_onBackupEx_empty_string_002 error: ${JSON.stringify(error)}`);
 	          expect(false).assertTrue();
 	       }
 	    });

 	    /**
 	     * @tc.name   test_Backup_onBackupEx_empty_string_003
 	     * @tc.number SUB_BASIC_FM_FileAPI_onBackupEx_0300
 	     * @tc.desc   Test onBackupEx() with undefined
 	     * @tc.type   FUNCTION
 	     * @tc.size   MEDIUMTEST
 	     * @tc.level  LEVEL2
 	     */
 	    it("test_Backup_onBackupEx_empty_string_003", Level.LEVEL2, () => {
 	       try {
 	          let backupext = new MyBackupExtAbilityBoundary();
 	          let result = backupext.onBackupEx(undefined);
 	          console.log('test_Backup_onBackupEx_empty_string_003 run ok');
 	          expect(result !== null).assertTrue();
 	       } catch (error) {
 	          console.info(`test_Backup_onBackupEx_empty_string_003 error: ${JSON.stringify(error)}`);
 	          expect(false).assertTrue();
 	       }
 	    });

 	    /**
 	     * @tc.name   test_Backup_onRestore_name_empty_string_001
 	     * @tc.number SUB_BASIC_FM_FileAPI_onRestore_0100
 	     * @tc.desc   Test onRestore() with BundleVersion.name as empty string
 	     * @tc.type   FUNCTION
 	     * @tc.size   MEDIUMTEST
 	     * @tc.level  LEVEL2
 	     */
 	    it("test_Backup_onRestore_name_empty_string_001", Level.LEVEL2, async () => {
 	       try {
 	          let backupext = new MyBackupExtAbilityBoundary();
 	          let bundleVersion: BundleVersion = {
 	            code: 1,
 	            name: ""
 	          };
 	          let result = await backupext.onRestore(bundleVersion);
 	          console.log('test_Backup_onRestore_name_empty_string_001 run ok');
 	          expect(result !== null).assertTrue();
 	       } catch (error) {
 	          console.info(`test_Backup_onRestore_name_empty_string_001 error: ${JSON.stringify(error)}`);
 	          expect(false).assertTrue();
 	       }
 	    });
 	 
 	    /**
 	     * @tc.name   test_Backup_onRestoreEx_name_empty_string_001
 	     * @tc.number SUB_BASIC_FM_FileAPI_onRestoreEx_0100
 	     * @tc.desc   Test onRestoreEx() with BundleVersion.name as empty string
 	     * @tc.type   FUNCTION
 	     * @tc.size   MEDIUMTEST
 	     * @tc.level  LEVEL2
 	     */
 	    it("test_Backup_onRestoreEx_name_empty_string_001", Level.LEVEL2, () => {
 	       try {
 	          let backupext = new MyBackupExtAbilityBoundary();
 	          let bundleVersion: BundleVersion = {
 	            code: 1,
 	            name: ""
 	          };
 	          let restoreInfo: string = "valid_info";
 	          let result = backupext.onRestoreEx(bundleVersion, restoreInfo);
 	          console.log('test_Backup_onRestoreEx_name_empty_string_001 run ok');
 	          expect(result !== null).assertTrue();
 	       } catch (error) {
 	          console.info(`test_Backup_onRestoreEx_name_empty_string_001 error: ${JSON.stringify(error)}`);
 	          expect(false).assertTrue();
 	       }
 	    });
 	 
 	    /**
 	     * @tc.name   test_Backup_onRestoreEx_restoreInfo_empty_string_001
 	     * @tc.number SUB_BASIC_FM_FileAPI_onRestoreEx_0400
 	     * @tc.desc   Test onRestoreEx() with restoreInfo as empty string
 	     * @tc.type   FUNCTION
 	     * @tc.size   MEDIUMTEST
 	     * @tc.level  LEVEL2
 	     */
 	    it("test_Backup_onRestoreEx_restoreInfo_empty_string_001", Level.LEVEL2, () => {
 	       try {
 	          let backupext = new MyBackupExtAbilityBoundary();
 	          let bundleVersion: BundleVersion = {
 	            code: 1,
 	            name: "valid_name"
 	          };
 	          let restoreInfo: string = "";
 	          let result = backupext.onRestoreEx(bundleVersion, restoreInfo);
 	          console.log('test_Backup_onRestoreEx_restoreInfo_empty_string_001 run ok');
 	          expect(result !== null).assertTrue();
 	       } catch (error) {
 	          console.info(`test_Backup_onRestoreEx_restoreInfo_empty_string_001 error: ${JSON.stringify(error)}`);
 	          expect(false).assertTrue();
 	       }
 	    });
 	 });
 	 }