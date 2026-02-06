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
const USER_TABLE = "CREATE TABLE IF NOT EXISTS user "
    + "(userId INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT , lastName TEXT ,"
    + "age INTEGER , balance REAL  NOT NULL)";

const BOOK_TABLE = "CREATE TABLE IF NOT EXISTS Book (id INTEGER PRIMARY KEY AUTOINCREMENT,"
    + "name TEXT, userId INTEGER , "
    + "FOREIGN KEY (userId) REFERENCES user (userId) ON UPDATE NO ACTION ON DELETE CASCADE)";

const USER_BULK_INSERT_STATEMENT = "INSERT INTO user"
    + "(userId, firstName, lastName, age, balance) VALUES "
    + "(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?)";

const BOOK_BULK_INSERT_STATEMENT = "INSERT INTO Book (id, name, userId) "
    + "VALUES (?,?,?),(?,?,?),(?,?,?)";

const STORE_CONFIG = {
    name: "RdbJoinTest.db",
    securityLevel: data_Rdb.SecurityLevel.S1
}

const TAG = 'RelationalStore_TEST';

let rdbStore = undefined;

export default function relationalStorePredicatesJoinTest() {
describe('relationalStorePredicatesJoinTest', function () {
    beforeAll(async function () {
        console.info(TAG + 'beforeAll end')
        context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
    })

    beforeEach(async function () {
        console.info(TAG + 'beforeEach')
        rdbStore = await data_Rdb.getRdbStore(context, STORE_CONFIG);
        await generateUserTable();
        await generateBookTable();
        console.info(TAG + 'beforeEach end')
    })

    afterEach(async function () {
        console.info(TAG + 'afterEach')
        await data_Rdb.deleteRdbStore(context, "RdbJoinTest.db");
        rdbStore = null
        console.info(TAG + 'afterEach end')
    })

    afterAll(async function () {
        console.info(TAG + 'afterAll end')
    })

    async function generateUserTable() {
        console.info(TAG + 'generateUserTable')
        await rdbStore.executeSql(USER_TABLE);

        const users = [
            {userId:1, firstName:"Zhang", lastName:"San", age:29, balance:100.51},
            {userId:2, firstName:"Li", lastName:"Si", age:30, balance:200.51},
            {userId:3, firstName:"wang", lastName:"wu", age:30, balance:300.51},
            {userId:4, firstName:"sun", lastName:"liu", age:30, balance:400.51},
            {userId:5, firstName:"ma", lastName:"qi", age:32, balance:500.51},
        ];

        let objects = new Array();
        users.forEach((user) => {
            objects.push(user.userId);
            objects.push(user.firstName);
            objects.push(user.lastName);
            objects.push(user.age);
            objects.push(user.balance);
        });

        await rdbStore.executeSql(USER_BULK_INSERT_STATEMENT, objects);
        console.info(TAG + 'generateUserTable end')
    }

    async function generateBookTable() {
        console.info(TAG + 'generateBookTable')
        await rdbStore.executeSql(BOOK_TABLE);

        let books = [
            {id:1, name:"sanguo", userId:1},
            {id:2, name:"xiyouji", userId:2},
            {id:3, name:"shuihuchuan", userId:3},
        ]

        let objects = new Array();
        books.forEach(book => {
            objects.push(book.id);
            objects.push(book.name);
            objects.push(book.userId);
        });

        await rdbStore.executeSql(BOOK_BULK_INSERT_STATEMENT, objects);
        console.info(TAG + 'generateBookTable end')
    }

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name: testRdbJoin001
     * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesJsEtsTest_1270
     * @tc.desc: sql query inner join test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "testRdbJoin001 begin.");
        let resultSet = await rdbStore.querySql(
            "SELECT * FROM user INNER JOIN Book ON user.userId = Book.id WHERE Book.name = 'sanguo'")

        expect(1).assertEqual(resultSet.rowCount);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(1).assertEqual(resultSet.getInt(0));
        expect("Zhang").assertEqual(resultSet.getString(1));
        expect("San").assertEqual(resultSet.getString(2));
        expect(29).assertEqual(resultSet.getInt(3));
        expect(100.51).assertEqual(resultSet.getDouble(4));
        expect(1).assertEqual(resultSet.getInt(5));
        expect("sanguo").assertEqual(resultSet.getString(6));
        expect(1).assertEqual(resultSet.getInt(7));
        done();
    })

    /**
     * @tc.name: testRdbJoin002
     * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1280
     * @tc.desc: sql query cross join test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbJoin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "testRdbJoin002 begin.");
        let resultSet = await rdbStore.querySql("" +
            "SELECT * FROM user  CROSS JOIN Book USING(userId) WHERE Book.name = 'sanguo'");

        expect(1).assertEqual(resultSet.rowCount);

        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(1).assertEqual(resultSet.getInt(0));
        expect("Zhang").assertEqual(resultSet.getString(1));
        expect("San").assertEqual(resultSet.getString(2));
        expect(29).assertEqual(resultSet.getInt(3));
        expect(100.51).assertEqual(resultSet.getDouble(4));
        expect(1).assertEqual(resultSet.getInt(5));
        expect("sanguo").assertEqual(resultSet.getString(6));
        done();

        done();
    })

    /**
     * @tc.name: testRdbJoin003
     * @tc.number: SUB_DistributedData_RelationalStore_SDK_PredicatesEtsAPITest_1290
     * @tc.desc: sql query left outer join test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRdbJoin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
        console.info(TAG + "testRdbJoin003 begin.");
        let resultSet = await rdbStore.querySql("" +
            "SELECT * FROM user LEFT OUTER JOIN Book USING(userId) WHERE Book.name = 'sanguo'");

        expect(1).assertEqual(resultSet.rowCount);

        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(1).assertEqual(resultSet.getInt(0));
        expect("Zhang").assertEqual(resultSet.getString(1));
        expect("San").assertEqual(resultSet.getString(2));
        expect(29).assertEqual(resultSet.getInt(3));
        expect(100.51).assertEqual(resultSet.getDouble(4));
        expect(1).assertEqual(resultSet.getInt(5));
        expect("sanguo").assertEqual(resultSet.getString(6));
        done();
    })

    console.info(TAG + "*************Unit Test End*************");
})}
