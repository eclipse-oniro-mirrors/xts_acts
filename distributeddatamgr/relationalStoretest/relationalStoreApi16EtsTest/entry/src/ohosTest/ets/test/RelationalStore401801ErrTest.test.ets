import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { relationalStore, sendableRelationalStore } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityAccessCtrl, common, PermissionRequestResult } from '@kit.AbilityKit';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import { Driver, ON } from '@kit.TestKit';

let TAG = 'ttt';
let store: relationalStore.RdbStore | undefined = undefined;
let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
let STORE_CONFIG: relationalStore.StoreConfig = {
  name: "rdbStore1.db",
  securityLevel: relationalStore.SecurityLevel.S1,
}
let context = getContext(this) as common.UIAbilityContext;


// let getPermission = async () => {
//   console.info('getPermission is start');
//   // context = AppStorage.get('context') as common.UIAbilityContext;
//   atManager.requestPermissionsFromUser(context, ['ohos.permission.DISTRIBUTED_DATASYNC'], (err:BusinessError, data:PermissionRequestResult) => {
//     console.info('requestPermissionsFromUser success data is' + JSON.stringify(data));
//     console.info('requestPermissionsFromUser failed err is' + JSON.stringify(err));
//   })
// }

let getPermission = async () => {
  console.info('getPermission is start');
  let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
  atManager.requestPermissionsFromUser(context, ['ohos.permission.DISTRIBUTED_DATASYNC'],
    (err: BusinessError, data: PermissionRequestResult) => {
      console.info("requestPermissionsFromUser success data is" + JSON.stringify(data));
      console.info("requestPermissionsFromUser failed err is" + JSON.stringify(err));
    })
}

