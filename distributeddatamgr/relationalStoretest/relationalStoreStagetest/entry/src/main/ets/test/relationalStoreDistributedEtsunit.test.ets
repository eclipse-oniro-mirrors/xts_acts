
/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import dataRdb from '@ohos.data.relationalStore';

const TAG = "[RDB_JSKITS_TEST_Distributed]"
const STORE_NAME = "distributed_rdb.db"
var rdbStore = undefined;

const config = {
    "name": STORE_NAME,
    securityLevel: dataRdb.SecurityLevel.S1
}
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
    + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)"
export default function relationalStoreDistributedTest(context) {
describe('relationalStoreDistributedTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
    })

    beforeEach(async function () {
        rdbStore = await dataRdb.getRdbStore(context, config);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        console.info(TAG + 'beforeEach')
    })

    afterEach(async function () {
        await dataRdb.deleteRdbStore(context, STORE_NAME);
        console.info(TAG + 'afterEach')
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.name obtainDistributedTableName Callback interface test
     * @tc.number SUB_DDM_AppDataFWK_ETSRDB_Distributed_obtainDistributedTableName_0100
     * @tc.desc obtainDistributedTableName test
     */
    it('SUB_DDM_AppDataFWK_ETSRDB_Distributed_obtainDistributedTableName_0100', 0, async function (done){
        let errInfo = undefined;
        function obtainDistributedTableName(deviceId, tableName, Callback){
            rdbStore.obtainDistributedTableName(deviceId, tableName, Callback)
        }
        try{
            obtainDistributedTableName(["deviceId"], "EMPLOYEE", function (err, tableName) {
                expect(err != null).assertTrue();
                console.info('ObtainDistributedTableName failed, Unauthorized.' + err)
            })
        }catch(err){
            errInfo = err
        }
        expect(errInfo.code).assertEqual("401")
        done();
    })

    /**
     * @tc.name obtainDistributedTableName Promise interface test
     * @tc.number SUB_DDM_AppDataFWK_ETSRDB_Distributed_obtainDistributedTableName_0200
     * @tc.desc obtainDistributedTableName test
     */
     it('SUB_DDM_AppDataFWK_ETSRDB_Distributed_obtainDistributedTableName_0200',0,async function (done){
        let errInfo = undefined
        function obtainDistributedTableName(deviceId, tableName){
            rdbStore.obtainDistributedTableName(deviceId, tableName)
        }
        try{
            obtainDistributedTableName(["deviceId"], "EMPLOYEE")
        }catch(err){
            errInfo = err
        }
        expect(errInfo.code).assertEqual("401")
        done();
    })

    console.info(TAG + "*************Unit Test End*************");
})
}
