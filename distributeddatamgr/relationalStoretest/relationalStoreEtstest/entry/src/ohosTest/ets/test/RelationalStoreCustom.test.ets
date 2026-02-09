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
const RDB_DB_CustomNAME = "RdbCustom.db";

const TAG = "[RelationalStore_Ets_TEST >>>>>> ]"
const CREATE_TABLE_TEST = "CREATE VIRTUAL TABLE IF NOT EXISTS test USING fts5(name, content, tokenize='customtokenizer');"

const STORE_CONFIG: data_Rdb.StoreConfig = {
    name: RDB_DB_CustomNAME,
    securityLevel: data_Rdb.SecurityLevel.S1,
    tokenizer: data_Rdb.Tokenizer.CUSTOM_TOKENIZER
}

let rdbStore:data_Rdb.RdbStore;
let customType = data_Rdb.Tokenizer.CUSTOM_TOKENIZER;
let customTypeSupported = data_Rdb.isTokenizerSupported(customType);
console.info(TAG + "custom tokenizer supported on current platform: " + customTypeSupported);

async function ReturnGetRdbStore(customTypeSupported:boolean) {
    if (customTypeSupported == false){
        console.info(TAG + "custom tokenizer not supported ");
        try {
            rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            expect().assertFail();
        } catch(err){
            console.info(TAG + "fail getRdbStore, code=" + err.code + err.message);
            expect("801").assertEqual(err.code);
        }
    }else{
        try {
            rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
            console.info(TAG + "success getRdbStore. rdbStore=" + rdbStore);
            expect(rdbStore != null).assertTrue();
        } catch(err){
            console.info(TAG + "fail getRdbStore, code=" + err.code + err.message);
            expect().assertFail();
        }
        await rdbStore.executeSql(CREATE_TABLE_TEST);
    }
};

