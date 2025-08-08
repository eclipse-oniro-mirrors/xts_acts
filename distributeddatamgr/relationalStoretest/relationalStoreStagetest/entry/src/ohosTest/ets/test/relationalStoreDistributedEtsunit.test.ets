
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
import deviceManager from '@ohos.distributedDeviceManager';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import dataRdb from '@ohos.data.relationalStore';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
const TAG = "[RDB_JSKITS_TEST_Distributed]"
const STORE_NAME = "distributed_rdb.db"
let rdbStore: dataRdb.RdbStore;
let context: common.UIAbilityContext;

function obtainDistributedTableName2(deviceId: string, tableName: string){
    rdbStore.obtainDistributedTableName(deviceId, tableName)
}

const config: dataRdb.StoreConfig = {
    "name": STORE_NAME,
    securityLevel: dataRdb.SecurityLevel.S1
}

const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, "
    + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)"

export default function relationalStoreDistributedTest() {
describe('relationalStoreDistributedTest', () => {
    beforeAll(async () => {
        console.info(TAG + 'beforeAll')
        context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
    })

    beforeEach(async () => {
        rdbStore = await dataRdb.getRdbStore(context, config);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null)
        console.info(TAG + 'beforeEach')
    })

    afterEach(async () => {
        await dataRdb.deleteRdbStore(context, STORE_NAME);
        console.info(TAG + 'afterEach')
    })

    afterAll(async () => {
        console.info(TAG + 'afterAll')
    })

    console.info(TAG + "*************Unit Test Begin*************");
    /**
     * @tc.name SUB_DDM_AppDataFWK_ETSRDB_Distributed_obtainDistributedTableName_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsApiTest_2700
     * @tc.desc obtainDistributedTableName test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('SUB_DDM_AppDataFWK_ETSRDB_Distributed_obtainDistributedTableName_0100', 0, async (done: Function) => {
        let deviceId: string | undefined = undefined;
        let errInfo : BusinessError | undefined = undefined;
        try{
            rdbStore.obtainDistributedTableName(deviceId, "EMPLOYEE", (err: BusinessError, tableName: string) =>{
                expect(err != null).assertTrue();
                console.info('ObtainDistributedTableName failed, Unauthorized.' + err)
            })
        }catch(err){
            errInfo = err
        }
        expect(errInfo!.code).assertEqual("401");
        done();
    })

    /**
     * @tc.name SUB_DDM_AppDataFWK_ETSRDB_Distributed_obtainDistributedTableName_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_SetDistributeJsApiTest_2800
     * @tc.desc obtainDistributedTableName test
	 * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
     it('SUB_DDM_AppDataFWK_ETSRDB_Distributed_obtainDistributedTableName_0200',0,async (done: Function)=> {
        let deviceId: string | undefined = "";
        let errInfo: BusinessError | undefined = undefined;
        try{
            obtainDistributedTableName2(deviceId, "EMPLOYEE")
        }catch(err){
            errInfo = err
            
        }
        expect(errInfo!.code).assertEqual("401")
        done();
    })

    console.info(TAG + "*************Unit Test End*************");
})
}
