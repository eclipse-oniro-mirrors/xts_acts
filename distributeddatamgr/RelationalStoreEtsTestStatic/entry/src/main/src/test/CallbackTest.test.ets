import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Size,
  TestType
} from "../../../hypium/index";
import data_relationalStore from '@ohos.data.relationalStore'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';

const CREATE_TABLE_TEST1 = "CREATE TABLE IF NOT EXISTS test1 (" + "id INTEGER PRIMARY KEY, " +
  "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";

const STORE_CONFIG1: data_relationalStore.StoreConfig = {
  name: "TransactionCallBackTest.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "TransactionCallBackTest1.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}
let STORE_CONFIG2: data_relationalStore.StoreConfig = {
  name: "TransactionCallBackTest2.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
  persist: false
}

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识

let deviceId: string | undefined = undefined;
let context: common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let rdbStore: data_relationalStore.RdbStore | undefined | null;
const TAG = "[RelationalStore_JSKITS_TEST]";
let dmInstance: distributedDeviceManager.DeviceManager;
const CREATE_TABLE_TEST =
  "CREATE TABLE IF NOT EXISTS employee (id INTEGER PRIMARY KEY,name TEXT NOT NULL, age INTEGER, salary REAL, data4 BLOB,data5 asset,data6 assets)";


