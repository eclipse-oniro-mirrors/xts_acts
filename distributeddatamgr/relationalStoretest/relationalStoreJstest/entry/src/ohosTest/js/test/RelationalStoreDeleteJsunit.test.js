/*
 * Copyright (C) 2021-2022 Huawei Device Co., Ltd.
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
import ability_featureAbility from '@ohos.ability.featureAbility'

const TAG = '[RelationalStore_JSKITS_TEST]'
const CREATE_TABLE_TEST = 'CREATE TABLE IF NOT EXISTS test (' + 'id INTEGER PRIMARY KEY AUTOINCREMENT, ' + 'name TEXT NOT NULL, ' + 'age INTEGER, ' + 'salary REAL, ' + 'blobType BLOB)';

const STORE_CONFIG = {
    name: 'Delete.db',
    securityLevel: data_Rdb.SecurityLevel.S1
}
let rdbStore = undefined;
var context = ability_featureAbility.getContext()

export default function relationalStoreDeleteTest() {
describe('relationalStoreDeleteTest', function () {
    beforeAll(function () {
        console.info(TAG + 'beforeAll')
    })

    beforeEach(async function () {
        console.info(TAG + 'beforeEach')
        rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await rdbStore.executeSql(CREATE_TABLE_TEST, null);
    })

    afterEach(async function () {
        console.info(TAG + 'afterEach')
        await rdbStore.executeSql('DELETE FROM test');
        rdbStore = null
        await data_Rdb.deleteRdbStore(context, 'Delete.db');
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
    })

    console.info(TAG + '*************Unit Test Begin*************');
    
    /**
     * @tc.name testRdbStoreDelete0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteJsAPITest_0100
     * @tc.desc RelationalStore delete test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testRdbStoreDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0001 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        {
            let predicates = new data_Rdb.RdbPredicates('test')
            rdbStore.delete(predicates).then(async (ret) => {
                expect(3).assertEqual(ret)
                console.info(TAG + 'Delete done: ' + ret)
                done()
                console.info(TAG + '************* testRdbStoreDelete0001 end *************');
            }).catch((err) => {
                expect(null).assertFail()
            })
        }
    })

    /**
     * @tc.name testRdbStoreDelete0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteJsAPITest_0200
     * @tc.desc RelationalStore delete test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testRdbStoreDelete0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0002 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        {
            let predicates = await new data_Rdb.RdbPredicates('test')
            predicates.equalTo('name', 'zhangsan')
            rdbStore.delete(predicates).then(async (ret) => {
                expect(1).assertEqual(ret)
                console.info(TAG + 'Delete done: ' + ret)
                done()
                console.info(TAG + '************* testRdbStoreDelete0002 end *************');
            }).catch((err) => {
                expect(null).assertFail()
            })
        }
    })

    /**
     * @tc.name testRdbStoreDelete0003
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteJsAPITest_0300
     * @tc.desc RelationalStore delete test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testRdbStoreDelete0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0003 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除前查询
        {
            let predicates = await new data_Rdb.RdbPredicates('test')
            predicates.equalTo('age', 28)
            let resultSet = await rdbStore.query(predicates)
            expect(1).assertEqual(resultSet.rowCount)
        }
        //删除
        
        let predicates = await new data_Rdb.RdbPredicates('test')
        predicates.equalTo('age', 28)
        rdbStore.delete(predicates).then(async (ret) => {
            expect(1).assertEqual(ret)
            console.info(TAG + 'Delete done: ' + ret)
            //删除后查询
    
            let predicates = await new data_Rdb.RdbPredicates('test')
            predicates.equalTo('age', 28)
            let resultSet = await rdbStore.query(predicates)
            expect(0).assertEqual(resultSet.rowCount)
        
            done()
            console.info(TAG + '************* testRdbStoreDelete0003 end *************');
        }).catch((err) => {
            expect(null).assertFail()
        })
    })

    /**
     * @tc.name testRdbStoreDelete0004
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteJsAPITest_0400
     * @tc.desc RelationalStore delete test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testRdbStoreDelete0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0004 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        {
            let predicates = await new data_Rdb.RdbPredicates('test')
            predicates.equalTo('aaa id', 1)
            rdbStore.delete(predicates).then(async (ret) => {
                console.info(TAG + 'delete done: ' + ret)
                expect(null).assertFail()
            }).catch((err) => {
                console.info(TAG + 'delete with wrong conditions')
                done();
                console.info(TAG + '************* testRdbStoreDelete0004 end *************');
            })
        }
    })

    /**
     * @tc.name testRdbStoreDelete0005
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteJsAPITest_0500
     * @tc.desc RelationalStore delete test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testRdbStoreDelete0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0005 start *************');
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        {
            let predicates = await new data_Rdb.RdbPredicates('test')
            predicates.equalTo('name', 'lisi')
            rdbStore.delete(predicates).then(async (ret) => {
                expect(2).assertEqual(ret)
                console.info(TAG + 'Delete done: ' + ret)
                
                done()
                console.info(TAG + '************* testRdbStoreDelete0005 end *************');
            }).catch((err) => {
                expect(null).assertFail()
            })
        }
    })

    /**
     * @tc.name testRdbStoreDelete0006
     * @tc.number SUB_DistributedData_RelationalStore_SDK_DeleteJsAPITest_0600
     * @tc.desc RelationalStore delete test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it('testRdbStoreDelete0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + '************* testRdbStoreDelete0006 start *************');
        let errInfo = undefined;
        let u8 = new Uint8Array([1, 2, 3])
        {
            const valueBucket = {
                'name': 'zhangsan',
                'age': 18,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 28,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        {
            const valueBucket = {
                'name': 'lisi',
                'age': 38,
                'salary': 100.5,
                'blobType': u8,
            }
            await rdbStore.insert('test', valueBucket)
        }
        //删除
        try{
            let predicates = await new data_Rdb.RdbPredicates('')
            rdbStore.delete(predicates).then(async (ret) => {
                console.info(TAG + 'delete done: ' + ret)
                expect(null).assertFail()
            }).catch((err) => {
                console.info(TAG + 'delete with null')
            })
        }catch(err){
            errInfo = err
        }
        expect(errInfo.code).assertEqual("401")
        done()
        console.info(TAG + '************* testRdbStoreDelete0006 end *************');
    })

    console.info(TAG + '*************Unit Test End*************');
})}
