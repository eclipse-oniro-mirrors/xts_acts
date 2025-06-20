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
import data_relationalStore from '@ohos.data.relationalStore';
import data_dataSharePredicates from '@ohos.data.dataSharePredicates';
import common from "@ohos.app.ability.common";
import { ValuesBucket } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';


const TAG = '[ttt]'
const CREATE_TABLE_ALL_DATA_TYPE_SQL = "CREATE TABLE IF NOT EXISTS test "
    + "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
    + "name TEXT NOT NULL  , age INTEGER , salary REAL , blobType BLOB ) ;";

const STORE_CONFIG: data_relationalStore.StoreConfig = {
    name: "DataSharePredicates.db",
    securityLevel: data_relationalStore.SecurityLevel.S1,
}
let rdbStore: data_relationalStore.RdbStore | undefined = undefined;
let context: common.UIAbilityContext;

export default function dataSharePredicatesTest() {
describe('dataSharePredicatesTest', () => {
    beforeAll(async () => {
        console.info(TAG + 'beforeAll')
        context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
        rdbStore = await data_relationalStore.getRdbStore(context,STORE_CONFIG);
        await  rdbStore!.executeSql(CREATE_TABLE_ALL_DATA_TYPE_SQL);
        let u8 = new Uint8Array([4, 5, 6]);
        let valueBucket: ValuesBucket = {
            "name": "zhangSan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        await rdbStore?.insert("test",valueBucket);
    })

    beforeEach(() => {
        console.info(TAG + 'beforeEach')
    })

    afterEach(() => {
        console.info(TAG + 'afterEach')
    })

    afterAll(async () => {
        console.info(TAG + 'afterAll')
        rdbStore = undefined
        await data_relationalStore.deleteRdbStore(context, STORE_CONFIG);
    })

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name       : testOrderByAsc0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0010
     * @tc.desc       : predicates orderByAsc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOrderByAsc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let u8 = new Uint8Array([4, 5, 6]);
        let valueBucket: ValuesBucket = {
            "name": "zhangSan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name","zhangSan");
        predicates.orderByAsc("id");
        try{
            await rdbStore!.update("test",valueBucket,predicates).then((ret:Number)=>{
                expect(1).assertEqual(ret);
            }).catch((err:BusinessError) => {
                expect().assertFail()
                console.info(TAG + "update fail err.code is " + err.code + "err.message is " +err.message)
            })
        }catch (e) {
            expect("202").assertEqual(e.code)
            console.info(TAG + "update fail err.code is " + e.code + "err.message is " +e.message)
        }
    })

    /**
     * @tc.name       : testOrderByDesc0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0020
     * @tc.desc       : predicates orderByDesc normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOrderByDesc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let u8 = new Uint8Array([4, 5, 6]);
        let valueBucket: ValuesBucket = {
            "name": "zhangSan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name","zhangSan");
        predicates.orderByDesc("id");
        try{
            await rdbStore!.update("test",valueBucket,predicates).then((ret:Number)=>{
                expect(1).assertEqual(ret);
            }).catch((err:BusinessError) => {
                expect().assertFail()
                console.info(TAG + "update fail err.code is " + err.code + "err.message is " +err.message)
            })
        }catch (e) {
            expect("202").assertEqual(e.code)
            console.info(TAG + "update fail err.code is " + e.code + "err.message is " +e.message)
        }
    })


    /**
     * @tc.name       : testAnd0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0030
     * @tc.desc       : predicates and normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let u8 = new Uint8Array([4, 5, 6]);
        let valueBucket: ValuesBucket = {
            "name": "zhangSan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name","zhangSan");
        predicates.and();
        predicates.equalTo("age",18);
        try{
            await rdbStore!.update("test",valueBucket,predicates).then((ret:Number)=>{
                expect(1).assertEqual(ret);
            }).catch((err:BusinessError) => {
                expect().assertFail()
                console.info(TAG + "update fail err.code is " + err.code + "err.message is " +err.message)
            })
        }catch (e) {
            expect("202").assertEqual(e.code)
            console.info(TAG + "update fail err.code is " + e.code + "err.message is " +e.message)
        }
    })

    /**
     * @tc.name       : testIn0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0040
     * @tc.desc       : predicates in normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let u8 = new Uint8Array([4, 5, 6]);
        let valueBucket: ValuesBucket = {
            "name": "zhangSan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.in("age",[18,19]);
        try{
            await rdbStore!.update("test",valueBucket,predicates).then((ret:Number)=>{
                expect(1).assertEqual(ret);
            }).catch((err:BusinessError) => {
                expect().assertFail()
                console.info(TAG + "update fail err.code is " + err.code + "err.message is " +err.message)
            })
        }catch (e) {
            expect("202").assertEqual(e.code)
            console.info(TAG + "update fail err.code is " + e.code + "err.message is " +e.message)
        }
    })


    /**
     * @tc.name       : testLimit0001
     * @tc.number     : SUB_DistributedData_DataShare_SDK_DataSharePredicatesAPITest_0050
     * @tc.desc       : predicates limit normal test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testLimit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        let u8 = new Uint8Array([4, 5, 6]);
        let valueBucket: ValuesBucket = {
            "name": "zhangSan",
            "age": 18,
            "salary": 100.5,
            "blobType": u8,
        }
        let predicates = new data_dataSharePredicates.DataSharePredicates();
        predicates.equalTo("name", "zhangSan").limit(10, 3);
        try{
            await rdbStore!.update("test",valueBucket,predicates).then((ret:Number)=>{
                expect(1).assertEqual(ret);
            }).catch((err:BusinessError) => {
                expect().assertFail()
                console.info(TAG + "update fail err.code is " + err.code + "err.message is " +err.message)
            })
        }catch (e) {
            expect("202").assertEqual(e.code)
            console.info(TAG + "update fail err.code is " + e.code + "err.message is " +e.message)
        }
    })

    console.info(TAG + "*************Unit Test End*************");
})
}
