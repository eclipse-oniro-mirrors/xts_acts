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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import relationalStore from "@ohos.data.relationalStore";
import { ValuesBucket } from '@ohos.data.ValuesBucket';
import common from "@ohos.app.ability.common";

let context: common.UIAbilityContext;
const TAG = "[RDB_JSKITS _TEST]";
const CREATE_TABLE_ALL_DATA_TYPE_SQL =
  "CREATE TABLE IF NOT EXISTS AllDataType " +
    "(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL , " +
    "integerValue INTEGER NOT NULL , longValue INTEGER NOT NULL , shortValue INTEGER NOT NULL , " +
    "booleanValue INTEGER DEFAULT 0 , doubleValue REAL NOT NULL , floatValue REAL NOT NULL, " +
    "stringValue CHAR(50) DEFAULT NULL , blobValue BLOB , clobValue TEXT DEFAULT NULL , byteValue INTEGER DEFAULT 0 , " +
    "dateValue INTEGER DEFAULT 0 , timeValue INTEGER DEFAULT 0 , timestampValue INTEGER DEFAULT 0 , " +
    "calendarValue INTEGER DEFAULT 0 , characterValue TEXT DEFAULT NULL , primIntValue INTEGER DEFAULT 0 , " +
    "primLongValue INTEGER DEFAULT NULL , primShortValue INTEGER DEFAULT 0 , primFloatValue REAL DEFAULT 0 , " +
    "primDoubleValue REAL DEFAULT 0 , primBooleanValue INTEGER DEFAULT 0 , primByteValue INTEGER DEFAULT 0 , " +
    "primCharValue CHAR(50) DEFAULT NULL , `order` INTEGER DEFAULT 0 );";

const STORE_CONFIG: relationalStore.StoreConfig = {
  name: "Predicates.db",
  securityLevel: relationalStore.SecurityLevel.S1,
};
let rdbStore = undefined;
let DOUBLE_MAX = 9223372036854775807;

async function buildAllDataType1() {
  console.info(TAG + "buildAllDataType1 start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: ValuesBucket = {
      integerValue: 2147483647,
      doubleValue: DOUBLE_MAX,
      booleanValue: true,
      floatValue: -0.123,
      longValue: 9223372036854775807,
      shortValue: 32767,
      characterValue: " ",
      stringValue: "ABCDEFGHIJKLMN",
      blobValue: u8,
      byteValue: 127,
    };
    await rdbStore.insert("AllDataType", valueBucket);
  }
}

async function buildAllDataType2() {
  console.info(TAG + "buildAllDataType2 start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: ValuesBucket = {
      integerValue: 1,
      doubleValue: 1.0,
      booleanValue: false,
      floatValue: 1.0,
      longValue: 1,
      shortValue: 1,
      characterValue: "中",
      stringValue: "ABCDEFGHIJKLMN",
      blobValue: u8,
      byteValue: 1,
    };
    await rdbStore.insert("AllDataType", valueBucket);
  }
}

async function buildAllDataType3() {
  console.info(TAG + "buildAllDataType3 start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: ValuesBucket = {
      integerValue: -2147483648,
      doubleValue: Number.MIN_VALUE,
      booleanValue: false,
      floatValue: 0.1234567,
      longValue: -9223372036854775808,
      shortValue: -32768,
      characterValue: "#",
      stringValue: "ABCDEFGHIJKLMN",
      blobValue: u8,
      byteValue: -128,
    };
    await rdbStore.insert("AllDataType", valueBucket);
  }
}

