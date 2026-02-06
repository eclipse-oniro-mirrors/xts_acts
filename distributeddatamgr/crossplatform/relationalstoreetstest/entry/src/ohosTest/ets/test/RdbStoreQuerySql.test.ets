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
import relationalStore from "@ohos.data.relationalStore";
import { ValueType } from '@ohos.data.ValuesBucket';
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const USER_TABLE = "CREATE TABLE IF NOT EXISTS user " + "(userId INTEGER PRIMARY KEY AUTOINCREMENT, firstName TEXT , lastName TEXT ," + "age INTEGER , balance REAL  NOT NULL)";

const BOOK_TABLE = "CREATE TABLE IF NOT EXISTS Book (id INTEGER PRIMARY KEY AUTOINCREMENT," + "name TEXT, userId INTEGER , " + "FOREIGN KEY (userId) REFERENCES user (userId) ON UPDATE NO ACTION ON DELETE CASCADE)";

const USER_BULK_INSERT_STATEMENT = "INSERT INTO user" + "(userId, firstName, lastName, age, balance) VALUES " + "(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?),(?,?,?,?,?)";

const BOOK_BULK_INSERT_STATEMENT = "INSERT INTO Book (id, name, userId) " + "VALUES (?,?,?),(?,?,?),(?,?,?)";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "QuerySqlTest.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};

const CURRENT_STORE_VERSION = 1;

const TAG = "RDB_TEST";

let rdbStore = undefined;

async function generateUserTable() {
  console.info(TAG + "generateUserTable");
  await rdbStore.executeSql(USER_TABLE);

  const users: Array<ESObject> = [
    {
      userId: 1,
      firstName: "Zhang",
      lastName: "San",
      age: 29,
      balance: 100.51
    },
    {
      userId: 2,
      firstName: "Li",
      lastName: "Si",
      age: 30,
      balance: 200.51
    },
    {
      userId: 3,
      firstName: "wang",
      lastName: "wu",
      age: 30,
      balance: 300.51
    },
    {
      userId: 4,
      firstName: "sun",
      lastName: "liu",
      age: 30,
      balance: 400.51
    },
    {
      userId: 5,
      firstName: "ma",
      lastName: "qi",
      age: 32,
      balance: 500.51
    },
  ];

  let objects = new Array<ValueType>();
  users.forEach((user: ESObject) => {
    objects.push(user.userId);
    objects.push(user.firstName);
    objects.push(user.lastName);
    objects.push(user.age);
    objects.push(user.balance);
  });

  await rdbStore.executeSql(USER_BULK_INSERT_STATEMENT, objects);
  console.info(TAG + "generateUserTable end");
}

async function generateBookTable() {
  console.info(TAG + "generateBookTable");
  await rdbStore.executeSql(BOOK_TABLE);

  let books: Array<ESObject> = [
    {
      id: 1, name: "sanguo", userId: 1
    },
    {
      id: 2, name: "xiyouji", userId: 2
    },
    {
      id: 3, name: "shuihuchuan", userId: 3
    },
  ];

  let objects = new Array<ValueType>();
  books.forEach((book: ESObject) => {
    objects.push(book.id);
    objects.push(book.name);
    objects.push(book.userId);
  });

  await rdbStore.executeSql(BOOK_BULK_INSERT_STATEMENT, objects);
  console.info(TAG + "generateBookTable end");
}

