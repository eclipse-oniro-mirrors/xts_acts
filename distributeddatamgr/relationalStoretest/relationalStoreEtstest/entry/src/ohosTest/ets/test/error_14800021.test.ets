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

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context =  delegator.getAppContext().getApplicationContext();
const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 asset, " + "data2 asset, " + "data3 assets )";

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

export default function error14800021Test() {
  describe('error14800021Test', () => {
    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);

      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }
      rdbStore1.beginTransaction();
      try{
        rdbStore1.batchInsert("test1", [valueBucket, valueBucket], ()=>{
          rdbStore1.rollBack();
        });
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      rdbStore1.commit();
      rdbStore1.beginTransaction();
      try{
        await rdbStore1.batchInsert("test1", [valueBucket, valueBucket]);
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      rdbStore1.commit();
      rdbStore1.beginTransaction();
      try{
        await rdbStore1.batchInsertSync("test1", [valueBucket, valueBucket]);
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      rdbStore1.commit();
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
      }

      rdbStore1.beginTransaction();
      try{
        let PRIKey = [1, 4, 2, 3];
        rdbStore1.getModifyTime("test1", "NAME", PRIKey, (err, modifyTime: data_relationalStore.ModifyTime) => {
        })
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      rdbStore1.commit();

      rdbStore1.beginTransaction();
      try{
        let PRIKey = [1, 4, 2, 3];
        rdbStore1.getModifyTime("test1", "NAME", PRIKey).then(()=>{

        })
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      rdbStore1.commit();

      rdbStore1.beginTransaction();
      try{
        rdbStore1.cleanDirtyData('test1', 10, (err) => {
          if (err) {
            console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
          }
          console.info('clean dirty data succeeded');
        })
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      rdbStore1.commit();

      rdbStore1.beginTransaction();
      try{
        rdbStore1.cleanDirtyData('test1', (err) => {
          if (err) {
            console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
          }
          console.info('clean dirty data succeeded');
        })
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      rdbStore1.commit();

      rdbStore1.beginTransaction();
      try{
        rdbStore1.cleanDirtyData('test1').then(()=>{
        })
      } catch (err) {
        console.info(TAG, `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
        expect(err.code).assertEqual(14800021);
      }
      rdbStore1.commit();
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      const u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket= {
        "name": "zhangsan",
        "age": 20,
        "salary": 220.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);

      try {
        await rdbStore.executeSql("select * FROM test WHERE name = 'zhangsan'")
        expect().assertFail();
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        rdbStore.executeSql("select * FROM test WHERE name = 'zhangsan'", (err) => {
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }
      try {
        rdbStore.executeSql("select * FROM test WHERE name = ?",  ['zhangsan'], (err) => {
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        rdbStore.beginTransaction();
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }
      try {
        rdbStore.beginTrans().then(()=>{
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }
      rdbStore.beginTransaction();
      (rdbStore as data_relationalStore.RdbStore).insert("test", valueBucket);
      try {
        (rdbStore as data_relationalStore.RdbStore).commit();
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        (rdbStore as data_relationalStore.RdbStore).rollBack();
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }


      rdbStore.beginTrans().then((txId : number) => {
        (rdbStore as data_relationalStore.RdbStore).execute("select * FROM test", txId)
          .then(() => {
            try {
            (rdbStore as data_relationalStore.RdbStore).commit(txId);
            } catch (err) {
              expect(err.code).assertEqual(14800021);
            }
          })
          .catch((err: BusinessError) => {
            (rdbStore as data_relationalStore.RdbStore).rollback(txId)
            console.error(`execute sql failed, code is ${err.code},message is ${err.message}`);
          });
      })


      rdbStore.beginTrans().then((txId : number) => {
        (rdbStore as data_relationalStore.RdbStore).execute("select * FROM test", txId)
          .then(() => {
            try {
            (rdbStore as data_relationalStore.RdbStore).rollback(txId);
            } catch (err) {
              expect(err.code).assertEqual(14800021);
            }
          })
          .catch((err: BusinessError) => {
            (rdbStore as data_relationalStore.RdbStore).rollback(txId)
            console.error(`execute sql failed, code is ${err.code},message is ${err.message}`);
          });
      })

      try {
        rdbStore.backup("TransactionTest.db", (err) => {
          if (err) {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
          }
          console.info('Backup success.');
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        rdbStore.backup("TransactionTest.db").then(() => {
          console.info('Backup success.');
        }).catch((err: BusinessError) => {
          console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      try {
        let promiseBackup = (rdbStore as data_relationalStore.RdbStore).backup("TransactionTest.db");
        promiseBackup.then(() => {
          console.info('Backup success.');
        }).catch((err: BusinessError) => {
          console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        (rdbStore as data_relationalStore.RdbStore).restore("TransactionTest.db", (err) => {
          if (err) {
            console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
          }
          console.info('Restore success.');
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        let promiseRestore = (rdbStore as data_relationalStore.RdbStore).restore("TransactionTest.db");
        promiseRestore.then(() => {
          console.info('Restore success.');
        }).catch((err: BusinessError) => {
          console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }
      const dbPath = context.databaseDir+"/rdb/TransactionTest.db";
      try {
        rdbStore.attach(dbPath, "attachDB").then((number: number) => {
          console.info('attach succeeded');
        }).catch ((err: BusinessError) => {
          console.error(`attach failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }
      await rdbStore.executeSql("DROP TABLE IF EXISTS test1", null);
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0500
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0500
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array(Array(2).fill(1));
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      predicates.equalTo("NAME", "zhangsan");

      try {
        rdbStore.lockRow(predicates).then(() => {
          console.info(`Lock success`);
        }).catch((err: BusinessError) => {
          console.error(`Lock failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        rdbStore.unlockRow(predicates).then(() => {
          console.info(`Unlock success`);
        }).catch((err: BusinessError) => {
          console.error(`Unlock failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        rdbStore.queryLockedRow(predicates, ["id", "name", "age", "salary"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          // 释放数据集的内存，若不释放可能会引起fd泄露与内存泄露
          resultSet.close();
        }).catch((err: BusinessError) => {
          console.error(`Query failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }
      let predicates1 = await new data_relationalStore.RdbPredicates("test1");
      let resultSet:data_relationalStore.ResultSet = await rdbStore.query(predicates1);

      try {
        resultSet.getRows(resultSet.columnCount);
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0600
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0600
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
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
      let predicates = await new data_relationalStore.RdbPredicates("test");
      let resultSet:data_relationalStore.ResultSet = await rdbStore.query(predicates);
      try {
        (resultSet as data_relationalStore.ResultSet).isColumnNull((resultSet as data_relationalStore.ResultSet).getColumnIndex("data3"));
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800012");
      }

      try {
        resultSet.getSendableRow();
      } catch (e) {
        console.log(TAG + "e.code:" + e.code);
        expect(e.code).assertEqual("14800012");
      }
      resultSet.close();
      await rdbStore.close();
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "Asset.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
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
        transactionType:data_relationalStore.TransactionType.EXCLUSIVE
      }
      const rdbTrans = await rdbStore.createTransaction(options);

      try{
        rdbTrans.insert("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(()=>{
          rdbTrans.rollback();
        })
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }

      try{
        rdbTrans.insertSync("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }

      let valueBuckets = new Array(valueBucket, valueBucket, valueBucket);
      try{
        rdbTrans.batchInsert("test1", valueBuckets).then(()=>{
          rdbTrans.rollback();
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }

      try{
        rdbTrans.batchInsertSync("test1", valueBuckets)
        rdbTrans.rollback();
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }
      await rdbStore.executeSql("DROP TABLE IF EXISTS test1", null);
      await rdbStore.close();
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql("DROP TABLE IF EXISTS test1", null);
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
        transactionType:data_relationalStore.TransactionType.EXCLUSIVE
      }
      const rdbTrans = await rdbStore.createTransaction(options);
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.equalTo("NAME", "lisi");

      try{
        rdbTrans.delete(predicates).then(()=>{
          rdbTrans.rollback();
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }

      try{
        rdbTrans.deleteSync(predicates);
        console.log(`${TAG} close failed, code is00000000000000000000000000000000`);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }
      await rdbStore.executeSql("DROP TABLE IF EXISTS test1", null);
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0900
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0900
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      try {
        rdbStore.attach(context, STORE_CONFIG1, "attachDB").then((number: number) => {
          console.info(`attach succeeded, number is ${number}`);
        }).catch ((err: BusinessError) => {
          console.error(`attach failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        rdbStore.detach("attachDB").then((number: number) => {
          console.info(`detach succeeded, number is ${number}`);
        }).catch ((err: BusinessError) => {
          console.error(`detach failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }

      try {
        rdbStore.detach("attachDB").then((number: number) => {
          console.info(`detach succeeded, number is ${number}`);
        }).catch ((err: BusinessError) => {
          console.error(`detach failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800021);
      }
      await rdbStore.executeSql("DROP TABLE IF EXISTS test1", null);
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
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
        rdbTrans.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(()=>{
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual(14800021)
      }

      try{
        rdbTrans.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
        rdbTrans.rollback();
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
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
        rdbTrans.querySql("SELECT * FROM test1").then(()=> {
          rdbTrans.rollback();
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021);
      }

      try{
        rdbTrans.querySqlSync("SELECT * FROM test1");
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }

      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0800
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0800
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array(Array(2).fill(1));
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let options:data_relationalStore.TransactionOptions = {
        transactionType:data_relationalStore.TransactionType.DEFERRED
      }
      const rdbTrans = await rdbStore.createTransaction(options);
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.equalTo("NAME", "lisi");
      try{
        rdbTrans.query(predicates, ["id", "name", "age", "salary", "blobType"]).then(()=>{
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }

      try{
        rdbTrans.querySync(predicates, ["id", "name", "age", "salary", "blobType"]);
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        rdbTrans.rollback();
        expect(err.code).assertEqual(14800021)
      }

      await rdbStore.executeSql("DROP TABLE IF EXISTS test1", null);
      rdbStore.close();
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      const SQL_DELETE_TABLE = 'DELETE FROM test1';

      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      ( rdbStore as data_relationalStore.RdbStore).createTransaction().then((transaction: data_relationalStore.Transaction) => {

        try {
          let data = (transaction as data_relationalStore.Transaction).executeSync(SQL_DELETE_TABLE);
          transaction.commit();
          console.info(`delete result: ${data}`);
        } catch (err) {
          transaction.rollback();
          console.error(`delete failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(14800021)
        };
      }).catch((err: BusinessError) => {
        console.error(`createTransaction failed, code is ${err.code},message is ${err.message}`);
      })

      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      (rdbStore as data_relationalStore.RdbStore).createTransaction().then((transaction: data_relationalStore.Transaction) => {
        try{
          transaction.execute(SQL_DELETE_TABLE).then((data) => {
            transaction.commit();
            console.info(`delete result: ${data}`);
          }).catch((e: BusinessError) => {
            transaction.rollback();
            console.error(`delete failed, code is ${e.code}, message is ${e.message}`);
          });
        } catch (err) {
          transaction.rollback();
          console.error(`delete failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(14800021)
        };
      }).catch((err: BusinessError) => {
        console.error(`createTransaction failed, code is ${err.code},message is ${err.message}`);
      });



      await rdbStore.executeSql("DROP TABLE IF EXISTS test1", null);
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

  })
}