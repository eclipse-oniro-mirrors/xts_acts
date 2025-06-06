/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import data_relationalStore from '@ohos.data.relationalStore'
import ability_featureAbility from '@ohos.ability.featureAbility'


var context = ability_featureAbility.getContext();
// var contextApplication = context.getApplicationContext();
const TAG = "[RelationalStore_JSKITS_TEST]";
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " +
    "data1 asset, " + "data2 asset, " + "data3 assets )";
const DROP_TABLE_TEST = "DROP TABLE IF EXISTS test";

const STORE_CONFIG = {
    name: "Asset.db",
    securityLevel: data_relationalStore.SecurityLevel.S1,
}
const asset1 = {
    name: "name1",
    uri: "uri1",
    createTime: "createTime1",
    modifyTime: "modifyTime1",
    size: "size1",
    path: "path1",
    status: data_relationalStore.AssetStatus.ASSET_NORMAL,
}
const asset2 = {
    name: "name2",
    uri: "uri2",
    createTime: "createTime2",
    modifyTime: "modifyTime2",
    size: "size2",
    path: "path2",
    status: data_relationalStore.AssetStatus.ASSET_INSERT,
}
const asset3 = {
    name: "name3",
    uri: "uri3",
    createTime: "createTime3",
    modifyTime: "modifyTime3",
    size: "size3",
    path: "path3",
    status: data_relationalStore.AssetStatus.ASSET_UPDATE,
}
const asset4 = {
    name: "name4",
    uri: "uri4",
    createTime: "createTime4",
    modifyTime: "modifyTime4",
    size: "size4",
    path: "path4",
}
const asset5 = {
    name: "name5",
    uri: "uri5",
    createTime: "createTime5",
    modifyTime: "modifyTime5",
    size: "size5",
    path: "path5",
    status: data_relationalStore.AssetStatus.ASSET_DELETE,
}
const asset6 = {
    name: "name6",
    uri: "uri6",
    createTime: "createTime6",
    modifyTime: "modifyTime6",
    size: "size6",
    path: "path6",
    status: data_relationalStore.AssetStatus.ASSET_ABNORMAL,
}
const asset7 = {
    name: "name7",
    uri: "uri7",
    createTime: "createTime7",
    modifyTime: "modifyTime7",
    size: "size7",
    path: "path7",
    status: data_relationalStore.AssetStatus.ASSET_DOWNLOADING,
}


var rdbStore = undefined;

