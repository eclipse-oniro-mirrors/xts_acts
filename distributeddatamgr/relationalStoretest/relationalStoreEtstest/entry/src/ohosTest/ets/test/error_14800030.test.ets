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

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context =  delegator.getAppContext().getApplicationContext();

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG1:data_relationalStore.StoreConfig = {
  name: "TransactionTest.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

export default function error14800030Test() {
  describe('error14800030Test', () => {

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const DEST_STORE_NAME = "Dest.db";
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(
        context,
        {
          name: DEST_STORE_NAME,
          securityLevel: data_relationalStore.SecurityLevel.S3,
          encrypt:true
        }
      );
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };

      try {
        destDb.insert("test1", valueBucket, (err: BusinessError, rowId: number) => {
          if (err) {
            console.error(`Insert is failed, code is ${err.code},message is ${err.message}`);
          }
          console.info(`Insert is successful, rowId = ${rowId}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }


      try {
        await destDb.insert("test1", valueBucket);
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.insert("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE, (err: BusinessError, rowId: number) => {
          if (err) {
            console.error(`Insert is failed, code is ${err.code},message is ${err.message}`);
          }
          console.info(`Insert is successful, rowId = ${rowId}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        await destDb.insert("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE,);
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.insertSync("test1", valueBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      const sendableValuesBucket = sendableRelationalStore.toSendableValuesBucket(valueBucket);
      try {
        destDb.insertSync("test1", sendableValuesBucket, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.batchInsert("test1", [valueBucket, valueBucket], (err, insertNum) => {
          if (err) {
            console.error(`batchInsert is failed, code is ${err.code},message is ${err.message}`);
            return;
          }
          console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.batchInsert("test1", [valueBucket, valueBucket]).then((insertNum: number) => {
          console.info(`batchInsert is successful, the number of values that were inserted = ${insertNum}`);
        }).catch((err: BusinessError) => {
          console.error(`batchInsert is failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.batchInsertSync("test1", [valueBucket, valueBucket]);
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await data_relationalStore.deleteRdbStore(context, DEST_STORE_NAME);
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const DEST_STORE_NAME = "Dest.db";
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(
        context,
        {
          name: DEST_STORE_NAME,
          securityLevel: data_relationalStore.SecurityLevel.S3,
          encrypt:true
        }
      );
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
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
      await destDb.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates("EMPLOYEE");
      predicates.equalTo("NAME", "lisi");
      try {
        destDb.update(valueBucket1, predicates,(err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
          }
          console.info(`Updated row count: ${rows}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_NONE, (err, rows) => {
          if (err) {
            console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
          }
          console.info(`Updated row count: ${rows}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.update(valueBucket1, predicates).then(async (rows: Number) => {
          console.info(`Updated row count: ${rows}`);
        }).catch((err: BusinessError) => {
          console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(async (rows: Number) => {
          console.info(`Updated row count: ${rows}`);
        }).catch((err: BusinessError) => {
          console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.update(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE).then(async (rows: Number) => {
          console.info(`Updated row count: ${rows}`);
        }).catch((err: BusinessError) => {
          console.error(`Updated failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.delete(predicates, (err, rows) => {
          if (err) {
            console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
          }
          console.info(`Delete rows: ${rows}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await destDb.close();
      await data_relationalStore.deleteRdbStore(context, DEST_STORE_NAME);
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const DEST_STORE_NAME = "Dest.db";
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(
        context,
        {
          name: DEST_STORE_NAME,
          securityLevel: data_relationalStore.SecurityLevel.S3,
        }
      );
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
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
      await destDb.insert("test1", valueBucket);
      let predicates = new data_relationalStore.RdbPredicates("test1");
      predicates.equalTo("NAME", "lisi");


      try {
        destDb.updateSync(valueBucket1, predicates, data_relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.delete(predicates).then((rows: Number) => {
          console.info(`Delete rows: ${rows}`);
        }).catch((err: BusinessError) => {
          console.error(`Delete failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.deleteSync(predicates)
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }
      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await data_relationalStore.deleteRdbStore(context, DEST_STORE_NAME);
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const DEST_STORE_NAME = "Dest.db";
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(
        context,
        {
          name: DEST_STORE_NAME,
          securityLevel: data_relationalStore.SecurityLevel.S3,
        }
      );
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await destDb.insert("test1", valueBucket);

      let PRIKey = [1, 4, 2, 3];
      try {
        destDb.getModifyTime("test1", "NAME", PRIKey, (err, modifyTime: data_relationalStore.ModifyTime) => {
          if (err) {
            console.error(`getModifyTime failed, code is ${err.code},message is ${err.message}`);
          }
        });
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.getModifyTime("test1", "NAME", PRIKey)
          .then((modifyTime: data_relationalStore.ModifyTime) => {
          })
          .catch((err: BusinessError) => {
            console.error(`getModifyTime failed, code is ${err.code},message is ${err.message}`);
          });
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.cleanDirtyData('test1', 1, (err) => {
          if (err) {
            console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
          }
          console.info('clean dirty data succeeded');
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.cleanDirtyData('test1', (err) => {
          if (err) {
            console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
            return;
          }
          console.info('clean dirty data succeeded');
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.cleanDirtyData('test1', 10).then(() => {
          console.info('clean dirty data  succeeded');
        }).catch ((err: BusinessError) => {
          console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }
      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await destDb.close();
      await data_relationalStore.deleteRdbStore(context, DEST_STORE_NAME);
      done();
    })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0500
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0500
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const DEST_STORE_NAME = "Dest.db";
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await destDb.insert("test1", valueBucket);
      // try {
      //  await destDb.execute("select * from test1");
      // } catch (error) {
      //   console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
      //   expect(error.code).assertEqual(14800030);
      // }

      let txId : number;
      destDb.beginTrans().then((txId: number) => {
        try {
          (destDb as data_relationalStore.RdbStore).execute("select * from test1 where age = ?", txId,
            ["18"])
            .then(() => {
              (destDb as data_relationalStore.RdbStore).commit(txId);
            })
            .catch((err: BusinessError) => {
              (destDb as data_relationalStore.RdbStore).rollback(txId)
              console.error(`execute sql failed, code is ${err.code},message is ${err.message}`);
            });
        } catch (error) {
          console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
          expect(error.code).assertEqual(14800030);
        }
      })

      // try {
      //   destDb.executeSync("select * from test1");
      // } catch (error) {
      //   console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
      //   expect(error.code).assertEqual(14800030);
      // }
      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await destDb.close()
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0600
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0600
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const DEST_STORE_NAME = "Dest.db";
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(
        context,
        {
          name: DEST_STORE_NAME,
          securityLevel: data_relationalStore.SecurityLevel.S3,
        }
      );
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await destDb.insert("test1", valueBucket);
      try {
        destDb.beginTransaction();
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }
      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await data_relationalStore.deleteRdbStore(context, DEST_STORE_NAME);
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const DEST_STORE_NAME = "Dest.db";
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(
        context,
        {
          name: DEST_STORE_NAME,
          securityLevel: data_relationalStore.SecurityLevel.S3,
        }
      );
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      try {
        let txId : number;
        (destDb as data_relationalStore.RdbStore).beginTrans().then((txId : number) => {
        });
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }
      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await data_relationalStore.deleteRdbStore(context, DEST_STORE_NAME);
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const DEST_STORE_NAME = "Dest.db";
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(
        context,
        {
          name: DEST_STORE_NAME,
          securityLevel: data_relationalStore.SecurityLevel.S3,
        }
      );
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };

      destDb.beginTransaction();
      await destDb.insert("test1", valueBucket);
      try {
        destDb.rollBack();
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await data_relationalStore.deleteRdbStore(context, DEST_STORE_NAME);
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0800
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0800
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      const DEST_STORE_NAME = "Dest.db";
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(
        context,
        {
          name: DEST_STORE_NAME,
          securityLevel: data_relationalStore.SecurityLevel.S3,
        }
      );
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
      const valueBucket:data_relationalStore.ValuesBucket = {
        "name": "zhangsan",
        "age": 16,
        "salary": 100.5,
        "blobType": u8,
      };
      await destDb.insert("test1", valueBucket);
      // await destDb.beginTrans();
      try {
        destDb.commit();
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }



      let txId : number;
      destDb.beginTrans().then((txId : number) => {
        destDb.execute("DELETE FROM TEST1 WHERE age = ? OR age = ?", txId, ["18", "20"])
          .then(() => {
            try {
              destDb.commit(txId);
            } catch (error) {
              expect(error.code).assertEqual(14800030);
            }
          })
          .catch((err: BusinessError) => {
            destDb.rollback(txId)
            console.error(`execute sql failed, code is ${err.code},message is ${err.message}`);
          });
      });
      //
      // destDb.beginTrans().then((txId : number) => {
      //   destDb.execute("DELETE FROM TEST1 WHERE age = ? OR age = ?", txId, ["18", "20"])
      //     .then(() => {
      //       try {
      //         destDb.rollback(txId);
      //       } catch (error) {
      //         expect(error.code).assertEqual(14800030);
      //       }
      //     })
      //     .catch((err: BusinessError) => {
      //       destDb.rollback(txId)
      //       console.error(`execute sql failed, code is ${err.code},message is ${err.message}`);
      //     });
      // });

      try {
        destDb.backup("Dest.db", (err) => {
          if (err) {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
          }
          console.info('Backup success.');
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      // try {
      //   await destDb.backup("Dest.db");
      // } catch (error) {
      //   console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
      //   expect(error.code).assertEqual(14800030);
      // }

      try {
        destDb.restore("Dest.db", (err) => {
          if (err) {
            console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
          }
          console.info('Restore success.');
        })
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      // try {
      //   await destDb.restore("dbBackup.db");
      // } catch (error) {
      //   console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
      //   expect(error.code).assertEqual(14800030);
      // }
      const dbPath = context.databaseDir+"/rdb/TransactionTest.db";
      try {
        destDb.attach(dbPath, "attachDB").then((number: number) => {
          console.info('attach succeeded');
        }).catch ((err: BusinessError) => {
          console.error(`attach failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800030);
      }
      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await data_relationalStore.deleteRdbStore(context, DEST_STORE_NAME);
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0900
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0900
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await rdbStore.executeSql(CREATE_TABLE_TEST1, null);
      try {
        rdbStore.attach(context, STORE_CONFIG1, "attachDB").then((number: number) => {
          console.info(`attach succeeded, number is ${number}`);
        }).catch ((err: BusinessError) => {
          console.error(`attach failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800030);
      }

      try {
        rdbStore.detach("attachDB").then((number: number) => {
          console.info(`detach succeeded, number is ${number}`);
        }).catch ((err: BusinessError) => {
          console.error(`detach failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800030);
      }

      try {
        rdbStore.detach("attachDB").then((number: number) => {
          console.info(`detach succeeded, number is ${number}`);
        }).catch ((err: BusinessError) => {
          console.error(`detach failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800030);
      }
      await rdbStore.executeSql("DROP TABLE IF EXISTS test1", null);
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
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
        expect(err.code).assertEqual(14800030);
      }

      try {
        rdbStore.unlockRow(predicates).then(() => {
          console.info(`Unlock success`);
        }).catch((err: BusinessError) => {
          console.error(`Unlock failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800030);
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
        expect(err.code).assertEqual(14800030);
      }
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
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
        expect(err.code).assertEqual(14800030);
      }

      try {
        rdbStore.unlockRow(predicates).then(() => {
          console.info(`Unlock success`);
        }).catch((err: BusinessError) => {
          console.error(`Unlock failed, code is ${err.code},message is ${err.message}`);
        })
      } catch (err) {
        expect(err.code).assertEqual(14800030);
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
        expect(err.code).assertEqual(14800030);
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
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
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
        rdbStore.createTransaction().then((transaction: data_relationalStore.Transaction) => {
          transaction.execute("DELETE FROM test WHERE age = ? OR age = ?", [21, 20]).then(() => {
            transaction.commit();
          }).catch((e: BusinessError) => {
            transaction.rollback();
            console.error(`execute sql failed, code is ${e.code},message is ${e.message}`);
          });
        }).catch((err: BusinessError) => {
          console.error(`createTransaction faided, code is ${err.code},message is ${err.message}`);
        });
      } catch (err) {
        expect(err.code).assertEqual(14800030);
      }
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800030Test_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let u8 = new Uint8Array(Array(2).fill(1));
      const destDb = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
      await destDb.executeSql(CREATE_TABLE_TEST1, null);
      try {
       await destDb.execute("DROP TABLE IF EXISTS test1");
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }

      try {
        destDb.executeSync("DROP TABLE IF EXISTS test1");
      } catch (error) {
        console.error("****** RdbBackupRestoreBackupTest_0063 ******" + JSON.stringify(error));
        expect(error.code).assertEqual(14800030);
      }
      await destDb.executeSql("DROP TABLE IF EXISTS test1", null);
      await destDb.close()
      await data_relationalStore.deleteRdbStore(context, "TransactionTest.db");
      done();
    })

  })
}