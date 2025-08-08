/*
 * Copyright (C) 2021-2024 Huawei Device Co., Ltd.
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
import dataRdb from '@ohos.data.rdb'

const TAG = '[RDB_JSKITS_TEST]'
const CREATE_TABLE_TEST = 'CREATE TABLE IF NOT EXISTS test (' + 'id INTEGER PRIMARY KEY AUTOINCREMENT, ' + 'data1 text,' + 'data2 long, ' + 'data3 double,' + 'data4 blob)';

const STORE_CONFIG = {
    name: 'Resultset.db',
}
const COLOUNM_NAMES = ["id","data1","data2","data3","data4"];
var rdbStore = undefined;

function createUint8Array(length) {
    let i = 0
    let index = 0
    let temp = null
    let u8 = new Uint8Array(length)
    length = typeof (length) === 'undefined' ? 9 : length
    for (i = 1; i <= length; i++) {
        u8[i - 1] = i
    }
    for (i = 1; i <= length; i++) {
        index = parseInt(Math.random() * (length - i)) + i
        if (index != i) {
            temp = u8[i - 1]
            u8[i - 1] = u8[index - 1]
            u8[index - 1] = temp
        }
    }
    return u8;
}

async function createBigData(size) {
    await rdbStore.executeSql("DELETE FROM test");
    let u8 = createUint8Array(32768);
    let valueBucketArray = new Array();
    for (let i = 0; i < size; i++) {
        valueBucketArray.push({
            "data1": "test" + i,
            "data2": 18,
            "data3": 100.5,
            "data4": u8,
        });
    }
    await rdbStore.batchInsert("test", valueBucketArray);
}

export default function rdbResultSetTest() {
describe('rdbResultSetTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
        rdbStore = await dataRdb.getRdbStore(STORE_CONFIG, 1);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        await createTest();
    })

    beforeEach(async function () {
        console.info(TAG + 'beforeEach')
    })

    afterEach(function () {
        console.info(TAG + 'afterEach')
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
        rdbStore = null
        await dataRdb.deleteRdbStore('Resultset.db');
    })
    //插入数据
    async function createTest() {
        console.info(TAG + 'createTest data start');
        {
            var u8 = new Uint8Array([1, 2, 3])
            const valueBucket = {
                'data1': 'hello',
                'data2': 10,
                'data3': 1.0,
                'data4': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            var u8 = new Uint8Array([3, 4, 5])
            const valueBucket = {
                'data1': '2',
                'data2': -5,
                'data3': 2.5,
                'data4': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            var u8 = new Uint8Array(0)
            const valueBucket = {
                'data1': 'hello world',
                'data2': 3,
                'data3': 1.8,
                'data4': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        console.info(TAG + 'createTest data end');
    }

    /**
     * @tc.name testGetBlob0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_0100
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBlob0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetBlob0001 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex('id'))
                const data4 = resultSet.getBlob(resultSet.getColumnIndex('data4'))
                console.info(TAG + 'id=' + id + ', data4=' + data4);
                expect(1).assertEqual(data4[0]);
                expect(2).assertEqual(data4[1]);
                expect(3).assertEqual(data4[2]);
            }
            resultSet.close();
            expect(true).assertEqual(resultSet.isClosed)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetBlob0001 end *************');
    })

    /**
     * @tc.name testGetBlob0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_0200
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBlob0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetBlob0002 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const id = resultSet.getLong(resultSet.getColumnIndex('id'))
                const data4 = resultSet.getBlob(resultSet.getColumnIndex('data4'))
                console.info(TAG + 'id=' + id + ', data4=' + data4);
                expect(3).assertEqual(data4[0]);
                expect(4).assertEqual(data4[1]);
                expect(5).assertEqual(data4[2]);
            }
            resultSet.close();
            expect(true).assertEqual(resultSet.isClosed)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetBlob0002 end *************');
    })

    /**
     * @tc.name testGetBlob0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_0300
     * @tc.desc resultSet getBlob normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBlob0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetBlob0003 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const id = resultSet.getLong(resultSet.getColumnIndex('id'))
                const data4 = resultSet.getBlob(resultSet.getColumnIndex('data4'))
                console.info(TAG + 'id=' + id);
            }
            resultSet.close();
            expect(true).assertEqual(resultSet.isClosed)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetBlob0003 end *************');
    })

    /**
     * @tc.name testIsStarted0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_0400
     * @tc.desc resultSet isStarted normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsStarted0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsStarted0001 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(false).assertEqual(resultSet.isStarted)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testIsStarted0001 end *************');
    })

    /**
     * @tc.name testIsStarted0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_0500
     * @tc.desc resultSet isStarted normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsStarted0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsStarted0002 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            resultSet.goTo(1)
            expect(true).assertEqual(resultSet.isStarted)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testIsStarted0002 end *************');
    })

    /**
     * @tc.name testIsStarted0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_0600
     * @tc.desc resultSet isStarted normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsStarted0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "************* testIsStarted0003 start *************");
        let predicates = await new dataRdb.RdbPredicates("test")
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(false).assertEqual(resultSet.isStarted)
            expect(true).assertEqual(resultSet.goToNextRow())
            expect(true).assertEqual(resultSet.isStarted)
            expect(false).assertEqual(resultSet.goToPreviousRow())
            expect(true).assertEqual(resultSet.isStarted)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + "************* testIsStarted0003 end *************");
    })

    /**
     * @tc.name testIsStarted0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_0700
     * @tc.desc resultSet isStarted with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsStarted0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsStarted0004 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(true).assertEqual(resultSet.goToNextRow())
            expect(true).assertEqual(resultSet.isStarted)
            expect(true).assertEqual(resultSet.isStarted)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testIsStarted0004 end *************');
    })


    /**
     * @tc.name testIsEnded0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_0800
     * @tc.desc resultSet isEnded normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEnded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsEnded0001 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(true).assertEqual(resultSet.goToFirstRow())
            expect(false).assertEqual(resultSet.isEnded)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testIsEnded0001 end *************');
    })

    /**
     * @tc.name testIsEnded0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_0900
     * @tc.desc resultSet isEnded normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEnded0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsEnded0002 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(true).assertEqual(resultSet.goToLastRow())
            expect(false).assertEqual(resultSet.isEnded)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testIsEnded0002 end *************');
    })

    /**
     * @tc.name testIsEnded0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1000
     * @tc.desc resultSet isEnded normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEnded0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsEnded0003 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            resultSet.goToRow(3)
            expect(true).assertEqual(resultSet.isEnded)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testIsEnded0003 end *************');
    })

    /**
     * @tc.name testIsEnded0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1100
     * @tc.desc resultSet isEnded normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsEnded0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsEnded0004 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            resultSet.goToRow(3)
            expect(true).assertEqual(resultSet.isEnded)
            expect(true).assertEqual(resultSet.isEnded)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testIsEnded0004 end *************');
    })

    /**
     * @tc.name testRowCount0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1200
     * @tc.desc resultSet rowCount normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRowCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRowCount0001 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(3).assertEqual(resultSet.rowCount)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testRowCount0001 end *************');
    })

    /**
     * @tc.name testRowCount0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1300
     * @tc.desc resultSet rowCount with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRowCount0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRowCount0002 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        predicates.equalTo('name', 'wangwu');
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(-1).assertEqual(resultSet.rowCount)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testRowCount0002 end *************');
    })

    /**
     * @tc.name testRowCount0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1400
     * @tc.desc resultSet rowCount test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRowCount0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRowCount0003 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        predicates.equalTo('data1', 'hello');
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(1).assertEqual(resultSet.rowCount)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testRowCount0003 end *************');
    })

    /**
     * @tc.name testRowCount0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1500
     * @tc.desc resultSet rowCount test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRowCount0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRowCount0004 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        predicates.equalTo('data1', 'hello');
        predicates.equalTo('data2', 3);
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(0).assertEqual(resultSet.rowCount)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testRowCount0003 end *************');
    })

    /**
     * @tc.name testGetLong0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1600
     * @tc.desc resultSet getLong test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetLong0001 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex('id'))
                const data2 = resultSet.getLong(resultSet.getColumnIndex('data2'))
                console.info(TAG + 'id=' + id + ', data2=' + data2);
                expect(10).assertEqual(data2);
            }
            resultSet.close();
            expect(true).assertEqual(resultSet.isClosed)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetLong0001 end *************');
    })

    /**
     * @tc.name testGetLong0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1700
     * @tc.desc resultSet getLong test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLong0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetLong0002 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const data1 = resultSet.getLong(resultSet.getColumnIndex('data1'))
                expect(2).assertEqual(data1);
            }
            resultSet.close();
            expect(true).assertEqual(resultSet.isClosed)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetLong0002 end *************');
    })

    /**
     * @tc.name testGetLong0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1800
     * @tc.desc resultSet getLong test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetLong0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetLong0003 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const data2 = resultSet.getLong(resultSet.getColumnIndex('data2'))
                expect(-5).assertEqual(data2);
            }
            resultSet.close();
            expect(true).assertEqual(resultSet.isClosed)
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetLong0003 end *************');
    })

    /**
     * @tc.name testGetString0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_1900
     * @tc.desc resultSet getString test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetString0001 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        {
            expect(true).assertEqual(resultSet.goToFirstRow())
            const data1 = resultSet.getString(resultSet.getColumnIndex('data1'))
            expect('hello').assertEqual(data1);
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetString0001 end *************');
    })

    /**
     * @tc.name testGetString0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2000
     * @tc.desc resultSet getString test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetString0002 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        {
            expect(true).assertEqual(resultSet.goToFirstRow())
            const data2 = resultSet.getString(resultSet.getColumnIndex('data2'))
            expect('10').assertEqual(data2);
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetString0002 end *************');
    })

    /**
     * @tc.name testGetString0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2100
     * @tc.desc resultSet getString test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetString0003 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        {
            expect(true).assertEqual(resultSet.goToFirstRow())
            expect(true).assertEqual(resultSet.goToNextRow())
            const data3 = resultSet.getString(resultSet.getColumnIndex('data3'))
            expect('2.5').assertEqual(data3);
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetString0003 end *************');
    })

    /**
     * @tc.name testGetString0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2200
     * @tc.desc resultSet getString test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetString0004 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        {
            expect(true).assertEqual(resultSet.goToFirstRow())
            expect(true).assertEqual(resultSet.goToNextRow())
            expect(true).assertEqual(resultSet.goToNextRow())
            const data1 = resultSet.getString(resultSet.getColumnIndex('data1'))
            const data2 = resultSet.getString(resultSet.getColumnIndex('data2'))
            const data3 = resultSet.getString(resultSet.getColumnIndex('data3'))
            expect('hello world').assertEqual(data1);
            expect('3').assertEqual(data2);
            expect('1.8').assertEqual(data3);
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGetString0004 end *************');
    })

    /**
     * @tc.name testIsClosed0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2300
     * @tc.desc resultSet isClosed test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsClosed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsClosed0001 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)

        expect(3).assertEqual(resultSet.rowCount)
        resultSet.close();
        expect(true).assertEqual(resultSet.isClosed)

        resultSet = null
        done();
        console.info(TAG + '************* testIsClosed0001 end *************');
    })

    /**
     * @tc.name testIsClosed0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2400
     * @tc.desc resultSet isClosed with not close test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsClosed0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsClosed0002 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        expect(false).assertEqual(resultSet.isClosed)

        resultSet = null
        done();
        console.info(TAG + '************* testIsClosed0002 end *************');
    })

    /**
     * @tc.name testIsClosed0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2500
     * @tc.desc resultSet isClosed with not close test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsClosed0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsClosed0003 start *************');
        let predicates = await new dataRdb.RdbPredicates('test')
        predicates.equalTo('name', 'wangwu');
        let resultSet = await rdbStore.query(predicates)
        expect(false).assertEqual(resultSet.isClosed)

        resultSet = null
        done();
        console.info(TAG + '************* testIsClosed0003 end *************');
    })

    /**
     * @tc.name testColumnCount0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2600
     * @tc.desc resultSet columnCount test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColumnCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testColumnCount0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            expect(5).assertEqual(resultSet.columnCount);
            resultSet = null;
            done();
            console.info(TAG + '************* testColumnCount0001 end *************');
        }
    })

    /**
     * @tc.name testColumnCount0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2700
     * @tc.desc resultSet columnCount test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColumnCount0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testColumnCount0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            expect(0).assertEqual(resultSet.columnCount);
            resultSet = null;
            done();
            console.info(TAG + '************* testColumnCount0002 end *************');
        }
    })

    /**
     * @tc.name testRowIndex0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2800
     * @tc.desc resultSet rowIndex test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRowIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRowIndex0001 *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(0).assertEqual(resultSet.rowIndex)
            }

            resultSet = null;
            done();
            console.info(TAG + '************* testRowIndex0001 end *************');
        }
    })

    /**
     * @tc.name testRowIndex0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_2900
     * @tc.desc resultSet rowIndex at last row test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRowIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRowIndex0002 *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToLastRow())
                expect(2).assertEqual(resultSet.rowIndex)
            }

            resultSet = null;
            done();
            console.info(TAG + '************* testRowIndex0002 end *************');
        }
    })

    /**
     * @tc.name testGoToFirstRow0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3000
     * @tc.desc resultSet goToFirstRow normal test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToFirstRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToFirstRow0001 start *************');

        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(true).assertEqual(resultSet.goToFirstRow())
            resultSet.close();
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGoToFirstRow0001 end *************');
    })

    /**
     * @tc.name testGoToFirstRow0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3100
     * @tc.desc resultSet goToFirstRow with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToFirstRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToFirstRow0002 start *************');

        let predicates = await new dataRdb.RdbPredicates('test')
        predicates.equalTo('name', 'wangwu');
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(false).assertEqual(resultSet.goToFirstRow())
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGoToFirstRow0002 end *************');
    })

    /**
     * @tc.name testGoToFirstRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3200
     * @tc.desc resultSet goToFirstRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToFirstRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToFirstRow0003 start *************');

        let predicates = await new dataRdb.RdbPredicates('test')
        let resultSet = await rdbStore.query(predicates)
        try {
            expect(true).assertEqual(resultSet.goToFirstRow())
            expect(true).assertEqual(resultSet.goToNextRow())
            expect(true).assertEqual(resultSet.goToFirstRow())
        } catch (e) {
            expect(null).assertFail();
        }
        resultSet = null
        done();
        console.info(TAG + '************* testGoToFirstRow0003 end *************');
    })

    /**
     * @tc.name testGoToLastRow0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3300
     * @tc.desc resultSet goToFirstRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToLastRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToLastRow0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToLastRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToLastRow0001 end *************');
        }
    })

    /**
     * @tc.name testGoToLastRow0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3400
     * @tc.desc resultSet goToLastRow with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToLastRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToLastRow0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            {
                expect(false).assertEqual(resultSet.goToLastRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToLastRow0002 end *************');
        }
    })

    /**
     * @tc.name testGoToLastRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3500
     * @tc.desc resultSet goToLastRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToLastRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToLastRow0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToLastRow())
                expect(true).assertEqual(resultSet.goToPreviousRow())
                expect(true).assertEqual(resultSet.goToLastRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToLastRow0003 end *************');
        }
    })

    /**
     * @tc.name testGoToNextRow0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3600
     * @tc.desc resultSet goToNextRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToNextRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToNextRow0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToNextRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToNextRow0001 end *************');
        }
    })

    /**
     * @tc.name testGoToNextRow0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3700
     * @tc.desc resultSet goToNextRow with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToNextRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToNextRow0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            {
                expect(false).assertEqual(resultSet.goToNextRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToNextRow0002 end *************');
        }
    })

    /**
     * @tc.name testGoToNextRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3800
     * @tc.desc resultSet goToNextRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToNextRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToNextRow0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(true).assertEqual(resultSet.goToPreviousRow())
                expect(true).assertEqual(resultSet.goToNextRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToNextRow0003 end *************');
        }
    })

    /**
     * @tc.name testGoToNextRow0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_3900
     * @tc.desc resultSet goToNextRow after last row test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToNextRow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToNextRow0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToLastRow())
                expect(false).assertEqual(resultSet.goToNextRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToNextRow0004 end *************');
        }
    })

    /**
     * @tc.name testGoToPreviousRow0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4000
     * @tc.desc resultSet goToPreviousRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToPreviousRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToPreviousRow0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(false).assertEqual(resultSet.goToPreviousRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToPreviousRow0001 end *************');
        }
    })

    /**
     * @tc.name testGoToPreviousRow0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4100
     * @tc.desc resultSet goToPreviousRow with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToPreviousRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToPreviousRow0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            {
                expect(false).assertEqual(resultSet.goToPreviousRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToPreviousRow0002 end *************');
        }
    })

    /**
     * @tc.name testGoToPreviousRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4200
     * @tc.desc resultSet goToPreviousRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToPreviousRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToPreviousRow0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(true).assertEqual(resultSet.goToPreviousRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToPreviousRow0003 end *************');
        }
    })

    /**
     * @tc.name testGoToPreviousRow0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4300
     * @tc.desc resultSet goToPreviousRow after last row test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToPreviousRow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToPreviousRow0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToLastRow())
                expect(true).assertEqual(resultSet.goToPreviousRow())
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToPreviousRow0004 end *************');
        }
    })

    /**
     * @tc.name testGoTo0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4400
     * @tc.desc resultSet goTo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoTo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoTo0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                resultSet.goTo(1)
                expect(1).assertEqual(resultSet.rowIndex)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoTo0001 end *************');
        }
    })

    /**
     * @tc.name testGoTo0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4500
     * @tc.desc resultSet goTo with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoTo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoTo0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goTo(1)
                expect(-1).assertEqual(resultSet.rowIndex)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoTo0002 end *************');
        }
    })

    /**
     * @tc.name testGoTo0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4600
     * @tc.desc resultSet goTo test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoTo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoTo0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                resultSet.goTo(1)
                expect(2).assertEqual(resultSet.rowIndex)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoTo0003 end *************');
        }
    })

    /**
     * @tc.name testGoTo0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4700
     * @tc.desc resultSet goTo after last row test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoTo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoTo0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToLastRow())
                resultSet.goTo(5)
                expect(3).assertEqual(resultSet.rowIndex)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoTo0004 end *************');
        }
    })

    /**
     * @tc.name testGoToRow0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4800
     * @tc.desc resultSet goToRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToRow0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                resultSet.goToRow(1)
                expect(1).assertEqual(resultSet.rowIndex)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToRow0001 end *************');
        }
    })

    /**
     * @tc.name testGoToRow0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_4900
     * @tc.desc resultSet goToRow with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToRow0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goToRow(1)
                expect(-1).assertEqual(resultSet.rowIndex)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToRow0002 end *************');
        }
    })

    /**
     * @tc.name testGoToRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5000
     * @tc.desc resultSet goToRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToRow0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                resultSet.goToRow(1)
                expect(1).assertEqual(resultSet.rowIndex)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToRow0003 end *************');
        }
    })

    /**
     * @tc.name testGoToRow0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5100
     * @tc.desc resultSet goToRow after last row test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGoToRow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGoToRow0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToLastRow())
                resultSet.goToRow(5)
                expect(3).assertEqual(resultSet.rowIndex)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGoToRow0004 end *************');
        }
    })

    /**
     * @tc.name testIsAtFirstRow0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5200
     * @tc.desc resultSet isAtFirstRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtFirstRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtFirstRow0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.isAtFirstRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtFirstRow0001 end *************');
        }
    })

    /**
     * @tc.name testIsAtFirstRow0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5300
     * @tc.desc resultSet isAtFirstRow with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtFirstRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtFirstRow0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            {
                expect(false).assertEqual(resultSet.isAtFirstRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtFirstRow0002 end *************');
        }
    })

    /**
     * @tc.name testIsAtFirstRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5400
     * @tc.desc resultSet isAtFirstRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtFirstRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtFirstRow0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(false).assertEqual(resultSet.isAtFirstRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtFirstRow0003 end *************');
        }
    })

    /**
     * @tc.name testIsAtFirstRow0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5500
     * @tc.desc resultSet isAtFirstRow after last row test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtFirstRow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtFirstRow0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToLastRow())
                expect(false).assertEqual(resultSet.isAtFirstRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtFirstRow0004 end *************');
        }
    })

    /**
     * @tc.name testIsAtFirstRow0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5600
     * @tc.descresultSet isAtFirstRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtFirstRow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtFirstRow0005 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goTo(1)
                resultSet.goTo(0)
                expect(true).assertEqual(resultSet.isAtFirstRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtFirstRow0005 end *************');
        }
    })

    /**
     * @tc.name testIsAtFirstRow0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5700
     * @tc.descresultSet isAtFirstRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtFirstRow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtFirstRow0006 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goTo(1)
                expect(true).assertEqual(resultSet.isAtFirstRow)
                expect(true).assertEqual(resultSet.isAtFirstRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtFirstRow0006 end *************');
        }
    })

    /**
     * @tc.name testIsAtLastRow0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5800
     * @tc.desc resultSet isAtLastRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtLastRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtLastRow0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(false).assertEqual(resultSet.isAtLastRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtLastRow0001 end *************');
        }
    })

    /**
     * @tc.name testIsAtLastRow0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_5900
     * @tc.desc resultSet isAtLastRow with no result test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtLastRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtLastRow0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            {
                expect(false).assertEqual(resultSet.isAtLastRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtLastRow0002 end *************');
        }
    })

    /**
     * @tc.name testIsAtLastRow0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6000
     * @tc.desc resultSet isAtLastRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtLastRow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtLastRow0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(false).assertEqual(resultSet.isAtLastRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtLastRow0003 end *************');
        }
    })

    /**
     * @tc.name testIsAtLastRow0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6100
     * @tc.desc resultSet isAtLastRow after last row test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtLastRow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtLastRow0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToLastRow())
                expect(true).assertEqual(resultSet.isAtLastRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtLastRow0004 end *************');
        }
    })

    /**
     * @tc.name testIsAtLastRow0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6200
     * @tc.desc resultSet isAtLastRow test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsAtLastRow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsAtLastRow0005 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goToRow(2)
                expect(true).assertEqual(resultSet.isAtLastRow)
                expect(true).assertEqual(resultSet.isAtLastRow)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsAtLastRow0005 end *************');
        }
    })

    /**
     * @tc.name testGetDouble0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6300
     * @tc.desc resultSet getDouble test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetDouble0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goTo(1)
                const data3 = resultSet.getDouble(resultSet.getColumnIndex('data3'))
                expect(1.0).assertEqual(data3)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGetDouble0001 end *************');
        }
    })

    /**
     * @tc.name testGetDouble0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6400
     * @tc.desc resultSet getDouble test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDouble0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetDouble0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goTo(2)
                const data3 = resultSet.getDouble(resultSet.getColumnIndex('data3'))
                expect(2.5).assertEqual(data3)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGetDouble0002 end *************');
        }
    })

    /**
     * @tc.name testGetDouble0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6500
     * @tc.desc resultSet getDouble test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetDouble0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goTo(3)
                const data3 = resultSet.getDouble(resultSet.getColumnIndex('data3'))
                expect(1.8).assertEqual(data3)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGetDouble0003 end *************');
        }
    })

    /**
     * @tc.name testGetDouble0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6600
     * @tc.desc resultSet getDouble test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetDouble0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetDouble0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goTo(1)
                const data2 = resultSet.getDouble(resultSet.getColumnIndex('data2'))
                expect(10).assertEqual(data2)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testGetDouble0004 end *************');
        }
    })

    /**
     * @tc.name testIsColumnNull0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6700
     * @tc.desc resultSet isColumnNull test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsColumnNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsColumnNull0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const isColumnNull1 = resultSet.isColumnNull(resultSet.getColumnIndex('data1'))
                expect(false).assertEqual(isColumnNull1)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsColumnNull0001 end *************');
        }
    })

    /**
     * @tc.name testIsColumnNull0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6800
     * @tc.desc resultSet isColumnNull test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsColumnNull0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsColumnNull0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const isColumnNull4 = resultSet.isColumnNull(resultSet.getColumnIndex('data4'))
                expect(true).assertEqual(isColumnNull4)
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsColumnNull0002 end *************');
        }
    })

    /**
     * @tc.name testIsColumnNull0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_6900
     * @tc.desc resultSet isColumnNull test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsColumnNull0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function () {
        console.info(TAG + '************* testIsColumnNull0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            resultSet.goToRow(5)
            try {
                let res = resultSet.isColumnNull(2);
                expect(false).assertEqual(res);
            } catch (e) {
                expect(e.code).assertEqual("14800012");
            }
            resultSet = null;
            console.info(TAG + '************* testIsColumnNull0003 end *************');
        }
    })
    /**
     * @tc.name testIsColumnNull0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7000
     * @tc.desc resultSet isColumnNull test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsColumnNull0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testIsColumnNull0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            {
                resultSet.goToRow(2)
                expect(false).assertEqual(resultSet.isColumnNull(1))
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testIsColumnNull0004 end *************');
        }
    })

    /**
     * @tc.name testGetColumnIndex0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7100
     * @tc.desc resultSet getColumnIndex test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetColumnIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetColumnIndex0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            expect(true).assertEqual(resultSet.goToFirstRow())
            expect(1).assertEqual(resultSet.getColumnIndex('data1'))

            resultSet = null;
            done();
            console.info(TAG + '************* testGetColumnIndex0001 end *************');
        }
    })

    /**
     * @tc.name testGetColumnIndex0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7200
     * @tc.desc resultSet getColumnIndex test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetColumnIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetColumnIndex0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            expect(-1).assertEqual(resultSet.getColumnIndex('data1'))

            resultSet = null;
            done();
            console.info(TAG + '************* testGetColumnIndex0002 end *************');
        }
    })

    /**
     * @tc.name testGetColumnIndex0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7300
     * @tc.desc resultSet getColumnIndex test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetColumnIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetColumnIndex0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            expect(-1).assertEqual(resultSet.getColumnIndex('dataX'))

            resultSet = null;
            done();
            console.info(TAG + '************* testGetColumnIndex0003 end *************');
        }
    })

    /**
     * @tc.name testGetColumnIndex0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7400
     * @tc.desc resultSet getColumnIndex test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
     it('testGetColumnIndex0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetColumnIndex0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            expect(-1).assertEqual(resultSet.getColumnIndex(''))

            resultSet = null;
            done();
            console.info(TAG + '************* testGetColumnIndex0004 end *************');
        }
    })

    /**
     * @tc.name testGetColumnName0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7500
     * @tc.desc resultSet getColumnName test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetColumnName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetColumnIndex0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)

            expect('data1').assertEqual(resultSet.getColumnName(1))
            expect('data4').assertEqual(resultSet.getColumnName(4))

            resultSet = null;
            done();
            console.info(TAG + '************* testGetColumnName0001 end *************');
        }
    })

    /**
     * @tc.name testGetColumnName0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7600
     * @tc.desc resultSet getColumnName test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetColumnName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetColumnName0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)

            expect('').assertEqual(resultSet.getColumnName(1))
            expect('').assertEqual(resultSet.getColumnName(4))

            resultSet = null;
            done();
            console.info(TAG + '************* testGetColumnName0002 end *************');
        }
    })

    /**
     * @tc.name testGetColumnName0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7700
     * @tc.desc resultSet getColumnName test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetColumnName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetColumnName0003 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)

            expect('').assertEqual(resultSet.getColumnName(10))

            resultSet = null;
            done();
            console.info(TAG + '************* testGetColumnName0003 end *************');
        }
    })

    /**
     * @tc.name testGetColumnName0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7800
     * @tc.desc resultSet getColumnName test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetColumnName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testGetColumnName0004 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)

            expect('').assertEqual(resultSet.getColumnName(10))

            resultSet = null;
            done();
            console.info(TAG + '************* testGetColumnName0004 end *************');
        }
    })

    /**
     * @tc.name testClose0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_7900
     * @tc.desc resultSet close test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClose0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testClose0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            resultSet.goToRow(1)
            resultSet.close()
            expect(true).assertEqual(resultSet.isClosed)

            resultSet = null;
            done();
            console.info(TAG + '************* testClose0001 end *************');
        }
    })

    /**
     * @tc.name testClose0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_8000
     * @tc.desc resultSet close test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClose0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testClose0002 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            predicates.equalTo('name', 'wangwu');
            let resultSet = await rdbStore.query(predicates)
            resultSet.close()
            expect(true).assertEqual(resultSet.isClosed)

            resultSet = null;
            done();
            console.info(TAG + '************* testClose0002 end *************');
        }
    })

    /**
     * @tc.name testcolumnNames0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_8100
     * @tc.desc resultSet columnNames test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
     it('testcolumnNames0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testcolumnNames0001 start *************');
        {
            let predicates = await new dataRdb.RdbPredicates('test')
            let resultSet = await rdbStore.query(predicates)
            if (COLOUNM_NAMES == resultSet.columnNames){
                expect(1).assertEqual(0);
            }else{
                expect(0).assertEqual(0);
            }
            resultSet = null;
            done();
            console.info(TAG + '************* testcolumnNames0001 end *************');
        }
    })

    /**
     * @tc.name testBigData0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_RDBResultSetJsAPITest_8200
     * @tc.desc big resultSet data test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
     it('testBigData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.log(TAG + "************* testBigData0001 start *************");
        {
            await createBigData(500);
            let resultSet = await rdbStore.querySql("SELECT * FROM test");
            let count = resultSet.rowCount;
            expect(500).assertEqual(count);

            resultSet.goToFirstRow();
            let i = 0;
            while (resultSet.isEnded == false) {
                expect("test" + i++).assertEqual(resultSet.getString(1))
                resultSet.goToNextRow();
            }

            resultSet.close()
            expect(true).assertEqual(resultSet.isClosed)
            resultSet = null;
            done();
            console.log(TAG + "************* testBigData0001 end *************");
        }
    })
    
    console.info(TAG + '*************Unit Test End*************');
})
}
