/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import data_Rdb from '@ohos.data.relationalStore';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { ValuesBucket } from '@kit.ArkData';

let context: common.UIAbilityContext;
const RDB_DB_ICUNAME = "RdbIcu.db";

const TAG = "[RelationalStore_Ets_TEST]"
const CREATE_TABLE_TEST = "CREATE VIRTUAL TABLE IF NOT EXISTS test USING fts4(name, content, tokenize=icu zh_CN);";

const STORE_CONFIG: data_Rdb.StoreConfig = {
    name: RDB_DB_ICUNAME,
    securityLevel: data_Rdb.SecurityLevel.S1,
	tokenizer: data_Rdb.Tokenizer.ICU_TOKENIZER
}

let rdbStore:data_Rdb.RdbStore;


export default function RelationalStoreIcu() {
    describe('RelationalStoreIcu', () => {
        beforeAll(async () => {
            console.info(TAG + 'beforeAll');
            context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
            rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST);
        });
        beforeEach(async () => {
            console.info(TAG + 'beforeEach');
            await rdbStore.executeSql("DELETE FROM test");
        });
        afterEach(async () => {
            console.info(TAG + 'afterEach');

        });
        afterAll(async () => {
            console.info(TAG + 'afterAll');
            await data_Rdb.deleteRdbStore(context, RDB_DB_ICUNAME);
        });
        console.info(TAG + "*************Unit Test Begin*************");
        /**
         * @tc.name testRdbStoreIcuInsert0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Insert_0100
         * @tc.desc RelationalStore icu insert test, query 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuInsert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuInsert0100 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档1');
                    expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');
                }

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuInsert0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Insert_0200
         * @tc.desc RelationalStore icu insert test, query 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuInsert0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuInsert0200 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索测试。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(2).assertEqual(resultSet.rowCount);
                resultSet.goToNextRow()
                let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                expect(resname).assertEqual('文档1');
                expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');

                resultSet.goToNextRow()
                let resname2 = resultSet.getString(resultSet.getColumnIndex("name"));
                let rescontent2 = resultSet.getString(resultSet.getColumnIndex("content"));
                console.info(TAGTEST + " resname2=" + resname2 + "  rescontent2=" + rescontent2);
                expect(resname2).assertEqual('文档2');
                expect(rescontent2).assertEqual('我们将使用这个示例来演示如何在SQLite中进行全文搜索测试。');

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });


        /**
         * @tc.name testRdbStoreIcuInsert0300
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Insert_0300
         * @tc.desc RelationalStore icu insert test, query 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuInsert0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuInsert0300 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '数据';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(0).assertEqual(resultSet.rowCount);

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuUpdate0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Update_0100
         * @tc.desc RelationalStore icu update data exist, query 2
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuUpdate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuUpdate0100 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";
            ("UPDATE test SET name='dd' WHERE id = 1");
            const SQL_UPDATE1 = "UPDATE test SET content='这是一个测试文档2'   WHERE name='文档2'";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });


            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档1');
                    expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');
                }

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_UPDATE1).then((data)=>{
                console.info(TAGTEST + " SQL_UPDATE1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_UPDATE1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });


            const SQL_QUERY2 = "SELECT * FROM test WHERE test MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY2).then((resultSet)=>{
                console.info(TAGTEST + " SQL_QUERY2 success");
                console.info(TAGTEST + " resultSet.rowCount=" + resultSet.rowCount);
                expect(2).assertEqual(resultSet.rowCount);
                resultSet.goToNextRow();
                let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                expect(resname).assertEqual('文档1');
                expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');

                resultSet.goToNextRow();

                let resname2 = resultSet.getString(resultSet.getColumnIndex("name"));
                let rescontent2 = resultSet.getString(resultSet.getColumnIndex("content"));
                console.info(TAGTEST + " resname2=" + resname2 + "  rescontent2=" + rescontent2);
                expect(resname2).assertEqual('文档2');
                expect(rescontent2).assertEqual('这是一个测试文档2');

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_QUERY2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " *************  End*************");
            done();
        });


        /**
         * @tc.name testRdbStoreIcuUpdate0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Update_0200
         * @tc.desc RelationalStore icu update not exist, query 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuUpdate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuUpdate0200 ";
            console.info(TAGTEST + "************* testRdbStoreIcuUpdate0100 start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";
            ("UPDATE test SET name='dd' WHERE id = 1");
            const SQL_UPDATE1 = "UPDATE test SET content='这是一个文档，用于中文本文本的分词和索引。'   WHERE name='文档1'";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });


            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档1');
                    expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');
                }

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_UPDATE1).then((data)=>{
                console.info(TAGTEST + " SQL_UPDATE1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_UPDATE1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY2 = "SELECT * FROM test WHERE test MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY2).then((resultSet)=>{
                console.info(TAGTEST + " SQL_QUERY2 success");
                console.info(TAGTEST + " resultSet.rowCount=" + resultSet.rowCount);
                expect(0).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_QUERY2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " *************  End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuDelete0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Delete_0100
         * @tc.desc RelationalStore icu Delete not exist, query 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuDelete0100 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";
            ("UPDATE test SET name='dd' WHERE id = 1");
            const SQL_DELETE1 = "DELETE FROM test WHERE name='文档2'";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });


            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档1');
                    expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');
                }
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_DELETE1).then((data)=>{
                console.info(TAGTEST + " SQL_DELETE1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_DELETE1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY2 = "SELECT * FROM test WHERE test MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY2).then((resultSet)=>{
                console.info(TAGTEST + " SQL_QUERY2 success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档1');
                    expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');
                }
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_QUERY2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " *************  End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuDelete0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Delete_0200
         * @tc.desc RelationalStore icu Delete  exist, query 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuDelete0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuDelete0200 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";
            ("UPDATE test SET name='dd' WHERE id = 1");
            const SQL_DELETE1 = "DELETE FROM test WHERE name='文档1'";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });


            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档1');
                    expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');
                }
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_DELETE1).then((data)=>{
                console.info(TAGTEST + " SQL_DELETE1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_DELETE1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY2 = "SELECT * FROM test WHERE test MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY2).then((resultSet)=>{
                console.info(TAGTEST + " SQL_QUERY2 success");
                expect(0).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_QUERY2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " *************  End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0100
         * @tc.desc RelationalStore icu  1字， query 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0100 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '这';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(1).assertEqual(resultSet.rowCount);

                resultSet.goToNextRow();
                let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                expect(resname).assertEqual('文档1');
                expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0102
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0102
         * @tc.desc RelationalStore icu  1字， query 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0102 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '是';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(1).assertEqual(resultSet.rowCount);

                resultSet.goToNextRow();
                let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                expect(resname).assertEqual('文档1');
                expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');


            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0103
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0103
         * @tc.desc RelationalStore icu  1字 不存在， query 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0103 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '数';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(0).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0104
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0104
         * @tc.desc RelationalStore icu  1字 存在， query 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0104 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '一';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(0).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0200
         * @tc.desc RelationalStore icu 2字， query 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0200 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '测这是一个文档试')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档1');
                    expect(rescontent).assertEqual('这是一个测试文档，用于中文本文本的分词和索引。');
                }

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0202
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0202
         * @tc.desc RelationalStore icu 2字， query 3
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0202 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索测试。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '测试这是一个文档试')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(3).assertEqual(resultSet.rowCount);

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0203
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0203
         * @tc.desc RelationalStore icu 2字 不存在， query 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0203 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索测试。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '测试这是一个文档试')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '数据';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(0).assertEqual(resultSet.rowCount);

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0204
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0204
         * @tc.desc RelationalStore icu 2字 存在， query 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0204 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索测试。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '测试这是一个文档')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '试文';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(0).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0300
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0300
         * @tc.desc RelationalStore icu 3字， query 1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0300 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '分词器';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档3');
                    expect(rescontent).assertEqual('ICU分词器能够很好地处理中文文本的分词和分析。');
                }

            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0302
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0302
         * @tc.desc RelationalStore icu 3字， query 0
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0300 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'ICU分词器能够很好地处理中文文本的分词和分析。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试中';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(0).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });


        /**
         * @tc.name testRdbStoreIcuQuery0400
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0400
         * @tc.desc RelationalStore icu query 4字
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0400 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '峻岭欣欣向荣崇山')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '崇山欣欣向荣忧心忡忡走马观花风驰电掣容光焕发峻岭。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '欣欣向荣忧心忡忡走马观花风驰电掣容光焕发崇山峻岭眉清目秀千军万马张灯结彩。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '崇山峻岭';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(3).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0500
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0500
         * @tc.desc RelationalStore icu query n字俗语
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0500 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '三百六十行。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '三百六十行，行行出状元。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '三百六十行，天下无难事,只怕有心人。行行出状元')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '三百六十行，行行出状元。';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(2).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0600
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0600
         * @tc.desc RelationalStore icu query 完整文本
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0600 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '三百六十行，行行出状元，谚语。比喻不论干哪一行，只要热爱本职工作，都能做出优异的成绩。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '三百六十行，行行出状元。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '三百六十行，天下无难事,只怕有心人。行行出状元')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '三百六十行，行行出状元，谚语。比喻不论干哪一行，只要热爱本职工作，都能做出优异的成绩。';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(1).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0700
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0700
         * @tc.desc RelationalStore icu query 位置1
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0700 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '三百六十行，行行出状元，谚语。比喻不论干哪一行，只要热爱本职工作，都能做出优异的成绩。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '行行出状元，三百六十行。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '三百六十行，天下无难事,只怕有心人。行行出状元')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '行行出状元';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(3).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });


        /**
         * @tc.name testRdbStoreIcuQuery0800
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0800
         * @tc.desc RelationalStore icu query 位置1 空格
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0800 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '三百六十行，行行出 状元，谚语。比喻不论干哪一行，只要热爱本职工作，都能做出优异的成绩。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '行行出 状元，三百六十行。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '三百六十行，天下无难事,只怕有心人。行行出状元')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '行行出 状元';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(3).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery0900
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_0900
         * @tc.desc RelationalStore icu query 位置1 标点
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery0900 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '三百六十行，行行出状元，谚语。比喻不论干哪一行，只要热爱本职工作，都能做出优异的成绩。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '行行出状元，三百六十行。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '三百六十行，天下无难事，只怕有心人。行行出状元。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '，行行出状元，行行出状元';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(3).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery1000
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_1000
         * @tc.desc RelationalStore icu query 位置1 标点
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery1000 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '三百六十行，行行出状元，【谚语】。比喻不论干哪一行，只要热爱本职工作，都能做出优异的成绩。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '行行出状元，三百六十行】。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '三百六十行，天下无难事，只怕有心人。【行行出状元】。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT2).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT2 success");
                expect(2).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT2 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.execute(SQL_INSERT3).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT3 success");
                expect(3).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT3 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '【行行出状元】';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                expect(2).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery1100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_1100
         * @tc.desc RelationalStore icu  create table same name  testicu, fail
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery1100 ";
            console.info(TAGTEST + "*************  start *************");

            const CREATE_TABLE_ICU = "CREATE VIRTUAL TABLE testicu USING fts4(name, content, tokenize=icu zh_CN);";
            const CREATE_TABLE_ICU_VIRTUAL = "CREATE VIRTUAL TABLE testicu USING fts4(name, content);";
            const CREATE_TABLE_NORMAL = "CREATE TABLE testicu (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "content TEXT NOT NULL)";

            await rdbStore.executeSql(CREATE_TABLE_ICU).then(()=>{
                console.info(TAGTEST + " CREATE_TABLE_TEST success");
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " CREATE_TABLE_TEST error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.executeSql(CREATE_TABLE_ICU_VIRTUAL).then(()=>{
                console.info(TAGTEST + " CREATE_TABLE_ICU_VIRTUAL success");
                expect().assertFail();
                done();
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " CREATE_TABLE_ICU_VIRTUAL error " + err.code + err.message);
            });

            await rdbStore.executeSql(CREATE_TABLE_NORMAL).then(()=>{
                console.info(TAGTEST + " CREATE_TABLE_ICU_VIRTUAL success");
                expect().assertFail();
                done();
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " CREATE_TABLE_ICU_VIRTUAL error " + err.code + err.message);
            });

            await rdbStore.executeSql("DELETE FROM testicu");
            await rdbStore.executeSql("DROP TABLE IF EXISTS testicu");

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name testRdbStoreIcuQuery1200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_IcuEtsAPITest_Query_1200
         * @tc.desc RelationalStore icu  create table dif name  testicu
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testRdbStoreIcuQuery1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreIcuQuery1200 ";
            console.info(TAGTEST + "*************  start *************");

            const CREATE_TABLE_ICU = "CREATE VIRTUAL TABLE IF NOT EXISTS testicu USING fts4(name, content, tokenize=icu zh_CN);";
            const CREATE_TABLE_ICU_VIRTUAL = "CREATE VIRTUAL TABLE IF NOT EXISTS testicuvir USING fts4(name, content);";
            const CREATE_TABLE_NORMAL = "CREATE TABLE IF NOT EXISTS testnormal (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "content TEXT NOT NULL)";

            await rdbStore.executeSql(CREATE_TABLE_ICU).then(()=>{
                console.info(TAGTEST + " CREATE_TABLE_TEST success");
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " CREATE_TABLE_TEST error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.executeSql(CREATE_TABLE_ICU_VIRTUAL).then(()=>{
                console.info(TAGTEST + " CREATE_TABLE_ICU_VIRTUAL success");
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " CREATE_TABLE_ICU_VIRTUAL error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.executeSql(CREATE_TABLE_NORMAL).then(()=>{
                console.info(TAGTEST + " CREATE_TABLE_NORMAL success");
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " CREATE_TABLE_NORMAL error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_INSERT1_testicu = "INSERT INTO testicu(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            await rdbStore.execute(SQL_INSERT1_testicu).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1_testicu success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1_testicu error " + err.code + err.message);
                expect().assertFail();
                done();
            });
            const SQL_QUERY1_testicu = "SELECT * FROM testicu WHERE testicu MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY1_testicu).then((resultSet)=>{
                console.info(TAGTEST + " SQL_QUERY1_testicu success. resultSet.rowCount=" + resultSet.rowCount);
                expect(1).assertEqual(resultSet.rowCount);

                resultSet.goToNextRow();
                let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                expect(resname).assertEqual('文档1');
                expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_QUERY1_testicu error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_INSERT1_testicuvir = "INSERT INTO testicuvir(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            await rdbStore.execute(SQL_INSERT1_testicuvir).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1_testicuvir success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1_testicuvir error " + err.code + err.message);
                expect().assertFail();
                done();
            });
            const SQL_QUERY1_testicuvir = "SELECT * FROM testicuvir WHERE testicuvir MATCH '测试';";
            await rdbStore.querySql(SQL_QUERY1_testicuvir).then((resultSet)=>{
                console.info(TAGTEST + " SQL_QUERY1_testicuvir success. resultSet.rowCount=" + resultSet.rowCount);
                expect(0).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_QUERY1_testicuvir error " + err.code + err.message);
                expect().assertFail();
                done();
            });


            const SQL_INSERT1_testnormal = "INSERT INTO testnormal(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
            await rdbStore.execute(SQL_INSERT1_testnormal).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1_testnormal success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1_testnormal error " + err.code + err.message);
                expect().assertFail();
                done();
            });
            const SQL_QUERY1_testnormal = "SELECT '测试' FROM testnormal WHERE name='文档1';";
            await rdbStore.querySql(SQL_QUERY1_testnormal).then((resultSet)=>{
                console.info(TAGTEST + " SQL_QUERY1_testnormal success. resultSet.rowCount=" + resultSet.rowCount);
                expect(1).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_QUERY1_testnormal error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            await rdbStore.executeSql("DELETE FROM testicu");
            await rdbStore.executeSql("DELETE FROM testicuvir");
            await rdbStore.executeSql("DELETE FROM testnormal");
            await rdbStore.executeSql("DROP TABLE IF EXISTS testicu");
            await rdbStore.executeSql("DROP TABLE IF EXISTS testicuvir");
            await rdbStore.executeSql("DROP TABLE IF EXISTS testnormal");

            console.info(TAGTEST + " ************* End*************");
            done();
        });
        console.info(TAG + " *************Unit Test End*************");
    })
}
