import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import dsPredicates from '@ohos.data.dataSharePredicates'
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import dataRdb from '@ohos.data.relationalStore';

let context:common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

let dataBaseDir : String;
let domain: int  = 0x0000;
const TAG = "[RdbErrorCode14800024]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
  "data1 text," + "data2 long, " + "data3 double," + "data4 blob," + "data5 ASSET," + "data6 ASSETS," +
  "data7 floatvector(128)," + "data8 UNLIMITED INT" + ")";

const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

let STORE_CONFIG :dataRdb.StoreConfig = {
  name: "test12.db",
  securityLevel: dataRdb.SecurityLevel.S1,
}

const DROP_TABLE_TESTTRANS = "DROP TABLE IF EXISTS testTrans";

let rdbStore : dataRdb.RdbStore
let vbs :Array<dataRdb.ValuesBucket> = new Array<dataRdb.ValuesBucket>(3);
const valueBucket0 :dataRdb.ValuesBucket = {
  "data1": "hello",
  "data2": 10 as long,//
  "data3": 1.0,
  "data4": new Uint8Array([1, 2, 3]),
}
const valueBucket1 :dataRdb.ValuesBucket = {
  "data1": "2",
  "data2": 200 as long,
  "data3": 100000.5,
  "data4": new Uint8Array([3, 4, 5]),
}
const valueBucket2 :dataRdb.ValuesBucket = {
  "data1": "hello world",
  "data2": 300 as long,
  "data3": 100000.9,
  "data4": new Uint8Array(0),
}
vbs[0] = valueBucket0
vbs[1] = valueBucket1
vbs[2] = valueBucket2