let sleep = (ms: number) => {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

let drivenFn = async () => {
  try {
    let driver: Driver = Driver.create();
    console.info('come in driveFn');
    console.info('driver is ${JSON.stringify(driver)}');
    await sleep(1000);
    let button = await driver.findComponent(ON.text('始终允许'));
    if (button) {
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button.click();
      await sleep(1000);
    } else {
      let button1 = await driver.findComponent(ON.text('允许'));
      console.info('button is $ {JSON.stringify(button)}');
      await sleep(1000);
      await button1.click();
      await sleep(1000);
    }
  } catch (err) {
    console.info('err is' + err);
    return
  }
}

export default function relationalStoreInterfaceErrTest() {
  describe('relationalStoreInterfaceErrTest', () => {
    beforeAll(async () => {
      await getPermission();
      await sleep(1000);
      await drivenFn();
      await sleep(1000);
      // context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })
    beforeEach(() => {

    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_isNotNull_ErrTest_0100
     * @tc.name RelationalStoreErrTest01
     * @tc.desc Test isNotNull
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_isNotNull_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_isNotNull_ErrTest_0100 start-----")
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        try {
          predicates.isNotNull(null);
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to isNotNull.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_isNotNull_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_isNotNull_ErrTest_0100
     * @tc.name RelationalStoreErrTest02
     * @tc.desc Test orderByAsc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_orderByAsc_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_orderByAsc_ErrTest_0100 start-----")
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        try {
          predicates.orderByAsc(null);
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to orderByAsc.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_orderByAsc_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_limitAs_ErrTest_0100
     * @tc.name RelationalStoreErrTest03
     * @tc.desc Test limitAs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_limitAs_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_limitAs_ErrTest_0100 start-----")
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        try {
          predicates.equalTo("NAME", "Rose").limitAs(null);
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to limitAs.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_limitAs_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_offsetAs_ErrTest_0100
     * @tc.name RelationalStoreErrTest04
     * @tc.desc Test offsetAs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_offsetAs_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_offsetAs_ErrTest_0100 start-----")
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        try {
          predicates.equalTo("NAME", "Rose").limitAs(null);
          expect().assertFail();
        } catch (err) {
          console.error(TAG + 'Failed to limitAs.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_offsetAs_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_getColumnName_ErrTest_0100
     * @tc.name RelationalStoreErrTest05
     * @tc.desc Test getColumnName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_getColumnName_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getColumnName_ErrTest_0100 start-----")
        let predicates = new relationalStore.RdbPredicates("test");
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        try {
          if (resultSet != undefined) {
            const id = (resultSet as relationalStore.ResultSet).getColumnName(null);
            expect().assertFail();
          }
        } catch (err) {
          console.error(TAG + 'Failed to getColumnName.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getColumnName_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_getAsset_ErrTest_0100
     * @tc.name RelationalStoreErrTest06
     * @tc.desc Test getAsset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_getAsset_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getAsset_ErrTest_0100 start-----")
        let predicates = new relationalStore.RdbPredicates("test");
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        try {
          if (resultSet != undefined) {
            const doc = (resultSet as relationalStore.ResultSet).getAsset(null);
            expect().assertFail();
          }
        } catch (err) {
          console.error(TAG + 'Failed to getColumnName.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getAsset_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_getAssets_ErrTest_0100
     * @tc.name RelationalStoreErrTest07
     * @tc.desc Test getAssets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_getAssets_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getAssets_ErrTest_0100 start-----")
        let predicates = new relationalStore.RdbPredicates("test");
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let resultSet: relationalStore.ResultSet | undefined = undefined;
        try {
          if (resultSet != undefined) {
            const docs = (resultSet as relationalStore.ResultSet).getAssets(null);
            expect().assertFail();
          }
        } catch (err) {
          console.error(TAG + 'Failed to getColumnName.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getAssets_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_getValue_ErrTest_0100
     * @tc.name RelationalStoreErrTest08
     * @tc.desc Test getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_getValue_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getValue_ErrTest_0100 start-----")
        let predicates = new relationalStore.RdbPredicates("test");
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let resultSet: relationalStore.ResultSet = (store as relationalStore.RdbStore).querySync(predicates);
        try {
          if (resultSet != undefined) {
            let codes = (resultSet as relationalStore.ResultSet).getValue(null);
            console.log(`sscaslmcasm ${codes}`)
            // expect().assertFail();
          }
        } catch (err) {
          console.error(TAG + 'Failed to getColumnName.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getValue_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_getRows_ErrTest_0100
     * @tc.name RelationalStoreErrTest09
     * @tc.desc Test getRows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('SUB_DistributedData_RelationalStore_getRows_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    //   async () => {
    //   console.info(TAG + "-----SUB_DistributedData_RelationalStore_getRows_ErrTest_0100 start-----")
    //   let resultSet: relationalStore.ResultSet | undefined = undefined;
    //   try {
    //     if (resultSet != undefined) {
    //       let rows:Array<relationalStore.ValuesBucket>
    //       let maxCount:number = 50
    //       while ((rows = await (resultSet as relationalStore.ResultSet).getRows(maxCount)).length != 0) {
    //         console.info(JSON.stringify(rows[0]))
    //       }
    //     }
    //     expect().assertFail();
    //   } catch (err) {
    //     console.error(TAG + 'Failed to getColumnName.Code: ' + err.code + ',message:' + err.message);
    //     expect(err.code).assertEqual('401')
    //   }
    //   console.info(TAG + "-----SUB_DistributedData_RelationalStore_getRows_ErrTest_0100 end-----")
    // })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_querySql_ErrTest_0100
     * @tc.name RelationalStoreErrTest10
     * @tc.desc Test querySql
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_querySql_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_querySql_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try {
            (store as relationalStore.RdbStore).querySql(null, (err, resultSet) => {
              console.log("1111")
            })
          } catch (err) {
            console.error(TAG + 'Failed to querySql.Code: ' + err.code + ',message:' + err.message);
          }
          done();
        }
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_querySql_ErrTest_0200
     * @tc.name RelationalStoreErrTest11
     * @tc.desc Test querySql
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_querySql_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_querySql_ErrTest_0200 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try {
            (store as relationalStore.RdbStore).querySql(null, ['sanguo'], (err, resultSet) => {
              console.info(TAG + '307')
            })
          } catch (err) {
            console.error(TAG + 'Failed to querySql.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401');
          }
        }
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_querySql_ErrTest_0300
     * @tc.name RelationalStoreErrTest12
     * @tc.desc Test querySql
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_querySql_ErrTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_querySql_ErrTest_0300 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try {
            await (store as relationalStore.RdbStore).querySql(null);
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to querySql.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401')
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_querySql_ErrTest_0300 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100
     * @tc.name RelationalStoreErrTest13
     * @tc.desc Test getModifyTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let sql_text = "CREATE TABLE IF NOT EXISTS cloud_text (" +
          "data TEXT, " +
          "recycled BOOLEAN, " +
          "recycledTime INTEGER, " +
          "num TEXT PRIMARY KEY)";
        await store.executeSql(sql_text, null);
        try {
          let PRIKey = ["test_key1", "test_key2"];
          store.getModifyTime('cloud_text', "num", PRIKey, (err, data) => {
            console.log(TAG + 'modifyTime success');
            done();
          });
        } catch (err) {
          console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
          expect(err.code).assertEqual('801');
          done();
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0200
     * @tc.name RelationalStoreErrTest14
     * @tc.desc Test getModifyTime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let PRIKey = ["test_key1", "test_key2"];
        let sql_text = "CREATE TABLE IF NOT EXISTS cloud_text (" +
          "data TEXT, " +
          "recycled BOOLEAN, " +
          "recycledTime INTEGER, " +
          "num TEXT PRIMARY KEY)";
        await store.executeSql(sql_text, null);
        try {
          try {
            let PRIKey = ["test_key1", "test_key2"];
            await store.getModifyTime("cloud_text", "num", PRIKey).then((data) => {
              console.log(TAG + `modifyTime:` + JSON.stringify(data));
              done();
            });
          } catch (err) {
            console.log(TAG + `get modify time fail, err code is ${err.code}, message is ${err.message}.`);
            if (err.code == 801) {
              expect(err.code).assertEqual('801');
            }
            done();
          }
        } catch (err) {
          console.log(TAG + `get modify time, err code is ${err.code}, message is ${err.message}.`);
          expect(err.code).assertEqual('801');
          done();
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_getModifyTime_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0100
     * @tc.name RelationalStoreErrTest15
     * @tc.desc Test cleanDirtyData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if(store != undefined) {
          try {
            (store as relationalStore.RdbStore).cleanDirtyData(null, 100, (err) => {})
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to getModifyTime.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401')
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0200
     * @tc.name RelationalStoreErrTest16
     * @tc.desc Test cleanDirtyData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0200 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try {
            (store as relationalStore.RdbStore).cleanDirtyData(null, (err) => {});
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to getModifyTime.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401')
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0200 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0200
     * @tc.name RelationalStoreErrTest17
     * @tc.desc Test cleanDirtyData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0300 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if(store != undefined) {
          try {
            (store as relationalStore.RdbStore).cleanDirtyData(null, 100);
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401')
          }

        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0300 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_execute_ErrTest_0100
     * @tc.name RelationalStoreErrTest18
     * @tc.desc Test execute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_execute_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_execute_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if(store != null) {
          let txId : number;
          (store as relationalStore.RdbStore).beginTrans().then((txId : number) => {
            try {
              (store as relationalStore.RdbStore).execute("DELETE FROM TEST WHERE age = ? OR age = ?", txId, ["18", "20"]);
              console.info(TAG + 'execute success');
            } catch (err) {
              expect(err.code).assertEqual('801')
            }
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_execute_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_beginTransaction_ErrTest_0100
     * @tc.name RelationalStoreErrTest19
     * @tc.desc Test beginTransaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_beginTransaction_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_beginTransaction_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try {
            (store as relationalStore.RdbStore).beginTransaction();
            console.info(TAG + 'beginTransaction success.')
          } catch (err) {
            console.error(TAG + 'Failed to beginTransaction.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401')
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_beginTransaction_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_beginTrans_ErrTest_0100
     * @tc.name RelationalStoreErrTest20
     * @tc.desc Test beginTrans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_beginTrans_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_beginTrans_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != null) {
          let txId: number;
          try {
            (store as relationalStore.RdbStore).beginTrans().then((txId: number) => {});
            console.info(TAG + 'beginTrans success.')
          } catch (err) {
            console.error(TAG + 'Failed to beginTrans.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801')
          }

        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_beginTrans_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_commit_ErrTest_0100
     * @tc.name RelationalStoreErrTest21
     * @tc.desc Test commit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_commit_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_commit_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let value1 = "Lisa";
        let value2 = 18;
        let value3 = 100.5;
        let value4 = new Uint8Array([1, 2, 3]);
        if(store != undefined) {
          (store as relationalStore.RdbStore).beginTransaction();
          const valueBucket: relationalStore.ValuesBucket = {
            'NAME': value1,
            'AGE': value2,
            'SALARY': value3,
            'CODES': value4,
          };
          (store as relationalStore.RdbStore).insert("test", valueBucket);
          try {
            (store as relationalStore.RdbStore).commit(null);
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to commit.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401')
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_commit_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_rollBack_ErrTest_0100
     * @tc.name RelationalStoreErrTest22
     * @tc.desc Test rollBack
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_rollBack_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_rollBack_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != null) {
          let txId: number;
          (store as relationalStore.RdbStore).beginTrans().then((txId: number) => {
            (store as relationalStore.RdbStore).execute("DELETE FROM TEST WHERE age = ? OR age = ?", txId, ["18", "20"])
              .then(() => {
                (store as relationalStore.RdbStore).commit(txId);
              })
              .catch((err: BusinessError) => {
                try {
                  (store as relationalStore.RdbStore).rollback(null);
                  expect().assertFail();
                } catch (err) {
                  console.error(TAG + 'Failed to rollback.Code: ' + err.code + ',message:' + err.message);
                  expect(err.code).assertEqual('401');
                }
              });
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_rollBack_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0100
     * @tc.name RelationalStoreErrTest23
     * @tc.desc Test obtainDistributedTableName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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

        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined && deviceId != undefined) {
          (store as relationalStore.RdbStore).obtainDistributedTableName(deviceId, "EMPLOYEE", (err, tableName) => {
            if (err) {
              console.error(TAG + 'Failed to obtainDistributedTableName.Code: ' + err.code + ',message:' + err.message);
              expect(err.code).assertEqual('801')
            }
            console.info(TAG + `ObtainDistributedTableName successfully, tableName= ${tableName}`);
          })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0200
     * @tc.name RelationalStoreErrTest24
     * @tc.desc Test obtainDistributedTableName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG +
          "-----SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0200 start-----")
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

        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined && deviceId != undefined) {
          (store as relationalStore.RdbStore).obtainDistributedTableName(deviceId, "EMPLOYEE")
            .then((tableName: string) => {
              console.info(TAG + `ObtainDistributedTableName successfully, tableName= ${tableName}`);
              // expect(tableName).assertEqual(tableName);
            })
            .catch((err: BusinessError) => {
              console.error(TAG + 'Failed to obtainDistributedTableName.Code: ' + err.code + ',message:' + err.message);
              expect(err.code).assertEqual('801')
            })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_obtainDistributedTableName_ErrTest_0200 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_sync_ErrTest_0100
     * @tc.name RelationalStoreErrTest25
     * @tc.desc Test sync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_sync_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
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

        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.inDevices(deviceIds);
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).sync(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates,
            (err, result) => {
              if (err) {
                console.error(TAG + 'Failed to sync.Code: ' + err.code + ',message:' + err.message);
                expect(err.code).assertEqual('801')
              }
              console.info('Sync done.');
              for (let i = 0; i < result.length; i++) {
                console.info(TAG + `device= ${result[i][0]}, status= ${result[i][1]}`);
              }
            })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_sync_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_sync_ErrTest_0200
     * @tc.name RelationalStoreErrTest26
     * @tc.desc Test sync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_sync_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_sync_ErrTest_0200 start-----")
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
          console.error("createDeviceManager errCode:" + code + ",errMessage:" + message);
        }

        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.inDevices(deviceIds);
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).sync(relationalStore.SyncMode.SYNC_MODE_PUSH, predicates)
            .then((result: Object[][]) => {
              console.info('Sync done.');
              for (let i = 0; i < result.length; i++) {
                console.info(`device= ${result[i][0]}, status= ${result[i][1]}`);
              }
            })
            .catch((err: BusinessError) => {
              console.error(TAG + 'Failed to sync.Code: ' + err.code + ',message:' + err.message);
              expect(err.code).assertEqual('801');
            })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_sync_ErrTest_0200 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0100
     * @tc.name RelationalStoreErrTest27
     * @tc.desc Test cloudSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST,
            (progressDetails) => {
              console.info(TAG + `Progess: ${progressDetails}`);
            }, (err) => {
              if (err) {
                console.error(TAG + 'Failed to cloudSync.Code: ' + err.code + ',message:' + err.message);
                expect(err.code).assertEqual('801');
              }
              console.info(TAG + 'Cloud sync succeeded');
            });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0200
     * @tc.name RelationalStoreErrTest28
     * @tc.desc Test cloudSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0200 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST,
            (progressDetails) => {
              console.info(TAG + `Progess: ${progressDetails}`);
            }, (err) => {
              if (err) {
                console.error(TAG + 'Failed to cloudSync.Code: ' + err.code + ',message:' + err.message);
                expect(err.code).assertEqual('801');
              }
              console.info(TAG + 'Cloud sync succeeded');
            });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0200 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0300
     * @tc.name RelationalStoreErrTest29
     * @tc.desc Test cloudSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0300 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        const tables = ["table1", "table2"];

        if (store != undefined) {
          (store as relationalStore.RdbStore).cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, tables,
            (progressDetail: relationalStore.ProgressDetails) => {
              console.info(TAG + `Progess: ${progressDetail}`);
            }, (err) => {
              if (err) {
                console.error(TAG + 'Failed to cloudSync.Code: ' + err.code + ',message:' + err.message);
                expect(err.code).assertEqual('801');
              }
              console.info('Cloud sync succeeded');
            });
        }
        ;
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0300 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0400
     * @tc.name RelationalStoreErrTest30
     * @tc.desc Test cloudSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0400 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        const tables = ["table1", "table2"];

        if (store != undefined) {
          (store as relationalStore.RdbStore).cloudSync(relationalStore.SyncMode.SYNC_MODE_CLOUD_FIRST, tables,
            (progressDetail: relationalStore.ProgressDetails) => {
              console.info(TAG + `progress: ${progressDetail}`);
            }).then(() => {
            console.info(TAG + 'Cloud sync succeeded');
          }).catch((err: BusinessError) => {
            console.error(TAG + 'Failed to cloudSync.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801');
          });
        }
        ;
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cloudSync_ErrTest_0400 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0100
     * @tc.name RelationalStoreErrTest31
     * @tc.desc Test remoteQuery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0100 start-----")
        let dmInstance: distributedDeviceManager.DeviceManager;
        let deviceId: string | undefined = undefined;

        try {
          dmInstance = distributedDeviceManager.createDeviceManager("com.example.appdatamgrverify");
          let devices = dmInstance.getAvailableDeviceListSync();
          if (deviceId != undefined) {
            deviceId = devices[0].networkId;
          }
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + "createDeviceManager errCode:" + code + ",errMessage:" + message);
        }

        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined && deviceId != undefined) {
          (store as relationalStore.RdbStore).remoteQuery(null, "EMPLOYEE", predicates,
            ["ID", "NAME", "AGE", "SALARY", "CODES"]).then((resultSet: relationalStore.ResultSet) => {
            expect().assertFail();
          }).catch((err: BusinessError) => {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401')
          })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0200
     * @tc.name RelationalStoreErrTest32
     * @tc.desc Test remoteQuery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0200 start-----")
        let dmInstance: distributedDeviceManager.DeviceManager;
        let deviceId: string | undefined = undefined;

        try {
          dmInstance = distributedDeviceManager.createDeviceManager("com.example.appdatamgrverify");
          let devices = dmInstance.getAvailableDeviceListSync();
          if (deviceId != undefined) {
            deviceId = devices[0].networkId;
          }
        } catch (err) {
          let code = (err as BusinessError).code;
          let message = (err as BusinessError).message;
          console.error(TAG + "createDeviceManager errCode:" + code + ",errMessage:" + message);
        }

        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.greaterThan("id", 0);
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined && deviceId != undefined) {
          (store as relationalStore.RdbStore).remoteQuery(deviceId, "EMPLOYEE", predicates,
            ["ID", "NAME", "AGE", "SALARY", "CODES"]).then((resultSet: relationalStore.ResultSet) => {
            console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          }).catch((err: BusinessError) => {
            console.error(TAG + 'Failed to remoteQuery.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801')
          })
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_remoteQuery_ErrTest_0200 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0100
     * @tc.name RelationalStoreErrTest33
     * @tc.desc Test on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0100 start-----")
        let storeObserver = (devices: Array<string>) => {
          if (devices != undefined) {
            for (let i = 0; i < devices.length; i++) {
              console.info(TAG + `device= ${devices[i]} data changed`);
            }
          }
        }
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
              storeObserver);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0200
     * @tc.name RelationalStoreErrTest34
     * @tc.desc Test on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0200 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let storeObserver = (devices: Array<string>) => {
          if (devices != undefined) {
            for (let i = 0; i < devices.length; i++) {
              console.info(`device= ${devices[i]} data changed`);
            }
          }
        }
        try {
          if(store != undefined) {
            (store as relationalStore.RdbStore).on('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE, storeObserver);
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0200 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0300
     * @tc.name RelationalStoreErrTest35
     * @tc.desc Test on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0300 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let storeObserver = () => {
          console.info(TAG + `storeObserver`);
        }
        try {
          if(store != undefined) {
            (store as relationalStore.RdbStore).on('storeObserver', false, storeObserver);
            console.info(TAG + 'on success.')
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0300 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0400
     * @tc.name RelationalStoreErrTest36
     * @tc.desc Test on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0400 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let storeObserver = () => {
          console.info(`storeObserver`);
        }
        if(store != undefined) {
          try {
            (store as relationalStore.RdbStore).on(null, false, storeObserver);
            console.info(TAG + 'on success.');
          } catch (err) {
            console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
            if (err.code == 801) {
              expect(err.code).assertEqual('801');
            }
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0400 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0500
     * @tc.name RelationalStoreErrTest37
     * @tc.desc Test on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0500 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let progressDetail = (progressDetail: relationalStore.ProgressDetails) => {
          console.info(`progress: ${progressDetail}`);
        }
        if(store != undefined) {
          try {
            (store as relationalStore.RdbStore).on('autoSyncProgress', progressDetail);
          } catch (err) {
            console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
            if (err.code == '14800000') {
              expect(err.code).assertEqual('401')
            }
          }

        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0500 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0600
     * @tc.name RelationalStoreErrTest38
     * @tc.desc Test on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0600 start-----")
        let progressDetail = (progressDetail: relationalStore.ProgressDetails) => {
          console.info(`progress: ${progressDetail}`);
        }
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on('autoSyncProgress', progressDetail);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0600 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0700
     * @tc.name RelationalStoreErrTest39
     * @tc.desc Test on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0700 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on('statistics', null);
            expect().assertFail();
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0700 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_on_ErrTest_0800
     * @tc.name RelationalStoreErrTest40
     * @tc.desc Test on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_on_ErrTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0800 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let sqlExecutionInfo = (sqlExecutionInfo: relationalStore.SqlExecutionInfo) => {
          console.info(`sql: ${sqlExecutionInfo.sql[0]}`);
          console.info(`totalTime: ${sqlExecutionInfo.totalTime}`);
          console.info(`waitTime: ${sqlExecutionInfo.waitTime}`);
          console.info(`prepareTime: ${sqlExecutionInfo.prepareTime}`);
          console.info(`executeTime: ${sqlExecutionInfo.executeTime}`);
        }

        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).on('statistics', sqlExecutionInfo);
            console.info(TAG + 'on success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to on.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_on_ErrTest_0800 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0100
     * @tc.name RelationalStoreErrTest41
     * @tc.desc Test off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0100 start-----")
        let storeObserver = (devices: Array<string>) => {
          if (devices != undefined) {
            for (let i = 0; i < devices.length; i++) {
              console.info(TAG + `device= ${devices[i]} data changed`);
            }
          }
        }
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
              storeObserver);
            console.info(TAG + 'off success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801')
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0200
     * @tc.name RelationalStoreErrTest42
     * @tc.desc Test off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0200 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off('dataChange', relationalStore.SubscribeType.SUBSCRIBE_TYPE_REMOTE,
              null);
            expect().assertFail();
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0200 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0300
     * @tc.name RelationalStoreErrTest43
     * @tc.desc Test off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0300 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off('storeObserver', false, null);
            expect().assertFail();
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0300 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0400
     * @tc.name RelationalStoreErrTest44
     * @tc.desc Test off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0400 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let storeObserver = () => {
          console.info(TAG + `storeObserver`);
        }
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off('storeObserver', false, storeObserver);
            console.info(TAG + 'off success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0400 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0500
     * @tc.name RelationalStoreErrTest45
     * @tc.desc Test off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0500 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off('autoSyncProgress', null);
            expect().assertFail();
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0500 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0600
     * @tc.name RelationalStoreErrTest46
     * @tc.desc Test off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0600 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let progressDetail = (progressDetail: relationalStore.ProgressDetails) => {
          console.info(TAG + `progress: ${progressDetail}`);
        }
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off('autoSyncProgress', progressDetail);
            console.info(TAG + 'off success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0600 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0700
     * @tc.name RelationalStoreErrTest47
     * @tc.desc Test off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0700 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off(null);
            expect().assertFail()
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0700 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_off_ErrTest_0800
     * @tc.name RelationalStoreErrTest48
     * @tc.desc Test off
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_off_ErrTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0800 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        try {
          if (store != undefined) {
            (store as relationalStore.RdbStore).off('statistics');
            console.info(TAG + 'off success.');
          }
        } catch (err) {
          console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('801');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_off_ErrTest_0800 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_emit_ErrTest_0100
     * @tc.name RelationalStoreErrTest49
     * @tc.desc Test emit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_emit_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_emit_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try {
            (store as relationalStore.RdbStore).emit('storeObserver');
            console.info(TAG + 'emit success.');
          } catch (err) {
            console.error(TAG + 'Failed to off.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801');
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_emit_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_emit_ErrTest_0200
     * @tc.name RelationalStoreErrTest50
     * @tc.desc Test emit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_emit_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_emit_ErrTest_0200 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try {
            (store as relationalStore.RdbStore).emit(null);
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to emit.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401');
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_emit_ErrTest_0200 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0100
     * @tc.name RelationalStoreErrTest51
     * @tc.desc Test queryLockedRow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let predicates = new relationalStore.RdbPredicates("EMPLOYEE");
        predicates.equalTo("NAME", "Rose");
        if (store != undefined) {
          try {
            (store as relationalStore.RdbStore).queryLockedRow(null, ["ID", "NAME", "AGE", "SALARY", "CODES"]);
            console.info(TAG + 'queryLockedRow success')
          } catch (err) {
            console.error(TAG + 'Failed to queryLockedRow.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401')
          }

        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_queryLockedRow_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_insert_ErrTest_0100
     * @tc.name RelationalStoreErrTest52
     * @tc.desc Test insert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_insert_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_insert_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            transaction.insert("EMPLOYEE", null, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
              .then((rowId: number) => {
                transaction.rollback();
                expect().assertFail();
              })
              .catch((err: BusinessError) => {
                console.error(TAG + 'Failed to insert.Code: ' + err.code + ',message:' + err.message);
                transaction.rollback();
                expect(err.code).assertEqual('401');
              });
          }).catch((err: BusinessError) => {
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
            expect().assertFail();
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_insert_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_insertSync_ErrTest_0100
     * @tc.name RelationalStoreErrTest53
     * @tc.desc Test insertSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_insertSync_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try {
              let rowId: number = (transaction as relationalStore.Transaction).insertSync("EMPLOYEE", null,
                relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
              transaction.rollback();
              expect().assertFail();
            } catch (err) {
              console.error(TAG + 'Failed to insertSync.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual('401');
            }
            ;
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401')
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_insertSync_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0100
     * @tc.name RelationalStoreErrTest54
     * @tc.desc Test batchInsert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            transaction.batchInsert("EMPLOYEE", null).then((insertNum: number) => {
              transaction.rollback();
              expect().assertFail();
            }).catch((err: BusinessError) => {
              console.error(TAG + 'Failed to batchInsert.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual('401');
            });
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401');
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsert_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0100
     * @tc.name RelationalStoreErrTest55
     * @tc.desc Test batchInsertSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try {
              let insertNum: number = (transaction as relationalStore.Transaction).batchInsertSync("EMPLOYEE", null);
              transaction.rollback();
              expect().assertFail();
            } catch (err) {
              console.error(TAG + 'Failed to batchInsertSync.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual('401');
            }
            ;
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401');
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_batchInsertSync_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_update_ErrTest_0100
     * @tc.name RelationalStoreErrTest56
     * @tc.desc Test update
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_update_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_update_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        let predicates = new relationalStore.RdbPredicates('EMPLOYEE');
        predicates.equalTo("NAME", "Lisa");

        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            transaction.update(null, predicates, relationalStore.ConflictResolution.ON_CONFLICT_REPLACE)
              .then(async (rows: Number) => {
                transaction.rollback();
                expect().assertFail();
              })
              .catch((err: BusinessError) => {
                console.error(TAG + 'Failed to update.Code: ' + err.code + ',message:' + err.message);
                transaction.rollback();
                expect(err.code).assertEqual('401');
              });
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401');
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_update_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_updateSync_ErrTest_0100
     * @tc.name RelationalStoreErrTest57
     * @tc.desc Test updateSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_updateSync_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_updateSync_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try {
              let rows: Number = (transaction as relationalStore.Transaction).updateSync(null, null,
                relationalStore.ConflictResolution.ON_CONFLICT_REPLACE);
              transaction.rollback();
              expect().assertFail();
            } catch (err) {
              console.error(TAG + 'Failed to updateSync.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual('401');
            }
            ;
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401');
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_updateSync_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_delete_ErrTest_0100
     * @tc.name RelationalStoreErrTest58
     * @tc.desc Test delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_delete_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_delete_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            transaction.delete(null).then((rows: Number) => {
              transaction.rollback();
              expect().assertFail();
            }).catch((err: BusinessError) => {
              console.error(TAG + 'Failed to delete.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual('401');
            });
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401');
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_delete_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_deleteSync_ErrTest_0100
     * @tc.name RelationalStoreErrTest59
     * @tc.desc Test deleteSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_deleteSync_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_deleteSync_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try {
              let rows: Number = (transaction as relationalStore.Transaction).deleteSync(null);
              transaction.rollback();
              expect().assertFail();
            } catch (err) {
              console.error(TAG + 'Failed to deleteSync.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual('401');
            }
            ;
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401');
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_deleteSync_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_query_ErrTest_0100
     * @tc.name RelationalStoreErrTest60
     * @tc.desc Test query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_query_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_query_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            transaction.query(null, ["ID", "NAME", "AGE", "SALARY", "CODES"])
              .then((resultSet: relationalStore.ResultSet) => {
                transaction.rollback();
                expect().assertFail()
              })
              .catch((err: BusinessError) => {
                console.error(TAG + 'Failed to query.Code: ' + err.code + ',message:' + err.message);
                transaction.rollback();
                expect(err.code).assertEqual('401');
              });
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401');
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_query_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_querySync_ErrTest_0100
     * @tc.name RelationalStoreErrTest61
     * @tc.desc Test querySync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_querySync_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_querySync_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try {
              let resultSet: relationalStore.ResultSet =
                (transaction as relationalStore.Transaction).querySync(null, ["ID", "NAME", "AGE", "SALARY", "CODES"]);
              transaction.rollback();
              expect().assertFail();
            } catch (err) {
              console.error(TAG + 'Failed to querySync.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual('401');
            }
            ;
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401');
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_querySync_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_querySqlSync_ErrTest_0100
     * @tc.name RelationalStoreErrTest62
     * @tc.desc Test querySqlSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_querySqlSync_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_querySqlSync_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          (store as relationalStore.RdbStore).createTransaction().then((transaction: relationalStore.Transaction) => {
            try {
              let resultSet: relationalStore.ResultSet =
                (transaction as relationalStore.Transaction).querySqlSync(null);
              transaction.rollback();
              expect().assertFail();
            } catch (err) {
              console.error(TAG + 'Failed to querySqlSync.Code: ' + err.code + ',message:' + err.message);
              transaction.rollback();
              expect(err.code).assertEqual('401');
            };
          }).catch((err: BusinessError) => {
            expect(err.code).assertEqual('401');
            console.error(TAG + `createTransaction failed, code is ${err.code},message is ${err.message}`);
          });
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_querySqlSync_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_execute_ErrTest_0200
     * @tc.name RelationalStoreErrTest63
     * @tc.desc Test execute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_execute_ErrTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_execute_ErrTest_0200 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try {
            (store as relationalStore.RdbStore).execute(null).then((data) => {});
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to execute.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401');
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_execute_ErrTest_0200 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_executeSync_ErrTest_0100
     * @tc.name RelationalStoreErrTest64
     * @tc.desc Test executeSync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_executeSync_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_executeSync_ErrTest_0100 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if (store != undefined) {
          try {
            let data = (store as relationalStore.RdbStore).executeSync(null)
            expect().assertFail();
          } catch (err) {
            console.error(TAG + 'Failed to executeSync.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('401');
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_executeSync_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_isTokenizerSupported_ErrTest_0100
     * @tc.name RelationalStoreErrTest65
     * @tc.desc Test isTokenizerSupported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_isTokenizerSupported_ErrTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_isTokenizerSupported_ErrTest_0100 start-----")
       try {
         let customTypeSupported = relationalStore.isTokenizerSupported(null);
         expect().assertFail();
       } catch (err) {
         console.error(TAG + 'Failed to isTokenizerSupported.Code: ' + err.code + ',message:' + err.message);
         expect(err.code).assertEqual('401');
       }
       console.info(TAG + "-----SUB_DistributedData_RelationalStore_isTokenizerSupported_ErrTest_0100 end-----")
     })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_toSendableValuesBucket_ErrTest_0100
     * @tc.name RelationalStoreErrTest66
     * @tc.desc Test toSendableValuesBucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_toSendableValuesBucket_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_toSendableValuesBucket_ErrTest_0100 start-----")
        const asset1: relationalStore.Asset = {
          name: 'hangman',
          uri: '//path/example',
          path: '//path/example',
          createTime: 'createTime1',
          modifyTime: 'modifyTime1',
          size: 'size1',
          status: relationalStore.AssetStatus.ASSET_NORMAL,
        };
        const asset2: relationalStore.Asset = {
          name: 'hangman2',
          uri: '//path/example',
          path: '//path/example',
          createTime: 'createTime1',
          modifyTime: 'modifyTime1',
          size: 'size1',
          status: relationalStore.AssetStatus.ASSET_NORMAL,
        }
        const u8 = new Uint8Array([1, 2, 3]);
        const valuesBucket1: relationalStore.ValuesBucket = {
          nil: null,
          age: 18,
          name: "hangman",
          salary: 100.5,
          blobType: u8,
          blobFloat: new Float32Array([.125, 0.1875]),
          passed: true,
          bigValue: BigInt('15822401018187971961171'),
          data1: asset1,
          data2: [asset1, asset2],
        };
        try {
          let sendableValuesBucket: sendableRelationalStore.ValuesBucket =
            sendableRelationalStore.toSendableValuesBucket(valuesBucket1);
          console.info(TAG + 'toSendableValuesBucket success.')
        } catch (err) {
          console.error(TAG + 'Failed to toSendableValuesBucket.Code: ' + err.code + ',message:' + err.message);
          expect(err.code).assertEqual('401');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_toSendableValuesBucket_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_fromSendableValuesBucket_ErrTest_0100
     * @tc.name RelationalStoreErrTest67
     * @tc.desc Test fromSendableValuesBucket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_fromSendableValuesBucket_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_fromSendableValuesBucket_ErrTest_0100 start-----")
        const asset1: relationalStore.Asset = {
          name: 'hangman',
          uri: '//path/example',
          path: '//path/example',
          createTime: 'createTime1',
          modifyTime: 'modifyTime1',
          size: 'size1',
          status: relationalStore.AssetStatus.ASSET_NORMAL,
        };
        const asset2: relationalStore.Asset = {
          name: 'hangman2',
          uri: '//path/example',
          path: '//path/example',
          createTime: 'createTime1',
          modifyTime: 'modifyTime1',
          size: 'size1',
          status: relationalStore.AssetStatus.ASSET_NORMAL,
        }
        const u8 = new Uint8Array([1, 2, 3]);
        const valuesBucket1: relationalStore.ValuesBucket = {
          nil: null,
          age: 18,
          name: "hangman",
          salary: 100.5,
          blobType: u8,
          blobFloat: new Float32Array([.125, 0.1875]),
          passed: true,
          bigValue: BigInt('15822401018187971961171'),
          data1: asset1,
          data2: [asset1, asset2],
        };
        let sendableValuesBucket: sendableRelationalStore.ValuesBucket =
          sendableRelationalStore.toSendableValuesBucket(valuesBucket1);
        try {
          let valuesBucket: sendableRelationalStore.NonSendableBucket =
            sendableRelationalStore.fromSendableValuesBucket(sendableValuesBucket);
          console.info(TAG + 'fromSendableValuesBucket success')
        } catch (err) {
          expect(err.code).assertEqual('401');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_fromSendableValuesBucket_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_toSendableAsset_ErrTest_0100
     * @tc.name RelationalStoreErrTest68
     * @tc.desc Test toSendableAsset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_toSendableAsset_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_toSendableAsset_ErrTest_0100 start-----")
        const asset1: relationalStore.Asset = {
          name: 'hangman',
          uri: '//path/example',
          path: '//path/example',
          createTime: 'createTime1',
          modifyTime: 'modifyTime1',
          size: 'size1',
          status: relationalStore.AssetStatus.ASSET_NORMAL,
        };
        try {
          const sendableAsset: sendableRelationalStore.Asset = sendableRelationalStore.toSendableAsset(asset1);
          expect(sendableAsset.status).assertEqual(relationalStore.AssetStatus.ASSET_NORMAL);
          console.info(TAG + 'toSendableAsset success.')
        } catch (err) {
          expect(err.code).assertEqual('401');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_toSendableAsset_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_fromSendableAsset_ErrTest_0100
     * @tc.name RelationalStoreErrTest69
     * @tc.desc Test fromSendableAsset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_fromSendableAsset_ErrTest_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_fromSendableAsset_ErrTest_0100 start-----")
        const asset1: relationalStore.Asset = {
          name: 'hangman',
          uri: '//path/example',
          path: '//path/example',
          createTime: 'createTime1',
          modifyTime: 'modifyTime1',
          size: 'size1',
          status: relationalStore.AssetStatus.ASSET_NORMAL,
        };
        const sendableAsset: sendableRelationalStore.Asset = sendableRelationalStore.toSendableAsset(asset1);
        try {
          const normalAsset: sendableRelationalStore.NonSendableAsset =
            sendableRelationalStore.fromSendableAsset(sendableAsset);
          expect(sendableAsset.status).assertEqual(relationalStore.AssetStatus.ASSET_NORMAL);
          console.info(TAG + 'fromSendableAsset success.')
        } catch (err) {
          expect(err.code).assertEqual('401');
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_fromSendableAsset_ErrTest_0100 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0100
     * @tc.name RelationalStoreErrTest70
     * @tc.desc Test cleanDirtyData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0400 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if(store != undefined) {
          try {
            (store as relationalStore.RdbStore).cleanDirtyData('test_table', 100, (err) => {
              console.info(TAG + 'clean dirty data succeeded');
            })
          } catch (err) {
            console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801');
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0400 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0500
     * @tc.name RelationalStoreErrTest71
     * @tc.desc Test cleanDirtyData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0500 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if(store != undefined) {
          try {
            (store as relationalStore.RdbStore).cleanDirtyData('test_table', (err) => {
              console.info(TAG + 'clean dirty data succeeded');
            })
          } catch (err) {
            console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801');
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0500 end-----")
      })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0600
     * @tc.name RelationalStoreErrTest72
     * @tc.desc Test cleanDirtyData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0600 start-----")
        let context: common.UIAbilityContext | undefined = AppStorage.get('context') as common.UIAbilityContext
        store = await relationalStore.getRdbStore(context, STORE_CONFIG);
        if(store != undefined) {
          try {
            (store as relationalStore.RdbStore).cleanDirtyData('test_table', 100);
            console.info(TAG + 'clean dirty data succeeded');
          } catch (err) {
            console.error(TAG + 'Failed to cleanDirtyData.Code: ' + err.code + ',message:' + err.message);
            expect(err.code).assertEqual('801');
          }
        }
        console.info(TAG + "-----SUB_DistributedData_RelationalStore_cleanDirtyData_ErrTest_0600 end-----")
      })
  })
}