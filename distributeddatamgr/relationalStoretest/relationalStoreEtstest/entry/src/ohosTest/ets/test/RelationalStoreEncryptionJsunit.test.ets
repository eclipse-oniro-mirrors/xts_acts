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
import data_rdb from '@ohos.data.relationalStore'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let context: common.UIAbilityContext;
const TAG = "[RelationalStore_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
    + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)"
let rdbStore:data_rdb.RdbStore | null
const STORE_CONFIG_ENCRYPT: data_rdb.StoreConfig = {
    name: "Encrypt.db",
    encrypt: true,
    securityLevel: data_rdb.SecurityLevel.S1
}
const STORE_CONFIG_UNENCRYPT: data_rdb.StoreConfig = {
    name: "Unencrypt.db",
    encrypt: false,
    securityLevel: data_rdb.SecurityLevel.S1
}
const STORE_CONFIG_WRONG: data_rdb.StoreConfig = {
    name: "Encrypt.db",
    encrypt: false,
    securityLevel: data_rdb.SecurityLevel.S1
}

async function CreatRdbStore(context:common.UIAbilityContext, STORE_CONFIG:data_rdb.StoreConfig) {
    let rdbStore = await data_rdb.getRdbStore(context, STORE_CONFIG)
    await rdbStore.executeSql(CREATE_TABLE_TEST, null)
    let u8 = new Uint8Array([1, 2, 3])

    const valueBucket:data_rdb.ValuesBucket = {
        "name": "zhangsan",
        "age": 18,
        "salary": 100.5,
        "blobType": u8,
    }
    await rdbStore.insert("test", valueBucket)

    {
        const valueBucket:data_rdb.ValuesBucket = {
            "name": "lisi",
            "age": 28,
            "salary": 100.5,
            "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket)
    }
    {
        const valueBucket:data_rdb.ValuesBucket = {
            "name": "wangwu",
            "age": 38,
            "salary": 90.0,
            "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket)
    }
    return rdbStore;
}

export default function relationalStoreEncryptTest() {
    describe('relationalStoreEncryptTest', () => {
        beforeAll(async () => {
            console.info(TAG + 'beforeAll')
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
        })

        beforeEach(async () => {
            console.info(TAG + 'beforeEach')
        })

        afterEach(async () => {
            console.info(TAG + 'afterEach')
            await data_rdb.deleteRdbStore(context, STORE_CONFIG_ENCRYPT.name)
            await data_rdb.deleteRdbStore(context, STORE_CONFIG_UNENCRYPT.name)
            await data_rdb.deleteRdbStore(context, STORE_CONFIG_WRONG.name)
            rdbStore = null
        })

        afterAll(async () => {
            console.info(TAG + 'afterAll')
        })

        console.info(TAG + "*************Unit Test Begin*************")

        /**
         * @tc.name RdbEncryptTest0010
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytEtsAPITest_0100
         * @tc.desc RelationalStore create encrypt db test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RdbEncryptTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
            console.info(TAG + "************* RdbEncryptTest_0010 start *************")
            data_rdb.getRdbStore(context, STORE_CONFIG_ENCRYPT).then((store) => {
                done()
                expect(store != null).assertTrue();
            }).catch((err:BusinessError) => {
                expect(null).assertFail();
            })
            console.info(TAG + "************* RdbEncryptTest_0010 end *************")
        })

        /**
         * @tc.name RdbEncryptTest0020
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytEtsAPITest_0200
         * @tc.desc RelationalStore create unencrypted db test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RdbEncryptTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
            console.info(TAG + "************* RdbEncryptTest_0020 start *************")
            let storePromise = data_rdb.getRdbStore(context, STORE_CONFIG_UNENCRYPT);
            storePromise.then((store) => {
                expect(store != null).assertTrue();
                done()
            }).catch((err:BusinessError) => {
                expect(null).assertFail();
            })

            console.info(TAG + "************* RdbEncryptTest_0020 end *************")
        })


        /**
         * @tc.name RdbEncryptTest0030
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytEtsAPITest_0300
         * @tc.desc RelationalStore Encrypt function test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RdbEncryptTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
            console.info(TAG + "************* RdbEncryptTest_0030 start *************")
            rdbStore = await CreatRdbStore(context, STORE_CONFIG_ENCRYPT)
            let predicates = new data_rdb.RdbPredicates("test")
            predicates.equalTo("name", "zhangsan")
            let resultSet: data_rdb.ResultSet | null = await rdbStore.query(predicates)
            try {
                console.info(TAG + "After restore resultSet query done")
                expect(true).assertEqual(resultSet.goToFirstRow())
                const id = resultSet.getLong(resultSet.getColumnIndex("id"))
                const name = resultSet.getString(resultSet.getColumnIndex("name"))
                const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
                expect(1).assertEqual(id)
                expect("zhangsan").assertEqual(name)
                expect(1).assertEqual(blobType[0])
            } catch (err) {
                expect(false).assertTrue()
            }
            resultSet = null
            rdbStore = null
            done()
            console.info(TAG + "************* RdbEncryptTest_0030 end *************")
        })

        /**
         * @tc.name RdbEncryptTest0040
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytEtsAPITest_0400
         * @tc.desc RelationalStore Encrypt function test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RdbEncryptTest0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) =>{
            console.info(TAG + "************* RdbEncryptTest_0040 start *************")
            rdbStore = await CreatRdbStore(context, STORE_CONFIG_ENCRYPT)
            rdbStore = null
            try {
                rdbStore = await CreatRdbStore(context, STORE_CONFIG_WRONG)
                expect(rdbStore !== null).assertTrue()
            } catch (err) {
                console.info(TAG + `catch err: err.code= ${err.code}, message = ${err.message}`)
                expect().assertFail();
            }
            done()
            console.info(TAG + "************* RdbEncryptTest_0040 end *************")
        })

        /**
         * @tc.name RdbEncryptTest0050
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytEtsAPITest_0500
         * @tc.desc RelationalStore Encrypt function test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RdbEncryptTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done:Function) => {
            console.info(TAG + "************* RdbEncryptTest0050 start *************")
            rdbStore = await CreatRdbStore(context, STORE_CONFIG_WRONG)
            rdbStore = null
            try {
                rdbStore = await CreatRdbStore(context, STORE_CONFIG_ENCRYPT)
                expect(rdbStore !== null).assertTrue()
            } catch (err) {
                console.info(TAG + `catch err: err.code= ${err.code}, message = ${err.message}`)
                expect().assertFail();
            }
            done()
            console.info(TAG + "************* RdbEncryptTest0050 end *************")
        })
        console.info(TAG + "*************Unit Test End*************")
    }
    )
}