export default function rdbStoreQuerySqlTest() {
  describe("rdbStoreQuerySqlTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async () => {
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await generateUserTable();
      await generateBookTable();
    });

    afterEach(async () => {
      console.info(TAG + "afterEach");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "QuerySqlTest.db");
    });

    afterAll(async () => {
      console.info(TAG + "afterAll");
    });

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.name   testRdbStoreQuerySql001
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0970
     * @tc.desc   RdbStore querySql callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreQuerySql001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "testRdbStoreQuerySql001 begin.");
      rdbStore.querySql("SELECT * FROM user INNER JOIN Book ON user.userId = Book.id WHERE Book.name = 'sanguo'", async (err, resultSet) => {
        if (err) {
          console.error(`Query failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        }
        console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(1).assertEqual(resultSet.rowCount);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(1).assertEqual(resultSet.getLong(0));
        expect("Zhang").assertEqual(resultSet.getString(1));
        expect("San").assertEqual(resultSet.getString(2));
        expect(29).assertEqual(resultSet.getLong(3));
        expect(100.51).assertEqual(resultSet.getDouble(4));
        expect(1).assertEqual(resultSet.getLong(5));
        expect("sanguo").assertEqual(resultSet.getString(6));
        expect(1).assertEqual(resultSet.getLong(7));
        resultSet.close();
        done();
      });
      console.info(TAG + "testRdbStoreQuerySql001 end.");
    });

    /**
     * @tc.name   testRdbStoreQuerySql002
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1010
     * @tc.desc   RdbStore querySql callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreQuerySql002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "testRdbStoreQuerySql002 begin.");
      rdbStore.querySql("SELECT * FROM user INNER JOIN Book ON user.userId = Book.id WHERE Book.name = ?", ["sanguo"], async (err, resultSet) => {
        if (err) {
          console.error(`Query failed, code is ${err.code},message is ${err.message}`);
          expect(!err).assertTrue();
          done();
        }
        console.info(`ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
        expect(1).assertEqual(resultSet.rowCount);
        expect(true).assertEqual(resultSet.goToFirstRow());
        expect(1).assertEqual(resultSet.getLong(0));
        expect("Zhang").assertEqual(resultSet.getString(1));
        expect("San").assertEqual(resultSet.getString(2));
        expect(29).assertEqual(resultSet.getLong(3));
        expect(100.51).assertEqual(resultSet.getDouble(4));
        expect(1).assertEqual(resultSet.getLong(5));
        expect("sanguo").assertEqual(resultSet.getString(6));
        expect(1).assertEqual(resultSet.getLong(7));
        resultSet.close();
        done();
      });
      console.info(TAG + "testRdbStoreQuerySql002 end.");
    });

    /**
     * @tc.name   testRdbStoreQuerySql003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0980   8
     * @tc.desc   RdbStore querySql promise test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreQuerySql003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "testRdbStoreQuerySql003 begin.");
      let resultSet = await rdbStore.querySql("SELECT * FROM user INNER JOIN Book ON user.userId = Book.id WHERE Book.name = 'sanguo'");
      expect(1).assertEqual(resultSet.rowCount);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(1).assertEqual(resultSet.getLong(0));
      expect("Zhang").assertEqual(resultSet.getString(1));
      expect("San").assertEqual(resultSet.getString(2));
      expect(29).assertEqual(resultSet.getLong(3));
      expect(100.51).assertEqual(resultSet.getDouble(4));
      expect(1).assertEqual(resultSet.getLong(5));
      expect("sanguo").assertEqual(resultSet.getString(6));
      expect(1).assertEqual(resultSet.getLong(7));
      resultSet.close();
      done();
      console.info(TAG + "testRdbStoreQuerySql003 end.");
    });
    /**
     * @tc.name   testRdbStoreQuerySql004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1020
     * @tc.desc   RdbStore querySql promise test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreQuerySql004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "testRdbStoreQuerySql004 begin.");
      let resultSet = await rdbStore.querySql("SELECT * FROM user INNER JOIN Book ON user.userId = Book.id WHERE Book.name = ?", ["sanguo"]);
      expect(1).assertEqual(resultSet.rowCount);
      expect(true).assertEqual(resultSet.goToFirstRow());
      expect(1).assertEqual(resultSet.getLong(0));
      expect("Zhang").assertEqual(resultSet.getString(1));
      expect("San").assertEqual(resultSet.getString(2));
      expect(29).assertEqual(resultSet.getLong(3));
      expect(100.51).assertEqual(resultSet.getDouble(4));
      expect(1).assertEqual(resultSet.getLong(5));
      expect("sanguo").assertEqual(resultSet.getString(6));
      expect(1).assertEqual(resultSet.getLong(7));
      resultSet.close();
      done();
      console.info(TAG + "testRdbStoreQuerySql004 end.");
    });

    /**
     * @tc.name   testRdbStoreQuerySql005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0990
     * @tc.desc   RdbStore querySql callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreQuerySql005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + " testRdbStoreQuerySql005 begin.");
      try {
        rdbStore.querySql("SELECT * FROM user INNER JOIN Book ON user.userId = Book.id WHERE Book.name = 'hongloumeng'", async (err, resultSet) => {
          if (err) {
            console.error(`testRdbStoreQuerySql005 :Query failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertFail();
            done();
          }
          console.info(`testRdbStoreQuerySql005 :ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
          expect(0).assertEqual(resultSet.rowCount);
          resultSet.close();
          done();
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info("testRdbStoreQuerySql005 :update error " + e);
        expect(!e).assertFail();
        done();
      }
      console.info(TAG + " testRdbStoreQuerySql005 end.");
    });

    /**
     * @tc.name   testRdbStoreQuerySql006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_1000
     * @tc.desc   RdbStore querySql callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreQuerySql006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + " testRdbStoreQuerySql006 begin.");
      try {
        rdbStore.querySql("SELECT * FROM user INNER JOIN Book ON user.userId = Book.id WHERE Book.name = 'maoxuan'", async (err, resultSet) => {
          if (err) {
            console.error(TAG + `testRdbStoreQuerySql006 Query failed, code is ${err.code},message is ${err.message}`);
            expect(!err).assertFail();
            done();
          }
          try {
            console.info(TAG + `testRdbStoreQuerySql006 ResultSet column names: ${resultSet.columnNames}, column count: ${resultSet.columnCount}`);
            expect(0).assertEqual(resultSet.rowCount);
            resultSet.close();
            done();
          } catch (e) {
            console.info(TAG + "testRdbStoreQuerySql006 resultSet error" + e);
            expect(!e).assertFail();
          }
        });
        expect(rdbStore !== null).assertTrue();
      } catch (e) {
        console.info(TAG + "testRdbStoreQuerySql006 querySql error " + e);
        expect(!e).assertFail();
      }
      console.info(TAG + " testRdbStoreQuerySql006 end.");
    })
  });
}
