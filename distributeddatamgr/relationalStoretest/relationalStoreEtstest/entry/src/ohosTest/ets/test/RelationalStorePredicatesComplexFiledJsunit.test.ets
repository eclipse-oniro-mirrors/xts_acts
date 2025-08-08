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

let context: common.UIAbilityContext;
const TAG = "[RelationalStore_JSKITS_TEST]"
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT, " + "age INTEGER, " + "salary REAL, " + "adddate DATE)";
const STORE_CONFIG = {
    name: "PredicatesComplexFiledJsunit.db",
    securityLevel: data_Rdb.SecurityLevel.S1
}
var rdbStore = undefined;
export default function relationalStorePredicatesComplexFiledTest(){
describe('relationalStorePredicatesComplexFiledTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll')
        context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
        rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await generateTable();
    })

    beforeEach(async function () {
        console.info(TAG + 'beforeEach')
    })

    afterEach(function () {
        console.info(TAG + 'afterEach')
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll')
        rdbStore = null
        await data_Rdb.deleteRdbStore(context, "PredicatesComplexFiledJsunit.db");
    })

    async function generateTable() {
        console.info(TAG + 'generateTable')
        await rdbStore.executeSql(CREATE_TABLE_TEST);
        const valueBucket1 = { id: 1, name: "ZhangSan", age: 20, salary: 100.51, adddate: '2022-09-01' }
        await rdbStore.insert("test", valueBucket1)
        const valueBucket2 = { id: 2, name: "LiSi", age: 21, salary: 120.61, adddate: '2022-09-01' }
        await rdbStore.insert("test", valueBucket2)
        const valueBucket3 = { id: 3, name: "WangWu", age: 22, salary: 130.71, adddate: '2022-09-02' }
        await rdbStore.insert("test", valueBucket3)
        const valueBucket4 = { id: 4, name: "SunLiu", age: 23, salary: 160.81, adddate: '2022-09-02' }
        await rdbStore.insert("test", valueBucket4)
        const valueBucket5 = { id: 5, name: "MaQi", age: 24, salary: 170.91, adddate: '2022-09-02' }
        await rdbStore.insert("test", valueBucket5)
        console.info(TAG + 'generateTable end')
    }

    /**
     * @tc.name RelationalStorePredicatesComplexFiled0001
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1250
     * @tc.desc resultSet Update test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RelationalStorePredicatesComplexFiled0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.log(TAG + "************* RelationalStorePredicatesComplexFiled0001 start *************");

        let predicates = await new data_Rdb.RdbPredicates("test")
        predicates.groupBy(["DATE(test.adddate)"]).orderByAsc("COUNT(*)")
        let resultSet = await rdbStore.query(predicates, ["COUNT(*) AS 'num Count'", "DATE(test.adddate) as birthday"])
        expect(true).assertEqual(resultSet.goToFirstRow())
        let count = await resultSet.getLong(resultSet.getColumnIndex("num Count"))
        let birthday = await resultSet.getString(resultSet.getColumnIndex("birthday"))
        expect(2).assertEqual(count);
        await expect("2022-09-01").assertEqual(birthday)
        expect(true).assertEqual(resultSet.goToNextRow())
        count = await resultSet.getLong(resultSet.getColumnIndex("num Count"))
        birthday = await resultSet.getString(resultSet.getColumnIndex("birthday"))
        expect(3).assertEqual(count);
        await expect("2022-09-02").assertEqual(birthday)
        expect(false).assertEqual(resultSet.goToNextRow())
        done();
        console.log(TAG + "************* RelationalStorePredicatesComplexFiled0001 end   *************");
    })

    /**
     * @tc.name RelationalStorePredicatesComplexFiled0002
     * @tc.number SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1260
     * @tc.desc resultSet Update test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('RelationalStorePredicatesComplexFiled0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.log(TAG + "************* RelationalStorePredicatesComplexFiled0002 start *************");

        let predicates = await new data_Rdb.RdbPredicates("test")
        predicates.groupBy(["DATE(test.adddate)"]).orderByDesc("COUNT(*)")
        let resultSet = await rdbStore.query(predicates, ["COUNT(*) AS numCount", "DATE(test.adddate) as birthday"])
        expect(true).assertEqual(resultSet.goToFirstRow())
        let count = await resultSet.getLong(resultSet.getColumnIndex("numCount"))
        let birthday = await resultSet.getString(resultSet.getColumnIndex("birthday"))
        expect(3).assertEqual(count);
        await expect("2022-09-02").assertEqual(birthday)
        expect(true).assertEqual(resultSet.goToNextRow())
        count = await resultSet.getLong(resultSet.getColumnIndex("numCount"))
        birthday = await resultSet.getString(resultSet.getColumnIndex("birthday"))
        expect(2).assertEqual(count);
        await expect("2022-09-01").assertEqual(birthday)
        expect(false).assertEqual(resultSet.goToNextRow())
        done();
        console.log(TAG + "************* RelationalStorePredicatesComplexFiled0002 end   *************");
    })

    console.log(TAG + "*************Unit Test End*************");
})
}