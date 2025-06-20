/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import dataRdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { sendableRelationalStore } from '@kit.ArkData';

const TAG = '[RDB_JSKITS_TEST]';
let bigdata = 'a'.repeat(100)
const CREATE_TABLE_TEST = 'CREATE TABLE IF NOT EXISTS test (' + 'id INTEGER PRIMARY KEY AUTOINCREMENT, ' + bigdata
    + ' text,' + '"邮箱：abc#$123@abc.com" long,' + '"@#$%^&*" text,' + '" " text,' + '年龄 long,' + '"null" text,'
    + 'data text,' + 'data1 text,' + 'data2 long, ' + 'data3 double,' + 'data4 blob,' + '"1" INTEGER)';
let context: common.UIAbilityContext;
const STORE_CONFIG: dataRdb.StoreConfig = {
    name: 'Resultset.db',
    securityLevel: dataRdb.SecurityLevel.S1
};

const COLOUNM_NAMES = ["id","data1","data2","data3","data4"];
let rdbStore: dataRdb.RdbStore;
let resultSet: dataRdb.ResultSet | null = null;

    //插入数据
    async function createTest() {
        console.info(TAG + 'createTest data start');
        {
            let u8 = new Uint8Array([1, 2, 3]);
            const valueBucket: dataRdb.ValuesBucket = {
                'data1': 'hello',
                'data2': 10,
                'data3': 1.0,
                'data4': u8,
                '"1"': 123,
                'data': 'data',
                '年龄': 13,
                '" "': 'kong',
                '"@#$%^&*"': 'special',
                '"邮箱：abc#$123@abc.com"':'abc#$123@abc.com',
                '"null"': 'null'
            };
            await rdbStore.insert('test', valueBucket);
        }
        {
            let u8 = new Uint8Array([3, 4, 5]);
            const valueBucket: dataRdb.ValuesBucket = {
                'data1': '2',
                'data2': -5,
                'data3': 2.5,
                'data4': u8,
            };
            await rdbStore.insert('test', valueBucket);
        }
        {
            let u8 = new Uint8Array(0);
            const valueBucket: dataRdb.ValuesBucket = {
                'data1': 'hello world',
                'data2': 3,
                'data3': 1.8,
                'data4': u8,
            };
            await rdbStore.insert('test', valueBucket);
        }
        console.info(TAG + 'createTest data end');
    }