export default function CallbackTest() {
  describe("CallbackTest", (): void => {

    beforeAll(async (): Promise<void> => {
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(2000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    });

    beforeEach(async () => {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
      console.info(TAG + "create rdb store success")
      await rdbStore!.executeSql(CREATE_TABLE_TEST);
      let u8 = new Uint8Array([3, 4, 5])
      const valueBucket: data_relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30 as long,
        "salary": 2000 as long,
        "data4": u8
      }
      const valueBucket2: data_relationalStore.ValuesBucket = {
        "name": "Lisa",
        "age": 31 as long,
        "salary": 2000 as long,
        "data4": u8
      }
      await (rdbStore as data_relationalStore.RdbStore).insert("employee", valueBucket);
      await (rdbStore as data_relationalStore.RdbStore).insert("employee", valueBucket2)
    })

    afterEach(async (): Promise<void> => {

    })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1000 code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.backup("TransactionTest.db", (err: BusinessError | null) => {
            if (err) {
              console.error(`SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1000 Backup failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800014)
              done();
            } else {
              expect().assertFail();
            }
            console.info('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1000 Backup success.');
            done();
          })
        } catch (e: BusinessError) {
          console.log(TAG + "SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1000 e.code:" + e.code);
          expect(e.code).assertEqual(14800014)
        }

        rdbStore = undefined;
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        let rdbStore1 = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        // rdbStore1.beginTransaction();
        try {
          let PRIKey: Array<data_relationalStore.PRIKeyType> = [1 as long, 4 as long, 2 as long, 3 as long];
          rdbStore1.getModifyTime("test1", "NAME", PRIKey, (err) => {
            if (err) {
              console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
            }
          })
        } catch (err) {
          console.info(TAG,
            `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
          expect(err.code).assertEqual(14800021);
        }
        // rdbStore1.beginTransaction();
        try {
          rdbStore1.cleanDirtyData('test1', 10, (err) => {
            if (err) {
              console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
            }
            console.info('clean dirty data succeeded');
          })
        } catch (err: BusinessError) {
          console.info(TAG,
            `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
          expect(err.code).assertEqual(14800021);
        }
        // rdbStore1.beginTransaction();
        try {
          rdbStore1.cleanDirtyData('test1', (err) => {
            if (err) {
              console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
            }
            console.info('clean dirty data succeeded');
          })
        } catch (err) {
          console.info(TAG,
            `SUB_DistributedData_RelationalStore_SDK_SyncAPITest_2300 updateSync err.code ${err.code}, err.message ${err.message}`)
          expect(err.code).assertEqual(14800021);
        }
        done();
      })

    /**
     * @tc.name   relationalStoreTest_Callback14800032_016
     * @tc.number relationalStoreTest_Callback14800032_016
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Callback14800032_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest_Callback14800032_016 start *************");
      try {
        rdbStore!.cleanDirtyData('employee', (err) => {
          console.info(TAG + 'clean dirty data succeeded');
          done();
        })
      } catch (e) {
        console.error(TAG + "relationalStoreTest_Callback14800032_016 fail code is " + e.code + " message is " + e.message);
        expect(e.code).assertEqual(14800032);
        done();
      }
    })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0500
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0500
     * @tc.desc   Test cleanDirtyData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0500 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);

        if (rdbStore != undefined) {
          try {
            (rdbStore as data_relationalStore.RdbStore).cleanDirtyData('test_table', () => {
              console.info(TAG + 'clean dirty data succeeded');
            })
          } catch (err: BusinessError) {
            console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual(801);
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0500 end-----")
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Callback_0300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Callback_0300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Callback_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        let rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        await rdbStore.insert("test1", valueBucket);
        try {
          rdbStore.backup("TransactionTest.db", (err: BusinessError | null) => {
            if (err) {
              console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
            }
            console.info('Backup success.');
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }
        done();
      })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_0700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_0700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        const u8 = new Uint8Array([1, 2, 3]);
        const valueBucket: data_relationalStore.ValuesBucket = {
          "name": "zhangsan",
          "age": 20 as long,
          "salary": 220.5,
          "blobType": u8,
        };
        let PRIKey: Array<data_relationalStore.PRIKeyType> = [1 as long, 4 as long, 2 as long, 3 as long];
        await rdbStore!.insert("test1", valueBucket);
        let predicates = new data_relationalStore.RdbPredicates("test1");
        predicates.equalTo("NAME", "zhangsan");
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        try {
          rdbStore!.cleanDirtyData('test1', (err) => {
            if (err) {
              console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800014)
            } else {
              expect().assertFail();
            }
            console.info('clean dirty data succeeded');
          })
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(e.code).assertEqual(14800014)
        }

        try {
          rdbStore!.getModifyTime("test1", "NAME", PRIKey, (err) => {
            if (err) {
              console.error(`getModifyTime failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800014)
            } else {
              expect().assertFail();
            }
          });
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(e.code).assertEqual(14800014)
        }

        try {
          rdbStore!.cleanDirtyData('test1', 10, (err) => {
            if (err) {
              console.error(`cleanDirtyData clean dirty data failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800014)
            }else {
              expect().assertFail();
            }
            console.info('cleanDirtyData clean dirty data succeeded');
          })
        } catch (e) {
          console.log(TAG + "cleanDirtyData e.code:" + e.code);
          expect(e.code).assertEqual(14800014)
        }
        done();
      })

    /**
     * @tc.name   relationalStoreTest_14800033_016
     * @tc.number relationalStoreTest_14800033_016
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_14800033_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest_14800033_016 start *************");
      try {
        rdbStore!.cleanDirtyData('employee', (err) => {
          console.info(TAG + 'clean dirty data succeeded');
          done();
        })
      } catch (e) {
        console.error(TAG + "relationalStoreTest_14800033_016 fail code is " + e.code + " message is " + e.message);
        expect(e.code).assertEqual(14800033);
        done();
      }
    })

    /**
     * @tc.name   relationalStoreTest034
     * @tc.number relationalStoreTest034
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest001 start *************");
      rdbStore!.backup("backup3.db", (err: BusinessError | null) => {
        if (err) {
          console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info(TAG + 'Backup success.');
        done();
      })
    })

    /**
     * @tc.name   relationalStoreTest_14800033_035
     * @tc.number relationalStoreTest_14800033_035
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_14800033_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest_14800033_035 start *************");
      rdbStore!.backup("backup3.db", (err: BusinessError | null) => {
        if (err) {
          console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800033);
        }
        console.info(TAG + 'Backup success.');
        done();
      })
    })

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_ERRORCODETSET_0060
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_Callback_8400
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0060 start *************');
        let predicates = new data_relationalStore.RdbPredicates('employee');
        let resultSet: data_relationalStore.ResultSet = await rdbStore!.query(predicates);
        expect(resultSet.goToFirstRow()).assertTrue();
        if (rdbStore != undefined) {
          rdbStore!.backup("dbBackup001.db", (err: BusinessError | null) => {
            console.info(TAG + 'backup');
            if (err && err.code != 801) {
              console.info(TAG + 'err.code: ' + err.code);
              expect(err.code).assertEqual(14800024);
            }
            rdbStore!.restore("dbBackup001.db", (err: BusinessError | null) => {
              console.info(TAG + 'restore');
              if (err && err.code != 801) {
                console.info(TAG + 'err.code: ' + err.code);
                expect(err.code).assertEqual(14800024);
              }
              done();
              console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0060 end *************');
            });
          });
        }
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100
     * @tc.desc   Test getModifyTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        let sql_text = "CREATE TABLE IF NOT EXISTS cloud_text (" +
          "data TEXT, " +
          "recycled BOOLEAN, " +
          "recycledTime INTEGER, " +
          "num TEXT PRIMARY KEY)";
        await rdbStore!.executeSql(sql_text);
        try {
          let PRIKey: Array<data_relationalStore.PRIKeyType> = ["test_key1", "test_key2"];
          rdbStore!.getModifyTime('cloud_text', "num", PRIKey, () => {
            console.log(TAG + 'modifyTime success');
            done();
          });
        } catch (err) {
          console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
          expect(err.code).assertEqual(801);
          done();
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100 end-----")
        done();
      })

    /**
     * @tc.name   relationalStoreTest_Callback14800032_014
     * @tc.number relationalStoreTest_Callback14800032_014
     * @tc.desc   getModifyTime success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Callback14800032_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* relationalStoreTest_Callback14800032_014 start *************");
      try {
        let PRIKey: Array<data_relationalStore.PRIKeyType> = [30 as long, 31 as long];
        rdbStore!.getModifyTime("employee", "age", PRIKey, (err) => {
          done();
        });
      } catch (err) {
        console.log(TAG +
          `relationalStoreTest_Callback14800032_014 get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(err.code).assertEqual(14800032);
        done();
      }
      console.log(TAG + "************* relationalStoreTest_Callback14800032_014 end *************");
      done();
    })


    /**
     * @tc.name   relationalStoreTest_Callback14800033_014
     * @tc.number relationalStoreTest_Callback14800033_014
     * @tc.desc   getModifyTime success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Callback14800033_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.log(TAG + "************* relationalStoreTest_Callback14800033_014 start *************");
      try {
        let PRIKey: Array<data_relationalStore.PRIKeyType> = [30 as long, 31 as long];
        rdbStore!.getModifyTime("employee", "age", PRIKey, (err) => {
          done();
        });
      } catch (err) {
        console.log(TAG +
          `relationalStoreTest_Callback14800033_014 get modify time fail, err code is ${err.code}, message is ${err.message}.`);
        expect(err.code).assertEqual(14800033);
        done();
      }
      console.log(TAG + "************* relationalStoreTest_Callback14800033_014 end *************");
      done();
    })

    /**
     * @tc.name   relationalStoreTest_Callback14800032_018
     * @tc.number relationalStoreTest_Callback14800032_018
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Callback14800032_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest_Callback14800032_018 start *************");
      try {
        rdbStore!.cleanDirtyData('employee', 100, (err) => {
          console.info(TAG + 'clean dirty data succeeded');
          done();
        })
      } catch (e) {
        console.error(TAG + "relationalStoreTest_Callback14800032_018 fail code is " + e.code + " message is " + e.message);
        expect(e.code).assertEqual(14800032);
        done();
      }
      done();
    })

    /**
     * @tc.name   relationalStoreTest_Callback14800033_018
     * @tc.number relationalStoreTest_Callback14800033_018
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Callback14800033_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest_Callback14800033_018 start *************");
      try {
        rdbStore!.cleanDirtyData('employee', 100, (err) => {
          console.info(TAG + 'clean dirty data succeeded');
          done();
        })
      } catch (e) {
        console.error(TAG + "relationalStoreTest_Callback14800033_018 fail code is " + e.code + " message is " + e.message);
        expect(e.code).assertEqual(14800033);
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0400
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0400
     * @tc.desc   Test cleanDirtyData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0400 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        if (rdbStore != undefined) {
          try {
            (rdbStore as data_relationalStore.RdbStore).cleanDirtyData('test_table', 100, (err) => {
              console.info(TAG + 'clean dirty data succeeded');
            })
          } catch (err) {
            console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual(801);
            done();
          }
        }else{
          expect().assertFail();
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0400 end-----")
        done();
      })


    /**
     * @tc.name   SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0100
     * @tc.desc   Test obtainDistributedTableName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.info(TAG +
          "-----SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0100 start-----")
        let dmInstance: distributedDeviceManager.DeviceManager;
        let deviceId: string | undefined = undefined;
        try {
          dmInstance = distributedDeviceManager.createDeviceManager("com.example.appdatamgrverify");
          let devices = dmInstance.getAvailableDeviceListSync();
          deviceId = devices[0].networkId;
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message
          console.error(TAG + "createDeviceManager errCode:" + code + ",errMessage:" + message);
        }
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
        if (rdbStore != undefined && deviceId != undefined) {
          (rdbStore as data_relationalStore.RdbStore).obtainDistributedTableName(deviceId, "EMPLOYEE",
            (err, tableName) => {
              if (err) {
                console.error(TAG + 'Failed to obtainDistributedTableName.Code: ' + err.code + ',message:' +
                err.message);
                expect(err.code).assertEqual(801)
              }else{
                expect().assertFail();
              }
              console.info(TAG + `ObtainDistributedTableName successfully, tableName= ${tableName}`);
            })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0100 end-----")
        done();
      })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);

        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        try {
          rdbStore!.restore("TransactionTest.db", (err) => {
            if (err) {
              console.error(`SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2000 Backup failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800014)
            }else{
              expect().assertFail();
            }
            console.info('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_2000 Backup success.');
            done();
          })
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(e.code).assertEqual(14800014)
        }
        rdbStore = undefined;
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        console.info('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1200 obtainDistributedTableName.');

        await rdbStore!.close();
        rdbStore!.obtainDistributedTableName("deviceId", "test1", (err, tableName) => {
          if (err) {
            console.error(`SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1200 failed, code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800014)
            done();
          } else {
            console.log(TAG + "SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1200 ");
            expect().assertFail();
          }
        })
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Callback_0400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Callback_0400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Callback_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        let rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        try {
          let promiseBackup = (rdbStore as data_relationalStore.RdbStore).backup("TransactionTest.db");
          promiseBackup.then(() => {
            console.info('Backup success.');
          }).catch(() => {
          })
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(14800021);
        }

        try {
          (rdbStore as data_relationalStore.RdbStore).restore("TransactionTest.db", (err: BusinessError | null) => {
            if (err) {
              console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
            }
            console.info('Restore success.');
          })
        } catch (err) {
          expect(err.code).assertEqual(14800021);
        }

        await rdbStore.executeSql("DROP TABLE IF EXISTS test1");
        done();
      })

    /**
     * @tc.name   relationalStoreTest_14800032_035
     * @tc.number relationalStoreTest_14800032_035
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_14800032_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest_14800032_035 start *************");
      await rdbStore!.backup("backup4.db");
      rdbStore!.restore("backup4.db", (err: BusinessError | null) => {
        if (err) {
          console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info('Restore success.');
        done();
      })
    })

    /**
     * @tc.name   errcode024
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBAPIErrcodeTest_12100
     * @tc.desc   rdbStore.remoteQuery errcode is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      let Tag: string = 'testtag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
      console.info(Tag + "************* errcode024 start *************");
      const record: data_relationalStore.ValuesBucket = {
        "name": "Jim",
        "age": 30 as long,
      }
      let predicates = new data_relationalStore.RdbPredicates("employee");
      predicates.equalTo("name", "Jim")
      let localDeviceId = "";
      try {
        rdbStore!.remoteQuery(localDeviceId, "employee", predicates, ["ID", "name", "age"],
          (err: BusinessError<void> | null, data: data_relationalStore.ResultSet | undefined): void => {
            console.info(Tag + "remoteQuery err.code" + err?.code + "err.message" + err?.message)
            console.info(Tag + "Remote query fail");
            done();
          })
      } catch (err) {
        console.info(Tag + "err.code" + err.code + "err.message" + err.message)
        if (err.code == 401) {
          expect(err.code == 401).assertTrue();
          done();
        } else {
          expect(err.code == 801).assertTrue();
          done();
        }
      }
      console.info(Tag + "************* errcode024 end *************");
    })

    /**
     * @tc.name   SUB_DistributedrelationalStore_remoteQuery_ErrTest_0002
     * @tc.number SUB_DistributedrelationalStore_remoteQuery_ErrTest_0002
     * @tc.desc   Test remoteQuery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedrelationalStore_remoteQuery_ErrTest_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        let Tag: string = 'testtag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
        let deviceId: string;
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        let predicates: data_relationalStore.RdbPredicates = new data_relationalStore.RdbPredicates('EMPLOYEE');
        try {
          rdbStore!.remoteQuery("deviceId", "test1", predicates, ["id", "name", "age", "salary", "blobType"],
            (err: BusinessError<void> | null, data: data_relationalStore.ResultSet | undefined): void => {
              console.info(Tag + "remoteQuery ErrTest_0002 err.code" + err?.code + "err.message" + err?.message)
              done();
            })
        } catch (e) {
          console.log(Tag + "e.code:" + e.code);
          expect(e.code).assertEqual("14800014");
          done();
        }
      })

    /**
     * @tc.name   errcode035
     * @tc.number errcode035
     * @tc.desc   Test setDistributedTables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* errcode035 start *************");
      try {
        let array: Array<string> = new Array<string>();
        rdbStore!.setDistributedTables(["employee"], (err) => {
          console.info(TAG + "set none to be distributed table success");
          expect(rdbStore != null).assertTrue();
          done()
        })
      } catch (err: BusinessError) {
        console.info(TAG + "setDistributed002 failed" + `, error code is ${err.code}, message is ${err.message}`);
        expect(err.code == 801).assertTrue();
        done();
      }
      console.info(TAG + "************* errcode035 end *************");
      done();
    })

    /**
     * @tc.name   errcode036
     * @tc.number errcode036
     * @tc.desc   Test setDistributedTables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* errcode036 start *************");
      try {
        rdbStore!.setDistributedTables(["employee"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, (err) => {
          console.info(TAG + "set none to be distributed table success");
          expect(rdbStore != null).assertTrue();
          done()
        })
      } catch (err) {
        console.info(TAG + "setDistributed002 failed" + `, error code is ${err.code}, message is ${err.message}`);
        expect(err.code == 801).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode036 end *************");
      done();
    })

    /**
     * @tc.name   errcode037
     * @tc.number errcode037
     * @tc.desc   Test setDistributedTables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* errcode037 start *************");
      try {
        rdbStore!.setDistributedTables(["employee"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          { autoSync: true } as data_relationalStore.DistributedConfig, (err: BusinessError<void> | null) => {
            console.info(TAG + "set none to be distributed table success");
            expect(rdbStore != null).assertTrue();
            done()
          })
      } catch (err) {
        console.info(TAG + "setDistributed002 failed" + `, error code is ${err.code}, message is ${err.message}`);
        expect(err.code == 801).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode037 end *************");
      done();
    })

    /**
     * @tc.name   errcode038
     * @tc.number errcode038
     * @tc.desc   Test setDistributedTables
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('errcode038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* errcode038 start *************");
      try {
        await rdbStore!.close();
        console.info(`${TAG} close succeeded`);
      } catch (err) {
        console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
      }
      try {
        rdbStore!.setDistributedTables(["employee"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          { autoSync: true } as data_relationalStore.DistributedConfig, (err: BusinessError<void> | null) => {
            if (err) {
              console.info(TAG + "setDistributedTables failed" +
                `, error code is ${err.code}, message is ${err.message}`);
              expect(err.code == 14800014).assertTrue()
            } else {
              expect().assertFail();
            }
            console.info(TAG + "setDistributedTables set distributed table success");
            done()
          })
      } catch (err) {
        console.info(TAG + "setDistributedTables failed" + `, error code is ${err.code}, message is ${err.message}`);
        expect(err.code == 14800014).assertTrue()
        done()
      }
      console.info(TAG + "************* errcode038 end *************");
      done();
    })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1100
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Callback_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err) {
          console.info(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }

        try {
          rdbStore!.setDistributedTables(["test1"], (err) => {
            if (err) {
              console.error(`SetDistributedTablesTest_1 failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800014)
            }else{
              expect().assertFail();
            }
            console.info('SetDistributedTablesTest_1 successfully.');
          })
        } catch (e) {
          console.log(TAG + "SetDistributedTablesTest_1 e.code:" + e.code);
          expect(e.code).assertEqual(14800014)
        }

        console.info('SetDistributedTablesTest_2 start.');
        try {
          rdbStore!.setDistributedTables(["test1"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD, (err) => {
            if (err) {
              console.error(`SetDistributedTablesTest_2 failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800014)
            }else{
              expect().assertFail();
            }
            console.info('SetDistributedTablesTest_2 successfully.');
          })
        } catch (e) {
          console.log(TAG + "e.code:" + e.code);
          expect(e.code).assertEqual(14800014)
        }
        done();
      })

    /**
     * @tc.name   setDistributedTablesTest003
     * @tc.number setDistributedTablesTest003
     * @tc.desc   setDistributedTables report 14800051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('setDistributedTablesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + "************* setDistributedTablesTest003 start *************");
      try {
        rdbStore!.setDistributedTables(["employee"], data_relationalStore.DistributedType.DISTRIBUTED_CLOUD,
          { autoSync: true }, (err) => {
            if (err) {
              console.error(TAG + `setDistributedTables Test003 failed, code is ${err.code},message is ${err.message}`);
            }
            console.info(TAG + 'SetDistributedTables Test003 successfully.');
            done();
          })
      } catch (e) {
        console.error(TAG + `setDistributedTables Test003 failed, code is ${e.code},message is ${e.message}`);
        expect(e.code).assertEqual(14800051);
        done();
      }
      console.info(TAG + "************* setDistributedTablesTest003 end *************");
      done();
    });

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_sync_ErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_sync_ErrTest_0100
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_sync_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_sync_ErrTest_0100 start-----")
        let dmInstance: distributedDeviceManager.DeviceManager;
        let deviceIds: Array<string> = [];

        try {
          dmInstance = distributedDeviceManager.createDeviceManager("com.example.appdatamgrverify");
          let devices: Array<distributedDeviceManager.DeviceBasicInfo> = dmInstance.getAvailableDeviceListSync();
          for (let i = 0; i < devices.length; i++) {
            deviceIds[i] = devices[i].networkId!;
          }
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message
          console.error(TAG + "createDeviceManager errCode:" + code + ",errMessage:" + message);
        }

        console.info(TAG + "-----SUB_DistributedData_RelationalStore_sync_ErrTest_0100 -----")
        let predicates = new data_relationalStore.RdbPredicates('EMPLOYEE');
        predicates.inDevices(deviceIds);
        let rdbStore2 = await data_relationalStore.getRdbStore(context, STORE_CONFIG2);
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_sync_ErrTest_0100 -----")
        if (rdbStore2 != undefined) {
          rdbStore2!.sync(data_relationalStore.SyncMode.SYNC_MODE_PUSH, predicates, (err, result) => {
            if (err) {
              console.error(TAG + 'Failed to sync.Code: ' + err.code + ',message:' + err.message);
              expect(err.code).assertEqual(801)
            }
            console.info('Sync done.');
          })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_sync_ErrTest_0100 end-----")
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        console.info(TAG + "-----SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        let deviceId: String | undefined;
        console.info(TAG + "-----SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300 -----")
        try {
          dmInstance = distributedDeviceManager.createDeviceManager("com.example.appdatamgrverify");
          console.info(TAG + "-----SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300 -----")
          let devices = dmInstance.getAvailableDeviceListSync();
          deviceId = devices[0].networkId;
          console.info(TAG + "-----SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300 -----")
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message
          console.error("createDeviceManager errCode:" + code + ",errMessage:" + message);
        }
        let deviceIds: Array<string> = [];
        let predicates = new data_relationalStore.RdbPredicates('test1');
        predicates.inDevices(deviceIds);
        console.info(TAG + "-----SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300 -----")
        try {
          await rdbStore!.close();
          console.info(`${TAG} close succeeded`);
        } catch (err: BusinessError) {
          console.error(`${TAG} close failed, code is ${err.code},message is ${err.message}`);
        }
        try {
          rdbStore!.sync(data_relationalStore.SyncMode.SYNC_MODE_PUSH, predicates, (err, result) => {
            if (err) {
              console.error(`SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_1300 Sync failed, code is ${err.code},message is ${err.message}`);
              expect(err.code).assertEqual(14800014)
            }else{
              expect().assertFail();
            }
          })
        } catch (e) {
          console.log(TAG + "Test_1300 e.code:" + e.code);
          expect(e.code).assertEqual(14800014)
        }
        done();
      })


  })
}