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
  name: "TransactionTest.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let STORE_CONFIG: data_relationalStore.StoreConfig = {
  name: "rdbStore1.db",
  securityLevel: data_relationalStore.SecurityLevel.S1,
}

let deviceId: string | undefined = undefined;
let context: common.UIAbilityContext | undefined;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let rdbStore: data_relationalStore.RdbStore | undefined;
const TAG = "[RelationalStore_JSKITS_TEST]";
let dmInstance: distributedDeviceManager.DeviceManager;

export default function AsyncCallback() {
  describe("AsyncCallback", (): void => {
    beforeAll(async (): Promise<void> => {
      console.info(TAG + 'beforeAll');
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000)
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
    });
    beforeEach(async (): Promise<void> => {
      console.info(TAG + 'beforeEach');
      rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG);
    })
    afterEach(async (): Promise<void> => {
      console.info(TAG + 'afterEach');
      await data_relationalStore.deleteRdbStore(context!, STORE_CONFIG);
    })
    afterAll(async (): Promise<void> => {
      console.info(TAG + 'afterAll');
    })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_backup_1000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_backup_1000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_backup_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        await rdbStore!.close();
        rdbStore!.backup("TransactionTest.db", (err) => {
          if (err) {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
          }
          console.info('Backup success.');
          done();
        })
      })

    /**
     * @tc.name   relationalStoreTest_Async14800032_016
     * @tc.number relationalStoreTest_Async14800032_016
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Async14800032_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void) => {
        console.info(TAG + "************* relationalStoreTest_Async14800032_016 start *************");
        try {
          rdbStore!.cleanDirtyData('employee', (err) => {
            console.info(TAG + 'clean dirty data succeeded');
            done();
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest_Async14800032_016 fail code is " + e.code + " message is " +
          e.message);
          expect(e.code).assertEqual(14800032);
        }
        done();
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0500
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0500
     * @tc.desc   Test cleanDirtyData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0500 start-----")
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);

        if (rdbStore != undefined) {
          try {
            (rdbStore as data_relationalStore.RdbStore).cleanDirtyData('test_table', () => {
              console.info(TAG + 'clean dirty data succeeded');
            })
          } catch (err) {
            err = err as BusinessError;
            console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801');
          }
        }
        done()
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0500 end-----")
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Async_0300
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Async_0300
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Async_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
        let rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
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
          rdbStore.backup("TransactionTest.db", (err) => {
            if (err) {
              console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
            }
            console.info('Backup success.');
          })
        } catch (err) {
          err = err as BusinessError;
          expect(err.code).assertEqual(14800021);
        }

        done();
      })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Async_0700
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Async_0700
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Async_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
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
        await rdbStore!.close();
        rdbStore!.cleanDirtyData('test1', (err) => {
          if (err) {
            console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
          }
          console.info('clean dirty data succeeded');
        })
        rdbStore!.getModifyTime("test1", "NAME", PRIKey, (err) => {
          if (err) {
            console.error(`getModifyTime failed, code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
          }
        });
        rdbStore!.cleanDirtyData('test1', 10, (err) => {
          if (err) {
            console.error(`clean dirty data failed, code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
          }
          console.info('clean dirty data succeeded');
          done();
        })
      })

    /**
     * @tc.name   relationalStoreTest_Async14800033_016
     * @tc.number relationalStoreTest_Async14800033_016
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Async14800033_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void) => {
        console.info(TAG + "************* relationalStoreTest_Async14800033_016 start *************");
        try {
          rdbStore!.cleanDirtyData('employee', (err) => {
            console.info(TAG + 'clean dirty data succeeded');
            done();
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest_Async14800033_016 fail code is " + e.code + " message is " +
          e.message);
          expect(e.code).assertEqual(14800033);
          done();
        }
      })

    /**
     * @tc.name   relationalStoreTest034_14800032
     * @tc.number relationalStoreTest034_14800032
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest034_14800032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest001 start *************");
      rdbStore!.backup("backup3.db", (err) => {
        if (err) {
          console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info(TAG + 'Backup success.');
        done();
      })
    })

    /**
     * @tc.name   relationalStoreTest034_14800033
     * @tc.number relationalStoreTest034_14800033
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest034_14800033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest001 start *************");
      rdbStore!.backup("backup3.db", (err) => {
        if (err) {
          console.error(TAG + `Backup failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800033);
        }
        console.info(TAG + 'Backup success.');
        done();
      })
    })

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_ERRORCODETSET_Async_0060
     * @tc.number SUB_DDM_RELATIONALETS_ERRORCODETSET_Async_0060
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_Async_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_Async_0060 start *************');
        let predicates = new data_relationalStore.RdbPredicates('test');
        let resultSet: data_relationalStore.ResultSet = await rdbStore!.query(predicates);
        if (rdbStore != undefined) {
          rdbStore!.backup("dbBackup001.db", (err) => {
            let e = err as BusinessError;
            if (e.code != 801) {
              expect(e.code).assertEqual(14800024);
            }
          });

          rdbStore!.restore("dbBackup001.db", (err) => {
            let e = err as BusinessError;
            if (e.code != 801) {
              expect(e.code).assertEqual(14800024);
            }
          });
        }

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_Async_0060 end *************');
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_getModifyTime_AsyncErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_getModifyTime_AsyncErrTest_0100
     * @tc.desc   Test getModifyTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_getModifyTime_AsyncErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_AsyncErrTest_0100 start-----")
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
          err = err as BusinessError;
          console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
          expect(err.code).assertEqual('801');
          done();
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_AsyncErrTest_0100 end-----")
      })

    /**
     * @tc.name   relationalStoreTest_Async14800032_014
     * @tc.number relationalStoreTest_Async14800032_014
     * @tc.desc   getModifyTime success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Async14800032_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* relationalStoreTest_Async14800032_014 start *************");
        try {
          let PRIKey: Array<data_relationalStore.PRIKeyType> = [30 as long, 31 as long];
          rdbStore!.getModifyTime("employee", "age", PRIKey, (err) => {
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          console.log(TAG +
            `relationalStoreTest_Async14800032_014 get modify time fail, err code is ${err.code}, message is ${err.message}.`);
          expect(err.code).assertEqual(14800032);
          done();
        }
        console.log(TAG + "************* relationalStoreTest_Async14800032_014 end *************");
      })


    /**
     * @tc.name   relationalStoreTest_Async14800033_014
     * @tc.number relationalStoreTest_Async14800033_014
     * @tc.desc   getModifyTime success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Async14800033_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        console.log(TAG + "************* relationalStoreTest_Async14800033_014 start *************");
        try {
          let PRIKey: Array<data_relationalStore.PRIKeyType> = [30 as long, 31 as long];
          rdbStore!.getModifyTime("employee", "age", PRIKey, (err) => {
            done();
          });
        } catch (err) {
          err = err as BusinessError;
          console.log(TAG +
            `relationalStoreTest_Async14800033_014 get modify time fail, err code is ${err.code}, message is ${err.message}.`);
          expect(err.code).assertEqual(14800033);
          done();
        }
        console.log(TAG + "************* relationalStoreTest_Async14800033_014 end *************");
      })

    /**
     * @tc.name   relationalStoreTest_Async14800032_018
     * @tc.number relationalStoreTest_Async14800032_018
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Async14800032_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void) => {
        console.info(TAG + "************* relationalStoreTest_Async14800032_018 start *************");
        try {
          rdbStore!.cleanDirtyData('employee', 100, (err) => {
            console.info(TAG + 'clean dirty data succeeded');
            done();
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest_Async14800032_018 fail code is " + e.code + " message is " +
          e.message);
          expect(e.code).assertEqual(14800000);
          done();
        }
      })


    /**
     * @tc.name   relationalStoreTest_Async14800033_018
     * @tc.number relationalStoreTest_Async14800033_018
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest_Async14800033_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: () => void) => {
        console.info(TAG + "************* relationalStoreTest_Async14800033_018 start *************");
        try {
          rdbStore!.cleanDirtyData('employee', 100, (err) => {
            console.info(TAG + 'clean dirty data succeeded');
            done();
          })
        } catch (e) {
          e = e as BusinessError;
          console.error(TAG + "relationalStoreTest_Async14800033_018 fail code is " + e.code + " message is " +
          e.message);
          expect(e.code).assertEqual(14800033);
          done();
        }
      })


    /**
     * @tc.name   SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0400
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0400
     * @tc.desc   Test cleanDirtyData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0400 start-----")
        if (rdbStore != undefined) {
          try {
            (rdbStore as data_relationalStore.RdbStore).cleanDirtyData('test_table', 100, (err) => {
              console.info(TAG + 'clean dirty data succeeded');
            })
          } catch (err) {
            err = err as BusinessError;
            console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801');
          }
        }
        done();
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_AsyncErrTest_0400 end-----")
      })


    /**
     * @tc.name   SUB_DistributedData_RelationalStore_obtainDistributedTableName_AsyncErrTest_0100
     * @tc.number SUB_DistributedData_RelationalStore_obtainDistributedTableName_AsyncErrTest_0100
     * @tc.desc   Test obtainDistributedTableName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DistributedData_RelationalStore_obtainDistributedTableName_AsyncErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
        console.info(TAG +
          "-----SUB_DistributedData_RelationalStore_obtainDistributedTableName_AsyncErrTest_0100 start-----")
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
        if (rdbStore != undefined && deviceId != undefined) {
          (rdbStore as data_relationalStore.RdbStore).obtainDistributedTableName(deviceId, "EMPLOYEE",
            (err, tableName) => {
              if (err) {
                console.error(TAG + 'Failed to obtainDistributedTableName.Code: ' + err.code + ',message:' +
                err.message);
                expect(err.code).assertEqual('801')
              }
              console.info(TAG + `ObtainDistributedTableName successfully, tableName= ${tableName}`);
            })
        }
        done();
        console.info(TAG +
          "-----SUB_DistributedData_RelationalStore_obtainDistributedTableName_AsyncErrTest_0100 end-----")
      })


    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_restore_1000
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_restore_1000
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_restore_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
        let rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        await rdbStore.close();
        rdbStore.restore("TransactionTest.db", (err) => {
          if (err) {
            console.error(`Backup failed, code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
          }
          console.info('Backup success.');
          done();
        })
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Async_1200
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Async_1200
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800014Test_Async_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
        rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore!.executeSql(CREATE_TABLE_TEST1);
        await rdbStore!.close();
        let deviceId = "100"
        rdbStore!.obtainDistributedTableName(deviceId, "test1", (err) => {
          if (err) {
            console.error(`ObtainDistributedTableName failed, code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(14800014);
          }
          done();
        })
      })

    /**
     * @tc.name   SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Async_0400
     * @tc.number SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Async_0400
     * @tc.desc   Verify the properties of the text type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DistributedData_RDB_SDK_ErrorCode14800021Test_Async_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
        let rdbStore = await data_relationalStore.getRdbStore(context!, STORE_CONFIG1);
        await rdbStore.executeSql(CREATE_TABLE_TEST1);
        try {
          let promiseBackup = (rdbStore as data_relationalStore.RdbStore).backup("TransactionTest.db");
          promiseBackup.then(() => {
            console.info('Backup success.');
          }).catch(() => {
          })
        } catch (err) {
          err = err as BusinessError;
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
          err = err as BusinessError;
          expect(err.code).assertEqual(14800021);
        }

        await rdbStore.executeSql("DROP TABLE IF EXISTS test1");
        done();
      })

    /**
     * @tc.name   relationalStoreTest035
     * @tc.number relationalStoreTest035
     * @tc.desc   cleanDirtyData success callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('relationalStoreTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      console.info(TAG + "************* relationalStoreTest035 start *************");
      await rdbStore!.backup("backup4.db");
      rdbStore!.restore("backup4.db", (err) => {
        if (err) {
          console.error(`Restore failed, code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(14800032);
        }
        console.info('Restore success.');
      })
      done();
    })

  })
}