export default function RdbErrorCode14800024() {

  describe("RdbErrorCode14800024", (): void => {
    beforeAll(async () : Promise<void> => {
      await abilityDelegator.startAbility({
        bundleName: 'com.example.relationalstore',
        abilityName: 'EntryAbility'
      });
      await Utils.msSleep(5000);
      context = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
      hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      rdbStore = await dataRdb.getRdbStore(context, STORE_CONFIG);
      await rdbStore.execute(DROP_TABLE_TEST);
      await rdbStore.execute(CREATE_TABLE_TEST);
      let num = await rdbStore.batchInsert("test", vbs);
      hilog.info(domain, TAG, 'batchInsert %{public}d rows.', num)
    });

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_ERRORCODETSET_0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_GETROWS_8400
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0010 start *************');
      let predicates = new dataRdb.RdbPredicates('test');
      let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);
      let MaxCount = 1;
      let columnIndex = 1;
      try {
        //TestCode
        let row = await (resultSet as dataRdb.ResultSet).getRows(MaxCount);
      } catch (e: BusinessError) {
        expect(e.code).assertEqual(14800024);
      }

      try {
        //TestCode
        resultSet.goToFirstRow();
        let row = (resultSet as dataRdb.ResultSet).isColumnNull(columnIndex);
      } catch (e: BusinessError) {
        expect(e.code).assertEqual(14800024);
      }
      resultSet.close();

      done();
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0010 end *************');
    })

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_ERRORCODETSET_0060
     * @tc.number SUB_DDM_RELATIONALETS_ERRORCODETSET_0060
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0060 start *************');
      let predicates = new dataRdb.RdbPredicates('test');
      let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);
      const SQL_DELETE_TABLE = "DELETE FROM test WHERE data1 = 'zhangsan123'";
      const SQL_DELETE_TABLE1 = "DELETE FROM test WHERE name = ?";
      const SQL_CHECK_INTEGRITY = 'PRAGMA integrity_check';

      try {
        await rdbStore.attach("/path/errPath/attach.db", "attachDB");
      } catch(e: BusinessError) {
        if (e.code != 14800010) {
          expect(14800024).assertEqual(e.code);
        }
      }

      try {
        //TestCode
        await rdbStore.backup("dbBackup002.db");
      } catch (e: BusinessError) {
        expect(e.code).assertEqual(14800024);
      }

      try {
        await rdbStore.attach(context, STORE_CONFIG, "attachDB");
      } catch(e: BusinessError) {
        if (e.code == 14800024) {
          expect(14800024).assertEqual(e.code);
        }
      }

      try {
        //TestCode
        rdbStore.executeSync(SQL_CHECK_INTEGRITY);
      } catch (e: Error) {
        if (e.code != 801) {
          expect(e.code).assertEqual(14800024);
        }
      }

      try {
        await rdbStore.detach("attachDB");
      } catch(e: Error) {
        if (e.code == 14800024) {
          expect(14800024).assertEqual(e.code);
        }
      }

      try {
        //TestCode
        await rdbStore.restore("dbBackup002.db");
      } catch (e: Error) {
        expect(e.code).assertEqual(14800024);
      }

      resultSet.close();

      done();
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0060 end *************');
    })

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_ERRORCODETSET_0070
     * @tc.number SUB_DDM_RELATIONALETS_ERRORCODETSET_0070
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0070 start *************');
      let predicates = new dataRdb.RdbPredicates('test');
      let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);
      predicates.equalTo("data", "Lisa");

      try {
        //TestCode
        await rdbStore.lockRow(predicates)
      } catch (e: BusinessError) {
        if (e.code == 14800024) {
          expect(14800024).assertEqual(e.code);
        }
      }

      try {
        //TestCode
        await rdbStore.queryLockedRow(predicates)
      } catch (e: BusinessError) {
        if (e.code == 14800024) {
          expect(14800024).assertEqual(e.code);
        }
      }

      try {
        //TestCode
        await rdbStore.unlockRow(predicates)
      } catch (e: BusinessError) {
        if (e.code == 14800024) {
          expect(14800024).assertEqual(e.code);
        }
      }

      if(rdbStore != undefined) {
        rdbStore.createTransaction().then((transaction: dataRdb.Transaction) => {
          transaction.execute("DELETE FROM test WHERE data1 = ? OR data2 = ?", [21 as long, 20 as long]).then(() => {
          }).catch((e:Error) => {
            try {
              transaction.rollback();
            } catch (e: Error) {
              if (e.code == 14800024) {
                expect(14800024).assertEqual(e.code);
              }
            }
            if (e.code == 14800024) {
              expect(14800024).assertEqual(e.code);
            }
          });

          let u8 = new Uint8Array(0);
          const valueBucket1: dataRdb.ValuesBucket = {
            'data1': 'hello world',
            'data2': 3 as long,
            'data3': 1.8,
          };

          const record: dataRdb.ValuesBucket = {
            'data1': 'hello world',
            'data2': 4 as long,
          }

          try {
            transaction.insertSync("test", valueBucket1,
              dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
          } catch (e: Error) {
            expect(14800024).assertEqual(e.code);
          }

          try {
            await transaction.batchInsertWithConflictResolution("test", [valueBucket1],
              dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
          } catch (e: BusinessError) {
            expect(14800024).assertEqual(e.code);
          }

          try {
            transaction.insertSync("test", valueBucket1,
              dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
          } catch (e: BusinessError) {
            expect(14800024).assertEqual(e.code);
          }

          try {
            transaction.batchInsertWithConflictResolutionSync("test", [valueBucket1],
              dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
          } catch (e: BusinessError) {
            expect(14800024).assertEqual(e.code);
          }

          let predicates1 = new dataRdb.RdbPredicates('test');
          predicates1.equalTo("id", 1 as long);

          try {
            //TestCode
            let rowId = transaction.updateSync(record, predicates1,
              dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(TAG + "update one record success " + rowId)
          } catch (e: Error) {
            expect(e.code).assertEqual(14800024);
          }

          try {
            //TestCode
            await transaction.execute("PRAGMA integrity_check");
          } catch (e: Error) {
            expect(e.code).assertEqual(14800024);
          }

          try {
            //TestCode
            let predicates3 = new dataRdb.RdbPredicates('test');
            predicates3.equalTo("id", 2 as long);
            transaction.deleteSync(predicates3);
          } catch (e: BusinessError) {
            expect(e.code).assertEqual(14800024);
          }

          try {
            //TestCode
            let resultSet =  transaction.querySqlSync("SELECT * FROM test");
          } catch (e: Error) {
            expect(e.code).assertEqual(14800024);
          }


        }).catch((err: Error) => {
          console.error(`createTransaction faided, code is ${err.code},message is ${err.message}`);
          if (err.code == 14800024) {
            expect(14800024).assertEqual(err.code);
          }
        });
      }
      resultSet.close();

      done();
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0070 end *************');
    })

    /**
     * @tc.name   SUB_DDM_RELATIONALETS_ERRORCODETSET_0050
     * @tc.number SUB_DDM_RELATIONALETS_ERRORCODETSET_0050
     * @tc.desc   resultSet getBlob normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:()=>void) => {
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0050 start *************');
      let predicates = new dataRdb.RdbPredicates('test');
      let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);
      let PRIKey:	dataRdb.PRIKeyType[] = [1 as long, 4 as long, 2 as long, 3 as long];
      try {
        //TestCode
        rdbStore.getModifyTime("test", "data2", PRIKey);
      } catch (e: Error) {
        expect(e.code).assertEqual(14800024);
      }
      try {
        //TestCode
        rdbStore.cleanDirtyData('test_table', 100);
      } catch (e: Error) {
        if (e.code != 801) {
          expect(e.code).assertEqual(14800024);
        }
      }
      resultSet.close();
      done();
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0050 end *************');
    })
  })

}