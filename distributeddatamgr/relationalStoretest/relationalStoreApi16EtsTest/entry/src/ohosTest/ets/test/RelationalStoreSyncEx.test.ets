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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();
const TAG = "[RELATIONAL_STORE_SYNCEX_JSKITS_TEST]"

const STORE_CONFIG:relationalStore.StoreConfig = {
  name: "RdbTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}

const CREATE_TABLE_TEST = 'CREATE TABLE IF NOT EXISTS EMPLOYEE ' +
  '(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER NOT NULL UNIQUE)';

let rdbStore: relationalStore.RdbStore;
let logTag = 'rdbSyncFirstLevelTest:  ';
export default function RdbStoreSyncEx() {
  describe('rdbStoreSyncExTest', () => {
    beforeAll(async () => {
      console.info(TAG + 'beforeAll')
    })
    beforeEach(async () => {
      console.info(TAG + 'beforeEach')
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      expect(rdbStore != undefined).assertTrue();
      await rdbStore.executeSql(CREATE_TABLE_TEST);
    })

    afterEach(async () => {
      console.info(TAG + 'afterEach')
      // rdbStore = null;
      await relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    afterAll(async () => {
      console.info(TAG + 'afterAll')
    })
    console.log(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.name   testRdbStoresyncExTest0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_0100
     * @tc.desc   No sync permission and syncEx returns 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0001 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0001 is successfully.');
        const predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 201).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0001 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_0200
     * @tc.desc   Sync mode is SYNC_MODE_CLOUD_FIRST and syncEx returns 14800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* syncExTest0002 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'syncExTest0002 is successfully.');
        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800001).assertTrue();
      }
      console.log(TAG + "************* syncExTest0002 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_0300
     * @tc.desc   store is closed and syncEx returns 14800014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0003 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'syncExTest0003 is successfully.');
        await rdbStore?.close();
        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800014).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0003 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_0400
     * @tc.desc   mode is null and syncEx returns 14800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0004 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0004 setDistributedTables successfully.');
        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(null, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800001).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0004 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_0500
     * @tc.desc   mode is null and syncEx returns 14800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0005 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0005 setDistributedTables successfully.');

        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(undefined, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800001).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0005 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_0600
     * @tc.desc   mode is invalid number (999) and syncEx returns 14800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0006 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0006 setDistributedTables successfully.');

        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(999, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800001).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0006 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0007
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_0700
     * @tc.desc   sync with SYNC_MODE_PUSH, expect 201 due to no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0007 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0007 setDistributedTables successfully.');

        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 201).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0007 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0008
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_0800
     * @tc.desc   sync with SYNC_MODE_PULL, expect 201 due to no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0008 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0008 setDistributedTables successfully.');
        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_PULL, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 201).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0008 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0009
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_0900
     * @tc.desc   sync with SYNC_MODE_TIME_FIRST, expect 14800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0009 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0009 setDistributedTables successfully.');

        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800001).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0009 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1000
     * @tc.desc   sync with SYNC_MODE_TIME_FIRST, expect 14800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0010 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0010 setDistributedTables successfully.');
        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800001).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0010 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0011
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1100
     * @tc.desc   SYNC_MODE_CLOUD_FIRST and syncEx returns 14800001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0011 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0011 setDistributedTables successfully.');

        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800001).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0011 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0012
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1200
     * @tc.desc   predicates with non-existent table, expect 201 due to no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0012 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0012 setDistributedTables successfully.');

        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('NON_EXISTENT_TABLE');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 201).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0012 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0013
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1300
     * @tc.desc   sync with predicates containing where condition, expect 201 due to no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0013 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0013 setDistributedTables successfully.');
        const valueBucket: relationalStore.ValuesBucket = {
          'name': 'TestEmployee',
          'age': 30
        };
        await rdbStore?.insert('EMPLOYEE', valueBucket);
        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.equalTo('age', 30);
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 201).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0013 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0014
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1400
     * @tc.desc   sync with predicates containing where condition, expect 201 due to no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0014 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0014 setDistributedTables successfully.');
        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.limitAs(10);
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 201).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0014 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0015
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1500
     * @tc.desc   sync with predicates containing orderBy, expect 201 due to no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0015 start *************");
      try {
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0015 setDistributedTables successfully.');
        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.orderByDesc('age');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 201).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0015 end *************");
      done()
    })
    /**
     * @tc.name   testRdbStoresyncExTest0016
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1600
     * @tc.desc   sync with predicates containing orderBy, expect 201 due to no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoresyncExTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.log(TAG + "************* testRdbStoresyncExTest0016 start *************");
      try {
        expect(relationalStore.SyncResultCode.SUCCESS).assertEqual(0)
        console.info(TAG + `SetDistributedTable EMPLOYEE begin`);
        await rdbStore?.setDistributedTables(["EMPLOYEE"]);
        console.info(TAG + 'testRdbStoresyncExTest0016 setDistributedTables successfully.');

        const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.orderByDesc('age');
        const result: Array<relationalStore.SyncResult> = await rdbStore.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates);
        expect(null).assertFail();
      } catch (err) {
        console.error(TAG + `syncEx is failed, code is ${err.code}, message is ${err.message}`);
        expect(err.code == 201).assertTrue();
      }
      console.log(TAG + "************* testRdbStoresyncExTest0016 end *************");
      done()
    })

    /**
     * @tc.name   testRdbStoresyncExTest0017
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1700
     * @tc.desc   the first mode is SYNC_MODE_PUSH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoresyncExTest0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(logTag + "testRdbStoresyncExTest0017 start");
      const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.orderByDesc('age');
      try{
        let result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PUSH, null);
        expect().assertFail()
      } catch(e) {
        console.info(logTag + 'testRdbStoresyncExTest0017 sync failed' + e.code + e.message);
        expect(e.code == 14800001).assertTrue();
      }
      done();
      console.info(logTag + "************* testRdbStoresyncExTest0017 end *************");
    })
    /**
     * @tc.name   testRdbStoresyncExTest0018
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1800
     * @tc.desc   the first mode is SYNC_MODE_PULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoresyncExTest0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(logTag + "testRdbStoresyncExTest0018 start");
      const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.orderByDesc('age');
      try{
        let result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_PULL, undefined);
        expect().assertFail()
      } catch(e) {
        console.info(logTag + 'testRdbStoresyncExTest0018 sync failed' + e.code + e.message);
        expect(e.code == 14800001).assertTrue();
      }
      done();
      console.info(logTag + "************* testRdbStoresyncExTest0018 end *************");
    })
    /**
     * @tc.name   testRdbStoresyncExTest0019
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_1900
     * @tc.desc   the first mode is SYNC_MODE_TIME_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoresyncExTest0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(logTag + "testRdbStoresyncExTest0019 start");
      const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.orderByDesc('age');
      try{
        let result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_TIME_FIRST, null);
        expect().assertFail()
      } catch(e) {
        console.info(logTag + 'testRdbStoresyncExTest0019 sync failed' + e.code + e.message);
        expect(e.code == 14800001).assertTrue();
      }
      done();
      console.info(logTag + "************* testRdbStoresyncExTest0019 end *************");
    })
    /**
     * @tc.name   testRdbStoresyncExTest0020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_2000
     * @tc.desc   the first mode is SYNC_MODE_NATIVE_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoresyncExTest0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(logTag + "testRdbStoresyncExTest0020 start");
      const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.orderByDesc('age');
      try{
        let result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_NATIVE_FIRST, null);
        expect().assertFail()
      } catch(e) {
        console.info(logTag + 'testRdbStoresyncExTest0020 sync failed' + e.code + e.message);
        expect(e.code == 14800001).assertTrue();
      }
      done();
      console.info(logTag + "************* testRdbStoresyncExTest0020 end *************");
    })
    /**
     * @tc.name   testRdbStoresyncExTest0021
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_2100
     * @tc.desc   the first mode is SYNC_MODE_CLOUD_FIRST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoresyncExTest0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(logTag + "testRdbStoresyncExTest0021 start");
      const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.orderByDesc('age');
      try{
        let result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, null);
        expect().assertFail()
      } catch(e) {
        console.info(logTag + 'testRdbStoresyncExTest0021 sync failed' + e.code + e.message);
        expect(e.code == 14800001).assertTrue();
      }
      done();
      console.info(logTag + "************* testRdbStoresyncExTest0021 end *************");
    })
    /**
     * @tc.name   testRdbStoresyncExTest0022
     * @tc.number SUB_DistributedData_RelationalStore_SDK_testRdbStoresyncExTest_2200
     * @tc.desc   the test of SyncResultCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoresyncExTest0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(logTag + "testRdbStoresyncExTest0022 start");
      const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates('EMPLOYEE');
      predicates.orderByDesc('age');
      try{
        let result: relationalStore.SyncResult[] = await rdbStore!.syncEx(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, predicates);
        expect(relationalStore.SyncResultCode.SUCCESS).assertEqual(0)
        expect(relationalStore.SyncResultCode.FAIL).assertEqual(1)
        expect(relationalStore.SyncResultCode.OFFLINE).assertEqual(2)
        expect(relationalStore.SyncResultCode.INVALID_ARGS).assertEqual(3)
        expect(relationalStore.SyncResultCode.DISTRIBUTED_TABLE_NOT_SET).assertEqual(4)
        expect(relationalStore.SyncResultCode.TABLE_FIELD_MISMATCH).assertEqual(5)
        expect(relationalStore.SyncResultCode.DISTRIBUTED_SCHEMA_MISMATCH).assertEqual(6)
        expect(relationalStore.SyncResultCode.BUSY).assertEqual(7)
        expect(relationalStore.SyncResultCode.CORRUPTED).assertEqual(8)
        expect(relationalStore.SyncResultCode.TIMEOUT).assertEqual(9)
        expect(relationalStore.SyncResultCode.SCHEMA_CHANGED).assertEqual(10)
        expect(relationalStore.SyncResultCode.CONSTRAINT_VIOLATION).assertEqual(11)
      } catch(e) {
        console.info(logTag + 'testRdbStoresyncExTest0022 sync failed' + e.code + e.message);
        expect(e.code == 14800001).assertTrue();
      }
      done();
      console.info(logTag + "************* testRdbStoresyncExTest0022 end *************");
    })
    console.log(TAG + "*************Unit Test End*************");
  })
}
