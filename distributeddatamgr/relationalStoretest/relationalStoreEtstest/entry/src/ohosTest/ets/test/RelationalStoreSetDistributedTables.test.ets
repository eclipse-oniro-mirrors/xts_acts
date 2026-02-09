/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import data_relationalStore from '@ohos.data.relationalStore';
import deviceInfo from '@ohos.deviceInfo';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();

const TAG = "[tttttt]";

let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
const dbName = "distributedTables.db";
const TABLE = 'distributedTables';
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS " + TABLE + " (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL)";

const DROP_TABLE_TEST = "DROP TABLE " + TABLE;
let STORE_CONFIG:data_relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

export default function relationalStoreSetDistributedTables() {
  describe('RelationalStoreSetDistributedTables', () => {
    let currentDeviceIsWatch: boolean= false;
    beforeAll(async (done:Function) => {
      console.info('window_layout_test beforeAll begin');
      let deviceTypeInfo = deviceInfo.deviceType;
      currentDeviceIsWatch = deviceTypeInfo === 'wearable' ? true : false;
      console.info('the value of the deviceType is :' + deviceInfo.deviceType);
      console.info('window_layout_test beforeAll end');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      done();
    });
    afterAll(async (done:Function) => {
      console.log(TAG + 'afterAll');
      await data_relationalStore.deleteRdbStore(context, "distributedTables.db");
      done();
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: true,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: false
        }, async (err) => {
          console.log(TAG +"SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700  111111111111");
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            console.log(TAG +"SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700  222222222");
            expect().assertFail();
            done();
          }
          console.info('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700 SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        console.log(TAG +"SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700  3333333");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1700 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1800
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:true} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1800 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: true,
          asyncDownloadAsset: true
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }

      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1800 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1900
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:false} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1900 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: true,
          asyncDownloadAsset: false
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1900 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2000
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:true} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2000 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: false,
          asyncDownloadAsset: true
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2000 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2100
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:false} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2100 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: false,
          asyncDownloadAsset: false
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2100 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2200
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:false,enableCloud:false} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2200 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: false,
          asyncDownloadAsset: false,
          enableCloud: false
        }, async  (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2200 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2300
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:false,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2300 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: false,
          asyncDownloadAsset: false,
          enableCloud: true
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2300 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2400
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:true,enableCloud:false} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2400 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: false,
          asyncDownloadAsset: true,
          enableCloud: false
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2400 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2500
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: false,asyncDownloadAsset:true,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2500 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: false,
          asyncDownloadAsset: true,
          enableCloud: true
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2500 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2600
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:false,enableCloud:false} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2600 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: true,
          asyncDownloadAsset: false,
          enableCloud: false
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2600 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2700
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:false,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2700 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: true,
          asyncDownloadAsset: false,
          enableCloud: true
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2700 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2800
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2800 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: true,
          asyncDownloadAsset: true,
          enableCloud: false
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2800 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2900
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2900 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: true,
          asyncDownloadAsset: true,
          enableCloud: true
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SetDistributedTables successfully.');
          await rdbStore?.executeSql(DROP_TABLE_TEST, null);
          done();
        });
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_2900 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000
     * @tc.desc   1.setDistributedTables callback params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:true} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000 start *************")
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: true,
          asyncDownloadAsset: false,
          enableCloud: false
        }, async (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          }
          console.info('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000 SetDistributedTables successfully.');
          let u8 = new Uint8Array([4, 5, 6]);
          const valueBucket1: data_relationalStore.ValuesBucket = {
            'name': "zhangsan",
            'age': 18,
            'salary': 100.5
          };
          const valueBucket2: data_relationalStore.ValuesBucket = {
            'name': "lisi",
            'age': 18,
            'salary': 100.5,
          };
          if (rdbStore != undefined ) {
            let rowId: number = await rdbStore.insert(TABLE, valueBucket1);
            console.log(TAG + "rowId:" + rowId);
            let predicates = new data_relationalStore.RdbPredicates(TABLE);
            predicates.equalTo("name", "zhangsan");
            let resultSet: data_relationalStore.ResultSet = await rdbStore.query(predicates, ["id", "name", "age", "salary"]);
            console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
            expect(resultSet.rowCount).assertEqual(1);
            rdbStore.update(valueBucket2, predicates, (err, rows) => {
              if (err) {
                console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
                done();
              }
              console.info(`update rows: ${rows}`);
              expect(rows).assertEqual(1);
              predicates = new data_relationalStore.RdbPredicates(TABLE);
              predicates.equalTo("name", "lisi");
              rdbStore.delete(predicates, async (err, rows) => {
                if (err) {
                  console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
                  expect().assertFail();
                  done();
                }
                console.info(`Delete rows: ${rows}`);
                expect(rows).assertEqual(1);
                await rdbStore?.executeSql(DROP_TABLE_TEST, null);
                done();
              });
            });
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3000 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3100
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false,} DistributedType is data_relationalStore.DistributedType = 3;
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3100 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      let num: data_relationalStore.DistributedType = 3;
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: true,
          asyncDownloadAsset: true,
          enableCloud: false,
        };
        await rdbStore?.setDistributedTables(tableArray, num, setConfig);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect(err.code).assertEqual("401");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_3100 end   *************");
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: false} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: false,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
        console.log(TAG +
          "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0100 end   *************");
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:false,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: false,
          asyncDownloadAsset: false,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
        console.log(TAG +
          "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0200 end   *************");
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }

    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0300
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:false,enableCloud:false,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0300 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: false,
          asyncDownloadAsset: false,
          enableCloud: false,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }

    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0400
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:false,enableCloud:true,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0400 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: false,
          asyncDownloadAsset: false,
          enableCloud: true,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0400 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0500
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:true,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0500 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: false,
          asyncDownloadAsset: true,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0500 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0600
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:true,enableCloud:true,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0600 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: false,
          asyncDownloadAsset: true,
          enableCloud: true,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0600 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0700
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0700
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: false,asyncDownloadAsset:true,enableCloud:false,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0700 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: false,
          asyncDownloadAsset: true,
          enableCloud: false,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0700 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0800
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0800
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0800 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: true,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0800 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0900
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0900
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:false,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0900 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: true,
          asyncDownloadAsset: false,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_0900 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1000
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1000
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:false,enableCloud:false,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1000 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: true,
          asyncDownloadAsset: false,
          enableCloud: false,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1000 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:false,enableCloud:true,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: true,
          asyncDownloadAsset: false,
          enableCloud: true,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1100 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1200
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1200 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: true,
          asyncDownloadAsset: true,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1200 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1300
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:true,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1300 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: true,
          asyncDownloadAsset: true,
          enableCloud: true,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1300 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false,} DistributedType is DISTRIBUTED_CLOUD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: true,
          asyncDownloadAsset: true,
          enableCloud: false,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed");
        expect().assertFail();
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1400 end   *************");
    });
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1500
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false,} DistributedType is DISTRIBUTED_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1500 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: false,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_DEVICE,
          setConfig);
        console.log(TAG + "set test to be distributed table success");
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "set test to be distributed table failed" + err.code + err.message);
        expect(err.code).assertEqual(14800000);
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1500 end   *************");
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1600
     * @tc.desc   1.setDistributedTables params: setConfig={autoSync: true,asyncDownloadAsset:true,enableCloud:false,} DistributedType is DISTRIBUTED_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1600 start *************");
      await rdbStore?.executeSql(CREATE_TABLE_TEST, null);
      rdbStore?.close();
      try {
        let tableArray = [TABLE];
        const setConfig:data_relationalStore.DistributedConfig = {
          autoSync: true,
          asyncDownloadAsset: true,
          enableCloud: false,
        };
        await rdbStore?.setDistributedTables(tableArray, data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          setConfig);
        expect().assertFail();
        done();
      } catch (err) {
        console.log(TAG + "err code:" + err.code + "err message:" + err.message);
        expect(err.code).assertEqual("14800014");
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        await rdbStore?.executeSql(DROP_TABLE_TEST, null);
        done();
      }
      console.log(TAG +
        "************* SUB_DistributedData_RelationalStore_SDK_SetDistributedTables_1600 end   *************");
    });

  })
}