export default function RelationalStoreCustom() {
    describe('RelationalStoreCustom', () => {
        beforeAll(async () => {
            console.info(TAG + 'beforeAll');
            context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
        });
        beforeEach(async () => {
            console.info(TAG + 'beforeEach');
        });
        afterEach(async () => {
            console.info(TAG + 'afterEach');
        });
        afterAll(async () => {
            console.info(TAG + 'afterAll');
            await data_Rdb.deleteRdbStore(context, RDB_DB_CustomNAME);
        });
        console.info(TAG + "*************Unit Test Begin*************");
        /**
         * @tc.name   testRdbStoreCustomInsert0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Insert_0100
         * @tc.desc   RelationalStore Custom insert test, query 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomInsert0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomInsert0100 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";

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
                        console.info(" resultSet.rowCount"+ resultSet.rowCount);
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
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomInsert0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Insert_0200
         * @tc.desc   RelationalStore Custom insert test, query 2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomInsert0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomInsert0200 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档很和，用于测试中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索测试很。和')";

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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '很和';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success");
                        expect(2).assertEqual(resultSet.rowCount);
                        resultSet.goToNextRow()
                        let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                        let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                        console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                        expect(resname).assertEqual('文档1');
                        expect(rescontent).assertEqual('这是一个测试文档很和，用于测试中文本文本的分词和索引。');

                        resultSet.goToNextRow()
                        let resname2 = resultSet.getString(resultSet.getColumnIndex("name"));
                        let rescontent2 = resultSet.getString(resultSet.getColumnIndex("content"));
                        console.info(TAGTEST + " resname2=" + resname2 + "  rescontent2=" + rescontent2);
                        expect(resname2).assertEqual('文档2');
                        expect(rescontent2).assertEqual('我们将使用这个示例来演示如何在SQLite中进行全文搜索测试很。和');
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomInsert0300
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Insert_0300
         * @tc.desc   RelationalStore Custom insert test, query 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomInsert0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomInsert0300 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";

                    await rdbStore.execute(SQL_INSERT1).then((data)=>{
                        console.info(TAGTEST + " SQL_INSERT1 success");
                        expect(1).assertEqual(data);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '文';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success");
                        expect(0).assertEqual(resultSet.rowCount);

                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomUpdate0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Update_0100
         * @tc.desc   RelationalStore Custom update data exist, query 2
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomUpdate0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomUpdate0100 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
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
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " *************  End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomUpdate0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Update_0200
         * @tc.desc   RelationalStore Custom update not exist, query 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomUpdate0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomUpdate0200 ";
            console.info(TAGTEST + "************* start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
                    const SQL_UPDATE1 = "UPDATE test SET content='这是一个文档，用于中文本文本的分词和索引。'   WHERE name='文档1'";

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
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " *************  End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomDelete0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Delete_0100
         * @tc.desc   RelationalStore Custom Delete not exist, query 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomDelete0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomDelete0100 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
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
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " *************  End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomDelete0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Delete_0200
         * @tc.desc   RelationalStore Custom Delete  exist, query 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomDelete0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomDelete0200 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
                    const SQL_DELETE1 = "DELETE FROM test WHERE name='文档1'";

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
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " *************  End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery0100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_0100
         * @tc.desc   RelationalStore Custom  1字， query 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery0100 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
                    const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'Custom分词器能够很好地处理中文文本的分词和分析。')";

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
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery0200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_0200
         * @tc.desc   RelationalStore Custom  1字， query 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery0200 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，訪用于测试中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。造訪')";
                    const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'Custom分词器能够很好地处理中文文本的分词和分析。隨訪')";

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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '訪';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                        expect(1).assertEqual(resultSet.rowCount);

                        resultSet.goToNextRow();
                        let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                        let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                        console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                        expect(resname).assertEqual('文档1');
                        expect(rescontent).assertEqual('这是一个测试文档，訪用于测试中文本文本的分词和索引。');

                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery0300
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_0300
         * @tc.desc   RelationalStore Custom  1字 不存在， query 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery0300 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档123', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
                    const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'Custom分词器能够很好地处理中文文本的分词和分析。')";

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
                        console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                        expect(0).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery0400
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_0400
         * @tc.desc   RelationalStore Custom  1字 存在， query 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery0400 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
                    const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'Custom分词器能够很好地处理中文文本的分词和分析。')";

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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH 'U';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                        expect(0).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery0500
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_0500
         * @tc.desc   RelationalStore Custom 2字， query 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery0500 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个透視测试文档，用于中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '透視學我们将使用这个示例来演示如何在SQLite中进行全文搜索。')";
                    const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '透视测这是一个文档试')";

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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '透視';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success");
                        expect(1).assertEqual(resultSet.rowCount);
                        while(resultSet.goToNextRow()){
                            let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                            let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                            console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                            expect(resname).assertEqual('文档1');
                            expect(rescontent).assertEqual('这是一个透視测试文档，用于中文本文本的分词和索引。');
                        }
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery0600
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_0600
         * @tc.desc   RelationalStore Custom 2字， query 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery0600 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测si试文档，用于中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', 'si我们将使用这个示例来演示如何在SQLite中进行全文搜索测试。')";
                    const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '测试si这是一个文档试')";

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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '测si';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success");
                        expect(1).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery0700
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_0700
         * @tc.desc   RelationalStore Custom 2字 不存在， query 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery0700 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', 'data这是一个测试文档，数据1用于中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来数演示如何在SQLite中进行全文搜索测试。据data1')";
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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '数据data1';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success");
                        expect(0).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery0800
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_0800
         * @tc.desc   RelationalStore Custom 2字 存在， query 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery0800 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
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
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery0900
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_0900
         * @tc.desc   RelationalStore Custom 3字， query 1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery0900 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档自治区，用于测试中文本文本的分词和索引。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '我们将使用这个示例来演示如何在SQLite中进行全文搜索。内蒙古自治区')";
                    const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', 'Custom分词器能够很好地处理中文文本的分词和分析。')";

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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '自治区';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success");
                        expect(1).assertEqual(resultSet.rowCount);
                        while(resultSet.goToNextRow()){
                            let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                            let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                            console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                            expect(resname).assertEqual('文档1');
                            expect(rescontent).assertEqual('这是一个测试文档自治区，用于测试中文本文本的分词和索引。');
                        }
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery1000
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1000
         * @tc.desc   RelationalStore Custom 3字， query 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1000 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";

                    await rdbStore.execute(SQL_INSERT1).then((data)=>{
                        console.info(TAGTEST + " SQL_INSERT1 success");
                        expect(1).assertEqual(data);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
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
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });


        /**
         * @tc.name   testRdbStoreCustomQuery1100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1100
         * @tc.desc   RelationalStore Custom query 4字
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1100 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '人工,智能峻岭欣欣向荣崇山')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '工人崇山欣欣向荣忧心忡忡走马观花风驰电掣容光焕发峻岭。智能')";
                    const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '欣欣向荣忧心忡忡走马观花风驰电掣智的能容光焕工的人发崇山峻岭眉清目秀千军万马张灯结彩。')";

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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '人工智能';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                        expect(0).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery1200
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1200
         * @tc.desc   RelationalStore Custom query n字俗语
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1200 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '三百六十行。')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '三百六十行，行行出状元。')";
                    const SQL_INSERT3 = "INSERT INTO test(name, content) VALUES ('文档3', '三百六十行行行出状元，天下无难事,只怕有心人。行行出状元')";

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
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery1300
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1300
         * @tc.desc   RelationalStore Custom query 完整文本
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1300 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '三百六十行，行行出状元 OR 谚语。比喻不论干哪一行，只要热爱本职工作，都能做出优异的成绩。';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                        expect(2).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery1400
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1400
         * @tc.desc   RelationalStore Custom query 位置1
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1400 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', '三百六十,行行，行行出状元，谚语。比喻不论干哪一行，只要热爱本职工作，都能做出优异的成绩。')";
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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH '行行AND出状元';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                        expect(0).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery1500
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1500
         * @tc.desc   RelationalStore Custom query 位置1 空格
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1500 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
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
                        expect(2).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery1600
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1600
         * @tc.desc   RelationalStore Custom query 位置1 标点
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1600 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
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
                        expect(0).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }

            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery1700
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1700
         * @tc.desc   RelationalStore Custom query 位置1 标点
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1700 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
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
                        expect(1).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery1800
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1800
         * @tc.desc   RelationalStore Custom  create table same name  testCustom, fail
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1800 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const CREATE_TABLE_Custom = "CREATE VIRTUAL TABLE testCustom USING fts5(name, content, tokenize='customtokenizer');";
                    const CREATE_TABLE_Custom_VIRTUAL = "CREATE VIRTUAL TABLE testCustom USING fts5(name, content);";
                    const CREATE_TABLE_NORMAL = "CREATE TABLE testCustom (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "content TEXT NOT NULL)";

                    await rdbStore.executeSql(CREATE_TABLE_Custom).then(()=>{
                        console.info(TAGTEST + " CREATE_TABLE_TEST success");
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " CREATE_TABLE_TEST error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });

                    await rdbStore.executeSql(CREATE_TABLE_Custom_VIRTUAL).then(()=>{
                        console.info(TAGTEST + " CREATE_TABLE_Custom_VIRTUAL success");
                        expect().assertFail();
                        done();
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " CREATE_TABLE_Custom_VIRTUAL error " + err.code + err.message);
                    });

                    await rdbStore.executeSql(CREATE_TABLE_NORMAL).then(()=>{
                        console.info(TAGTEST + " CREATE_TABLE_Custom_VIRTUAL success");
                        expect().assertFail();
                        done();
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " CREATE_TABLE_Custom_VIRTUAL error " + err.code + err.message);
                    });

                    await rdbStore.executeSql("DELETE FROM testCustom");
                    await rdbStore.executeSql("DROP TABLE IF EXISTS testCustom");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery1900
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_1900
         * @tc.desc   RelationalStore Custom  create table dif name  testCustom
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery1900 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const CREATE_TABLE_Custom = "CREATE VIRTUAL TABLE IF NOT EXISTS testCustom USING fts5(name, content, tokenize='customtokenizer');";
                    const CREATE_TABLE_Custom_VIRTUAL = "CREATE VIRTUAL TABLE IF NOT EXISTS testCustomvir USING fts5(name, content);";
                    const CREATE_TABLE_NORMAL = "CREATE TABLE IF NOT EXISTS testnormal (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "content TEXT NOT NULL)";

                    await rdbStore.executeSql(CREATE_TABLE_Custom).then(()=>{
                        console.info(TAGTEST + " CREATE_TABLE_TEST success");
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " CREATE_TABLE_TEST error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });

                    await rdbStore.executeSql(CREATE_TABLE_Custom_VIRTUAL).then(()=>{
                        console.info(TAGTEST + " CREATE_TABLE_Custom_VIRTUAL success");
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " CREATE_TABLE_Custom_VIRTUAL error " + err.code + err.message);
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

                    const SQL_INSERT1_testCustom = "INSERT INTO testCustom(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
                    await rdbStore.execute(SQL_INSERT1_testCustom).then((data)=>{
                        console.info(TAGTEST + " SQL_INSERT1_testCustom success");
                        expect(1).assertEqual(data);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " SQL_INSERT1_testCustom error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    const SQL_QUERY1_testCustom = "SELECT * FROM testCustom WHERE testCustom MATCH '测试';";
                    await rdbStore.querySql(SQL_QUERY1_testCustom).then((resultSet)=>{
                        console.info(TAGTEST + " SQL_QUERY1_testCustom success. resultSet.rowCount=" + resultSet.rowCount);
                        expect(1).assertEqual(resultSet.rowCount);

                        resultSet.goToNextRow();
                        let resname = resultSet.getString(resultSet.getColumnIndex("name"));
                        let rescontent = resultSet.getString(resultSet.getColumnIndex("content"));
                        console.info(TAGTEST + " resname=" + resname + "  rescontent=" + rescontent);
                        expect(resname).assertEqual('文档1');
                        expect(rescontent).assertEqual('这是一个测试文档，用于测试中文本文本的分词和索引。');
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " SQL_QUERY1_testCustom error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });

                    const SQL_INSERT1_testCustomvir = "INSERT INTO testCustomvir(name, content) VALUES ('文档1', '这是一个测试文档，用于测试中文本文本的分词和索引。')";
                    await rdbStore.execute(SQL_INSERT1_testCustomvir).then((data)=>{
                        console.info(TAGTEST + " SQL_INSERT1_testCustomvir success");
                        expect(1).assertEqual(data);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " SQL_INSERT1_testCustomvir error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    const SQL_QUERY1_testCustomvir = "SELECT * FROM testCustomvir WHERE testCustomvir MATCH '测试';";
                    await rdbStore.querySql(SQL_QUERY1_testCustomvir).then((resultSet)=>{
                        console.info(TAGTEST + " SQL_QUERY1_testCustomvir success. resultSet.rowCount=" + resultSet.rowCount);
                        expect(0).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " SQL_QUERY1_testCustomvir error " + err.code + err.message);
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

                    await rdbStore.executeSql("DROP TABLE IF EXISTS testCustom");
                    await rdbStore.executeSql("DROP TABLE IF EXISTS testCustomvir");
                    await rdbStore.executeSql("DROP TABLE IF EXISTS testnormal");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery2000
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_2000
         * @tc.desc   RelationalStore Custom query 日文
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery2000 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES ('文档1', 'こんにちは')";
                    const SQL_INSERT2 = "INSERT INTO test(name, content) VALUES ('文档2', '可愛いわ')";

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

                    const SQL_QUERY1 = "SELECT * FROM test WHERE test MATCH 'こんに';";

                    await rdbStore.querySql(SQL_QUERY1).then((resultSet)=>{
                        console.info(TAGTEST + " querySql success. resultSet.rowCount=" + resultSet.rowCount);
                        expect(1).assertEqual(resultSet.rowCount);
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " querySql error " + err.code + err.message);
                        expect().assertFail();
                        done();
                    });
                    await rdbStore.executeSql("DELETE FROM test");
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });

        /**
         * @tc.name   testRdbStoreCustomQuery2100
         * @tc.number SUB_DistributedData_RelationalStore_SDK_CustomEtsAPITest_Query_2100
         * @tc.desc   RelationalStore Custom insert not String
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testRdbStoreCustomQuery2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
            let TAGTEST = TAG + " testRdbStoreCustomQuery2100 ";
            console.info(TAGTEST + "*************  start *************");
            await ReturnGetRdbStore(customTypeSupported)
            try{
                if (customTypeSupported == true){
                    const SQL_INSERT1 = "INSERT INTO test(name, content) VALUES (文档1, 百六十行，天下无难事)";

                    await rdbStore.execute(SQL_INSERT1).then((data)=>{
                        console.info(TAGTEST + " SQL_INSERT1 success");
                        expect().assertFail();
                    }).catch((err:BusinessError) => {
                        console.info(TAGTEST + " SQL_INSERT1 error " + err.code + err.message);
                        expect(14800021).assertEqual(err.code);
                        done();
                    });
                }else{
                    expect(customTypeSupported).assertEqual(false);
                    console.info(TAGTEST + " custom tokenizer not supported **************************");
                }
            }catch(err){
                console.info(TAGTEST + "fail, code=" + err.code + err.message);
                expect().assertFail();
            }
            console.info(TAGTEST + " ************* End*************");
            done();
        });
        console.info(TAG + " *************Unit Test End*************");
    })
}