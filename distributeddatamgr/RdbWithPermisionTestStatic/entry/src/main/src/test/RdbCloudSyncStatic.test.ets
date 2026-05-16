'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "../../../hypium/index";
import relationalStore from '@ohos.data.relationalStore';
import { BusinessError } from '@kit.BasicServicesKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const TAG = "[ttt]"
let context  =  abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext()
const STORE_CONFIG:relationalStore.StoreConfig = {
    name: "RdbTest.db",
    securityLevel: relationalStore.SecurityLevel.S1
};
let rdbStore: relationalStore.RdbStore | undefined;

export default function RelationalStoreCloudSyncTest(): void {
  describe('RelationalStoreCloudSyncTest', () => {
    beforeEach(async () => {
        console.info(TAG + "beforeEach");
        rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
    })
    afterEach(async () => {
        console.info(TAG + "afterEach");
        rdbStore = undefined;
        await relationalStore.deleteRdbStore(context, "RdbTest.db");
    })
    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_ASSETSTATUS_ASSET_TO_DOWNLOAD_0100
     * @tc.name assetToDownloadEnumTest001
     * @tc.desc 测试 AssetStatus.ASSET_TO_DOWNLOAD 枚举值等于6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('assetToDownloadEnumTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(relationalStore.AssetStatus.ASSET_TO_DOWNLOAD).assertEqual(7);
      console.info('Test PASSED: AssetStatus.ASSET_TO_DOWNLOAD = 7');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_PROGRESSCODE_STOP_CLOUD_SYNC_0100
     * @tc.name stopCloudSyncEnumTest001
     * @tc.desc 测试 ProgressCode.STOP_CLOUD_SYNC 枚举值等于8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('stopCloudSyncEnumTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        expect(relationalStore.ProgressCode.STOP_CLOUD_SYNC).assertEqual(8);
        console.info('Test PASSED: ProgressCode.STOP_CLOUD_SYNC = 8');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_ASSETCONFLICTPOLICY_DEFAULT_0100
     * @tc.name conflictPolicyDefaultEnumTest001
     * @tc.desc 测试 AssetConflictPolicy.CONFLICT_POLICY_DEFAULT 枚举值等于0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('conflictPolicyDefaultEnumTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        expect(relationalStore.AssetConflictPolicy.CONFLICT_POLICY_DEFAULT).assertEqual(0);
        console.info('Test PASSED: AssetConflictPolicy.CONFLICT_POLICY_DEFAULT = 0');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_ASSETCONFLICTPOLICY_TIME_FIRST_0100
     * @tc.name conflictPolicyTimeFirstEnumTest001
     * @tc.desc 测试 AssetConflictPolicy.CONFLICT_POLICY_TIME_FIRST 枚举值等于1.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('conflictPolicyTimeFirstEnumTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(relationalStore.AssetConflictPolicy.CONFLICT_POLICY_TIME_FIRST).assertEqual(1);
      console.info('Test PASSED: AssetConflictPolicy.CONFLICT_POLICY_TIME_FIRST = 1');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_ASSETCONFLICTPOLICY_TEMP_PATH_0100
     * @tc.name conflictPolicyTempPathEnumTest001
     * @tc.desc 测试 AssetConflictPolicy.CONFLICT_POLICY_TEMP_PATH 枚举值等于2.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('conflictPolicyTempPathEnumTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(relationalStore.AssetConflictPolicy.CONFLICT_POLICY_TEMP_PATH).assertEqual(2);
      console.info('Test PASSED: AssetConflictPolicy.CONFLICT_POLICY_TEMP_PATH = 2');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_DISTRIBUTEDCONFIG_ASSETCONFLICTPOLICY_0100
     * @tc.name assetConflictPolicyPropTest001
     * @tc.desc 测试 DistributedConfig.assetConflictPolicy 属性设置.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('assetConflictPolicyPropTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        let config: relationalStore.DistributedConfig = {
          autoSync: true,
          assetConflictPolicy: relationalStore.AssetConflictPolicy.CONFLICT_POLICY_DEFAULT
        };
        expect(config.assetConflictPolicy).assertEqual(relationalStore.AssetConflictPolicy.CONFLICT_POLICY_DEFAULT);
        console.info('Test PASSED: DistributedConfig.assetConflictPolicy set successfully');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_DISTRIBUTEDCONFIG_ASSETCONFLICTPOLICY_0200
     * @tc.name assetConflictPolicyPropTest002
     * @tc.desc 测试 DistributedConfig.assetConflictPolicy 各枚举值设置.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('assetConflictPolicyPropTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let config1: relationalStore.DistributedConfig = {
        autoSync: true,
        assetConflictPolicy: relationalStore.AssetConflictPolicy.CONFLICT_POLICY_TIME_FIRST
      };
      expect(config1.assetConflictPolicy).assertEqual(1);

      let config2: relationalStore.DistributedConfig = {
        autoSync: true,
        assetConflictPolicy: relationalStore.AssetConflictPolicy.CONFLICT_POLICY_TEMP_PATH
      };
      expect(config2.assetConflictPolicy).assertEqual(2);
      console.info('Test PASSED: All AssetConflictPolicy values can be set');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_DISTRIBUTEDCONFIG_ASSETTEMPATH_0100
     * @tc.name assetTempPathPropTest001
     * @tc.desc 测试 DistributedConfig.assetTempPath 属性设置.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('assetTempPathPropTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let config: relationalStore.DistributedConfig = {
        autoSync: true,
        assetTempPath: '/data/temp_assets'
      };
      expect(config.assetTempPath).assertEqual('/data/temp_assets');
      console.info('Test PASSED: DistributedConfig.assetTempPath set successfully');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_DISTRIBUTEDCONFIG_ASSETTEMPATH_0200
     * @tc.name assetTempPathPropTest002
     * @tc.desc 测试 DistributedConfig.assetTempPath 空字符串.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('assetTempPathPropTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let config: relationalStore.DistributedConfig = {
        autoSync: true,
        assetTempPath: ''
      };
      expect(config.assetTempPath).assertEqual('');
      console.info('Test PASSED: DistributedConfig.assetTempPath can be empty string');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_DISTRIBUTEDCONFIG_ASSETDOWNLOADONDEMAND_0100
     * @tc.name assetDownloadOnDemandPropTest001
     * @tc.desc 测试 DistributedConfig.assetDownloadOnDemand 属性设置为true.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('assetDownloadOnDemandPropTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let config: relationalStore.DistributedConfig = {
        autoSync: true,
        assetDownloadOnDemand: true
      };
      expect(config.assetDownloadOnDemand).assertTrue();
      console.info('Test PASSED: DistributedConfig.assetDownloadOnDemand = true');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_DISTRIBUTEDCONFIG_ASSETDOWNLOADONDEMAND_0200
     * @tc.name assetDownloadOnDemandPropTest002
     * @tc.desc 测试 DistributedConfig.assetDownloadOnDemand 属性设置为false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('assetDownloadOnDemandPropTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let config: relationalStore.DistributedConfig = {
        autoSync: true,
        assetDownloadOnDemand: false
      };
      expect(config.assetDownloadOnDemand).assertFalse();
      console.info('Test PASSED: DistributedConfig.assetDownloadOnDemand = false');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_DISTRIBUTEDCONFIG_AUTOSYNCSWITCH_0100
     * @tc.name autoSyncSwitchPropTest001
     * @tc.desc 测试 DistributedConfig.autoSyncSwitch 属性设置为true.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('autoSyncSwitchPropTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let config: relationalStore.DistributedConfig = {
        autoSync: true,
        autoSyncSwitch: true
      };
      expect(config.autoSyncSwitch).assertTrue();
      console.info('Test PASSED: DistributedConfig.autoSyncSwitch = true');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_DISTRIBUTEDCONFIG_AUTOSYNCSWITCH_0200
     * @tc.name autoSyncSwitchPropTest002
     * @tc.desc 测试 DistributedConfig.autoSyncSwitch 属性设置为false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('autoSyncSwitchPropTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let config: relationalStore.DistributedConfig = {
        autoSync: true,
        autoSyncSwitch: false
      };
      expect(config.autoSyncSwitch).assertFalse();
      console.info('Test PASSED: DistributedConfig.autoSyncSwitch = false');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_CLOUDSYNCCONFIG_MODE_0100
     * @tc.name cloudSyncConfigModeTest001
     * @tc.desc 测试 CloudSyncConfig.mode 属性设置为SYNC_MODE_PUSH.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('cloudSyncConfigModeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
        let config: relationalStore.CloudSyncConfig = {
          mode: relationalStore.SyncMode.SYNC_MODE_PUSH
        };
        expect(config.mode).assertEqual(relationalStore.SyncMode.SYNC_MODE_PUSH);
        console.info('Test PASSED: CloudSyncConfig.mode = SYNC_MODE_PUSH');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_CLOUDSYNCCONFIG_MODE_0200
     * @tc.name cloudSyncConfigModeTest002
     * @tc.desc 测试 CloudSyncConfig.mode 各SyncMode值设置.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cloudSyncConfigModeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let modes = [
        relationalStore.SyncMode.SYNC_MODE_PUSH,
        relationalStore.SyncMode.SYNC_MODE_PULL,
        relationalStore.SyncMode.SYNC_MODE_TIME_FIRST,
        relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST,
        relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST
      ];

      for (let i = 0; i < modes.length; i++) {
        let config: relationalStore.CloudSyncConfig = {
          mode: modes[i]
        };
        expect(config.mode).assertEqual(modes[i]);
      }
      console.info('Test PASSED: All SyncMode values can be set in CloudSyncConfig');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_CLOUDSYNCCONFIG_ENABLEPREDICATE_0100
     * @tc.name cloudSyncConfigEnablePredicateTest001
     * @tc.desc 测试 CloudSyncConfig.enablePredicate 属性设置为true.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('cloudSyncConfigEnablePredicateTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let config: relationalStore.CloudSyncConfig = {
        mode: relationalStore.SyncMode.SYNC_MODE_PUSH,
        enablePredicate: true
      };
      expect(config.enablePredicate).assertTrue();
      console.info('Test PASSED: CloudSyncConfig.enablePredicate = true');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_CLOUDSYNCCONFIG_ENABLEPREDICATE_0200
     * @tc.name cloudSyncConfigEnablePredicateTest002
     * @tc.desc 测试 CloudSyncConfig.enablePredicate 属性设置为false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('cloudSyncConfigEnablePredicateTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let config: relationalStore.CloudSyncConfig = {
        mode: relationalStore.SyncMode.SYNC_MODE_PUSH,
        enablePredicate: false
      };
      expect(config.enablePredicate).assertFalse();
      console.info('Test PASSED: CloudSyncConfig.enablePredicate = false');
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_SETDISTRIBUTEDTABLES_PARAM_0100
     * @tc.name setDistributedTablesParamTest001
     * @tc.desc 测试 setDistributedTables 方法 - Promise方式正常参数.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('setDistributedTablesParamTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        try {
            const config1: relationalStore.DistributedConfig = {
                autoSync : false,
                enableCloud : true,
                assetConflictPolicy : relationalStore.AssetConflictPolicy.CONFLICT_POLICY_DEFAULT,
                assetTempPath: "",
                assetDownloadOnDemand: true,
                autoSyncSwitch: true
            };
            const config2: relationalStore.DistributedConfig = {
                autoSync : false,
                enableCloud : true,
                assetConflictPolicy : relationalStore.AssetConflictPolicy.CONFLICT_POLICY_TIME_FIRST,
                assetTempPath: "",
                assetDownloadOnDemand: false,
                autoSyncSwitch: false
            };
            const config3: relationalStore.DistributedConfig = {
                autoSync : false,
                enableCloud : true,
                assetConflictPolicy : relationalStore.AssetConflictPolicy.CONFLICT_POLICY_TEMP_PATH,
                assetTempPath: "",
                assetDownloadOnDemand: false,
                autoSyncSwitch: false
            };
            await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
            await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, config1);
            console.info(TAG + `setDistributedTables1 success`);
            await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, config2);
            console.info(TAG + `setDistributedTables2 success`);
            await rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, config3);
            console.info(TAG + `setDistributedTables3 success`);
            expect().assertFail();
        } catch (e) {
            console.error(TAG + `executeSql error, code is ${e.code}, messegeis ${e.message}`);
            expect(e.code).assertEqual(14800000);
        }
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_SETDISTRIBUTEDTABLES_PARAM_0200
     * @tc.name setDistributedTablesParamTest002
     * @tc.desc 测试 setDistributedTables 方法 - Callback方式正常参数.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('setDistributedTablesParamTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        try {
            const config1: relationalStore.DistributedConfig = {
                autoSync : false,
                enableCloud : true,
                assetConflictPolicy : relationalStore.AssetConflictPolicy.CONFLICT_POLICY_DEFAULT,
                assetTempPath: "",
                assetDownloadOnDemand: true,
                autoSyncSwitch: true
            };
            const config2: relationalStore.DistributedConfig = {
                autoSync : false,
                enableCloud : true,
                assetConflictPolicy : relationalStore.AssetConflictPolicy.CONFLICT_POLICY_TIME_FIRST,
                assetTempPath: "",
                assetDownloadOnDemand: false,
                autoSyncSwitch: false
            };
            const config3: relationalStore.DistributedConfig = {
                autoSync : false,
                enableCloud : true,
                assetConflictPolicy : relationalStore.AssetConflictPolicy.CONFLICT_POLICY_TEMP_PATH,
                assetTempPath: "",
                assetDownloadOnDemand: false,
                autoSyncSwitch: false
            };
            await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
            rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, config1, () => {
                console.info(TAG + `setDistributedTables1 success`);
                rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, config2, () => {
                    console.info(TAG + `setDistributedTables2 success`);
                    rdbStore!.setDistributedTables(["EMPLOYEE"], relationalStore.DistributedType.DISTRIBUTED_DEVICE, config3, (err) => {
                        if (err) {
                            console.error(TAG + `setDistributedTables error, code is ${err.code}, messegeis ${err.message}`);
                            expect(err.code).assertEqual(14800000);
                            done();
                        } else {
                            console.info(TAG + `setDistributedTables3 success`);
                            expect().assertFail();
                        }
                    });
                });
            });
        } catch (e) {
            console.error(TAG + `executeSql error, code is ${e.code}, messegeis ${e.message}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_CLOUDSYNC_PARAM_0100
     * @tc.name cloudSyncParamTest001
     * @tc.desc 测试 cloudSync 方法 - Promise方式正常参数.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('cloudSyncParamTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        const config1: relationalStore.CloudSyncConfig = {
            mode: relationalStore.SyncMode.SYNC_MODE_PUSH,
            enablePredicate: true,
            predicate: predicates
        };
        const config2: relationalStore.CloudSyncConfig = {
            mode: relationalStore.SyncMode.SYNC_MODE_PULL,
            enablePredicate: false,
            predicate: predicates
        };
        const config3: relationalStore.CloudSyncConfig = {
            mode: relationalStore.SyncMode.SYNC_MODE_TIME_FIRST,
            enablePredicate: true,
            predicate: predicates
        };
        const config4: relationalStore.CloudSyncConfig = {
            mode: relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST,
            enablePredicate: true,
            predicate: predicates
        };
        const config5: relationalStore.CloudSyncConfig = {
            mode: relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST,
            enablePredicate: true,
            predicate: predicates
        };
        try {
            await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
            await rdbStore!.close();
            await rdbStore!.cloudSync(config1, (progressDetails: relationalStore.ProgressDetails) => {
                console.info(TAG + `progress: ${progressDetails.schedule}`);
                console.info(TAG + `progress: ${progressDetails.message}`);
            })
            console.info(TAG + 'cloud sync1 succeeded');
            expect().assertFail();
        } catch (e) {
            console.error(TAG + `cloud sync error, code is ${e.code}, messegeis ${e.message}`);
            expect(e.code).assertEqual(14800014);
        }
        try {
            await rdbStore!.cloudSync(config2, (progressDetails: relationalStore.ProgressDetails) => {
                console.info(TAG + `progress: ${progressDetails.schedule}`);
            })
            console.info(TAG + 'cloud sync2 succeeded');
            expect().assertFail();
        } catch (e) {
            console.error(TAG + `cloud sync error, code is ${e.code}, messegeis ${e.message}`);
            expect(e.code).assertEqual(14800014);
        }
        try {
            await rdbStore!.cloudSync(config3, (progressDetails: relationalStore.ProgressDetails) => {
                console.info(TAG + `progress: ${progressDetails.schedule}`);
            })
            console.info(TAG + 'cloud sync3 succeeded');
            expect().assertFail();
        } catch (e) {
            console.error(TAG + `cloud sync error, code is ${e.code}, messegeis ${e.message}`);
            expect(e.code).assertEqual(14800014);
        }
        try {
            await rdbStore!.cloudSync(config4, (progressDetails: relationalStore.ProgressDetails) => {
                console.info(TAG + `progress: ${progressDetails.schedule}`);
            })
            console.info(TAG + 'cloud sync4 succeeded');
            expect().assertFail();
        } catch (e) {
            console.error(TAG + `cloud sync error, code is ${e.code}, messegeis ${e.message}`);
            expect(e.code).assertEqual(14800014);
        }
        try {
            await rdbStore!.cloudSync(config5, (progressDetails: relationalStore.ProgressDetails) => {
                console.info(TAG + `progress: ${progressDetails.schedule}`);
            })
            console.info(TAG + 'cloud sync5 succeeded');
            expect().assertFail();
        } catch (e) {
            console.error(TAG + `cloud sync error, code is ${e.code}, messegeis ${e.message}`);
            expect(e.code).assertEqual(14800014);
        }
    });
    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_STOPCLOUDSYNC_PARAM_0100
     * @tc.name stopCloudSyncParamTest001
     * @tc.desc 测试 stopCloudSync 方法 - 正常调用Promise方式.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('stopCloudSyncParamTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        try {
            await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
            await rdbStore!.stopCloudSync();
            console.info('Succeeded in stopping cloud sync');
            expect().assertFail();
        } catch (e) {
            console.error(TAG + `stopCloudSync error, code is ${e.code}, messegeis ${e.message}`);
            if(e.code == 801) {
                expect(e.code).assertEqual(801);
            } else {
                expect(e.code).assertEqual(14800000);
            }
        }
    });

    /**
     * @tc.number SUB_DISTRIBUTEDDATAMGR_RELATIONALSTORE_STOPCLOUDSYNC_ERROR_0100
     * @tc.name stopCloudSyncError14800014Test001
     * @tc.desc 测试 stopCloudSync 方法 - 错误码14800014已关闭.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('stopCloudSyncError14800014Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        try {
            await rdbStore!.executeSql('CREATE TABLE IF NOT EXISTS EMPLOYEE (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT NOT NULL UNIQUE, AGE INTEGER, SALARY REAL, CODES BLOB)');
            await rdbStore!.close();
            await rdbStore!.stopCloudSync();
            console.info('Succeeded in stopping cloud sync');
            expect().assertFail();
        } catch (e) {
            console.error(TAG + `stopCloudSync error, code is ${e.code}, messegeis ${e.message}`);
            if(e.code == 801) {
                expect(e.code).assertEqual(801);
            } else {
                expect(e.code).assertEqual(14800014);
            }
        }
    });
  });
}