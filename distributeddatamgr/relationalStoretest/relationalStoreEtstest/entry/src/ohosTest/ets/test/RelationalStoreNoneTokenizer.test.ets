/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
const RDB_DB_NoneTokenizerNAME = "RdbNoneTokenizer.db";

const TAG = "[RelationalStore_Ets_TEST >>>>>> ]"
const CREATE_TABLE_TEST = "CREATE VIRTUAL TABLE IF NOT EXISTS test USING fts4(name, content);";

const STORE_CONFIG: data_Rdb.StoreConfig = {
    name: RDB_DB_NoneTokenizerNAME,
    securityLevel: data_Rdb.SecurityLevel.S1,
    tokenizer: data_Rdb.Tokenizer.NONE_TOKENIZER
}
let rdbStore:data_Rdb.RdbStore;
export default function RelationalStoreNoneTokenizer() {
    describe('RelationalStoreNoneTokenizer', () => {
        beforeAll(async () => {
            console.info(TAG + 'beforeAll');
            try {
				context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
                rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
                console.info(TAG + 'beforeAll 111 rdbStore' + rdbStore);
                  await rdbStore.executeSql(CREATE_TABLE_TEST);
            }catch(err){
                console.info(TAG + 'beforeAll err=' + err.code + err.message);
            }
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
            await data_Rdb.deleteRdbStore(context, RDB_DB_NoneTokenizerNAME);
        });
        console.info(TAG + "*************Unit Test Begin*************");
        /**
         * @tc.name   testRdbStoreNoneTokenizerQuery0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_NoneTokenizerEtsAPITest_Query_0100
         * @tc.desc   RelationalStore NoneTokenizer 中文
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreNoneTokenizerQuery0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreNoneTokenizerQuery0100 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个文档，用于,测试,中文本文本的分词和索引。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
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
                    expect(rescontent).assertEqual('这是一个文档，用于,测试,中文本文本的分词和索引。');
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
         * @tc.name   testRdbStoreNoneTokenizerQuery0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_NoneTokenizerEtsAPITest_Query_0200
         * @tc.desc   RelationalStore NoneTokenizer 英文
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreNoneTokenizerQuery0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreNoneTokenizerQuery0200 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', 'test123')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', 'test,123')";

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

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH 'test';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档2');
                    expect(rescontent).assertEqual('test,123');
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
         * @tc.name   testRdbStoreNoneTokenizerQuery0300
         * @tc.number SUB_DistributedData_RelationalStore_SDK_NoneTokenizerEtsAPITest_Query_0300
         * @tc.desc   RelationalStore NoneTokenizer 数字
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreNoneTokenizerQuery0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreNoneTokenizerQuery0300 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是1一个测试文档,1,用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '11我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'NoneTokenizer111分词器能够很好地处理中文文本的分词和分析。')";

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

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '1';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档1');
                    expect(rescontent).assertEqual('这是1一个测试文档,1,用于测试中文本文本的分词和索引。');
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
         * @tc.name   testRdbStoreNoneTokenizerQuery0400
         * @tc.number SUB_DistributedData_RelationalStore_SDK_NoneTokenizerEtsAPITest_Query_0400
         * @tc.desc   RelationalStore NoneTokenizer 中英文数字
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreNoneTokenizerQuery0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreNoneTokenizerQuery0400 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试,测试test1,文档，用于测试中文本文本的分词和索引。')";

            await rdbStore.execute(SQL_INSERT1).then((data)=>{
                console.info(TAGTEST + " SQL_INSERT1 success");
                expect(1).assertEqual(data);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                expect().assertFail();
                done();
            });

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试test1';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
                while(resultSet.goToNextRow()){
                    let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                    let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                    console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                    expect(resname).assertEqual('文档1');
                    expect(rescontent).assertEqual('这是一个测试,测试test1,文档，用于测试中文本文本的分词和索引。');
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
         * @tc.name   testRdbStoreNoneTokenizerQuery0500
         * @tc.number SUB_DistributedData_RelationalStore_SDK_NoneTokenizerEtsAPITest_Query_0500
         * @tc.desc   RelationalStore NoneTokenizer 中英文数字空格
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreNoneTokenizerQuery0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreNoneTokenizerQuery0500 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个,测试 test 1,文档，用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索,测试test1')";
            const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'NoneTokenizer分词,器能够很好地处理中文文本的分词和分析,test,测试,1,')";

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

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试 test 1';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
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
         * @tc.name   testRdbStoreNoneTokenizerQuery0600
         * @tc.number SUB_DistributedData_RelationalStore_SDK_NoneTokenizerEtsAPITest_Query_0600
         * @tc.desc   RelationalStore NoneTokenizer 中英文数字特殊字符
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreNoneTokenizerQuery0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreNoneTokenizerQuery0600 ";
            console.info(TAGTEST + "*************  start *************");
            const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档,测试《test》1,用于测试中文本文本的分词和索引。')";
            const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '1,test,我们将使用这个《示例》,测试,来演示如何在SQLite中进行全文搜索。')";

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

            const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测试《test》1';";

            await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                console.info(TAGTEST + " querySql success");
                expect(1).assertEqual(resultSet.rowCount);
            }).catch((err:BusinessError) => {
                console.info(TAGTEST + " querySql error " + err.code + err.message);
                expect().assertFail();
                done();
            });
            console.info(TAGTEST + " ************* End*************");
            done();
        });
        console.info(TAG + " *************Unit Test End*************");
    })
}