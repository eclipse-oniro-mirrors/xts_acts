/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import ability_featureAbility from '@ohos.ability.featureAbility'


const TAG = "[RelationalStore_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
    + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)"

var rdbStore
var context = ability_featureAbility.getContext();
const STORE_CONFIG_ENCRYPT = {
    name: "Encrypt.db",
    encrypt: true,
    securityLevel: data_rdb.SecurityLevel.S1
}
const STORE_CONFIG_UNENCRYPT = {
    name: "Unencrypt.db",
    encrypt: false,
    securityLevel: data_rdb.SecurityLevel.S1
}
const STORE_CONFIG_WRONG = {
    name: "Encrypt.db",
    encrypt: false,
    securityLevel: data_rdb.SecurityLevel.S1
}

export default function relationalStoreEncryptTest() {
async function CreatRdbStore(context, STORE_CONFIG) {
    let rdbStore = await data_rdb.getRdbStore(context, STORE_CONFIG)
    await rdbStore.executeSql(CREATE_TABLE_TEST, null)
    let u8 = new Uint8Array([1, 2, 3])
    {
        const valueBucket = {
            "name": "zhangsan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket)
    }
    {
        const valueBucket = {
            "name": "lisi",
            "age": 28,
            "salary": 100.5,
            "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket)
    }
    {
        const valueBucket = {
            "name": "wangwu",
            "age": 38,
            "salary": 90.0,
            "blobType": u8,
        }
        await rdbStore.insert("test", valueBucket)
    }
    return rdbStore
}

describe('relationalStoreEncryptTest', function () {
        beforeAll(async function () {
            console.info(TAG + 'beforeAll')

        })

        beforeEach(async function () {
            console.info(TAG + 'beforeEach')

        })

        afterEach(async function () {
            console.info(TAG + 'afterEach')
            await data_rdb.deleteRdbStore(context, STORE_CONFIG_ENCRYPT.name)
            await data_rdb.deleteRdbStore(context, STORE_CONFIG_UNENCRYPT.name)
            await data_rdb.deleteRdbStore(context, STORE_CONFIG_WRONG.name)
            rdbStore = null
        })

        afterAll(async function () {
            console.info(TAG + 'afterAll')
        })

        console.info(TAG + "*************Unit Test Begin*************")

        /**
         * @tc.name RdbEncryptTest_0010
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytJsAPITest_0100
         * @tc.desc RelationalStore create encrypt db test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RdbEncryptTest_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info(TAG + "************* RdbEncryptTest_0010 start *************")
            context = ability_featureAbility.getContext()
            data_rdb.getRdbStore(context, STORE_CONFIG_ENCRYPT).then((store) => {
                done()
                expect(store != null).assertTrue();
            }).catch((err) => {
                expect(null).assertFail();
            })
            console.info(TAG + "************* RdbEncryptTest_0010 end *************")
        })

        /**
         * @tc.name RdbEncryptTest_0020
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytJsAPITest_0200
         * @tc.desc RelationalStore create unencrypted db test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RdbEncryptTest_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info(TAG + "************* RdbEncryptTest_0020 start *************")
            context = ability_featureAbility.getContext()
            let storePromise = data_rdb.getRdbStore(context, STORE_CONFIG_UNENCRYPT);
            storePromise.then((store) => {
                expect(store != null).assertTrue();
                done()
            }).catch((err) => {
                expect(null).assertFail();
            })
            
            console.info(TAG + "************* RdbEncryptTest_0020 end *************")
        })


        /**
         * @tc.name RdbEncryptTest_0030
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytJsAPITest_0300
         * @tc.desc RelationalStore Encrypt function test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RdbEncryptTest_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info(TAG + "************* RdbEncryptTest_0030 start *************")
            context = ability_featureAbility.getContext()
            rdbStore = await CreatRdbStore(context, STORE_CONFIG_ENCRYPT)
            let predicates = new data_rdb.RdbPredicates("test")
            predicates.equalTo("name", "zhangsan")
            let resultSet = await rdbStore.query(predicates)
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
         * @tc.name RdbEncryptTest_0040
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytJsAPITest_0400
         * @tc.desc RelationalStore Encrypt function test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
         it('RdbEncryptTest_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info(TAG + "************* RdbEncryptTest_0040 start *************")
            context = ability_featureAbility.getContext()
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
         * @tc.name RdbEncryptTest_0050
         * @tc.number SUB_DistributedData_RelationalStore_SDK_EncrpytJsAPITest_0500
         * @tc.desc RelationalStore Encrypt function test
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('RdbEncryptTest_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            console.info(TAG + "************* RdbEncryptTest_0050 start *************")
            context = ability_featureAbility.getContext()
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
            console.info(TAG + "************* RdbEncryptTest_0050 end *************")
        })
        console.info(TAG + "*************Unit Test End*************")
    }
)

}