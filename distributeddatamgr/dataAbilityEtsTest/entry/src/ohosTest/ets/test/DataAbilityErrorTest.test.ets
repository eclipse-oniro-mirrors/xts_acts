/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import dataRdb from '@ohos.data.rdb';
import dataAbility from '@ohos.data.dataAbility';
import common from "@ohos.app.ability.common";


const TAG = '[RDB_JSKITS _TEST]'
const CREATE_TABLE_ALL_DATA_TYPE_SQL = "CREATE TABLE IF NOT EXISTS AllDataType "
    + "(id INTEGER PRIMARY KEY AUTOINCREMENT, "
    + "integerValue INTEGER , longValue INTEGER , shortValue INTEGER , booleanValue INTEGER , "
    + "doubleValue REAL , floatValue REAL , stringValue TEXT , blobValue BLOB , clobValue TEXT , "
    + "byteValue INTEGER , dateValue INTEGER , timeValue INTEGER , timestampValue INTEGER , "
    + "calendarValue INTEGER , characterValue TEXT , primIntValue INTEGER , primLongValue INTEGER , "
    + "primShortValue INTEGER , primFloatValue REAL , primDoubleValue REAL , "
    + "primBooleanValue INTEGER , primByteValue INTEGER , primCharValue TEXT, `order` INTEGER);";

const STORE_CONFIG: dataRdb.StoreConfig = {
    name: "Predicates.db",
    // securityLevel: dataRdb.SecurityLevel.S1,
}
let rdbStore: dataRdb.RdbStore | null = null;
let DOUBLE_MAX = 9223372036854775807;
let context: common.UIAbilityContext;

async function buildAllDataType1() {
    console.info(TAG + "buildAllDataType1 start");
    {
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: dataRdb.ValuesBucket = {
            "integerValue": 2147483647,
            "doubleValue": DOUBLE_MAX,
            "booleanValue": true,
            "floatValue": -0.123,
            "longValue": 9223372036854775807,
            "shortValue": 32767,
            "characterValue": ' ',
            "stringValue": "ABCDEFGHIJKLMN",
            "blobValue": u8,
            "byteValue": 127,
        }
        await rdbStore!.insert("AllDataType", valueBucket)
    }
}

async function buildAllDataType2() {
    console.info(TAG + "buildAllDataType2 start");
    {
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: dataRdb.ValuesBucket = {
            "integerValue": 1,
            "doubleValue": 1.0,
            "booleanValue": false,
            "floatValue": 1.0,
            "longValue": 1,
            "shortValue": 1,
            "characterValue": '中',
            "stringValue": "ABCDEFGHIJKLMN",
            "blobValue": u8,
            "byteValue": 1,
        }
        await rdbStore!.insert("AllDataType", valueBucket)
    }
}

async function buildAllDataType3() {
    console.info(TAG + "buildAllDataType3 start");
    {
        let u8 = new Uint8Array([1, 2, 3])
        const valueBucket: dataRdb.ValuesBucket = {
            "integerValue": -2147483648,
            "doubleValue": Number.MIN_VALUE,
            "booleanValue": false,
            "floatValue": 0.1234567,
            "longValue": -9223372036854775808,
            "shortValue": -32768,
            "characterValue": '#',
            "stringValue": "ABCDEFGHIJKLMN",
            "blobValue": u8,
            "byteValue": -128,
        }
        await rdbStore!.insert("AllDataType", valueBucket)
    }
}