export default function relationalStoreErrorCodeTest() {
describe('relationalStoreErrorCodeTest', () => {
    beforeAll(async () => {
        console.info(TAG + 'beforeAll');
        context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
        rdbStore = await dataRdb.getRdbStore(context, STORE_CONFIG);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        await createTest();
    })

    beforeEach(async () => {
        console.info(TAG + 'beforeEach');
    })

    afterEach(() => {
        console.info(TAG + 'afterEach');
    })

    afterAll(async () => {
        console.info(TAG + 'afterAll');
        let rdbStore: dataRdb.RdbStore;
        await dataRdb.deleteRdbStore(context, 'Resultset.db');
    })

    /**
     * @tc.name SUB_DDM_RELATIONALETS_RESULTSET_0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc resultSet getBlob normal test
	 * @tc.size MediumTest
	 * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_RESULTSET_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_RESULTSET_0010 start *************');
        let predicates = await new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);
        try {
            {
                expect(true).assertEqual(resultSet.goToFirstRow());
                const id = resultSet.getLong(resultSet.getColumnIndex('id'));
                const data4 = resultSet.getBlob(resultSet.getColumnIndex('data4'));
                console.info(TAG + 'id=' + id + ', data4=' + data4);
                expect(1).assertEqual(data4[0]);
                expect(2).assertEqual(data4[1]);
                expect(3).assertEqual(data4[2]);
            }
            resultSet.close();
            expect(true).assertEqual(resultSet.isClosed);
        } catch (e) {
            expect(null).assertFail();
        }
        
        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_RESULTSET_0010 end *************');
    })

	/**
   * @tc.name SUB_DDM_RELATIONALETS_RESULTSET_0020
   * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8300
   * @tc.desc resultSet getRow normal test
   * @tc.size MediumTest
   * @tc.type Function
   * @tc.level Level 2
   */
    it('SUB_DDM_RELATIONALETS_RESULTSET_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_RESULTSET_0020 start *************');
      let predicates = new dataRdb.RdbPredicates('test');
      let resultSet = await rdbStore.query(predicates);
      try {
        {
          expect(true).assertEqual(resultSet.goToFirstRow());
          let row = (resultSet as dataRdb.ResultSet).getRow();
          console.log(TAG + JSON.stringify(row));
          expect('hello').assertEqual(row.data1);
          expect(10).assertEqual(row.data2);
          expect(1.0).assertEqual(row.data3);
        }
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
      } catch (e) {
        expect(null).assertFail();
      }
      
      done();
      console.info(TAG + '************* SUB_DDM_RELATIONALETS_RESULTSET_0020 end *************');
    })
    /**
     * @tc.name SUB_DDM_RELATIONALETS_RESULTSET_0030
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8500
     * @tc.desc resultSet getRow normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_RESULTSET_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_RESULTSET_0030 start *************');
        let predicates = new dataRdb.RdbPredicates('test');
        let resultSet = await rdbStore.query(predicates);
        try {
            {
                expect(true).assertEqual(resultSet.goToFirstRow());
                let row = (resultSet as dataRdb.ResultSet).getRow();
                console.log(TAG + JSON.stringify(row));
                expect(123).assertEqual(row["1"]);
                expect('data').assertEqual(row['data']);
                expect(13).assertEqual(row['年龄']);
                expect('kong').assertEqual(row[' ']);
                expect('special').assertEqual(row['@#$%^&*']);
                expect(null).assertEqual(row[bigdata]);
                expect('abc#$123@abc.com').assertEqual(row['邮箱：abc#$123@abc.com']);
                expect('null').assertEqual(row['null']);
            }
            resultSet.close();
            expect(true).assertEqual(resultSet.isClosed);
        } catch (e) {
            expect(null).assertFail();
        }

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_RESULTSET_0030 end *************');
    })

    /**
     * @tc.name SUB_DDM_RELATIONALETS_ERRORCODETSET_0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc resultSet getBlob normal test
	 * @tc.size MediumTest
	 * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0010 start *************');
        let predicates = await new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);
        let MaxCount = 1;
        let columnIndex = 1;

        try {
            //TestCode
            let row = (resultSet as dataRdb.ResultSet).getRows(MaxCount);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            resultSet.goToFirstRow();
            let row = (resultSet as dataRdb.ResultSet).getSendableRow();
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            resultSet.goToFirstRow();
            let row = (resultSet as dataRdb.ResultSet).isColumnNull(columnIndex);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }


        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
        
        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0010 end *************');
    })


    /**
     * @tc.name SUB_DDM_RELATIONALETS_ERRORCODETSET_0020
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc resultSet getBlob normal test
	 * @tc.size MediumTest
	 * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0020 start *************');
        let predicates = await new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);

        let u8 = new Uint8Array(0);
        const valueBucket: dataRdb.ValuesBucket = {
            'data1': 'hello world',
            'data2': 3,
            'data3': 1.8,
            'data4': u8,
        };

        try {
            //TestCode
            await rdbStore.insert('test', valueBucket);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            await rdbStore.insert('test', valueBucket, dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            rdbStore.insertSync('test', valueBucket, dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            const sendableValuesBucket = sendableRelationalStore.toSendableValuesBucket(valueBucket);
            rdbStore.insertSync('test', sendableValuesBucket, dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        let valueBuckets = new Array(valueBucket);
        try {
            //TestCode
            await rdbStore.batchInsert('test', valueBuckets);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            rdbStore.batchInsertSync('test', valueBuckets);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        rdbStore.insert('test', valueBucket, (err: BusinessError, rowID: number) => {
            if (err) {
                expect(err.code).assertEqual(14800024);
            }
        });

        rdbStore.insert('test', valueBucket, dataRdb.ConflictResolution.ON_CONFLICT_REPLACE,
            (err: BusinessError, rowID: number) => {
            if (err) {
                expect(err.code).assertEqual(14800024);
            }
        });

        rdbStore.batchInsert('test', valueBuckets, (err: BusinessError, rowID: number) => {
            if (err) {
                expect(err.code).assertEqual(14800024);
            }
        });

        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);
        
        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0020 end *************');
    })

    /**
     * @tc.name SUB_DDM_RELATIONALETS_ERRORCODETSET_0030
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0030 start *************');
        let predicates = await new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);

        const record: dataRdb.ValuesBucket = {
            'data1': 'hello world',
            'data2': 4,
        }
        predicates.equalTo("id", 1);

        try {
            //TestCode
            let rowId = await rdbStore.update(record, predicates);
            console.info(TAG + "update one record success " + rowId)
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            let rowId = await rdbStore.update(record, predicates, dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(TAG + "update one record success " + rowId)
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            let rowId = await rdbStore.updateSync(record, predicates, dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
            console.info(TAG + "update one record success " + rowId)
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        rdbStore.update(record, predicates, (err: BusinessError, rowID: number) => {
            if (err) {
                expect(err.code).assertEqual(14800024);
            }
        });

        rdbStore.update(record, predicates, dataRdb.ConflictResolution.ON_CONFLICT_REPLACE,
            (err: BusinessError, rowID: number) => {
            if (err) {
                expect(err.code).assertEqual(14800024);
            }
        });

        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0030 end *************');
    })

    /**
     * @tc.name SUB_DDM_RELATIONALETS_ERRORCODETSET_0040
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0040 start *************');
        let predicates = await new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);

        try {
            //TestCode
            let predicates1 = await new dataRdb.RdbPredicates('test');
            predicates1.equalTo("id", 1);
            rdbStore.delete(predicates1);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            let predicates2 = await new dataRdb.RdbPredicates('test');
            predicates2.equalTo("id", 2);
            rdbStore..deleteSync(predicates2);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        let predicates3 = await new dataRdb.RdbPredicates('test');
        predicates3.equalTo("id", 3);
        rdbStore.delete(predicates3, (err, rows) => {
            if (err) {
                expect(err.code).assertEqual(14800024);
            }
        })


        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0040 end *************');
    })

    /**
     * @tc.name SUB_DDM_RELATIONALETS_ERRORCODETSET_0050
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0050 start *************');
        let predicates = await new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);

        let PRIKey = [1, 4, 2, 3];

        try {
            //TestCode
            rdbStore.getModifyTime("test", "data2", PRIKey);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        if(rdbStore != undefined) {
            rdbStore.getModifyTime("test", "data2", PRIKey, (err, modifyTime: dataRdb.ModifyTime) => {
                if (err) {
                    expect(rr.code).assertEqual(14800024);
                }
            });
        }

        try {
            //TestCode
            rdbStore.cleanDirtyData('test_table', 100);
        } catch (e) {
            if (e.code != 801) {
                expect(e.code).assertEqual(14800024);
            }
        }

        if(rdbStore != undefined) {
            rdbStore.cleanDirtyData('test_table', 100, (err) => {
                if (err.code != 801) {
                    expect(err.code).assertEqual(14800024);
                }
            });
        }

        if(rdbStore != undefined) {
            rdbStore.cleanDirtyData('test_table', (err) => {
                if (err.code != 801) {
                    expect(err.code).assertEqual(14800024);
                }
            });
        }

        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0050 end *************');
    })

    /**
     * @tc.name SUB_DDM_RELATIONALETS_ERRORCODETSET_0060
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0060 start *************');
        let predicates = await new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);
        const SQL_DELETE_TABLE = "DELETE FROM test WHERE data1 = 'zhangsan123'";
        const SQL_DELETE_TABLE1 = "DELETE FROM test WHERE name = ?";
        const SQL_CHECK_INTEGRITY = 'PRAGMA integrity_check';

        try {
            //TestCode
            await rdbStore.executeSql(SQL_DELETE_TABLE1, ['zhangsan123']);
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            await rdbStore.execute(SQL_CHECK_INTEGRITY)
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            let txId = 0;
            await rdbStore.execute("DELETE FROM test WHERE age = ? OR age = ?", txId, ["18", "20"]);
        } catch (e) {
            if (e.code != 801) {
                expect(e.code).assertEqual(14800024);
            }
        }

        try {
            //TestCode
            await rdbStore.executeSync(SQL_CHECK_INTEGRITY);
        } catch (e) {
            if (e.code != 801) {
                expect(e.code).assertEqual(14800024);
            }
        }

        try {
            //TestCode
            let txId : number;
            rdbStore.beginTrans().then((txId : number) => {
                rdbStore.commit(txId);
            }).catch((err: BusinessError) => {
                rdbStore.rollback(txId);
            });
        } catch (e) {
            if (e.code != 801) {
                expect(e.code).assertEqual(14800024);
            }
        }

        try {
            //TestCode
            rdbStore.beginTransaction();
            rdbStore.commit()
        } catch (e) {
            try {
                rdbStore.rollback()
            } catch (e) {
                if (e.code != 801) {
                    expect(e.code).assertEqual(14800024);
                }
            }
            if (e.code != 801) {
                expect(e.code).assertEqual(14800024);
            }
        }

        if(rdbStore != undefined) {
            rdbStore.executeSql(SQL_DELETE_TABLE, (err) => {
                if (err.code != 801) {
                    expect(err.code).assertEqual(14800024);
                }
            });
        }

        if(rdbStore != undefined) {
            rdbStore.executeSql(SQL_DELETE_TABLE1, ['zhangsan123'], (err) => {
                if (err.code != 801) {
                    expect(err.code).assertEqual(14800024);
                }
            });
        }

        if(rdbStore != undefined) {
            rdbStore.backup("dbBackup001.db", (err) => {
                if (err.code != 801) {
                    expect(err.code).assertEqual(14800024);
                }
            });

            rdbStore.restore("dbBackup001.db", (err) => {
                if (err.code != 801) {
                    expect(err.code).assertEqual(14800024);
                }
            });
        }

        try {
            //TestCode
            await rdbStore.backup("dbBackup002.db");
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            //TestCode
            await rdbStore.restore("dbBackup002.db");
        } catch (e) {
            expect(e.code).assertEqual(14800024);
        }

        try {
            await rdbStore.attach("/path/errPath/attach.db", "attachDB");
        } catch(e) {
            if (e.code != 14800010) {
                expect(14800024).assertEqual(e.code);
            }
        }

        try {
            await rdbStore.attach(context, STORE_CONFIG, "attachDB");
        } catch(e) {
            if (e.code == 14800024) {
                expect(14800024).assertEqual(e.code);
            }
        }

        try {
            await rdbStore.detach("attachDB");
        } catch(e) {
            if (e.code == 14800024) {
                expect(14800024).assertEqual(e.code);
            }
        }

        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0060 end *************');
    })

    /**
     * @tc.name SUB_DDM_RELATIONALETS_ERRORCODETSET_0070
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0070 start *************');
        let predicates = await new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);

        predicates.equalTo("data", "Lisa");

        try {
            //TestCode
            await rdbStore.lockRow(predicates)
        } catch (e) {
            if (e.code == 14800024) {
                expect(14800024).assertEqual(e.code);
            }
        }

        try {
            //TestCode
            await rdbStore.queryLockedRow(predicates)
        } catch (e) {
            if (e.code == 14800024) {
                expect(14800024).assertEqual(e.code);
            }
        }

        try {
            //TestCode
            await rdbStore.unlockRow(predicates)
        } catch (e) {
            if (e.code == 14800024) {
                expect(14800024).assertEqual(e.code);
            }
        }

        if(rdbStore != undefined) {
            rdbStore.createTransaction().then((transaction: dataRdb.Transaction) => {
                transaction.execute("DELETE FROM test WHERE data1 = ? OR data2 = ?", [21, 20]).then(() => {
                }).catch((e: BusinessError) => {
                    try {
                        transaction.rollback();
                    } catch (e) {
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
                    'data2': 3,
                    'data3': 1.8,
                    'data4': u8,
                };

                try {
                    await transaction.insert("test", valueBucket1,
                        dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
                } catch (e) {
                        expect(14800024).assertEqual(e.code);
                }

                try {
                    await transaction.insertSync("test", valueBucket1,
                        dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
                } catch (e) {
                    expect(14800024).assertEqual(e.code);
                }

                let valueBuckets = new Array(valueBucket1);
                try {
                    await transaction.batchInsert("test", valueBuckets);
                } catch (e) {
                    expect(14800024).assertEqual(e.code);
                }

                let valueBuckets = new Array(valueBucket1);
                try {
                    transaction.batchInsertSync("test", valueBuckets);
                } catch (e) {
                    expect(14800024).assertEqual(e.code);
                }

                try {
                    await transaction.batchInsertWithConflictResolution("test", valueBucket1,
                        dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
                } catch (e) {
                    expect(14800024).assertEqual(e.code);
                }

                try {
                    transaction.batchInsertWithConflictResolutionSync("test", valueBucket1,
                        dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
                } catch (e) {
                    expect(14800024).assertEqual(e.code);
                }

                const record: dataRdb.ValuesBucket = {
                    'data1': 'hello world',
                    'data2': 4,
                }
                let predicates1 = await new dataRdb.RdbPredicates('test');
                predicates1.equalTo("id", 1);
                try {
                    //TestCode
                    let rowId = await transaction.update(record, predicates1,
                        dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
                    console.info(TAG + "update one record success " + rowId)
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    //TestCode
                    let rowId = transaction.updateSync(record, predicates1,
                        dataRdb.ConflictResolution.ON_CONFLICT_REPLACE);
                    console.info(TAG + "update one record success " + rowId)
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    //TestCode
                    let predicates2 = await new dataRdb.RdbPredicates('test');
                    predicates2.equalTo("id", 1);
                    transaction.delete(predicates2);
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    //TestCode
                    let predicates3 = await new dataRdb.RdbPredicates('test');
                    predicates3.equalTo("id", 2);
                    transaction.deleteSync(predicates3);
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    //TestCode
                    let resultSet: dataRdb.ResultSet1 = await transaction.query(predicates);
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    //TestCode
                    let resultSet: dataRdb.ResultSet2 = await transaction.querySync(predicates);
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    //TestCode
                    let resultSet: dataRdb.ResultSet2 = await transaction.querySql("SELECT * FROM test");
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    //TestCode
                    let resultSet: dataRdb.ResultSet3 =  transaction.querySqlSync("SELECT * FROM test");
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    //TestCode
                    await transaction.execute("PRAGMA integrity_check");
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    //TestCode
                    await transaction.executeSync("PRAGMA integrity_check");
                } catch (e) {
                    expect(e.code).assertEqual(14800024);
                }

                try {
                    transaction.commit();
                } catch (e) {
                    if (e.code == 14800024) {
                        expect(14800024).assertEqual(e.code);
                    }
                }

            }).catch((err: BusinessError) => {
                console.error(`createTransaction faided, code is ${err.code},message is ${err.message}`);
                if (e.code == 14800024) {
                    expect(14800024).assertEqual(e.code);
                }
            });
        }


        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0070 end *************');
    })

    /**
     * @tc.name SUB_DDM_RELATIONALETS_ERRORCODETSET_0010
     * @tc.number SUB_DistributedData_RelationalStore_SDK_ResultSetJsApiTest_8400
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_RELATIONALETS_ERRORCODETSET_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0080 start *************');
        let predicates = await new dataRdb.RdbPredicates('test');
        let resultSet: dataRdb.ResultSet = await rdbStore.query(predicates);

        let storeObserver = () => {
            console.info(`storeObserver`);
        }

        try {
            //TestCode
            if(rdbStore != undefined) {
                rdbStore.on('storeObserver', false, storeObserver);
            }
        } catch (e) {
            if (e.code != 801) {
                expect(e.code).assertEqual(14800050);
            }
        }

        try {
            //TestCode
            if(rdbStore != undefined) {
                rdbStore.off('storeObserver', false, storeObserver);
            }
        } catch (e) {
            if (e.code != 801) {
                expect(e.code).assertEqual(14800050);
            }
        }

        try {
            //TestCode
            if(rdbStore != undefined) {
                rdbStore.emit('storeObserver');
            }
        } catch (e) {
            if (e.code != 801) {
                expect(e.code).assertEqual(14800050);
            }
        }


        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed);

        done();
        console.info(TAG + '************* SUB_DDM_RELATIONALETS_ERRORCODETSET_0080 end *************');
    })







    console.info(TAG + '*************Unit Test End*************');
})
}