export default function relationalStoreAssetResultSetTest() {
    describe('relationalStoreAssetResultSetTest', function () {
        beforeAll(async function () {
            console.info(TAG + 'beforeAll')
            rdbStore = await data_relationalStore.getRdbStore(context, STORE_CONFIG);
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
        })
    
        beforeEach(async function () {
            await rdbStore.executeSql(CREATE_TABLE_TEST, null);
            console.info(TAG + 'beforeEach');
        })
    
        afterEach(async function () {
            await rdbStore.executeSql(DROP_TABLE_TEST, null);
            console.info(TAG + 'afterEach')
        })
    
        afterAll(async function () {
            console.info(TAG + 'afterAll')
            rdbStore = null
            await data_relationalStore.deleteRdbStore(context, "Asset.db");
        })
    
        // insert data
        async function createTest() {
            console.log(TAG + "createTest data start");
            const assets1 = [asset1];
            const assets2 = [asset1, asset2, asset3];
            let valuesBucket = {
                "data1": asset1,
                "data2": asset2,
                "data3": assets1,
            }
            await rdbStore.insert("test", valuesBucket);
            valuesBucket = {
                "data1": asset2,
                "data2": asset3,
                "data3": assets2,
            }
            await rdbStore.insert("test", valuesBucket);
            valuesBucket = {
                "data1": asset1,
                "data3": new Array()
            }
            await rdbStore.insert("test", valuesBucket);
            console.log(TAG + "createTest data end");
        }
    
        async function createStatusTest() {
            console.log(TAG + "createStatusTest data start");
            let valuesBucket = {
                "data1": asset4,
            }
            await rdbStore.insert("test", valuesBucket);
            console.log(TAG + "createStatusTest data end");
        }
    
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_0100
         * @tc.desc resultSet getAsset normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testGetAsset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await createTest();
            console.log(TAG + "************* testGetAsset0001 start *************");
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            try {
                expect(true).assertEqual(resultSet.goToFirstRow());
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data1 = resultSet.getAsset(resultSet.getColumnIndex("data1"))
                console.log(TAG + "id=" + id + ", data1=" + data1);
                expect("name1").assertEqual(data1.name);
                expect("uri1").assertEqual(data1.uri);
                expect("createTime1").assertEqual(data1.createTime);
                expect("modifyTime1").assertEqual(data1.modifyTime);
                expect("size1").assertEqual(data1.size);
                expect("path1").assertEqual(data1.path);

                const data2 = resultSet.getAsset(resultSet.getColumnIndex("data2"))
                console.log(TAG + "id=" + id + ", data2=" + data2);
                expect("name2").assertEqual(data2.name);
                expect("uri2").assertEqual(data2.uri);
                expect("createTime2").assertEqual(data2.createTime);
                expect("modifyTime2").assertEqual(data2.modifyTime);
                expect("size2").assertEqual(data2.size);
                expect("path2").assertEqual(data2.path);
    
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
                expect(null).assertFail();
            }
            resultSet = null
            done();
            console.log(TAG + "************* testGetAsset0001 end *************");
        })
    
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_0200
         * @tc.desc resultSet getAsset insert test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testGetAsset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await createTest();
            console.log(TAG + "************* testGetAsset0002 start *************");
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data1 = resultSet.getAsset(resultSet.getColumnIndex("data1"))
                console.log(TAG + "id=" + id + ", data1=" + data1);
                expect("name2").assertEqual(data1.name);
                expect("uri2").assertEqual(data1.uri);
                expect("createTime2").assertEqual(data1.createTime);
                expect("modifyTime2").assertEqual(data1.modifyTime);
                expect("size2").assertEqual(data1.size);
                expect("path2").assertEqual(data1.path);
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
                expect(null).assertFail();
            }
            resultSet = null
            done();
            console.log(TAG + "************* testGetAsset0002 end *************");
        })
    
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_0300
         * @tc.desc resultSet getAsset normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testGetAsset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await createTest();
            console.log(TAG + "************* testGetAsset0003 start *************");
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data2 = resultSet.getAsset(resultSet.getColumnIndex("data2"))
                console.log(TAG + "id=" + id + ", data2=" + data2);
                expect(data2).assertEqual(null);

                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
                expect(null).assertFail();
            }
            resultSet = null
            done();
            console.log(TAG + "************* testGetAsset0003 end *************");
        })

        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_0400
         * @tc.desc resultSet getAsset delete test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testGetAsset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log(TAG + "************* testGetAsset0004 start *************");
            let assets5 = [asset5];
            const valuesBucket = {
                "data3": assets5,
            }
            await rdbStore.insert("test", valuesBucket);
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            var id;
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data5 = resultSet.getAsset(resultSet.getColumnIndex("data3"))
                expect(1).assertEqual(data5.length);
                expect(null).assertFail();
            } catch (e) {
                console.log(TAG + "testGetAsset0004 throw error: " + e);
                expect(e.code == 14800000).assertTrue();
            } finally {
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
                resultSet = null
                done();
                console.log(TAG + "************* testGetAsset0004 end *************");
            }
        })
        
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_0500
         * @tc.desc resultSet getAsset ABNORMAL test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
         it('testGetAsset0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log(TAG + "************* testGetAsset0005 start *************");
            let assets6 = [asset6];
            const valuesBucket = {
                "data3": assets6,
            }
            await rdbStore.insert("test", valuesBucket);
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            var id;
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data6 = resultSet.getAsset(resultSet.getColumnIndex("data3"))
                expect(1).assertEqual(data6.length);
                expect(null).assertFail();
            } catch (e) {
                console.log(TAG + "testGetAsset0005 throw error: " + e);
                expect(e.code == 14800000).assertTrue();
            } finally {
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
                resultSet = null
                done();
                console.log(TAG + "************* testGetAsset0005 end *************");
            }
        })
                
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_0600
         * @tc.desc resultSet getAsset DOWNLOADING test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
         it('testGetAsset0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log(TAG + "************* testGetAsset0006 start *************");
            let assets7 = [asset7];
            const valuesBucket = {
                "data3": assets7,
            }
            await rdbStore.insert("test", valuesBucket);
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            var id;
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data7 = resultSet.getAsset(resultSet.getColumnIndex("data3"))
                expect(1).assertEqual(data7.length);
                expect(null).assertFail();
            } catch (e) {
                console.log(TAG + "testGetAsset0006 throw error: " + e);
                expect(e.code == 14800000).assertTrue();
            } finally {
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
                resultSet = null
                done();
                console.log(TAG + "************* testGetAsset0006 end *************");
            }
        })
    
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_0700
         * @tc.desc resultSet getAsset normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testAssetNoStatus0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log(TAG + "************* testAssetNoStatus0010 start *************");
            await createStatusTest();
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data1 = resultSet.getAsset(resultSet.getColumnIndex("data1"))
                console.log(TAG + "id=" + id + ", data1=" + data1);
                expect("name4").assertEqual(data1.name);
                expect("uri4").assertEqual(data1.uri);
                expect("createTime4").assertEqual(data1.createTime);
                expect("modifyTime4").assertEqual(data1.modifyTime);
                expect("size4").assertEqual(data1.size);
                expect("path4").assertEqual(data1.path);
    
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
                expect(null).assertFail();
            }
            resultSet = null
            done();
            console.log(TAG + "************* testAssetNoStatus0010 end *************");
        })
    
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_0800
         * @tc.desc resultSet getAsset normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testAssetStatusUndefined0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log(TAG + "************* testAssetStatusUndefined0010 start *************");
            const asset = {
                name: "name4",
                uri: "uri4",
                createTime: "createTime4",
                modifyTime: "modifyTime4",
                size: "size4",
                path: "path4",
                status: undefined,
            }
            let valuesBucket = {
                "data1": asset,
            }

            await rdbStore.insert("test", valuesBucket)
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data1 = resultSet.getAsset(resultSet.getColumnIndex("data1"))
                console.log(TAG + "id=" + id + ", data1=" + data1);
                expect("name4").assertEqual(data1.name);
                expect("uri4").assertEqual(data1.uri);
                expect("createTime4").assertEqual(data1.createTime);
                expect("modifyTime4").assertEqual(data1.modifyTime);
                expect("size4").assertEqual(data1.size);
                expect("path4").assertEqual(data1.path);
    
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
                expect(null).assertFail();
            }
            resultSet = null
            done();
            console.log(TAG + "************* testAssetStatusUndefined0010 end *************");
        })
    
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_0900
         * @tc.desc resultSet getAsset normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testAssetStatusNull0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log(TAG + "************* testAssetStatusNull0010 start *************");
            const asset = {
                name: "name4",
                uri: "uri4",
                createTime: "createTime4",
                modifyTime: "modifyTime4",
                size: "size4",
                path: "path4",
                status: null,
            }
            let valuesBucket = {
                "data1": asset,
            }

            await rdbStore.insert("test", valuesBucket)
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data1 = resultSet.getAsset(resultSet.getColumnIndex("data1"))
                console.log(TAG + "id=" + id + ", data1=" + data1);
                expect("name4").assertEqual(data1.name);
                expect("uri4").assertEqual(data1.uri);
                expect("createTime4").assertEqual(data1.createTime);
                expect("modifyTime4").assertEqual(data1.modifyTime);
                expect("size4").assertEqual(data1.size);
                expect("path4").assertEqual(data1.path);
    
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
                expect(null).assertFail();
            }
            resultSet = null
            done();
            console.log(TAG + "************* testAssetStatusNull0010 end *************");
        })
    
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_1000
         * @tc.desc resultSet getAsset normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testGetAssetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log(TAG + "************* testGetAssetUndefined start *************");
            const asset = {
                name: undefined,
                uri: undefined,
                createTime: "createTime",
                modifyTime: "modifyTime",
                size: "size",
                path: "path",
            }
            try {
                let valuesBucket = {
                    "data1": asset,
                }
                await rdbStore.insert("test", valuesBucket);
                console.error(TAG + "testGetAssetUndefined should not come here");
                expect(null).assertFail();
                done();
            } catch (e) {
                console.log(TAG + "testGetAssetUndefined get error" + JSON.stringify(e));
                expect('401').assertEqual(e.code)
                done();
            }
        })
    
        /**
         * @tc.name resultSet getAsset normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_1100
         * @tc.desc resultSet getAsset normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testGetAssetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            console.log(TAG + "************* testGetAssetNull start *************");
            const asset = {
                name: null,
                uri: null,
                createTime: "createTime",
                modifyTime: "modifyTime",
                size: "size",
                path: "path",
            }
            try {
                let valuesBucket = {
                    "data1": asset,
                }
                await rdbStore.insert("test", valuesBucket);
                console.error(TAG + "testGetAssetNull should not come here");
                expect(null).assertFail();
                done();
            } catch (e) {
                console.log(TAG + "testGetAssetNull get error" + JSON.stringify(e));
                expect('401').assertEqual(e.code)
                done();
            }
        })
    
        /**
         * @tc.name resultSet getAssets normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_1200
         * @tc.desc resultSet getAssets normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testGetAssets0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await createTest();
            console.log(TAG + "************* testGetAssets0001 start *************");
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data3 = resultSet.getAssets(resultSet.getColumnIndex("data3"))
                console.log(TAG + "id=" + id + ", data3=" + data3);
                expect(1).assertEqual(data3.length);
                let asset = data3[0];
                expect("name1").assertEqual(asset.name);
                expect("uri1").assertEqual(asset.uri);
                expect("createTime1").assertEqual(asset.createTime);
                expect("modifyTime1").assertEqual(asset.modifyTime);
                expect("size1").assertEqual(asset.size);
                expect("path1").assertEqual(asset.path);
    
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
                expect(null).assertFail();
            }
            resultSet = null
            done();
            console.log(TAG + "************* testGetAssets0001 end *************");
        })
    
        /**
         * @tc.name resultSet getAssets normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_1300
         * @tc.desc resultSet getAssets normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testGetAssets0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await createTest();
            console.log(TAG + "************* testGetAssets0002 start *************");
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data3 = resultSet.getAssets(resultSet.getColumnIndex("data3"))
                console.log(TAG + "id=" + id + ", data3=" + data3);
                expect(3).assertEqual(data3.length);
                let asset = data3[0];
                expect("name1").assertEqual(asset.name);
                expect("uri1").assertEqual(asset.uri);
                expect("createTime1").assertEqual(asset.createTime);
                expect("modifyTime1").assertEqual(asset.modifyTime);
                expect("size1").assertEqual(asset.size);
                expect("path1").assertEqual(asset.path);
    
                asset = data3[1];
                expect("name2").assertEqual(asset.name);
                expect("uri2").assertEqual(asset.uri);
                expect("createTime2").assertEqual(asset.createTime);
                expect("modifyTime2").assertEqual(asset.modifyTime);
                expect("size2").assertEqual(asset.size);
                expect("path2").assertEqual(asset.path);

                asset = data3[2];
                expect("name3").assertEqual(asset.name);
                expect("uri3").assertEqual(asset.uri);
                expect("createTime3").assertEqual(asset.createTime);
                expect("modifyTime3").assertEqual(asset.modifyTime);
                expect("size3").assertEqual(asset.size);
                expect("path3").assertEqual(asset.path);
    
                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
                expect(null).assertFail();
            }
            resultSet = null
            done();
            console.log(TAG + "************* testGetAssets0002 end *************");
        })
    
        /**
         * @tc.name resultSet getAssets normal test
         * @tc.number SUB_DistributedData_RelationalStore_SDK_GetAssertJsAPITest_1400
         * @tc.desc resultSet getAssets normal test
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 2
         */
        it('testGetAssets0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await createTest();
            console.log(TAG + "************* testGetAssets0003 start *************");
            let predicates = await new data_relationalStore.RdbPredicates("test")
            let resultSet = await rdbStore.query(predicates)
            try {
                expect(true).assertEqual(resultSet.goToFirstRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                expect(true).assertEqual(resultSet.goToNextRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const data3 = resultSet.getAssets(resultSet.getColumnIndex("data3"))
                console.log(TAG + "id=" + id + ", data3=" + data3);
                expect(data3.length).assertEqual(0);

                resultSet.close();
                expect(true).assertEqual(resultSet.isClosed)
            } catch (e) {
                expect(null).assertFail();
            }
            resultSet = null
            done();
            console.log(TAG + "************* testGetAssets0003 end *************");
        })

        console.info(TAG + "*************Unit Test End*************")
    })
}