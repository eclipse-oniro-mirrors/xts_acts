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
const TAG = "[RdbStoreParamErrorTest]";
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

export default function RdbStoreParamErrorTest() {
  describe('RdbStoreParamErrorTest', () => {

    /**
     * @tc.name   testRdbStoreObtainDistributedTableNameParamErr0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_3000
     * @tc.desc   ObtainDistributedTableName callback with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreObtainDistributedTableNameParamErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurredErrTest0001 start *************");
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      try{
          rdbStore.obtainDistributedTableName(null, "test1", (err, tableName) => {
            if (err) {
              console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
              expect().assertFail();
            }
            expect().assertFail()
            done();
          })
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401");
          done();
        }

      try{
        rdbStore.obtainDistributedTableName(undefined, "test1", (err, tableName) => {
            if (err) {
              console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
              expect().assertFail();
            }
            expect().assertFail()
            done();
          })
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401");
          done();
        }
      try{
        rdbStore.obtainDistributedTableName("", "test1", (err, tableName) => {
            if (err) {
              console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
              expect().assertFail();
            }
            expect().assertFail()
            done();
          })
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
         expect(e.code).assertEqual("401");
          done();
        }  
      console.log(TAG + "************* testRdbStoreObtainDistributedTableNameParamErr0001 end *************");
    })

    /**
     * @tc.name   testRdbStoreObtainDistributedTableNameParamErr0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_3100
     * @tc.desc   ObtainDistributedTableName callback with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreObtainDistributedTableNameParamErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log(TAG + "************* testRdbStoreOnsqliteErrorOccurredErrTest0001 start *************");
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
        try{
            rdbStore.obtainDistributedTableName(deviceId, null, (err, tableName) => {
              if (err) {
                console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
              }
              expect().assertFail()
              done();
            })
          }catch (e) {
            console.log(TAG + "e.code:" + e.code );
           expect(e.code).assertEqual("401");
            done();
          }
        try{
          rdbStore.obtainDistributedTableName(deviceId, "", (err, tableName) => {
              if (err) {
                console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
              }
              expect().assertFail()
              done();
            })
          }catch (e) {
            console.log(TAG + "e.code:" + e.code );
            expect(e.code).assertEqual("401");
            done();
          }
        try{
          rdbStore.obtainDistributedTableName(deviceId, undefined, (err, tableName) => {
              if (err) {
                console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
                expect().assertFail();
              }
              expect().assertFail()
              done();
            })
          }catch (e) {
            console.log(TAG + "e.code:" + e.code );
            expect(e.code).assertEqual("401");
            done();
          }  
      console.log(TAG + "************* testRdbStoreObtainDistributedTableNameParamErr0002 end *************");
    })

    /**
     * @tc.name   testRdbStoreObtainDistributedTableNameParamErr0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_3200
     * @tc.desc   ObtainDistributedTableName promise with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreObtainDistributedTableNameParamErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log(TAG + "************* testRdbStoreObtainDistributedTableNameParamErr0003 start *************");
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
        try{
          rdbStore.obtainDistributedTableName(null, "EMPLOYEE").then((tableName: string) => {
            console.info(`ObtainDistributedTableName successfully, tableName= ${tableName}`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          })
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
         expect(e.code).assertEqual("401");
          done();
        }

         try{
          rdbStore.obtainDistributedTableName(undefined, "EMPLOYEE").then((tableName: string) => {
            console.info(`ObtainDistributedTableName successfully, tableName= ${tableName}`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          })
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
         expect(e.code).assertEqual("401");
          done();
        }

         try{
          rdbStore.obtainDistributedTableName("", "EMPLOYEE").then((tableName: string) => {
            console.info(`ObtainDistributedTableName successfully, tableName= ${tableName}`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          })
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401");
          done();
        }
      console.log(TAG + "************* testRdbStoreObtainDistributedTableNameParamErr0003 end *************");
    })

    /**
     * @tc.name   testRdbStoreObtainDistributedTableNameParamErr0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_onSqliteErrorOccurredJsAPITest_3300
     * @tc.desc   ObtainDistributedTableName promise with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbStoreObtainDistributedTableNameParamErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log(TAG + "************* testRdbStoreObtainDistributedTableNameParamErr0004 start *************");
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
        try{
           rdbStore.obtainDistributedTableName(deviceId, "").then((tableName: string) => {
            console.info(`ObtainDistributedTableName successfully, tableName= ${tableName}`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          })
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401");
          done();
        }
        try{
           rdbStore.obtainDistributedTableName(deviceId, null).then((tableName: string) => {
            console.info(`ObtainDistributedTableName successfully, tableName= ${tableName}`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          })
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401");
          done();
        }
        try{
           rdbStore.obtainDistributedTableName(deviceId, undefined).then((tableName: string) => {
            console.info(`ObtainDistributedTableName successfully, tableName= ${tableName}`);
            expect().assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
            done();
          })
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401");
          done();
        }
      console.log(TAG + "************* testRdbStoreObtainDistributedTableNameParamErr0004 end *************");
    })
     /**
     * @tc.name   SUB_DistributedData_RelationalStore_remoteQuery_ResultSet_0100
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ResultSet_0100
     * @tc.desc   Test remoteQuery callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ResultSet_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
        let bigU8 = new Uint8Array(Array(1024 * 1024 * 2).fill(1));
        const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 30,
        "salary": 100.5,
        "blobType": bigU8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      try{
        rdbStore.remoteQuery(deviceId, "test1", predicates, ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(true).assertEqual(resultSet.goToFirstRow());
        const data1 = resultSet.getString(resultSet.getColumnIndex("name"));
        const data2 = resultSet.getLong(resultSet.getColumnIndex("age"));
        const data3 = resultSet.getDouble(resultSet.getColumnIndex("salary"));
        const data4 = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
        expect("zhangsan").assertEqual(data1);
        expect(30).assertEqual(data2);
        expect(100.5).assertEqual(data3);
         
        }).catch((err: BusinessError) => {
          console.error(`Failed to remoteQuery, code is ${err.code},message is ${err.message}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("401");
      }

      try{
        rdbStore.remoteQuery(deviceId, "test1", predicates, ["id", "name", "age", "salary", "blobType"], (err, resultSet) => {
          if(err != null){
            console.info(TAG + "Remote query error" + err);
            expect().assertFail();
          }else{
             expect(true).assertEqual(resultSet.goToFirstRow());
            const data1 = resultSet.getString(resultSet.getColumnIndex("name"));
            const data2 = resultSet.getLong(resultSet.getColumnIndex("age"));
            const data3 = resultSet.getDouble(resultSet.getColumnIndex("salary"));
            const data4 = resultSet.getBlob(resultSet.getColumnIndex("blobType"));
            expect("zhangsan").assertEqual(data1);
            expect(30).assertEqual(data2);
            expect(100.5).assertEqual(data3);
       
          }
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("401");
      }
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_queryErrTest_0100
     * @tc.number SUB_DistributedData_RDB_SDK_queryErrTest_0100
     * @tc.desc   the query with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_queryErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_queryErrTest_0100 start-----")
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.equalTo("NAME", "lisi");
    
      try{
        let resultSet = rdbStore.query(predicates, []).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount).assertEqual(5);
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
      }
      try{
        let resultSet = await rdbStore.query(predicates, null)
        expect(typeof(resultSet) === "object").assertTrue();

      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
      }
      try{
        let resultSet = await rdbStore.query(predicates, undefined)
        expect(typeof(resultSet) === "object").assertTrue();
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
      }

      try{
        rdbStore.query(predicates, ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(typeof(resultSet) === "object").assertTrue()
          expect(5).assertEqual(resultSet.columnCount)
  
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
      }
      rdbStore = undefined;
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_queryErrTest_0100 end-----")

    })

     /**
     * @tc.name   SUB_DistributedData_RDB_SDK_queryErrTest_0200
     * @tc.number SUB_DistributedData_RDB_SDK_queryErrTest_0200
     * @tc.desc   the query with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_DistributedData_RDB_SDK_queryErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_queryErrTest_0200 start-----")
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.equalTo("NAME", "lisi");
    
      try{
        rdbStore.query(null, ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      try{
        rdbStore.query(undefined,  ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_queryErrTest_0200 start-----")
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_querySyncErrTest_0100
     * @tc.number SUB_DistributedData_RDB_SDK_querySyncErrTest_0100
     * @tc.desc   the querySync with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_querySyncErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySyncErrTest_0100 start-----")
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.equalTo("NAME", "lisi");
    
      try{
        rdbStore.query(null, ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail()
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      try{
        rdbStore.query(undefined,  ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect(err.code).assertEqual("401")
      }
      try{
        rdbStore.query(predicates,  ["id", "name", "age", "salary", "blobType"]).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount).assertEqual(5)
          expect(typeof(resultSet) === "object").assertTrue()
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail()
      }
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySyncErrTest_0100 start-----")
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_querySyncErrTest_0200
     * @tc.number SUB_DistributedData_RDB_SDK_querySyncErrTest_0200
     * @tc.desc   the querySync with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_querySyncErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySyncErrTest_0200 start-----")
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.equalTo("NAME", "lisi");
    
      try{
        rdbStore.query(predicates, []).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount).assertEqual(5);
        })
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      try{
        let resultSet = await rdbStore.query(predicates,  null)
        expect(typeof(resultSet) === "object").assertTrue()

      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      try{
        let resultSet = await rdbStore.query(predicates,  undefined)
        expect(typeof(resultSet) === "object").assertTrue()
     
      }catch(err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        expect().assertFail();
      }
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySyncErrTest_0200 start-----")
    })



     /**
     * @tc.name   SUB_DistributedData_RDB_SDK_querySqlErrTest_0100
     * @tc.number SUB_DistributedData_RDB_SDK_querySqlErrTest_0100
     * @tc.desc   the querySql with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
     it('SUB_DistributedData_RDB_SDK_querySqlErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySqlErrTest_0100 start-----")
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.equalTo("NAME", "lisi");
      try{
        rdbStore.querySql("SELECT * FROM test1 WHERE NAME = ? ", []).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(resultSet.columnCount).assertEqual(5);
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect().assertFail();
      }
      try{
        let resultSet = await rdbStore.querySql("SELECT * FROM test1 WHERE NAME = ? ", null)
        expect(typeof(resultSet) === "object").assertTrue()
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("401")
      }
      try{
        let resultSet = await rdbStore.querySql("SELECT * FROM test1 WHERE NAME = ? ", undefined)
        expect(typeof(resultSet) === "object").assertTrue()
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect().assertFail();
      }
      try{
        rdbStore.querySql("SELECT * FROM test1 WHERE NAME = ? ", ["zhangsan"],).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(5).assertEqual(resultSet.columnCount)
          
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect().assertFail();
      }
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySqlErrTest_0100 start-----")
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_querySqlErrTest_0200
     * @tc.number SUB_DistributedData_RDB_SDK_querySqlErrTest_0200
     * @tc.desc   the querySql with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_querySqlErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySqlErrTest_0200 start-----")
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      let u8 = new Uint8Array([1, 2, 3]);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await rdbStore.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates('test1');
      predicates.equalTo("NAME", "lisi");
    
      try{
        rdbStore.querySql("", ["zhangsan"],).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("401")
      }
      try{
        rdbStore.querySql(undefined, ["zhangsan"],).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("401")
      }
      try{
        rdbStore.querySql(null, ["zhangsan"],).then((resultSet: data_relationalStore.ResultSet) => {
          console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect().assertFail();
        })
      }catch (e) {
        console.log(TAG + "e.code:" + e.code );
        expect(e.code).assertEqual("401")
      }
      console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySqlErrTest_0200 start-----")
    })


      /**
     * @tc.name   SUB_DistributedData_RDB_SDK_querySqlSyncErrTest_0100
     * @tc.number SUB_DistributedData_RDB_SDK_querySqlSyncErrTest_0100
     * @tc.desc   the querySqlSync with null or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
      it('SUB_DistributedData_RDB_SDK_querySqlSyncErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySqlSyncErrTest_0100 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
        try{
         let  resultSet = await rdbStore.querySqlSync("SELECT * FROM test1 WHERE NAME = ? ", [])
         expect(resultSet.columnCount).assertEqual(5);
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect().assertFail();
        }
        try{
          let resultSet = await rdbStore.querySqlSync("SELECT * FROM test1 WHERE NAME = ? ", null)
          expect(typeof(resultSet) === "object").assertTrue()
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401")
        }
        try{
            let resultSet = await rdbStore.querySqlSync("SELECT * FROM test1 WHERE NAME = ? ", undefined)
            expect(typeof(resultSet) === "object").assertTrue()
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect().assertFail();
        }
        try{
            let resultSet = await rdbStore.querySqlSync("SELECT * FROM test1 WHERE NAME = ? ", ["zhangsan"])
            expect(5).assertEqual(resultSet.columnCount)
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect().assertFail();
        }
        console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySqlSyncErrTest_0100 start-----")
      })
  
      /**
       * @tc.name   SUB_DistributedData_RDB_SDK_querySqlErrTest_0300
       * @tc.number SUB_DistributedData_RDB_SDK_querySqlErrTest_0300
       * @tc.desc   the querySqlSync with null or undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL3
       */
      it('SUB_DistributedData_RDB_SDK_querySqlErrTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySqlErrTest_0300 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
        let u8 = new Uint8Array([1, 2, 3]);
        const valueBucket:data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 16,
          "salary": 100.5,
          "blobType": u8,
        };
        await rdbStore.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates('test1');
        predicates.equalTo("NAME", "lisi");
      
        try{
          await rdbStore.querySqlSync("", ["zhangsan"])
          expect().assertFail();
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401")
        }
        try{
            await rdbStore.querySqlSync(undefined, ["zhangsan"])
            expect().assertFail();
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401")
        }
        try{
            await rdbStore.querySqlSync(null, ["zhangsan"])
            expect().assertFail();
        }catch (e) {
          console.log(TAG + "e.code:" + e.code );
          expect(e.code).assertEqual("401")
        }
        console.info(TAG + "-----SUB_DistributedData_RDB_SDK_querySqlErrTest_0300 start-----")
      })
  


  })
}