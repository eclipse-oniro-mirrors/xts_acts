/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import relationalStore from "@ohos.data.relationalStore";
import curves from "@ohos.curves";
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
const CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "data1 TEXT NOT NULL, " + "data2 INTEGER, " + "data3 REAL, " + "data4 BLOB)";

let rdbStore = undefined;
let dbName = 'IgnorePredicates.db';
const STORE_CONFIG: relationalStore.StoreConfig = {
  name: dbName,
  securityLevel: relationalStore.SecurityLevel.S1,
};
let DOUBLE_MAX = 9223372036854775807;

function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

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

async function createTest() {
  console.info(TAG + "createTest data start");
  {
    let u8 = new Uint8Array([1, 2, 3]);
    const valueBucket: ValuesBucket = {
      data1: "hello",
      data2: 10,
      data3: 1.0,
      data4: u8,
    };
    await rdbStore.insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array([3, 4, 5]);
    const valueBucket: ValuesBucket = {
      data1: "2",
      data2: -5,
      data3: 2.5,
      data4: u8,
    };
    await rdbStore.insert("test", valueBucket);
  }
  {
    let u8 = new Uint8Array(0);
    const valueBucket: ValuesBucket = {
      data1: "hello world",
      data2: 3,
      data3: 1.8,
      data4: u8,
    };
    await rdbStore.insert("test", valueBucket);
  }
  console.info(TAG + "createTest data end");
}