export default function DataAbilityErrorTest() {
    describe('DataAbilityErrorTest', () => {
        beforeAll(async () => {
            console.info(TAG + 'beforeAll')
            context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext
            rdbStore = await dataRdb.getRdbStore(context, STORE_CONFIG, 1);
            await rdbStore!.executeSql(CREATE_TABLE_ALL_DATA_TYPE_SQL, null);
            await buildAllDataType1();
            await buildAllDataType2();
            await buildAllDataType3();
        })

        beforeEach(() => {
            console.info(TAG + 'beforeEach')
        })

        afterEach(() => {
            console.info(TAG + 'afterEach')
        })

        afterAll(async () => {
            console.info(TAG + 'afterAll')
            rdbStore = null
            await dataRdb.deleteRdbStore(context, "Predicates.db");
        })

        console.info(TAG + "*************Unit Test Begin*************");

        /**
         * @tc.name   testCreateRdbPredicates0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_CreateRdbPredicatesTest_0100
         * @tc.desc   createRdbPredicates input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCreateRdbPredicates0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testCreateRdbPredicates0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                dataAbilityPredicates.equalTo("booleanValue", true);
                let predicates = dataAbility.createRdbPredicates("", dataAbilityPredicates);
                console.info(TAG + "createRdbPredicates success" + JSON.stringify(predicates));
                expect().assertFail();
            } catch (err) {
                console.info(TAG + "testCreateRdbPredicates0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect(err.code).assertEqual("401")
            }
            console.info(TAG + "************* testCreateRdbPredicates0001 end   *************");
        })

        /**
         * @tc.name   testCreateRdbPredicates0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_CreateRdbPredicatesTest_0200
         * @tc.desc   createRdbPredicates input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCreateRdbPredicates0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testCreateRdbPredicates0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                dataAbilityPredicates.equalTo("booleanValue", true);
                let predicates = dataAbility.createRdbPredicates(null, dataAbilityPredicates);
                console.info(TAG + "createRdbPredicates success" + JSON.stringify(predicates));
                expect().assertFail();
            } catch (err) {
                console.info(TAG + "testCreateRdbPredicates0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                let errmsg = "Table name should be a string."
                expect(err.message).assertContain(errmsg);
            }
            console.info(TAG + "************* testCreateRdbPredicates0002 end   *************");
        })

        /**
         * @tc.name   testCreateRdbPredicates0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_CreateRdbPredicatesTest_0300
         * @tc.desc   createRdbPredicates input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCreateRdbPredicates0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testCreateRdbPredicates0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                dataAbilityPredicates.equalTo("booleanValue", true);
                let predicates = dataAbility.createRdbPredicates(undefined, dataAbilityPredicates);
                console.info(TAG + "createRdbPredicates success" + JSON.stringify(predicates));
                expect().assertFail();
            } catch (err) {
                console.info(TAG + "testCreateRdbPredicates0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                let errmsg = "Table name should be a string."
                expect(err.message).assertContain(errmsg);
            }
            console.info(TAG + "************* testCreateRdbPredicates0003 end   *************");
        })

        /**
         * @tc.name   testCreateRdbPredicates0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_CreateRdbPredicatesTest_0400
         * @tc.desc   createRdbPredicates input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCreateRdbPredicates0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testCreateRdbPredicates0004 start *************");
            try {
                let predicates = dataAbility.createRdbPredicates("AllDataType", null);
                console.info(TAG + "createRdbPredicates success" + JSON.stringify(predicates));
                expect().assertFail();
            } catch (err) {
                console.info(TAG + "testCreateRdbPredicates0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                let errmsg = "Table name should be an object."
                expect(err.message).assertContain(errmsg);
            }
            console.info(TAG + "************* testCreateRdbPredicates0004 end   *************");
        })

        /**
         * @tc.name   testCreateRdbPredicates0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_CreateRdbPredicatesTest_0500
         * @tc.desc   createRdbPredicates input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCreateRdbPredicates0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testCreateRdbPredicates0005 start *************");
            try {
                let predicates = dataAbility.createRdbPredicates("AllDataType", undefined);
                console.info(TAG + "createRdbPredicates success" + JSON.stringify(predicates));
                expect().assertFail();
            } catch (err) {
                console.info(TAG + "testCreateRdbPredicates0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                let errmsg = "Table name should be an object."
                expect(err.message).assertContain(errmsg);
            }
            console.info(TAG + "************* testCreateRdbPredicates0005 end   *************");
        })

        /**
         * @tc.name   testCreateRdbPredicates0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_CreateRdbPredicatesTest_0600
         * @tc.desc   createRdbPredicates input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCreateRdbPredicates0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testCreateRdbPredicates0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                dataAbilityPredicates.equalTo("booleanValue", true);
                let predicates = dataAbility.createRdbPredicates("AllDataType", dataAbilityPredicates);
                console.info(TAG + "createRdbPredicates success" + JSON.stringify(predicates));
                expect(predicates).assertInstanceOf("Object");
            } catch (err) {
                console.info(TAG + "testCreateRdbPredicates0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testCreateRdbPredicates0006 end   *************");
        })

        /**
         * @tc.name   testEqualToErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_EqualToErrTest_0100
         * @tc.desc   equalTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEqualToErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testEqualToErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.equalTo("", true);
                console.info(TAG + "equalTo success" + JSON.stringify(predicates));
                expect(predicates).assertInstanceOf("Object");
            } catch (err) {
                console.info(TAG + "testEqualToErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEqualToErr0001 end   *************");
        })

        /**
         * @tc.name   testEqualToErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_EqualToErrTest_0200
         * @tc.desc   equalTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEqualToErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testEqualToErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.equalTo(null, true);
                console.info(TAG + "equalTo success" + JSON.stringify(predicates));
                expect(predicates).assertUndefined();
            } catch (err) {
                console.info(TAG + "testEqualToErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEqualToErr0002 end   *************");
        })

        /**
         * @tc.name   testEqualToErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_EqualToErrTest_0300
         * @tc.desc   equalTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEqualToErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testEqualToErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.equalTo(undefined, true);
                console.info(TAG + "equalTo success" + JSON.stringify(predicates));
                expect(predicates).assertUndefined();
            } catch (err) {
                console.info(TAG + "testEqualToErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEqualToErr0003 end   *************");
        })

        /**
         * @tc.name   testEqualToErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_EqualToErrTest_0400
         * @tc.desc   equalTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEqualToErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testEqualToErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.equalTo("booleanValue", null);
                console.info(TAG + "equalTo success" + JSON.stringify(predicates));
                expect(predicates).assertInstanceOf("Object");
            } catch (err) {
                console.info(TAG + "testEqualToErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEqualToErr0004 end   *************");
        })

        /**
         * @tc.name   testEqualToErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_EqualToErrTest_0500
         * @tc.desc   equalTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEqualToErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testEqualToErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.equalTo("booleanValue", undefined);
                console.info(TAG + "equalTo success" + JSON.stringify(predicates));
                expect(predicates).assertUndefined();
            } catch (err) {
                console.info(TAG + "testEqualToErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEqualToErr0005 end   *************");
        })

        /**
         * @tc.name   testNotEqualToErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotEqualToErrTest_0100
         * @tc.desc   notEqualTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNotEqualToErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testNotEqualToErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notEqualTo("", true);
                console.info(TAG + "notEqualTo success" + JSON.stringify(predicates));
                expect(predicates).assertInstanceOf("Object");
            } catch (err) {
                console.info(TAG + "testNotEqualToErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotEqualToErr0001 end   *************");
        })

        /**
         * @tc.name   testNotEqualToErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotEqualToErrTest_0200
         * @tc.desc   notEqualTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNotEqualToErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testNotEqualToErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notEqualTo(null, true);
                console.info(TAG + "testNotEqualToErr0002 success" + JSON.stringify(predicates));
                expect(predicates).assertUndefined();
            } catch (err) {
                console.info(TAG + "testNotEqualToErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotEqualToErr0002 end   *************");
        })

        /**
         * @tc.name   testNotEqualToErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotEqualToErrTest_0300
         * @tc.desc   notEqualTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNotEqualToErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testNotEqualToErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notEqualTo(undefined, true);
                console.info(TAG + "testNotEqualToErr0003 success" + JSON.stringify(predicates));
                expect(predicates).assertUndefined();
            } catch (err) {
                console.info(TAG + "testNotEqualToErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotEqualToErr0003 end   *************");
        })

        /**
         * @tc.name   testNotEqualToErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotEqualToErrTest_0400
         * @tc.desc   notEqualTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNotEqualToErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testNotEqualToErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notEqualTo("booleanValue", null);
                console.info(TAG + "testNotEqualToErr0004 success" + JSON.stringify(predicates));
                expect(predicates).assertInstanceOf("Object");
            } catch (err) {
                console.info(TAG + "testNotEqualToErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotEqualToErr0004 end   *************");
        })

        /**
         * @tc.name   testNotEqualToErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotEqualToErrTest_0500
         * @tc.desc   notEqualTo input error parameter
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testNotEqualToErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
            console.info(TAG + "************* testNotEqualToErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notEqualTo("booleanValue", undefined);
                console.info(TAG + "testNotEqualToErr0005 success" + JSON.stringify(predicates));
                expect(predicates).assertUndefined();
            } catch (err) {
                console.info(TAG + "testNotEqualToErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotEqualToErr0005 end   *************");
        })

        /**
         * @tc.name   testBeginWrapErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_BeginWrapErrTest_0100
         * @tc.desc   predicates beginWrap、or、endWrap normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBeginWrapErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBeginWrapErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN");
                predicates = dataAbilityPredicates.beginWrap();
                expect(predicates).assertInstanceOf("Object");
                predicates = dataAbilityPredicates.equalTo("integerValue", 1);
                predicates = dataAbilityPredicates.or();
                expect(predicates).assertInstanceOf("Object");
                predicates = dataAbilityPredicates.equalTo("integerValue", 2147483647);
                predicates = dataAbilityPredicates.endWrap();
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBeginWrapErr0001 success");
            } catch (err) {
                console.info(TAG + "testBeginWrapErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBeginWrapErr0001 end *************");
        })

        /**
         * @tc.name   testAndErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_AndErrTest_0100
         * @tc.desc   predicates and normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testAndErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testAndErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN");
                predicates = dataAbilityPredicates.and();
                expect(predicates).assertInstanceOf("Object");
                predicates = dataAbilityPredicates.equalTo("integerValue", 1);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testAndErr0001 success");
            } catch (err) {
                console.info(TAG + "testAndErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testAndErr0001 end *************");
        })

        /**
         * @tc.name   testContainsErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_ContainsErrTest_0100
         * @tc.desc   predicates  normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testContainsErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testContainsErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.contains("", "DEF");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testContainsErr0001 success");
            } catch (err) {
                console.info(TAG + "testContainsErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testContainsErr0001 end *************");
        })

        /**
         * @tc.name   testContainsErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_ContainsErrTest_0200
         * @tc.desc   predicates  normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testContainsErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testContainsErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.contains(null, "DEF");
                expect(predicates).assertUndefined();
                console.info(TAG + "testContainsErr0002 success");
            } catch (err) {
                console.info(TAG + "testContainsErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testContainsErr0002 end *************");
        })

        /**
         * @tc.name   testContainsErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_ContainsErrTest_0300
         * @tc.desc   predicates  normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testContainsErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testContainsErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.contains(undefined, "DEF");
                expect(predicates).assertUndefined();
                console.info(TAG + "testContainsErr0003 success");
            } catch (err) {
                console.info(TAG + "testContainsErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testContainsErr0003 end *************");
        })

        /**
         * @tc.name   testContainsErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_ContainsErrTest_0400
         * @tc.desc   predicates  normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testContainsErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testContainsErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.contains("stringValue", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testContainsErr0004  success");
            } catch (err) {
                console.info(TAG + "testContainsErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testContainsErr0004 end *************");
        })

        /**
         * @tc.name   testContainsErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_ContainsErrTest_0500
         * @tc.desc   predicates  normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testContainsErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testContainsErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.contains("stringValue", null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testContainsErr0005 success");
            } catch (err) {
                console.info(TAG + "testContainsErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testContainsErr0005 end *************");
        })

        /**
         * @tc.name   testContainsErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_ContainsErrTest_0600
         * @tc.desc   predicates contains normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testContainsErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testContainsErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.contains("stringValue", undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testContainsErr0006 success");
            } catch (err) {
                console.info(TAG + "testContainsErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testContainsErr0006 end *************");
        })

        /**
         * @tc.name   testBeginsWithErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_BeginsWithErrTest_0100
         * @tc.desc   predicates beginsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBeginsWithErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBeginsWithErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.beginsWith("", "ABC");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBeginsWithErr0001 success");
            } catch (err) {
                console.info(TAG + "testBeginsWithErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBeginsWithErr0001 end *************");
        })

        /**
         * @tc.name   testBeginsWithErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_BeginsWithErrTest_0200
         * @tc.desc   predicates beginsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBeginsWithErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBeginsWithErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.beginsWith(null, "ABC");
                expect(predicates).assertUndefined();
                console.info(TAG + "testBeginsWithErr0002 success");
            } catch (err) {
                console.info(TAG + "testBeginsWithErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBeginsWithErr0002 end *************");
        })

        /**
         * @tc.name   testBeginsWithErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_BeginsWithErrTest_0300
         * @tc.desc   predicates beginsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBeginsWithErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBeginsWithErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.beginsWith(undefined, "ABC");
                expect(predicates).assertUndefined();
                console.info(TAG + "testBeginsWithErr0003 success");
            } catch (err) {
                console.info(TAG + "testBeginsWithErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBeginsWithErr0003 end *************");
        })

        /**
         * @tc.name   testBeginsWithErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_BeginsWithErrTest_0400
         * @tc.desc   predicates beginsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBeginsWithErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBeginsWithErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.beginsWith("stringValue", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBeginsWithErr0004 success");
            } catch (err) {
                console.info(TAG + "testBeginsWithErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBeginsWithErr0004 end *************");
        })

        /**
         * @tc.name   testBeginsWithErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_BeginsWithErrTest_0500
         * @tc.desc   predicates beginsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBeginsWithErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBeginsWithErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.beginsWith("stringValue", null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testBeginsWithErr0005 success");
            } catch (err) {
                console.info(TAG + "testBeginsWithErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBeginsWithErr0005 end *************");
        })

        /**
         * @tc.name   testBeginsWithErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_BeginsWithErrTest_0600
         * @tc.desc   predicates beginsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBeginsWithErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBeginsWithErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.beginsWith("stringValue", undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testBeginsWithErr0006 success");
            } catch (err) {
                console.info(TAG + "testBeginsWithErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBeginsWithErr0006 end *************");
        })

        /**
         * @tc.name   testEndsWithErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_EndsWithErrTest_0100
         * @tc.desc   predicates EndsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testEndsWithErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testEndsWithErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.endsWith("", "ABC");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testEndsWithErr0001 success");
            } catch (err) {
                console.info(TAG + "testEndsWithErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEndsWithErr0001 end *************");
        })

        /**
         * @tc.name   testEndsWithErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_EndsWithErrTest_0200
         * @tc.desc   predicates endsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testEndsWithErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testEndsWithErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.endsWith(null, "ABC");
                expect(predicates).assertUndefined();
                console.info(TAG + "testEndsWithErr0002 success");
            } catch (err) {
                console.info(TAG + "testEndsWithErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEndsWithErr0002 end *************");
        })

        /**
         * @tc.name   testEndsWithErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_EndsWithErrTest_0300
         * @tc.desc   predicates endsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testEndsWithErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testEndsWithErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.endsWith(undefined, "ABC");
                expect(predicates).assertUndefined();
                console.info(TAG + "testEndsWithErr0003 success");
            } catch (err) {
                console.info(TAG + "testEndsWithErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEndsWithErr0003 end *************");
        })

        /**
         * @tc.name   testEndsWithErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_EndsWithErrTest_0400
         * @tc.desc   predicates EndsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testEndsWithErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testEndsWithErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.endsWith("stringValue", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testEndsWithErr0004 success");
            } catch (err) {
                console.info(TAG + "testEndsWithErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEndsWithErr0004 end *************");
        })

        /**
         * @tc.name   testEndsWithErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_EndsWithErrTest_0500
         * @tc.desc   predicates endsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testEndsWithErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testEndsWithErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.endsWith("stringValue", null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testEndsWithErr0005 success");
            } catch (err) {
                console.info(TAG + "testEndsWithErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEndsWithErr0005 end *************");
        })

        /**
         * @tc.name   testEndsWithErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_EndsWithErrTest_0600
         * @tc.desc   predicates endsWith normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testEndsWithErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testEndsWithErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.endsWith("stringValue", undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testEndsWithErr0006 success");
            } catch (err) {
                console.info(TAG + "testEndsWithErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testEndsWithErr0006 end *************");
        })

        /**
         * @tc.name   testIsNullErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_IsNullErrTest_0100
         * @tc.desc   resultSet isNull normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testIsNullErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testIsNullErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.isNull("");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testIsNullErr0001 success");
            } catch (err) {
                console.info(TAG + "testIsNullErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testIsNullErr0001 end *************");
        })

        /**
         * @tc.name   testIsNullErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_IsNullErrTest_0200
         * @tc.desc   resultSet isNull normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testIsNullErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testIsNullErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.isNull(null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testIsNullErr0002 success");
            } catch (err) {
                console.info(TAG + "testIsNullErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testIsNullErr0002 end *************");
        })

        /**
         * @tc.name   testIsNullErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_IsNullErrTest_0300
         * @tc.desc   resultSet isNull normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testIsNullErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testIsNullErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.isNull(undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testIsNullErr0003 success");
            } catch (err) {
                console.info(TAG + "testIsNullErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testIsNullErr0003 end *************");
        })

        /**
         * @tc.name   testIsNotNullErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_IsNotNullErrTest_0100
         * @tc.desc   resultSet isNotNull normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testIsNotNullErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testIsNotNullErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.isNotNull("");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testIsNotNullErr0001 success");
            } catch (err) {
                console.info(TAG + "testIsNotNullErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testIsNotNullErr0001 end *************");
        })

        /**
         * @tc.name   testIsNotNullErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_IsNotNullErrTest_0200
         * @tc.desc   resultSet isNotNull normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testIsNotNullErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testIsNotNullErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.isNotNull(null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testIsNotNullErr0002 success");
            } catch (err) {
                console.info(TAG + "testIsNotNullErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testIsNotNullErr0002 end *************");
        })

        /**
         * @tc.name   testIsNotNullErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_IsNotNullErrTest_0300
         * @tc.desc   resultSet isNotNull normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testIsNotNullErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testIsNotNullErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.isNotNull(undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testIsNotNullErr0003 success");
            } catch (err) {
                console.info(TAG + "testIsNotNullErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testIsNotNullErr0003 end *************");
        })

        /**
         * @tc.name   testLikeErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_LikeErrTest_0100
         * @tc.desc   predicates like normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLikeErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLikeErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("", "%LMN%");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testLikeErr0001 success");
            } catch (err) {
                console.info(TAG + "testLikeErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLikeErr0001 end *************");
        })

        /**
         * @tc.name   testLikeErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_LikeErrTest_0200
         * @tc.desc   predicates like normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLikeErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLikeErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like(null, "%LMN%");
                expect(predicates).assertUndefined();
                console.info(TAG + "testLikeErr0002 success");
            } catch (err) {
                console.info(TAG + "testLikeErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLikeErr0002 end *************");
        })

        /**
         * @tc.name   testLikeErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_LikeErrTest_0300
         * @tc.desc   predicates like normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLikeErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLikeErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like(undefined, "%LMN%");
                expect(predicates).assertUndefined();
                console.info(TAG + "testLikeErr0003 success");
            } catch (err) {
                console.info(TAG + "testLikeErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLikeErr0003 end *************");
        })

        /**
         * @tc.name   testLikeErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_LikeErrTest_0400
         * @tc.desc   predicates like normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLikeErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLikeErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testLikeErr0004 success");
            } catch (err) {
                console.info(TAG + "testLikeErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLikeErr0004 end *************");
        })

        /**
         * @tc.name   testLikeErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_LikeErrTest_0500
         * @tc.desc   predicates like normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLikeErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLikeErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testLikeErr0005 success");
            } catch (err) {
                console.info(TAG + "testLikeErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLikeErr0005 end *************");
        })

        /**
         * @tc.name   testLikeErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_LikeErrTest_0600
         * @tc.desc   predicates like normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLikeErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLikeErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testLikeErr0006 success");
            } catch (err) {
                console.info(TAG + "testLikeErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLikeErr0006 end *************");
        })

        /**
         * @tc.name   testGlobErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_GlobErrTest_0100
         * @tc.desc   end with ? by glob.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGlobErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGlobErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.glob("", "ABC*");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGlobErr0001 success");
            } catch (err) {
                console.info(TAG + "testGlobErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGlobErr0001 end *************");
        })

        /**
         * @tc.name   testGlobErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_GlobErrTest_0200
         * @tc.desc   end with ? by glob.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGlobErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGlobErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.glob(null, "ABC*");
                expect(predicates).assertUndefined();
                console.info(TAG + "testGlobErr0002 success");
            } catch (err) {
                console.info(TAG + "testGlobErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGlobErr0002 end *************");
        })

        /**
         * @tc.name   testGlobErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_GlobErrTest_0300
         * @tc.desc   end with ? by glob.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGlobErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGlobErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.glob(undefined, "ABC*");
                expect(predicates).assertUndefined();
                console.info(TAG + "testGlobErr0003 success");
            } catch (err) {
                console.info(TAG + "testGlobErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGlobErr0003 end *************");
        })

        /**
         * @tc.name   testGlobErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_GlobErrTest_0400
         * @tc.desc   end with ? by glob.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGlobErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGlobErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.glob("stringValue", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGlobErr0004 success");
            } catch (err) {
                console.info(TAG + "testGlobErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGlobErr0004 end *************");
        })

        /**
         * @tc.name   testGlobErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_GlobErrTest_0500
         * @tc.desc   end with ? by glob.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGlobErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGlobErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.glob("stringValue", null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testGlobErr0005 success");
            } catch (err) {
                console.info(TAG + "testGlobErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGlobErr0005 end *************");
        })

        /**
         * @tc.name   testGlobErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_GlobErrTest_0600
         * @tc.desc   end with ? by glob.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGlobErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGlobErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.glob("stringValue", undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testGlobErr0006 success");
            } catch (err) {
                console.info(TAG + "testGlobErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGlobErr0006 end *************");
        })

        /**
         * @tc.name   testBetweenErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_BetweenErrTest_0100
         * @tc.desc   predicates between normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBetweenErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBetweenErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.between("", "ABB", "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBetweenErr0001 success");
            } catch (err) {
                console.info(TAG + "testBetweenErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBetweenErr0001 end *************");
        })

        /**
         * @tc.name   testBetweenErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_BetweenErrTest_0200
         * @tc.desc   predicates between normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBetweenErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBetweenErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.between(null, "ABB", "ABD");
                expect(predicates).assertUndefined();
                console.info(TAG + "testBetweenErr0002 success");
            } catch (err) {
                console.info(TAG + "testBetweenErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBetweenErr0002 end *************");
        })

        /**
         * @tc.name   testBetweenErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_BetweenErrTest_0300
         * @tc.desc   predicates between normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBetweenErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBetweenErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.between(undefined, "ABB", "ABD");
                expect(predicates).assertUndefined();
                console.info(TAG + "testBetweenErr0003 success");
            } catch (err) {
                console.info(TAG + "testBetweenErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBetweenErr0003 end *************");
        })

        /**
         * @tc.name   testBetweenErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_BetweenErrTest_0400
         * @tc.desc   predicates between normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBetweenErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBetweenErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.between("stringValue", "", "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBetweenErr0004 success");
            } catch (err) {
                console.info(TAG + "testBetweenErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBetweenErr0004 end *************");
        })

        /**
         * @tc.name   testBetweenErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_BetweenErrTest_0500
         * @tc.desc   predicates between normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBetweenErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBetweenErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.between("stringValue", null, "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBetweenErr0005 success");
            } catch (err) {
                console.info(TAG + "testBetweenErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBetweenErr0005 end *************");
        })

        /**
         * @tc.name   testBetweenErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_BetweenErrTest_0600
         * @tc.desc   predicates between normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBetweenErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBetweenErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.between("stringValue", undefined, "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBetweenErr0006 success");
            } catch (err) {
                console.info(TAG + "testBetweenErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBetweenErr0006 end *************");
        })

        /**
         * @tc.name   testBetweenErr0007
         * @tc.number SUB_DistributedData_DataAbility_SDK_BetweenErrTest_0700
         * @tc.desc   predicates between normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBetweenErr0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBetweenErr0007 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.between("stringValue", "ABB", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBetweenErr0007 success");
            } catch (err) {
                console.info(TAG + "testBetweenErr0007 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBetweenErr0007 end *************");
        })

        /**
         * @tc.name   testBetweenErr0008
         * @tc.number SUB_DistributedData_DataAbility_SDK_BetweenErrTest_0800
         * @tc.desc   predicates between normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBetweenErr0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBetweenErr0008 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.between("stringValue", "ABB", null);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBetweenErr0008 success");
            } catch (err) {
                console.info(TAG + "testBetweenErr0008 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBetweenErr0008 end *************");
        })

        /**
         * @tc.name   testBetweenErr0009
         * @tc.number SUB_DistributedData_DataAbility_SDK_BetweenErrTest_0900
         * @tc.desc   predicates between normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testBetweenErr0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testBetweenErr0009 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.between("stringValue", "ABB", undefined);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testBetweenErr0009 success");
            } catch (err) {
                console.info(TAG + "testBetweenErr0009 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testBetweenErr0009 end *************");
        })

        /**
         * @tc.name   testNotBetweenErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotBetweenErrTest_0100
         * @tc.desc   test string value with notBetween.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotBetweenErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotBetweenErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notBetween("", "ABB", "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testNotBetweenErr0001 success");
            } catch (err) {
                console.info(TAG + "testNotBetweenErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotBetweenErr0001 end *************");
        })

        /**
         * @tc.name   testNotBetweenErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotBetweenErrTest_0200
         * @tc.desc   test string value with notBetween.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotBetweenErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotBetweenErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notBetween(null, "ABB", "ABD");
                expect(predicates).assertUndefined();
                console.info(TAG + "testNotBetweenErr0002 success");
            } catch (err) {
                console.info(TAG + "testNotBetweenErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotBetweenErr0002 end *************");
        })

        /**
         * @tc.name   testNotBetweenErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotBetweenErrTest_0300
         * @tc.desc   test string value with notBetween.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotBetweenErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotBetweenErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notBetween(undefined, "ABB", "ABD");
                expect(predicates).assertUndefined();
                console.info(TAG + "testNotBetweenErr0003 success");
            } catch (err) {
                console.info(TAG + "testNotBetweenErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotBetweenErr0003 end *************");
        })

        /**
         * @tc.name   testNotBetweenErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotBetweenErrTest_0400
         * @tc.desc   test string value with notBetween.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotBetweenErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotBetweenErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notBetween("stringValue", "", "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testNotBetweenErr0004 success");
            } catch (err) {
                console.info(TAG + "testNotBetweenErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotBetweenErr0004 end *************");
        })

        /**
         * @tc.name   testNotBetweenErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotBetweenErrTest_0500
         * @tc.desc   test string value with notBetween.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotBetweenErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotBetweenErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notBetween("stringValue", null, "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testNotBetweenErr0005 success");
            } catch (err) {
                console.info(TAG + "testNotBetweenErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotBetweenErr0005 end *************");
        })

        /**
         * @tc.name   testNotBetweenErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotBetweenErrTest_0600
         * @tc.desc   test string value with notBetween.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotBetweenErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotBetweenErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notBetween("stringValue", undefined, "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testNotBetweenErr0006 success");
            } catch (err) {
                console.info(TAG + "testNotBetweenErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotBetweenErr0006 end *************");
        })

        /**
         * @tc.name   testNotBetweenErr0007
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotBetweenErrTest_0700
         * @tc.desc   test string value with notBetween.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotBetweenErr0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotBetweenErr0007 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notBetween("stringValue", "ABB", "")
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testNotBetweenErr0007 success");
            } catch (err) {
                console.info(TAG + "testNotBetweenErr0007 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotBetweenErr0007 end *************");
        })

        /**
         * @tc.name   testNotBetweenErr0008
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotBetweenErrTest_0800
         * @tc.desc   test string value with notBetween.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotBetweenErr0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotBetweenErr0008 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notBetween("stringValue", "ABB", null)
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testNotBetweenErr0008 success");
            } catch (err) {
                console.info(TAG + "testNotBetweenErr0008 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotBetweenErr0008 end *************");
        })

        /**
         * @tc.name   testNotBetweenErr0009
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotBetweenErrTest_0900
         * @tc.desc   test string value with notBetween.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotBetweenErr0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotBetweenErr0009 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notBetween("stringValue", "ABB", undefined)
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testNotBetweenErr0009 success");
            } catch (err) {
                console.info(TAG + "testNotBetweenErr0009 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotBetweenErr0009 end *************");
        })

        /**
         * @tc.name   testGreaterThanErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanErrTest_0100
         * @tc.desc   predicates greaterThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThan("", "ABC");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGreaterThanErr0001 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanErr0001 end *************");
        })

        /**
         * @tc.name   testGreaterThanErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanErrTest_0200
         * @tc.desc   predicates greaterThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThan(null, "ABC");
                expect(predicates).assertUndefined();
                console.info(TAG + "testGreaterThanErr0002 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanErr0002 end *************");
        })

        /**
         * @tc.name   testGreaterThanErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanErrTest_0300
         * @tc.desc   predicates greaterThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThan(undefined, "ABC");
                expect(predicates).assertUndefined();
                console.info(TAG + "testGreaterThanErr0003 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanErr0003 end *************");
        })

        /**
         * @tc.name   testGreaterThanErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanErrTest_0400
         * @tc.desc   predicates greaterThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThan("stringValue", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGreaterThanErr0004 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanErr0004 end *************");
        })

        /**
         * @tc.name   testGreaterThanErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanErrTest_0500
         * @tc.desc   predicates greaterThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThan("stringValue", null);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGreaterThanErr0005 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanErr0005 end *************");
        })

        /**
         * @tc.name   testGreaterThanErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanErrTest_0600
         * @tc.desc   predicates greaterThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThan("stringValue", undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testGreaterThanErr0006 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanErr0006 end *************");
        })

        /**
         * @tc.name   testLessThanErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanErrTest_0100
         * @tc.desc   predicates lessThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThan("", "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testLessThanErr0001 success");
            } catch (err) {
                console.info(TAG + "testLessThanErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanErr0001 end *************");
        })

        /**
         * @tc.name   testLessThanErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanErrTest_0200
         * @tc.desc   predicates lessThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThan(null, "ABD");
                expect(predicates).assertUndefined();
                console.info(TAG + "testLessThanErr0002 success");
            } catch (err) {
                console.info(TAG + "testLessThanErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanErr0002 end *************");
        })

        /**
         * @tc.name   testLessThanErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanErrTest_0300
         * @tc.desc   predicates lessThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThan(undefined, "ABD");
                expect(predicates).assertUndefined();
                console.info(TAG + "testLessThanErr0003 success");
            } catch (err) {
                console.info(TAG + "testLessThanErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanErr0003 end *************");
        })

        /**
         * @tc.name   testLessThanErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanErrTest_0400
         * @tc.desc   predicates lessThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThan("stringValue", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testLessThanErr0004 success");
            } catch (err) {
                console.info(TAG + "testLessThanErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanErr0004 end *************");
        })

        /**
         * @tc.name   testLessThanErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanErrTest_0500
         * @tc.desc   predicates lessThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThan("stringValue", null);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testLessThanErr0005 success");
            } catch (err) {
                console.info(TAG + "testLessThanErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanErr0005 end *************");
        })

        /**
         * @tc.name   testLessThanErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanErrTest_0600
         * @tc.desc   predicates lessThan normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThan("stringValue", undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testLessThanErr0006 success");
            } catch (err) {
                console.info(TAG + "testLessThanErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanErr0006 end *************");
        })

        /**
         * @tc.name   testGreaterThanOrEqualToErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanOrEqualToErrTest_0100
         * @tc.desc   predicates greaterThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanOrEqualToErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanOrEqualToErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThanOrEqualTo("", "ABC");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGreaterThanOrEqualToErr0001 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanOrEqualToErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanOrEqualToErr0001 end *************");
        })

        /**
         * @tc.name   testGreaterThanOrEqualToErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanOrEqualToErrTest_0200
         * @tc.desc   predicates greaterThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanOrEqualToErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanOrEqualToErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThanOrEqualTo(null, "ABC");
                expect(predicates).assertUndefined();
                console.info(TAG + "testGreaterThanOrEqualToErr0002 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanOrEqualToErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanOrEqualToErr0002 end *************");
        })

        /**
         * @tc.name   testGreaterThanOrEqualToErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanOrEqualToErrTest_0300
         * @tc.desc   predicates greaterThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanOrEqualToErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanOrEqualToErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThanOrEqualTo(undefined, "ABC");
                expect(predicates).assertUndefined();
                console.info(TAG + "testGreaterThanOrEqualToErr0003 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanOrEqualToErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanOrEqualToErr0003 end *************");
        })

        /**
         * @tc.name   testGreaterThanOrEqualToErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanOrEqualToErrTest_0400
         * @tc.desc   predicates greaterThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanOrEqualToErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanOrEqualToErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThanOrEqualTo("stringValue", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGreaterThanOrEqualToErr0004 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanOrEqualToErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanOrEqualToErr0004 end *************");
        })

        /**
         * @tc.name   testGreaterThanOrEqualToErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanOrEqualToErrTest_0500
         * @tc.desc   predicates greaterThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanOrEqualToErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanOrEqualToErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThanOrEqualTo("stringValue", null);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGreaterThanOrEqualToErr0005 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanOrEqualToErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanOrEqualToErr0005 end *************");
        })

        /**
         * @tc.name   testGreaterThanOrEqualToErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_GreaterThanOrEqualToErrTest_0600
         * @tc.desc   predicates greaterThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGreaterThanOrEqualToErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGreaterThanOrEqualToErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.greaterThanOrEqualTo("stringValue", undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testGreaterThanOrEqualToErr0006 success");
            } catch (err) {
                console.info(TAG + "testGreaterThanOrEqualToErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGreaterThanOrEqualToErr0006 end *************");
        })

        /**
         * @tc.name   testLessThanOrEqualToErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanOrEqualToErrTest_0100
         * @tc.desc   predicates lessThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanOrEqualToErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanOrEqualToErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThanOrEqualTo("", "ABD");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testLessThanOrEqualToErr0001 success");
            } catch (err) {
                console.info(TAG + "testLessThanOrEqualToErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanOrEqualToErr0001 end *************");
        })

        /**
         * @tc.name   testLessThanOrEqualToErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanOrEqualToErrTest_0200
         * @tc.desc   predicates lessThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanOrEqualToErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanOrEqualToErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThanOrEqualTo(null, "ABD");
                expect(predicates).assertUndefined();
                console.info(TAG + "testLessThanOrEqualToErr0002 success");
            } catch (err) {
                console.info(TAG + "testLessThanOrEqualToErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanOrEqualToErr0002 end *************");
        })

        /**
         * @tc.name   testLessThanOrEqualToErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanOrEqualToErrTest_0300
         * @tc.desc   predicates lessThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanOrEqualToErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanOrEqualToErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThanOrEqualTo(undefined, "ABD");
                expect(predicates).assertUndefined();
                console.info(TAG + "testLessThanOrEqualToErr0003 success");
            } catch (err) {
                console.info(TAG + "testLessThanOrEqualToErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanOrEqualToErr0003 end *************");
        })

        /**
         * @tc.name   testLessThanOrEqualToErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanOrEqualToErrTest_0400
         * @tc.desc   predicates lessThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanOrEqualToErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanOrEqualToErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThanOrEqualTo("stringValue", "");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testLessThanOrEqualToErr0004 success");
            } catch (err) {
                console.info(TAG + "testLessThanOrEqualToErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanOrEqualToErr0004 end *************");
        })

        /**
         * @tc.name   testLessThanOrEqualToErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanOrEqualToErrTest_0500
         * @tc.desc   predicates lessThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanOrEqualToErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanOrEqualToErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThanOrEqualTo("stringValue", null);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testLessThanOrEqualToErr0005 success");
            } catch (err) {
                console.info(TAG + "testLessThanOrEqualToErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanOrEqualToErr0005 end *************");
        })

        /**
         * @tc.name   testLessThanOrEqualToErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_LessThanOrEqualToErrTest_0600
         * @tc.desc   predicates lessThanOrEqualTo normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLessThanOrEqualToErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLessThanOrEqualToErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.lessThanOrEqualTo("stringValue", undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testLessThanOrEqualToErr0006 success");
            } catch (err) {
                console.info(TAG + "testLessThanOrEqualToErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLessThanOrEqualToErr0006 end *************");
        })

        /**
         * @tc.name   testOrderByAscErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_OrderByAscErrTest_0100
         * @tc.desc   predicates order normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOrderByAscErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testOrderByAscErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.orderByAsc("")
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testOrderByAscErr0001 success");
            } catch (err) {
                console.info(TAG + "testOrderByAscErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testOrderByAscErr0001 end *************");
        })

        /**
         * @tc.name   testOrderByAscErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_OrderByAscErrTest_0200
         * @tc.desc   predicates order normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOrderByAscErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testOrderByAscErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.orderByAsc(null)
                expect(predicates).assertUndefined();
                console.info(TAG + "testOrderByAscErr0002 success");
            } catch (err) {
                console.info(TAG + "testOrderByAscErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testOrderByAscErr0002 end *************");
        })

        /**
         * @tc.name   testOrderByAscErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_OrderByAscErrTest_0300
         * @tc.desc   predicates order normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOrderByAscErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testOrderByAscErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.orderByAsc(undefined)
                expect(predicates).assertUndefined();
                console.info(TAG + "testOrderByAscErr0003 success");
            } catch (err) {
                console.info(TAG + "testOrderByAscErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testOrderByAscErr0003 end *************");
        })

        /**
         * @tc.name   testOrderByDescErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_OrderByDescErrTest_0100
         * @tc.desc   predicates order normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOrderByDescErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testOrderByDescErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.orderByDesc("")
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testOrderByDescErr0001 success");
            } catch (err) {
                console.info(TAG + "testOrderByDescErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testOrderByDescErr0001 end *************");
        })

        /**
         * @tc.name   testOrderByDescErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_OrderByDescErrTest_0200
         * @tc.desc   predicates order normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOrderByDescErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testOrderByDescErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.orderByDesc(null)
                expect(predicates).assertUndefined();
                console.info(TAG + "testOrderByDescErr0002 success");
            } catch (err) {
                console.info(TAG + "testOrderByDescErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testOrderByDescErr0002 end *************");
        })

        /**
         * @tc.name   testOrderByDescErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_OrderByDescErrTest_0300
         * @tc.desc   predicates order normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOrderByDescErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testOrderByDescErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.orderByDesc(undefined)
                expect(predicates).assertUndefined();
                console.info(TAG + "testOrderByDescErr0003 success");
            } catch (err) {
                console.info(TAG + "testOrderByDescErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testOrderByDescErr0003 end *************");
        })

        /**
         * @tc.name   testDistinctErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_DistinctErrTest_0100
         * @tc.desc   predicates order normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testDistinctErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testDistinctErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.equalTo("stringValue", "ABCDEFGHIJKLMN").orderByAsc("integerValue").distinct();
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testDistinctErr0001 success");
            } catch (err) {
                console.info(TAG + "testDistinctErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testDistinctErr0001 end *************");
        })

        /**
         * @tc.name   testLimitAsErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_LimitAsErrTest_0100
         * @tc.desc   predicates limit normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLimitAsErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLimitAsErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.limitAs(null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testDistinctErr0001 success");
            } catch (err) {
                console.info(TAG + "testDistinctErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLimitAsErr0001 end *************");
        })

        /**
         * @tc.name   testLimitAsErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_LimitAsErrTest_0200
         * @tc.desc   predicates limit normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testLimitAsErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testLimitAsErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.limitAs(undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testLimitAsErr0002 success");
            } catch (err) {
                console.info(TAG + "testLimitAsErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testLimitAsErr0002 end *************");
        })

        /**
         * @tc.name   testOffsetAsErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_OffsetAsErrTest_0100
         * @tc.desc   predicates offset normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOffsetAsErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testOffsetAsErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.offsetAs(null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testOffsetAsErr0001 success");
            } catch (err) {
                console.info(TAG + "testOffsetAsErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testOffsetAsErr0001 end *************");
        })

        /**
         * @tc.name   testOffsetAsErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_OffsetAsErrTest_0200
         * @tc.desc   predicates offset normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testOffsetAsErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testOffsetAsErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.offsetAs(undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testOffsetAsErr0002 success");
            } catch (err) {
                console.info(TAG + "testOffsetAsErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testOffsetAsErr0002 end *************");
        })

        /**
         * @tc.name   testGroupByErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_GroupByErrTest_0100
         * @tc.desc   predicates groupBy test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGroupByErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGroupByErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.groupBy([]);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGroupByErr0001 success");
            } catch (err) {
                console.info(TAG + "testGroupByErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGroupByErr0001 end *************");
        })

        /**
         * @tc.name   testGroupByErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_GroupByErrTest_0200
         * @tc.desc   predicates groupBy test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGroupByErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGroupByErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.groupBy(null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testGroupByErr0002 success");
            } catch (err) {
                console.info(TAG + "testGroupByErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGroupByErr0002 end *************");
        })

        /**
         * @tc.name   testGroupByErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_GroupByErrTest_0300
         * @tc.desc   predicates groupBy test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testGroupByErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testGroupByErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.groupBy(undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testGroupByErr0003 success");
            } catch (err) {
                console.info(TAG + "testGroupByErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testGroupByErr0003 end *************");
        })

        /**
         * @tc.name   testIndexedByErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_IndexedByErrTest_0100
         * @tc.desc   predicates indexedBy test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testIndexedByErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testIndexedByErr0001 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.indexedBy("");
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testGroupByErr0001 success");
            } catch (err) {
                console.info(TAG + "testGroupByErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testIndexedByErr0001 end *************");
        })

        /**
         * @tc.name   testIndexedByErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_IndexedByErrTest_0200
         * @tc.desc   predicates indexedBy test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testIndexedByErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testIndexedByErr0002 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.indexedBy(null);
                expect(predicates).assertUndefined();
                console.info(TAG + "testIndexedByErr0002 success");
            } catch (err) {
                console.info(TAG + "testIndexedByErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testIndexedByErr0002 end *************");
        })

        /**
         * @tc.name   testIndexedByErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_IndexedByErrTest_0300
         * @tc.desc   predicates indexedBy test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testIndexedByErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testIndexedByErr0003 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.like("stringValue", "ABCDEFGHIJKLMN")
                predicates = dataAbilityPredicates.indexedBy(undefined);
                expect(predicates).assertUndefined();
                console.info(TAG + "testIndexedByErr0003 success");
            } catch (err) {
                console.info(TAG + "testIndexedByErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testIndexedByErr0003 end *************");
        })

        /**
         * @tc.name   testInErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_InErrTest_0100
         * @tc.desc   predicates in normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testInErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testInErr0001 start *************");
            try {
                let values = [Number.MIN_VALUE.toString()];
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.in("", values);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testInErr0001 success");
            } catch (err) {
                console.info(TAG + "testInErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testInErr0001 end *************");
        })

        /**
         * @tc.name   testInErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_InErrTest_0200
         * @tc.desc   predicates in normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testInErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testInErr0001 start *************");
            try {
                let values = [Number.MIN_VALUE.toString()];
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.in(null, values);
                expect(predicates).assertUndefined();
                console.info(TAG + "testInErr0002 success");
            } catch (err) {
                console.info(TAG + "testInErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testInErr0002 end *************");
        })

        /**
         * @tc.name   testInErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_InErrTest_0300
         * @tc.desc   predicates in normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testInErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testInErr0001 start *************");
            try {
                let values = [Number.MIN_VALUE.toString()];
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.in(null, values);
                expect(predicates).assertUndefined();
                console.info(TAG + "testInErr0003 success");
            } catch (err) {
                console.info(TAG + "testInErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testInErr0003 end *************");
        })

        /**
         * @tc.name   testInErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_InErrTest_0400
         * @tc.desc   predicates in normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testInErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testInErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.in("doubleValue", []);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testInErr0004 success");
            } catch (err) {
                console.info(TAG + "testInErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testInErr0004 end *************");
        })

        /**
         * @tc.name   testInErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_InErrTest_0500
         * @tc.desc   predicates in normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testInErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testInErr0005 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.in("doubleValue", null);
                console.info(TAG + "testInErr0005 success");
                expect().assertFail();
            } catch (err) {
                console.info(TAG + "testInErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);

                let errmsg = "failed: Invalid values";
                expect(err.message).assertContain(errmsg);
            }
            console.info(TAG + "************* testInErr0005 end *************");
        })

        /**
         * @tc.name   testInErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_InErrTest_0600
         * @tc.desc   predicates in normal test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testInErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testInErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.in("doubleValue", undefined);
                console.info(TAG + "testInErr0006 success");
                expect().assertFail();
            } catch (err) {
                console.info(TAG + "testInErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                let errmsg = "failed: Invalid values";
                expect(err.message).assertContain(errmsg);
            }
            console.info(TAG + "************* testInErr0006 end *************");
        })

        /**
         * @tc.name   testNotInErr0001
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotInErrTest_0100
         * @tc.desc   the common and min value test with notin.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotInErr0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotInErr0001 start *************");
            try {
                let values = [1, -2147483648];
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notIn("", values);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testNotInErr0001 success");
            } catch (err) {
                console.info(TAG + "testNotInErr0001 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotInErr0001 end *************");
        })

        /**
         * @tc.name   testNotInErr0002
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotInErrTest_0200
         * @tc.desc   the common and min value test with notin.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotInErr0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotInErr0002 start *************");
            try {
                let values = [1, -2147483648];
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notIn(null, values);
                expect(predicates).assertUndefined();
                console.info(TAG + "testNotInErr0002 success");
            } catch (err) {
                console.info(TAG + "testNotInErr0002 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotInErr0002 end *************");
        })

        /**
         * @tc.name   testNotInErr0003
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotInErrTest_0300
         * @tc.desc   the common and min value test with notin.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotInErr0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotInErr0003 start *************");
            try {
                let values = [1, -2147483648];
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notIn(undefined, values);
                expect(predicates).assertUndefined();
                console.info(TAG + "testNotInErr0003 success");
            } catch (err) {
                console.info(TAG + "testNotInErr0003 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotInErr0003 end *************");
        })

        /**
         * @tc.name   testNotInErr0004
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotInErrTest_0400
         * @tc.desc   the common and min value test with notin.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotInErr0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotInErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notIn("integerValue", []);
                expect(predicates).assertInstanceOf("Object");
                console.info(TAG + "testNotInErr0004 success");
            } catch (err) {
                console.info(TAG + "testNotInErr0004 error,err.code:" + err.code + ",err.msg:" + err.message);
                expect().assertFail();
            }
            console.info(TAG + "************* testNotInErr0004 end *************");
        })

        /**
         * @tc.name   testNotInErr0005
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotInErrTest_0500
         * @tc.desc   the common and min value test with notin.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotInErr0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotInErr0004 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notIn("integerValue", null);
                console.info(TAG + "testNotInErr0005 success");
                expect().assertFail();
            } catch (err) {
                console.info(TAG + "testNotInErr0005 error,err.code:" + err.code + ",err.msg:" + err.message);
                let errmsg = "failed: Invalid values";
                expect(err.message).assertContain(errmsg);
            }
            console.info(TAG + "************* testNotInErr0005 end *************");
        })

        /**
         * @tc.name   testNotInErr0006
         * @tc.number SUB_DistributedData_DataAbility_SDK_NotInErrTest_0600
         * @tc.desc   the common and min value test with notin.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('testNotInErr0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            console.info(TAG + "************* testNotInErr0006 start *************");
            try {
                let dataAbilityPredicates = new dataAbility.DataAbilityPredicates();
                let predicates = dataAbilityPredicates.notIn("integerValue", undefined);
                console.info(TAG + "testNotInErr0006 success");
                expect().assertFail();
            } catch (err) {
                console.info(TAG + "testNotInErr0006 error,err.code:" + err.code + ",err.msg:" + err.message);
                let errmsg = "failed: Invalid values";
                expect(err.message).assertContain(errmsg);
            }
            console.info(TAG + "************* testNotInErr0006 end *************");
        })

        console.info(TAG + "*************Unit Test End*************");
    })
}