export default function rdbPredicatesTest() {
  describe("rdbPredicatesTest", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async () => {
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_ALL_DATA_TYPE_SQL, null);
      await buildAllDataType1();
      await buildAllDataType2();
      await buildAllDataType3();
    });

    afterEach(async () => {
      console.info(TAG + "afterEach");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, "Predicates.db");
    });

    afterAll(async () => {
      console.info(TAG + "afterAll");
    });

    console.info(TAG + "*************Unit Test Begin*************");

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2800
     * @tc.name   : testRdbPredicatesConstructor001
     * @tc.desc   : Test the constructor method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesConstructor001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesConstructor001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesConstructor001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2770
     * @tc.name   : testRdbPredicatesConstructor002
     * @tc.desc   : Test the constructor() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesConstructor002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesConstructor002 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesConstructor002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2780
     * @tc.name   : testRdbPredicatesConstructor003
     * @tc.desc   : Test the constructor() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesConstructor003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesConstructor003 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates(null);
        let result = await rdbStore.query(predicates);
        result.close();
        expect(result.rowCount >= 0).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesConstructor003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2790
     * @tc.name   : testRdbPredicatesConstructor004
     * @tc.desc   : Test the constructor() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesConstructor004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesConstructor004 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates(undefined);
        let result = await rdbStore.query(predicates);
        result.close();
        expect(result.rowCount >= 0).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesConstructor004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1040
     * @tc.name   : testRdbPredicatesEqualTo001
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("booleanValue", true);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo001 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1010
     * @tc.name   : testRdbPredicatesEqualTo002
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("byteValue", -128).or().equalTo("byteValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo002 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1030
     * @tc.name   : testRdbPredicatesEqualTo003
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo003 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1020
     * @tc.name   : testRdbPredicatesEqualTo004
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("doubleValue", DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo004 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1140
     * @tc.name   : testRdbPredicatesEqualTo005
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("shortValue", -32768.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo005 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1050
     * @tc.name   : testRdbPredicatesEqualTo006
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(2).assertEqual(result.getLong(0));
        result.close();
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo006 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1150
     * @tc.name   : testRdbPredicatesEqualTo007
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(2).assertEqual(result.getLong(0));
        result.close();
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo007 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1060
     * @tc.name   : testRdbPredicatesEqualTo008
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("floatValue", -0.123);
        let result = await rdbStore.query(predicates);
        expect(true).assertEqual(result.goToFirstRow());
        expect(1).assertEqual(result.getLong(0));
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo008 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1120
     * @tc.name   : testRdbPredicatesEqualTo009
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo009 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.equalTo(null, null);
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo009 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1130
     * @tc.name   : testRdbPredicatesEqualTo010
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo010 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.equalTo(undefined, undefined);
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo010 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1090
     * @tc.name   : testRdbPredicatesEqualTo011
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo011 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo('1', 1);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo011 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1080
     * @tc.name   : testRdbPredicatesEqualTo012
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo012", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo012 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo('floatValue', '-0.123');
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        expect(true).assertEqual(result.goToFirstRow());
        expect(1).assertEqual(result.getLong(0));
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo012 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1070
     * @tc.name   : testRdbPredicatesEqualTo013
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo013", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo013 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo('floatValue', 'ss');
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo013 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1110
     * @tc.name   : testRdbPredicatesEqualTo015
     * @tc.desc   : Test the equalTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEqualTo015", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo015 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo('ss', 'ss');
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo015 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2520
     * @tc.name   : testRdbPredicatesNotEqualTo001
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("booleanValue", true);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2760
     * @tc.name   : testRdbPredicatesNotEqualTo002
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("byteValue", -128);
        predicates.notEqualTo("byteValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2510
     * @tc.name   : testRdbPredicatesNotEqualTo003
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("stringValue", "ABCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2500
     * @tc.name   : testRdbPredicatesNotEqualTo004
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("doubleValue", DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2570
     * @tc.name   : testRdbPredicatesNotEqualTo005
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("shortValue", -32768);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2530
     * @tc.name   : testRdbPredicatesNotEqualTo006
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2630
     * @tc.name   : testRdbPredicatesNotEqualTo007
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2540
     * @tc.name   : testRdbPredicatesNotEqualTo008
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo("floatValue", -0.123);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2600
     * @tc.name   : testRdbPredicatesNotEqualTo009
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo009 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.notEqualTo(null, null);
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo009 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2610
     * @tc.name   : testRdbPredicatesNotEqualTo010
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo010 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.notEqualTo(undefined, undefined);
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo010 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2580
     * @tc.name   : testRdbPredicatesNotEqualTo011
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo011 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo('1', 1);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo011 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2560
     * @tc.name   : testRdbPredicatesNotEqualTo012
     * @tc.desc   : Test the testRdbPredicatesNotEqualTo012() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo012", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo012 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo('floatValue', '-0.123');
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        expect(true).assertEqual(result.goToFirstRow());
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo012 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2550
     * @tc.name   : testRdbPredicatesNotEqualTo013
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo013", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo013 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo('floatValue', 'ss');
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo013 end   *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2620
     * @tc.name   : testRdbPredicatesNotEqualTo015
     * @tc.desc   : Test the notEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotEqualTo015", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo015 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notEqualTo('ss', 'ss');
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo015 end   *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0460
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap001
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .equalTo("integerValue", 1)
          .or()
          .equalTo("integerValue", 2147483647)
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap001 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0510
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap002
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo("characterValue", " ").endWrap();
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap002 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0470
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap003
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo("characterValue", "中").endWrap();
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1000
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap004
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").equalTo("characterValue", "中").endWrap();
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap004 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0540
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap005
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo("characterValue", "中");
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap005 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0500
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap006
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        try {
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo(null, "中").endWrap();
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0530
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap007
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        try {
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo(undefined, undefined).endWrap();
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap007 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0490
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap008
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        try {
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo('ss', "中").endWrap();
          let result = await rdbStore.query(predicates);
          expect(-1).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap008 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0480
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap009
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap009 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo('floatValue', '-0.123').endWrap();
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap009 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0520
     * @tc.name   : testRdbPredicatesBeginWrapAndEndWrap010
     * @tc.desc   : Test the beginWrap() and endWrap() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginWrapAndEndWrap010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap010 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        try {
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").beginWrap().equalTo('floatValue', "ss").endWrap();
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginWrapAndEndWrap010 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0410
     * @tc.name   : testRdbPredicatesOr001
     * @tc.desc   : Test the or() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOr001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOr001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .equalTo("integerValue", 1)
          .or()
          .equalTo("integerValue", 2147483647)
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOr001 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0430
     * @tc.name   : testRdbPredicatesOr002
     * @tc.desc   : Test the or() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOr002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOr002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .equalTo("integerValue", '1')
          .or()
          .equalTo("integerValue", '2147483647')
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOr002 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0400
     * @tc.name   : testRdbPredicatesOr003
     * @tc.desc   : Test the or() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOr003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOr003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .equalTo("integerValue", '1')
          .or()
          .equalTo("integerValue", 'ss')
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOr003 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0420
     * @tc.name   : testRdbPredicatesOr004
     * @tc.desc   : Test the or() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOr004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOr004 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
            .beginWrap()
            .equalTo(null, '1')
            .or()
            .equalTo("integerValue", '2147483647')
            .endWrap();
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOr004 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0450
     * @tc.name   : testRdbPredicatesOr005
     * @tc.desc   : Test the or() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOr005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOr005 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
            .beginWrap()
            .equalTo(undefined, undefined)
            .or()
            .equalTo("integerValue", '2147483647')
            .endWrap();
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOr005 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0440
     * @tc.name   : testRdbPredicatesOr006
     * @tc.desc   : Test the or() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOr006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOr006 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
            .beginWrap()
            .equalTo('ss', 'ss')
            .or()
            .equalTo("integerValue", '2147483647')
            .endWrap();
          let result = await rdbStore.query(predicates);
          expect(-1).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOr006 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0240
     * @tc.name   : testRdbPredicatesAnd001
     * @tc.desc   : Test the and() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesAnd001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesAnd001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").and().equalTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesAnd001 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0360
     * @tc.name   : testRdbPredicatesAnd002
     * @tc.desc   : Test the or() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesAnd002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesAnd002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .and()
          .equalTo("integerValue", '1')
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesAnd002 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0390
     * @tc.name   : testRdbPredicatesAnd003
     * @tc.desc   : Test the and() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesAnd003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesAnd003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .and()
          .equalTo("integerValue", 'ss')
          .endWrap();
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesAnd003 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0380
     * @tc.name   : testRdbPredicatesAnd004
     * @tc.desc   : Test the and() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesAnd004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesAnd004 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
            .beginWrap()
            .equalTo(null, '1')
            .and()
            .equalTo("integerValue", '2147483647')
            .endWrap();
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesAnd004 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0230
     * @tc.name   : testRdbPredicatesAnd005
     * @tc.desc   : Test the and() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesAnd005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesAnd005 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
            .beginWrap()
            .equalTo(undefined, undefined)
            .and()
            .equalTo("integerValue", '2147483647')
            .endWrap();
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesAnd005 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0370
     * @tc.name   : testRdbPredicatesAnd006
     * @tc.desc   : Test the and() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesAnd006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesAnd006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates = predicates.equalTo("stringValue", "ABCDEFGHIJKLMN")
          .beginWrap()
          .equalTo('ss', 'ss')
          .and()
          .equalTo("integerValue", '2147483647')
          .endWrap();
        expect(predicates !== null).assertTrue();
      }
      done();
      console.info(TAG + "************* testRdbPredicatesAnd006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0860
     * @tc.name   : testRdbPredicatesContains001
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("stringValue", "DEF");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesContains001 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0780
     * @tc.name   : testRdbPredicatesContains002
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("stringValue", "DEFX");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesContains002 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0790
     * @tc.name   : testRdbPredicatesContains003
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesContains003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0800
     * @tc.name   : testRdbPredicatesContains004
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesContains004 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0830
     * @tc.name   : testRdbPredicatesContains005
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains005 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains("characterValue", "");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesContains005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0810
     * @tc.name   : testRdbPredicatesContains006
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains006 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.contains("characterValue", null);
        expect().assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesContains006 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0820
     * @tc.name   : testRdbPredicatesContains007
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains007 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.contains("characterValue", undefined);
        expect().assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesContains007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0850
     * @tc.name   : testRdbPredicatesContains008
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains008 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.contains('ss', 'ss');
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesContains008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0840
     * @tc.name   : testRdbPredicatesContains009
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains009 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.contains('integerValue', '1');
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;

      done();
      console.info(TAG + "************* testRdbPredicatesContains009 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0870
     * @tc.name   : testRdbPredicatesContains010
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains010 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.contains(null, null);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesContains010 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0880
     * @tc.name   : testRdbPredicatesContains011
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesContains011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesContains011 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.contains(undefined, undefined);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesContains011 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0250
     * @tc.name   : testRdbPredicatesBeginsWith001
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("stringValue", "ABC");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith001 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0260
     * @tc.name   : testRdbPredicatesBeginsWith002
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("stringValue", "ABCX");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith002 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0270
     * @tc.name   : testRdbPredicatesBeginsWith003
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith003 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0280
     * @tc.name   : testRdbPredicatesBeginsWith004
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith004 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0310
     * @tc.name   : testRdbPredicatesBeginsWith005
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith005 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith("characterValue", "");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith005 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0290
     * @tc.name   : testRdbPredicatesBeginsWith006
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith006 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.beginsWith("characterValue", null);
        expect().assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesBeginsWith006 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0300
     * @tc.name   : testRdbPredicatesBeginsWith007
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith007 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.beginsWith("characterValue", undefined);
        expect().assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesBeginsWith007 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0330
     * @tc.name   : testRdbPredicatesBeginsWith008
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith008 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.beginsWith('ss', 'ss');
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith008 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0320
     * @tc.name   : testRdbPredicatesBeginsWith009
     * @tc.desc   : Test the contains() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith009 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.beginsWith('integerValue', '1');
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith009 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0340
     * @tc.name   : testRdbPredicatesBeginsWith010
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith010 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.beginsWith(null, null);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith010 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0350
     * @tc.name   : testRdbPredicatesBeginsWith011
     * @tc.desc   : Test the beginsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBeginsWith011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBeginsWith011 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.beginsWith(undefined, undefined);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBeginsWith011 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0970
     * @tc.name   : testRdbPredicatesEndsWith001
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("stringValue", "LMN");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0890
     * @tc.name   : testRdbPredicatesEndsWith002
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("stringValue", "LMNX");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0900
     * @tc.name   : testRdbPredicatesEndsWith003
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("characterValue", "中");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0910
     * @tc.name   : testRdbPredicatesEndsWith004
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("characterValue", "#");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0940
     * @tc.name   : testRdbPredicatesEndsWith005
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith005 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith("characterValue", "");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0920
     * @tc.name   : testRdbPredicatesEndsWith006
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith006 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.endsWith("characterValue", null);
        expect().assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesEndsWith006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0930
     * @tc.name   : testRdbPredicatesEndsWith007
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith007 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.endsWith("characterValue", undefined);
        expect().assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesEndsWith007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0960
     * @tc.name   : testRdbPredicatesEndsWith008
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith008 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.endsWith('ss', 'ss');
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0950
     * @tc.name   : testRdbPredicatesEndsWith009
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith009 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.endsWith('integerValue', '1');
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith009 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0980
     * @tc.name   : testRdbPredicatesEndsWith010
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith010 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.endsWith(null, null);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith010 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0990
     * @tc.name   : testRdbPredicatesEndsWith011
     * @tc.desc   : Test the endsWith() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesEndsWith011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEndsWith011 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.endsWith(undefined, undefined);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEndsWith011 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1810
     * @tc.name   : testRdbPredicatesIsNull001
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("primLongValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1800
     * @tc.name   : testRdbPredicatesIsNull002
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("longValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1840
     * @tc.name   : testRdbPredicatesIsNull003
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("stringValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1830
     * @tc.name   : testRdbPredicatesIsNull004
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("stringValueX");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1820
     * @tc.name   : testRdbPredicatesIsNull005
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull005 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNull("ss");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1850
     * @tc.name   : testRdbPredicatesIsNull006
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull006 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.isNull("");
        expect(predicates !== null).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
        done();
      }
      console.info(TAG + "************* testRdbPredicatesIsNull006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1780
     * @tc.name   : testRdbPredicatesIsNull007
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull007 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates = predicates.isNull(null);
        expect(predicates !== null).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1790
     * @tc.name   : testRdbPredicatesIsNull008
     * @tc.desc   : Test the isNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNull008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull008 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.isNull(undefined);
        expect(predicates !== null).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1710
     * @tc.name   : testRdbPredicatesIsNotNull001
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("primLongValue");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1700
     * @tc.name   : testRdbPredicatesIsNotNull002
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("longValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1740
     * @tc.name   : testRdbPredicatesIsNotNull003
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("stringValue");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull003 end *************");
    });

    /**
     * @tc.number :  SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1730
     * @tc.name   : testRdbPredicatesIsNotNull004
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("stringValueX");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1720
     * @tc.name   : testRdbPredicatesIsNotNull005
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull005 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.isNotNull("ss");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1750
     * @tc.name   : testRdbPredicatesIsNotNull006
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull006 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.isNotNull("");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1680
     * @tc.name   : testRdbPredicatesIsNotNull007
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull007 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.isNotNull(null);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1690
     * @tc.name   : testRdbPredicatesIsNotNull008
     * @tc.desc   : Test the isNotNull() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIsNotNull008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull008 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.isNotNull(undefined);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2190
     * @tc.name   : testRdbPredicatesLike001
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "%LMN%");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLike001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2200
     * @tc.name   : testRdbPredicatesLike002
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "%LMNX%");
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLike002 end *************");
    });

    /**
     * @tc.number :  SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2210
     * @tc.name   : testRdbPredicatesLike003
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("characterValue", "%中%");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLike003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2220
     * @tc.name   : testRdbPredicatesLike004
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("characterValue", "%#%");
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLike004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2260
     * @tc.name   : testRdbPredicatesLike005
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike005 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("ss", "%#%");
      let result = await rdbStore.query(predicates);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesLike005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2290
     * @tc.name   : testRdbPredicatesLike006
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike006 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.like("", "%#%");
        let result = await rdbStore.query(predicates);
        expect(result !== null).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLike006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2230
     * @tc.name   : testRdbPredicatesLike007
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike007 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like('integerValue', "%1%");
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesLike007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2250
     * @tc.name   : testRdbPredicatesLike008
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike008 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates.like('integerValue', null);
        expect().assertFail();
        done();
      } catch (err) {
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesLike008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2270
     * @tc.name   : testRdbPredicatesLike009
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike009 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates = predicates.like(null, '%%');
        expect(predicates != null).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
        done();
      }
      console.info(TAG + "************* testRdbPredicatesLike009 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2280
     * @tc.name   : testRdbPredicatesLike010
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike010 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        predicates = predicates.like(undefined, '%%');
        expect(predicates != null).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
        done();
      }
      console.info(TAG + "************* testRdbPredicatesLike010 end *************");
    });

    /**
     * @tc.number :  SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2240
     * @tc.name   : testRdbPredicatesLike011
     * @tc.desc   : Test the like() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLike011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike011 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like('integerValue', '%' + Number.MAX_VALUE + 1 + '%');
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesLike011 end *************");
    });


    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1190
     * @tc.name   : testRdbPredicatesGlob001
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * End with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob('stringValue', "ABCDEFGHIJKLM?");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1210
     * @tc.name   : testRdbPredicatesGlob002
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * Begin with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "?BCDEFGHIJKLMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1230
     * @tc.name   : testRdbPredicatesGlob003
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * Begin and end with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testGlob0006", 0, async (done: Function) => {
      console.info(TAG + "************* testGlob0006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "?BCDEFGHIJKLM?");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testGlob0006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1180
     * @tc.name   : testRdbPredicatesGlob004
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * End with * by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "ABC*");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1200
     * @tc.name   : testRdbPredicatesGlob005
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * Begin with * by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "*LMN");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1220
     * @tc.name   : testRdbPredicatesGlob006
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * Begin and end with * by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "*FGHI*");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1170
     * @tc.name   : testRdbPredicatesGlob007
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * End with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("stringValue", "国");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1240
     * @tc.name   : testRdbPredicatesGlob008
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * End with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("integerValue", "2147483648");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1260
     * @tc.name   : testRdbPredicatesGlob009
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * End with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob009 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.glob(null, null);
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
          done();
        }
      }
      console.info(TAG + "************* testRdbPredicatesGlob009 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1270
     * @tc.name   : testRdbPredicatesGlob010
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * End with ? by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob010 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.glob(undefined, undefined);
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
          done();
        }
      }
      console.info(TAG + "************* testRdbPredicatesGlob010 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1250
     * @tc.name   : testRdbPredicatesGlob011
     * @tc.desc   : Test the glob() method of class RdbPredicates.
     * Begin and end with * by glob.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGlob011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob011 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.glob("integerValue", "*FGHI*");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGlob011 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0700
     * @tc.name   : testRdbPredicatesBetween001
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("stringValue", "ABB", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween001 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0690
     * @tc.name   : testRdbPredicatesBetween002
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("doubleValue", 0.0, DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0710
     * @tc.name   : testRdbPredicatesBetween003
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 0, 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween003 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0730
     * @tc.name   : testRdbPredicatesBetween004
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("longValue", 0, 2);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween004 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0670
     * @tc.name   : testRdbPredicatesBetween005
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("stringValue", "ABB", "ABB");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween005 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0660
     * @tc.name   : testRdbPredicatesBetween006
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("doubleValue", DOUBLE_MAX, DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween006 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0650
     * @tc.name   : testRdbPredicatesBetween007
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 1, 0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween007 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0740
     * @tc.name   : testRdbPredicatesBetween008
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("longValue", 2, -1);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween008 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0570
     * @tc.name   : testRdbPredicatesBetween009
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween009 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("stringValue", 1, 2);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween009 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0680
     * @tc.name   : testRdbPredicatesBetween010
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween010 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates = predicates.between(null, 0, 1);
          expect(predicates !== null).assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
          done();
        }
      }
      console.info(TAG + "************* testRdbPredicatesBetween010 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0550
     * @tc.name   : testRdbPredicatesBetween011
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween011 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("doubleValue", 3, 4);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween011 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0560
     * @tc.name   : testRdbPredicatesBetween012
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween012", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween012 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("doubleValue", 0.0, DOUBLE_MAX + 1);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween012 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0590
     * @tc.name   : testRdbPredicatesBetween013
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween013", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween013 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", "ABB", "ABC");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween013 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0600
     * @tc.name   : testRdbPredicatesBetween014
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween014", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween014 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 0, Number.MAX_VALUE);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween014 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0610
     * @tc.name   : testRdbPredicatesBetween015
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween015", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween015 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 0, Number.MIN_VALUE);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween015 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0620
     * @tc.name   : testRdbPredicatesBetween016
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween016", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween016 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 0, Number.NaN);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween016 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0630
     * @tc.name   : testRdbPredicatesBetween017
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween017", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween017 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 0, Number.NEGATIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween017 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0640
     * @tc.name   : testRdbPredicatesBetween018
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween018", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween018 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("integerValue", 0, Number.POSITIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween018 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0750
     * @tc.name   : testRdbPredicatesBetween004
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween019", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween019 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("longValue", 2.0, 3.0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween019 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0760
     * @tc.name   : testRdbPredicatesBetween020
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween020", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween020 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("longValue", 0, 0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween020 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0580
     * @tc.name   : testRdbPredicatesBetween021
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween021", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween021 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("characterValue", 2, -1);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween021 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0770
     * @tc.name   : testRdbPredicatesBetween022
     * @tc.desc   : Test the between() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesBetween022", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween022 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.between("longValue", "ABC", "ABD");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesBetween022 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2330
     * @tc.name   : testRdbPredicatesNotBetween001
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", "ABB", "ABD");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2300
     * @tc.name   : testRdbPredicatesNotBetween002
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("doubleValue", 0.0, DOUBLE_MAX);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2360
     * @tc.name   : testRdbPredicatesNotBetween003
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("integerValue", 0, 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2470
     * @tc.name   : testRdbPredicatesNotBetween004
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("longValue", 0, 2);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2340
     * @tc.name   : testRdbPredicatesNotBetween005
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("stringValue", 1, 2);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2430
     * @tc.name   : testRdbPredicatesNotBetween006
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween006 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.notBetween(null, 1, 2);
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2320
     * @tc.name   : testRdbPredicatesNotBetween007
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("doubleValue", 7, 8);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2310
     * @tc.name   : testRdbPredicatesNotBetween008
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("doubleValue", 0.0, DOUBLE_MAX + 1);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2420
     * @tc.name   : testRdbPredicatesNotBetween009
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween009 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("integerValue", "ABB", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween009 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2370
     * @tc.name   : testRdbPredicatesNotBetween010
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween010 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("integerValue", 0, Number.MAX_VALUE);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween010 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2380
     * @tc.name   : testRdbPredicatesNotBetween011
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween011 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("integerValue", 0, Number.MIN_VALUE);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween011 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2390
     * @tc.name   : testRdbPredicatesNotBetween012
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween012", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween012 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("integerValue", 0, Number.NaN);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween012 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2400
     * @tc.name   : testRdbPredicatesNotBetween013
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween013", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween013 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("integerValue", 0, Number.NEGATIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween013 end *************");
    });

    /**
     * @tc.number :  SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2410
     * @tc.name   : testRdbPredicatesNotBetween014
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween014", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween014 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("integerValue", 0, Number.POSITIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween014 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2490
     * @tc.name   : testRdbPredicatesNotBetween015
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween015", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween015 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("longValue", "3", "4");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween015 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2460
     * @tc.name   : testRdbPredicatesNotBetween016
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween016", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween016 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("longValue", 0, 0);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween016 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2450
     * @tc.name   : testRdbPredicatesNotBetween017
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween017", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween017 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("longValue", "ABC", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween017 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2350
     * @tc.name   : testRdbPredicatesNotBetween019
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween019", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween019 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("characterValue", 0, 2);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween019 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2480
     * @tc.name   : testRdbPredicatesNotBetween020
     * @tc.desc   : Test the notBetween() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotBetween020", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween020 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.notBetween("longValue", 2, 1);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween020 end *************");
    });


    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1310
     * @tc.name   : testRdbPredicatesGreaterThan001
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1290
     * @tc.name   : testRdbPredicatesGreaterThan002
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1340
     * @tc.name   : testRdbPredicatesGreaterThan003
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1440
     * @tc.name   : testRdbPredicatesGreaterThan004
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1320
     * @tc.name   : testRdbPredicatesGreaterThan005
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", "ZZZ");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1300
     * @tc.name   : testRdbPredicatesGreaterThan006
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("doubleValue", 999.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1410
     * @tc.name   : testRdbPredicatesGreaterThan007
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", -999);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1460
     * @tc.name   : testRdbPredicatesGreaterThan008
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("longValue", -999);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1330
     * @tc.name   : testRdbPredicatesGreaterThan009
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan009 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("stringValue", 1);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan009 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1430
     * @tc.name   : testRdbPredicatesGreaterThan010
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan010 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.greaterThan(null, 1);
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan010 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1400
     * @tc.name   : testRdbPredicatesGreaterThan011
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan011 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", "A");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan011 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1350
     * @tc.name   : testRdbPredicatesGreaterThan012
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan012", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan012 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", Number.MAX_VALUE);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan012 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1360
     * @tc.name   : testRdbPredicatesGreaterThan013
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan013", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan013 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", Number.MIN_VALUE);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan013 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1370
     * @tc.name   : testRdbPredicatesGreaterThan014
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan014", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan014 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", Number.NaN);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan014 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1380
     * @tc.name   : testRdbPredicatesGreaterThan015
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan015", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan015 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", Number.NEGATIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan015 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1390
     * @tc.name   : testRdbPredicatesGreaterThan016
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan016", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan016 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("integerValue", Number.POSITIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan016 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1420
     * @tc.name   : testRdbPredicatesGreaterThan018
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan018", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan018 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("floatValue", -999);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan018 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1450
     * @tc.name   : testRdbPredicatesGreaterThan019
     * @tc.desc   : Test the greaterThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThan019", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan019 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThan("longValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan019 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1910
     * @tc.name   : testRdbPredicatesLessThan001
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1870
     * @tc.name   : testRdbPredicatesLessThan002
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1930
     * @tc.name   : testRdbPredicatesLessThan003
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1970
     * @tc.name   : testRdbPredicatesLessThan004
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1880
     * @tc.name   : testRdbPredicatesLessThan005
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("doubleValue", 1.0);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1920
     * @tc.name   : testRdbPredicatesLessThan006
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("integerValue", -2147483648);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1960
     * @tc.name   : testRdbPredicatesLessThan007
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("longValue", -9223372036854775808);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1900
     * @tc.name   : testRdbPredicatesLessThan008
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", 1);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1940
     * @tc.name   : testRdbPredicatesLessThan009
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan009 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.lessThan(null, "ABD");
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan009 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1950
     * @tc.name   : testRdbPredicatesLessThan010
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan010 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("longValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan010 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1890
     * @tc.name   : testRdbPredicatesLessThan012
     * @tc.desc   : Test the lessThan() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThan012", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan012 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThan("stringValue", -9223372036854775808);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan012 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1490
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo001
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("stringValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1480
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo002
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo002 end *************");
    });

    /**
     * @tc.number : SUB_SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1520
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo003
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1540
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo004
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1550
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo005
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("longValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1530
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo006
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo006 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          predicates.greaterThanOrEqualTo(null, "ABC");
          let result = await rdbStore.query(predicates);
          expect(0).assertEqual(result.rowCount);
          result.close();
          result = null;
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo006 end *************");
    });

    /**
     * @tc.number :     SSUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1510
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo007
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("characterValue", 1);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1500
     * @tc.name   : testRdbPredicatesGreaterThanOrEqualTo008
     * @tc.desc   : Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.greaterThanOrEqualTo("stringValue", 1);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2150
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo001
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("stringValue", "ABD");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2140
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo002
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("doubleValue", 0.0);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1980
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo003
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2060
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo004
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValue", 1);
        let result = await rdbStore.query(predicates);
        expect(2).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2040
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo005
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo005 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1990
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo006
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo006 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", Number.MAX_VALUE);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2000
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo007
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo007", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo007 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", Number.MIN_VALUE);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo007 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2010
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo008
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo008", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo008 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", Number.NaN);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo008 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2020
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo009
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo009", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo009 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", Number.NEGATIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo009 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2030
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo010
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo010", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo010 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("integerValue", Number.POSITIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo010 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2120
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo011
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo011", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo011 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValue", "ABC");
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo011 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2070
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo012
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo012", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo012 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValue", Number.MAX_VALUE);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo012 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2080
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo013
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo013", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo013 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValue", Number.MIN_VALUE);
        let result = await rdbStore.query(predicates);
        expect(1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo013 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2090
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo014
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo014", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo014 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValue", Number.NaN);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo014 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2100
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo015
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo015", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo015 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValue", Number.NEGATIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(0).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo015 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2110
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo016
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo016", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo016 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValue", Number.POSITIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo016 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2160
     * @tc.name   : testRdbPredicatesLessThanOrEqualTo017
     * @tc.desc   : Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLessThanOrEqualTo017", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo017 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.lessThanOrEqualTo("longValueX", Number.POSITIVE_INFINITY);
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      } catch (e) {
        console.info(TAG + "lessThanOrEqualTo call failed.", e);
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo017 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2710
     * @tc.name   : testRdbPredicatesOrderByAsc001
     * @tc.desc   : Test the orderByAsc() and distinct() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOrderByAsc001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOrderByAsc001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByAsc("integerValue").distinct();
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        expect(true).assertEqual(result.goToFirstRow());
        expect(3).assertEqual(result.getLong(0));
        expect(true).assertEqual(result.goToNextRow());
        expect(2).assertEqual(result.getLong(0));
        expect(true).assertEqual(result.goToNextRow());
        expect(1).assertEqual(result.getLong(0));
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByAsc001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2700
     * @tc.name   : testRdbPredicatesOrderByAsc002
     * @tc.desc   : Test the orderByAsc() and distinct() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOrderByAsc002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOrderByAsc002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByAsc("integerValueX").distinct();
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByAsc002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2750
     * @tc.name   : testRdbPredicatesOrderByDesc001
     * @tc.desc   : Test the orderByDesc() and distinct() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOrderByDesc001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOrderByDesc001 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc("integerValue").distinct();
        let result = await rdbStore.query(predicates);
        expect(3).assertEqual(result.rowCount);
        expect(true).assertEqual(result.goToFirstRow());
        expect(1).assertEqual(result.getLong(0));
        expect(true).assertEqual(result.goToNextRow());
        expect(2).assertEqual(result.getLong(0));
        expect(true).assertEqual(result.goToNextRow());
        expect(3).assertEqual(result.getLong(0));
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByDesc001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2740
     * @tc.name   : testRdbPredicatesOrderByDesc002
     * @tc.desc   : Test the orderByDesc() and distinct() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOrderByDesc002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOrderByDesc002 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc("integerValueX").distinct();
        let result = await rdbStore.query(predicates);
        expect(-1).assertEqual(result.rowCount);
        result.close();
        result = null;
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByDesc002 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0170
     * @tc.name   : testRdbPredicatesLimitAs001
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLimitAs001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(1);
      let result = await rdbStore.query(predicates);
      expect(1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs001 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0180
     * @tc.name   : testRdbPredicatesLimitAs002
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLimitAs002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs002 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0160
     * @tc.name   : testRdbPredicatesLimitAs003
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLimitAs003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(100);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs003 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0190
     * @tc.name   : testRdbPredicatesLimitAs004
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLimitAs004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "中").limitAs(1);
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs004 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0150
     * @tc.name   : testRdbPredicatesLimitAs005
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLimitAs005 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(0);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs005 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0140
     * @tc.name   : testRdbPredicatesLimitAs006
     * @tc.desc   : Test the limitAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesLimitAs006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLimitAs006 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(-1);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesLimitAs006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0130
     * @tc.name   : testRdbPredicatesOffsetAs001
     * @tc.desc   : Test the offsetAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOffsetAs001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOffsetAs001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(1);
      let result = await rdbStore.query(predicates);
      expect(2).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesOffsetAs001 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0120
     * @tc.name   : testRdbPredicatesOffsetAs002
     * @tc.desc   : Test the offsetAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOffsetAs002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOffsetAs002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(0);
      let result = await rdbStore.query(predicates);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesOffsetAs002 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0100
     * @tc.name   : testRdbPredicatesOffsetAs003
     * @tc.desc   : Test the offsetAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOffsetAs003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOffsetAs003 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(5);
      let result = await rdbStore.query(predicates);
      expect(0).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesOffsetAs003 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0110
     * @tc.name   : testRdbPredicatesOffsetAs004
     * @tc.desc   : Test the offsetAs() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesOffsetAs004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOffsetAs004 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").limitAs(3).offsetAs(-1);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesOffsetAs004 rowCount: " + result.rowCount);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesOffsetAs004 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0210
     * @tc.name   : testRdbPredicatesGroupBy001
     * @tc.desc   : Test the groupBy() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGroupBy001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGroupBy001 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").groupBy(["characterValue"]);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesGroupBy001 rowCount: " + result.rowCount);
      expect(3).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesGroupBy001 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0200
     * @tc.name   : testRdbPredicatesGroupBy002
     * @tc.desc   : Test the groupBy() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGroupBy002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGroupBy002 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.like("stringValue", "ABCDEFGHIJKLMN").groupBy(["characterValueX"]);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesGroupBy002 rowCount: " + result.rowCount);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      result = null;
      done();
      console.info(TAG + "************* testRdbPredicatesGroupBy002 end *************");
    });

    /**
     * @tc.number :SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0220
     * @tc.name   : testRdbPredicatesGroupBy003
     * @tc.desc   : Test the groupBy() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesGroupBy003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGroupBy003 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.like("", "").groupBy(["characterValueX"]);
        let result = await rdbStore.query(predicates);
        console.info("testRdbPredicatesGroupBy003 rowCount: " + result.rowCount);
        expect(-1).assertEqual(result.rowCount);
        result.close();
      } catch (err) {
        console.info(TAG + "err = " + err);
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesGroupBy003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1650
     * @tc.name   : testRdbPredicatesIndexedBy001
     * @tc.desc   : Test the indexedBy() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testIndexedBy0001", 0, async (done: Function) => {
      console.info(TAG + "************* testIndexedBy0001 start *************");
      await rdbStore.executeSql("CREATE INDEX index_name ON AllDataType (characterValue);", null);
      try {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.indexedBy("index_name");
        let result = await rdbStore.query(predicates);
        console.info("testIndexedBy0001 rowCount: " + result.rowCount);
        expect(3).assertEqual(result.rowCount);
        result.close();
        done();
      } catch (err) {
        console.info(TAG + "err = " + err);
        expect().assertFail();
      }
      console.info(TAG + "************* testIndexedBy0001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1640
     * @tc.name   : testRdbPredicatesIndexedBy002
     * @tc.desc   : Test the indexedBy() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIndexedBy002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIndexedBy002 start *************");
      try {
        await rdbStore.executeSql("CREATE INDEX index_name ON AllDataType (characterValueX);", null);
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.indexedBy("index_name");
        expect(predicates !== null).assertFail();
      } catch (errInfo) {
        expect(errInfo != null).assertTrue();
        console.info(TAG + "testRdbPredicatesIndexedBy002 error: " + errInfo);
        done();
      }
      console.info(TAG + "************* testRdbPredicatesIndexedBy002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1610
     * @tc.name   : testRdbPredicatesIn001
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIn001 start *************");
      let values = [Number.MIN_VALUE.toString()];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.in("doubleValue", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesIn001 rowCount: " + result.rowCount);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesIn001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1580
     * @tc.name   : testRdbPredicatesIn002
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIn002 start *************");
      let values = ["1.0"];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.in("doubleValue", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesIn002 rowCount: " + result.rowCount);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesIn002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1590
     * @tc.name   : testRdbPredicatesIn003
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIn003 start *************");
      let values = [DOUBLE_MAX.toString()];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.in("doubleValue", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesIn003 rowCount: " + result.rowCount);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesIn003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1600
     * @tc.name   : testRdbPredicatesIn004
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIn004 start *************");
      let values = [Number.MIN_VALUE.toString(), "1.0", DOUBLE_MAX.toString()];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.in("doubleValue", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesIn004 rowCount: " + result.rowCount);
      expect(3).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesIn004 end *************");
    });

    /**
     * @tc.number :  SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1620
     * @tc.name   : testRdbPredicatesIn005
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIn005 start *************");
      let values = [Number.MIN_VALUE.toString(), "10.0", DOUBLE_MAX.toString()];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.in("doubleValueX", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesIn005 rowCount: " + result.rowCount);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesIn005 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1570
     * @tc.name   : testRdbPredicatesIn006
     * @tc.desc   : Test the in() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesIn006", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIn006 start *************");
      try {
        let values = [""];
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        predicates.in("doubleValue", values);
        let result = await rdbStore.query(predicates);
        console.info("testRdbPredicatesIn006 rowCount: " + result.rowCount);
        expect(0).assertEqual(result.rowCount);
        result.close();
        done();
      } catch (err) {
        console.info(TAG + "err = " + err);
        expect(err.code).assertEqual("401");
      }
      console.info(TAG + "************* testRdbPredicatesIn006 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2660
     * @tc.name   : testRdbPredicatesNotIn001
     * @tc.desc   : Test the notIn() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotIn001", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotIn001 start *************");
      let values = [1, -2147483648];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.notIn("integerValue", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesNotIn001 rowCount: " + result.rowCount);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesNotIn001 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2670
     * @tc.name   : testRdbPredicatesNotIn002
     * @tc.desc   : Test the notIn() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotIn002", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotIn002 start *************");
      let values = [1, 2147483647];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.notIn("integerValue", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesNotIn002 rowCount: " + result.rowCount);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesNotIn002 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2650
     * @tc.name   : testRdbPredicatesNotIn003
     * @tc.desc   : Test the notIn() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotIn003", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotIn003 start *************");
      let values = [-2147483648, 2147483647];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.notIn("integerValue", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesNotIn003 rowCount: " + result.rowCount);
      expect(1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesNotIn003 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2680
     * @tc.name   : testRdbPredicatesNotIn004
     * @tc.desc   : Test the notIn() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotIn004", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotIn004 start *************");
      let values: Array<string> = [];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.notIn("integerValue", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesNotIn004 rowCount: " + result.rowCount);
      expect(3).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesNotIn004 end *************");
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2690
     * @tc.name   : testRdbPredicatesNotIn005
     * @tc.desc   : Test the notIn() method of class RdbPredicates.
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRdbPredicatesNotIn005", 0, async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotIn005 start *************");
      let values = [-2147483648, 2147483647];
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      predicates.notIn("integerValueX", values);
      let result = await rdbStore.query(predicates);
      console.info("testRdbPredicatesNotIn005 rowCount: " + result.rowCount);
      expect(-1).assertEqual(result.rowCount);
      result.close();
      done();
      console.info(TAG + "************* testRdbPredicatesNotIn005 end *************");
    });
  });
}
