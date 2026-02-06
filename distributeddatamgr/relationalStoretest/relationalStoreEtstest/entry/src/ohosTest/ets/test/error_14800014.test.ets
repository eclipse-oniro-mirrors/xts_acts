/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file expect in compliance with the License.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
import data_relationalStore from '@ohos.data.relationalStore'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';
import { sendableRelationalStore } from '@kit.ArkData';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context =  delegator.getAppContext().getApplicationContext();
const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 asset, " + "data2 asset, " + "data3 assets )";
let dmInstance: distributedDeviceManager.DeviceManager;
let deviceId: string | undefined = undefined;


const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG1:data_relationalStore.StoreConfig = {
  name: "TransactionTest.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let rdbStore:data_relationalStore.RdbStore | undefined = undefined;
const STORE_CONFIG: data_relationalStore.StoreConfig= {
  name: "Asset.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
const asset1:data_relationalStore.Asset = {
  name: "name1",
  uri: "uri1",
  createTime: "createTime1",
  modifyTime: "modifyTime1",
  size: "size1",
  path: "path1",
  status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2:data_relationalStore.Asset = {
  name: "name2",
  uri: "uri2",
  createTime: "createTime2",
  modifyTime: "modifyTime2",
  size: "size2",
  path: "path2",
  status: data_relationalStore.AssetStatus.ASSET_INSERT,
}
const asset3:data_relationalStore.Asset = {
  name: "name3",
  uri: "uri3",
  createTime: "createTime3",
  modifyTime: "modifyTime3",
  size: "size3",
  path: "path3",
  status: data_relationalStore.AssetStatus.ASSET_UPDATE,
}

export default function error14800014Test() {
  describe('error14800014Test', () => {

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_0100
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0100
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      const assets1 = [asset1];
      const assets2 = [asset1, asset2, asset3];
      let valuesBucket:data_relationalStore.ValuesBucket = {
        "data1": asset1,
        "data2": asset2,
        "data3": assets1,
      }
      await rdbStore.insert("test", valuesBucket);
      let valuesBucket2:data_relationalStore.ValuesBucket = {
        "data1": asset2,
        "data2": asset3,
        "data3": assets2,
      }
      await rdbStore.insert("test", valuesBucket2);
      let valuesBucket3:data_relationalStore.ValuesBucket = {
        "data1": asset1,
        "data3": new Array()
      }
      await rdbStore.insert("test", valuesBucket3);
      console.log(TAG + "************* testGetAssets0001 start *************");
      let predicates = await new data_relationalStore.RdbPredicates("test");
      let resultSet:data_relationalStore.ResultSet = await rdbStore.query(predicates);
      resultSet.close();
      try {
        resultSet.getAsset(resultSet.getColumnIndex("data3"));
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.getAssets(resultSet.getColumnIndex("data3"));
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.getValue(-1);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.getRow();
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.getRows(1);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.getSendableRow();
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.isColumnNull(1);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
     try {
        resultSet.goToLastRow();
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "goToLastRowe.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      await rdbStore.close();
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "Asset.db");
      done();
      console.log(TAG + "************* testGetAssets0001 end *************");
    })


    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_0200
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0200
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let bigU8 = new Uint8Array(Array(1024 * 1024 * 2).fill(1));
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 30,
        "salary": 100.5,
        "blobType": bigU8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      let resultSet = await rdbStore.query(predicates);
      resultSet.close();
      try {
        resultSet.goTo(resultSet.columnCount);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.goToRow(1);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.goToFirstRow();
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.goToFirstRow();
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.goToNextRow();
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.goToPreviousRow();
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.getBlob(4);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.getString(1);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.getLong(2);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      try {
        resultSet.getDouble(3);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800014");
      }
      resultSet.close();
      await rdbStore.close();
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "Asset.db");
      done();
      console.log(TAG + "************* testGetAssets0001 end *************");
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_0300
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0300
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket= {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }
      try{
        rdbStore.insert("test1", valueBucket, (err: BusinessError, rowId: number) => {
          if (err) {
            console.error(`Insert is failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info(`Insert is successful, rowId = ${rowId}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      try{
        rdbStore.insert("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (err: BusinessError, rowId: number) => {
          if (err) {
            console.error(`Insert is failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info(`Insert is successful, rowId = ${rowId}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      try {
        await rdbStore.insert("test1", valueBucket);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      try {
        await rdbStore.insert("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      try {
        rdbStore.insertSync("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect().assertFail();;
      } catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      const sendableValuesBucket = sendableRelationalStore.toSendableValuesBucket(valueBucket);
      try {
        rdbStore.insertSync("test1", sendableValuesBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        expect().assertFail();;
      } catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      try {
        rdbStore.batchInsert("test1", [valueBucket,valueBucket],(err, insertNum)=>{
          if (err) {
            console.error(`batchInsert is failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
          expect().assertFail();
        });
        expect().assertFail();;
      } catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      try {
        await rdbStore.batchInsert("test1", [valueBucket,valueBucket]);
        expect().assertFail();;
      } catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try {
        rdbStore.batchInsertSync("test1", [valueBucket,valueBucket]);
        expect().assertFail();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
      console.log(TAG + "************* testGetAssets0001 end *************");
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_0400
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0400
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      const valueBucket1: data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };

      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");
      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }

      try{
        rdbStore.update(valueBucket1, predicates,(err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info(`Updated row count: ${rows}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info(`Updated row count: ${rows}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.update(valueBucket1, predicates).then(async (rows: Number) => {
          console.info(`Updated row count: ${rows}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(async (rows: Number) => {
          console.info(`Updated row count: ${rows}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        let rows: Number = rdbStore.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.info(`Updated row count: ${rows}`);
        expect().assertFail();
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_0500
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0500
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");
      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }

      try{
        rdbStore.delete(predicates, (err, rows) => {
          if (err) {
            console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info(`Delete rows: ${rows}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.delete(predicates).then((rows: Number) => {
          console.info(`Delete rows: ${rows}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.delete(predicates).then((rows: Number) => {
          console.info(`Delete rows: ${rows}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        let rows: Number = rdbStore.deleteSync(predicates)
        console.info(`Delete rows: ${rows}`);
        expect().assertFail();
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_0600
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0600
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");
      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }

      try{
        rdbStore.query(predicates, (err, resultSet) => {
          if (err) {
            console.error(`Query failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.query(predicates, ["id", "name", "age", "salary", "blobType"], (err, resultSet) => {
          if (err) {
            console.error(`Query failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.query(predicates, ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.query(predicates).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        let resultSet: data_relationalStore.ResultSet = rdbStore.querySync(predicates, ["id", "name", "age", "salary", "blobType"]);
        console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      try{
        let resultSet: data_relationalStore.ResultSet = rdbStore.querySync(predicates);
        console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect().assertFail();
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.querySql("SELECT * FROM test1 WHERE NAME = 'zhangsan'", (err, resultSet) => {
          if (err) {
            console.error(`Query failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.querySql("SELECT * FROM test1 WHERE NAME = ? ", ['zhangsan'], (err, resultSet) => {
          if (err) {
            console.error(`Query failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.querySql("SELECT * FROM test1 WHERE NAME = 'zhangsan'").then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.querySql("SELECT * FROM test1 WHERE NAME = ? ", ['zhangsan'],).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        let resultSet: data_relationalStore.ResultSet = rdbStore.querySqlSync("SELECT * FROM test1 WHERE NAME = 'zhangsan'");
        console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect().assertFail();
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.lockRow(predicates).then(() => {
          console.info(`Lock success`);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`Lock failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.lockRow(predicates).then(() => {
          console.info(`Lock success`);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`Lock failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.unlockRow(predicates).then(() => {
          console.info(`Lock success`);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`Lock failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.queryLockedRow(predicates,  ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`Lock success`);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`Lock failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_0700
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0700
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");
      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }
      let PRIKey = [1, 4, 2, 3];

      try{
        rdbStore.getModifyTime("test1", "NAME", PRIKey, (err, modifyTime: data_relationalStore.ModifyTime) => {
          if (err) {
            console.error(`getModifyTime failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          expect().assertFail();
        });
        expect().assertFail();
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.getModifyTime("test1", "NAME", PRIKey)
          .then((modifyTime: data_relationalStore.ModifyTime) => {
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`getModifyTime failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          });
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.cleanDirtyData('test1', 10, (err) => {
          if (err) {
            console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info('clean dirty data succeeded');
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.cleanDirtyData('test1', (err) => {
          if (err) {
            console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info('clean dirty data succeeded');
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.cleanDirtyData('test1', 10).then(() => {
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.cleanDirtyData('test1').then(() => {
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })


    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_0800
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0800
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }

      try{
        rdbStore.executeSql("DELETE FROM test1 WHERE name = 'zhangsan'", (err) => {
          if (err) {
            console.error(`ExecuteSql failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info('Delete table done.');
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.executeSql("DELETE FROM test WHERE name = ?", ['zhangsan'], (err) => {
          if (err) {
            console.error(`ExecuteSql failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.executeSql("DELETE FROM test1 WHERE name = 'zhangsan'").then(() => {
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.executeSql("DELETE FROM test1 WHERE name = ?", ['zhangsan']).then(() => {
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.execute('select * FROM test1').then((data) => {
          console.info(`check result: ${data}`);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`check failed, code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.execute("DELETE FROM TEST WHERE age = ? OR age = ?", ["18", "20"])
          .then(() => {
            expect().assertFail();
          })
          .catch((err: BusinessError) => {
            console.error(`execute sql failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          });
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.beginTrans().then((txId : number) => {
          (rdbStore as data_relationalStore.RdbStore).execute("DELETE FROM TEST WHERE age = ? OR age = ?", txId, ["18", "20"])
            .then(() => {
              (rdbStore as data_relationalStore.RdbStore).commit(txId);
              expect().assertFail();
            })
            .catch((err: BusinessError) => {
              (rdbStore as data_relationalStore.RdbStore).rollback(txId);
              console.error(`execute sql failed, code is ${err.code},message is ${err.message}`);
              expect().assertFail();
            });
        });
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.executeSync("select * from test1")
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })


    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_0900
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0900
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      const u8 = new Uint8Array([1, 2, 3]);
      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }

      try{
        rdbStore.beginTransaction();
        expect().assertFail();
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.beginTrans().then((txId : number) => {
          expect().assertFail();
        });
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.commit();
        expect().assertFail();
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }


      try{
        rdbStore.rollBack();
        expect().assertFail();
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_1000
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1000
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);

      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }

      try{
        rdbStore.backup("TransactionTest.db", (err) => {
          if (err) {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info('Backup success.');
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.backup("TransactionTest.db").then(() => {
          console.info('Backup success.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.restore("TransactionTest.db", (err) => {
          if (err) {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info('Backup success.');
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.restore("TransactionTest.db").then(() => {
          console.info('Backup success.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_1100
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1100
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);

      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }

      try{
        rdbStore.setDistributedTables(["test1"], (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info('SetDistributedTables successfully.');
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.setDistributedTables(["test1"]).then(() => {
          console.info('SetDistributedTables successfully.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.setDistributedTables(["test1"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, (err) => {
          if (err) {
            console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info('SetDistributedTables successfully.');
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.setDistributedTables(["test1"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD).then(() => {
          console.info('SetDistributedTables successfully.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.setDistributedTables(["test1"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, {
          autoSync: true
        }).then(() => {
          console.info('SetDistributedTables successfully.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`SetDistributedTables failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })


    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_1200
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1200
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      try {
        dmInstance = distributedDeviceManager.createDeviceManager("com.example.appdatamgrverify");
        let devices = dmInstance.getAvailableDeviceListSync();
        deviceId = devices[0].networkId;
      } catch (err) {
        let code = (err as BusinessError).code;
        let message = (err as BusinessError).message
        console.error("createDeviceManager errCode:" + code + ",errMessage:" + message);
      }

      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }

      try{
        rdbStore.obtainDistributedTableName(deviceId, "test1", (err, tableName) => {
          if (err) {
            console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }


      try{
        rdbStore.obtainDistributedTableName(deviceId, "EMPLOYEE").then((tableName: string) => {
          console.info(`ObtainDistributedTableName successfully, tableName= ${tableName}`);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }
      let deviceIds: Array<string> = [];
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.inDevices(deviceIds);
      try{
        rdbStore.sync(data_relationalStore.SyncMode.SYNC_MODE_PUSH, predicates, (err, result) => {
          if (err) {
            console.error(`Sync failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.sync(data_relationalStore.SyncMode.SYNC_MODE_PUSH, predicates).then((result: Object[][]) => {
          console.info('Sync done.');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`Sync failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, (progressDetails) => {
          console.info(`Progess: ${progressDetails}`);
          expect().assertFail();
        }, (err) => {
          if (err) {
            console.error(`Cloud sync failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info('Cloud sync succeeded');
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, (progressDetail: data_relationalStore.ProgressDetails) => {
          console.info(`progress: ${progressDetail}`);
          expect().assertFail();
        }).then(() => {
          console.info('Cloud sync succeeded');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`cloudSync failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, ["test1"], (progressDetail: data_relationalStore.ProgressDetails) => {
          console.info(`Progess: ${progressDetail}`);
          expect().assertFail();
        }, (err) => {
          if (err) {
            console.error(`Cloud sync failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          }
          console.info('Cloud sync succeeded');
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.cloudSync(data_relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, ["test1"], (progressDetail: data_relationalStore.ProgressDetails) => {
          console.info(`progress: ${progressDetail}`);
          expect().assertFail();
        }).then(() => {
          console.info('Cloud sync succeeded');
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`cloudSync failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.remoteQuery(deviceId, "test1", predicates, ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          resultSet.close();
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`Failed to remoteQuery, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014")
      }

      try{
        rdbStore.remoteQuery(deviceId, "test1", predicates, ["id", "name", "age", "salary", "blobType"], (err, data) => {
          if(err != null){
            console.info(TAG + "Remote query error" + err);
            expect().assertFail();
          }else{
            console.info(TAG + "Remote query success")
            expect().assertFail();
          }
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("14800014");
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_1300
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);

      try {
        await rdbStore.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }

      try {
        rdbStore.on('dataChange', data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE, (devices: Array<string>) => {
          expect().assertFail();
        })
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.on('dataChange', data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE, (devices: Array<data_relationalStore.ChangeInfo>) => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.on('dataChange', data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE, () => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.on('storeObserver', false, () => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.on('autoSyncProgress', (progressDetail: data_relationalStore.ProgressDetails) => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.on('statistics', (sqlExecutionInfo: data_relationalStore.SqlExecutionInfo) => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.off('dataChange', data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE, (devices: Array<string>) => {
          expect().assertFail();
        })
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.off('dataChange', data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE, (devices: Array<data_relationalStore.ChangeInfo>) => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.off('dataChange', data_relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE, () => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.off('storeObserver', false, () => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.off('autoSyncProgress', (progressDetail: data_relationalStore.ProgressDetails) => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.off('statistics', (sqlExecutionInfo: data_relationalStore.SqlExecutionInfo) => {
          expect().assertFail();
        });
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.emit('storeObserver');
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      const dbPath = context.databaseDir+"/rdb/TransactionTest.db";
      try {
        rdbStore.attach(dbPath, "attachDB").then((number: number) => {
          console.info('attach succeeded');
          expect().assertFail();
        }).catch ((err: BusinessError) => {
          console.error(`attach failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.attach(context, STORE_CONFIG1, "attachDB").then((number: number) => {
          console.info(`attach succeeded, number is ${number}`);
          expect().assertFail();
        }).catch ((err: BusinessError) => {
          console.error(`attach failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }

      try {
        rdbStore.detach("attachDB").then((number: number) => {
          console.info(`attach succeeded, number is ${number}`);
          expect().assertFail();
        }).catch ((err: BusinessError) => {
          console.error(`attach failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
        expect().assertFail();
      } catch (err) {
        console.log(TAG + "err.code:" + err.code );
        expect(err.code).assertEqual("14800014");
      }
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_1400
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1400
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      rdbStore.beginTrans().then((txId : number) => {
        (rdbStore as data_relationalStore.RdbStore).execute("DELETE FROM TEST WHERE age = ? OR age = ?", txId, ["18", "20"])
          .then(async () => {
            try {
              await (rdbStore as data_relationalStore.RdbStore).close();
              console.info(`${TAG} close succeeded`);
            } catch (err) {
              console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
            }

            try {
              (rdbStore as data_relationalStore.RdbStore).commit(txId);
              expect().assertFail();
            }catch (e) {
              console.log(TAG + "e.code:" + e.code );
              expect(e.code).assertEqual("14800014")
            }
          })
          .catch((err: BusinessError) => {
            (rdbStore as data_relationalStore.RdbStore).rollback(txId);
            console.error(`execute sql failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          });
      });

      rdbStore.beginTrans().then((txId : number) => {
        (rdbStore as data_relationalStore.RdbStore).execute("DELETE FROM TEST WHERE age = ? OR age = ?", txId, ["18", "20"])
          .then(async () => {
            try {
              await (rdbStore as data_relationalStore.RdbStore).close();
              console.info(`${TAG} close succeeded`);
            } catch (err) {
              console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
            }

            try {
              (rdbStore as data_relationalStore.RdbStore).rollback(txId);
              expect().assertFail();
            }catch (e) {
              console.log(TAG + "e.code:" + e.code );
              expect(e.code).assertEqual("14800014")
            }
          })
          .catch((err: BusinessError) => {
            (rdbStore as data_relationalStore.RdbStore).rollback(txId);
            console.error(`execute sql failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          });
      });

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_1500
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1500
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      try {
        await (rdbStore as data_relationalStore.RdbStore).close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }
      try {
        rdbStore.createTransaction().then((transaction: data_relationalStore.Transaction) => {
          console.info(`createTransaction success`);
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.error(`createTransaction failed, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        });
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("14800014")
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_1600
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1600
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array(Array(2).fill(1));
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };

      let options:data_relationalStore.TransactionOptions = {
        transactionType:data_relationalStore.TransactionType.IMMEDIATE
      }
      const rdbTrans = await rdbStore.createTransaction(options);

      try{
        rdbTrans.commit();
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800014)
      }

      try{
        rdbTrans.rollback();
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800014)
      }

      try{
        rdbTrans.insert("test1", valueBucket).then(()=>{
          rdbTrans.rollback();
        })
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }

      try{
        rdbTrans.insert("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(()=>{
          rdbTrans.rollback();
        })
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }

      try{
        rdbTrans.insertSync("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        rdbTrans.rollback();
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }

      let valueBuckets = new Array(valueBucket, valueBucket, valueBucket);
      try{
        rdbTrans.batchInsert("test1", valueBuckets).then(()=>{
          rdbTrans.rollback();
        })
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }

      try{
        rdbTrans.batchInsertSync("test1", valueBuckets)
        rdbTrans.rollback();
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name      : testSUBDistributedDataRDBSDKErrorCode14800014_1700
     * @tc.number    : SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1700
     * @tc.desc      : Verify the properties of the text type
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array(Array(2).fill(1));
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      const valueBucket1:data_relationalStore.ValuesBucket = {
        "name": "lisi",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let options:data_relationalStore.TransactionOptions = {
        transactionType:data_relationalStore.TransactionType.IMMEDIATE
      }
      const rdbTrans = await rdbStore.createTransaction(options);
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.equalTo("NAME", "lisi");
      try{
        rdbTrans.update(valueBucket1, predicates).then(()=>{
          rdbTrans.rollback();
        })
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }

      try{
        rdbTrans.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        rdbTrans.rollback();
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }

      try{
        rdbTrans.delete(predicates).then(()=>{
          rdbTrans.rollback();
        })
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }

      try{
        rdbTrans.deleteSync(predicates);
        rdbTrans.rollback();
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }

      try{
        rdbTrans.query(predicates, ["id", "name", "age", "salary"]).then(()=>{
          rdbTrans.rollback();
        })
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }
      try{
        rdbTrans.querySync(predicates, ["id", "name", "age", "salary"]);
        rdbTrans.rollback();
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }
      try{
        rdbTrans.querySql("SELECT * FROM test1").then(()=> {
          rdbTrans.rollback();
        })
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }
      try{
        rdbTrans.querySqlSync("SELECT * FROM test1");
        rdbTrans.rollback();
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }
      try{
        rdbTrans.execute("SELECT * FROM test1").then(() => {
          rdbTrans.rollback();
        });
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }
      try{
        rdbTrans.executeSync("SELECT * FROM test1");
        rdbTrans.rollback();
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800014)
      }
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

  })
}