export default function RdbStoreIgnore() {
  describe("RdbStoreIgnore", () => {
    beforeAll(async () => {
      console.info(TAG + "beforeAll");
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info(TAG + 'Get context successful. context=' + context);
    });

    beforeEach(async () => {
      console.info(TAG + "beforeEach");
      rdbStore = await relationalStore.getRdbStore(context, STORE_CONFIG);
      await rdbStore.executeSql(CREATE_TABLE_ALL_DATA_TYPE_SQL, null);
      await rdbStore.executeSql(CREATE_TABLE_TEST, null);
      await buildAllDataType1();
      await buildAllDataType2();
      await buildAllDataType3();
      await createTest();
    });

    afterEach(async () => {
      console.info(TAG + "afterEach");
      rdbStore = null;
      await relationalStore.deleteRdbStore(context, dbName);
    });

    afterAll(async () => {
      console.info(TAG + "afterAll");
    });

    /**
     * @tc.name   testRdbPredicatesConstructor005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2810
     * @tc.desc   Test the constructor() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesConstructor005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesConstructor005 start *************");
      try {
        // @ts-ignore
        let rdbPredicates = await new relationalStore.RdbPredicates(1);
        expect(rdbPredicates != null ).assertTrue();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesConstructor005 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesConstructor006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2820
     * @tc.desc   Test the constructor() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesConstructor006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesConstructor006 start *************");
      try {
        // @ts-ignore
        let rdbPredicates = await new relationalStore.RdbPredicates();
        expect(rdbPredicates != null ).assertTrue();
      } catch (e) {
        console.log('testRdbPredicatesConstructor006 error:' + e);
        expect(e !== null).assertTrue();
      }
      done();
      console.info(TAG + "************* testRdbPredicatesConstructor006 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesEqualTo014
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1100
     * @tc.desc   Test the equalTo() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesEqualTo014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesEqualTo014 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        try {
          // @ts-ignore
          predicates.equalTo(123, 'ss');
          expect(predicates !== null).assertEqual(true);
        } catch (e) {
          console.log('testRdbPredicatesEqualTo013 err:' + e);
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesEqualTo013 end   *************");
    });

    /**
     * @tc.name   testRdbPredicatesNotEqualTo014
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2590
     * @tc.desc   Test the notEqualTo() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesNotEqualTo014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotEqualTo014 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        try {
          // @ts-ignore
          predicates.notEqualTo(123, 'ss');
          expect(predicates !== null).assertEqual(true);
        } catch (e) {
          console.log('testRdbPredicatesNotEqualTo013 err:' + e);
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotEqualTo013 end   *************");
    });

    /**
     * @tc.name   testRdbPredicatesIsNull009
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1770
     * @tc.desc   Test the isNull() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesIsNull009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull009 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        // @ts-ignore
        predicates.isNull();
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull009 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesIsNull010
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1760
     * @tc.desc   Test the isNull() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesIsNull010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNull010 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        // @ts-ignore
        predicates.isNull(123);
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesIsNull010 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesIsNotNull009
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1670
     * @tc.desc   Test the isNotNull() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesIsNotNull009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull009 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        // @ts-ignore
        predicates.isNotNull();
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull009 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesIsNotNull010
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1660
     * @tc.desc   Test the isNotNull() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesIsNotNull010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIsNotNull010 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        // @ts-ignore
        predicates.isNotNull(123);
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesIsNotNull010 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesLike012
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2170
     * @tc.desc   Test the like() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesLike012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike012 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        // @ts-ignore
        predicates = predicates.like();
        expect(predicates != null).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
        done();
      }
      console.info(TAG + "************* testRdbPredicatesLike012 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesLike013
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2180
     * @tc.desc   Test the like() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesLike013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLike013 start *************");
      let predicates = await new relationalStore.RdbPredicates("AllDataType");
      try {
        // @ts-ignore
        predicates = predicates.like(123, '%%');
        expect(predicates != null).assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
        done();
      }
      console.info(TAG + "************* testRdbPredicatesLike013 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesGlob012
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1160
     * @tc.desc   Test the glob() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesGlob012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGlob012 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          // @ts-ignore
          predicates = predicates.glob("*FGHI*");
          expect(predicates !== null).assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
          done();
        }
      }
      console.info(TAG + "************* testRdbPredicatesGlob012 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesBetween023
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_0720
     * @tc.desc   Test the between() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesBetween023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesBetween023 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          // @ts-ignore
          predicates = predicates.between("ABC", "ABD");
          expect(predicates !== null).assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
          done();
        }
      }
      console.info(TAG + "************* testRdbPredicatesBetween023 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesNotBetween018
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2440
     * @tc.desc   Test the notBetween() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesNotBetween018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotBetween018 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          // @ts-ignore
          predicates = predicates.notBetween("ABC", "ABD");
          expect(predicates !== null).assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesNotBetween018 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesGreaterThan017
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1280
     * @tc.desc   Test the greaterThan() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesGreaterThan017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThan017 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          // @ts-ignore
          predicates = predicates.greaterThan(-999);
          expect(predicates !== null).assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThan017 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesLessThan011
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1860
     * @tc.desc   Test the lessThan() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesLessThan011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThan011 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          // @ts-ignore
          predicates = predicates.lessThan(-9223372036854775808);
          expect(predicates !== null).assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThan011 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesGreaterThanOrEqualTo006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1470
     * @tc.desc   Test the greaterThanOrEqualTo() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesGreaterThanOrEqualTo006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo006 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("AllDataType");
          // @ts-ignore
          predicates = predicates.greaterThanOrEqualTo(1);
          expect(predicates !== null).assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesGreaterThanOrEqualTo006 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesLessThanOrEqualTo018
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2050
     * @tc.desc   Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesLessThanOrEqualTo018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo018 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        // @ts-ignore
        predicates.lessThanOrEqualTo();
        expect().assertFail();
      } catch (e) {
        console.info(TAG + "lessThanOrEqualTo call failed.", e);
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo018 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesLessThanOrEqualTo019
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2130
     * @tc.desc   Test the lessThanOrEqualTo() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesLessThanOrEqualTo019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo019 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        // @ts-ignore
        predicates.lessThanOrEqualTo(123, Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        console.info(TAG + "lessThanOrEqualTo call failed.", e);
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testRdbPredicatesLessThanOrEqualTo019 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesOrderByDesc003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2720
     * @tc.desc   Test the orderByDesc() and distinct() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesOrderByDesc003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOrderByDesc003 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        try {
          // @ts-ignore
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc().distinct();
          expect().assertFail();
        } catch (e) {
          console.error(TAG + " orderByDesc call failed.", e);
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByDesc003 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesOrderByDesc004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2730
     * @tc.desc   Test the orderByDesc() and distinct() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesOrderByDesc004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesOrderByDesc004 start *************");
      {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        try {
          // @ts-ignore
          predicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByDesc(123).distinct();
          expect().assertFail();
        } catch (e) {
          console.error(TAG + " orderByDesc call failed.", e);
          expect('401').assertEqual(e.code);
        }
      }
      done();
      console.info(TAG + "************* testRdbPredicatesOrderByDesc004 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesIndexedBy003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1630
     * @tc.desc   Test the indexedBy() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesIndexedBy003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIndexedBy003 start *************");
      try {
        await rdbStore.executeSql("CREATE INDEX index_name ON AllDataType (characterValueX);", null);
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        // @ts-ignore
        predicates.indexedBy();
        expect().assertFail();
      } catch (errInfo) {
        expect(errInfo != null).assertTrue();
        console.info(TAG + "testRdbPredicatesIndexedBy002 error: " + errInfo);
        done();
      }
      console.info(TAG + "************* testRdbPredicatesIndexedBy003 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesIn007
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_1560
     * @tc.desc   Test the in() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesIn007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesIn007 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        // @ts-ignore
        predicates.in();
        expect().assertFail();
      } catch (err) {
        console.info(TAG + "err = " + err);
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesIn007 end *************");
    });

    /**
     * @tc.name   testRdbPredicatesNotIn006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_PredicateJsAPITest_2640
     * @tc.desc   Test the notIn() method of class RdbPredicates.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbPredicatesNotIn006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbPredicatesNotIn006 start *************");
      try {
        let predicates = await new relationalStore.RdbPredicates("AllDataType");
        // @ts-ignore
        predicates.notIn();
        expect().assertFail();
      } catch (err) {
        console.info(TAG + "err = " + err);
        expect(err.code).assertEqual("401");
        done();
      }
      console.info(TAG + "************* testRdbPredicatesNotIn006 end *************");
    });

    /**
     * @tc.name   testRdbStoreBatchInsertError0016
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_RdbStoreJsAPITest_0370
     * @tc.desc   RdbStore batchInsert callback test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testRdbStoreBatchInsertError0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testRdbStoreBatchInsertError0016 start *************");
      const valueBucket1: ValuesBucket = {
        name: "zhangsan",
        age: 18,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket2: ValuesBucket = {
        name: "lisi",
        age: 23,
        salary: 200,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBucket3 : ValuesBucket= {
        name: "wangwu",
        age: 20,
        salary: 100.5,
        blobType: new Uint8Array([1, 2, 3]),
      };
      const valueBuckets = [valueBucket1, valueBucket2, valueBucket3];
      try {
        // @ts-ignore
        rdbStore.batchInsert(valueBuckets, async (err, insertNum) => {
          expect(!err).assertFail();
        });
        expect().assertFail();
      } catch (e) {
        console.info(TAG + "************* testRdbStoreBatchInsertError0016 *************");
        expect('401').assertEqual(e.code);
        done();
      }

      console.info(TAG + "************* testRdbStoreBatchInsertError0016 end *************");
    });


    /**
     * @tc.name   testResultSetGoTo005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0930
     * @tc.desc   ResultSet goTo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoTo005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoTo005 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);
          // @ts-ignore
          resultSet.goTo("ABC");
          expect().assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
        done();
        console.info(TAG + "************* testResultSetGoTo005 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoTo006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0920
     * @tc.desc   ResultSet goTo test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoTo006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoTo006 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);
          // @ts-ignore
          resultSet.goTo();
          expect().assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
        done();
        console.info(TAG + "************* testResultSetGoTo006 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoToRow005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_1000
     * @tc.desc   ResultSet goToRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToRow005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToRow005 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);
          // @ts-ignore
          resultSet.goToRow("ABC");
          expect().assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
        done();
        console.info(TAG + "************* testResultSetGoToRow005 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGoToRow006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0990
     * @tc.desc   ResultSet goToRow test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGoToRow006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGoToRow006 start *************");
      {
        try {
          let predicates = await new relationalStore.RdbPredicates("test");
          let resultSet = await rdbStore.query(predicates);
          // @ts-ignore
          resultSet.goToRow();
          expect().assertFail();
        } catch (e) {
          expect('401').assertEqual(e.code);
        }
        done();
        console.info(TAG + "************* testResultSetGoToRow006 end *************");
      }
    });

    /**
     * @tc.name   testResultSetGetBlob003
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0640
     * @tc.desc   ResultSet getBlob test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetBlob003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetBlob003 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        // @ts-ignore
        const data4 = resultSet.getBlob("ABC");
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testResultSetGetBlob003 end *************");
    });

    /**
     * @tc.name   testResultSetGetBlob004
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0620
     * @tc.desc   ResultSet getBlob test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetBlob004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetBlob004 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        // @ts-ignore
        const data4 = resultSet.getBlob();
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testResultSetGetBlob004 end *************");
    });

    /**
     * @tc.name   testResultSetGetBlob005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0630
     * @tc.desc   ResultSet getBlob test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetBlob005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetBlob005 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        console.log('testResultSetGetBlob005 11111');
        let index = resultSet.getColumnIndex(999);
        console.log('testResultSetGetBlob005 22222');
        // @ts-ignore
        const data4 = resultSet.getBlob(index);
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testResultSetGetBlob005 end *************");
    });

    /**
     * @tc.name   testResultSetGetString005
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0910
     * @tc.desc   ResultSet getString test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetString005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetString005 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        resultSet.goToRow(2);
        // @ts-ignore
        const data1 = resultSet.getString("ABC");
        const data2 = resultSet.getString("ABD");
        const data3 = resultSet.getString("ABE");
        resultSet.close();
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
      }
      done();
      console.info(TAG + "************* testResultSetGetString005 end *************");
    });

    /**
     * @tc.name   testResultSetGetString006
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0890
     * @tc.desc   ResultSet getString test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetString006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetString006 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        resultSet.goToRow(2);
        // @ts-ignore
        const data1 = resultSet.getString();
        const data2 = resultSet.getString();
        const data3 = resultSet.getString();
        resultSet.close();
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
        done();
      }
      console.info(TAG + "************* testResultSetGetString006 end *************");
    });

    /**
     * @tc.name   testResultSetGetString007
     * @tc.number SUB_DistributeData_CrossPlatform_SDK_RelationStore_ResultSetJsAPITest_0900
     * @tc.desc   ResultSet getString test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testResultSetGetString007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,  async (done: Function) => {
      console.info(TAG + "************* testResultSetGetString007 start *************");
      let predicates = await new relationalStore.RdbPredicates("test");
      let resultSet = await rdbStore.query(predicates);
      try {
        resultSet.goToRow(2);
        // @ts-ignore
        const data1 = resultSet.getString(resultSet.getColumnIndex(111));
        const data2 = resultSet.getString(resultSet.getColumnIndex(222));
        const data3 = resultSet.getString(resultSet.getColumnIndex(333));
        resultSet.close();
        expect().assertFail();
      } catch (e) {
        expect('401').assertEqual(e.code);
        done();
      }
      console.info(TAG + "************* testResultSetGetString007 end *************");
    });
  });
}